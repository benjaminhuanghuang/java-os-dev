;global CMain: function
;global init_palette: function
;global set_palette: function

;extern io_store_eflags                                  ; near
;extern io_out8                                          ; near
;extern io_cli                                           ; near
;extern io_load_eflags                                   ; near
;extern io_hlt                                           ; near


;SECTION .text   align=1 execute                         ; section number 1, code

CMain:  ; Function begin
        push    ebp                                     ; 0000 _ 55
        mov     ebp, esp                                ; 0001 _ 89. E5
        sub     esp, 24                                 ; 0003 _ 83. EC, 18
        mov     dword [ebp-10H], 0                      ; 0006 _ C7. 45, F0, 00000000
        call    init_palette                            ; 000D _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], 655360                 ; 0012 _ C7. 45, F4, 000A0000
        jmp     ?_002                                   ; 0019 _ EB, 17

?_001:  mov     eax, dword [ebp-0CH]                    ; 001B _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 001E _ 89. 45, F0
        mov     eax, dword [ebp-0CH]                    ; 0021 _ 8B. 45, F4
        and     eax, 0FH                                ; 0024 _ 83. E0, 0F
        mov     edx, eax                                ; 0027 _ 89. C2
        mov     eax, dword [ebp-10H]                    ; 0029 _ 8B. 45, F0
        mov     byte [eax], dl                          ; 002C _ 88. 10
        add     dword [ebp-0CH], 1                      ; 002E _ 83. 45, F4, 01
?_002:  cmp     dword [ebp-0CH], 720895                 ; 0032 _ 81. 7D, F4, 000AFFFF
        jle     ?_001                                   ; 0039 _ 7E, E0
?_003:  call    io_hlt                                  ; 003B _ E8, FFFFFFFC(rel)
        jmp     ?_003                                   ; 0040 _ EB, F9
; CMain End of function

init_palette:; Function begin
        push    ebp                                     ; 0042 _ 55
        mov     ebp, esp                                ; 0043 _ 89. E5
        sub     esp, 24                                 ; 0045 _ 83. EC, 18
        mov     dword [esp+8H], table_rgb.1721          ; 0048 _ C7. 44 24, 08, 00000000(d)
        mov     dword [esp+4H], 15                      ; 0050 _ C7. 44 24, 04, 0000000F
        mov     dword [esp], 0                          ; 0058 _ C7. 04 24, 00000000
        call    set_palette                             ; 005F _ E8, FFFFFFFC(rel)
        nop                                             ; 0064 _ 90
        leave                                           ; 0065 _ C9
        ret                                             ; 0066 _ C3
; init_palette End of function

set_palette:; Function begin
        push    ebp                                     ; 0067 _ 55
        mov     ebp, esp                                ; 0068 _ 89. E5
        sub     esp, 40                                 ; 006A _ 83. EC, 28
        call    io_load_eflags                          ; 006D _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 0072 _ 89. 45, F0
        call    io_cli                                  ; 0075 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 007A _ 8B. 45, 08
        mov     dword [esp+4H], eax                     ; 007D _ 89. 44 24, 04
        mov     dword [esp], 968                        ; 0081 _ C7. 04 24, 000003C8
        call    io_out8                                 ; 0088 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 008D _ 8B. 45, 08
        mov     dword [ebp-0CH], eax                    ; 0090 _ 89. 45, F4
        jmp     ?_005                                   ; 0093 _ EB, 59

?_004:  mov     eax, dword [ebp+10H]                    ; 0095 _ 8B. 45, 10
        movzx   eax, byte [eax]                         ; 0098 _ 0F B6. 00
        movzx   eax, al                                 ; 009B _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 009E _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 00A2 _ C7. 04 24, 000003C9
        call    io_out8                                 ; 00A9 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 00AE _ 8B. 45, 10
        add     eax, 1                                  ; 00B1 _ 83. C0, 01
        movzx   eax, byte [eax]                         ; 00B4 _ 0F B6. 00
        movzx   eax, al                                 ; 00B7 _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 00BA _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 00BE _ C7. 04 24, 000003C9
        call    io_out8                                 ; 00C5 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 00CA _ 8B. 45, 10
        add     eax, 2                                  ; 00CD _ 83. C0, 02
        movzx   eax, byte [eax]                         ; 00D0 _ 0F B6. 00
        movzx   eax, al                                 ; 00D3 _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 00D6 _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 00DA _ C7. 04 24, 000003C9
        call    io_out8                                 ; 00E1 _ E8, FFFFFFFC(rel)
        add     dword [ebp+10H], 3                      ; 00E6 _ 83. 45, 10, 03
        add     dword [ebp-0CH], 1                      ; 00EA _ 83. 45, F4, 01
?_005:  mov     eax, dword [ebp-0CH]                    ; 00EE _ 8B. 45, F4
        cmp     eax, dword [ebp+0CH]                    ; 00F1 _ 3B. 45, 0C
        jle     ?_004                                   ; 00F4 _ 7E, 9F
        mov     eax, dword [ebp-10H]                    ; 00F6 _ 8B. 45, F0
        mov     dword [esp], eax                        ; 00F9 _ 89. 04 24
        call    io_store_eflags                         ; 00FC _ E8, FFFFFFFC(rel)
        nop                                             ; 0101 _ 90
        leave                                           ; 0102 _ C9
        ret                                             ; 0103 _ C3
; set_palette End of function


;SECTION .data   align=32 noexecute                      ; section number 2, data

table_rgb.1721:                                         ; byte
        db 00H, 00H, 00H, 0FFH, 00H, 00H, 00H, 0FFH     ; 0000 _ ........
        db 00H, 0FFH, 0FFH, 00H, 00H, 00H, 0FFH, 0FFH   ; 0008 _ ........
        db 00H, 0FFH, 00H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH ; 0010 _ ........
        db 0C6H, 0C6H, 0C6H, 84H, 00H, 00H, 00H, 84H    ; 0018 _ ........
        db 00H, 84H, 84H, 00H, 00H, 00H, 84H, 84H       ; 0020 _ ........
        db 00H, 84H, 00H, 84H, 84H, 84H, 84H, 84H       ; 0028 _ ........


;SECTION .bss    align=1 noexecute                       ; section number 3, bss

