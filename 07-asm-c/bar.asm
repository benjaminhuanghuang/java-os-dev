; Disassembly of file: bar.o
; Sun Jan  3 01:28:07 2021
; Mode: 32 bits
; Syntax: YASM/NASM
; Instruction set: 80386


global _bar_func

extern _foo_print                                       ; near


SECTION ._TEXT.__text align=16 execute                  ; section number 1, code

_bar_func:; Function begin
        push    ebp                                     ; 0000 _ 55
        mov     ebp, esp                                ; 0001 _ 89. E5
        push    esi                                     ; 0003 _ 56
        sub     esp, 20                                 ; 0004 _ 83. EC, 14
        call    ?_001                                   ; 0007 _ E8, 00000000
?_001:  pop     eax                                     ; 000C _ 58
        mov     ecx, dword [ebp+0CH]                    ; 000D _ 8B. 4D, 0C
        mov     edx, dword [ebp+8H]                     ; 0010 _ 8B. 55, 08
        mov     esi, dword [ebp+8H]                     ; 0013 _ 8B. 75, 08
        cmp     esi, dword [ebp+0CH]                    ; 0016 _ 3B. 75, 0C
        mov     dword [ebp-8H], eax                     ; 0019 _ 89. 45, F8
        mov     dword [ebp-0CH], ecx                    ; 001C _ 89. 4D, F4
        mov     dword [ebp-10H], edx                    ; 001F _ 89. 55, F0
; Note: Immediate operand could be made smaller by sign extension
        jle     ?_002                                   ; 0022 _ 0F 8E, 0000001E
        mov     eax, dword [ebp-8H]                     ; 0028 _ 8B. 45, F8
        lea     ecx, [?_004-?_001+eax]                  ; 002B _ 8D. 88, 0000005B(refpoint)
        mov     dword [esp], ecx                        ; 0031 _ 89. 0C 24
        mov     dword [esp+4H], 13                      ; 0034 _ C7. 44 24, 04, 0000000D
        call    _foo_print                              ; 003C _ E8, FFFFFFBF(rel)
; Note: Immediate operand could be made smaller by sign extension
        jmp     ?_003                                   ; 0041 _ E9, 00000019

?_002:  mov     eax, dword [ebp-8H]                     ; 0046 _ 8B. 45, F8
        lea     ecx, [?_005-?_001+eax]                  ; 0049 _ 8D. 88, 00000068(refpoint)
        mov     dword [esp], ecx                        ; 004F _ 89. 0C 24
        mov     dword [esp+4H], 13                      ; 0052 _ C7. 44 24, 04, 0000000D
        call    _foo_print                              ; 005A _ E8, FFFFFFA1(rel)
?_003:  xor     eax, eax                                ; 005F _ 31. C0
        add     esp, 20                                 ; 0061 _ 83. C4, 14
        pop     esi                                     ; 0064 _ 5E
        pop     ebp                                     ; 0065 _ 5D
        ret                                             ; 0066 _ C3
; _bar_func End of function


SECTION ._TEXT.__cstring align=1 noexecute              ; section number 2, data

?_004:                                                  ; byte
        db 74H, 68H, 65H, 20H, 31H, 73H, 74H, 20H       ; 0067 _ the 1st 
        db 6FH, 6EH, 65H, 0AH, 00H                      ; 006F _ one..

?_005:                                                  ; byte
        db 74H, 68H, 65H, 20H, 32H, 6EH, 64H, 20H       ; 0074 _ the 2nd 
        db 6FH, 6EH, 65H, 0AH, 00H                      ; 007C _ one..


