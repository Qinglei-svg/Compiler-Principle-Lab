SSEG SEGMENT stack
	DB 1000 DUP(0); 定义栈段的大小
SSEG ENDS
DSEG SEGMENT;
	T DB 1000 DUP(0)
DSEG ENDS;
CSEG SEGMENT; 定义代码段
	ASSUME CS : CSEG, DS : DSEG, SS : SSEG
MAIN : 
	abs PROC FAR
	PUSH BP
	MOV BP,SP
	SUB SP 2
	MOV AX, abs_a
	CMP AX, 0
	JG Lable0
	MOV AX, 0
	JMP Lable1
	Lable0:
	MOV AX, 1
	Lable1:
	MOV t0, AX
	CMP [T+0],0
	JE Lable2
	MOV BX,[BP-2]
	JMP absRETURN
	JMP Lable3
	Lable2:
	MOV AX, 0
	SUB AX, abs_a
	MOV t1, AX
	MOV BX,[T+2]
	JMP absRETURN
	Lable3:
	absRETURN:
	MOV SP,BP
	POP BP
	RET
	abs ENDP
	func PROC FAR
	PUSH BP
	MOV BP,SP
	SUB SP 2
	SUB SP 2
	SUB SP 2
	MOV AX, 10
	MOV func_a, AX
	MOV AX, 10
	MOV func_b, AX
	Lable4:
	MOV AX, func_a
	CMP AX, 1
	JE Lable5
	JMP Lable7
	Lable5:
	MOV AX, func_b
	CMP AX, 1
	JE Lable6
	JMP Lable7
	Lable6:
	MOV AX, 1
	JMP
	Lable7:
	MOV AX, 0
	Lable8:
	MOV t2, AX
	MOV AX, func_b
	CMP AX, 5
	JG Lable9
	MOV AX, 0
	JMP Lable10
	Lable9:
	MOV AX, 1
	Lable10:
	MOV t3, AX
	MOV AX, t2
	CMP AX, 1
	JE Lable13
	JMP Lable11
	Lable11:
	MOV AX, t3
	CMP AX, 1
	JE Lable13
	JMP Lable12
	Lable13:
	MOV AX, 1
	JMP
	Lable12:
	MOV AX, 0
	Lable14:
	MOV t4, AX
	CMP [T+8],0
	JE Lable15
	Lable16:
	MOV AX,[BP-2]
	MOV [SP-6], AX
	CALL FAR PTR abs
	MOV AX, func_a
	CMP AX, t5
	JL Lable17
	MOV AX, 0
	JMP Lable18
	Lable17:
	MOV AX, 1
	Lable18:
	MOV t6, AX
	CMP [T+12],0
	JE Lable19
	MOV AX, func_b 
	IMUL func_c 
	LEA BX, t7 
	MOV DW PTR [BX], AX 
	ADD BX, 2 
	MOV DW PTR [BX], DX 
	MOV AX, func_a
	ADD AX, t7
	MOV t8, AX
	MOV AX, t8
	MOV func_a, AX
	MOV AX, func_b 
	IMUL func_c 
	LEA BX, t10 
	MOV DW PTR [BX], AX 
	ADD BX, 2 
	MOV DW PTR [BX], DX 
	MOV AX,[BP-2]
	MOV [SP-6], AX
	CALL FAR PTR abs
	MOV AX, t9
	ADD AX, 1
	MOV t11, AX
	LEA BX, func_a 
	MOV AX, DW PTR [BX] 
	ADD BX, 2 
	MOV DX, DW PTR [BX] 
	IDIV t11 
	MOV t12, AX
	MOV AX, t12
	MOV func_b, AX
	MOV AX, func_c
	ADD AX, 2
	MOV t13, AX
	MOV AX, t13
	MOV func_c, AX
	JMP Lable16
	Lable19:
	MOV AX, func_a
	CMP AX, 0
	JG Lable20
	MOV AX, 0
	JMP Lable21
	Lable20:
	MOV AX, 1
	Lable21:
	MOV t14, AX
	CMP [T+28],0
	JE Lable22
	MOV AX, func_a 
	IMUL func_b 
	LEA BX, t15 
	MOV DW PTR [BX], AX 
	ADD BX, 2 
	MOV DW PTR [BX], DX 
	MOV AX, t15
	MOV func_a, AX
	MOV AX, func_b
	CMP AX, 0
	JNE Lable23
	MOV AX, 0
	JMP Lable24
	Lable23:
	MOV AX, 1
	Lable24:
	MOV t16, AX
	CMP [T+32],0
	JE Lable25
	MOV AX, func_b
	SUB AX, 1
	MOV t17, AX
	MOV AX, t17
	MOV func_b, AX
	JMP Lable26
	Lable25:
	Lable27:
	MOV AX, func_c
	CMP AX, 1
	JE Lable28
	MOV AX, 0
	JMP Lable29
	Lable28:
	MOV AX, 1
	Lable29:
	MOV t18, AX
	MOV AX, func_a
	CMP AX, 10
	JNE Lable30
	MOV AX, 0
	JMP Lable31
	Lable30:
	MOV AX, 1
	Lable31:
	MOV t19, AX
	MOV AX, t18
	CMP AX, 1
	JE Lable34
	JMP Lable32
	Lable32:
	MOV AX, t19
	CMP AX, 1
	JE Lable34
	JMP Lable33
	Lable34:
	MOV AX, 1
	JMP
	Lable33:
	MOV AX, 0
	Lable35:
	MOV t20, AX
	CMP [T+40],0
	JE Lable36
	MOV AX, func_a 
	IMUL func_b 
	LEA BX, t21 
	MOV DW PTR [BX], AX 
	ADD BX, 2 
	MOV DW PTR [BX], DX 
	MOV AX, func_c
	SUB AX, t21
	MOV t22, AX
	MOV AX, t22
	MOV func_c, AX
	MOV AX, func_c
	ADD AX, func_a
	MOV t23, AX
	MOV AX, t23
	MOV func_b, AX
	JMP Lable27
	Lable36:
	MOV AX, func_b 
	IMUL func_c 
	LEA BX, t24 
	MOV DW PTR [BX], AX 
	ADD BX, 2 
	MOV DW PTR [BX], DX 
	MOV BX,[T+48]
	JMP funcRETURN
	Lable26:
	Lable22:
	Lable38:
	MOV AX, func_a
	CMP AX, func_c
	JGE Lable39
	MOV AX, 0
	JMP Lable40
	Lable39:
	MOV AX, 1
	Lable40:
	MOV t25, AX
	CMP [T+50],0
	JE Lable41
	MOV AX, func_a
	ADD AX, 1
	MOV t26, AX
	MOV AX, t26
	MOV func_a, AX
	JMP Lable38
	Lable41:
	MOV AX, func_a
	CMP AX, 1
	JE Lable44
	JMP Lable42
	Lable42:
	MOV AX, func_b
	CMP AX, 1
	JE Lable44
	JMP Lable43
	Lable44:
	MOV AX, 1
	JMP
	Lable43:
	MOV AX, 0
	Lable45:
	MOV t27, AX
	CMP [T+54],0
	JE Lable46
	Lable47:
	MOV AX, func_b
	CMP AX, 3
	JNE Lable48
	MOV AX, 0
	JMP Lable49
	Lable48:
	MOV AX, 1
	Lable49:
	MOV t28, AX
	CMP [T+56],0
	JE Lable50
	MOV AX, func_a 
	IMUL func_b 
	LEA BX, t29 
	MOV DW PTR [BX], AX 
	ADD BX, 2 
	MOV DW PTR [BX], DX 
	MOV AX, t29
	MOV func_b, AX
	JMP Lable47
	Lable50:
	JMP Lable51
	Lable46:
	MOV AX, func_a 
	IMUL func_b 
	LEA BX, t31 
	MOV DW PTR [BX], AX 
	ADD BX, 2 
	MOV DW PTR [BX], DX 
	MOV AX, func_a 
	IMUL func_c 
	LEA BX, t32 
	MOV DW PTR [BX], AX 
	ADD BX, 2 
	MOV DW PTR [BX], DX 
	MOV AX, t31
	SUB AX, t32
	MOV t33, AX
	MOV AX,[BP-2]
	MOV [SP-6], AX
	CALL FAR PTR abs
	MOV BX,[T+60]
	JMP funcRETURN
	Lable51:
	JMP Lable4
	Lable15:
	funcRETURN:
	MOV SP,BP
	POP BP
	RET
	func ENDP
	SSEG SEGMENT stack
		DB 1000 DUP(0); 定义栈段的大小
	SSEG ENDS
	DSEG SEGMENT;
		T DB 1000 DUP(0)
	DSEG ENDS;
	CSEG SEGMENT; 定义代码段
		ASSUME CS : CSEG, DS : DSEG, SS : SSEG
	MAIN : 
	abs PROC FAR
	PUSH BP
	MOV BP,SP
	SUB SP 2
	MOV AX, abs_a
	CMP AX, 0
	JG Lable0
	MOV AX, 0
	JMP Lable1
	Lable0:
	MOV AX, 1
	Lable1:
	MOV t0, AX
	CMP [T+0],0
	JE Lable2
	MOV BX,[BP-2]
	JMP absRETURN
	JMP Lable3
	Lable2:
	MOV AX, 0
	SUB AX, abs_a
	MOV t1, AX
	MOV BX,[T+2]
	JMP absRETURN
	Lable3:
	absRETURN:
	MOV SP,BP
	POP BP
	RET
	abs ENDP
	func PROC FAR
	PUSH BP
	MOV BP,SP
	SUB SP 2
	SUB SP 2
	SUB SP 2
	MOV AX, 10
	MOV func_a, AX
	MOV AX, 10
	MOV func_b, AX
	Lable4:
	MOV AX, func_a
	CMP AX, 1
	JE Lable5
	JMP Lable7
	Lable5:
	MOV AX, func_b
	CMP AX, 1
	JE Lable6
	JMP Lable7
	Lable6:
	MOV AX, 1
	JMP
	Lable7:
	MOV AX, 0
	Lable8:
	MOV t2, AX
	MOV AX, func_b
	CMP AX, 5
	JG Lable9
	MOV AX, 0
	JMP Lable10
	Lable9:
	MOV AX, 1
	Lable10:
	MOV t3, AX
	MOV AX, t2
	CMP AX, 1
	JE Lable13
	JMP Lable11
	Lable11:
	MOV AX, t3
	CMP AX, 1
	JE Lable13
	JMP Lable12
	Lable13:
	MOV AX, 1
	JMP
	Lable12:
	MOV AX, 0
	Lable14:
	MOV t4, AX
	CMP [T+8],0
	JE Lable15
	Lable16:
	MOV AX,[BP-2]
	MOV [SP-6], AX
	CALL FAR PTR abs
	MOV AX, func_a
	CMP AX, t5
	JL Lable17
	MOV AX, 0
	JMP Lable18
	Lable17:
	MOV AX, 1
	Lable18:
	MOV t6, AX
	CMP [T+12],0
	JE Lable19
	MOV AX, func_b 
	IMUL func_c 
	LEA BX, t7 
	MOV DW PTR [BX], AX 
	ADD BX, 2 
	MOV DW PTR [BX], DX 
	MOV AX, func_a
	ADD AX, t7
	MOV t8, AX
	MOV AX, t8
	MOV func_a, AX
	MOV AX, func_b 
	IMUL func_c 
	LEA BX, t10 
	MOV DW PTR [BX], AX 
	ADD BX, 2 
	MOV DW PTR [BX], DX 
	MOV AX,[BP-2]
	MOV [SP-6], AX
	CALL FAR PTR abs
	MOV AX, t9
	ADD AX, 1
	MOV t11, AX
	LEA BX, func_a 
	MOV AX, DW PTR [BX] 
	ADD BX, 2 
	MOV DX, DW PTR [BX] 
	IDIV t11 
	MOV t12, AX
	MOV AX, t12
	MOV func_b, AX
	MOV AX, func_c
	ADD AX, 2
	MOV t13, AX
	MOV AX, t13
	MOV func_c, AX
	JMP Lable16
	Lable19:
	MOV AX, func_a
	CMP AX, 0
	JG Lable20
	MOV AX, 0
	JMP Lable21
	Lable20:
	MOV AX, 1
	Lable21:
	MOV t14, AX
	CMP [T+28],0
	JE Lable22
	MOV AX, func_a 
	IMUL func_b 
	LEA BX, t15 
	MOV DW PTR [BX], AX 
	ADD BX, 2 
	MOV DW PTR [BX], DX 
	MOV AX, t15
	MOV func_a, AX
	MOV AX, func_b
	CMP AX, 0
	JNE Lable23
	MOV AX, 0
	JMP Lable24
	Lable23:
	MOV AX, 1
	Lable24:
	MOV t16, AX
	CMP [T+32],0
	JE Lable25
	MOV AX, func_b
	SUB AX, 1
	MOV t17, AX
	MOV AX, t17
	MOV func_b, AX
	JMP Lable26
	Lable25:
	Lable27:
	MOV AX, func_c
	CMP AX, 1
	JE Lable28
	MOV AX, 0
	JMP Lable29
	Lable28:
	MOV AX, 1
	Lable29:
	MOV t18, AX
	MOV AX, func_a
	CMP AX, 10
	JNE Lable30
	MOV AX, 0
	JMP Lable31
	Lable30:
	MOV AX, 1
	Lable31:
	MOV t19, AX
	MOV AX, t18
	CMP AX, 1
	JE Lable34
	JMP Lable32
	Lable32:
	MOV AX, t19
	CMP AX, 1
	JE Lable34
	JMP Lable33
	Lable34:
	MOV AX, 1
	JMP
	Lable33:
	MOV AX, 0
	Lable35:
	MOV t20, AX
	CMP [T+40],0
	JE Lable36
	MOV AX, func_a 
	IMUL func_b 
	LEA BX, t21 
	MOV DW PTR [BX], AX 
	ADD BX, 2 
	MOV DW PTR [BX], DX 
	MOV AX, func_c
	SUB AX, t21
	MOV t22, AX
	MOV AX, t22
	MOV func_c, AX
	MOV AX, func_c
	ADD AX, func_a
	MOV t23, AX
	MOV AX, t23
	MOV func_b, AX
	JMP Lable27
	Lable36:
	MOV AX, func_b 
	IMUL func_c 
	LEA BX, t24 
	MOV DW PTR [BX], AX 
	ADD BX, 2 
	MOV DW PTR [BX], DX 
	MOV BX,[T+48]
	JMP funcRETURN
	Lable26:
	Lable22:
	Lable38:
	MOV AX, func_a
	CMP AX, func_c
	JGE Lable39
	MOV AX, 0
	JMP Lable40
	Lable39:
	MOV AX, 1
	Lable40:
	MOV t25, AX
	CMP [T+50],0
	JE Lable41
	MOV AX, func_a
	ADD AX, 1
	MOV t26, AX
	MOV AX, t26
	MOV func_a, AX
	JMP Lable38
	Lable41:
	MOV AX, func_a
	CMP AX, 1
	JE Lable44
	JMP Lable42
	Lable42:
	MOV AX, func_b
	CMP AX, 1
	JE Lable44
	JMP Lable43
	Lable44:
	MOV AX, 1
	JMP
	Lable43:
	MOV AX, 0
	Lable45:
	MOV t27, AX
	CMP [T+54],0
	JE Lable46
	Lable47:
	MOV AX, func_b
	CMP AX, 3
	JNE Lable48
	MOV AX, 0
	JMP Lable49
	Lable48:
	MOV AX, 1
	Lable49:
	MOV t28, AX
	CMP [T+56],0
	JE Lable50
	MOV AX, func_a 
	IMUL func_b 
	LEA BX, t29 
	MOV DW PTR [BX], AX 
	ADD BX, 2 
	MOV DW PTR [BX], DX 
	MOV AX, t29
	MOV func_b, AX
	JMP Lable47
	Lable50:
	JMP Lable51
	Lable46:
	MOV AX, func_a 
	IMUL func_b 
	LEA BX, t31 
	MOV DW PTR [BX], AX 
	ADD BX, 2 
	MOV DW PTR [BX], DX 
	MOV AX, func_a 
	IMUL func_c 
	LEA BX, t32 
	MOV DW PTR [BX], AX 
	ADD BX, 2 
	MOV DW PTR [BX], DX 
	MOV AX, t31
	SUB AX, t32
	MOV t33, AX
	MOV AX,[BP-2]
	MOV [SP-6], AX
	CALL FAR PTR abs
	MOV BX,[T+60]
	JMP funcRETURN
	Lable51:
	JMP Lable4
	Lable15:
	funcRETURN:
	MOV SP,BP
	POP BP
	RET
	func ENDP
    MOV AX, 4c00h
	INT 21h; 调用 DOS 中断，退出程序
CSEG ENDS; 代码段结束
END MAIN; 程序结束