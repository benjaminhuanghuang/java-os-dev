; boot 把磁盘上从第二扇区开始到的内容装载到内存0x8200号地址，
; 在FAT文件系统中，第一个文件是从0号柱面33扇区开始的，也就是磁盘0x4200处
; 所以磁盘0x4200处的内容就应该位于内存0x8000+0x4200=0xc200号地址。
; kernel里加上ORG 0xc200，boot最后 要JMP 0xc200。

; Read 10× 2×18× 512=184320 byte=180KB
; 0x08200～0x34fff

CYLS	EQU		10				; read 10 cyindars

		ORG		0x7c00			; start address

; FAT 12 file system

		JMP		entry
		DB		0x90
		DB		"OS--BOOT"		        ; Name of boot sector
		DW      512      ; 1个扇区大小（必须为512）
        DB      1        ; 簇大小（必须为1个扇区）
        DW      1        ; FAT从哪里开始（通常从第一个扇区开始）
        DB      2        ; FAT数（必须为2）
        DW      224      ; 根目录区域大小（通常为224个条目）
        DW      2880     ; 此驱动器的大小（必须为2880个扇区）
        DB      0xf0     ; 媒体类型（必须为0xf0）
        DW      9        ; FAT区域长度（必须为9个扇区）
        DW      18       ; 一个磁道中有多少扇区（必须为18）
        DW      2        ; 磁头数（必须为2）
        DD      0        ; 此处为0，因为未使用任何分区
        DD      2880        ;重写此驱动器大小
        DB      0,0,0x29        ;
        DD      0xffffffff        ;
        DB      "OS-STUDY-21"     ;磁盘名称（11个字节）
        DB      "FAT12   "        ;格式名称（8个字节）
        RESB 18        ;暂时保留18个字节

entry:
		MOV		AX, 0			; 
		MOV		SS, AX
		MOV		SP, 0x7c00
		MOV		DS, AX

; Read Disk to 0x820 [DS:ES]
		MOV		AX, 0x0820
		MOV		ES, AX

		MOV		CH, 0			; Cyindar
		MOV		DH, 0			; Head
		MOV		CL, 2			; Sector
readloop:
		MOV		SI,0			; failed times
retry:
		MOV		AH,0x02			; Function number 0x02 : Read Disk
		MOV		AL,1			; read 1 sector
		MOV		BX,0
		MOV		DL,0x00			; Driver Number
		INT		0x13			; Call BIOS 0x13
		JNC		next			; goto next if no error
		ADD		SI,1			; retry 5 times
		CMP		SI,5			; compare SI vs 5
		JAE		error			; SI >= 5 goto error
		MOV		AH,0x00         ; function number 0x00: reset driver
		MOV		DL,0x00			; Driver
		INT		0x13			; Call BIOS 0x13
		JMP		retry
next:
		MOV		AX,ES			; ES += 0x200
		ADD		AX,0x0020
		MOV		ES,AX			; There is no command:ADD ES,0x020
		ADD		CL,1			; CL(sector)++, read one more sector
		CMP		CL,18			; 
		JBE		readloop		; CL(sector) <= 18 goto readloop
		MOV		CL,1            ; read 18 sector, set CL to 1 and DH to 1
		ADD		DH,1            ;
		CMP		DH,2
		JB		readloop		; goto readloop 
		MOV		DH,0            ; if DH(head) == 2, set it back to 0
		ADD		CH,1            ; CH (sylinder) ++
		CMP		CH,CYLS         ; 
		JB		readloop		; CH(sylender) < CYLS 

; Jump to kernel code

		JMP		0xc200

error:
		MOV		SI,msg
putloop:
		MOV		AL,[SI]
		ADD		SI,1			; SI++
		CMP		AL,0            ; end of string
		JE		fin
		MOV		AH,0x0e			; funciton for char
		MOV		BX,15			; color code
		INT		0x10			; Call BIOS
		JMP		putloop
fin:
		HLT						; loop
		JMP		fin				; 
msg:
		DB		0x0a, 0x0a		; new line
		DB		"load error"
		DB		0x0a			; new line
		DB		0