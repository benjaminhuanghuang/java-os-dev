; Disassembly of file: os.o
; Mon Jan  4 15:33:34 2021
; Mode: 32 bits
; Syntax: YASM/NASM
; Instruction set: Pentium Pro


global _CMain
global _initBootInfo: function
global _init_palette: function
global _boxfill8: function
global _set_palette: function

extern _io_store_eflags                                 ; near
extern _io_out8                                         ; near
extern _io_load_eflags                                  ; near
extern _io_hlt                                          ; near
extern _io_cli                                          ; near


SECTION ._TEXT.__text align=16 execute                  ; section number 1, code

_CMain: ; Function begin
        push    ebp                                     ; 0000 _ 55
        mov     ebp, esp                                ; 0001 _ 89. E5
        sub     esp, 56                                 ; 0003 _ 83. EC, 38
        lea     eax, [ebp-8H]                           ; 0006 _ 8D. 45, F8
        mov     dword [esp], eax                        ; 0009 _ 89. 04 24
        call    _initBootInfo                           ; 000C _ E8, 000000DF(rel)
        mov     eax, dword [ebp-8H]                     ; 0011 _ 8B. 45, F8
        mov     dword [ebp-0CH], eax                    ; 0014 _ 89. 45, F4
        movsx   eax, word [ebp-4H]                      ; 0017 _ 0F BF. 45, FC
        mov     dword [ebp-10H], eax                    ; 001B _ 89. 45, F0
        movsx   eax, word [ebp-2H]                      ; 001E _ 0F BF. 45, FE
        mov     dword [ebp-14H], eax                    ; 0022 _ 89. 45, EC
        call    _init_palette                           ; 0025 _ E8, 000000F6(rel)
        mov     eax, dword [ebp-0CH]                    ; 002A _ 8B. 45, F4
        mov     dword [esp], eax                        ; 002D _ 89. 04 24
        mov     dword [esp+4H], 320                     ; 0030 _ C7. 44 24, 04, 00000140
        mov     dword [esp+8H], 1                       ; 0038 _ C7. 44 24, 08, 00000001
        mov     dword [esp+0CH], 20                     ; 0040 _ C7. 44 24, 0C, 00000014
        mov     dword [esp+10H], 20                     ; 0048 _ C7. 44 24, 10, 00000014
        mov     dword [esp+14H], 120                    ; 0050 _ C7. 44 24, 14, 00000078
        mov     dword [esp+18H], 120                    ; 0058 _ C7. 44 24, 18, 00000078
        call    _boxfill8                               ; 0060 _ E8, 000000FB(rel)
        mov     eax, dword [ebp-0CH]                    ; 0065 _ 8B. 45, F4
        mov     dword [esp], eax                        ; 0068 _ 89. 04 24
        mov     dword [esp+4H], 320                     ; 006B _ C7. 44 24, 04, 00000140
        mov     dword [esp+8H], 2                       ; 0073 _ C7. 44 24, 08, 00000002
        mov     dword [esp+0CH], 70                     ; 007B _ C7. 44 24, 0C, 00000046
        mov     dword [esp+10H], 50                     ; 0083 _ C7. 44 24, 10, 00000032
        mov     dword [esp+14H], 170                    ; 008B _ C7. 44 24, 14, 000000AA
        mov     dword [esp+18H], 150                    ; 0093 _ C7. 44 24, 18, 00000096
        call    _boxfill8                               ; 009B _ E8, 000000C0(rel)
        mov     eax, dword [ebp-0CH]                    ; 00A0 _ 8B. 45, F4
        mov     dword [esp], eax                        ; 00A3 _ 89. 04 24
        mov     dword [esp+4H], 320                     ; 00A6 _ C7. 44 24, 04, 00000140
        mov     dword [esp+8H], 4                       ; 00AE _ C7. 44 24, 08, 00000004
        mov     dword [esp+0CH], 120                    ; 00B6 _ C7. 44 24, 0C, 00000078
        mov     dword [esp+10H], 80                     ; 00BE _ C7. 44 24, 10, 00000050
        mov     dword [esp+14H], 220                    ; 00C6 _ C7. 44 24, 14, 000000DC
        mov     dword [esp+18H], 180                    ; 00CE _ C7. 44 24, 18, 000000B4
        call    _boxfill8                               ; 00D6 _ E8, 00000085(rel)
?_001:  call    _io_hlt                                 ; 00DB _ E8, FFFFFF20(rel)
; Note: Immediate operand could be made smaller by sign extension
        jmp     ?_001                                   ; 00E0 _ E9, FFFFFFF6
; _CMain End of function

; Filling space: 0BH
; Filler type: Multi-byte NOP
;       db 66H, 2EH, 0FH, 1FH, 84H, 00H, 00H, 00H
;       db 00H, 00H, 90H

ALIGN   16

_initBootInfo:; Function begin
        push    ebp                                     ; 00F0 _ 55
        mov     ebp, esp                                ; 00F1 _ 89. E5
        push    eax                                     ; 00F3 _ 50
        mov     eax, dword [ebp+8H]                     ; 00F4 _ 8B. 45, 08
        mov     ecx, dword [ebp+8H]                     ; 00F7 _ 8B. 4D, 08
        mov     edx, 655360                             ; 00FA _ BA, 000A0000
        mov     dword [ecx], edx                        ; 00FF _ 89. 11
        mov     ecx, dword [ebp+8H]                     ; 0101 _ 8B. 4D, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [ecx+4H], 320                      ; 0104 _ 66: C7. 41, 04, 0140
        mov     ecx, dword [ebp+8H]                     ; 010A _ 8B. 4D, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [ecx+6H], 200                      ; 010D _ 66: C7. 41, 06, 00C8
        mov     dword [ebp-4H], eax                     ; 0113 _ 89. 45, FC
        add     esp, 4                                  ; 0116 _ 83. C4, 04
        pop     ebp                                     ; 0119 _ 5D
        ret                                             ; 011A _ C3
; _initBootInfo End of function

; Filling space: 5H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 44H, 00H, 00H

ALIGN   8

_init_palette:; Function begin
        push    ebp                                     ; 0120 _ 55
        mov     ebp, esp                                ; 0121 _ 89. E5
        sub     esp, 24                                 ; 0123 _ 83. EC, 18
        call    ?_002                                   ; 0126 _ E8, 00000000
?_002:  pop     eax                                     ; 012B _ 58
        xor     ecx, ecx                                ; 012C _ 31. C9
        lea     eax, [_init_palette.table_rgb-?_002+eax]; 012E _ 8D. 80, 0000018A(refpoint)
        mov     dword [esp], 0                          ; 0134 _ C7. 04 24, 00000000
        mov     dword [esp+4H], 15                      ; 013B _ C7. 44 24, 04, 0000000F
        mov     dword [esp+8H], eax                     ; 0143 _ 89. 44 24, 08
        mov     dword [ebp-4H], ecx                     ; 0147 _ 89. 4D, FC
        call    _set_palette                            ; 014A _ E8, 000000B1(rel)
        add     esp, 24                                 ; 014F _ 83. C4, 18
        pop     ebp                                     ; 0152 _ 5D
        ret                                             ; 0153 _ C3
; _init_palette End of function

; Filling space: 0CH
; Filler type: Multi-byte NOP
;       db 66H, 2EH, 0FH, 1FH, 84H, 00H, 00H, 00H
;       db 00H, 00H, 66H, 90H

ALIGN   16

_boxfill8:; Function begin
        push    ebp                                     ; 0160 _ 55
        mov     ebp, esp                                ; 0161 _ 89. E5
        push    ebx                                     ; 0163 _ 53
        push    edi                                     ; 0164 _ 57
        push    esi                                     ; 0165 _ 56
        sub     esp, 36                                 ; 0166 _ 83. EC, 24
        mov     eax, dword [ebp+20H]                    ; 0169 _ 8B. 45, 20
        mov     ecx, dword [ebp+1CH]                    ; 016C _ 8B. 4D, 1C
        mov     edx, dword [ebp+18H]                    ; 016F _ 8B. 55, 18
        mov     esi, dword [ebp+14H]                    ; 0172 _ 8B. 75, 14
        mov     bl, byte [ebp+10H]                      ; 0175 _ 8A. 5D, 10
        mov     edi, dword [ebp+0CH]                    ; 0178 _ 8B. 7D, 0C
        mov     dword [ebp-18H], eax                    ; 017B _ 89. 45, E8
        mov     eax, dword [ebp+8H]                     ; 017E _ 8B. 45, 08
        mov     dword [ebp-1CH], eax                    ; 0181 _ 89. 45, E4
        mov     eax, dword [ebp+18H]                    ; 0184 _ 8B. 45, 18
        mov     dword [ebp-14H], eax                    ; 0187 _ 89. 45, EC
        mov     dword [ebp-20H], ecx                    ; 018A _ 89. 4D, E0
        mov     dword [ebp-24H], edx                    ; 018D _ 89. 55, DC
        mov     dword [ebp-28H], esi                    ; 0190 _ 89. 75, D8
        mov     byte [ebp-29H], bl                      ; 0193 _ 88. 5D, D7
        mov     dword [ebp-30H], edi                    ; 0196 _ 89. 7D, D0
?_003:  mov     eax, dword [ebp-14H]                    ; 0199 _ 8B. 45, EC
        cmp     eax, dword [ebp+20H]                    ; 019C _ 3B. 45, 20
; Note: Immediate operand could be made smaller by sign extension
        jg      ?_007                                   ; 019F _ 0F 8F, 00000046
        mov     eax, dword [ebp+14H]                    ; 01A5 _ 8B. 45, 14
        mov     dword [ebp-10H], eax                    ; 01A8 _ 89. 45, F0
?_004:  mov     eax, dword [ebp-10H]                    ; 01AB _ 8B. 45, F0
        cmp     eax, dword [ebp+1CH]                    ; 01AE _ 3B. 45, 1C
; Note: Immediate operand could be made smaller by sign extension
        jg      ?_005                                   ; 01B1 _ 0F 8F, 00000021
        mov     al, byte [ebp+10H]                      ; 01B7 _ 8A. 45, 10
        mov     ecx, dword [ebp+8H]                     ; 01BA _ 8B. 4D, 08
        mov     edx, dword [ebp-14H]                    ; 01BD _ 8B. 55, EC
        imul    edx, dword [ebp+0CH]                    ; 01C0 _ 0F AF. 55, 0C
        add     edx, dword [ebp-10H]                    ; 01C4 _ 03. 55, F0
        mov     byte [ecx+edx], al                      ; 01C7 _ 88. 04 11
        mov     eax, dword [ebp-10H]                    ; 01CA _ 8B. 45, F0
        add     eax, 1                                  ; 01CD _ 83. C0, 01
        mov     dword [ebp-10H], eax                    ; 01D0 _ 89. 45, F0
; Note: Immediate operand could be made smaller by sign extension
        jmp     ?_004                                   ; 01D3 _ E9, FFFFFFD3

?_005:
; Note: Immediate operand could be made smaller by sign extension
        jmp     ?_006                                   ; 01D8 _ E9, 00000000

?_006:  mov     eax, dword [ebp-14H]                    ; 01DD _ 8B. 45, EC
        add     eax, 1                                  ; 01E0 _ 83. C0, 01
        mov     dword [ebp-14H], eax                    ; 01E3 _ 89. 45, EC
; Note: Immediate operand could be made smaller by sign extension
        jmp     ?_003                                   ; 01E6 _ E9, FFFFFFAE

?_007:  add     esp, 36                                 ; 01EB _ 83. C4, 24
        pop     esi                                     ; 01EE _ 5E
        pop     edi                                     ; 01EF _ 5F
        pop     ebx                                     ; 01F0 _ 5B
        pop     ebp                                     ; 01F1 _ 5D
        ret                                             ; 01F2 _ C3
; _boxfill8 End of function

; Filling space: 0DH
; Filler type: Multi-byte NOP
;       db 66H, 2EH, 0FH, 1FH, 84H, 00H, 00H, 00H
;       db 00H, 00H, 0FH, 1FH, 00H

ALIGN   16

_set_palette:; Function begin
        push    ebp                                     ; 0200 _ 55
        mov     ebp, esp                                ; 0201 _ 89. E5
        sub     esp, 40                                 ; 0203 _ 83. EC, 28
        mov     eax, dword [ebp+10H]                    ; 0206 _ 8B. 45, 10
        mov     ecx, dword [ebp+0CH]                    ; 0209 _ 8B. 4D, 0C
        mov     edx, dword [ebp+8H]                     ; 020C _ 8B. 55, 08
        mov     dword [ebp-0CH], eax                    ; 020F _ 89. 45, F4
        mov     dword [ebp-10H], ecx                    ; 0212 _ 89. 4D, F0
        mov     dword [ebp-14H], edx                    ; 0215 _ 89. 55, EC
        call    _io_load_eflags                         ; 0218 _ E8, FFFFFDE3(rel)
        mov     dword [ebp-8H], eax                     ; 021D _ 89. 45, F8
        call    _io_cli                                 ; 0220 _ E8, FFFFFDDB(rel)
        mov     eax, dword [ebp+8H]                     ; 0225 _ 8B. 45, 08
        mov     dword [esp], 968                        ; 0228 _ C7. 04 24, 000003C8
        mov     dword [esp+4H], eax                     ; 022F _ 89. 44 24, 04
        call    _io_out8                                ; 0233 _ E8, FFFFFDC8(rel)
        mov     eax, dword [ebp+8H]                     ; 0238 _ 8B. 45, 08
        mov     dword [ebp-4H], eax                     ; 023B _ 89. 45, FC
?_008:  mov     eax, dword [ebp-4H]                     ; 023E _ 8B. 45, FC
        cmp     eax, dword [ebp+0CH]                    ; 0241 _ 3B. 45, 0C
; Note: Immediate operand could be made smaller by sign extension
        jg      ?_009                                   ; 0244 _ 0F 8F, 0000005B
        mov     eax, dword [ebp+10H]                    ; 024A _ 8B. 45, 10
        movzx   eax, byte [eax]                         ; 024D _ 0F B6. 00
        mov     dword [esp], 969                        ; 0250 _ C7. 04 24, 000003C9
        mov     dword [esp+4H], eax                     ; 0257 _ 89. 44 24, 04
        call    _io_out8                                ; 025B _ E8, FFFFFDA0(rel)
        mov     eax, dword [ebp+10H]                    ; 0260 _ 8B. 45, 10
        movzx   eax, byte [eax+1H]                      ; 0263 _ 0F B6. 40, 01
        mov     dword [esp], 969                        ; 0267 _ C7. 04 24, 000003C9
        mov     dword [esp+4H], eax                     ; 026E _ 89. 44 24, 04
        call    _io_out8                                ; 0272 _ E8, FFFFFD89(rel)
        mov     eax, dword [ebp+10H]                    ; 0277 _ 8B. 45, 10
        movzx   eax, byte [eax+2H]                      ; 027A _ 0F B6. 40, 02
        mov     dword [esp], 969                        ; 027E _ C7. 04 24, 000003C9
        mov     dword [esp+4H], eax                     ; 0285 _ 89. 44 24, 04
        call    _io_out8                                ; 0289 _ E8, FFFFFD72(rel)
        mov     eax, dword [ebp+10H]                    ; 028E _ 8B. 45, 10
        add     eax, 3                                  ; 0291 _ 83. C0, 03
        mov     dword [ebp+10H], eax                    ; 0294 _ 89. 45, 10
        mov     eax, dword [ebp-4H]                     ; 0297 _ 8B. 45, FC
        add     eax, 1                                  ; 029A _ 83. C0, 01
        mov     dword [ebp-4H], eax                     ; 029D _ 89. 45, FC
; Note: Immediate operand could be made smaller by sign extension
        jmp     ?_008                                   ; 02A0 _ E9, FFFFFF99

?_009:  mov     eax, dword [ebp-8H]                     ; 02A5 _ 8B. 45, F8
        mov     dword [esp], eax                        ; 02A8 _ 89. 04 24
        call    _io_store_eflags                        ; 02AB _ E8, FFFFFD50(rel)
        add     esp, 40                                 ; 02B0 _ 83. C4, 28
        pop     ebp                                     ; 02B3 _ 5D
        ret                                             ; 02B4 _ C3
; _set_palette End of function


SECTION ._DATA.__data align=1 noexecute                 ; section number 2, data

_init_palette.table_rgb:                                ; byte
        db 00H, 00H, 00H, 0FFH, 00H, 00H, 00H, 0FFH     ; 02B5 _ ........
        db 00H, 0FFH, 0FFH, 00H, 00H, 00H, 0FFH, 0FFH   ; 02BD _ ........
        db 00H, 0FFH, 00H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH ; 02C5 _ ........
        db 0C6H, 0C6H, 0C6H, 84H, 00H, 00H, 00H, 84H    ; 02CD _ ........
        db 00H, 84H, 84H, 00H, 00H, 00H, 84H, 84H       ; 02D5 _ ........
        db 00H, 84H, 00H, 84H, 84H, 84H, 84H, 84H       ; 02DD _ ........


