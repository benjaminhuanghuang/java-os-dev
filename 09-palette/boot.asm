org  0x7c00;

LOAD_ADDR  EQU  0x9000
    jmp  entry
    db   0x90
    DB   "OSKERNEL"
    DW   512
    DB   1
    DW   1
    DB   2
    DW   224
    DW   2880
    DB   0xf0
    DW   9
    DW   18
    DW   2
    DD   0
    DD   2880
    DB   0,0,0x29
    DD   0xFFFFFFFF
    DB   "MYFIRSTOS  "
    DB   "FAT12   "
entry:
    mov  ax, 0
    mov  ss, ax
    mov  ds, ax
    mov  es, ax
    mov  si, ax
; read the sector contains first file in file system
readFloppy:
    mov          CH, 0        ; CH 用来存储柱面号
    mov          DH, 1        ; DH 用来存储磁头号
    mov          CL, 16       ; CL 用来存储扇区号
    mov          BX, LOAD_ADDR       ; ES:BX 数据存储缓冲区

    mov          AH, 0x02      ; AH = 02 表示要做的是读盘操作
    mov          AL, 4        ; AL 表示要连续读取几个扇区
    mov          DL, 0         ; 驱动器编号，一般我们只有一个软盘驱动器，所以写死为0
    INT          0x13          ; 调用BIOS中断实现磁盘读取功能

    JC           error
    MOV          AL, 1
    MOV		     [0x0ff0], AL  ;   一共加载了几个柱面, 暂时写成 1
    jmp          LOAD_ADDR

error:
    MOV		SI, errmsg

putloop:
    MOV		AL,[SI]
    ADD		SI,1			; SI + 1
    CMP		AL,0            ; end of string
    JE		fin
    MOV		AH,0x0e			; display 1 charactor
    MOV		BX,15			; color
    INT		0x10			; Call BIOS INT 0x10
    JMP		putloop

fin:
    HLT
    jmp  fin

errmsg:
    DB		0x0a, 0x0a		; new line * 2
    DB		"load error"
    DB		0x0a			; new line
    DB		0
