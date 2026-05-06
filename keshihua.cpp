#include "Lexical.h"

using namespace std;

// 绘制输入框和已输入的文字
void Interface::drawInputBox() {
    // 清除窗口
    cleardevice();

    // 设置白色背景
    setbkcolor(WHITE);
    cleardevice();

    // 绘制主输入框
    setfillcolor(WHITE);
    setlinecolor(BLACK);
    fillrectangle(20, 20, 780, 580);
    rectangle(20, 20, 780, 580);

    // 绘制退出按钮
    setfillcolor(WHITE);
    fillrectangle(25, 25, 125, 55);
    settextstyle(20, 0, "微软雅黑");
    settextcolor(BLACK);
    outtextxy(45, 35, "退出");

    // 绘制编译按钮
    setfillcolor(WHITE);
    fillrectangle(135, 25, 235, 55);
    settextstyle(20, 0, "微软雅黑");
    settextcolor(BLACK);
    outtextxy(155, 35, "编译");

    // 绘制词法分析按钮
    setfillcolor(WHITE);
    fillrectangle(245, 25, 345, 55);
    settextstyle(20, 0, "微软雅黑");
    settextcolor(BLACK);
    outtextxy(255, 35, "词法分析");

    // 绘制语法分析按钮
    setfillcolor(WHITE);
    fillrectangle(355, 25, 455, 55);
    settextstyle(20, 0, "微软雅黑");
    settextcolor(BLACK);
    outtextxy(365, 35, "语法分析");

    // 绘制四元式生成按钮
    setfillcolor(WHITE);
    fillrectangle(465, 25, 565, 55);
    settextstyle(20, 0, "微软雅黑");
    settextcolor(BLACK);
    outtextxy(475, 35, "四元式");

    // 绘制目标代码生成按钮
    setfillcolor(WHITE);
    fillrectangle(575, 25, 675, 55);
    settextstyle(20, 0, "微软雅黑");
    settextcolor(BLACK);
    outtextxy(585, 35, "目标代码");

    // 绘制文字和滚动条的容器框
    setfillcolor(WHITE);
    setlinecolor(BLACK);
    fillrectangle(30, 80, 770, 560);
    rectangle(30, 80, 770, 560);

    // 绘制已输入的文字（支持多行和滚动）
    settextstyle(20, 0, "微软雅黑");
    settextcolor(BLACK);
    int y = 85;  // 稍微调整起始位置，留出边距
    int startLine = max(0, scrollOffset);
    int endLine = min((int)userInput.size(), startLine + VISIBLE_LINES);

    for (int i = startLine; i < endLine; i++) {
        outtextxy(35, y, userInput[i].c_str());
        y += 30;  // 行间距
    }

    // 绘制滚动条
    if (userInput.size() > VISIBLE_LINES) {
        setfillcolor(LIGHTGRAY);
        fillrectangle(750, 85, 765, 555);  // 调整滚动条位置，确保在框内
        // 计算滚动条位置和大小
        float scrollRatio = (float)scrollOffset / (userInput.size() - VISIBLE_LINES);
        int scrollBarHeight = min(30, (int)((float)(555 - 85) * VISIBLE_LINES / userInput.size()));
        int scrollBarY = 85 + scrollRatio * (555 - 85 - scrollBarHeight);
        setfillcolor(DARKGRAY);
        fillrectangle(750, scrollBarY, 765, scrollBarY + scrollBarHeight);
    }

    // 绘制光标
    if (userInput.empty()) {
        setlinecolor(BLACK);
        line(35, 85, 35, 105);
    }
    else {
        int cursorX = 35 + textwidth(userInput[currentLine].c_str());
        int cursorY = 85 + (currentLine - scrollOffset) * 30;
        if (cursorY >= 85 && cursorY <= 555) {  // 只在可见区域内显示光标
            setlinecolor(BLACK);
            line(cursorX, cursorY, cursorX, cursorY + 20);
        }
    }
}

// 处理鼠标点击
bool Interface::handleMouseClick() {
    if (MouseHit()) {
        MOUSEMSG msg = GetMouseMsg();
        if (msg.uMsg == WM_LBUTTONDOWN) {
            // 检查是否点击退出按钮
            if (msg.x >= 25 && msg.x <= 125 && msg.y >= 25 && msg.y <= 55) {
                return true;
            }
            // 检查是否点击编译按钮
            if (msg.x >= 135 && msg.x <= 235 && msg.y >= 25 && msg.y <= 55) {
                saveContent();
                // 显示编译成功提示
                settextstyle(20, 0, "微软雅黑");
                settextcolor(BLACK);
                outtextxy(685, 35, "已编译");
                Sleep(1000);  // 显示1秒
                drawInputBox();  // 重新绘制界面
            }
            // 检查是否点击词法分析按钮
            if (msg.x >= 245 && msg.x <= 345 && msg.y >= 25 && msg.y <= 55) {
                lexicalAnalysis();
                drawInputBox();
            }
            // 检查是否点击语法分析按钮
            if (msg.x >= 355 && msg.x <= 455 && msg.y >= 25 && msg.y <= 55) {
                syntaxAnalysis();
                drawInputBox();
            }
            // 检查是否点击四元式生成按钮
            if (msg.x >= 465 && msg.x <= 565 && msg.y >= 25 && msg.y <= 55) {
                generateQuadruples();
                drawInputBox();
            }
            // 检查是否点击目标代码生成按钮
            if (msg.x >= 575 && msg.x <= 675 && msg.y >= 25 && msg.y <= 55) {
                generateTargetCode();
                drawInputBox();
            }
        }
    }
    return false;
}

// 处理键盘输入
void Interface::handleKeyboardInput() {
    if (userInput.empty()) {
        userInput.push_back("");
    }

    while (true) {
        if (handleMouseClick()) {
            break;
        }

        if (_kbhit()) {
            int key = _getch();

            // 处理普通字符输入
            if ((key >= 'A' && key <= 'Z') || (key >= 'a' && key <= 'z') ||
                (key >= '0' && key <= '9') || key == 32 ||  // 字母、数字、空格
                key == '+' || key == '-' || key == '*' || key == '/' ||  // 运算符
                key == '=' || key == '<' || key == '>' || key == '!' ||  // 比较运算符
                key == '(' || key == ')' || key == '{' || key == '}' ||  // 括号
                key == '[' || key == ']' || key == ';' || key == ',' ||  // 分号、逗号、方括号
                key == '.' || key == '&' || key == '|' || key == '^' ||  // 其他运算符
                key == '~' || key == '?' || key == ':' || key == '#' ||  // 其他特殊字符
                key == '_' || key == '\'' || key == '\"') {              // 下划线、引号
                if (userInput[currentLine].length() < MAX_LINE_LENGTH) {
                    userInput[currentLine] += (char)key;
                    drawInputBox();
                }
            }
            // 处理退格键
            else if (key == 8) {
                if (!userInput[currentLine].empty()) {
                    userInput[currentLine].pop_back();
                }
                else if (currentLine > 0) {
                    userInput.pop_back();
                    currentLine--;
                }
                drawInputBox();
            }
            // 处理回车键（换行）
            else if (key == 13) {
                userInput.push_back("");
                currentLine++;
                // 自动滚动
                if (currentLine >= scrollOffset + VISIBLE_LINES) {
                    scrollOffset = currentLine - VISIBLE_LINES + 1;
                }
                drawInputBox();
            }
            // 处理ESC键
            else if (key == 27) {
                break;
            }
            // 处理上下方向键
            else if (key == 224) {  // 方向键前缀
                key = _getch();
                if (key == 72) {  // 上方向键
                    if (currentLine > 0) {
                        currentLine--;
                        if (currentLine < scrollOffset) {
                            scrollOffset = currentLine;
                        }
                        drawInputBox();
                    }
                }
                else if (key == 80) {  // 下方向键
                    if (currentLine < userInput.size() - 1) {
                        currentLine++;
                        if (currentLine >= scrollOffset + VISIBLE_LINES) {
                            scrollOffset = currentLine - VISIBLE_LINES + 1;
                        }
                        drawInputBox();
                    }
                }
            }
        }

        Sleep(10);
    }
}

// 编译
void Interface::saveContent() {
    savedContent.clear();
    for (const string& line : userInput) {
        savedContent += line + "\n";
    }
}

// 词法分析函数
void Interface::lexicalAnalysis() {
    // TODO: 实现词法分析
}

// 语法分析函数
void Interface::syntaxAnalysis() {
    // TODO: 实现语法分析
}

// 四元式生成函数
void Interface::generateQuadruples() {
    // TODO: 实现四元式生成
}

// 目标代码生成函数
void Interface::generateTargetCode() {
    // TODO: 实现目标代码生成
}