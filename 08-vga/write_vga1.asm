; Disassembly of file: write_vga.o
; Sun Jan  3 13:27:09 2021
; Mode: 32 bits
; Syntax: YASM/NASM
; Instruction set: 80386


global _CMain

extern _io_hlt                                          ; near


SECTION ._TEXT.__text align=16 execute                  ; section number 1, code

_CMain: ; Function begin
        push    ebp                                     ; 0000 _ 55
        mov     ebp, esp                                ; 0001 _ 89. E5
        sub     esp, 8                                  ; 0003 _ 83. EC, 08
        mov     dword [ebp-8H], 0                       ; 0006 _ C7. 45, F8, 00000000
        mov     dword [ebp-4H], 655360                  ; 000D _ C7. 45, FC, 000A0000
?_001:  cmp     dword [ebp-4H], 720895                  ; 0014 _ 81. 7D, FC, 000AFFFF
; Note: Immediate operand could be made smaller by sign extension
        jg      ?_002                                   ; 001B _ 0F 8F, 00000021
        mov     eax, dword [ebp-4H]                     ; 0021 _ 8B. 45, FC
        mov     dword [ebp-8H], eax                     ; 0024 _ 89. 45, F8
        mov     eax, dword [ebp-4H]                     ; 0027 _ 8B. 45, FC
        and     eax, 0FH                                ; 002A _ 83. E0, 0F
        mov     cl, al                                  ; 002D _ 88. C1
        mov     eax, dword [ebp-8H]                     ; 002F _ 8B. 45, F8
        mov     byte [eax], cl                          ; 0032 _ 88. 08
        mov     eax, dword [ebp-4H]                     ; 0034 _ 8B. 45, FC
        add     eax, 1                                  ; 0037 _ 83. C0, 01
        mov     dword [ebp-4H], eax                     ; 003A _ 89. 45, FC
; Note: Immediate operand could be made smaller by sign extension
        jmp     ?_001                                   ; 003D _ E9, FFFFFFD2

?_002:
; Note: Immediate operand could be made smaller by sign extension
        jmp     ?_003                                   ; 0042 _ E9, 00000000

?_003:  call    _io_hlt                                 ; 0047 _ E8, FFFFFFB4(rel)
; Note: Immediate operand could be made smaller by sign extension
        jmp     ?_003                                   ; 004C _ E9, FFFFFFF6
; _CMain End of function


