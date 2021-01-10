; Disassembly of file: os.o
; Sat Jan  9 18:37:52 2021
; Mode: 32 bits
; Syntax: YASM/NASM
; Instruction set: Pentium Pro






CMain:  ; Function begin
        push    ebp                                     ; 0000 _ 55
        mov     ebp, esp                                ; 0001 _ 89. E5
        push    edi                                     ; 0003 _ 57
        push    esi                                     ; 0004 _ 56
        sub     esp, 576                                ; 0005 _ 81. EC, 00000240
        lea     eax, [ebp-18H]                          ; 000B _ 8D. 45, E8
        mov     dword [esp], eax                        ; 000E _ 89. 04 24
        call    initBootInfo                            ; 0011 _ E8, 0000061A
        lea     eax, [ebp-18H]                          ; 0016 _ 8D. 45, E8
        mov     dword [ebp-1CH], eax                    ; 0019 _ 89. 45, E4
        call    io_sti                                  ; 001C _ E8, FFFFFFFC(rel)
        lea     eax, [ebp-164H]                         ; 0021 _ 8D. 85, FFFFFE9C
        lea     ecx, [keyfifo]                          ; 0027 _ 8D. 0D, 00000000(d)
        mov     dword [esp], ecx                        ; 002D _ 89. 0C 24
        mov     dword [esp+4H], 32                      ; 0030 _ C7. 44 24, 04, 00000020
        mov     dword [esp+8H], eax                     ; 0038 _ 89. 44 24, 08
        call    fifo8_init                              ; 003C _ E8, 0000061F
        lea     eax, [ebp-1E4H]                         ; 0041 _ 8D. 85, FFFFFE1C
        lea     ecx, [mousefifo]                        ; 0047 _ 8D. 0D, 00000018(d)
        mov     dword [esp], ecx                        ; 004D _ 89. 0C 24
        mov     dword [esp+4H], 128                     ; 0050 _ C7. 44 24, 04, 00000080
        mov     dword [esp+8H], eax                     ; 0058 _ 89. 44 24, 08
        call    fifo8_init                              ; 005C _ E8, 000005FF
        call    init_keyboard                           ; 0061 _ E8, 0000065A
        lea     eax, [mdec]                             ; 0066 _ 8D. 05, 00000030(d)
        mov     dword [esp], eax                        ; 006C _ 89. 04 24
        call    enable_mouse                            ; 006F _ E8, 0000068C
        mov     eax, dword [memman]                     ; 0074 _ A1, 00000000(d)
        mov     dword [esp], eax                        ; 0079 _ 89. 04 24
        call    memman_init                             ; 007C _ E8, 000006CF
        mov     eax, dword [memman]                     ; 0081 _ A1, 00000000(d)
        mov     dword [esp], eax                        ; 0086 _ 89. 04 24
        mov     dword [esp+4H], 1081344                 ; 0089 _ C7. 44 24, 04, 00108000
        mov     dword [esp+8H], 1072594944              ; 0091 _ C7. 44 24, 08, 3FEE8000
        call    memman_free                             ; 0099 _ E8, 000006F2
        mov     dword [ebp-210H], eax                   ; 009E _ 89. 85, FFFFFDF0
        call    init_palette                            ; 00A4 _ E8, 00000907
        mov     eax, dword [memman]                     ; 00A9 _ A1, 00000000(d)
        mov     ecx, dword [ebp-1CH]                    ; 00AE _ 8B. 4D, E4
        mov     ecx, dword [ecx]                        ; 00B1 _ 8B. 09
        mov     edx, dword [ebp-1CH]                    ; 00B3 _ 8B. 55, E4
        mov     edx, dword [edx+4H]                     ; 00B6 _ 8B. 52, 04
        mov     esi, dword [ebp-1CH]                    ; 00B9 _ 8B. 75, E4
        mov     esi, dword [esi+8H]                     ; 00BC _ 8B. 76, 08
        mov     dword [esp], eax                        ; 00BF _ 89. 04 24
        mov     dword [esp+4H], ecx                     ; 00C2 _ 89. 4C 24, 04
        mov     dword [esp+8H], edx                     ; 00C6 _ 89. 54 24, 08
        mov     dword [esp+0CH], esi                    ; 00CA _ 89. 74 24, 0C
        call    shtctl_init                             ; 00CE _ E8, 0000090D
        mov     dword [CMain.shtctl], eax               ; 00D3 _ A3, 00000040(d)
        mov     eax, dword [memman]                     ; 00D8 _ A1, 00000000(d)
        mov     ecx, dword [ebp-1CH]                    ; 00DD _ 8B. 4D, E4
        mov     ecx, dword [ecx+4H]                     ; 00E0 _ 8B. 49, 04
        mov     edx, dword [ebp-1CH]                    ; 00E3 _ 8B. 55, E4
        imul    ecx, dword [edx+8H]                     ; 00E6 _ 0F AF. 4A, 08
        mov     dword [esp], eax                        ; 00EA _ 89. 04 24
        mov     dword [esp+4H], ecx                     ; 00ED _ 89. 4C 24, 04
        call    memman_alloc_4k                         ; 00F1 _ E8, 000009AA
        mov     dword [ebp-1F8H], eax                   ; 00F6 _ 89. 85, FFFFFE08
        mov     eax, dword [CMain.shtctl]               ; 00FC _ A1, 00000040(d)
        mov     dword [esp], eax                        ; 0101 _ 89. 04 24
        call    sheet_alloc                             ; 0104 _ E8, 000009E7
        mov     dword [ebp-1FCH], eax                   ; 0109 _ 89. 85, FFFFFE04
        mov     eax, dword [ebp-1FCH]                   ; 010F _ 8B. 85, FFFFFE04
        mov     ecx, dword [ebp-1F8H]                   ; 0115 _ 8B. 8D, FFFFFE08
        mov     edx, dword [ebp-1CH]                    ; 011B _ 8B. 55, E4
        mov     edx, dword [edx+4H]                     ; 011E _ 8B. 52, 04
        mov     esi, dword [ebp-1CH]                    ; 0121 _ 8B. 75, E4
        mov     esi, dword [esi+8H]                     ; 0124 _ 8B. 76, 08
        mov     dword [esp], eax                        ; 0127 _ 89. 04 24
        mov     dword [esp+4H], ecx                     ; 012A _ 89. 4C 24, 04
        mov     dword [esp+8H], edx                     ; 012E _ 89. 54 24, 08
        mov     dword [esp+0CH], esi                    ; 0132 _ 89. 74 24, 0C
        mov     dword [esp+10H], 99                     ; 0136 _ C7. 44 24, 10, 00000063
        call    sheet_setbuf                            ; 013E _ E8, 00000A4D
        mov     eax, dword [ebp-1F8H]                   ; 0143 _ 8B. 85, FFFFFE08
        mov     ecx, dword [ebp-1CH]                    ; 0149 _ 8B. 4D, E4
        mov     ecx, dword [ecx+4H]                     ; 014C _ 8B. 49, 04
        mov     edx, dword [ebp-1CH]                    ; 014F _ 8B. 55, E4
        mov     edx, dword [edx+8H]                     ; 0152 _ 8B. 52, 08
        mov     dword [esp], eax                        ; 0155 _ 89. 04 24
        mov     dword [esp+4H], ecx                     ; 0158 _ 89. 4C 24, 04
        mov     dword [esp+8H], edx                     ; 015C _ 89. 54 24, 08
        call    draw_desktop                            ; 0160 _ E8, 00000A8B
        xor     eax, eax                                ; 0165 _ 31. C0
        mov     ecx, dword [CMain.shtctl]               ; 0167 _ 8B. 0D, 00000040(d)
        mov     edx, dword [ebp-1FCH]                   ; 016D _ 8B. 95, FFFFFE04
        mov     dword [esp], ecx                        ; 0173 _ 89. 0C 24
        mov     dword [esp+4H], edx                     ; 0176 _ 89. 54 24, 04
        mov     dword [esp+8H], 0                       ; 017A _ C7. 44 24, 08, 00000000
        mov     dword [esp+0CH], 0                      ; 0182 _ C7. 44 24, 0C, 00000000
        mov     dword [ebp-214H], eax                   ; 018A _ 89. 85, FFFFFDEC
        call    sheet_slide                             ; 0190 _ E8, 00000E2B
        mov     eax, dword [CMain.shtctl]               ; 0195 _ A1, 00000040(d)
        mov     dword [esp], eax                        ; 019A _ 89. 04 24
        call    sheet_alloc                             ; 019D _ E8, 0000094E
        mov     dword [ebp-200H], eax                   ; 01A2 _ 89. 85, FFFFFE00
        mov     eax, dword [ebp-200H]                   ; 01A8 _ 8B. 85, FFFFFE00
        mov     dword [esp], eax                        ; 01AE _ 89. 04 24
        lea     eax, [CMain.buf_mouse]                  ; 01B1 _ 8D. 05, 00000044(d)
        mov     dword [esp+4H], eax                     ; 01B7 _ 89. 44 24, 04
        mov     dword [esp+8H], 16                      ; 01BB _ C7. 44 24, 08, 00000010
        mov     dword [esp+0CH], 16                     ; 01C3 _ C7. 44 24, 0C, 00000010
        mov     dword [esp+10H], 99                     ; 01CB _ C7. 44 24, 10, 00000063
        call    sheet_setbuf                            ; 01D3 _ E8, 000009B8
        lea     eax, [CMain.buf_mouse]                  ; 01D8 _ 8D. 05, 00000044(d)
        mov     dword [esp], eax                        ; 01DE _ 89. 04 24
        mov     dword [esp+4H], 99                      ; 01E1 _ C7. 44 24, 04, 00000063
        call    init_mouse_cursor                       ; 01E9 _ E8, 00000E92
        mov     eax, dword [ebp-1CH]                    ; 01EE _ 8B. 45, E4
        mov     eax, dword [eax+4H]                     ; 01F1 _ 8B. 40, 04
        sub     eax, 16                                 ; 01F4 _ 83. E8, 10
        cdq                                             ; 01F7 _ 99
        mov     ecx, 2                                  ; 01F8 _ B9, 00000002
        idiv    ecx                                     ; 01FD _ F7. F9
        mov     dword [ebp-1E8H], eax                   ; 01FF _ 89. 85, FFFFFE18
        mov     eax, dword [ebp-1CH]                    ; 0205 _ 8B. 45, E4
        mov     eax, dword [eax+8H]                     ; 0208 _ 8B. 40, 08
        sub     eax, 28                                 ; 020B _ 83. E8, 1C
        sub     eax, 16                                 ; 020E _ 83. E8, 10
        cdq                                             ; 0211 _ 99
        idiv    ecx                                     ; 0212 _ F7. F9
        mov     dword [ebp-1ECH], eax                   ; 0214 _ 89. 85, FFFFFE14
        mov     eax, dword [CMain.shtctl]               ; 021A _ A1, 00000040(d)
        mov     ecx, dword [ebp-200H]                   ; 021F _ 8B. 8D, FFFFFE00
        mov     esi, dword [ebp-1E8H]                   ; 0225 _ 8B. B5, FFFFFE18
        mov     edi, dword [ebp-1ECH]                   ; 022B _ 8B. BD, FFFFFE14
        mov     dword [esp], eax                        ; 0231 _ 89. 04 24
        mov     dword [esp+4H], ecx                     ; 0234 _ 89. 4C 24, 04
        mov     dword [esp+8H], esi                     ; 0238 _ 89. 74 24, 08
        mov     dword [esp+0CH], edi                    ; 023C _ 89. 7C 24, 0C
        call    sheet_slide                             ; 0240 _ E8, 00000D7B
        mov     eax, dword [memman]                     ; 0245 _ A1, 00000000(d)
        mov     dword [esp], eax                        ; 024A _ 89. 04 24
        mov     dword [esp+4H], 8320                    ; 024D _ C7. 44 24, 04, 00002080
        call    memman_alloc_4k                         ; 0255 _ E8, 00000846
        mov     dword [ebp-204H], eax                   ; 025A _ 89. 85, FFFFFDFC
        mov     eax, dword [CMain.shtctl]               ; 0260 _ A1, 00000040(d)
        mov     dword [esp], eax                        ; 0265 _ 89. 04 24
        call    sheet_alloc                             ; 0268 _ E8, 00000883
        mov     dword [sht_win], eax                    ; 026D _ A3, 00000144(d)
        mov     eax, dword [sht_win]                    ; 0272 _ A1, 00000144(d)
        mov     ecx, dword [ebp-204H]                   ; 0277 _ 8B. 8D, FFFFFDFC
        mov     dword [esp], eax                        ; 027D _ 89. 04 24
        mov     dword [esp+4H], ecx                     ; 0280 _ 89. 4C 24, 04
        mov     dword [esp+8H], 160                     ; 0284 _ C7. 44 24, 08, 000000A0
        mov     dword [esp+0CH], 52                     ; 028C _ C7. 44 24, 0C, 00000034
        mov     dword [esp+10H], -1                     ; 0294 _ C7. 44 24, 10, FFFFFFFF
        call    sheet_setbuf                            ; 029C _ E8, 000008EF
        mov     eax, dword [ebp-204H]                   ; 02A1 _ 8B. 85, FFFFFDFC
        mov     dword [esp], eax                        ; 02A7 _ 89. 04 24
        mov     dword [esp+4H], 160                     ; 02AA _ C7. 44 24, 04, 000000A0
        mov     dword [esp+8H], 52                      ; 02B2 _ C7. 44 24, 08, 00000034
        lea     eax, [CMain.win_title]                  ; 02BA _ 8D. 05, 00000004(d)
        mov     dword [esp+0CH], eax                    ; 02C0 _ 89. 44 24, 0C
        call    draw_window                             ; 02C4 _ E8, 00000EA7
        mov     eax, dword [CMain.shtctl]               ; 02C9 _ A1, 00000040(d)
        mov     ecx, dword [sht_win]                    ; 02CE _ 8B. 0D, 00000144(d)
        mov     dword [esp], eax                        ; 02D4 _ 89. 04 24
        mov     dword [esp+4H], ecx                     ; 02D7 _ 89. 4C 24, 04
        mov     dword [esp+8H], 80                      ; 02DB _ C7. 44 24, 08, 00000050
        mov     dword [esp+0CH], 72                     ; 02E3 _ C7. 44 24, 0C, 00000048
        call    sheet_slide                             ; 02EB _ E8, 00000CD0
        xor     eax, eax                                ; 02F0 _ 31. C0
        mov     ecx, dword [CMain.shtctl]               ; 02F2 _ 8B. 0D, 00000040(d)
        mov     esi, dword [ebp-1FCH]                   ; 02F8 _ 8B. B5, FFFFFE04
        mov     dword [esp], ecx                        ; 02FE _ 89. 0C 24
        mov     dword [esp+4H], esi                     ; 0301 _ 89. 74 24, 04
        mov     dword [esp+8H], 0                       ; 0305 _ C7. 44 24, 08, 00000000
        mov     dword [ebp-218H], eax                   ; 030D _ 89. 85, FFFFFDE8
        call    sheet_updown                            ; 0313 _ E8, 00001208
        mov     eax, dword [CMain.shtctl]               ; 0318 _ A1, 00000040(d)
        mov     ecx, dword [sht_win]                    ; 031D _ 8B. 0D, 00000144(d)
        mov     dword [esp], eax                        ; 0323 _ 89. 04 24
        mov     dword [esp+4H], ecx                     ; 0326 _ 89. 4C 24, 04
        mov     dword [esp+8H], 1                       ; 032A _ C7. 44 24, 08, 00000001
        call    sheet_updown                            ; 0332 _ E8, 000011E9
        mov     eax, dword [CMain.shtctl]               ; 0337 _ A1, 00000040(d)
        mov     ecx, dword [ebp-200H]                   ; 033C _ 8B. 8D, FFFFFE00
        mov     dword [esp], eax                        ; 0342 _ 89. 04 24
        mov     dword [esp+4H], ecx                     ; 0345 _ 89. 4C 24, 04
        mov     dword [esp+8H], 2                       ; 0349 _ C7. 44 24, 08, 00000002
        call    sheet_updown                            ; 0351 _ E8, 000011CA
        xor     eax, eax                                ; 0356 _ 31. C0
        mov     ecx, dword [CMain.shtctl]               ; 0358 _ 8B. 0D, 00000040(d)
        mov     esi, dword [ebp-1FCH]                   ; 035E _ 8B. B5, FFFFFE04
        mov     dword [esp], ecx                        ; 0364 _ 89. 0C 24
        mov     dword [esp+4H], esi                     ; 0367 _ 89. 74 24, 04
        mov     dword [esp+8H], 0                       ; 036B _ C7. 44 24, 08, 00000000
        mov     dword [esp+0CH], 0                      ; 0373 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+10H], 320                    ; 037B _ C7. 44 24, 10, 00000140
        mov     dword [esp+14H], 48                     ; 0383 _ C7. 44 24, 14, 00000030
        mov     dword [ebp-21CH], eax                   ; 038B _ 89. 85, FFFFFDE4
        call    sheet_refresh                           ; 0391 _ E8, 0000142A
        mov     dword [ebp-208H], 0                     ; 0396 _ C7. 85, FFFFFDF8, 00000000
        mov     dword [ebp-220H], eax                   ; 03A0 _ 89. 85, FFFFFDE0
?_001:  mov     eax, dword [CMain.counter]              ; 03A6 _ A1, 00000148(d)
        add     eax, 1                                  ; 03AB _ 83. C0, 01
        mov     dword [CMain.counter], eax              ; 03AE _ A3, 00000148(d)
        mov     eax, dword [CMain.counter]              ; 03B3 _ A1, 00000148(d)
        mov     dword [esp], eax                        ; 03B8 _ 89. 04 24
        call    intToHexStr                             ; 03BB _ E8, 00001490
        mov     dword [ebp-20CH], eax                   ; 03C0 _ 89. 85, FFFFFDF4
        mov     eax, dword [ebp-204H]                   ; 03C6 _ 8B. 85, FFFFFDFC
        mov     dword [esp], eax                        ; 03CC _ 89. 04 24
        mov     dword [esp+4H], 160                     ; 03CF _ C7. 44 24, 04, 000000A0
        mov     dword [esp+8H], 8                       ; 03D7 _ C7. 44 24, 08, 00000008
        mov     dword [esp+0CH], 40                     ; 03DF _ C7. 44 24, 0C, 00000028
        mov     dword [esp+10H], 28                     ; 03E7 _ C7. 44 24, 10, 0000001C
        mov     dword [esp+14H], 119                    ; 03EF _ C7. 44 24, 14, 00000077
        mov     dword [esp+18H], 43                     ; 03F7 _ C7. 44 24, 18, 0000002B
        call    boxfill8                                ; 03FF _ E8, 0000152C
        xor     eax, eax                                ; 0404 _ 31. C0
        mov     ecx, dword [ebp-204H]                   ; 0406 _ 8B. 8D, FFFFFDFC
        mov     edx, dword [ebp-20CH]                   ; 040C _ 8B. 95, FFFFFDF4
        mov     dword [esp], ecx                        ; 0412 _ 89. 0C 24
        mov     dword [esp+4H], 160                     ; 0415 _ C7. 44 24, 04, 000000A0
        mov     dword [esp+8H], 40                      ; 041D _ C7. 44 24, 08, 00000028
        mov     dword [esp+0CH], 28                     ; 0425 _ C7. 44 24, 0C, 0000001C
        mov     dword [esp+10H], 0                      ; 042D _ C7. 44 24, 10, 00000000
        mov     dword [esp+14H], edx                    ; 0435 _ 89. 54 24, 14
        mov     dword [ebp-224H], eax                   ; 0439 _ 89. 85, FFFFFDDC
        call    showString                              ; 043F _ E8, 0000158C
        mov     eax, dword [CMain.shtctl]               ; 0444 _ A1, 00000040(d)
        mov     ecx, dword [sht_win]                    ; 0449 _ 8B. 0D, 00000144(d)
        mov     dword [esp], eax                        ; 044F _ 89. 04 24
        mov     dword [esp+4H], ecx                     ; 0452 _ 89. 4C 24, 04
        mov     dword [esp+8H], 40                      ; 0456 _ C7. 44 24, 08, 00000028
        mov     dword [esp+0CH], 28                     ; 045E _ C7. 44 24, 0C, 0000001C
        mov     dword [esp+10H], 119                    ; 0466 _ C7. 44 24, 10, 00000077
        mov     dword [esp+14H], 43                     ; 046E _ C7. 44 24, 14, 0000002B
        call    sheet_refresh                           ; 0476 _ E8, 00001345
        mov     dword [ebp-228H], eax                   ; 047B _ 89. 85, FFFFFDD8
        call    io_cli                                  ; 0481 _ E8, FFFFFFFC(rel)
        lea     eax, [keyfifo]                          ; 0486 _ 8D. 05, 00000000(d)
        mov     dword [esp], eax                        ; 048C _ 89. 04 24
        call    fifo8_status                            ; 048F _ E8, 000015DC
        lea     ecx, [mousefifo]                        ; 0494 _ 8D. 0D, 00000018(d)
        mov     dword [esp], ecx                        ; 049A _ 89. 0C 24
        mov     dword [ebp-22CH], eax                   ; 049D _ 89. 85, FFFFFDD4
        call    fifo8_status                            ; 04A3 _ E8, 000015C8
        mov     ecx, dword [ebp-22CH]                   ; 04A8 _ 8B. 8D, FFFFFDD4
        add     ecx, eax                                ; 04AE _ 01. C1
        cmp     ecx, 0                                  ; 04B0 _ 83. F9, 00
; Note: Immediate operand could be made smaller by sign extension
        jne     ?_002                                   ; 04B3 _ 0F 85, 0000000A
        call    io_stihlt                               ; 04B9 _ E8, FFFFFFFC(rel)
        jmp     ?_011                                   ; 04BE _ E9, 00000161

?_002:  lea     eax, [keyfifo]                          ; 04C3 _ 8D. 05, 00000000(d)
        mov     dword [esp], eax                        ; 04C9 _ 89. 04 24
        call    fifo8_status                            ; 04CC _ E8, 0000159F
        cmp     eax, 0                                  ; 04D1 _ 83. F8, 00
; Note: Immediate operand could be made smaller by sign extension
        je      ?_003                                   ; 04D4 _ 0F 84, 0000001E
        call    io_sti                                  ; 04DA _ E8, FFFFFFFC(rel)
        lea     eax, [keyfifo]                          ; 04DF _ 8D. 05, 00000000(d)
        mov     dword [esp], eax                        ; 04E5 _ 89. 04 24
        call    fifo8_get                               ; 04E8 _ E8, 000015A3
        mov     dword [ebp-208H], eax                   ; 04ED _ 89. 85, FFFFFDF8
        jmp     ?_010                                   ; 04F3 _ E9, 00000127

?_003:  lea     eax, [mousefifo]                        ; 04F8 _ 8D. 05, 00000018(d)
        mov     dword [esp], eax                        ; 04FE _ 89. 04 24
        call    fifo8_status                            ; 0501 _ E8, 0000156A
        cmp     eax, 0                                  ; 0506 _ 83. F8, 00
        je      ?_009                                   ; 0509 _ 0F 84, 0000010B
        lea     eax, [mousefifo]                        ; 050F _ 8D. 05, 00000018(d)
        mov     dword [esp], eax                        ; 0515 _ 89. 04 24
        call    fifo8_get                               ; 0518 _ E8, 00001573
        mov     dword [ebp-208H], eax                   ; 051D _ 89. 85, FFFFFDF8
        call    io_sti                                  ; 0523 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-208H]                   ; 0528 _ 8B. 85, FFFFFDF8
        mov     cl, al                                  ; 052E _ 88. C1
        lea     eax, [mdec]                             ; 0530 _ 8D. 05, 00000030(d)
        mov     dword [esp], eax                        ; 0536 _ 89. 04 24
        movzx   eax, cl                                 ; 0539 _ 0F B6. C1
        mov     dword [esp+4H], eax                     ; 053C _ 89. 44 24, 04
        call    mouse_decode                            ; 0540 _ E8, 000015CB
        cmp     eax, 0                                  ; 0545 _ 83. F8, 00
        je      ?_008                                   ; 0548 _ 0F 84, 000000C7
        mov     eax, dword [?_148]                      ; 054E _ A1, 00000034(d)
        add     eax, dword [ebp-1E8H]                   ; 0553 _ 03. 85, FFFFFE18
        mov     dword [ebp-1E8H], eax                   ; 0559 _ 89. 85, FFFFFE18
        mov     eax, dword [?_149]                      ; 055F _ A1, 00000038(d)
        add     eax, dword [ebp-1ECH]                   ; 0564 _ 03. 85, FFFFFE14
        mov     dword [ebp-1ECH], eax                   ; 056A _ 89. 85, FFFFFE14
        cmp     dword [ebp-1E8H], 0                     ; 0570 _ 83. BD, FFFFFE18, 00
; Note: Immediate operand could be made smaller by sign extension
        jge     ?_004                                   ; 0577 _ 0F 8D, 0000000A
        mov     dword [ebp-1E8H], 0                     ; 057D _ C7. 85, FFFFFE18, 00000000
?_004:  cmp     dword [ebp-1ECH], 0                     ; 0587 _ 83. BD, FFFFFE14, 00
; Note: Immediate operand could be made smaller by sign extension
        jge     ?_005                                   ; 058E _ 0F 8D, 0000000A
        mov     dword [ebp-1ECH], 0                     ; 0594 _ C7. 85, FFFFFE14, 00000000
?_005:  mov     eax, dword [ebp-1E8H]                   ; 059E _ 8B. 85, FFFFFE18
        mov     ecx, dword [ebp-1CH]                    ; 05A4 _ 8B. 4D, E4
        mov     ecx, dword [ecx+4H]                     ; 05A7 _ 8B. 49, 04
        sub     ecx, 16                                 ; 05AA _ 83. E9, 10
        cmp     eax, ecx                                ; 05AD _ 39. C8
; Note: Immediate operand could be made smaller by sign extension
        jle     ?_006                                   ; 05AF _ 0F 8E, 0000000F
        mov     eax, dword [ebp-1CH]                    ; 05B5 _ 8B. 45, E4
        mov     eax, dword [eax+4H]                     ; 05B8 _ 8B. 40, 04
        sub     eax, 16                                 ; 05BB _ 83. E8, 10
        mov     dword [ebp-1E8H], eax                   ; 05BE _ 89. 85, FFFFFE18
?_006:  mov     eax, dword [ebp-1ECH]                   ; 05C4 _ 8B. 85, FFFFFE14
        mov     ecx, dword [ebp-1CH]                    ; 05CA _ 8B. 4D, E4
        mov     ecx, dword [ecx+8H]                     ; 05CD _ 8B. 49, 08
        sub     ecx, 16                                 ; 05D0 _ 83. E9, 10
        cmp     eax, ecx                                ; 05D3 _ 39. C8
; Note: Immediate operand could be made smaller by sign extension
        jle     ?_007                                   ; 05D5 _ 0F 8E, 0000000F
        mov     eax, dword [ebp-1CH]                    ; 05DB _ 8B. 45, E4
        mov     eax, dword [eax+8H]                     ; 05DE _ 8B. 40, 08
        sub     eax, 16                                 ; 05E1 _ 83. E8, 10
        mov     dword [ebp-1ECH], eax                   ; 05E4 _ 89. 85, FFFFFE14
?_007:  mov     eax, dword [CMain.shtctl]               ; 05EA _ A1, 00000040(d)
        mov     ecx, dword [ebp-200H]                   ; 05EF _ 8B. 8D, FFFFFE00
        mov     edx, dword [ebp-1E8H]                   ; 05F5 _ 8B. 95, FFFFFE18
        mov     esi, dword [ebp-1ECH]                   ; 05FB _ 8B. B5, FFFFFE14
        mov     dword [esp], eax                        ; 0601 _ 89. 04 24
        mov     dword [esp+4H], ecx                     ; 0604 _ 89. 4C 24, 04
        mov     dword [esp+8H], edx                     ; 0608 _ 89. 54 24, 08
        mov     dword [esp+0CH], esi                    ; 060C _ 89. 74 24, 0C
        call    sheet_slide                             ; 0610 _ E8, 000009AB
?_008:
; Note: Immediate operand could be made smaller by sign extension
        jmp     ?_009                                   ; 0615 _ E9, 00000000

?_009:
; Note: Immediate operand could be made smaller by sign extension
        jmp     ?_010                                   ; 061A _ E9, 00000000

?_010:
; Note: Immediate operand could be made smaller by sign extension
        jmp     ?_011                                   ; 061F _ E9, 00000000

?_011:  jmp     ?_001                                   ; 0624 _ E9, FFFFFD7D
; CMain End of function

; Filling space: 7H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 80H, 00H, 00H, 00H, 00H

ALIGN   8

initBootInfo:; Function begin
        push    ebp                                     ; 0630 _ 55
        mov     ebp, esp                                ; 0631 _ 89. E5
        push    eax                                     ; 0633 _ 50
        mov     eax, dword [ebp+8H]                     ; 0634 _ 8B. 45, 08
        mov     ecx, dword [ebp+8H]                     ; 0637 _ 8B. 4D, 08
        mov     edx, 655360                             ; 063A _ BA, 000A0000
        mov     dword [ecx], edx                        ; 063F _ 89. 11
        mov     ecx, dword [ebp+8H]                     ; 0641 _ 8B. 4D, 08
        mov     dword [ecx+4H], 320                     ; 0644 _ C7. 41, 04, 00000140
        mov     ecx, dword [ebp+8H]                     ; 064B _ 8B. 4D, 08
        mov     dword [ecx+8H], 200                     ; 064E _ C7. 41, 08, 000000C8
        mov     dword [ebp-4H], eax                     ; 0655 _ 89. 45, FC
        add     esp, 4                                  ; 0658 _ 83. C4, 04
        pop     ebp                                     ; 065B _ 5D
        ret                                             ; 065C _ C3
; initBootInfo End of function

; Filling space: 3H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 00H

ALIGN   8

fifo8_init:; Function begin
        push    ebp                                     ; 0660 _ 55
        mov     ebp, esp                                ; 0661 _ 89. E5
        push    edi                                     ; 0663 _ 57
        push    esi                                     ; 0664 _ 56
        sub     esp, 12                                 ; 0665 _ 83. EC, 0C
        mov     eax, dword [ebp+10H]                    ; 0668 _ 8B. 45, 10
        mov     ecx, dword [ebp+0CH]                    ; 066B _ 8B. 4D, 0C
        mov     edx, dword [ebp+8H]                     ; 066E _ 8B. 55, 08
        mov     esi, dword [ebp+0CH]                    ; 0671 _ 8B. 75, 0C
        mov     edi, dword [ebp+8H]                     ; 0674 _ 8B. 7D, 08
        mov     dword [edi+0CH], esi                    ; 0677 _ 89. 77, 0C
        mov     esi, dword [ebp+10H]                    ; 067A _ 8B. 75, 10
        mov     edi, dword [ebp+8H]                     ; 067D _ 8B. 7D, 08
        mov     dword [edi], esi                        ; 0680 _ 89. 37
        mov     esi, dword [ebp+0CH]                    ; 0682 _ 8B. 75, 0C
        mov     edi, dword [ebp+8H]                     ; 0685 _ 8B. 7D, 08
        mov     dword [edi+10H], esi                    ; 0688 _ 89. 77, 10
        mov     esi, dword [ebp+8H]                     ; 068B _ 8B. 75, 08
        mov     dword [esi+14H], 0                      ; 068E _ C7. 46, 14, 00000000
        mov     esi, dword [ebp+8H]                     ; 0695 _ 8B. 75, 08
        mov     dword [esi+4H], 0                       ; 0698 _ C7. 46, 04, 00000000
        mov     esi, dword [ebp+8H]                     ; 069F _ 8B. 75, 08
        mov     dword [esi+8H], 0                       ; 06A2 _ C7. 46, 08, 00000000
        mov     dword [ebp-0CH], eax                    ; 06A9 _ 89. 45, F4
        mov     dword [ebp-10H], ecx                    ; 06AC _ 89. 4D, F0
        mov     dword [ebp-14H], edx                    ; 06AF _ 89. 55, EC
        add     esp, 12                                 ; 06B2 _ 83. C4, 0C
        pop     esi                                     ; 06B5 _ 5E
        pop     edi                                     ; 06B6 _ 5F
        pop     ebp                                     ; 06B7 _ 5D
        ret                                             ; 06B8 _ C3
; fifo8_init End of function

; Filling space: 7H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 80H, 00H, 00H, 00H, 00H

ALIGN   8

init_keyboard:; Function begin
        push    ebp                                     ; 06C0 _ 55
        mov     ebp, esp                                ; 06C1 _ 89. E5
        sub     esp, 8                                  ; 06C3 _ 83. EC, 08
        call    wait_KBC_sendready                      ; 06C6 _ E8, 00001A15
        mov     dword [esp], 100                        ; 06CB _ C7. 04 24, 00000064
        mov     dword [esp+4H], 96                      ; 06D2 _ C7. 44 24, 04, 00000060
        call    io_out8                                 ; 06DA _ E8, FFFFFFFC(rel)
        call    wait_KBC_sendready                      ; 06DF _ E8, 000019FC
        mov     dword [esp], 96                         ; 06E4 _ C7. 04 24, 00000060
        mov     dword [esp+4H], 71                      ; 06EB _ C7. 44 24, 04, 00000047
        call    io_out8                                 ; 06F3 _ E8, FFFFFFFC(rel)
        add     esp, 8                                  ; 06F8 _ 83. C4, 08
        pop     ebp                                     ; 06FB _ 5D
        ret                                             ; 06FC _ C3
; init_keyboard End of function

; Filling space: 3H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 00H

ALIGN   8

enable_mouse:; Function begin
        push    ebp                                     ; 0700 _ 55
        mov     ebp, esp                                ; 0701 _ 89. E5
        sub     esp, 24                                 ; 0703 _ 83. EC, 18
        mov     eax, dword [ebp+8H]                     ; 0706 _ 8B. 45, 08
        mov     dword [ebp-4H], eax                     ; 0709 _ 89. 45, FC
        call    wait_KBC_sendready                      ; 070C _ E8, 000019CF
        mov     dword [esp], 100                        ; 0711 _ C7. 04 24, 00000064
        mov     dword [esp+4H], 212                     ; 0718 _ C7. 44 24, 04, 000000D4
        call    io_out8                                 ; 0720 _ E8, FFFFFFFC(rel)
        call    wait_KBC_sendready                      ; 0725 _ E8, 000019B6
        mov     dword [esp], 96                         ; 072A _ C7. 04 24, 00000060
        mov     dword [esp+4H], 244                     ; 0731 _ C7. 44 24, 04, 000000F4
        call    io_out8                                 ; 0739 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 073E _ 8B. 45, 08
        mov     byte [eax+3H], 0                        ; 0741 _ C6. 40, 03, 00
        add     esp, 24                                 ; 0745 _ 83. C4, 18
        pop     ebp                                     ; 0748 _ 5D
        ret                                             ; 0749 _ C3
; enable_mouse End of function

; Filling space: 6H
; Filler type: Multi-byte NOP
;       db 66H, 0FH, 1FH, 44H, 00H, 00H

ALIGN   8

memman_init:; Function begin
        push    ebp                                     ; 0750 _ 55
        mov     ebp, esp                                ; 0751 _ 89. E5
        push    eax                                     ; 0753 _ 50
        mov     eax, dword [ebp+8H]                     ; 0754 _ 8B. 45, 08
        mov     ecx, dword [ebp+8H]                     ; 0757 _ 8B. 4D, 08
        mov     dword [ecx], 0                          ; 075A _ C7. 01, 00000000
        mov     ecx, dword [ebp+8H]                     ; 0760 _ 8B. 4D, 08
        mov     dword [ecx+4H], 0                       ; 0763 _ C7. 41, 04, 00000000
        mov     ecx, dword [ebp+8H]                     ; 076A _ 8B. 4D, 08
        mov     dword [ecx+8H], 0                       ; 076D _ C7. 41, 08, 00000000
        mov     ecx, dword [ebp+8H]                     ; 0774 _ 8B. 4D, 08
        mov     dword [ecx+0CH], 0                      ; 0777 _ C7. 41, 0C, 00000000
        mov     dword [ebp-4H], eax                     ; 077E _ 89. 45, FC
        add     esp, 4                                  ; 0781 _ 83. C4, 04
        pop     ebp                                     ; 0784 _ 5D
        ret                                             ; 0785 _ C3
; memman_init End of function

; Filling space: 0AH
; Filler type: Multi-byte NOP
;       db 66H, 2EH, 0FH, 1FH, 84H, 00H, 00H, 00H
;       db 00H, 00H

ALIGN   16

memman_free:; Function begin
        push    ebp                                     ; 0790 _ 55
        mov     ebp, esp                                ; 0791 _ 89. E5
        push    edi                                     ; 0793 _ 57
        push    esi                                     ; 0794 _ 56
        sub     esp, 24                                 ; 0795 _ 83. EC, 18
        mov     eax, dword [ebp+10H]                    ; 0798 _ 8B. 45, 10
        mov     ecx, dword [ebp+0CH]                    ; 079B _ 8B. 4D, 0C
        mov     edx, dword [ebp+8H]                     ; 079E _ 8B. 55, 08
        mov     dword [ebp-10H], 0                      ; 07A1 _ C7. 45, F0, 00000000
        mov     dword [ebp-18H], eax                    ; 07A8 _ 89. 45, E8
        mov     dword [ebp-1CH], ecx                    ; 07AB _ 89. 4D, E4
        mov     dword [ebp-20H], edx                    ; 07AE _ 89. 55, E0
?_012:  mov     eax, dword [ebp-10H]                    ; 07B1 _ 8B. 45, F0
        mov     ecx, dword [ebp+8H]                     ; 07B4 _ 8B. 4D, 08
        cmp     eax, dword [ecx]                        ; 07B7 _ 3B. 01
; Note: Immediate operand could be made smaller by sign extension
        jge     ?_015                                   ; 07B9 _ 0F 8D, 0000002B
        mov     eax, dword [ebp+8H]                     ; 07BF _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 07C2 _ 8B. 4D, F0
        mov     eax, dword [eax+ecx*8+10H]              ; 07C5 _ 8B. 44 C8, 10
        cmp     eax, dword [ebp+0CH]                    ; 07C9 _ 3B. 45, 0C
; Note: Immediate operand could be made smaller by sign extension
        jbe     ?_013                                   ; 07CC _ 0F 86, 00000005
; Note: Immediate operand could be made smaller by sign extension
        jmp     ?_015                                   ; 07D2 _ E9, 00000013

?_013:
; Note: Immediate operand could be made smaller by sign extension
        jmp     ?_014                                   ; 07D7 _ E9, 00000000

?_014:  mov     eax, dword [ebp-10H]                    ; 07DC _ 8B. 45, F0
        add     eax, 1                                  ; 07DF _ 83. C0, 01
        mov     dword [ebp-10H], eax                    ; 07E2 _ 89. 45, F0
; Note: Immediate operand could be made smaller by sign extension
        jmp     ?_012                                   ; 07E5 _ E9, FFFFFFC7

?_015:  cmp     dword [ebp-10H], 0                      ; 07EA _ 83. 7D, F0, 00
        jle     ?_019                                   ; 07EE _ 0F 8E, 00000096
        mov     eax, dword [ebp+8H]                     ; 07F4 _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 07F7 _ 8B. 4D, F0
        sub     ecx, 1                                  ; 07FA _ 83. E9, 01
        mov     eax, dword [eax+ecx*8+10H]              ; 07FD _ 8B. 44 C8, 10
        mov     ecx, dword [ebp+8H]                     ; 0801 _ 8B. 4D, 08
        mov     edx, dword [ebp-10H]                    ; 0804 _ 8B. 55, F0
        sub     edx, 1                                  ; 0807 _ 83. EA, 01
        add     eax, dword [ecx+edx*8+14H]              ; 080A _ 03. 44 D1, 14
        cmp     eax, dword [ebp+0CH]                    ; 080E _ 3B. 45, 0C
; Note: Immediate operand could be made smaller by sign extension
        jne     ?_018                                   ; 0811 _ 0F 85, 0000006E
        mov     eax, dword [ebp+10H]                    ; 0817 _ 8B. 45, 10
        mov     ecx, dword [ebp+8H]                     ; 081A _ 8B. 4D, 08
        mov     edx, dword [ebp-10H]                    ; 081D _ 8B. 55, F0
        sub     edx, 1                                  ; 0820 _ 83. EA, 01
        add     eax, dword [ecx+edx*8+14H]              ; 0823 _ 03. 44 D1, 14
        mov     dword [ecx+edx*8+14H], eax              ; 0827 _ 89. 44 D1, 14
        mov     eax, dword [ebp-10H]                    ; 082B _ 8B. 45, F0
        mov     ecx, dword [ebp+8H]                     ; 082E _ 8B. 4D, 08
        cmp     eax, dword [ecx]                        ; 0831 _ 3B. 01
; Note: Immediate operand could be made smaller by sign extension
        jge     ?_017                                   ; 0833 _ 0F 8D, 00000040
        mov     eax, dword [ebp+0CH]                    ; 0839 _ 8B. 45, 0C
        add     eax, dword [ebp+10H]                    ; 083C _ 03. 45, 10
        mov     ecx, dword [ebp+8H]                     ; 083F _ 8B. 4D, 08
        mov     edx, dword [ebp-10H]                    ; 0842 _ 8B. 55, F0
        cmp     eax, dword [ecx+edx*8+10H]              ; 0845 _ 3B. 44 D1, 10
; Note: Immediate operand could be made smaller by sign extension
        jne     ?_016                                   ; 0849 _ 0F 85, 00000025
        mov     eax, dword [ebp+8H]                     ; 084F _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 0852 _ 8B. 4D, F0
        mov     eax, dword [eax+ecx*8+14H]              ; 0855 _ 8B. 44 C8, 14
        mov     ecx, dword [ebp+8H]                     ; 0859 _ 8B. 4D, 08
        mov     edx, dword [ebp-10H]                    ; 085C _ 8B. 55, F0
        sub     edx, 1                                  ; 085F _ 83. EA, 01
        add     eax, dword [ecx+edx*8+14H]              ; 0862 _ 03. 44 D1, 14
        mov     dword [ecx+edx*8+14H], eax              ; 0866 _ 89. 44 D1, 14
        mov     eax, dword [ebp+8H]                     ; 086A _ 8B. 45, 08
        mov     ecx, dword [eax]                        ; 086D _ 8B. 08
        add     ecx, -1                                 ; 086F _ 83. C1, FF
        mov     dword [eax], ecx                        ; 0872 _ 89. 08
?_016:
; Note: Immediate operand could be made smaller by sign extension
        jmp     ?_017                                   ; 0874 _ E9, 00000000

?_017:  mov     dword [ebp-0CH], 0                      ; 0879 _ C7. 45, F4, 00000000
        jmp     ?_026                                   ; 0880 _ E9, 00000113

?_018:
; Note: Immediate operand could be made smaller by sign extension
        jmp     ?_019                                   ; 0885 _ E9, 00000000

?_019:  mov     eax, dword [ebp-10H]                    ; 088A _ 8B. 45, F0
        mov     ecx, dword [ebp+8H]                     ; 088D _ 8B. 4D, 08
        cmp     eax, dword [ecx]                        ; 0890 _ 3B. 01
; Note: Immediate operand could be made smaller by sign extension
        jge     ?_021                                   ; 0892 _ 0F 8D, 00000045
        mov     eax, dword [ebp+0CH]                    ; 0898 _ 8B. 45, 0C
        add     eax, dword [ebp+10H]                    ; 089B _ 03. 45, 10
        mov     ecx, dword [ebp+8H]                     ; 089E _ 8B. 4D, 08
        mov     edx, dword [ebp-10H]                    ; 08A1 _ 8B. 55, F0
        cmp     eax, dword [ecx+edx*8+10H]              ; 08A4 _ 3B. 44 D1, 10
; Note: Immediate operand could be made smaller by sign extension
        jne     ?_020                                   ; 08A8 _ 0F 85, 0000002A
        mov     eax, dword [ebp+0CH]                    ; 08AE _ 8B. 45, 0C
        mov     ecx, dword [ebp+8H]                     ; 08B1 _ 8B. 4D, 08
        mov     edx, dword [ebp-10H]                    ; 08B4 _ 8B. 55, F0
        mov     dword [ecx+edx*8+10H], eax              ; 08B7 _ 89. 44 D1, 10
        mov     eax, dword [ebp+10H]                    ; 08BB _ 8B. 45, 10
        mov     ecx, dword [ebp+8H]                     ; 08BE _ 8B. 4D, 08
        mov     edx, dword [ebp-10H]                    ; 08C1 _ 8B. 55, F0
        add     eax, dword [ecx+edx*8+14H]              ; 08C4 _ 03. 44 D1, 14
        mov     dword [ecx+edx*8+14H], eax              ; 08C8 _ 89. 44 D1, 14
        mov     dword [ebp-0CH], 0                      ; 08CC _ C7. 45, F4, 00000000
        jmp     ?_026                                   ; 08D3 _ E9, 000000C0

?_020:
; Note: Immediate operand could be made smaller by sign extension
        jmp     ?_021                                   ; 08D8 _ E9, 00000000

?_021:  mov     eax, dword [ebp+8H]                     ; 08DD _ 8B. 45, 08
        cmp     dword [eax], 4096                       ; 08E0 _ 81. 38, 00001000
        jge     ?_025                                   ; 08E6 _ 0F 8D, 0000008D
        mov     eax, dword [ebp+8H]                     ; 08EC _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 08EF _ 8B. 00
        mov     dword [ebp-14H], eax                    ; 08F1 _ 89. 45, EC
?_022:  mov     eax, dword [ebp-14H]                    ; 08F4 _ 8B. 45, EC
        cmp     eax, dword [ebp-10H]                    ; 08F7 _ 3B. 45, F0
; Note: Immediate operand could be made smaller by sign extension
        jle     ?_023                                   ; 08FA _ 0F 8E, 0000002D
        mov     eax, dword [ebp+8H]                     ; 0900 _ 8B. 45, 08
        mov     ecx, dword [ebp-14H]                    ; 0903 _ 8B. 4D, EC
        mov     edx, dword [ebp+8H]                     ; 0906 _ 8B. 55, 08
        mov     esi, dword [ebp-14H]                    ; 0909 _ 8B. 75, EC
        sub     esi, 1                                  ; 090C _ 83. EE, 01
        mov     edi, dword [edx+esi*8+10H]              ; 090F _ 8B. 7C F2, 10
        mov     dword [eax+ecx*8+10H], edi              ; 0913 _ 89. 7C C8, 10
        mov     edx, dword [edx+esi*8+14H]              ; 0917 _ 8B. 54 F2, 14
        mov     dword [eax+ecx*8+14H], edx              ; 091B _ 89. 54 C8, 14
        mov     eax, dword [ebp-14H]                    ; 091F _ 8B. 45, EC
        add     eax, -1                                 ; 0922 _ 83. C0, FF
        mov     dword [ebp-14H], eax                    ; 0925 _ 89. 45, EC
; Note: Immediate operand could be made smaller by sign extension
        jmp     ?_022                                   ; 0928 _ E9, FFFFFFC7

?_023:  mov     eax, dword [ebp+8H]                     ; 092D _ 8B. 45, 08
        mov     ecx, dword [eax]                        ; 0930 _ 8B. 08
        add     ecx, 1                                  ; 0932 _ 83. C1, 01
        mov     dword [eax], ecx                        ; 0935 _ 89. 08
        mov     eax, dword [ebp+8H]                     ; 0937 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 093A _ 8B. 40, 04
        mov     ecx, dword [ebp+8H]                     ; 093D _ 8B. 4D, 08
        cmp     eax, dword [ecx]                        ; 0940 _ 3B. 01
; Note: Immediate operand could be made smaller by sign extension
        jge     ?_024                                   ; 0942 _ 0F 8D, 0000000B
        mov     eax, dword [ebp+8H]                     ; 0948 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 094B _ 8B. 00
        mov     ecx, dword [ebp+8H]                     ; 094D _ 8B. 4D, 08
        mov     dword [ecx+4H], eax                     ; 0950 _ 89. 41, 04
?_024:  mov     eax, dword [ebp+0CH]                    ; 0953 _ 8B. 45, 0C
        mov     ecx, dword [ebp+8H]                     ; 0956 _ 8B. 4D, 08
        mov     edx, dword [ebp-10H]                    ; 0959 _ 8B. 55, F0
        mov     dword [ecx+edx*8+10H], eax              ; 095C _ 89. 44 D1, 10
        mov     eax, dword [ebp+10H]                    ; 0960 _ 8B. 45, 10
        mov     ecx, dword [ebp+8H]                     ; 0963 _ 8B. 4D, 08
        mov     edx, dword [ebp-10H]                    ; 0966 _ 8B. 55, F0
        mov     dword [ecx+edx*8+14H], eax              ; 0969 _ 89. 44 D1, 14
        mov     dword [ebp-0CH], 0                      ; 096D _ C7. 45, F4, 00000000
; Note: Immediate operand could be made smaller by sign extension
        jmp     ?_026                                   ; 0974 _ E9, 0000001F

?_025:  mov     eax, dword [ebp+8H]                     ; 0979 _ 8B. 45, 08
        mov     ecx, dword [eax+0CH]                    ; 097C _ 8B. 48, 0C
        add     ecx, 1                                  ; 097F _ 83. C1, 01
        mov     dword [eax+0CH], ecx                    ; 0982 _ 89. 48, 0C
        mov     eax, dword [ebp+10H]                    ; 0985 _ 8B. 45, 10
        mov     ecx, dword [ebp+8H]                     ; 0988 _ 8B. 4D, 08
        add     eax, dword [ecx+8H]                     ; 098B _ 03. 41, 08
        mov     dword [ecx+8H], eax                     ; 098E _ 89. 41, 08
        mov     dword [ebp-0CH], -1                     ; 0991 _ C7. 45, F4, FFFFFFFF
?_026:  mov     eax, dword [ebp-0CH]                    ; 0998 _ 8B. 45, F4
        add     esp, 24                                 ; 099B _ 83. C4, 18
        pop     esi                                     ; 099E _ 5E
        pop     edi                                     ; 099F _ 5F
        pop     ebp                                     ; 09A0 _ 5D
        ret                                             ; 09A1 _ C3
; memman_free End of function

; Filling space: 0EH
; Filler type: Multi-byte NOP
;       db 66H, 2EH, 0FH, 1FH, 84H, 00H, 00H, 00H
;       db 00H, 00H, 0FH, 1FH, 40H, 00H

ALIGN   16

init_palette:; Function begin
        push    ebp                                     ; 09B0 _ 55
        mov     ebp, esp                                ; 09B1 _ 89. E5
        sub     esp, 24                                 ; 09B3 _ 83. EC, 18
        xor     eax, eax                                ; 09B6 _ 31. C0
        mov     dword [esp], 0                          ; 09B8 _ C7. 04 24, 00000000
        mov     dword [esp+4H], 15                      ; 09BF _ C7. 44 24, 04, 0000000F
        lea     ecx, [init_palette.table_rgb]           ; 09C7 _ 8D. 0D, 00000014(d)
        mov     dword [esp+8H], ecx                     ; 09CD _ 89. 4C 24, 08
        mov     dword [ebp-4H], eax                     ; 09D1 _ 89. 45, FC
        call    set_palette                             ; 09D4 _ E8, 00001357
        add     esp, 24                                 ; 09D9 _ 83. C4, 18
        pop     ebp                                     ; 09DC _ 5D
        ret                                             ; 09DD _ C3
; init_palette End of function

; Filling space: 2H
; Filler type: NOP with prefixes
;       db 66H, 90H

ALIGN   8

shtctl_init:; Function begin
        push    ebp                                     ; 09E0 _ 55
        mov     ebp, esp                                ; 09E1 _ 89. E5
        push    edi                                     ; 09E3 _ 57
        push    esi                                     ; 09E4 _ 56
        sub     esp, 48                                 ; 09E5 _ 83. EC, 30
        mov     eax, dword [ebp+14H]                    ; 09E8 _ 8B. 45, 14
        mov     ecx, dword [ebp+10H]                    ; 09EB _ 8B. 4D, 10
        mov     edx, dword [ebp+0CH]                    ; 09EE _ 8B. 55, 0C
        mov     esi, dword [ebp+8H]                     ; 09F1 _ 8B. 75, 08
        mov     edi, dword [ebp+8H]                     ; 09F4 _ 8B. 7D, 08
        mov     dword [esp], edi                        ; 09F7 _ 89. 3C 24
        mov     dword [esp+4H], 10256                   ; 09FA _ C7. 44 24, 04, 00002810
        mov     dword [ebp-18H], eax                    ; 0A02 _ 89. 45, E8
        mov     dword [ebp-1CH], ecx                    ; 0A05 _ 89. 4D, E4
        mov     dword [ebp-20H], edx                    ; 0A08 _ 89. 55, E0
        mov     dword [ebp-24H], esi                    ; 0A0B _ 89. 75, DC
        call    memman_alloc_4k                         ; 0A0E _ E8, 0000008D
        mov     dword [ebp-10H], eax                    ; 0A13 _ 89. 45, F0
        cmp     dword [ebp-10H], 0                      ; 0A16 _ 83. 7D, F0, 00
; Note: Immediate operand could be made smaller by sign extension
        jne     ?_027                                   ; 0A1A _ 0F 85, 0000000C
        mov     dword [ebp-0CH], 0                      ; 0A20 _ C7. 45, F4, 00000000
; Note: Immediate operand could be made smaller by sign extension
        jmp     ?_030                                   ; 0A27 _ E9, 00000061

?_027:  mov     eax, dword [ebp+0CH]                    ; 0A2C _ 8B. 45, 0C
        mov     ecx, dword [ebp-10H]                    ; 0A2F _ 8B. 4D, F0
        mov     dword [ecx], eax                        ; 0A32 _ 89. 01
        mov     eax, dword [ebp+10H]                    ; 0A34 _ 8B. 45, 10
        mov     ecx, dword [ebp-10H]                    ; 0A37 _ 8B. 4D, F0
        mov     dword [ecx+4H], eax                     ; 0A3A _ 89. 41, 04
        mov     eax, dword [ebp+14H]                    ; 0A3D _ 8B. 45, 14
        mov     ecx, dword [ebp-10H]                    ; 0A40 _ 8B. 4D, F0
        mov     dword [ecx+8H], eax                     ; 0A43 _ 89. 41, 08
        mov     eax, dword [ebp-10H]                    ; 0A46 _ 8B. 45, F0
        mov     dword [eax+0CH], -1                     ; 0A49 _ C7. 40, 0C, FFFFFFFF
        mov     dword [ebp-14H], 0                      ; 0A50 _ C7. 45, EC, 00000000
?_028:  cmp     dword [ebp-14H], 256                    ; 0A57 _ 81. 7D, EC, 00000100
; Note: Immediate operand could be made smaller by sign extension
        jge     ?_029                                   ; 0A5E _ 0F 8D, 00000023
        mov     eax, dword [ebp-10H]                    ; 0A64 _ 8B. 45, F0
        add     eax, 1040                               ; 0A67 _ 05, 00000410
        imul    ecx, dword [ebp-14H], 36                ; 0A6C _ 6B. 4D, EC, 24
        add     eax, ecx                                ; 0A70 _ 01. C8
        mov     dword [eax+1CH], 0                      ; 0A72 _ C7. 40, 1C, 00000000
        mov     eax, dword [ebp-14H]                    ; 0A79 _ 8B. 45, EC
        add     eax, 1                                  ; 0A7C _ 83. C0, 01
        mov     dword [ebp-14H], eax                    ; 0A7F _ 89. 45, EC
; Note: Immediate operand could be made smaller by sign extension
        jmp     ?_028                                   ; 0A82 _ E9, FFFFFFD0

?_029:  mov     eax, dword [ebp-10H]                    ; 0A87 _ 8B. 45, F0
        mov     dword [ebp-0CH], eax                    ; 0A8A _ 89. 45, F4
?_030:  mov     eax, dword [ebp-0CH]                    ; 0A8D _ 8B. 45, F4
        add     esp, 48                                 ; 0A90 _ 83. C4, 30
        pop     esi                                     ; 0A93 _ 5E
        pop     edi                                     ; 0A94 _ 5F
        pop     ebp                                     ; 0A95 _ 5D
        ret                                             ; 0A96 _ C3
; shtctl_init End of function

; Filling space: 9H
; Filler type: Multi-byte NOP
;       db 66H, 0FH, 1FH, 84H, 00H, 00H, 00H, 00H
;       db 00H

ALIGN   16

memman_alloc_4k:; Function begin
        push    ebp                                     ; 0AA0 _ 55
        mov     ebp, esp                                ; 0AA1 _ 89. E5
        push    esi                                     ; 0AA3 _ 56
        sub     esp, 20                                 ; 0AA4 _ 83. EC, 14
        mov     eax, dword [ebp+0CH]                    ; 0AA7 _ 8B. 45, 0C
        mov     ecx, dword [ebp+8H]                     ; 0AAA _ 8B. 4D, 08
        mov     edx, dword [ebp+0CH]                    ; 0AAD _ 8B. 55, 0C
        add     edx, 4095                               ; 0AB0 _ 81. C2, 00000FFF
        and     edx, 0FFFFF000H                         ; 0AB6 _ 81. E2, FFFFF000
        mov     dword [ebp+0CH], edx                    ; 0ABC _ 89. 55, 0C
        mov     edx, dword [ebp+8H]                     ; 0ABF _ 8B. 55, 08
        mov     esi, dword [ebp+0CH]                    ; 0AC2 _ 8B. 75, 0C
        mov     dword [esp], edx                        ; 0AC5 _ 89. 14 24
        mov     dword [esp+4H], esi                     ; 0AC8 _ 89. 74 24, 04
        mov     dword [ebp-0CH], eax                    ; 0ACC _ 89. 45, F4
        mov     dword [ebp-10H], ecx                    ; 0ACF _ 89. 4D, F0
        call    memman_alloc                            ; 0AD2 _ E8, 00001829
        mov     dword [ebp-8H], eax                     ; 0AD7 _ 89. 45, F8
        mov     eax, dword [ebp-8H]                     ; 0ADA _ 8B. 45, F8
        add     esp, 20                                 ; 0ADD _ 83. C4, 14
        pop     esi                                     ; 0AE0 _ 5E
        pop     ebp                                     ; 0AE1 _ 5D
        ret                                             ; 0AE2 _ C3
; memman_alloc_4k End of function

; Filling space: 0DH
; Filler type: Multi-byte NOP
;       db 66H, 2EH, 0FH, 1FH, 84H, 00H, 00H, 00H
;       db 00H, 00H, 0FH, 1FH, 00H

ALIGN   16

sheet_alloc:; Function begin
        push    ebp                                     ; 0AF0 _ 55
        mov     ebp, esp                                ; 0AF1 _ 89. E5
        sub     esp, 16                                 ; 0AF3 _ 83. EC, 10
        mov     eax, dword [ebp+8H]                     ; 0AF6 _ 8B. 45, 08
        mov     dword [ebp-0CH], 0                      ; 0AF9 _ C7. 45, F4, 00000000
        mov     dword [ebp-10H], eax                    ; 0B00 _ 89. 45, F0
?_031:  cmp     dword [ebp-0CH], 256                    ; 0B03 _ 81. 7D, F4, 00000100
; Note: Immediate operand could be made smaller by sign extension
        jge     ?_034                                   ; 0B0A _ 0F 8D, 00000068
        mov     eax, dword [ebp+8H]                     ; 0B10 _ 8B. 45, 08
        add     eax, 1040                               ; 0B13 _ 05, 00000410
        imul    ecx, dword [ebp-0CH], 36                ; 0B18 _ 6B. 4D, F4, 24
        add     eax, ecx                                ; 0B1C _ 01. C8
        cmp     dword [eax+1CH], 0                      ; 0B1E _ 83. 78, 1C, 00
; Note: Immediate operand could be made smaller by sign extension
        jne     ?_032                                   ; 0B22 _ 0F 85, 0000003D
        mov     eax, dword [ebp+8H]                     ; 0B28 _ 8B. 45, 08
        add     eax, 1040                               ; 0B2B _ 05, 00000410
        imul    ecx, dword [ebp-0CH], 36                ; 0B30 _ 6B. 4D, F4, 24
        add     eax, ecx                                ; 0B34 _ 01. C8
        mov     dword [ebp-8H], eax                     ; 0B36 _ 89. 45, F8
        mov     eax, dword [ebp-8H]                     ; 0B39 _ 8B. 45, F8
        mov     ecx, dword [ebp+8H]                     ; 0B3C _ 8B. 4D, 08
        mov     edx, dword [ebp-0CH]                    ; 0B3F _ 8B. 55, F4
        mov     dword [ecx+edx*4+10H], eax              ; 0B42 _ 89. 44 91, 10
        mov     eax, dword [ebp-8H]                     ; 0B46 _ 8B. 45, F8
        mov     dword [eax+1CH], 1                      ; 0B49 _ C7. 40, 1C, 00000001
        mov     eax, dword [ebp-8H]                     ; 0B50 _ 8B. 45, F8
        mov     dword [eax+18H], -1                     ; 0B53 _ C7. 40, 18, FFFFFFFF
        mov     eax, dword [ebp-8H]                     ; 0B5A _ 8B. 45, F8
        mov     dword [ebp-4H], eax                     ; 0B5D _ 89. 45, FC
; Note: Immediate operand could be made smaller by sign extension
        jmp     ?_035                                   ; 0B60 _ E9, 0000001A

?_032:
; Note: Immediate operand could be made smaller by sign extension
        jmp     ?_033                                   ; 0B65 _ E9, 00000000

?_033:  mov     eax, dword [ebp-0CH]                    ; 0B6A _ 8B. 45, F4
        add     eax, 1                                  ; 0B6D _ 83. C0, 01
        mov     dword [ebp-0CH], eax                    ; 0B70 _ 89. 45, F4
; Note: Immediate operand could be made smaller by sign extension
        jmp     ?_031                                   ; 0B73 _ E9, FFFFFF8B

?_034:  mov     dword [ebp-4H], 0                       ; 0B78 _ C7. 45, FC, 00000000
?_035:  mov     eax, dword [ebp-4H]                     ; 0B7F _ 8B. 45, FC
        add     esp, 16                                 ; 0B82 _ 83. C4, 10
        pop     ebp                                     ; 0B85 _ 5D
        ret                                             ; 0B86 _ C3
; sheet_alloc End of function

; Filling space: 9H
; Filler type: Multi-byte NOP
;       db 66H, 0FH, 1FH, 84H, 00H, 00H, 00H, 00H
;       db 00H

ALIGN   16

sheet_setbuf:; Function begin
        push    ebp                                     ; 0B90 _ 55
        mov     ebp, esp                                ; 0B91 _ 89. E5
        push    ebx                                     ; 0B93 _ 53
        push    edi                                     ; 0B94 _ 57
        push    esi                                     ; 0B95 _ 56
        sub     esp, 20                                 ; 0B96 _ 83. EC, 14
        mov     eax, dword [ebp+18H]                    ; 0B99 _ 8B. 45, 18
        mov     ecx, dword [ebp+14H]                    ; 0B9C _ 8B. 4D, 14
        mov     edx, dword [ebp+10H]                    ; 0B9F _ 8B. 55, 10
        mov     esi, dword [ebp+0CH]                    ; 0BA2 _ 8B. 75, 0C
        mov     edi, dword [ebp+8H]                     ; 0BA5 _ 8B. 7D, 08
        mov     ebx, dword [ebp+0CH]                    ; 0BA8 _ 8B. 5D, 0C
        mov     dword [ebp-10H], eax                    ; 0BAB _ 89. 45, F0
        mov     eax, dword [ebp+8H]                     ; 0BAE _ 8B. 45, 08
        mov     dword [eax], ebx                        ; 0BB1 _ 89. 18
        mov     eax, dword [ebp+10H]                    ; 0BB3 _ 8B. 45, 10
        mov     ebx, dword [ebp+8H]                     ; 0BB6 _ 8B. 5D, 08
        mov     dword [ebx+4H], eax                     ; 0BB9 _ 89. 43, 04
        mov     eax, dword [ebp+14H]                    ; 0BBC _ 8B. 45, 14
        mov     ebx, dword [ebp+8H]                     ; 0BBF _ 8B. 5D, 08
        mov     dword [ebx+8H], eax                     ; 0BC2 _ 89. 43, 08
        mov     eax, dword [ebp+18H]                    ; 0BC5 _ 8B. 45, 18
        mov     ebx, dword [ebp+8H]                     ; 0BC8 _ 8B. 5D, 08
        mov     dword [ebx+14H], eax                    ; 0BCB _ 89. 43, 14
        mov     dword [ebp-14H], ecx                    ; 0BCE _ 89. 4D, EC
        mov     dword [ebp-18H], edx                    ; 0BD1 _ 89. 55, E8
        mov     dword [ebp-1CH], esi                    ; 0BD4 _ 89. 75, E4
        mov     dword [ebp-20H], edi                    ; 0BD7 _ 89. 7D, E0
        add     esp, 20                                 ; 0BDA _ 83. C4, 14
        pop     esi                                     ; 0BDD _ 5E
        pop     edi                                     ; 0BDE _ 5F
        pop     ebx                                     ; 0BDF _ 5B
        pop     ebp                                     ; 0BE0 _ 5D
        ret                                             ; 0BE1 _ C3
; sheet_setbuf End of function

; Filling space: 0EH
; Filler type: Multi-byte NOP
;       db 66H, 2EH, 0FH, 1FH, 84H, 00H, 00H, 00H
;       db 00H, 00H, 0FH, 1FH, 40H, 00H

ALIGN   16

draw_desktop:; Function begin
        push    ebp                                     ; 0BF0 _ 55
        mov     ebp, esp                                ; 0BF1 _ 89. E5
        push    ebx                                     ; 0BF3 _ 53
        push    edi                                     ; 0BF4 _ 57
        push    esi                                     ; 0BF5 _ 56
        sub     esp, 76                                 ; 0BF6 _ 83. EC, 4C
        mov     eax, dword [ebp+10H]                    ; 0BF9 _ 8B. 45, 10
        mov     ecx, dword [ebp+0CH]                    ; 0BFC _ 8B. 4D, 0C
        mov     edx, dword [ebp+8H]                     ; 0BFF _ 8B. 55, 08
        xor     esi, esi                                ; 0C02 _ 31. F6
        mov     edi, dword [ebp+8H]                     ; 0C04 _ 8B. 7D, 08
        mov     ebx, dword [ebp+0CH]                    ; 0C07 _ 8B. 5D, 0C
        mov     dword [ebp-10H], eax                    ; 0C0A _ 89. 45, F0
        mov     eax, dword [ebp+0CH]                    ; 0C0D _ 8B. 45, 0C
        sub     eax, 1                                  ; 0C10 _ 83. E8, 01
        mov     dword [ebp-14H], eax                    ; 0C13 _ 89. 45, EC
        mov     eax, dword [ebp+10H]                    ; 0C16 _ 8B. 45, 10
        sub     eax, 29                                 ; 0C19 _ 83. E8, 1D
        mov     dword [esp], edi                        ; 0C1C _ 89. 3C 24
        mov     dword [esp+4H], ebx                     ; 0C1F _ 89. 5C 24, 04
        mov     dword [esp+8H], 14                      ; 0C23 _ C7. 44 24, 08, 0000000E
        mov     dword [esp+0CH], 0                      ; 0C2B _ C7. 44 24, 0C, 00000000
        mov     dword [esp+10H], 0                      ; 0C33 _ C7. 44 24, 10, 00000000
        mov     edi, dword [ebp-14H]                    ; 0C3B _ 8B. 7D, EC
        mov     dword [esp+14H], edi                    ; 0C3E _ 89. 7C 24, 14
        mov     dword [esp+18H], eax                    ; 0C42 _ 89. 44 24, 18
        mov     dword [ebp-18H], ecx                    ; 0C46 _ 89. 4D, E8
        mov     dword [ebp-1CH], edx                    ; 0C49 _ 89. 55, E4
        mov     dword [ebp-20H], esi                    ; 0C4C _ 89. 75, E0
        call    boxfill8                                ; 0C4F _ E8, 00000CDC
        xor     eax, eax                                ; 0C54 _ 31. C0
        mov     ecx, dword [ebp+8H]                     ; 0C56 _ 8B. 4D, 08
        mov     edx, dword [ebp+0CH]                    ; 0C59 _ 8B. 55, 0C
        mov     esi, dword [ebp+10H]                    ; 0C5C _ 8B. 75, 10
        sub     esi, 28                                 ; 0C5F _ 83. EE, 1C
        mov     edi, dword [ebp+0CH]                    ; 0C62 _ 8B. 7D, 0C
        sub     edi, 1                                  ; 0C65 _ 83. EF, 01
        mov     ebx, dword [ebp+10H]                    ; 0C68 _ 8B. 5D, 10
        sub     ebx, 28                                 ; 0C6B _ 83. EB, 1C
        mov     dword [esp], ecx                        ; 0C6E _ 89. 0C 24
        mov     dword [esp+4H], edx                     ; 0C71 _ 89. 54 24, 04
        mov     dword [esp+8H], 8                       ; 0C75 _ C7. 44 24, 08, 00000008
        mov     dword [esp+0CH], 0                      ; 0C7D _ C7. 44 24, 0C, 00000000
        mov     dword [esp+10H], esi                    ; 0C85 _ 89. 74 24, 10
        mov     dword [esp+14H], edi                    ; 0C89 _ 89. 7C 24, 14
        mov     dword [esp+18H], ebx                    ; 0C8D _ 89. 5C 24, 18
        mov     dword [ebp-24H], eax                    ; 0C91 _ 89. 45, DC
        call    boxfill8                                ; 0C94 _ E8, 00000C97
        xor     eax, eax                                ; 0C99 _ 31. C0
        mov     ecx, dword [ebp+8H]                     ; 0C9B _ 8B. 4D, 08
        mov     edx, dword [ebp+0CH]                    ; 0C9E _ 8B. 55, 0C
        mov     esi, dword [ebp+10H]                    ; 0CA1 _ 8B. 75, 10
        sub     esi, 27                                 ; 0CA4 _ 83. EE, 1B
        mov     edi, dword [ebp+0CH]                    ; 0CA7 _ 8B. 7D, 0C
        sub     edi, 1                                  ; 0CAA _ 83. EF, 01
        mov     ebx, dword [ebp+10H]                    ; 0CAD _ 8B. 5D, 10
        sub     ebx, 27                                 ; 0CB0 _ 83. EB, 1B
        mov     dword [esp], ecx                        ; 0CB3 _ 89. 0C 24
        mov     dword [esp+4H], edx                     ; 0CB6 _ 89. 54 24, 04
        mov     dword [esp+8H], 7                       ; 0CBA _ C7. 44 24, 08, 00000007
        mov     dword [esp+0CH], 0                      ; 0CC2 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+10H], esi                    ; 0CCA _ 89. 74 24, 10
        mov     dword [esp+14H], edi                    ; 0CCE _ 89. 7C 24, 14
        mov     dword [esp+18H], ebx                    ; 0CD2 _ 89. 5C 24, 18
        mov     dword [ebp-28H], eax                    ; 0CD6 _ 89. 45, D8
        call    boxfill8                                ; 0CD9 _ E8, 00000C52
        xor     eax, eax                                ; 0CDE _ 31. C0
        mov     ecx, dword [ebp+8H]                     ; 0CE0 _ 8B. 4D, 08
        mov     edx, dword [ebp+0CH]                    ; 0CE3 _ 8B. 55, 0C
        mov     esi, dword [ebp+10H]                    ; 0CE6 _ 8B. 75, 10
        sub     esi, 26                                 ; 0CE9 _ 83. EE, 1A
        mov     edi, dword [ebp+0CH]                    ; 0CEC _ 8B. 7D, 0C
        sub     edi, 1                                  ; 0CEF _ 83. EF, 01
        mov     ebx, dword [ebp+10H]                    ; 0CF2 _ 8B. 5D, 10
        sub     ebx, 1                                  ; 0CF5 _ 83. EB, 01
        mov     dword [esp], ecx                        ; 0CF8 _ 89. 0C 24
        mov     dword [esp+4H], edx                     ; 0CFB _ 89. 54 24, 04
        mov     dword [esp+8H], 8                       ; 0CFF _ C7. 44 24, 08, 00000008
        mov     dword [esp+0CH], 0                      ; 0D07 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+10H], esi                    ; 0D0F _ 89. 74 24, 10
        mov     dword [esp+14H], edi                    ; 0D13 _ 89. 7C 24, 14
        mov     dword [esp+18H], ebx                    ; 0D17 _ 89. 5C 24, 18
        mov     dword [ebp-2CH], eax                    ; 0D1B _ 89. 45, D4
        call    boxfill8                                ; 0D1E _ E8, 00000C0D
        mov     eax, dword [ebp+8H]                     ; 0D23 _ 8B. 45, 08
        mov     ecx, dword [ebp+0CH]                    ; 0D26 _ 8B. 4D, 0C
        mov     edx, dword [ebp+10H]                    ; 0D29 _ 8B. 55, 10
        sub     edx, 24                                 ; 0D2C _ 83. EA, 18
        mov     esi, dword [ebp+10H]                    ; 0D2F _ 8B. 75, 10
        sub     esi, 24                                 ; 0D32 _ 83. EE, 18
        mov     dword [esp], eax                        ; 0D35 _ 89. 04 24
        mov     dword [esp+4H], ecx                     ; 0D38 _ 89. 4C 24, 04
        mov     dword [esp+8H], 7                       ; 0D3C _ C7. 44 24, 08, 00000007
        mov     dword [esp+0CH], 3                      ; 0D44 _ C7. 44 24, 0C, 00000003
        mov     dword [esp+10H], edx                    ; 0D4C _ 89. 54 24, 10
        mov     dword [esp+14H], 59                     ; 0D50 _ C7. 44 24, 14, 0000003B
        mov     dword [esp+18H], esi                    ; 0D58 _ 89. 74 24, 18
        call    boxfill8                                ; 0D5C _ E8, 00000BCF
        mov     eax, dword [ebp+8H]                     ; 0D61 _ 8B. 45, 08
        mov     ecx, dword [ebp+0CH]                    ; 0D64 _ 8B. 4D, 0C
        mov     edx, dword [ebp+10H]                    ; 0D67 _ 8B. 55, 10
        sub     edx, 24                                 ; 0D6A _ 83. EA, 18
        mov     esi, dword [ebp+10H]                    ; 0D6D _ 8B. 75, 10
        sub     esi, 4                                  ; 0D70 _ 83. EE, 04
        mov     dword [esp], eax                        ; 0D73 _ 89. 04 24
        mov     dword [esp+4H], ecx                     ; 0D76 _ 89. 4C 24, 04
        mov     dword [esp+8H], 7                       ; 0D7A _ C7. 44 24, 08, 00000007
        mov     dword [esp+0CH], 2                      ; 0D82 _ C7. 44 24, 0C, 00000002
        mov     dword [esp+10H], edx                    ; 0D8A _ 89. 54 24, 10
        mov     dword [esp+14H], 2                      ; 0D8E _ C7. 44 24, 14, 00000002
        mov     dword [esp+18H], esi                    ; 0D96 _ 89. 74 24, 18
        call    boxfill8                                ; 0D9A _ E8, 00000B91
        mov     eax, dword [ebp+8H]                     ; 0D9F _ 8B. 45, 08
        mov     ecx, dword [ebp+0CH]                    ; 0DA2 _ 8B. 4D, 0C
        mov     edx, dword [ebp+10H]                    ; 0DA5 _ 8B. 55, 10
        sub     edx, 4                                  ; 0DA8 _ 83. EA, 04
        mov     esi, dword [ebp+10H]                    ; 0DAB _ 8B. 75, 10
        sub     esi, 4                                  ; 0DAE _ 83. EE, 04
        mov     dword [esp], eax                        ; 0DB1 _ 89. 04 24
        mov     dword [esp+4H], ecx                     ; 0DB4 _ 89. 4C 24, 04
        mov     dword [esp+8H], 15                      ; 0DB8 _ C7. 44 24, 08, 0000000F
        mov     dword [esp+0CH], 3                      ; 0DC0 _ C7. 44 24, 0C, 00000003
        mov     dword [esp+10H], edx                    ; 0DC8 _ 89. 54 24, 10
        mov     dword [esp+14H], 59                     ; 0DCC _ C7. 44 24, 14, 0000003B
        mov     dword [esp+18H], esi                    ; 0DD4 _ 89. 74 24, 18
        call    boxfill8                                ; 0DD8 _ E8, 00000B53
        mov     eax, dword [ebp+8H]                     ; 0DDD _ 8B. 45, 08
        mov     ecx, dword [ebp+0CH]                    ; 0DE0 _ 8B. 4D, 0C
        mov     edx, dword [ebp+10H]                    ; 0DE3 _ 8B. 55, 10
        sub     edx, 23                                 ; 0DE6 _ 83. EA, 17
        mov     esi, dword [ebp+10H]                    ; 0DE9 _ 8B. 75, 10
        sub     esi, 5                                  ; 0DEC _ 83. EE, 05
        mov     dword [esp], eax                        ; 0DEF _ 89. 04 24
        mov     dword [esp+4H], ecx                     ; 0DF2 _ 89. 4C 24, 04
        mov     dword [esp+8H], 15                      ; 0DF6 _ C7. 44 24, 08, 0000000F
        mov     dword [esp+0CH], 59                     ; 0DFE _ C7. 44 24, 0C, 0000003B
        mov     dword [esp+10H], edx                    ; 0E06 _ 89. 54 24, 10
        mov     dword [esp+14H], 59                     ; 0E0A _ C7. 44 24, 14, 0000003B
        mov     dword [esp+18H], esi                    ; 0E12 _ 89. 74 24, 18
        call    boxfill8                                ; 0E16 _ E8, 00000B15
        xor     eax, eax                                ; 0E1B _ 31. C0
        mov     ecx, dword [ebp+8H]                     ; 0E1D _ 8B. 4D, 08
        mov     edx, dword [ebp+0CH]                    ; 0E20 _ 8B. 55, 0C
        mov     esi, dword [ebp+10H]                    ; 0E23 _ 8B. 75, 10
        sub     esi, 3                                  ; 0E26 _ 83. EE, 03
        mov     edi, dword [ebp+10H]                    ; 0E29 _ 8B. 7D, 10
        sub     edi, 3                                  ; 0E2C _ 83. EF, 03
        mov     dword [esp], ecx                        ; 0E2F _ 89. 0C 24
        mov     dword [esp+4H], edx                     ; 0E32 _ 89. 54 24, 04
        mov     dword [esp+8H], 0                       ; 0E36 _ C7. 44 24, 08, 00000000
        mov     dword [esp+0CH], 2                      ; 0E3E _ C7. 44 24, 0C, 00000002
        mov     dword [esp+10H], esi                    ; 0E46 _ 89. 74 24, 10
        mov     dword [esp+14H], 59                     ; 0E4A _ C7. 44 24, 14, 0000003B
        mov     dword [esp+18H], edi                    ; 0E52 _ 89. 7C 24, 18
        mov     dword [ebp-30H], eax                    ; 0E56 _ 89. 45, D0
        call    boxfill8                                ; 0E59 _ E8, 00000AD2
        xor     eax, eax                                ; 0E5E _ 31. C0
        mov     ecx, dword [ebp+8H]                     ; 0E60 _ 8B. 4D, 08
        mov     edx, dword [ebp+0CH]                    ; 0E63 _ 8B. 55, 0C
        mov     esi, dword [ebp+10H]                    ; 0E66 _ 8B. 75, 10
        sub     esi, 24                                 ; 0E69 _ 83. EE, 18
        mov     edi, dword [ebp+10H]                    ; 0E6C _ 8B. 7D, 10
        sub     edi, 3                                  ; 0E6F _ 83. EF, 03
        mov     dword [esp], ecx                        ; 0E72 _ 89. 0C 24
        mov     dword [esp+4H], edx                     ; 0E75 _ 89. 54 24, 04
        mov     dword [esp+8H], 0                       ; 0E79 _ C7. 44 24, 08, 00000000
        mov     dword [esp+0CH], 60                     ; 0E81 _ C7. 44 24, 0C, 0000003C
        mov     dword [esp+10H], esi                    ; 0E89 _ 89. 74 24, 10
        mov     dword [esp+14H], 60                     ; 0E8D _ C7. 44 24, 14, 0000003C
        mov     dword [esp+18H], edi                    ; 0E95 _ 89. 7C 24, 18
        mov     dword [ebp-34H], eax                    ; 0E99 _ 89. 45, CC
        call    boxfill8                                ; 0E9C _ E8, 00000A8F
        mov     eax, dword [ebp+8H]                     ; 0EA1 _ 8B. 45, 08
        mov     ecx, dword [ebp+0CH]                    ; 0EA4 _ 8B. 4D, 0C
        mov     edx, dword [ebp+0CH]                    ; 0EA7 _ 8B. 55, 0C
        sub     edx, 47                                 ; 0EAA _ 83. EA, 2F
        mov     esi, dword [ebp+10H]                    ; 0EAD _ 8B. 75, 10
        sub     esi, 24                                 ; 0EB0 _ 83. EE, 18
        mov     edi, dword [ebp+0CH]                    ; 0EB3 _ 8B. 7D, 0C
        sub     edi, 4                                  ; 0EB6 _ 83. EF, 04
        mov     ebx, dword [ebp+10H]                    ; 0EB9 _ 8B. 5D, 10
        sub     ebx, 24                                 ; 0EBC _ 83. EB, 18
        mov     dword [esp], eax                        ; 0EBF _ 89. 04 24
        mov     dword [esp+4H], ecx                     ; 0EC2 _ 89. 4C 24, 04
        mov     dword [esp+8H], 15                      ; 0EC6 _ C7. 44 24, 08, 0000000F
        mov     dword [esp+0CH], edx                    ; 0ECE _ 89. 54 24, 0C
        mov     dword [esp+10H], esi                    ; 0ED2 _ 89. 74 24, 10
        mov     dword [esp+14H], edi                    ; 0ED6 _ 89. 7C 24, 14
        mov     dword [esp+18H], ebx                    ; 0EDA _ 89. 5C 24, 18
        call    boxfill8                                ; 0EDE _ E8, 00000A4D
        mov     eax, dword [ebp+8H]                     ; 0EE3 _ 8B. 45, 08
        mov     ecx, dword [ebp+0CH]                    ; 0EE6 _ 8B. 4D, 0C
        mov     edx, dword [ebp+0CH]                    ; 0EE9 _ 8B. 55, 0C
        sub     edx, 47                                 ; 0EEC _ 83. EA, 2F
        mov     esi, dword [ebp+10H]                    ; 0EEF _ 8B. 75, 10
        sub     esi, 23                                 ; 0EF2 _ 83. EE, 17
        mov     edi, dword [ebp+0CH]                    ; 0EF5 _ 8B. 7D, 0C
        sub     edi, 47                                 ; 0EF8 _ 83. EF, 2F
        mov     ebx, dword [ebp+10H]                    ; 0EFB _ 8B. 5D, 10
        sub     ebx, 4                                  ; 0EFE _ 83. EB, 04
        mov     dword [esp], eax                        ; 0F01 _ 89. 04 24
        mov     dword [esp+4H], ecx                     ; 0F04 _ 89. 4C 24, 04
        mov     dword [esp+8H], 15                      ; 0F08 _ C7. 44 24, 08, 0000000F
        mov     dword [esp+0CH], edx                    ; 0F10 _ 89. 54 24, 0C
        mov     dword [esp+10H], esi                    ; 0F14 _ 89. 74 24, 10
        mov     dword [esp+14H], edi                    ; 0F18 _ 89. 7C 24, 14
        mov     dword [esp+18H], ebx                    ; 0F1C _ 89. 5C 24, 18
        call    boxfill8                                ; 0F20 _ E8, 00000A0B
        mov     eax, dword [ebp+8H]                     ; 0F25 _ 8B. 45, 08
        mov     ecx, dword [ebp+0CH]                    ; 0F28 _ 8B. 4D, 0C
        mov     edx, dword [ebp+0CH]                    ; 0F2B _ 8B. 55, 0C
        sub     edx, 47                                 ; 0F2E _ 83. EA, 2F
        mov     esi, dword [ebp+10H]                    ; 0F31 _ 8B. 75, 10
        sub     esi, 3                                  ; 0F34 _ 83. EE, 03
        mov     edi, dword [ebp+0CH]                    ; 0F37 _ 8B. 7D, 0C
        sub     edi, 4                                  ; 0F3A _ 83. EF, 04
        mov     ebx, dword [ebp+10H]                    ; 0F3D _ 8B. 5D, 10
        sub     ebx, 3                                  ; 0F40 _ 83. EB, 03
        mov     dword [esp], eax                        ; 0F43 _ 89. 04 24
        mov     dword [esp+4H], ecx                     ; 0F46 _ 89. 4C 24, 04
        mov     dword [esp+8H], 7                       ; 0F4A _ C7. 44 24, 08, 00000007
        mov     dword [esp+0CH], edx                    ; 0F52 _ 89. 54 24, 0C
        mov     dword [esp+10H], esi                    ; 0F56 _ 89. 74 24, 10
        mov     dword [esp+14H], edi                    ; 0F5A _ 89. 7C 24, 14
        mov     dword [esp+18H], ebx                    ; 0F5E _ 89. 5C 24, 18
        call    boxfill8                                ; 0F62 _ E8, 000009C9
        mov     eax, dword [ebp+8H]                     ; 0F67 _ 8B. 45, 08
        mov     ecx, dword [ebp+0CH]                    ; 0F6A _ 8B. 4D, 0C
        mov     edx, dword [ebp+0CH]                    ; 0F6D _ 8B. 55, 0C
        sub     edx, 3                                  ; 0F70 _ 83. EA, 03
        mov     esi, dword [ebp+10H]                    ; 0F73 _ 8B. 75, 10
        sub     esi, 24                                 ; 0F76 _ 83. EE, 18
        mov     edi, dword [ebp+0CH]                    ; 0F79 _ 8B. 7D, 0C
        sub     edi, 3                                  ; 0F7C _ 83. EF, 03
        mov     ebx, dword [ebp+10H]                    ; 0F7F _ 8B. 5D, 10
        sub     ebx, 3                                  ; 0F82 _ 83. EB, 03
        mov     dword [esp], eax                        ; 0F85 _ 89. 04 24
        mov     dword [esp+4H], ecx                     ; 0F88 _ 89. 4C 24, 04
        mov     dword [esp+8H], 7                       ; 0F8C _ C7. 44 24, 08, 00000007
        mov     dword [esp+0CH], edx                    ; 0F94 _ 89. 54 24, 0C
        mov     dword [esp+10H], esi                    ; 0F98 _ 89. 74 24, 10
        mov     dword [esp+14H], edi                    ; 0F9C _ 89. 7C 24, 14
        mov     dword [esp+18H], ebx                    ; 0FA0 _ 89. 5C 24, 18
        call    boxfill8                                ; 0FA4 _ E8, 00000987
        add     esp, 76                                 ; 0FA9 _ 83. C4, 4C
        pop     esi                                     ; 0FAC _ 5E
        pop     edi                                     ; 0FAD _ 5F
        pop     ebx                                     ; 0FAE _ 5B
        pop     ebp                                     ; 0FAF _ 5D
        ret                                             ; 0FB0 _ C3
; draw_desktop End of function

; Filling space: 0FH
; Filler type: Multi-byte NOP
;       db 66H, 2EH, 0FH, 1FH, 84H, 00H, 00H, 00H
;       db 00H, 00H, 0FH, 1FH, 44H, 00H, 00H

ALIGN   16

sheet_slide:; Function begin
        push    ebp                                     ; 0FC0 _ 55
        mov     ebp, esp                                ; 0FC1 _ 89. E5
        push    ebx                                     ; 0FC3 _ 53
        push    edi                                     ; 0FC4 _ 57
        push    esi                                     ; 0FC5 _ 56
        sub     esp, 44                                 ; 0FC6 _ 83. EC, 2C
        mov     eax, dword [ebp+14H]                    ; 0FC9 _ 8B. 45, 14
        mov     ecx, dword [ebp+10H]                    ; 0FCC _ 8B. 4D, 10
        mov     edx, dword [ebp+0CH]                    ; 0FCF _ 8B. 55, 0C
        mov     esi, dword [ebp+8H]                     ; 0FD2 _ 8B. 75, 08
        mov     edi, dword [ebp+0CH]                    ; 0FD5 _ 8B. 7D, 0C
        mov     edi, dword [edi+0CH]                    ; 0FD8 _ 8B. 7F, 0C
        mov     dword [ebp-10H], edi                    ; 0FDB _ 89. 7D, F0
        mov     edi, dword [ebp+0CH]                    ; 0FDE _ 8B. 7D, 0C
        mov     edi, dword [edi+10H]                    ; 0FE1 _ 8B. 7F, 10
        mov     dword [ebp-14H], edi                    ; 0FE4 _ 89. 7D, EC
        mov     edi, dword [ebp+10H]                    ; 0FE7 _ 8B. 7D, 10
        mov     ebx, dword [ebp+0CH]                    ; 0FEA _ 8B. 5D, 0C
        mov     dword [ebx+0CH], edi                    ; 0FED _ 89. 7B, 0C
        mov     edi, dword [ebp+14H]                    ; 0FF0 _ 8B. 7D, 14
        mov     ebx, dword [ebp+0CH]                    ; 0FF3 _ 8B. 5D, 0C
        mov     dword [ebx+10H], edi                    ; 0FF6 _ 89. 7B, 10
        mov     edi, dword [ebp+0CH]                    ; 0FF9 _ 8B. 7D, 0C
        cmp     dword [edi+18H], 0                      ; 0FFC _ 83. 7F, 18, 00
        mov     dword [ebp-18H], eax                    ; 1000 _ 89. 45, E8
        mov     dword [ebp-1CH], ecx                    ; 1003 _ 89. 4D, E4
        mov     dword [ebp-20H], edx                    ; 1006 _ 89. 55, E0
        mov     dword [ebp-24H], esi                    ; 1009 _ 89. 75, DC
; Note: Immediate operand could be made smaller by sign extension
        jl      ?_036                                   ; 100C _ 0F 8C, 00000066
        mov     eax, dword [ebp+8H]                     ; 1012 _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 1015 _ 8B. 4D, F0
        mov     edx, dword [ebp-14H]                    ; 1018 _ 8B. 55, EC
        mov     esi, dword [ebp-10H]                    ; 101B _ 8B. 75, F0
        mov     edi, dword [ebp+0CH]                    ; 101E _ 8B. 7D, 0C
        add     esi, dword [edi+4H]                     ; 1021 _ 03. 77, 04
        mov     edi, dword [ebp-14H]                    ; 1024 _ 8B. 7D, EC
        mov     ebx, dword [ebp+0CH]                    ; 1027 _ 8B. 5D, 0C
        add     edi, dword [ebx+8H]                     ; 102A _ 03. 7B, 08
        mov     dword [esp], eax                        ; 102D _ 89. 04 24
        mov     dword [esp+4H], ecx                     ; 1030 _ 89. 4C 24, 04
        mov     dword [esp+8H], edx                     ; 1034 _ 89. 54 24, 08
        mov     dword [esp+0CH], esi                    ; 1038 _ 89. 74 24, 0C
        mov     dword [esp+10H], edi                    ; 103C _ 89. 7C 24, 10
        call    sheet_refreshsub                        ; 1040 _ E8, 0000162B
        mov     eax, dword [ebp+8H]                     ; 1045 _ 8B. 45, 08
        mov     ecx, dword [ebp+10H]                    ; 1048 _ 8B. 4D, 10
        mov     edx, dword [ebp+14H]                    ; 104B _ 8B. 55, 14
        mov     esi, dword [ebp+10H]                    ; 104E _ 8B. 75, 10
        mov     edi, dword [ebp+0CH]                    ; 1051 _ 8B. 7D, 0C
        add     esi, dword [edi+4H]                     ; 1054 _ 03. 77, 04
        mov     edi, dword [ebp+14H]                    ; 1057 _ 8B. 7D, 14
        mov     ebx, dword [ebp+0CH]                    ; 105A _ 8B. 5D, 0C
        add     edi, dword [ebx+8H]                     ; 105D _ 03. 7B, 08
        mov     dword [esp], eax                        ; 1060 _ 89. 04 24
        mov     dword [esp+4H], ecx                     ; 1063 _ 89. 4C 24, 04
        mov     dword [esp+8H], edx                     ; 1067 _ 89. 54 24, 08
        mov     dword [esp+0CH], esi                    ; 106B _ 89. 74 24, 0C
        mov     dword [esp+10H], edi                    ; 106F _ 89. 7C 24, 10
        call    sheet_refreshsub                        ; 1073 _ E8, 000015F8
?_036:  add     esp, 44                                 ; 1078 _ 83. C4, 2C
        pop     esi                                     ; 107B _ 5E
        pop     edi                                     ; 107C _ 5F
        pop     ebx                                     ; 107D _ 5B
        pop     ebp                                     ; 107E _ 5D
        ret                                             ; 107F _ C3
; sheet_slide End of function

init_mouse_cursor:; Function begin
        push    ebp                                     ; 1080 _ 55
        mov     ebp, esp                                ; 1081 _ 89. E5
        sub     esp, 16                                 ; 1083 _ 83. EC, 10
        mov     al, byte [ebp+0CH]                      ; 1086 _ 8A. 45, 0C
        mov     ecx, dword [ebp+8H]                     ; 1089 _ 8B. 4D, 08
        mov     dword [ebp-8H], 0                       ; 108C _ C7. 45, F8, 00000000
        mov     byte [ebp-9H], al                       ; 1093 _ 88. 45, F7
        mov     dword [ebp-10H], ecx                    ; 1096 _ 89. 4D, F0
?_037:  cmp     dword [ebp-8H], 16                      ; 1099 _ 83. 7D, F8, 10
        jge     ?_045                                   ; 109D _ 0F 8D, 000000C3
        mov     dword [ebp-4H], 0                       ; 10A3 _ C7. 45, FC, 00000000
?_038:  cmp     dword [ebp-4H], 16                      ; 10AA _ 83. 7D, FC, 10
        jge     ?_043                                   ; 10AE _ 0F 8D, 0000009F
        mov     eax, dword [ebp-8H]                     ; 10B4 _ 8B. 45, F8
        shl     eax, 4                                  ; 10B7 _ C1. E0, 04
        lea     ecx, [init_mouse_cursor.cursor]         ; 10BA _ 8D. 0D, 00000044(d)
        add     ecx, eax                                ; 10C0 _ 01. C1
        mov     eax, dword [ebp-4H]                     ; 10C2 _ 8B. 45, FC
        movsx   eax, byte [ecx+eax]                     ; 10C5 _ 0F BE. 04 01
        cmp     eax, 42                                 ; 10C9 _ 83. F8, 2A
; Note: Immediate operand could be made smaller by sign extension
        jne     ?_039                                   ; 10CC _ 0F 85, 00000010
        mov     eax, dword [ebp+8H]                     ; 10D2 _ 8B. 45, 08
        mov     ecx, dword [ebp-8H]                     ; 10D5 _ 8B. 4D, F8
        shl     ecx, 4                                  ; 10D8 _ C1. E1, 04
        add     ecx, dword [ebp-4H]                     ; 10DB _ 03. 4D, FC
        mov     byte [eax+ecx], 0                       ; 10DE _ C6. 04 08, 00
?_039:  mov     eax, dword [ebp-8H]                     ; 10E2 _ 8B. 45, F8
        shl     eax, 4                                  ; 10E5 _ C1. E0, 04
        lea     ecx, [init_mouse_cursor.cursor]         ; 10E8 _ 8D. 0D, 00000044(d)
        add     ecx, eax                                ; 10EE _ 01. C1
        mov     eax, dword [ebp-4H]                     ; 10F0 _ 8B. 45, FC
        movsx   eax, byte [ecx+eax]                     ; 10F3 _ 0F BE. 04 01
        cmp     eax, 79                                 ; 10F7 _ 83. F8, 4F
; Note: Immediate operand could be made smaller by sign extension
        jne     ?_040                                   ; 10FA _ 0F 85, 00000010
        mov     eax, dword [ebp+8H]                     ; 1100 _ 8B. 45, 08
        mov     ecx, dword [ebp-8H]                     ; 1103 _ 8B. 4D, F8
        shl     ecx, 4                                  ; 1106 _ C1. E1, 04
        add     ecx, dword [ebp-4H]                     ; 1109 _ 03. 4D, FC
        mov     byte [eax+ecx], 7                       ; 110C _ C6. 04 08, 07
?_040:  mov     eax, dword [ebp-8H]                     ; 1110 _ 8B. 45, F8
        shl     eax, 4                                  ; 1113 _ C1. E0, 04
        lea     ecx, [init_mouse_cursor.cursor]         ; 1116 _ 8D. 0D, 00000044(d)
        add     ecx, eax                                ; 111C _ 01. C1
        mov     eax, dword [ebp-4H]                     ; 111E _ 8B. 45, FC
        movsx   eax, byte [ecx+eax]                     ; 1121 _ 0F BE. 04 01
        cmp     eax, 46                                 ; 1125 _ 83. F8, 2E
; Note: Immediate operand could be made smaller by sign extension
        jne     ?_041                                   ; 1128 _ 0F 85, 00000012
        mov     al, byte [ebp+0CH]                      ; 112E _ 8A. 45, 0C
        mov     ecx, dword [ebp+8H]                     ; 1131 _ 8B. 4D, 08
        mov     edx, dword [ebp-8H]                     ; 1134 _ 8B. 55, F8
        shl     edx, 4                                  ; 1137 _ C1. E2, 04
        add     edx, dword [ebp-4H]                     ; 113A _ 03. 55, FC
        mov     byte [ecx+edx], al                      ; 113D _ 88. 04 11
?_041:
; Note: Immediate operand could be made smaller by sign extension
        jmp     ?_042                                   ; 1140 _ E9, 00000000

?_042:  mov     eax, dword [ebp-4H]                     ; 1145 _ 8B. 45, FC
        add     eax, 1                                  ; 1148 _ 83. C0, 01
        mov     dword [ebp-4H], eax                     ; 114B _ 89. 45, FC
        jmp     ?_038                                   ; 114E _ E9, FFFFFF57

?_043:
; Note: Immediate operand could be made smaller by sign extension
        jmp     ?_044                                   ; 1153 _ E9, 00000000

?_044:  mov     eax, dword [ebp-8H]                     ; 1158 _ 8B. 45, F8
        add     eax, 1                                  ; 115B _ 83. C0, 01
        mov     dword [ebp-8H], eax                     ; 115E _ 89. 45, F8
        jmp     ?_037                                   ; 1161 _ E9, FFFFFF33

?_045:  add     esp, 16                                 ; 1166 _ 83. C4, 10
        pop     ebp                                     ; 1169 _ 5D
        ret                                             ; 116A _ C3
; init_mouse_cursor End of function

; Filling space: 5H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 44H, 00H, 00H

ALIGN   8

draw_window:; Function begin
        push    ebp                                     ; 1170 _ 55
        mov     ebp, esp                                ; 1171 _ 89. E5
        push    ebx                                     ; 1173 _ 53
        push    edi                                     ; 1174 _ 57
        push    esi                                     ; 1175 _ 56
        sub     esp, 76                                 ; 1176 _ 83. EC, 4C
        mov     eax, dword [ebp+14H]                    ; 1179 _ 8B. 45, 14
        mov     ecx, dword [ebp+10H]                    ; 117C _ 8B. 4D, 10
        mov     edx, dword [ebp+0CH]                    ; 117F _ 8B. 55, 0C
        mov     esi, dword [ebp+8H]                     ; 1182 _ 8B. 75, 08
        xor     edi, edi                                ; 1185 _ 31. FF
        mov     ebx, dword [ebp+8H]                     ; 1187 _ 8B. 5D, 08
        mov     dword [ebp-1CH], eax                    ; 118A _ 89. 45, E4
        mov     eax, dword [ebp+0CH]                    ; 118D _ 8B. 45, 0C
        mov     dword [ebp-20H], eax                    ; 1190 _ 89. 45, E0
        mov     eax, dword [ebp+0CH]                    ; 1193 _ 8B. 45, 0C
        sub     eax, 1                                  ; 1196 _ 83. E8, 01
        mov     dword [esp], ebx                        ; 1199 _ 89. 1C 24
        mov     ebx, dword [ebp-20H]                    ; 119C _ 8B. 5D, E0
        mov     dword [esp+4H], ebx                     ; 119F _ 89. 5C 24, 04
        mov     dword [esp+8H], 8                       ; 11A3 _ C7. 44 24, 08, 00000008
        mov     dword [esp+0CH], 0                      ; 11AB _ C7. 44 24, 0C, 00000000
        mov     dword [esp+10H], 0                      ; 11B3 _ C7. 44 24, 10, 00000000
        mov     dword [esp+14H], eax                    ; 11BB _ 89. 44 24, 14
        mov     dword [esp+18H], 0                      ; 11BF _ C7. 44 24, 18, 00000000
        mov     dword [ebp-24H], ecx                    ; 11C7 _ 89. 4D, DC
        mov     dword [ebp-28H], edx                    ; 11CA _ 89. 55, D8
        mov     dword [ebp-2CH], esi                    ; 11CD _ 89. 75, D4
        mov     dword [ebp-30H], edi                    ; 11D0 _ 89. 7D, D0
        call    boxfill8                                ; 11D3 _ E8, 00000758
        mov     eax, dword [ebp+8H]                     ; 11D8 _ 8B. 45, 08
        mov     ecx, dword [ebp+0CH]                    ; 11DB _ 8B. 4D, 0C
        mov     edx, dword [ebp+0CH]                    ; 11DE _ 8B. 55, 0C
        sub     edx, 2                                  ; 11E1 _ 83. EA, 02
        mov     dword [esp], eax                        ; 11E4 _ 89. 04 24
        mov     dword [esp+4H], ecx                     ; 11E7 _ 89. 4C 24, 04
        mov     dword [esp+8H], 7                       ; 11EB _ C7. 44 24, 08, 00000007
        mov     dword [esp+0CH], 1                      ; 11F3 _ C7. 44 24, 0C, 00000001
        mov     dword [esp+10H], 1                      ; 11FB _ C7. 44 24, 10, 00000001
        mov     dword [esp+14H], edx                    ; 1203 _ 89. 54 24, 14
        mov     dword [esp+18H], 1                      ; 1207 _ C7. 44 24, 18, 00000001
        call    boxfill8                                ; 120F _ E8, 0000071C
        xor     eax, eax                                ; 1214 _ 31. C0
        mov     ecx, dword [ebp+8H]                     ; 1216 _ 8B. 4D, 08
        mov     edx, dword [ebp+0CH]                    ; 1219 _ 8B. 55, 0C
        mov     esi, dword [ebp+10H]                    ; 121C _ 8B. 75, 10
        sub     esi, 1                                  ; 121F _ 83. EE, 01
        mov     dword [esp], ecx                        ; 1222 _ 89. 0C 24
        mov     dword [esp+4H], edx                     ; 1225 _ 89. 54 24, 04
        mov     dword [esp+8H], 8                       ; 1229 _ C7. 44 24, 08, 00000008
        mov     dword [esp+0CH], 0                      ; 1231 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+10H], 0                      ; 1239 _ C7. 44 24, 10, 00000000
        mov     dword [esp+14H], 0                      ; 1241 _ C7. 44 24, 14, 00000000
        mov     dword [esp+18H], esi                    ; 1249 _ 89. 74 24, 18
        mov     dword [ebp-34H], eax                    ; 124D _ 89. 45, CC
        call    boxfill8                                ; 1250 _ E8, 000006DB
        mov     eax, dword [ebp+8H]                     ; 1255 _ 8B. 45, 08
        mov     ecx, dword [ebp+0CH]                    ; 1258 _ 8B. 4D, 0C
        mov     edx, dword [ebp+10H]                    ; 125B _ 8B. 55, 10
        sub     edx, 2                                  ; 125E _ 83. EA, 02
        mov     dword [esp], eax                        ; 1261 _ 89. 04 24
        mov     dword [esp+4H], ecx                     ; 1264 _ 89. 4C 24, 04
        mov     dword [esp+8H], 7                       ; 1268 _ C7. 44 24, 08, 00000007
        mov     dword [esp+0CH], 1                      ; 1270 _ C7. 44 24, 0C, 00000001
        mov     dword [esp+10H], 1                      ; 1278 _ C7. 44 24, 10, 00000001
        mov     dword [esp+14H], 1                      ; 1280 _ C7. 44 24, 14, 00000001
        mov     dword [esp+18H], edx                    ; 1288 _ 89. 54 24, 18
        call    boxfill8                                ; 128C _ E8, 0000069F
        mov     eax, dword [ebp+8H]                     ; 1291 _ 8B. 45, 08
        mov     ecx, dword [ebp+0CH]                    ; 1294 _ 8B. 4D, 0C
        mov     edx, dword [ebp+0CH]                    ; 1297 _ 8B. 55, 0C
        sub     edx, 2                                  ; 129A _ 83. EA, 02
        mov     esi, dword [ebp+0CH]                    ; 129D _ 8B. 75, 0C
        sub     esi, 2                                  ; 12A0 _ 83. EE, 02
        mov     edi, dword [ebp+10H]                    ; 12A3 _ 8B. 7D, 10
        sub     edi, 2                                  ; 12A6 _ 83. EF, 02
        mov     dword [esp], eax                        ; 12A9 _ 89. 04 24
        mov     dword [esp+4H], ecx                     ; 12AC _ 89. 4C 24, 04
        mov     dword [esp+8H], 15                      ; 12B0 _ C7. 44 24, 08, 0000000F
        mov     dword [esp+0CH], edx                    ; 12B8 _ 89. 54 24, 0C
        mov     dword [esp+10H], 1                      ; 12BC _ C7. 44 24, 10, 00000001
        mov     dword [esp+14H], esi                    ; 12C4 _ 89. 74 24, 14
        mov     dword [esp+18H], edi                    ; 12C8 _ 89. 7C 24, 18
        call    boxfill8                                ; 12CC _ E8, 0000065F
        xor     eax, eax                                ; 12D1 _ 31. C0
        mov     ecx, dword [ebp+8H]                     ; 12D3 _ 8B. 4D, 08
        mov     edx, dword [ebp+0CH]                    ; 12D6 _ 8B. 55, 0C
        mov     esi, dword [ebp+0CH]                    ; 12D9 _ 8B. 75, 0C
        sub     esi, 1                                  ; 12DC _ 83. EE, 01
        mov     edi, dword [ebp+0CH]                    ; 12DF _ 8B. 7D, 0C
        sub     edi, 1                                  ; 12E2 _ 83. EF, 01
        mov     ebx, dword [ebp+10H]                    ; 12E5 _ 8B. 5D, 10
        sub     ebx, 1                                  ; 12E8 _ 83. EB, 01
        mov     dword [esp], ecx                        ; 12EB _ 89. 0C 24
        mov     dword [esp+4H], edx                     ; 12EE _ 89. 54 24, 04
        mov     dword [esp+8H], 0                       ; 12F2 _ C7. 44 24, 08, 00000000
        mov     dword [esp+0CH], esi                    ; 12FA _ 89. 74 24, 0C
        mov     dword [esp+10H], 0                      ; 12FE _ C7. 44 24, 10, 00000000
        mov     dword [esp+14H], edi                    ; 1306 _ 89. 7C 24, 14
        mov     dword [esp+18H], ebx                    ; 130A _ 89. 5C 24, 18
        mov     dword [ebp-38H], eax                    ; 130E _ 89. 45, C8
        call    boxfill8                                ; 1311 _ E8, 0000061A
        mov     eax, dword [ebp+8H]                     ; 1316 _ 8B. 45, 08
        mov     ecx, dword [ebp+0CH]                    ; 1319 _ 8B. 4D, 0C
        mov     edx, dword [ebp+0CH]                    ; 131C _ 8B. 55, 0C
        sub     edx, 3                                  ; 131F _ 83. EA, 03
        mov     esi, dword [ebp+10H]                    ; 1322 _ 8B. 75, 10
        sub     esi, 3                                  ; 1325 _ 83. EE, 03
        mov     dword [esp], eax                        ; 1328 _ 89. 04 24
        mov     dword [esp+4H], ecx                     ; 132B _ 89. 4C 24, 04
        mov     dword [esp+8H], 8                       ; 132F _ C7. 44 24, 08, 00000008
        mov     dword [esp+0CH], 2                      ; 1337 _ C7. 44 24, 0C, 00000002
        mov     dword [esp+10H], 2                      ; 133F _ C7. 44 24, 10, 00000002
        mov     dword [esp+14H], edx                    ; 1347 _ 89. 54 24, 14
        mov     dword [esp+18H], esi                    ; 134B _ 89. 74 24, 18
        call    boxfill8                                ; 134F _ E8, 000005DC
        mov     eax, dword [ebp+8H]                     ; 1354 _ 8B. 45, 08
        mov     ecx, dword [ebp+0CH]                    ; 1357 _ 8B. 4D, 0C
        mov     edx, dword [ebp+0CH]                    ; 135A _ 8B. 55, 0C
        sub     edx, 4                                  ; 135D _ 83. EA, 04
        mov     dword [esp], eax                        ; 1360 _ 89. 04 24
        mov     dword [esp+4H], ecx                     ; 1363 _ 89. 4C 24, 04
        mov     dword [esp+8H], 12                      ; 1367 _ C7. 44 24, 08, 0000000C
        mov     dword [esp+0CH], 3                      ; 136F _ C7. 44 24, 0C, 00000003
        mov     dword [esp+10H], 3                      ; 1377 _ C7. 44 24, 10, 00000003
        mov     dword [esp+14H], edx                    ; 137F _ 89. 54 24, 14
        mov     dword [esp+18H], 20                     ; 1383 _ C7. 44 24, 18, 00000014
        call    boxfill8                                ; 138B _ E8, 000005A0
        mov     eax, dword [ebp+8H]                     ; 1390 _ 8B. 45, 08
        mov     ecx, dword [ebp+0CH]                    ; 1393 _ 8B. 4D, 0C
        mov     edx, dword [ebp+10H]                    ; 1396 _ 8B. 55, 10
        sub     edx, 2                                  ; 1399 _ 83. EA, 02
        mov     esi, dword [ebp+0CH]                    ; 139C _ 8B. 75, 0C
        sub     esi, 2                                  ; 139F _ 83. EE, 02
        mov     edi, dword [ebp+10H]                    ; 13A2 _ 8B. 7D, 10
        sub     edi, 2                                  ; 13A5 _ 83. EF, 02
        mov     dword [esp], eax                        ; 13A8 _ 89. 04 24
        mov     dword [esp+4H], ecx                     ; 13AB _ 89. 4C 24, 04
        mov     dword [esp+8H], 15                      ; 13AF _ C7. 44 24, 08, 0000000F
        mov     dword [esp+0CH], 1                      ; 13B7 _ C7. 44 24, 0C, 00000001
        mov     dword [esp+10H], edx                    ; 13BF _ 89. 54 24, 10
        mov     dword [esp+14H], esi                    ; 13C3 _ 89. 74 24, 14
        mov     dword [esp+18H], edi                    ; 13C7 _ 89. 7C 24, 18
        call    boxfill8                                ; 13CB _ E8, 00000560
        xor     eax, eax                                ; 13D0 _ 31. C0
        mov     ecx, dword [ebp+8H]                     ; 13D2 _ 8B. 4D, 08
        mov     edx, dword [ebp+0CH]                    ; 13D5 _ 8B. 55, 0C
        mov     esi, dword [ebp+10H]                    ; 13D8 _ 8B. 75, 10
        sub     esi, 1                                  ; 13DB _ 83. EE, 01
        mov     edi, dword [ebp+0CH]                    ; 13DE _ 8B. 7D, 0C
        sub     edi, 1                                  ; 13E1 _ 83. EF, 01
        mov     ebx, dword [ebp+10H]                    ; 13E4 _ 8B. 5D, 10
        sub     ebx, 1                                  ; 13E7 _ 83. EB, 01
        mov     dword [esp], ecx                        ; 13EA _ 89. 0C 24
        mov     dword [esp+4H], edx                     ; 13ED _ 89. 54 24, 04
        mov     dword [esp+8H], 0                       ; 13F1 _ C7. 44 24, 08, 00000000
        mov     dword [esp+0CH], 0                      ; 13F9 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+10H], esi                    ; 1401 _ 89. 74 24, 10
        mov     dword [esp+14H], edi                    ; 1405 _ 89. 7C 24, 14
        mov     dword [esp+18H], ebx                    ; 1409 _ 89. 5C 24, 18
        mov     dword [ebp-3CH], eax                    ; 140D _ 89. 45, C4
        call    boxfill8                                ; 1410 _ E8, 0000051B
        mov     eax, dword [ebp+8H]                     ; 1415 _ 8B. 45, 08
        mov     ecx, dword [ebp+0CH]                    ; 1418 _ 8B. 4D, 0C
        mov     edx, dword [ebp+14H]                    ; 141B _ 8B. 55, 14
        mov     dword [esp], eax                        ; 141E _ 89. 04 24
        mov     dword [esp+4H], ecx                     ; 1421 _ 89. 4C 24, 04
        mov     dword [esp+8H], 24                      ; 1425 _ C7. 44 24, 08, 00000018
        mov     dword [esp+0CH], 4                      ; 142D _ C7. 44 24, 0C, 00000004
        mov     dword [esp+10H], 7                      ; 1435 _ C7. 44 24, 10, 00000007
        mov     dword [esp+14H], edx                    ; 143D _ 89. 54 24, 14
        call    showString                              ; 1441 _ E8, 0000058A
        mov     dword [ebp-14H], 0                      ; 1446 _ C7. 45, EC, 00000000
?_046:  cmp     dword [ebp-14H], 14                     ; 144D _ 83. 7D, EC, 0E
        jge     ?_056                                   ; 1451 _ 0F 8D, 000000B7
        mov     dword [ebp-10H], 0                      ; 1457 _ C7. 45, F0, 00000000
?_047:  cmp     dword [ebp-10H], 16                     ; 145E _ 83. 7D, F0, 10
        jge     ?_054                                   ; 1462 _ 0F 8D, 00000093
        mov     eax, dword [ebp-14H]                    ; 1468 _ 8B. 45, EC
        shl     eax, 4                                  ; 146B _ C1. E0, 04
        lea     ecx, [draw_window.closebtn]             ; 146E _ 8D. 0D, 00000144(d)
        add     ecx, eax                                ; 1474 _ 01. C1
        mov     eax, dword [ebp-10H]                    ; 1476 _ 8B. 45, F0
        mov     dl, byte [ecx+eax]                      ; 1479 _ 8A. 14 01
        mov     byte [ebp-15H], dl                      ; 147C _ 88. 55, EB
        movsx   eax, byte [ebp-15H]                     ; 147F _ 0F BE. 45, EB
        cmp     eax, 64                                 ; 1483 _ 83. F8, 40
; Note: Immediate operand could be made smaller by sign extension
        jne     ?_048                                   ; 1486 _ 0F 85, 00000009
        mov     byte [ebp-15H], 0                       ; 148C _ C6. 45, EB, 00
; Note: Immediate operand could be made smaller by sign extension
        jmp     ?_053                                   ; 1490 _ E9, 0000003A

?_048:  movsx   eax, byte [ebp-15H]                     ; 1495 _ 0F BE. 45, EB
        cmp     eax, 36                                 ; 1499 _ 83. F8, 24
; Note: Immediate operand could be made smaller by sign extension
        jne     ?_049                                   ; 149C _ 0F 85, 00000009
        mov     byte [ebp-15H], 15                      ; 14A2 _ C6. 45, EB, 0F
; Note: Immediate operand could be made smaller by sign extension
        jmp     ?_052                                   ; 14A6 _ E9, 0000001F

?_049:  movsx   eax, byte [ebp-15H]                     ; 14AB _ 0F BE. 45, EB
        cmp     eax, 81                                 ; 14AF _ 83. F8, 51
; Note: Immediate operand could be made smaller by sign extension
        jne     ?_050                                   ; 14B2 _ 0F 85, 00000009
        mov     byte [ebp-15H], 8                       ; 14B8 _ C6. 45, EB, 08
; Note: Immediate operand could be made smaller by sign extension
        jmp     ?_051                                   ; 14BC _ E9, 00000004

?_050:  mov     byte [ebp-15H], 7                       ; 14C1 _ C6. 45, EB, 07
?_051:
; Note: Immediate operand could be made smaller by sign extension
        jmp     ?_052                                   ; 14C5 _ E9, 00000000

?_052:
; Note: Immediate operand could be made smaller by sign extension
        jmp     ?_053                                   ; 14CA _ E9, 00000000

?_053:  mov     al, byte [ebp-15H]                      ; 14CF _ 8A. 45, EB
        mov     ecx, dword [ebp+8H]                     ; 14D2 _ 8B. 4D, 08
        mov     edx, dword [ebp-14H]                    ; 14D5 _ 8B. 55, EC
        add     edx, 5                                  ; 14D8 _ 83. C2, 05
        imul    edx, dword [ebp+0CH]                    ; 14DB _ 0F AF. 55, 0C
        mov     esi, dword [ebp+0CH]                    ; 14DF _ 8B. 75, 0C
        sub     esi, 21                                 ; 14E2 _ 83. EE, 15
        add     esi, dword [ebp-10H]                    ; 14E5 _ 03. 75, F0
        add     edx, esi                                ; 14E8 _ 01. F2
        mov     byte [ecx+edx], al                      ; 14EA _ 88. 04 11
        mov     eax, dword [ebp-10H]                    ; 14ED _ 8B. 45, F0
        add     eax, 1                                  ; 14F0 _ 83. C0, 01
        mov     dword [ebp-10H], eax                    ; 14F3 _ 89. 45, F0
        jmp     ?_047                                   ; 14F6 _ E9, FFFFFF63

?_054:
; Note: Immediate operand could be made smaller by sign extension
        jmp     ?_055                                   ; 14FB _ E9, 00000000

?_055:  mov     eax, dword [ebp-14H]                    ; 1500 _ 8B. 45, EC
        add     eax, 1                                  ; 1503 _ 83. C0, 01
        mov     dword [ebp-14H], eax                    ; 1506 _ 89. 45, EC
        jmp     ?_046                                   ; 1509 _ E9, FFFFFF3F

?_056:  add     esp, 76                                 ; 150E _ 83. C4, 4C
        pop     esi                                     ; 1511 _ 5E
        pop     edi                                     ; 1512 _ 5F
        pop     ebx                                     ; 1513 _ 5B
        pop     ebp                                     ; 1514 _ 5D
        ret                                             ; 1515 _ C3
; draw_window End of function

; Filling space: 0AH
; Filler type: Multi-byte NOP
;       db 66H, 2EH, 0FH, 1FH, 84H, 00H, 00H, 00H
;       db 00H, 00H

ALIGN   16

sheet_updown:; Function begin
        push    ebp                                     ; 1520 _ 55
        mov     ebp, esp                                ; 1521 _ 89. E5
        push    ebx                                     ; 1523 _ 53
        push    edi                                     ; 1524 _ 57
        push    esi                                     ; 1525 _ 56
        sub     esp, 44                                 ; 1526 _ 83. EC, 2C
        mov     eax, dword [ebp+10H]                    ; 1529 _ 8B. 45, 10
        mov     ecx, dword [ebp+0CH]                    ; 152C _ 8B. 4D, 0C
        mov     edx, dword [ebp+8H]                     ; 152F _ 8B. 55, 08
        mov     esi, dword [ebp+0CH]                    ; 1532 _ 8B. 75, 0C
        mov     esi, dword [esi+18H]                    ; 1535 _ 8B. 76, 18
        mov     dword [ebp-14H], esi                    ; 1538 _ 89. 75, EC
        mov     esi, dword [ebp+10H]                    ; 153B _ 8B. 75, 10
        mov     edi, dword [ebp+8H]                     ; 153E _ 8B. 7D, 08
        mov     edi, dword [edi+0CH]                    ; 1541 _ 8B. 7F, 0C
        add     edi, 1                                  ; 1544 _ 83. C7, 01
        cmp     esi, edi                                ; 1547 _ 39. FE
        mov     dword [ebp-18H], eax                    ; 1549 _ 89. 45, E8
        mov     dword [ebp-1CH], ecx                    ; 154C _ 89. 4D, E4
        mov     dword [ebp-20H], edx                    ; 154F _ 89. 55, E0
; Note: Immediate operand could be made smaller by sign extension
        jle     ?_057                                   ; 1552 _ 0F 8E, 0000000C
        mov     eax, dword [ebp+8H]                     ; 1558 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 155B _ 8B. 40, 0C
        add     eax, 1                                  ; 155E _ 83. C0, 01
        mov     dword [ebp+10H], eax                    ; 1561 _ 89. 45, 10
?_057:  cmp     dword [ebp+10H], -1                     ; 1564 _ 83. 7D, 10, FF
; Note: Immediate operand could be made smaller by sign extension
        jge     ?_058                                   ; 1568 _ 0F 8D, 00000007
        mov     dword [ebp+10H], -1                     ; 156E _ C7. 45, 10, FFFFFFFF
?_058:  mov     eax, dword [ebp+10H]                    ; 1575 _ 8B. 45, 10
        mov     ecx, dword [ebp+0CH]                    ; 1578 _ 8B. 4D, 0C
        mov     dword [ecx+18H], eax                    ; 157B _ 89. 41, 18
        mov     eax, dword [ebp-14H]                    ; 157E _ 8B. 45, EC
        cmp     eax, dword [ebp+10H]                    ; 1581 _ 3B. 45, 10
        jle     ?_066                                   ; 1584 _ 0F 8E, 0000010E
        cmp     dword [ebp+10H], 0                      ; 158A _ 83. 7D, 10, 00
; Note: Immediate operand could be made smaller by sign extension
        jl      ?_061                                   ; 158E _ 0F 8C, 00000059
        mov     eax, dword [ebp-14H]                    ; 1594 _ 8B. 45, EC
        mov     dword [ebp-10H], eax                    ; 1597 _ 89. 45, F0
?_059:  mov     eax, dword [ebp-10H]                    ; 159A _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 159D _ 3B. 45, 10
; Note: Immediate operand could be made smaller by sign extension
        jle     ?_060                                   ; 15A0 _ 0F 8E, 00000035
        mov     eax, dword [ebp+8H]                     ; 15A6 _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 15A9 _ 8B. 4D, F0
        sub     ecx, 1                                  ; 15AC _ 83. E9, 01
        mov     eax, dword [eax+ecx*4+10H]              ; 15AF _ 8B. 44 88, 10
        mov     ecx, dword [ebp+8H]                     ; 15B3 _ 8B. 4D, 08
        mov     edx, dword [ebp-10H]                    ; 15B6 _ 8B. 55, F0
        mov     dword [ecx+edx*4+10H], eax              ; 15B9 _ 89. 44 91, 10
        mov     eax, dword [ebp-10H]                    ; 15BD _ 8B. 45, F0
        mov     ecx, dword [ebp+8H]                     ; 15C0 _ 8B. 4D, 08
        mov     edx, dword [ebp-10H]                    ; 15C3 _ 8B. 55, F0
        mov     ecx, dword [ecx+edx*4+10H]              ; 15C6 _ 8B. 4C 91, 10
        mov     dword [ecx+18H], eax                    ; 15CA _ 89. 41, 18
        mov     eax, dword [ebp-10H]                    ; 15CD _ 8B. 45, F0
        add     eax, -1                                 ; 15D0 _ 83. C0, FF
        mov     dword [ebp-10H], eax                    ; 15D3 _ 89. 45, F0
; Note: Immediate operand could be made smaller by sign extension
        jmp     ?_059                                   ; 15D6 _ E9, FFFFFFBF

?_060:  mov     eax, dword [ebp+0CH]                    ; 15DB _ 8B. 45, 0C
        mov     ecx, dword [ebp+8H]                     ; 15DE _ 8B. 4D, 08
        mov     edx, dword [ebp+10H]                    ; 15E1 _ 8B. 55, 10
        mov     dword [ecx+edx*4+10H], eax              ; 15E4 _ 89. 44 91, 10
; Note: Immediate operand could be made smaller by sign extension
        jmp     ?_065                                   ; 15E8 _ E9, 00000067

?_061:  mov     eax, dword [ebp+8H]                     ; 15ED _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 15F0 _ 8B. 40, 0C
        cmp     eax, dword [ebp-14H]                    ; 15F3 _ 3B. 45, EC
; Note: Immediate operand could be made smaller by sign extension
        jle     ?_064                                   ; 15F6 _ 0F 8E, 0000004C
        mov     eax, dword [ebp-14H]                    ; 15FC _ 8B. 45, EC
        mov     dword [ebp-10H], eax                    ; 15FF _ 89. 45, F0
?_062:  mov     eax, dword [ebp-10H]                    ; 1602 _ 8B. 45, F0
        mov     ecx, dword [ebp+8H]                     ; 1605 _ 8B. 4D, 08
        cmp     eax, dword [ecx+0CH]                    ; 1608 _ 3B. 41, 0C
; Note: Immediate operand could be made smaller by sign extension
        jge     ?_063                                   ; 160B _ 0F 8D, 00000032
        mov     eax, dword [ebp+8H]                     ; 1611 _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 1614 _ 8B. 4D, F0
        mov     eax, dword [eax+ecx*4+14H]              ; 1617 _ 8B. 44 88, 14
        mov     ecx, dword [ebp+8H]                     ; 161B _ 8B. 4D, 08
        mov     edx, dword [ebp-10H]                    ; 161E _ 8B. 55, F0
        mov     dword [ecx+edx*4+10H], eax              ; 1621 _ 89. 44 91, 10
        mov     eax, dword [ebp-10H]                    ; 1625 _ 8B. 45, F0
        mov     ecx, dword [ebp+8H]                     ; 1628 _ 8B. 4D, 08
        mov     edx, dword [ebp-10H]                    ; 162B _ 8B. 55, F0
        mov     ecx, dword [ecx+edx*4+10H]              ; 162E _ 8B. 4C 91, 10
        mov     dword [ecx+18H], eax                    ; 1632 _ 89. 41, 18
        mov     eax, dword [ebp-10H]                    ; 1635 _ 8B. 45, F0
        add     eax, 1                                  ; 1638 _ 83. C0, 01
        mov     dword [ebp-10H], eax                    ; 163B _ 89. 45, F0
; Note: Immediate operand could be made smaller by sign extension
        jmp     ?_062                                   ; 163E _ E9, FFFFFFBF

?_063:
; Note: Immediate operand could be made smaller by sign extension
        jmp     ?_064                                   ; 1643 _ E9, 00000000

?_064:  mov     eax, dword [ebp+8H]                     ; 1648 _ 8B. 45, 08
        mov     ecx, dword [eax+0CH]                    ; 164B _ 8B. 48, 0C
        add     ecx, -1                                 ; 164E _ 83. C1, FF
        mov     dword [eax+0CH], ecx                    ; 1651 _ 89. 48, 0C
?_065:  mov     eax, dword [ebp+8H]                     ; 1654 _ 8B. 45, 08
        mov     ecx, dword [ebp+0CH]                    ; 1657 _ 8B. 4D, 0C
        mov     ecx, dword [ecx+0CH]                    ; 165A _ 8B. 49, 0C
        mov     edx, dword [ebp+0CH]                    ; 165D _ 8B. 55, 0C
        mov     edx, dword [edx+10H]                    ; 1660 _ 8B. 52, 10
        mov     esi, dword [ebp+0CH]                    ; 1663 _ 8B. 75, 0C
        mov     esi, dword [esi+0CH]                    ; 1666 _ 8B. 76, 0C
        mov     edi, dword [ebp+0CH]                    ; 1669 _ 8B. 7D, 0C
        add     esi, dword [edi+4H]                     ; 166C _ 03. 77, 04
        mov     edi, dword [ebp+0CH]                    ; 166F _ 8B. 7D, 0C
        mov     edi, dword [edi+10H]                    ; 1672 _ 8B. 7F, 10
        mov     ebx, dword [ebp+0CH]                    ; 1675 _ 8B. 5D, 0C
        add     edi, dword [ebx+8H]                     ; 1678 _ 03. 7B, 08
        mov     dword [esp], eax                        ; 167B _ 89. 04 24
        mov     dword [esp+4H], ecx                     ; 167E _ 89. 4C 24, 04
        mov     dword [esp+8H], edx                     ; 1682 _ 89. 54 24, 08
        mov     dword [esp+0CH], esi                    ; 1686 _ 89. 74 24, 0C
        mov     dword [esp+10H], edi                    ; 168A _ 89. 7C 24, 10
        call    sheet_refreshsub                        ; 168E _ E8, 00000FDD
        jmp     ?_074                                   ; 1693 _ E9, 00000113

?_066:  mov     eax, dword [ebp-14H]                    ; 1698 _ 8B. 45, EC
        cmp     eax, dword [ebp+10H]                    ; 169B _ 3B. 45, 10
        jge     ?_073                                   ; 169E _ 0F 8D, 00000102
        cmp     dword [ebp-14H], 0                      ; 16A4 _ 83. 7D, EC, 00
; Note: Immediate operand could be made smaller by sign extension
        jl      ?_069                                   ; 16A8 _ 0F 8C, 00000056
        mov     eax, dword [ebp-14H]                    ; 16AE _ 8B. 45, EC
        mov     dword [ebp-10H], eax                    ; 16B1 _ 89. 45, F0
?_067:  mov     eax, dword [ebp-10H]                    ; 16B4 _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 16B7 _ 3B. 45, 10
; Note: Immediate operand could be made smaller by sign extension
        jge     ?_068                                   ; 16BA _ 0F 8D, 00000032
        mov     eax, dword [ebp+8H]                     ; 16C0 _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 16C3 _ 8B. 4D, F0
        mov     eax, dword [eax+ecx*4+14H]              ; 16C6 _ 8B. 44 88, 14
        mov     ecx, dword [ebp+8H]                     ; 16CA _ 8B. 4D, 08
        mov     edx, dword [ebp-10H]                    ; 16CD _ 8B. 55, F0
        mov     dword [ecx+edx*4+10H], eax              ; 16D0 _ 89. 44 91, 10
        mov     eax, dword [ebp-10H]                    ; 16D4 _ 8B. 45, F0
        mov     ecx, dword [ebp+8H]                     ; 16D7 _ 8B. 4D, 08
        mov     edx, dword [ebp-10H]                    ; 16DA _ 8B. 55, F0
        mov     ecx, dword [ecx+edx*4+10H]              ; 16DD _ 8B. 4C 91, 10
        mov     dword [ecx+18H], eax                    ; 16E1 _ 89. 41, 18
        mov     eax, dword [ebp-10H]                    ; 16E4 _ 8B. 45, F0
        add     eax, 1                                  ; 16E7 _ 83. C0, 01
        mov     dword [ebp-10H], eax                    ; 16EA _ 89. 45, F0
; Note: Immediate operand could be made smaller by sign extension
        jmp     ?_067                                   ; 16ED _ E9, FFFFFFC2

?_068:  mov     eax, dword [ebp+0CH]                    ; 16F2 _ 8B. 45, 0C
        mov     ecx, dword [ebp+8H]                     ; 16F5 _ 8B. 4D, 08
        mov     edx, dword [ebp+10H]                    ; 16F8 _ 8B. 55, 10
        mov     dword [ecx+edx*4+10H], eax              ; 16FB _ 89. 44 91, 10
; Note: Immediate operand could be made smaller by sign extension
        jmp     ?_072                                   ; 16FF _ E9, 00000063

?_069:  mov     eax, dword [ebp+8H]                     ; 1704 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 1707 _ 8B. 40, 0C
        mov     dword [ebp-10H], eax                    ; 170A _ 89. 45, F0
?_070:  mov     eax, dword [ebp-10H]                    ; 170D _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 1710 _ 3B. 45, 10
; Note: Immediate operand could be made smaller by sign extension
        jl      ?_071                                   ; 1713 _ 0F 8C, 00000035
        mov     eax, dword [ebp+8H]                     ; 1719 _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 171C _ 8B. 4D, F0
        mov     eax, dword [eax+ecx*4+10H]              ; 171F _ 8B. 44 88, 10
        mov     ecx, dword [ebp+8H]                     ; 1723 _ 8B. 4D, 08
        mov     edx, dword [ebp-10H]                    ; 1726 _ 8B. 55, F0
        mov     dword [ecx+edx*4+14H], eax              ; 1729 _ 89. 44 91, 14
        mov     eax, dword [ebp-10H]                    ; 172D _ 8B. 45, F0
        add     eax, 1                                  ; 1730 _ 83. C0, 01
        mov     ecx, dword [ebp+8H]                     ; 1733 _ 8B. 4D, 08
        mov     edx, dword [ebp-10H]                    ; 1736 _ 8B. 55, F0
        mov     ecx, dword [ecx+edx*4+14H]              ; 1739 _ 8B. 4C 91, 14
        mov     dword [ecx+18H], eax                    ; 173D _ 89. 41, 18
        mov     eax, dword [ebp-10H]                    ; 1740 _ 8B. 45, F0
        add     eax, -1                                 ; 1743 _ 83. C0, FF
        mov     dword [ebp-10H], eax                    ; 1746 _ 89. 45, F0
; Note: Immediate operand could be made smaller by sign extension
        jmp     ?_070                                   ; 1749 _ E9, FFFFFFBF

?_071:  mov     eax, dword [ebp+0CH]                    ; 174E _ 8B. 45, 0C
        mov     ecx, dword [ebp+8H]                     ; 1751 _ 8B. 4D, 08
        mov     edx, dword [ebp+10H]                    ; 1754 _ 8B. 55, 10
        mov     dword [ecx+edx*4+10H], eax              ; 1757 _ 89. 44 91, 10
        mov     eax, dword [ebp+8H]                     ; 175B _ 8B. 45, 08
        mov     ecx, dword [eax+0CH]                    ; 175E _ 8B. 48, 0C
        add     ecx, 1                                  ; 1761 _ 83. C1, 01
        mov     dword [eax+0CH], ecx                    ; 1764 _ 89. 48, 0C
?_072:  mov     eax, dword [ebp+8H]                     ; 1767 _ 8B. 45, 08
        mov     ecx, dword [ebp+0CH]                    ; 176A _ 8B. 4D, 0C
        mov     ecx, dword [ecx+0CH]                    ; 176D _ 8B. 49, 0C
        mov     edx, dword [ebp+0CH]                    ; 1770 _ 8B. 55, 0C
        mov     edx, dword [edx+10H]                    ; 1773 _ 8B. 52, 10
        mov     esi, dword [ebp+0CH]                    ; 1776 _ 8B. 75, 0C
        mov     esi, dword [esi+0CH]                    ; 1779 _ 8B. 76, 0C
        mov     edi, dword [ebp+0CH]                    ; 177C _ 8B. 7D, 0C
        add     esi, dword [edi+4H]                     ; 177F _ 03. 77, 04
        mov     edi, dword [ebp+0CH]                    ; 1782 _ 8B. 7D, 0C
        mov     edi, dword [edi+10H]                    ; 1785 _ 8B. 7F, 10
        mov     ebx, dword [ebp+0CH]                    ; 1788 _ 8B. 5D, 0C
        add     edi, dword [ebx+8H]                     ; 178B _ 03. 7B, 08
        mov     dword [esp], eax                        ; 178E _ 89. 04 24
        mov     dword [esp+4H], ecx                     ; 1791 _ 89. 4C 24, 04
        mov     dword [esp+8H], edx                     ; 1795 _ 89. 54 24, 08
        mov     dword [esp+0CH], esi                    ; 1799 _ 89. 74 24, 0C
        mov     dword [esp+10H], edi                    ; 179D _ 89. 7C 24, 10
        call    sheet_refreshsub                        ; 17A1 _ E8, 00000ECA
?_073:
; Note: Immediate operand could be made smaller by sign extension
        jmp     ?_074                                   ; 17A6 _ E9, 00000000

?_074:  add     esp, 44                                 ; 17AB _ 83. C4, 2C
        pop     esi                                     ; 17AE _ 5E
        pop     edi                                     ; 17AF _ 5F
        pop     ebx                                     ; 17B0 _ 5B
        pop     ebp                                     ; 17B1 _ 5D
        ret                                             ; 17B2 _ C3
; sheet_updown End of function

; Filling space: 0DH
; Filler type: Multi-byte NOP
;       db 66H, 2EH, 0FH, 1FH, 84H, 00H, 00H, 00H
;       db 00H, 00H, 0FH, 1FH, 00H

ALIGN   16

sheet_refresh:; Function begin
        push    ebp                                     ; 17C0 _ 55
        mov     ebp, esp                                ; 17C1 _ 89. E5
        push    ebx                                     ; 17C3 _ 53
        push    edi                                     ; 17C4 _ 57
        push    esi                                     ; 17C5 _ 56
        sub     esp, 44                                 ; 17C6 _ 83. EC, 2C
        mov     eax, dword [ebp+1CH]                    ; 17C9 _ 8B. 45, 1C
        mov     ecx, dword [ebp+18H]                    ; 17CC _ 8B. 4D, 18
        mov     edx, dword [ebp+14H]                    ; 17CF _ 8B. 55, 14
        mov     esi, dword [ebp+10H]                    ; 17D2 _ 8B. 75, 10
        mov     edi, dword [ebp+0CH]                    ; 17D5 _ 8B. 7D, 0C
        mov     ebx, dword [ebp+8H]                     ; 17D8 _ 8B. 5D, 08
        mov     dword [ebp-10H], eax                    ; 17DB _ 89. 45, F0
        mov     eax, dword [ebp+0CH]                    ; 17DE _ 8B. 45, 0C
        cmp     dword [eax+18H], 0                      ; 17E1 _ 83. 78, 18, 00
        mov     dword [ebp-14H], ecx                    ; 17E5 _ 89. 4D, EC
        mov     dword [ebp-18H], edx                    ; 17E8 _ 89. 55, E8
        mov     dword [ebp-1CH], esi                    ; 17EB _ 89. 75, E4
        mov     dword [ebp-20H], edi                    ; 17EE _ 89. 7D, E0
        mov     dword [ebp-24H], ebx                    ; 17F1 _ 89. 5D, DC
; Note: Immediate operand could be made smaller by sign extension
        jl      ?_075                                   ; 17F4 _ 0F 8C, 0000003F
        mov     eax, dword [ebp+8H]                     ; 17FA _ 8B. 45, 08
        mov     ecx, dword [ebp+0CH]                    ; 17FD _ 8B. 4D, 0C
        mov     ecx, dword [ecx+0CH]                    ; 1800 _ 8B. 49, 0C
        add     ecx, dword [ebp+10H]                    ; 1803 _ 03. 4D, 10
        mov     edx, dword [ebp+0CH]                    ; 1806 _ 8B. 55, 0C
        mov     edx, dword [edx+10H]                    ; 1809 _ 8B. 52, 10
        add     edx, dword [ebp+14H]                    ; 180C _ 03. 55, 14
        mov     esi, dword [ebp+0CH]                    ; 180F _ 8B. 75, 0C
        mov     esi, dword [esi+0CH]                    ; 1812 _ 8B. 76, 0C
        add     esi, dword [ebp+18H]                    ; 1815 _ 03. 75, 18
        mov     edi, dword [ebp+0CH]                    ; 1818 _ 8B. 7D, 0C
        mov     edi, dword [edi+10H]                    ; 181B _ 8B. 7F, 10
        add     edi, dword [ebp+1CH]                    ; 181E _ 03. 7D, 1C
        mov     dword [esp], eax                        ; 1821 _ 89. 04 24
        mov     dword [esp+4H], ecx                     ; 1824 _ 89. 4C 24, 04
        mov     dword [esp+8H], edx                     ; 1828 _ 89. 54 24, 08
        mov     dword [esp+0CH], esi                    ; 182C _ 89. 74 24, 0C
        mov     dword [esp+10H], edi                    ; 1830 _ 89. 7C 24, 10
        call    sheet_refreshsub                        ; 1834 _ E8, 00000E37
?_075:  xor     eax, eax                                ; 1839 _ 31. C0
        add     esp, 44                                 ; 183B _ 83. C4, 2C
        pop     esi                                     ; 183E _ 5E
        pop     edi                                     ; 183F _ 5F
        pop     ebx                                     ; 1840 _ 5B
        pop     ebp                                     ; 1841 _ 5D
        ret                                             ; 1842 _ C3
; sheet_refresh End of function

; Filling space: 0DH
; Filler type: Multi-byte NOP
;       db 66H, 2EH, 0FH, 1FH, 84H, 00H, 00H, 00H
;       db 00H, 00H, 0FH, 1FH, 00H

ALIGN   16

intToHexStr:; Function begin
        push    ebp                                     ; 1850 _ 55
        mov     ebp, esp                                ; 1851 _ 89. E5
        sub     esp, 20                                 ; 1853 _ 83. EC, 14
        mov     eax, dword [ebp+8H]                     ; 1856 _ 8B. 45, 08
        mov     byte [intToHexStr.str], 48              ; 1859 _ C6. 05, 0000014C(d), 30
        mov     byte [?_150], 88                        ; 1860 _ C6. 05, 0000014D(d), 58
        mov     byte [?_151], 0                         ; 1867 _ C6. 05, 00000156(d), 00
        mov     dword [ebp-4H], 2                       ; 186E _ C7. 45, FC, 00000002
        mov     dword [ebp-10H], eax                    ; 1875 _ 89. 45, F0
?_076:  cmp     dword [ebp-4H], 10                      ; 1878 _ 83. 7D, FC, 0A
; Note: Immediate operand could be made smaller by sign extension
        jge     ?_077                                   ; 187C _ 0F 8D, 00000019
        mov     eax, dword [ebp-4H]                     ; 1882 _ 8B. 45, FC
; Note: SIB byte unnecessary here
        mov     byte [intToHexStr.str+eax], 48          ; 1885 _ C6. 04 05, 0000014C(d), 30
        mov     eax, dword [ebp-4H]                     ; 188D _ 8B. 45, FC
        add     eax, 1                                  ; 1890 _ 83. C0, 01
        mov     dword [ebp-4H], eax                     ; 1893 _ 89. 45, FC
; Note: Immediate operand could be made smaller by sign extension
        jmp     ?_076                                   ; 1896 _ E9, FFFFFFDD

?_077:  mov     dword [ebp-8H], 9                       ; 189B _ C7. 45, F8, 00000009
?_078:  xor     eax, eax                                ; 18A2 _ 31. C0
        mov     cl, al                                  ; 18A4 _ 88. C1
        cmp     dword [ebp-8H], 1                       ; 18A6 _ 83. 7D, F8, 01
        mov     byte [ebp-11H], cl                      ; 18AA _ 88. 4D, EF
; Note: Immediate operand could be made smaller by sign extension
        jle     ?_079                                   ; 18AD _ 0F 8E, 0000000A
        cmp     dword [ebp+8H], 0                       ; 18B3 _ 83. 7D, 08, 00
        seta    al                                      ; 18B7 _ 0F 97. C0
        mov     byte [ebp-11H], al                      ; 18BA _ 88. 45, EF
?_079:  mov     al, byte [ebp-11H]                      ; 18BD _ 8A. 45, EF
        test    al, 01H                                 ; 18C0 _ A8, 01
; Note: Immediate operand could be made smaller by sign extension
        jne     ?_080                                   ; 18C2 _ 0F 85, 00000005
; Note: Immediate operand could be made smaller by sign extension
        jmp     ?_083                                   ; 18C8 _ E9, 00000056

?_080:  mov     eax, dword [ebp+8H]                     ; 18CD _ 8B. 45, 08
        and     eax, 0FH                                ; 18D0 _ 83. E0, 0F
        mov     dword [ebp-0CH], eax                    ; 18D3 _ 89. 45, F4
        mov     eax, dword [ebp+8H]                     ; 18D6 _ 8B. 45, 08
        shr     eax, 4                                  ; 18D9 _ C1. E8, 04
        mov     dword [ebp+8H], eax                     ; 18DC _ 89. 45, 08
        cmp     dword [ebp-0CH], 10                     ; 18DF _ 83. 7D, F4, 0A
; Note: Immediate operand could be made smaller by sign extension
        jl      ?_081                                   ; 18E3 _ 0F 8C, 0000001A
        mov     eax, dword [ebp-0CH]                    ; 18E9 _ 8B. 45, F4
        add     eax, 65                                 ; 18EC _ 83. C0, 41
        sub     eax, 10                                 ; 18EF _ 83. E8, 0A
        mov     cl, al                                  ; 18F2 _ 88. C1
        mov     eax, dword [ebp-8H]                     ; 18F4 _ 8B. 45, F8
; Note: SIB byte unnecessary here
        mov     byte [intToHexStr.str+eax], cl          ; 18F7 _ 88. 0C 05, 0000014C(d)
; Note: Immediate operand could be made smaller by sign extension
        jmp     ?_082                                   ; 18FE _ E9, 00000012

?_081:  mov     eax, dword [ebp-0CH]                    ; 1903 _ 8B. 45, F4
        add     eax, 48                                 ; 1906 _ 83. C0, 30
        mov     cl, al                                  ; 1909 _ 88. C1
        mov     eax, dword [ebp-8H]                     ; 190B _ 8B. 45, F8
; Note: SIB byte unnecessary here
        mov     byte [intToHexStr.str+eax], cl          ; 190E _ 88. 0C 05, 0000014C(d)
?_082:  mov     eax, dword [ebp-8H]                     ; 1915 _ 8B. 45, F8
        add     eax, -1                                 ; 1918 _ 83. C0, FF
        mov     dword [ebp-8H], eax                     ; 191B _ 89. 45, F8
        jmp     ?_078                                   ; 191E _ E9, FFFFFF7F

?_083:  lea     eax, [intToHexStr.str]                  ; 1923 _ 8D. 05, 0000014C(d)
        add     esp, 20                                 ; 1929 _ 83. C4, 14
        pop     ebp                                     ; 192C _ 5D
        ret                                             ; 192D _ C3
; intToHexStr End of function

; Filling space: 2H
; Filler type: NOP with prefixes
;       db 66H, 90H

ALIGN   8

boxfill8:; Function begin
        push    ebp                                     ; 1930 _ 55
        mov     ebp, esp                                ; 1931 _ 89. E5
        push    ebx                                     ; 1933 _ 53
        push    edi                                     ; 1934 _ 57
        push    esi                                     ; 1935 _ 56
        sub     esp, 36                                 ; 1936 _ 83. EC, 24
        mov     eax, dword [ebp+20H]                    ; 1939 _ 8B. 45, 20
        mov     ecx, dword [ebp+1CH]                    ; 193C _ 8B. 4D, 1C
        mov     edx, dword [ebp+18H]                    ; 193F _ 8B. 55, 18
        mov     esi, dword [ebp+14H]                    ; 1942 _ 8B. 75, 14
        mov     bl, byte [ebp+10H]                      ; 1945 _ 8A. 5D, 10
        mov     edi, dword [ebp+0CH]                    ; 1948 _ 8B. 7D, 0C
        mov     dword [ebp-18H], eax                    ; 194B _ 89. 45, E8
        mov     eax, dword [ebp+8H]                     ; 194E _ 8B. 45, 08
        mov     dword [ebp-1CH], eax                    ; 1951 _ 89. 45, E4
        mov     eax, dword [ebp+18H]                    ; 1954 _ 8B. 45, 18
        mov     dword [ebp-14H], eax                    ; 1957 _ 89. 45, EC
        mov     dword [ebp-20H], ecx                    ; 195A _ 89. 4D, E0
        mov     dword [ebp-24H], edx                    ; 195D _ 89. 55, DC
        mov     dword [ebp-28H], esi                    ; 1960 _ 89. 75, D8
        mov     byte [ebp-29H], bl                      ; 1963 _ 88. 5D, D7
        mov     dword [ebp-30H], edi                    ; 1966 _ 89. 7D, D0
?_084:  mov     eax, dword [ebp-14H]                    ; 1969 _ 8B. 45, EC
        cmp     eax, dword [ebp+20H]                    ; 196C _ 3B. 45, 20
; Note: Immediate operand could be made smaller by sign extension
        jg      ?_088                                   ; 196F _ 0F 8F, 00000046
        mov     eax, dword [ebp+14H]                    ; 1975 _ 8B. 45, 14
        mov     dword [ebp-10H], eax                    ; 1978 _ 89. 45, F0
?_085:  mov     eax, dword [ebp-10H]                    ; 197B _ 8B. 45, F0
        cmp     eax, dword [ebp+1CH]                    ; 197E _ 3B. 45, 1C
; Note: Immediate operand could be made smaller by sign extension
        jg      ?_086                                   ; 1981 _ 0F 8F, 00000021
        mov     al, byte [ebp+10H]                      ; 1987 _ 8A. 45, 10
        mov     ecx, dword [ebp+8H]                     ; 198A _ 8B. 4D, 08
        mov     edx, dword [ebp-14H]                    ; 198D _ 8B. 55, EC
        imul    edx, dword [ebp+0CH]                    ; 1990 _ 0F AF. 55, 0C
        add     edx, dword [ebp-10H]                    ; 1994 _ 03. 55, F0
        mov     byte [ecx+edx], al                      ; 1997 _ 88. 04 11
        mov     eax, dword [ebp-10H]                    ; 199A _ 8B. 45, F0
        add     eax, 1                                  ; 199D _ 83. C0, 01
        mov     dword [ebp-10H], eax                    ; 19A0 _ 89. 45, F0
; Note: Immediate operand could be made smaller by sign extension
        jmp     ?_085                                   ; 19A3 _ E9, FFFFFFD3

?_086:
; Note: Immediate operand could be made smaller by sign extension
        jmp     ?_087                                   ; 19A8 _ E9, 00000000

?_087:  mov     eax, dword [ebp-14H]                    ; 19AD _ 8B. 45, EC
        add     eax, 1                                  ; 19B0 _ 83. C0, 01
        mov     dword [ebp-14H], eax                    ; 19B3 _ 89. 45, EC
; Note: Immediate operand could be made smaller by sign extension
        jmp     ?_084                                   ; 19B6 _ E9, FFFFFFAE

?_088:  add     esp, 36                                 ; 19BB _ 83. C4, 24
        pop     esi                                     ; 19BE _ 5E
        pop     edi                                     ; 19BF _ 5F
        pop     ebx                                     ; 19C0 _ 5B
        pop     ebp                                     ; 19C1 _ 5D
        ret                                             ; 19C2 _ C3
; boxfill8 End of function

; Filling space: 0DH
; Filler type: Multi-byte NOP
;       db 66H, 2EH, 0FH, 1FH, 84H, 00H, 00H, 00H
;       db 00H, 00H, 0FH, 1FH, 00H

ALIGN   16

showString:; Function begin
        push    ebp                                     ; 19D0 _ 55
        mov     ebp, esp                                ; 19D1 _ 89. E5
        push    ebx                                     ; 19D3 _ 53
        push    edi                                     ; 19D4 _ 57
        push    esi                                     ; 19D5 _ 56
        sub     esp, 60                                 ; 19D6 _ 83. EC, 3C
        mov     eax, dword [ebp+1CH]                    ; 19D9 _ 8B. 45, 1C
        mov     cl, byte [ebp+18H]                      ; 19DC _ 8A. 4D, 18
        mov     edx, dword [ebp+14H]                    ; 19DF _ 8B. 55, 14
        mov     esi, dword [ebp+10H]                    ; 19E2 _ 8B. 75, 10
        mov     edi, dword [ebp+0CH]                    ; 19E5 _ 8B. 7D, 0C
        mov     ebx, dword [ebp+8H]                     ; 19E8 _ 8B. 5D, 08
        mov     dword [ebp-10H], eax                    ; 19EB _ 89. 45, F0
        mov     byte [ebp-11H], cl                      ; 19EE _ 88. 4D, EF
        mov     dword [ebp-18H], edx                    ; 19F1 _ 89. 55, E8
        mov     dword [ebp-1CH], esi                    ; 19F4 _ 89. 75, E4
        mov     dword [ebp-20H], edi                    ; 19F7 _ 89. 7D, E0
        mov     dword [ebp-24H], ebx                    ; 19FA _ 89. 5D, DC
?_089:  mov     eax, dword [ebp+1CH]                    ; 19FD _ 8B. 45, 1C
        movzx   eax, byte [eax]                         ; 1A00 _ 0F B6. 00
        cmp     eax, 0                                  ; 1A03 _ 83. F8, 00
; Note: Immediate operand could be made smaller by sign extension
        je      ?_090                                   ; 1A06 _ 0F 84, 0000005C
        mov     eax, dword [ebp+8H]                     ; 1A0C _ 8B. 45, 08
        mov     ecx, dword [ebp+0CH]                    ; 1A0F _ 8B. 4D, 0C
        mov     edx, dword [ebp+10H]                    ; 1A12 _ 8B. 55, 10
        mov     esi, dword [ebp+14H]                    ; 1A15 _ 8B. 75, 14
        mov     bl, byte [ebp+18H]                      ; 1A18 _ 8A. 5D, 18
        mov     edi, dword [ebp+1CH]                    ; 1A1B _ 8B. 7D, 1C
        movzx   edi, byte [edi]                         ; 1A1E _ 0F B6. 3F
        shl     edi, 4                                  ; 1A21 _ C1. E7, 04
        mov     dword [ebp-28H], eax                    ; 1A24 _ 89. 45, D8
        lea     eax, [systemFont]                       ; 1A27 _ 8D. 05, 00000000(d)
        add     eax, edi                                ; 1A2D _ 01. F8
        mov     edi, dword [ebp-28H]                    ; 1A2F _ 8B. 7D, D8
        mov     dword [esp], edi                        ; 1A32 _ 89. 3C 24
        mov     dword [esp+4H], ecx                     ; 1A35 _ 89. 4C 24, 04
        mov     dword [esp+8H], edx                     ; 1A39 _ 89. 54 24, 08
        mov     dword [esp+0CH], esi                    ; 1A3D _ 89. 74 24, 0C
        movsx   ecx, bl                                 ; 1A41 _ 0F BE. CB
        mov     dword [esp+10H], ecx                    ; 1A44 _ 89. 4C 24, 10
        mov     dword [esp+14H], eax                    ; 1A48 _ 89. 44 24, 14
        call    showFont8                               ; 1A4C _ E8, 0000045F
        mov     eax, dword [ebp+10H]                    ; 1A51 _ 8B. 45, 10
        add     eax, 8                                  ; 1A54 _ 83. C0, 08
        mov     dword [ebp+10H], eax                    ; 1A57 _ 89. 45, 10
        mov     eax, dword [ebp+1CH]                    ; 1A5A _ 8B. 45, 1C
        add     eax, 1                                  ; 1A5D _ 83. C0, 01
        mov     dword [ebp+1CH], eax                    ; 1A60 _ 89. 45, 1C
; Note: Immediate operand could be made smaller by sign extension
        jmp     ?_089                                   ; 1A63 _ E9, FFFFFF95

?_090:  add     esp, 60                                 ; 1A68 _ 83. C4, 3C
        pop     esi                                     ; 1A6B _ 5E
        pop     edi                                     ; 1A6C _ 5F
        pop     ebx                                     ; 1A6D _ 5B
        pop     ebp                                     ; 1A6E _ 5D
        ret                                             ; 1A6F _ C3
; showString End of function

fifo8_status:; Function begin
        push    ebp                                     ; 1A70 _ 55
        mov     ebp, esp                                ; 1A71 _ 89. E5
        push    eax                                     ; 1A73 _ 50
        mov     eax, dword [ebp+8H]                     ; 1A74 _ 8B. 45, 08
        mov     ecx, dword [ebp+8H]                     ; 1A77 _ 8B. 4D, 08
        mov     ecx, dword [ecx+0CH]                    ; 1A7A _ 8B. 49, 0C
        mov     edx, dword [ebp+8H]                     ; 1A7D _ 8B. 55, 08
        sub     ecx, dword [edx+10H]                    ; 1A80 _ 2B. 4A, 10
        mov     dword [ebp-4H], eax                     ; 1A83 _ 89. 45, FC
        mov     eax, ecx                                ; 1A86 _ 89. C8
        add     esp, 4                                  ; 1A88 _ 83. C4, 04
        pop     ebp                                     ; 1A8B _ 5D
        ret                                             ; 1A8C _ C3
; fifo8_status End of function

; Filling space: 3H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 00H

ALIGN   8

fifo8_get:; Function begin
        push    ebp                                     ; 1A90 _ 55
        mov     ebp, esp                                ; 1A91 _ 89. E5
        sub     esp, 12                                 ; 1A93 _ 83. EC, 0C
        mov     eax, dword [ebp+8H]                     ; 1A96 _ 8B. 45, 08
        mov     ecx, dword [ebp+8H]                     ; 1A99 _ 8B. 4D, 08
        mov     ecx, dword [ecx+10H]                    ; 1A9C _ 8B. 49, 10
        mov     edx, dword [ebp+8H]                     ; 1A9F _ 8B. 55, 08
        cmp     ecx, dword [edx+0CH]                    ; 1AA2 _ 3B. 4A, 0C
        mov     dword [ebp-0CH], eax                    ; 1AA5 _ 89. 45, F4
; Note: Immediate operand could be made smaller by sign extension
        jne     ?_091                                   ; 1AA8 _ 0F 85, 0000000C
        mov     dword [ebp-4H], -1                      ; 1AAE _ C7. 45, FC, FFFFFFFF
; Note: Immediate operand could be made smaller by sign extension
        jmp     ?_093                                   ; 1AB5 _ E9, 0000004C

?_091:  mov     eax, dword [ebp+8H]                     ; 1ABA _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1ABD _ 8B. 00
        mov     ecx, dword [ebp+8H]                     ; 1ABF _ 8B. 4D, 08
        mov     ecx, dword [ecx+8H]                     ; 1AC2 _ 8B. 49, 08
        movzx   eax, byte [eax+ecx]                     ; 1AC5 _ 0F B6. 04 08
        mov     dword [ebp-8H], eax                     ; 1AC9 _ 89. 45, F8
        mov     eax, dword [ebp+8H]                     ; 1ACC _ 8B. 45, 08
        mov     ecx, dword [eax+8H]                     ; 1ACF _ 8B. 48, 08
        add     ecx, 1                                  ; 1AD2 _ 83. C1, 01
        mov     dword [eax+8H], ecx                     ; 1AD5 _ 89. 48, 08
        mov     eax, dword [ebp+8H]                     ; 1AD8 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 1ADB _ 8B. 40, 08
        mov     ecx, dword [ebp+8H]                     ; 1ADE _ 8B. 4D, 08
        cmp     eax, dword [ecx+0CH]                    ; 1AE1 _ 3B. 41, 0C
; Note: Immediate operand could be made smaller by sign extension
        jne     ?_092                                   ; 1AE4 _ 0F 85, 0000000A
        mov     eax, dword [ebp+8H]                     ; 1AEA _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 1AED _ C7. 40, 08, 00000000
?_092:  mov     eax, dword [ebp+8H]                     ; 1AF4 _ 8B. 45, 08
        mov     ecx, dword [eax+10H]                    ; 1AF7 _ 8B. 48, 10
        add     ecx, 1                                  ; 1AFA _ 83. C1, 01
        mov     dword [eax+10H], ecx                    ; 1AFD _ 89. 48, 10
        mov     eax, dword [ebp-8H]                     ; 1B00 _ 8B. 45, F8
        mov     dword [ebp-4H], eax                     ; 1B03 _ 89. 45, FC
?_093:  mov     eax, dword [ebp-4H]                     ; 1B06 _ 8B. 45, FC
        add     esp, 12                                 ; 1B09 _ 83. C4, 0C
        pop     ebp                                     ; 1B0C _ 5D
        ret                                             ; 1B0D _ C3
; fifo8_get End of function

; Filling space: 2H
; Filler type: NOP with prefixes
;       db 66H, 90H

ALIGN   8

mouse_decode:; Function begin
        push    ebp                                     ; 1B10 _ 55
        mov     ebp, esp                                ; 1B11 _ 89. E5
        sub     esp, 12                                 ; 1B13 _ 83. EC, 0C
        mov     al, byte [ebp+0CH]                      ; 1B16 _ 8A. 45, 0C
        mov     ecx, dword [ebp+8H]                     ; 1B19 _ 8B. 4D, 08
        mov     edx, dword [ebp+8H]                     ; 1B1C _ 8B. 55, 08
        movzx   edx, byte [edx+3H]                      ; 1B1F _ 0F B6. 52, 03
        cmp     edx, 0                                  ; 1B23 _ 83. FA, 00
        mov     byte [ebp-5H], al                       ; 1B26 _ 88. 45, FB
        mov     dword [ebp-0CH], ecx                    ; 1B29 _ 89. 4D, F4
; Note: Immediate operand could be made smaller by sign extension
        jne     ?_095                                   ; 1B2C _ 0F 85, 00000022
        movzx   eax, byte [ebp+0CH]                     ; 1B32 _ 0F B6. 45, 0C
        cmp     eax, 250                                ; 1B36 _ 3D, 000000FA
; Note: Immediate operand could be made smaller by sign extension
        jne     ?_094                                   ; 1B3B _ 0F 85, 00000007
        mov     eax, dword [ebp+8H]                     ; 1B41 _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 1B44 _ C6. 40, 03, 01
?_094:  mov     dword [ebp-4H], 0                       ; 1B48 _ C7. 45, FC, 00000000
        jmp     ?_102                                   ; 1B4F _ E9, 00000115

?_095:  mov     eax, dword [ebp+8H]                     ; 1B54 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 1B57 _ 0F B6. 40, 03
        cmp     eax, 1                                  ; 1B5B _ 83. F8, 01
; Note: Immediate operand could be made smaller by sign extension
        jne     ?_097                                   ; 1B5E _ 0F 85, 0000002D
        movzx   eax, byte [ebp+0CH]                     ; 1B64 _ 0F B6. 45, 0C
        and     eax, 0C8H                               ; 1B68 _ 25, 000000C8
        cmp     eax, 8                                  ; 1B6D _ 83. F8, 08
; Note: Immediate operand could be made smaller by sign extension
        jne     ?_096                                   ; 1B70 _ 0F 85, 0000000F
        mov     al, byte [ebp+0CH]                      ; 1B76 _ 8A. 45, 0C
        mov     ecx, dword [ebp+8H]                     ; 1B79 _ 8B. 4D, 08
        mov     byte [ecx], al                          ; 1B7C _ 88. 01
        mov     ecx, dword [ebp+8H]                     ; 1B7E _ 8B. 4D, 08
        mov     byte [ecx+3H], 2                        ; 1B81 _ C6. 41, 03, 02
?_096:  mov     dword [ebp-4H], 0                       ; 1B85 _ C7. 45, FC, 00000000
        jmp     ?_102                                   ; 1B8C _ E9, 000000D8

?_097:  mov     eax, dword [ebp+8H]                     ; 1B91 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 1B94 _ 0F B6. 40, 03
        cmp     eax, 2                                  ; 1B98 _ 83. F8, 02
; Note: Immediate operand could be made smaller by sign extension
        jne     ?_098                                   ; 1B9B _ 0F 85, 0000001C
        mov     al, byte [ebp+0CH]                      ; 1BA1 _ 8A. 45, 0C
        mov     ecx, dword [ebp+8H]                     ; 1BA4 _ 8B. 4D, 08
        mov     byte [ecx+1H], al                       ; 1BA7 _ 88. 41, 01
        mov     ecx, dword [ebp+8H]                     ; 1BAA _ 8B. 4D, 08
        mov     byte [ecx+3H], 3                        ; 1BAD _ C6. 41, 03, 03
        mov     dword [ebp-4H], 0                       ; 1BB1 _ C7. 45, FC, 00000000
        jmp     ?_102                                   ; 1BB8 _ E9, 000000AC

?_098:  mov     eax, dword [ebp+8H]                     ; 1BBD _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 1BC0 _ 0F B6. 40, 03
        cmp     eax, 3                                  ; 1BC4 _ 83. F8, 03
        jne     ?_101                                   ; 1BC7 _ 0F 85, 00000095
        mov     al, byte [ebp+0CH]                      ; 1BCD _ 8A. 45, 0C
        mov     ecx, dword [ebp+8H]                     ; 1BD0 _ 8B. 4D, 08
        mov     byte [ecx+2H], al                       ; 1BD3 _ 88. 41, 02
        mov     ecx, dword [ebp+8H]                     ; 1BD6 _ 8B. 4D, 08
        mov     byte [ecx+3H], 1                        ; 1BD9 _ C6. 41, 03, 01
        mov     ecx, dword [ebp+8H]                     ; 1BDD _ 8B. 4D, 08
        movzx   ecx, byte [ecx]                         ; 1BE0 _ 0F B6. 09
        and     ecx, 07H                                ; 1BE3 _ 83. E1, 07
        mov     edx, dword [ebp+8H]                     ; 1BE6 _ 8B. 55, 08
        mov     dword [edx+0CH], ecx                    ; 1BE9 _ 89. 4A, 0C
        mov     ecx, dword [ebp+8H]                     ; 1BEC _ 8B. 4D, 08
        movzx   ecx, byte [ecx+1H]                      ; 1BEF _ 0F B6. 49, 01
        mov     edx, dword [ebp+8H]                     ; 1BF3 _ 8B. 55, 08
        mov     dword [edx+4H], ecx                     ; 1BF6 _ 89. 4A, 04
        mov     ecx, dword [ebp+8H]                     ; 1BF9 _ 8B. 4D, 08
        movzx   ecx, byte [ecx+2H]                      ; 1BFC _ 0F B6. 49, 02
        mov     edx, dword [ebp+8H]                     ; 1C00 _ 8B. 55, 08
        mov     dword [edx+8H], ecx                     ; 1C03 _ 89. 4A, 08
        mov     ecx, dword [ebp+8H]                     ; 1C06 _ 8B. 4D, 08
        movzx   ecx, byte [ecx]                         ; 1C09 _ 0F B6. 09
        and     ecx, 10H                                ; 1C0C _ 83. E1, 10
        cmp     ecx, 0                                  ; 1C0F _ 83. F9, 00
; Note: Immediate operand could be made smaller by sign extension
        je      ?_099                                   ; 1C12 _ 0F 84, 0000000F
        mov     eax, dword [ebp+8H]                     ; 1C18 _ 8B. 45, 08
        mov     ecx, dword [eax+4H]                     ; 1C1B _ 8B. 48, 04
        or      ecx, 0FFFFFF00H                         ; 1C1E _ 81. C9, FFFFFF00
        mov     dword [eax+4H], ecx                     ; 1C24 _ 89. 48, 04
?_099:  mov     eax, dword [ebp+8H]                     ; 1C27 _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 1C2A _ 0F B6. 00
        and     eax, 20H                                ; 1C2D _ 83. E0, 20
        cmp     eax, 0                                  ; 1C30 _ 83. F8, 00
; Note: Immediate operand could be made smaller by sign extension
        je      ?_100                                   ; 1C33 _ 0F 84, 0000000F
        mov     eax, dword [ebp+8H]                     ; 1C39 _ 8B. 45, 08
        mov     ecx, dword [eax+8H]                     ; 1C3C _ 8B. 48, 08
        or      ecx, 0FFFFFF00H                         ; 1C3F _ 81. C9, FFFFFF00
        mov     dword [eax+8H], ecx                     ; 1C45 _ 89. 48, 08
?_100:  xor     eax, eax                                ; 1C48 _ 31. C0
        mov     ecx, dword [ebp+8H]                     ; 1C4A _ 8B. 4D, 08
        sub     eax, dword [ecx+8H]                     ; 1C4D _ 2B. 41, 08
        mov     ecx, dword [ebp+8H]                     ; 1C50 _ 8B. 4D, 08
        mov     dword [ecx+8H], eax                     ; 1C53 _ 89. 41, 08
        mov     dword [ebp-4H], 1                       ; 1C56 _ C7. 45, FC, 00000001
; Note: Immediate operand could be made smaller by sign extension
        jmp     ?_102                                   ; 1C5D _ E9, 00000007

?_101:  mov     dword [ebp-4H], -1                      ; 1C62 _ C7. 45, FC, FFFFFFFF
?_102:  mov     eax, dword [ebp-4H]                     ; 1C69 _ 8B. 45, FC
        add     esp, 12                                 ; 1C6C _ 83. C4, 0C
        pop     ebp                                     ; 1C6F _ 5D
        ret                                             ; 1C70 _ C3
; mouse_decode End of function

; Filling space: 0FH
; Filler type: Multi-byte NOP
;       db 66H, 2EH, 0FH, 1FH, 84H, 00H, 00H, 00H
;       db 00H, 00H, 0FH, 1FH, 44H, 00H, 00H

ALIGN   16

charToHexVal:; Function begin
        push    ebp                                     ; 1C80 _ 55
        mov     ebp, esp                                ; 1C81 _ 89. E5
        push    eax                                     ; 1C83 _ 50
        mov     al, byte [ebp+8H]                       ; 1C84 _ 8A. 45, 08
        movzx   ecx, byte [ebp+8H]                      ; 1C87 _ 0F B6. 4D, 08
        cmp     ecx, 10                                 ; 1C8B _ 83. F9, 0A
        mov     byte [ebp-2H], al                       ; 1C8E _ 88. 45, FE
; Note: Immediate operand could be made smaller by sign extension
        jl      ?_103                                   ; 1C91 _ 0F 8C, 00000014
        movzx   eax, byte [ebp+8H]                      ; 1C97 _ 0F B6. 45, 08
        add     eax, 65                                 ; 1C9B _ 83. C0, 41
        sub     eax, 10                                 ; 1C9E _ 83. E8, 0A
        mov     cl, al                                  ; 1CA1 _ 88. C1
        mov     byte [ebp-1H], cl                       ; 1CA3 _ 88. 4D, FF
; Note: Immediate operand could be made smaller by sign extension
        jmp     ?_104                                   ; 1CA6 _ E9, 0000000C

?_103:  movzx   eax, byte [ebp+8H]                      ; 1CAB _ 0F B6. 45, 08
        add     eax, 48                                 ; 1CAF _ 83. C0, 30
        mov     cl, al                                  ; 1CB2 _ 88. C1
        mov     byte [ebp-1H], cl                       ; 1CB4 _ 88. 4D, FF
?_104:  movzx   eax, byte [ebp-1H]                      ; 1CB7 _ 0F B6. 45, FF
        add     esp, 4                                  ; 1CBB _ 83. C4, 04
        pop     ebp                                     ; 1CBE _ 5D
        ret                                             ; 1CBF _ C3
; charToHexVal End of function

charToHexStr:; Function begin
        push    ebp                                     ; 1CC0 _ 55
        mov     ebp, esp                                ; 1CC1 _ 89. E5
        push    ebx                                     ; 1CC3 _ 53
        sub     esp, 20                                 ; 1CC4 _ 83. EC, 14
        mov     al, byte [ebp+8H]                       ; 1CC7 _ 8A. 45, 08
        mov     dword [ebp-8H], 0                       ; 1CCA _ C7. 45, F8, 00000000
        movzx   ecx, byte [ebp+8H]                      ; 1CD1 _ 0F B6. 4D, 08
        mov     byte [ebp-0AH], al                      ; 1CD5 _ 88. 45, F6
        mov     eax, ecx                                ; 1CD8 _ 89. C8
        cdq                                             ; 1CDA _ 99
        mov     ecx, 16                                 ; 1CDB _ B9, 00000010
        idiv    ecx                                     ; 1CE0 _ F7. F9
        mov     bl, dl                                  ; 1CE2 _ 88. D3
        mov     byte [ebp-9H], bl                       ; 1CE4 _ 88. 5D, F7
        movzx   ecx, byte [ebp-9H]                      ; 1CE7 _ 0F B6. 4D, F7
        mov     dword [esp], ecx                        ; 1CEB _ 89. 0C 24
        call    charToHexVal                            ; 1CEE _ E8, FFFFFF8D
        mov     byte [?_153], al                        ; 1CF3 _ A2, 00000012(d)
        movzx   eax, byte [ebp+8H]                      ; 1CF8 _ 0F B6. 45, 08
        cdq                                             ; 1CFC _ 99
        mov     ecx, 16                                 ; 1CFD _ B9, 00000010
        idiv    ecx                                     ; 1D02 _ F7. F9
        mov     bl, al                                  ; 1D04 _ 88. C3
        mov     byte [ebp+8H], bl                       ; 1D06 _ 88. 5D, 08
        movzx   eax, byte [ebp+8H]                      ; 1D09 _ 0F B6. 45, 08
        mov     dword [esp], eax                        ; 1D0D _ 89. 04 24
        call    charToHexVal                            ; 1D10 _ E8, FFFFFF6B
        mov     byte [?_152], al                        ; 1D15 _ A2, 00000011(d)
        lea     eax, [keyval]                           ; 1D1A _ 8D. 05, 0000000F(d)
        add     esp, 20                                 ; 1D20 _ 83. C4, 14
        pop     ebx                                     ; 1D23 _ 5B
        pop     ebp                                     ; 1D24 _ 5D
        ret                                             ; 1D25 _ C3
; charToHexStr End of function

; Filling space: 0AH
; Filler type: Multi-byte NOP
;       db 66H, 2EH, 0FH, 1FH, 84H, 00H, 00H, 00H
;       db 00H, 00H

ALIGN   16

set_palette:; Function begin
        push    ebp                                     ; 1D30 _ 55
        mov     ebp, esp                                ; 1D31 _ 89. E5
        sub     esp, 40                                 ; 1D33 _ 83. EC, 28
        mov     eax, dword [ebp+10H]                    ; 1D36 _ 8B. 45, 10
        mov     ecx, dword [ebp+0CH]                    ; 1D39 _ 8B. 4D, 0C
        mov     edx, dword [ebp+8H]                     ; 1D3C _ 8B. 55, 08
        mov     dword [ebp-0CH], eax                    ; 1D3F _ 89. 45, F4
        mov     dword [ebp-10H], ecx                    ; 1D42 _ 89. 4D, F0
        mov     dword [ebp-14H], edx                    ; 1D45 _ 89. 55, EC
        call    io_load_eflags                          ; 1D48 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-8H], eax                     ; 1D4D _ 89. 45, F8
        call    io_cli                                  ; 1D50 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 1D55 _ 8B. 45, 08
        mov     dword [esp], 968                        ; 1D58 _ C7. 04 24, 000003C8
        mov     dword [esp+4H], eax                     ; 1D5F _ 89. 44 24, 04
        call    io_out8                                 ; 1D63 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 1D68 _ 8B. 45, 08
        mov     dword [ebp-4H], eax                     ; 1D6B _ 89. 45, FC
?_105:  mov     eax, dword [ebp-4H]                     ; 1D6E _ 8B. 45, FC
        cmp     eax, dword [ebp+0CH]                    ; 1D71 _ 3B. 45, 0C
; Note: Immediate operand could be made smaller by sign extension
        jg      ?_106                                   ; 1D74 _ 0F 8F, 00000073
        mov     eax, dword [ebp+10H]                    ; 1D7A _ 8B. 45, 10
        movzx   eax, byte [eax]                         ; 1D7D _ 0F B6. 00
        cdq                                             ; 1D80 _ 99
        mov     ecx, 4                                  ; 1D81 _ B9, 00000004
        idiv    ecx                                     ; 1D86 _ F7. F9
        mov     dword [esp], 969                        ; 1D88 _ C7. 04 24, 000003C9
        mov     dword [esp+4H], eax                     ; 1D8F _ 89. 44 24, 04
        call    io_out8                                 ; 1D93 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 1D98 _ 8B. 45, 10
        movzx   eax, byte [eax+1H]                      ; 1D9B _ 0F B6. 40, 01
        cdq                                             ; 1D9F _ 99
        mov     ecx, 4                                  ; 1DA0 _ B9, 00000004
        idiv    ecx                                     ; 1DA5 _ F7. F9
        mov     dword [esp], 969                        ; 1DA7 _ C7. 04 24, 000003C9
        mov     dword [esp+4H], eax                     ; 1DAE _ 89. 44 24, 04
        call    io_out8                                 ; 1DB2 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 1DB7 _ 8B. 45, 10
        movzx   eax, byte [eax+2H]                      ; 1DBA _ 0F B6. 40, 02
        cdq                                             ; 1DBE _ 99
        mov     ecx, 4                                  ; 1DBF _ B9, 00000004
        idiv    ecx                                     ; 1DC4 _ F7. F9
        mov     dword [esp], 969                        ; 1DC6 _ C7. 04 24, 000003C9
        mov     dword [esp+4H], eax                     ; 1DCD _ 89. 44 24, 04
        call    io_out8                                 ; 1DD1 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 1DD6 _ 8B. 45, 10
        add     eax, 3                                  ; 1DD9 _ 83. C0, 03
        mov     dword [ebp+10H], eax                    ; 1DDC _ 89. 45, 10
        mov     eax, dword [ebp-4H]                     ; 1DDF _ 8B. 45, FC
        add     eax, 1                                  ; 1DE2 _ 83. C0, 01
        mov     dword [ebp-4H], eax                     ; 1DE5 _ 89. 45, FC
; Note: Immediate operand could be made smaller by sign extension
        jmp     ?_105                                   ; 1DE8 _ E9, FFFFFF81

?_106:  mov     eax, dword [ebp-8H]                     ; 1DED _ 8B. 45, F8
        mov     dword [esp], eax                        ; 1DF0 _ 89. 04 24
        call    io_store_eflags                         ; 1DF3 _ E8, FFFFFFFC(rel)
        add     esp, 40                                 ; 1DF8 _ 83. C4, 28
        pop     ebp                                     ; 1DFB _ 5D
        ret                                             ; 1DFC _ C3
; set_palette End of function

; Filling space: 3H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 00H

ALIGN   8

putblock:; Function begin
        push    ebp                                     ; 1E00 _ 55
        mov     ebp, esp                                ; 1E01 _ 89. E5
        push    ebx                                     ; 1E03 _ 53
        push    edi                                     ; 1E04 _ 57
        push    esi                                     ; 1E05 _ 56
        sub     esp, 40                                 ; 1E06 _ 83. EC, 28
        mov     eax, dword [ebp+24H]                    ; 1E09 _ 8B. 45, 24
        mov     ecx, dword [ebp+20H]                    ; 1E0C _ 8B. 4D, 20
        mov     edx, dword [ebp+1CH]                    ; 1E0F _ 8B. 55, 1C
        mov     esi, dword [ebp+18H]                    ; 1E12 _ 8B. 75, 18
        mov     edi, dword [ebp+14H]                    ; 1E15 _ 8B. 7D, 14
        mov     ebx, dword [ebp+10H]                    ; 1E18 _ 8B. 5D, 10
        mov     dword [ebp-18H], eax                    ; 1E1B _ 89. 45, E8
        mov     eax, dword [ebp+0CH]                    ; 1E1E _ 8B. 45, 0C
        mov     dword [ebp-1CH], eax                    ; 1E21 _ 89. 45, E4
        mov     eax, dword [ebp+8H]                     ; 1E24 _ 8B. 45, 08
        mov     dword [ebp-14H], 0                      ; 1E27 _ C7. 45, EC, 00000000
        mov     dword [ebp-20H], ecx                    ; 1E2E _ 89. 4D, E0
        mov     dword [ebp-24H], edx                    ; 1E31 _ 89. 55, DC
        mov     dword [ebp-28H], esi                    ; 1E34 _ 89. 75, D8
        mov     dword [ebp-2CH], edi                    ; 1E37 _ 89. 7D, D4
        mov     dword [ebp-30H], ebx                    ; 1E3A _ 89. 5D, D0
        mov     dword [ebp-34H], eax                    ; 1E3D _ 89. 45, CC
?_107:  mov     eax, dword [ebp-14H]                    ; 1E40 _ 8B. 45, EC
        cmp     eax, dword [ebp+14H]                    ; 1E43 _ 3B. 45, 14
; Note: Immediate operand could be made smaller by sign extension
        jge     ?_111                                   ; 1E46 _ 0F 8D, 0000005C
        mov     dword [ebp-10H], 0                      ; 1E4C _ C7. 45, F0, 00000000
?_108:  mov     eax, dword [ebp-10H]                    ; 1E53 _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 1E56 _ 3B. 45, 10
; Note: Immediate operand could be made smaller by sign extension
        jge     ?_109                                   ; 1E59 _ 0F 8D, 00000036
        mov     eax, dword [ebp+20H]                    ; 1E5F _ 8B. 45, 20
        mov     ecx, dword [ebp-14H]                    ; 1E62 _ 8B. 4D, EC
        imul    ecx, dword [ebp+24H]                    ; 1E65 _ 0F AF. 4D, 24
        add     ecx, dword [ebp-10H]                    ; 1E69 _ 03. 4D, F0
        mov     dl, byte [eax+ecx]                      ; 1E6C _ 8A. 14 08
        mov     eax, dword [ebp+8H]                     ; 1E6F _ 8B. 45, 08
        mov     ecx, dword [ebp+1CH]                    ; 1E72 _ 8B. 4D, 1C
        add     ecx, dword [ebp-14H]                    ; 1E75 _ 03. 4D, EC
        imul    ecx, dword [ebp+0CH]                    ; 1E78 _ 0F AF. 4D, 0C
        mov     esi, dword [ebp+18H]                    ; 1E7C _ 8B. 75, 18
        add     esi, dword [ebp-10H]                    ; 1E7F _ 03. 75, F0
        add     ecx, esi                                ; 1E82 _ 01. F1
        mov     byte [eax+ecx], dl                      ; 1E84 _ 88. 14 08
        mov     eax, dword [ebp-10H]                    ; 1E87 _ 8B. 45, F0
        add     eax, 1                                  ; 1E8A _ 83. C0, 01
        mov     dword [ebp-10H], eax                    ; 1E8D _ 89. 45, F0
; Note: Immediate operand could be made smaller by sign extension
        jmp     ?_108                                   ; 1E90 _ E9, FFFFFFBE

?_109:
; Note: Immediate operand could be made smaller by sign extension
        jmp     ?_110                                   ; 1E95 _ E9, 00000000

?_110:  mov     eax, dword [ebp-14H]                    ; 1E9A _ 8B. 45, EC
        add     eax, 1                                  ; 1E9D _ 83. C0, 01
        mov     dword [ebp-14H], eax                    ; 1EA0 _ 89. 45, EC
; Note: Immediate operand could be made smaller by sign extension
        jmp     ?_107                                   ; 1EA3 _ E9, FFFFFF98

?_111:  add     esp, 40                                 ; 1EA8 _ 83. C4, 28
        pop     esi                                     ; 1EAB _ 5E
        pop     edi                                     ; 1EAC _ 5F
        pop     ebx                                     ; 1EAD _ 5B
        pop     ebp                                     ; 1EAE _ 5D
        ret                                             ; 1EAF _ C3
; putblock End of function

showFont8:; Function begin
        push    ebp                                     ; 1EB0 _ 55
        mov     ebp, esp                                ; 1EB1 _ 89. E5
        push    ebx                                     ; 1EB3 _ 53
        push    edi                                     ; 1EB4 _ 57
        push    esi                                     ; 1EB5 _ 56
        sub     esp, 36                                 ; 1EB6 _ 83. EC, 24
        mov     eax, dword [ebp+1CH]                    ; 1EB9 _ 8B. 45, 1C
        mov     cl, byte [ebp+18H]                      ; 1EBC _ 8A. 4D, 18
        mov     edx, dword [ebp+14H]                    ; 1EBF _ 8B. 55, 14
        mov     esi, dword [ebp+10H]                    ; 1EC2 _ 8B. 75, 10
        mov     edi, dword [ebp+0CH]                    ; 1EC5 _ 8B. 7D, 0C
        mov     ebx, dword [ebp+8H]                     ; 1EC8 _ 8B. 5D, 08
        mov     dword [ebp-10H], 0                      ; 1ECB _ C7. 45, F0, 00000000
        mov     dword [ebp-1CH], eax                    ; 1ED2 _ 89. 45, E4
        mov     byte [ebp-1DH], cl                      ; 1ED5 _ 88. 4D, E3
        mov     dword [ebp-24H], edx                    ; 1ED8 _ 89. 55, DC
        mov     dword [ebp-28H], esi                    ; 1EDB _ 89. 75, D8
        mov     dword [ebp-2CH], edi                    ; 1EDE _ 89. 7D, D4
        mov     dword [ebp-30H], ebx                    ; 1EE1 _ 89. 5D, D0
?_112:  cmp     dword [ebp-10H], 16                     ; 1EE4 _ 83. 7D, F0, 10
        jge     ?_122                                   ; 1EE8 _ 0F 8D, 000000FD
        mov     eax, dword [ebp+8H]                     ; 1EEE _ 8B. 45, 08
        mov     ecx, dword [ebp+14H]                    ; 1EF1 _ 8B. 4D, 14
        add     ecx, dword [ebp-10H]                    ; 1EF4 _ 03. 4D, F0
        imul    ecx, dword [ebp+0CH]                    ; 1EF7 _ 0F AF. 4D, 0C
        add     eax, ecx                                ; 1EFB _ 01. C8
        add     eax, dword [ebp+10H]                    ; 1EFD _ 03. 45, 10
        mov     dword [ebp-14H], eax                    ; 1F00 _ 89. 45, EC
        mov     eax, dword [ebp+1CH]                    ; 1F03 _ 8B. 45, 1C
        mov     ecx, dword [ebp-10H]                    ; 1F06 _ 8B. 4D, F0
        mov     dl, byte [eax+ecx]                      ; 1F09 _ 8A. 14 08
        mov     byte [ebp-15H], dl                      ; 1F0C _ 88. 55, EB
        movsx   eax, byte [ebp-15H]                     ; 1F0F _ 0F BE. 45, EB
        and     eax, 80H                                ; 1F13 _ 25, 00000080
        cmp     eax, 0                                  ; 1F18 _ 83. F8, 00
; Note: Immediate operand could be made smaller by sign extension
        je      ?_113                                   ; 1F1B _ 0F 84, 00000008
        mov     al, byte [ebp+18H]                      ; 1F21 _ 8A. 45, 18
        mov     ecx, dword [ebp-14H]                    ; 1F24 _ 8B. 4D, EC
        mov     byte [ecx], al                          ; 1F27 _ 88. 01
?_113:  movsx   eax, byte [ebp-15H]                     ; 1F29 _ 0F BE. 45, EB
        and     eax, 40H                                ; 1F2D _ 83. E0, 40
        cmp     eax, 0                                  ; 1F30 _ 83. F8, 00
; Note: Immediate operand could be made smaller by sign extension
        je      ?_114                                   ; 1F33 _ 0F 84, 00000009
        mov     al, byte [ebp+18H]                      ; 1F39 _ 8A. 45, 18
        mov     ecx, dword [ebp-14H]                    ; 1F3C _ 8B. 4D, EC
        mov     byte [ecx+1H], al                       ; 1F3F _ 88. 41, 01
?_114:  movsx   eax, byte [ebp-15H]                     ; 1F42 _ 0F BE. 45, EB
        and     eax, 20H                                ; 1F46 _ 83. E0, 20
        cmp     eax, 0                                  ; 1F49 _ 83. F8, 00
; Note: Immediate operand could be made smaller by sign extension
        je      ?_115                                   ; 1F4C _ 0F 84, 00000009
        mov     al, byte [ebp+18H]                      ; 1F52 _ 8A. 45, 18
        mov     ecx, dword [ebp-14H]                    ; 1F55 _ 8B. 4D, EC
        mov     byte [ecx+2H], al                       ; 1F58 _ 88. 41, 02
?_115:  movsx   eax, byte [ebp-15H]                     ; 1F5B _ 0F BE. 45, EB
        and     eax, 10H                                ; 1F5F _ 83. E0, 10
        cmp     eax, 0                                  ; 1F62 _ 83. F8, 00
; Note: Immediate operand could be made smaller by sign extension
        je      ?_116                                   ; 1F65 _ 0F 84, 00000009
        mov     al, byte [ebp+18H]                      ; 1F6B _ 8A. 45, 18
        mov     ecx, dword [ebp-14H]                    ; 1F6E _ 8B. 4D, EC
        mov     byte [ecx+3H], al                       ; 1F71 _ 88. 41, 03
?_116:  movsx   eax, byte [ebp-15H]                     ; 1F74 _ 0F BE. 45, EB
        and     eax, 08H                                ; 1F78 _ 83. E0, 08
        cmp     eax, 0                                  ; 1F7B _ 83. F8, 00
; Note: Immediate operand could be made smaller by sign extension
        je      ?_117                                   ; 1F7E _ 0F 84, 00000009
        mov     al, byte [ebp+18H]                      ; 1F84 _ 8A. 45, 18
        mov     ecx, dword [ebp-14H]                    ; 1F87 _ 8B. 4D, EC
        mov     byte [ecx+4H], al                       ; 1F8A _ 88. 41, 04
?_117:  movsx   eax, byte [ebp-15H]                     ; 1F8D _ 0F BE. 45, EB
        and     eax, 04H                                ; 1F91 _ 83. E0, 04
        cmp     eax, 0                                  ; 1F94 _ 83. F8, 00
; Note: Immediate operand could be made smaller by sign extension
        je      ?_118                                   ; 1F97 _ 0F 84, 00000009
        mov     al, byte [ebp+18H]                      ; 1F9D _ 8A. 45, 18
        mov     ecx, dword [ebp-14H]                    ; 1FA0 _ 8B. 4D, EC
        mov     byte [ecx+5H], al                       ; 1FA3 _ 88. 41, 05
?_118:  movsx   eax, byte [ebp-15H]                     ; 1FA6 _ 0F BE. 45, EB
        and     eax, 02H                                ; 1FAA _ 83. E0, 02
        cmp     eax, 0                                  ; 1FAD _ 83. F8, 00
; Note: Immediate operand could be made smaller by sign extension
        je      ?_119                                   ; 1FB0 _ 0F 84, 00000009
        mov     al, byte [ebp+18H]                      ; 1FB6 _ 8A. 45, 18
        mov     ecx, dword [ebp-14H]                    ; 1FB9 _ 8B. 4D, EC
        mov     byte [ecx+6H], al                       ; 1FBC _ 88. 41, 06
?_119:  movsx   eax, byte [ebp-15H]                     ; 1FBF _ 0F BE. 45, EB
        and     eax, 01H                                ; 1FC3 _ 83. E0, 01
        cmp     eax, 0                                  ; 1FC6 _ 83. F8, 00
; Note: Immediate operand could be made smaller by sign extension
        je      ?_120                                   ; 1FC9 _ 0F 84, 00000009
        mov     al, byte [ebp+18H]                      ; 1FCF _ 8A. 45, 18
        mov     ecx, dword [ebp-14H]                    ; 1FD2 _ 8B. 4D, EC
        mov     byte [ecx+7H], al                       ; 1FD5 _ 88. 41, 07
?_120:
; Note: Immediate operand could be made smaller by sign extension
        jmp     ?_121                                   ; 1FD8 _ E9, 00000000

?_121:  mov     eax, dword [ebp-10H]                    ; 1FDD _ 8B. 45, F0
        add     eax, 1                                  ; 1FE0 _ 83. C0, 01
        mov     dword [ebp-10H], eax                    ; 1FE3 _ 89. 45, F0
        jmp     ?_112                                   ; 1FE6 _ E9, FFFFFEF9

?_122:  add     esp, 36                                 ; 1FEB _ 83. C4, 24
        pop     esi                                     ; 1FEE _ 5E
        pop     edi                                     ; 1FEF _ 5F
        pop     ebx                                     ; 1FF0 _ 5B
        pop     ebp                                     ; 1FF1 _ 5D
        ret                                             ; 1FF2 _ C3
; showFont8 End of function

; Filling space: 0DH
; Filler type: Multi-byte NOP
;       db 66H, 2EH, 0FH, 1FH, 84H, 00H, 00H, 00H
;       db 00H, 00H, 0FH, 1FH, 00H

ALIGN   16

fifo8_put:; Function begin
        push    ebp                                     ; 2000 _ 55
        mov     ebp, esp                                ; 2001 _ 89. E5
        sub     esp, 12                                 ; 2003 _ 83. EC, 0C
        mov     al, byte [ebp+0CH]                      ; 2006 _ 8A. 45, 0C
        mov     ecx, dword [ebp+8H]                     ; 2009 _ 8B. 4D, 08
        mov     edx, dword [ebp+8H]                     ; 200C _ 8B. 55, 08
        cmp     dword [edx+10H], 0                      ; 200F _ 83. 7A, 10, 00
        mov     byte [ebp-5H], al                       ; 2013 _ 88. 45, FB
        mov     dword [ebp-0CH], ecx                    ; 2016 _ 89. 4D, F4
; Note: Immediate operand could be made smaller by sign extension
        jne     ?_123                                   ; 2019 _ 0F 85, 00000018
        mov     eax, dword [ebp+8H]                     ; 201F _ 8B. 45, 08
        mov     ecx, dword [eax+14H]                    ; 2022 _ 8B. 48, 14
        or      ecx, 01H                                ; 2025 _ 83. C9, 01
        mov     dword [eax+14H], ecx                    ; 2028 _ 89. 48, 14
        mov     dword [ebp-4H], -1                      ; 202B _ C7. 45, FC, FFFFFFFF
; Note: Immediate operand could be made smaller by sign extension
        jmp     ?_125                                   ; 2032 _ E9, 0000004C

?_123:  mov     al, byte [ebp+0CH]                      ; 2037 _ 8A. 45, 0C
        mov     ecx, dword [ebp+8H]                     ; 203A _ 8B. 4D, 08
        mov     ecx, dword [ecx]                        ; 203D _ 8B. 09
        mov     edx, dword [ebp+8H]                     ; 203F _ 8B. 55, 08
        mov     edx, dword [edx+4H]                     ; 2042 _ 8B. 52, 04
        mov     byte [ecx+edx], al                      ; 2045 _ 88. 04 11
        mov     ecx, dword [ebp+8H]                     ; 2048 _ 8B. 4D, 08
        mov     edx, dword [ecx+4H]                     ; 204B _ 8B. 51, 04
        add     edx, 1                                  ; 204E _ 83. C2, 01
        mov     dword [ecx+4H], edx                     ; 2051 _ 89. 51, 04
        mov     ecx, dword [ebp+8H]                     ; 2054 _ 8B. 4D, 08
        mov     ecx, dword [ecx+4H]                     ; 2057 _ 8B. 49, 04
        mov     edx, dword [ebp+8H]                     ; 205A _ 8B. 55, 08
        cmp     ecx, dword [edx+0CH]                    ; 205D _ 3B. 4A, 0C
; Note: Immediate operand could be made smaller by sign extension
        jne     ?_124                                   ; 2060 _ 0F 85, 0000000A
        mov     eax, dword [ebp+8H]                     ; 2066 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 2069 _ C7. 40, 04, 00000000
?_124:  mov     eax, dword [ebp+8H]                     ; 2070 _ 8B. 45, 08
        mov     ecx, dword [eax+10H]                    ; 2073 _ 8B. 48, 10
        add     ecx, -1                                 ; 2076 _ 83. C1, FF
        mov     dword [eax+10H], ecx                    ; 2079 _ 89. 48, 10
        mov     dword [ebp-4H], 0                       ; 207C _ C7. 45, FC, 00000000
?_125:  mov     eax, dword [ebp-4H]                     ; 2083 _ 8B. 45, FC
        add     esp, 12                                 ; 2086 _ 83. C4, 0C
        pop     ebp                                     ; 2089 _ 5D
        ret                                             ; 208A _ C3
; fifo8_put End of function

; Filling space: 5H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 44H, 00H, 00H

ALIGN   8

intHandler21:; Function begin
        push    ebp                                     ; 2090 _ 55
        mov     ebp, esp                                ; 2091 _ 89. E5
        sub     esp, 24                                 ; 2093 _ 83. EC, 18
        mov     eax, dword [ebp+8H]                     ; 2096 _ 8B. 45, 08
        mov     dword [esp], 32                         ; 2099 _ C7. 04 24, 00000020
        mov     dword [esp+4H], 97                      ; 20A0 _ C7. 44 24, 04, 00000061
        mov     dword [ebp-8H], eax                     ; 20A8 _ 89. 45, F8
        call    io_out8                                 ; 20AB _ E8, FFFFFFFC(rel)
        mov     dword [esp], 96                         ; 20B0 _ C7. 04 24, 00000060
        call    io_in8                                  ; 20B7 _ E8, FFFFFFFC(rel)
        mov     cl, al                                  ; 20BC _ 88. C1
        mov     byte [ebp-1H], cl                       ; 20BE _ 88. 4D, FF
        lea     eax, [keyfifo]                          ; 20C1 _ 8D. 05, 00000000(d)
        mov     dword [esp], eax                        ; 20C7 _ 89. 04 24
        movzx   eax, byte [ebp-1H]                      ; 20CA _ 0F B6. 45, FF
        mov     dword [esp+4H], eax                     ; 20CE _ 89. 44 24, 04
        call    fifo8_put                               ; 20D2 _ E8, FFFFFF29
        mov     dword [ebp-0CH], eax                    ; 20D7 _ 89. 45, F4
        add     esp, 24                                 ; 20DA _ 83. C4, 18
        pop     ebp                                     ; 20DD _ 5D
        ret                                             ; 20DE _ C3
; intHandler21 End of function

        nop                                             ; 20DF _ 90

ALIGN   16
wait_KBC_sendready:; Function begin
        push    ebp                                     ; 20E0 _ 55
        mov     ebp, esp                                ; 20E1 _ 89. E5
        sub     esp, 8                                  ; 20E3 _ 83. EC, 08
; Note: Immediate operand could be made smaller by sign extension
        jmp     ?_126                                   ; 20E6 _ E9, 00000000

?_126:  mov     dword [esp], 100                        ; 20EB _ C7. 04 24, 00000064
        call    io_in8                                  ; 20F2 _ E8, FFFFFFFC(rel)
        and     eax, 02H                                ; 20F7 _ 83. E0, 02
        cmp     eax, 0                                  ; 20FA _ 83. F8, 00
; Note: Immediate operand could be made smaller by sign extension
        jne     ?_127                                   ; 20FD _ 0F 85, 00000005
; Note: Immediate operand could be made smaller by sign extension
        jmp     ?_128                                   ; 2103 _ E9, 00000005

?_127:
; Note: Immediate operand could be made smaller by sign extension
        jmp     ?_126                                   ; 2108 _ E9, FFFFFFDE

?_128:  add     esp, 8                                  ; 210D _ 83. C4, 08
        pop     ebp                                     ; 2110 _ 5D
        ret                                             ; 2111 _ C3
; wait_KBC_sendready End of function

; Filling space: 0EH
; Filler type: Multi-byte NOP
;       db 66H, 2EH, 0FH, 1FH, 84H, 00H, 00H, 00H
;       db 00H, 00H, 0FH, 1FH, 40H, 00H

ALIGN   16

show_key_info:; Function begin
        push    ebp                                     ; 2120 _ 55
        mov     ebp, esp                                ; 2121 _ 89. E5
        push    ebx                                     ; 2123 _ 53
        push    edi                                     ; 2124 _ 57
        push    esi                                     ; 2125 _ 56
        sub     esp, 44                                 ; 2126 _ 83. EC, 2C
        mov     eax, dword [ebp+0CH]                    ; 2129 _ 8B. 45, 0C
        mov     ecx, dword [ebp+8H]                     ; 212C _ 8B. 4D, 08
        mov     byte [ebp-0DH], 0                       ; 212F _ C6. 45, F3, 00
        mov     dword [ebp-18H], eax                    ; 2133 _ 89. 45, E8
        mov     dword [ebp-1CH], ecx                    ; 2136 _ 89. 4D, E4
        call    io_sti                                  ; 2139 _ E8, FFFFFFFC(rel)
        lea     eax, [keyfifo]                          ; 213E _ 8D. 05, 00000000(d)
        mov     dword [esp], eax                        ; 2144 _ 89. 04 24
        call    fifo8_get                               ; 2147 _ E8, FFFFF944
        mov     dl, al                                  ; 214C _ 88. C2
        mov     byte [ebp-0DH], dl                      ; 214E _ 88. 55, F3
        movzx   eax, byte [ebp-0DH]                     ; 2151 _ 0F B6. 45, F3
        mov     dword [esp], eax                        ; 2155 _ 89. 04 24
        call    charToHexStr                            ; 2158 _ E8, FFFFFB63
        xor     ecx, ecx                                ; 215D _ 31. C9
        mov     dword [ebp-14H], eax                    ; 215F _ 89. 45, EC
        mov     eax, dword [ebp+8H]                     ; 2162 _ 8B. 45, 08
        mov     esi, dword [ebp+0CH]                    ; 2165 _ 8B. 75, 0C
        mov     edi, dword [show_key_info.showXPos]     ; 2168 _ 8B. 3D, 00000158(d)
        mov     ebx, dword [ebp-14H]                    ; 216E _ 8B. 5D, EC
        mov     dword [esp], eax                        ; 2171 _ 89. 04 24
        mov     dword [esp+4H], esi                     ; 2174 _ 89. 74 24, 04
        mov     dword [esp+8H], edi                     ; 2178 _ 89. 7C 24, 08
        mov     dword [esp+0CH], 0                      ; 217C _ C7. 44 24, 0C, 00000000
        mov     dword [esp+10H], 7                      ; 2184 _ C7. 44 24, 10, 00000007
        mov     dword [esp+14H], ebx                    ; 218C _ 89. 5C 24, 14
        mov     dword [ebp-20H], ecx                    ; 2190 _ 89. 4D, E0
        call    showString                              ; 2193 _ E8, FFFFF838
        mov     eax, dword [show_key_info.showXPos]     ; 2198 _ A1, 00000158(d)
        add     eax, 32                                 ; 219D _ 83. C0, 20
        mov     dword [show_key_info.showXPos], eax     ; 21A0 _ A3, 00000158(d)
        add     esp, 44                                 ; 21A5 _ 83. C4, 2C
        pop     esi                                     ; 21A8 _ 5E
        pop     edi                                     ; 21A9 _ 5F
        pop     ebx                                     ; 21AA _ 5B
        pop     ebp                                     ; 21AB _ 5D
        ret                                             ; 21AC _ C3
; show_key_info End of function

; Filling space: 3H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 00H

ALIGN   8

intHandler2C:; Function begin
        push    ebp                                     ; 21B0 _ 55
        mov     ebp, esp                                ; 21B1 _ 89. E5
        sub     esp, 24                                 ; 21B3 _ 83. EC, 18
        mov     eax, dword [ebp+8H]                     ; 21B6 _ 8B. 45, 08
        mov     dword [esp], 160                        ; 21B9 _ C7. 04 24, 000000A0
        mov     dword [esp+4H], 100                     ; 21C0 _ C7. 44 24, 04, 00000064
        mov     dword [ebp-8H], eax                     ; 21C8 _ 89. 45, F8
        call    io_out8                                 ; 21CB _ E8, FFFFFFFC(rel)
        mov     dword [esp], 32                         ; 21D0 _ C7. 04 24, 00000020
        mov     dword [esp+4H], 98                      ; 21D7 _ C7. 44 24, 04, 00000062
        call    io_out8                                 ; 21DF _ E8, FFFFFFFC(rel)
        mov     dword [esp], 96                         ; 21E4 _ C7. 04 24, 00000060
        call    io_in8                                  ; 21EB _ E8, FFFFFFFC(rel)
        mov     cl, al                                  ; 21F0 _ 88. C1
        mov     byte [ebp-1H], cl                       ; 21F2 _ 88. 4D, FF
        lea     eax, [mousefifo]                        ; 21F5 _ 8D. 05, 00000018(d)
        mov     dword [esp], eax                        ; 21FB _ 89. 04 24
        movzx   eax, byte [ebp-1H]                      ; 21FE _ 0F B6. 45, FF
        mov     dword [esp+4H], eax                     ; 2202 _ 89. 44 24, 04
        call    fifo8_put                               ; 2206 _ E8, FFFFFDF5
        mov     dword [ebp-0CH], eax                    ; 220B _ 89. 45, F4
        add     esp, 24                                 ; 220E _ 83. C4, 18
        pop     ebp                                     ; 2211 _ 5D
        ret                                             ; 2212 _ C3
; intHandler2C End of function

; Filling space: 0DH
; Filler type: Multi-byte NOP
;       db 66H, 2EH, 0FH, 1FH, 84H, 00H, 00H, 00H
;       db 00H, 00H, 0FH, 1FH, 00H

ALIGN   16

show_mouse_info:; Function begin
        push    ebp                                     ; 2220 _ 55
        mov     ebp, esp                                ; 2221 _ 89. E5
        push    ebx                                     ; 2223 _ 53
        push    edi                                     ; 2224 _ 57
        push    esi                                     ; 2225 _ 56
        sub     esp, 44                                 ; 2226 _ 83. EC, 2C
        mov     eax, dword [ebp+0CH]                    ; 2229 _ 8B. 45, 0C
        mov     ecx, dword [ebp+8H]                     ; 222C _ 8B. 4D, 08
        mov     byte [ebp-0DH], 0                       ; 222F _ C6. 45, F3, 00
        mov     dword [ebp-18H], eax                    ; 2233 _ 89. 45, E8
        mov     dword [ebp-1CH], ecx                    ; 2236 _ 89. 4D, E4
        call    io_sti                                  ; 2239 _ E8, FFFFFFFC(rel)
        lea     eax, [mousefifo]                        ; 223E _ 8D. 05, 00000018(d)
        mov     dword [esp], eax                        ; 2244 _ 89. 04 24
        call    fifo8_get                               ; 2247 _ E8, FFFFF844
        mov     dl, al                                  ; 224C _ 88. C2
        mov     byte [ebp-0DH], dl                      ; 224E _ 88. 55, F3
        movzx   eax, byte [ebp-0DH]                     ; 2251 _ 0F B6. 45, F3
        mov     dword [esp], eax                        ; 2255 _ 89. 04 24
        call    charToHexStr                            ; 2258 _ E8, FFFFFA63
        xor     ecx, ecx                                ; 225D _ 31. C9
        mov     dword [ebp-14H], eax                    ; 225F _ 89. 45, EC
        mov     eax, dword [ebp+8H]                     ; 2262 _ 8B. 45, 08
        mov     esi, dword [ebp+0CH]                    ; 2265 _ 8B. 75, 0C
        mov     edi, dword [show_mouse_info.showXPos]   ; 2268 _ 8B. 3D, 0000015C(d)
        mov     ebx, dword [ebp-14H]                    ; 226E _ 8B. 5D, EC
        mov     dword [esp], eax                        ; 2271 _ 89. 04 24
        mov     dword [esp+4H], esi                     ; 2274 _ 89. 74 24, 04
        mov     dword [esp+8H], edi                     ; 2278 _ 89. 7C 24, 08
        mov     dword [esp+0CH], 0                      ; 227C _ C7. 44 24, 0C, 00000000
        mov     dword [esp+10H], 7                      ; 2284 _ C7. 44 24, 10, 00000007
        mov     dword [esp+14H], ebx                    ; 228C _ 89. 5C 24, 14
        mov     dword [ebp-20H], ecx                    ; 2290 _ 89. 4D, E0
        call    showString                              ; 2293 _ E8, FFFFF738
        mov     eax, dword [show_mouse_info.showXPos]   ; 2298 _ A1, 0000015C(d)
        add     eax, 32                                 ; 229D _ 83. C0, 20
        mov     dword [show_mouse_info.showXPos], eax   ; 22A0 _ A3, 0000015C(d)
        add     esp, 44                                 ; 22A5 _ 83. C4, 2C
        pop     esi                                     ; 22A8 _ 5E
        pop     edi                                     ; 22A9 _ 5F
        pop     ebx                                     ; 22AA _ 5B
        pop     ebp                                     ; 22AB _ 5D
        ret                                             ; 22AC _ C3
; show_mouse_info End of function

; Filling space: 3H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 00H

ALIGN   8

memman_total:; Function begin
        push    ebp                                     ; 22B0 _ 55
        mov     ebp, esp                                ; 22B1 _ 89. E5
        sub     esp, 12                                 ; 22B3 _ 83. EC, 0C
        mov     eax, dword [ebp+8H]                     ; 22B6 _ 8B. 45, 08
        mov     dword [ebp-8H], 0                       ; 22B9 _ C7. 45, F8, 00000000
        mov     dword [ebp-4H], 0                       ; 22C0 _ C7. 45, FC, 00000000
        mov     dword [ebp-0CH], eax                    ; 22C7 _ 89. 45, F4
?_129:  mov     eax, dword [ebp-4H]                     ; 22CA _ 8B. 45, FC
        mov     ecx, dword [ebp+8H]                     ; 22CD _ 8B. 4D, 08
        cmp     eax, dword [ecx]                        ; 22D0 _ 3B. 01
; Note: Immediate operand could be made smaller by sign extension
        jnc     ?_130                                   ; 22D2 _ 0F 83, 0000001E
        mov     eax, dword [ebp+8H]                     ; 22D8 _ 8B. 45, 08
        mov     ecx, dword [ebp-4H]                     ; 22DB _ 8B. 4D, FC
        mov     eax, dword [eax+ecx*8+14H]              ; 22DE _ 8B. 44 C8, 14
        add     eax, dword [ebp-8H]                     ; 22E2 _ 03. 45, F8
        mov     dword [ebp-8H], eax                     ; 22E5 _ 89. 45, F8
        mov     eax, dword [ebp-4H]                     ; 22E8 _ 8B. 45, FC
        add     eax, 1                                  ; 22EB _ 83. C0, 01
        mov     dword [ebp-4H], eax                     ; 22EE _ 89. 45, FC
; Note: Immediate operand could be made smaller by sign extension
        jmp     ?_129                                   ; 22F1 _ E9, FFFFFFD4

?_130:  mov     eax, dword [ebp-8H]                     ; 22F6 _ 8B. 45, F8
        add     esp, 12                                 ; 22F9 _ 83. C4, 0C
        pop     ebp                                     ; 22FC _ 5D
        ret                                             ; 22FD _ C3
; memman_total End of function

; Filling space: 2H
; Filler type: NOP with prefixes
;       db 66H, 90H

ALIGN   8

memman_alloc:; Function begin
        push    ebp                                     ; 2300 _ 55
        mov     ebp, esp                                ; 2301 _ 89. E5
        push    esi                                     ; 2303 _ 56
        sub     esp, 20                                 ; 2304 _ 83. EC, 14
        mov     eax, dword [ebp+0CH]                    ; 2307 _ 8B. 45, 0C
        mov     ecx, dword [ebp+8H]                     ; 230A _ 8B. 4D, 08
        mov     dword [ebp-0CH], 0                      ; 230D _ C7. 45, F4, 00000000
        mov     dword [ebp-14H], eax                    ; 2314 _ 89. 45, EC
        mov     dword [ebp-18H], ecx                    ; 2317 _ 89. 4D, E8
?_131:  mov     eax, dword [ebp-0CH]                    ; 231A _ 8B. 45, F4
        mov     ecx, dword [ebp+8H]                     ; 231D _ 8B. 4D, 08
        cmp     eax, dword [ecx]                        ; 2320 _ 3B. 01
; Note: Immediate operand could be made smaller by sign extension
        jnc     ?_135                                   ; 2322 _ 0F 83, 0000007D
        mov     eax, dword [ebp+8H]                     ; 2328 _ 8B. 45, 08
        mov     ecx, dword [ebp-0CH]                    ; 232B _ 8B. 4D, F4
        mov     eax, dword [eax+ecx*8+14H]              ; 232E _ 8B. 44 C8, 14
        cmp     eax, dword [ebp+0CH]                    ; 2332 _ 3B. 45, 0C
; Note: Immediate operand could be made smaller by sign extension
        jc      ?_133                                   ; 2335 _ 0F 82, 00000057
        mov     eax, dword [ebp+8H]                     ; 233B _ 8B. 45, 08
        mov     ecx, dword [ebp-0CH]                    ; 233E _ 8B. 4D, F4
        mov     eax, dword [eax+ecx*8+10H]              ; 2341 _ 8B. 44 C8, 10
        mov     dword [ebp-10H], eax                    ; 2345 _ 89. 45, F0
        mov     eax, dword [ebp+0CH]                    ; 2348 _ 8B. 45, 0C
        mov     ecx, dword [ebp+8H]                     ; 234B _ 8B. 4D, 08
        mov     edx, dword [ebp-0CH]                    ; 234E _ 8B. 55, F4
        add     eax, dword [ecx+edx*8+10H]              ; 2351 _ 03. 44 D1, 10
        mov     dword [ecx+edx*8+10H], eax              ; 2355 _ 89. 44 D1, 10
        mov     eax, dword [ebp+0CH]                    ; 2359 _ 8B. 45, 0C
        mov     ecx, dword [ebp+8H]                     ; 235C _ 8B. 4D, 08
        mov     edx, dword [ebp-0CH]                    ; 235F _ 8B. 55, F4
        mov     esi, dword [ecx+edx*8+14H]              ; 2362 _ 8B. 74 D1, 14
        sub     esi, eax                                ; 2366 _ 29. C6
        mov     dword [ecx+edx*8+14H], esi              ; 2368 _ 89. 74 D1, 14
        mov     eax, dword [ebp+8H]                     ; 236C _ 8B. 45, 08
        mov     ecx, dword [ebp-0CH]                    ; 236F _ 8B. 4D, F4
        cmp     dword [eax+ecx*8+14H], 0                ; 2372 _ 83. 7C C8, 14, 00
; Note: Immediate operand could be made smaller by sign extension
        jne     ?_132                                   ; 2377 _ 0F 85, 0000000A
        mov     eax, dword [ebp+8H]                     ; 237D _ 8B. 45, 08
        mov     ecx, dword [eax]                        ; 2380 _ 8B. 08
        add     ecx, -1                                 ; 2382 _ 83. C1, FF
        mov     dword [eax], ecx                        ; 2385 _ 89. 08
?_132:  mov     eax, dword [ebp-10H]                    ; 2387 _ 8B. 45, F0
        mov     dword [ebp-8H], eax                     ; 238A _ 89. 45, F8
; Note: Immediate operand could be made smaller by sign extension
        jmp     ?_136                                   ; 238D _ E9, 0000001A

?_133:
; Note: Immediate operand could be made smaller by sign extension
        jmp     ?_134                                   ; 2392 _ E9, 00000000

?_134:  mov     eax, dword [ebp-0CH]                    ; 2397 _ 8B. 45, F4
        add     eax, 1                                  ; 239A _ 83. C0, 01
        mov     dword [ebp-0CH], eax                    ; 239D _ 89. 45, F4
        jmp     ?_131                                   ; 23A0 _ E9, FFFFFF75

?_135:  mov     dword [ebp-8H], 0                       ; 23A5 _ C7. 45, F8, 00000000
?_136:  mov     eax, dword [ebp-8H]                     ; 23AC _ 8B. 45, F8
        add     esp, 20                                 ; 23AF _ 83. C4, 14
        pop     esi                                     ; 23B2 _ 5E
        pop     ebp                                     ; 23B3 _ 5D
        ret                                             ; 23B4 _ C3
; memman_alloc End of function

; Filling space: 0BH
; Filler type: Multi-byte NOP
;       db 66H, 2EH, 0FH, 1FH, 84H, 00H, 00H, 00H
;       db 00H, 00H, 90H

ALIGN   16

memman_free_4k:; Function begin
        push    ebp                                     ; 23C0 _ 55
        mov     ebp, esp                                ; 23C1 _ 89. E5
        push    ebx                                     ; 23C3 _ 53
        push    edi                                     ; 23C4 _ 57
        push    esi                                     ; 23C5 _ 56
        sub     esp, 28                                 ; 23C6 _ 83. EC, 1C
        mov     eax, dword [ebp+10H]                    ; 23C9 _ 8B. 45, 10
        mov     ecx, dword [ebp+0CH]                    ; 23CC _ 8B. 4D, 0C
        mov     edx, dword [ebp+8H]                     ; 23CF _ 8B. 55, 08
        mov     esi, dword [ebp+10H]                    ; 23D2 _ 8B. 75, 10
        add     esi, 4095                               ; 23D5 _ 81. C6, 00000FFF
        and     esi, 0FFFFF000H                         ; 23DB _ 81. E6, FFFFF000
        mov     dword [ebp+10H], esi                    ; 23E1 _ 89. 75, 10
        mov     esi, dword [ebp+8H]                     ; 23E4 _ 8B. 75, 08
        mov     edi, dword [ebp+0CH]                    ; 23E7 _ 8B. 7D, 0C
        mov     ebx, dword [ebp+10H]                    ; 23EA _ 8B. 5D, 10
        mov     dword [esp], esi                        ; 23ED _ 89. 34 24
        mov     dword [esp+4H], edi                     ; 23F0 _ 89. 7C 24, 04
        mov     dword [esp+8H], ebx                     ; 23F4 _ 89. 5C 24, 08
        mov     dword [ebp-14H], eax                    ; 23F8 _ 89. 45, EC
        mov     dword [ebp-18H], ecx                    ; 23FB _ 89. 4D, E8
        mov     dword [ebp-1CH], edx                    ; 23FE _ 89. 55, E4
        call    memman_free                             ; 2401 _ E8, FFFFE38A
        mov     dword [ebp-10H], eax                    ; 2406 _ 89. 45, F0
        mov     eax, dword [ebp-10H]                    ; 2409 _ 8B. 45, F0
        add     esp, 28                                 ; 240C _ 83. C4, 1C
        pop     esi                                     ; 240F _ 5E
        pop     edi                                     ; 2410 _ 5F
        pop     ebx                                     ; 2411 _ 5B
        pop     ebp                                     ; 2412 _ 5D
        ret                                             ; 2413 _ C3
; memman_free_4k End of function

; Filling space: 0CH
; Filler type: Multi-byte NOP
;       db 66H, 2EH, 0FH, 1FH, 84H, 00H, 00H, 00H
;       db 00H, 00H, 66H, 90H

ALIGN   16

showMemoryInfo:; Function begin
        push    ebp                                     ; 2420 _ 55
        mov     ebp, esp                                ; 2421 _ 89. E5
        push    ebx                                     ; 2423 _ 53
        push    edi                                     ; 2424 _ 57
        push    esi                                     ; 2425 _ 56
        sub     esp, 108                                ; 2426 _ 83. EC, 6C
        mov     eax, dword [ebp+18H]                    ; 2429 _ 8B. 45, 18
        mov     ecx, dword [ebp+14H]                    ; 242C _ 8B. 4D, 14
        mov     edx, dword [ebp+10H]                    ; 242F _ 8B. 55, 10
        mov     esi, dword [ebp+0CH]                    ; 2432 _ 8B. 75, 0C
        mov     edi, dword [ebp+8H]                     ; 2435 _ 8B. 7D, 08
        xor     ebx, ebx                                ; 2438 _ 31. DB
        mov     dword [ebp-10H], 0                      ; 243A _ C7. 45, F0, 00000000
        mov     dword [ebp-14H], 0                      ; 2441 _ C7. 45, EC, 00000000
        mov     dword [ebp-18H], 104                    ; 2448 _ C7. 45, E8, 00000068
        mov     dword [ebp-1CH], 80                     ; 244F _ C7. 45, E4, 00000050
        mov     dword [ebp-38H], eax                    ; 2456 _ 89. 45, C8
        mov     eax, dword [ebp+0CH]                    ; 2459 _ 8B. 45, 0C
        mov     dword [ebp-3CH], eax                    ; 245C _ 89. 45, C4
        mov     eax, dword [ebp+14H]                    ; 245F _ 8B. 45, 14
        mov     dword [ebp-40H], eax                    ; 2462 _ 89. 45, C0
        mov     eax, dword [ebp+14H]                    ; 2465 _ 8B. 45, 14
        mov     dword [ebp-44H], eax                    ; 2468 _ 89. 45, BC
        mov     eax, dword [ebp-3CH]                    ; 246B _ 8B. 45, C4
        mov     dword [esp], eax                        ; 246E _ 89. 04 24
        mov     eax, dword [ebp-40H]                    ; 2471 _ 8B. 45, C0
        mov     dword [esp+4H], eax                     ; 2474 _ 89. 44 24, 04
        mov     dword [esp+8H], 14                      ; 2478 _ C7. 44 24, 08, 0000000E
        mov     dword [esp+0CH], 0                      ; 2480 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+10H], 0                      ; 2488 _ C7. 44 24, 10, 00000000
        mov     eax, dword [ebp-44H]                    ; 2490 _ 8B. 45, BC
        mov     dword [esp+14H], eax                    ; 2493 _ 89. 44 24, 14
        mov     dword [esp+18H], 100                    ; 2497 _ C7. 44 24, 18, 00000064
        mov     dword [ebp-48H], ecx                    ; 249F _ 89. 4D, B8
        mov     dword [ebp-4CH], edx                    ; 24A2 _ 89. 55, B4
        mov     dword [ebp-50H], esi                    ; 24A5 _ 89. 75, B0
        mov     dword [ebp-54H], edi                    ; 24A8 _ 89. 7D, AC
        mov     dword [ebp-58H], ebx                    ; 24AB _ 89. 5D, A8
        call    boxfill8                                ; 24AE _ E8, FFFFF47D
        mov     eax, dword [ebp+10H]                    ; 24B3 _ 8B. 45, 10
        mov     dword [esp], eax                        ; 24B6 _ 89. 04 24
        call    intToHexStr                             ; 24B9 _ E8, FFFFF392
        mov     dword [ebp-20H], eax                    ; 24BE _ 89. 45, E0
        mov     eax, dword [ebp+0CH]                    ; 24C1 _ 8B. 45, 0C
        mov     ecx, dword [ebp+14H]                    ; 24C4 _ 8B. 4D, 14
        mov     edx, dword [ebp-18H]                    ; 24C7 _ 8B. 55, E8
        mov     esi, dword [ebp-14H]                    ; 24CA _ 8B. 75, EC
        mov     ebx, dword [ebp+18H]                    ; 24CD _ 8B. 5D, 18
        mov     edi, dword [ebp-20H]                    ; 24D0 _ 8B. 7D, E0
        mov     dword [esp], eax                        ; 24D3 _ 89. 04 24
        mov     dword [esp+4H], ecx                     ; 24D6 _ 89. 4C 24, 04
        mov     dword [esp+8H], edx                     ; 24DA _ 89. 54 24, 08
        mov     dword [esp+0CH], esi                    ; 24DE _ 89. 74 24, 0C
        movsx   eax, bl                                 ; 24E2 _ 0F BE. C3
        mov     dword [esp+10H], eax                    ; 24E5 _ 89. 44 24, 10
        mov     dword [esp+14H], edi                    ; 24E9 _ 89. 7C 24, 14
        call    showString                              ; 24ED _ E8, FFFFF4DE
        mov     eax, dword [ebp-14H]                    ; 24F2 _ 8B. 45, EC
        add     eax, 16                                 ; 24F5 _ 83. C0, 10
        mov     dword [ebp-14H], eax                    ; 24F8 _ 89. 45, EC
        mov     eax, dword [ebp+8H]                     ; 24FB _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 24FE _ 8B. 00
        mov     dword [esp], eax                        ; 2500 _ 89. 04 24
        call    intToHexStr                             ; 2503 _ E8, FFFFF348
        mov     dword [ebp-24H], eax                    ; 2508 _ 89. 45, DC
        mov     eax, dword [ebp+0CH]                    ; 250B _ 8B. 45, 0C
        mov     ecx, dword [ebp+14H]                    ; 250E _ 8B. 4D, 14
        mov     edx, dword [ebp-18H]                    ; 2511 _ 8B. 55, E8
        mov     esi, dword [ebp-14H]                    ; 2514 _ 8B. 75, EC
        mov     ebx, dword [ebp+18H]                    ; 2517 _ 8B. 5D, 18
        mov     edi, dword [ebp-24H]                    ; 251A _ 8B. 7D, DC
        mov     dword [esp], eax                        ; 251D _ 89. 04 24
        mov     dword [esp+4H], ecx                     ; 2520 _ 89. 4C 24, 04
        mov     dword [esp+8H], edx                     ; 2524 _ 89. 54 24, 08
        mov     dword [esp+0CH], esi                    ; 2528 _ 89. 74 24, 0C
        movsx   eax, bl                                 ; 252C _ 0F BE. C3
        mov     dword [esp+10H], eax                    ; 252F _ 89. 44 24, 10
        mov     dword [esp+14H], edi                    ; 2533 _ 89. 7C 24, 14
        call    showString                              ; 2537 _ E8, FFFFF494
        mov     eax, dword [ebp-14H]                    ; 253C _ 8B. 45, EC
        add     eax, 16                                 ; 253F _ 83. C0, 10
        mov     dword [ebp-14H], eax                    ; 2542 _ 89. 45, EC
        mov     eax, dword [ebp+8H]                     ; 2545 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 2548 _ 8B. 40, 04
        mov     dword [esp], eax                        ; 254B _ 89. 04 24
        call    intToHexStr                             ; 254E _ E8, FFFFF2FD
        mov     dword [ebp-28H], eax                    ; 2553 _ 89. 45, D8
        mov     eax, dword [ebp+0CH]                    ; 2556 _ 8B. 45, 0C
        mov     ecx, dword [ebp+14H]                    ; 2559 _ 8B. 4D, 14
        mov     edx, dword [ebp-18H]                    ; 255C _ 8B. 55, E8
        mov     esi, dword [ebp-14H]                    ; 255F _ 8B. 75, EC
        mov     ebx, dword [ebp+18H]                    ; 2562 _ 8B. 5D, 18
        mov     edi, dword [ebp-28H]                    ; 2565 _ 8B. 7D, D8
        mov     dword [esp], eax                        ; 2568 _ 89. 04 24
        mov     dword [esp+4H], ecx                     ; 256B _ 89. 4C 24, 04
        mov     dword [esp+8H], edx                     ; 256F _ 89. 54 24, 08
        mov     dword [esp+0CH], esi                    ; 2573 _ 89. 74 24, 0C
        movsx   eax, bl                                 ; 2577 _ 0F BE. C3
        mov     dword [esp+10H], eax                    ; 257A _ 89. 44 24, 10
        mov     dword [esp+14H], edi                    ; 257E _ 89. 7C 24, 14
        call    showString                              ; 2582 _ E8, FFFFF449
        mov     eax, dword [ebp-14H]                    ; 2587 _ 8B. 45, EC
        add     eax, 16                                 ; 258A _ 83. C0, 10
        mov     dword [ebp-14H], eax                    ; 258D _ 89. 45, EC
        mov     eax, dword [ebp+8H]                     ; 2590 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2593 _ 8B. 40, 08
        mov     dword [esp], eax                        ; 2596 _ 89. 04 24
        call    intToHexStr                             ; 2599 _ E8, FFFFF2B2
        mov     dword [ebp-2CH], eax                    ; 259E _ 89. 45, D4
        mov     eax, dword [ebp+0CH]                    ; 25A1 _ 8B. 45, 0C
        mov     ecx, dword [ebp+14H]                    ; 25A4 _ 8B. 4D, 14
        mov     edx, dword [ebp-18H]                    ; 25A7 _ 8B. 55, E8
        mov     esi, dword [ebp-14H]                    ; 25AA _ 8B. 75, EC
        mov     ebx, dword [ebp+18H]                    ; 25AD _ 8B. 5D, 18
        mov     edi, dword [ebp-2CH]                    ; 25B0 _ 8B. 7D, D4
        mov     dword [esp], eax                        ; 25B3 _ 89. 04 24
        mov     dword [esp+4H], ecx                     ; 25B6 _ 89. 4C 24, 04
        mov     dword [esp+8H], edx                     ; 25BA _ 89. 54 24, 08
        mov     dword [esp+0CH], esi                    ; 25BE _ 89. 74 24, 0C
        movsx   eax, bl                                 ; 25C2 _ 0F BE. C3
        mov     dword [esp+10H], eax                    ; 25C5 _ 89. 44 24, 10
        mov     dword [esp+14H], edi                    ; 25C9 _ 89. 7C 24, 14
        call    showString                              ; 25CD _ E8, FFFFF3FE
        mov     eax, dword [ebp-14H]                    ; 25D2 _ 8B. 45, EC
        add     eax, 16                                 ; 25D5 _ 83. C0, 10
        mov     dword [ebp-14H], eax                    ; 25D8 _ 89. 45, EC
        mov     eax, dword [ebp+8H]                     ; 25DB _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 25DE _ 8B. 40, 0C
        mov     dword [esp], eax                        ; 25E1 _ 89. 04 24
        call    intToHexStr                             ; 25E4 _ E8, FFFFF267
        mov     dword [ebp-30H], eax                    ; 25E9 _ 89. 45, D0
        mov     eax, dword [ebp+0CH]                    ; 25EC _ 8B. 45, 0C
        mov     ecx, dword [ebp+14H]                    ; 25EF _ 8B. 4D, 14
        mov     edx, dword [ebp-18H]                    ; 25F2 _ 8B. 55, E8
        mov     esi, dword [ebp-14H]                    ; 25F5 _ 8B. 75, EC
        mov     ebx, dword [ebp+18H]                    ; 25F8 _ 8B. 5D, 18
        mov     edi, dword [ebp-30H]                    ; 25FB _ 8B. 7D, D0
        mov     dword [esp], eax                        ; 25FE _ 89. 04 24
        mov     dword [esp+4H], ecx                     ; 2601 _ 89. 4C 24, 04
        mov     dword [esp+8H], edx                     ; 2605 _ 89. 54 24, 08
        mov     dword [esp+0CH], esi                    ; 2609 _ 89. 74 24, 0C
        movsx   eax, bl                                 ; 260D _ 0F BE. C3
        mov     dword [esp+10H], eax                    ; 2610 _ 89. 44 24, 10
        mov     dword [esp+14H], edi                    ; 2614 _ 89. 7C 24, 14
        call    showString                              ; 2618 _ E8, FFFFF3B3
        mov     eax, dword [ebp-14H]                    ; 261D _ 8B. 45, EC
        add     eax, 16                                 ; 2620 _ 83. C0, 10
        mov     dword [ebp-14H], eax                    ; 2623 _ 89. 45, EC
        mov     eax, dword [ebp+8H]                     ; 2626 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2629 _ 8B. 40, 10
        mov     dword [esp], eax                        ; 262C _ 89. 04 24
        call    intToHexStr                             ; 262F _ E8, FFFFF21C
        mov     dword [ebp-34H], eax                    ; 2634 _ 89. 45, CC
        mov     eax, dword [ebp+0CH]                    ; 2637 _ 8B. 45, 0C
        mov     ecx, dword [ebp+14H]                    ; 263A _ 8B. 4D, 14
        mov     edx, dword [ebp-18H]                    ; 263D _ 8B. 55, E8
        mov     esi, dword [ebp-14H]                    ; 2640 _ 8B. 75, EC
        mov     ebx, dword [ebp+18H]                    ; 2643 _ 8B. 5D, 18
        mov     edi, dword [ebp-34H]                    ; 2646 _ 8B. 7D, CC
        mov     dword [esp], eax                        ; 2649 _ 89. 04 24
        mov     dword [esp+4H], ecx                     ; 264C _ 89. 4C 24, 04
        mov     dword [esp+8H], edx                     ; 2650 _ 89. 54 24, 08
        mov     dword [esp+0CH], esi                    ; 2654 _ 89. 74 24, 0C
        movsx   eax, bl                                 ; 2658 _ 0F BE. C3
        mov     dword [esp+10H], eax                    ; 265B _ 89. 44 24, 10
        mov     dword [esp+14H], edi                    ; 265F _ 89. 7C 24, 14
        call    showString                              ; 2663 _ E8, FFFFF368
        add     esp, 108                                ; 2668 _ 83. C4, 6C
        pop     esi                                     ; 266B _ 5E
        pop     edi                                     ; 266C _ 5F
        pop     ebx                                     ; 266D _ 5B
        pop     ebp                                     ; 266E _ 5D
        ret                                             ; 266F _ C3
; showMemoryInfo End of function

sheet_refreshsub:; Function begin
        push    ebp                                     ; 2670 _ 55
        mov     ebp, esp                                ; 2671 _ 89. E5
        push    ebx                                     ; 2673 _ 53
        push    edi                                     ; 2674 _ 57
        push    esi                                     ; 2675 _ 56
        sub     esp, 56                                 ; 2676 _ 83. EC, 38
        mov     eax, dword [ebp+18H]                    ; 2679 _ 8B. 45, 18
        mov     ecx, dword [ebp+14H]                    ; 267C _ 8B. 4D, 14
        mov     edx, dword [ebp+10H]                    ; 267F _ 8B. 55, 10
        mov     esi, dword [ebp+0CH]                    ; 2682 _ 8B. 75, 0C
        mov     edi, dword [ebp+8H]                     ; 2685 _ 8B. 7D, 08
        mov     ebx, dword [ebp+8H]                     ; 2688 _ 8B. 5D, 08
        mov     ebx, dword [ebx]                        ; 268B _ 8B. 1B
        mov     dword [ebp-2CH], ebx                    ; 268D _ 89. 5D, D4
        mov     dword [ebp-10H], 0                      ; 2690 _ C7. 45, F0, 00000000
        mov     dword [ebp-34H], eax                    ; 2697 _ 89. 45, CC
        mov     dword [ebp-38H], ecx                    ; 269A _ 89. 4D, C8
        mov     dword [ebp-3CH], edx                    ; 269D _ 89. 55, C4
        mov     dword [ebp-40H], esi                    ; 26A0 _ 89. 75, C0
        mov     dword [ebp-44H], edi                    ; 26A3 _ 89. 7D, BC
?_137:  mov     eax, dword [ebp-10H]                    ; 26A6 _ 8B. 45, F0
        mov     ecx, dword [ebp+8H]                     ; 26A9 _ 8B. 4D, 08
        cmp     eax, dword [ecx+0CH]                    ; 26AC _ 3B. 41, 0C
        jg      ?_147                                   ; 26AF _ 0F 8F, 00000103
        mov     eax, dword [ebp+8H]                     ; 26B5 _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 26B8 _ 8B. 4D, F0
        mov     eax, dword [eax+ecx*4+10H]              ; 26BB _ 8B. 44 88, 10
        mov     dword [ebp-30H], eax                    ; 26BF _ 89. 45, D0
        mov     eax, dword [ebp-30H]                    ; 26C2 _ 8B. 45, D0
        mov     eax, dword [eax]                        ; 26C5 _ 8B. 00
        mov     dword [ebp-24H], eax                    ; 26C7 _ 89. 45, DC
        mov     dword [ebp-18H], 0                      ; 26CA _ C7. 45, E8, 00000000
?_138:  mov     eax, dword [ebp-18H]                    ; 26D1 _ 8B. 45, E8
        mov     ecx, dword [ebp-30H]                    ; 26D4 _ 8B. 4D, D0
        cmp     eax, dword [ecx+8H]                     ; 26D7 _ 3B. 41, 08
        jge     ?_145                                   ; 26DA _ 0F 8D, 000000C5
        mov     eax, dword [ebp-30H]                    ; 26E0 _ 8B. 45, D0
        mov     eax, dword [eax+10H]                    ; 26E3 _ 8B. 40, 10
        add     eax, dword [ebp-18H]                    ; 26E6 _ 03. 45, E8
        mov     dword [ebp-20H], eax                    ; 26E9 _ 89. 45, E0
        mov     dword [ebp-14H], 0                      ; 26EC _ C7. 45, EC, 00000000
?_139:  mov     eax, dword [ebp-14H]                    ; 26F3 _ 8B. 45, EC
        mov     ecx, dword [ebp-30H]                    ; 26F6 _ 8B. 4D, D0
        cmp     eax, dword [ecx+4H]                     ; 26F9 _ 3B. 41, 04
        jge     ?_143                                   ; 26FC _ 0F 8D, 00000090
        mov     eax, dword [ebp-30H]                    ; 2702 _ 8B. 45, D0
        mov     eax, dword [eax+0CH]                    ; 2705 _ 8B. 40, 0C
        add     eax, dword [ebp-14H]                    ; 2708 _ 03. 45, EC
        mov     dword [ebp-1CH], eax                    ; 270B _ 89. 45, E4
        mov     eax, dword [ebp+0CH]                    ; 270E _ 8B. 45, 0C
        cmp     eax, dword [ebp-1CH]                    ; 2711 _ 3B. 45, E4
; Note: Immediate operand could be made smaller by sign extension
        jg      ?_141                                   ; 2714 _ 0F 8F, 00000065
        mov     eax, dword [ebp-1CH]                    ; 271A _ 8B. 45, E4
        cmp     eax, dword [ebp+14H]                    ; 271D _ 3B. 45, 14
; Note: Immediate operand could be made smaller by sign extension
        jge     ?_141                                   ; 2720 _ 0F 8D, 00000059
        mov     eax, dword [ebp+10H]                    ; 2726 _ 8B. 45, 10
        cmp     eax, dword [ebp-20H]                    ; 2729 _ 3B. 45, E0
; Note: Immediate operand could be made smaller by sign extension
        jg      ?_141                                   ; 272C _ 0F 8F, 0000004D
        mov     eax, dword [ebp-20H]                    ; 2732 _ 8B. 45, E0
        cmp     eax, dword [ebp+18H]                    ; 2735 _ 3B. 45, 18
; Note: Immediate operand could be made smaller by sign extension
        jge     ?_141                                   ; 2738 _ 0F 8D, 00000041
        mov     eax, dword [ebp-24H]                    ; 273E _ 8B. 45, DC
        mov     ecx, dword [ebp-18H]                    ; 2741 _ 8B. 4D, E8
        mov     edx, dword [ebp-30H]                    ; 2744 _ 8B. 55, D0
        imul    ecx, dword [edx+4H]                     ; 2747 _ 0F AF. 4A, 04
        add     ecx, dword [ebp-14H]                    ; 274B _ 03. 4D, EC
        mov     bl, byte [eax+ecx]                      ; 274E _ 8A. 1C 08
        mov     byte [ebp-25H], bl                      ; 2751 _ 88. 5D, DB
        movzx   eax, byte [ebp-25H]                     ; 2754 _ 0F B6. 45, DB
        mov     ecx, dword [ebp-30H]                    ; 2758 _ 8B. 4D, D0
        cmp     eax, dword [ecx+14H]                    ; 275B _ 3B. 41, 14
; Note: Immediate operand could be made smaller by sign extension
        je      ?_140                                   ; 275E _ 0F 84, 00000016
        mov     al, byte [ebp-25H]                      ; 2764 _ 8A. 45, DB
        mov     ecx, dword [ebp-2CH]                    ; 2767 _ 8B. 4D, D4
        mov     edx, dword [ebp-20H]                    ; 276A _ 8B. 55, E0
        mov     esi, dword [ebp+8H]                     ; 276D _ 8B. 75, 08
        imul    edx, dword [esi+4H]                     ; 2770 _ 0F AF. 56, 04
        add     edx, dword [ebp-1CH]                    ; 2774 _ 03. 55, E4
        mov     byte [ecx+edx], al                      ; 2777 _ 88. 04 11
?_140:
; Note: Immediate operand could be made smaller by sign extension
        jmp     ?_141                                   ; 277A _ E9, 00000000

?_141:
; Note: Immediate operand could be made smaller by sign extension
        jmp     ?_142                                   ; 277F _ E9, 00000000

?_142:  mov     eax, dword [ebp-14H]                    ; 2784 _ 8B. 45, EC
        add     eax, 1                                  ; 2787 _ 83. C0, 01
        mov     dword [ebp-14H], eax                    ; 278A _ 89. 45, EC
        jmp     ?_139                                   ; 278D _ E9, FFFFFF61

?_143:
; Note: Immediate operand could be made smaller by sign extension
        jmp     ?_144                                   ; 2792 _ E9, 00000000

?_144:  mov     eax, dword [ebp-18H]                    ; 2797 _ 8B. 45, E8
        add     eax, 1                                  ; 279A _ 83. C0, 01
        mov     dword [ebp-18H], eax                    ; 279D _ 89. 45, E8
        jmp     ?_138                                   ; 27A0 _ E9, FFFFFF2C

?_145:
; Note: Immediate operand could be made smaller by sign extension
        jmp     ?_146                                   ; 27A5 _ E9, 00000000

?_146:  mov     eax, dword [ebp-10H]                    ; 27AA _ 8B. 45, F0
        add     eax, 1                                  ; 27AD _ 83. C0, 01
        mov     dword [ebp-10H], eax                    ; 27B0 _ 89. 45, F0
        jmp     ?_137                                   ; 27B3 _ E9, FFFFFEEE

?_147:  add     esp, 56                                 ; 27B8 _ 83. C4, 38
        pop     esi                                     ; 27BB _ 5E
        pop     edi                                     ; 27BC _ 5F
        pop     ebx                                     ; 27BD _ 5B
        pop     ebp                                     ; 27BE _ 5D
        ret                                             ; 27BF _ C3
; sheet_refreshsub End of function



keyfifo:                                                ; byte
        resb    24                                      ; 0000

mousefifo:                                              ; byte
        resb    24                                      ; 0018

mdec:                                                   ; oword
        resb    4                                       ; 0030

?_148:  resd    1                                       ; 0034

?_149:  resd    2                                       ; 0038

CMain.shtctl:                                           ; dword
        resd    1                                       ; 0040

CMain.buf_mouse:                                        ; byte
        resb    256                                     ; 0044

sht_win: resd   1                                       ; 0144

CMain.counter:                                          ; dword
        resd    1                                       ; 0148

intToHexStr.str:                                        ; byte
        resb    1                                       ; 014C

?_150:  resb    9                                       ; 014D

?_151:  resb    2                                       ; 0156

show_key_info.showXPos:                                 ; dword
        resd    1                                       ; 0158

show_mouse_info.showXPos:                               ; dword
        resd    1                                       ; 015C



memman: dd 00100000H                                    ; 0000 _ 1048576 

CMain.win_title:                                        ; byte
        db 48H, 65H, 6CH, 6CH, 6FH, 20H, 4FH, 53H       ; 0004 _ Hello OS
        db 00H, 00H, 00H                                ; 000C _ ...

keyval:                                                 ; byte
        db 30H, 58H                                     ; 000F _ 0X

?_152:  db 00H                                          ; 0011 _ .

?_153:  db 00H, 00H                                     ; 0012 _ ..

init_palette.table_rgb:                                 ; byte
        db 00H, 00H, 00H, 0FFH, 00H, 00H, 00H, 0FFH     ; 0014 _ ........
        db 00H, 0FFH, 0FFH, 00H, 00H, 00H, 0FFH, 0FFH   ; 001C _ ........
        db 00H, 0FFH, 00H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH ; 0024 _ ........
        db 0C6H, 0C6H, 0C6H, 84H, 00H, 00H, 00H, 84H    ; 002C _ ........
        db 00H, 84H, 84H, 00H, 00H, 00H, 84H, 84H       ; 0034 _ ........
        db 00H, 84H, 00H, 84H, 84H, 84H, 84H, 84H       ; 003C _ ........

init_mouse_cursor.cursor:                               ; byte
        db 2AH, 2AH, 2AH, 2AH, 2AH, 2AH, 2AH, 2AH       ; 0044 _ ********
        db 2AH, 2AH, 2AH, 2AH, 2AH, 2AH, 2EH, 2EH       ; 004C _ ******..
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 0054 _ *OOOOOOO
        db 4FH, 4FH, 4FH, 4FH, 2AH, 2EH, 2EH, 2EH       ; 005C _ OOOO*...
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 0064 _ *OOOOOOO
        db 4FH, 4FH, 4FH, 2AH, 2EH, 2EH, 2EH, 2EH       ; 006C _ OOO*....
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 0074 _ *OOOOOOO
        db 4FH, 4FH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 007C _ OO*.....
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 0084 _ *OOOOOOO
        db 4FH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 008C _ O*......
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 0094 _ *OOOOOOO
        db 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 009C _ *.......
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 00A4 _ *OOOOOOO
        db 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 00AC _ *.......
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 00B4 _ *OOOOOOO
        db 4FH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 00BC _ O*......
        db 2AH, 4FH, 4FH, 4FH, 4FH, 2AH, 2AH, 4FH       ; 00C4 _ *OOOO**O
        db 4FH, 4FH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 00CC _ OO*.....
        db 2AH, 4FH, 4FH, 4FH, 2AH, 2EH, 2EH, 2AH       ; 00D4 _ *OOO*..*
        db 4FH, 4FH, 4FH, 2AH, 2EH, 2EH, 2EH, 2EH       ; 00DC _ OOO*....
        db 2AH, 4FH, 4FH, 2AH, 2EH, 2EH, 2EH, 2EH       ; 00E4 _ *OO*....
        db 2AH, 4FH, 4FH, 4FH, 2AH, 2EH, 2EH, 2EH       ; 00EC _ *OOO*...
        db 2AH, 4FH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 00F4 _ *O*.....
        db 2EH, 2AH, 4FH, 4FH, 4FH, 2AH, 2EH, 2EH       ; 00FC _ .*OOO*..
        db 2AH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0104 _ **......
        db 2EH, 2EH, 2AH, 4FH, 4FH, 4FH, 2AH, 2EH       ; 010C _ ..*OOO*.
        db 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0114 _ *.......
        db 2EH, 2EH, 2EH, 2AH, 4FH, 4FH, 30H, 2AH       ; 011C _ ...*OO0*
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0124 _ ........
        db 2EH, 2EH, 2EH, 2EH, 2AH, 4FH, 4FH, 2AH       ; 012C _ ....*OO*
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0134 _ ........
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2AH, 2AH, 2AH       ; 013C _ .....***

draw_window.closebtn:                                   ; byte
        db 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 0144 _ OOOOOOOO
        db 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 40H       ; 014C _ OOOOOOO@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 51H, 51H       ; 0154 _ OQQQQQQQ
        db 51H, 51H, 51H, 51H, 51H, 51H, 24H, 40H       ; 015C _ QQQQQQ$@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 51H, 51H       ; 0164 _ OQQQQQQQ
        db 51H, 51H, 51H, 51H, 51H, 51H, 24H, 40H       ; 016C _ QQQQQQ$@
        db 4FH, 51H, 51H, 51H, 40H, 40H, 51H, 51H       ; 0174 _ OQQQ@@QQ
        db 51H, 51H, 40H, 40H, 51H, 51H, 24H, 40H       ; 017C _ QQ@@QQ$@
        db 4FH, 51H, 51H, 51H, 51H, 40H, 40H, 51H       ; 0184 _ OQQQQ@@Q
        db 51H, 40H, 40H, 51H, 51H, 51H, 24H, 40H       ; 018C _ Q@@QQQ$@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 40H, 40H       ; 0194 _ OQQQQQ@@
        db 40H, 40H, 51H, 51H, 51H, 51H, 24H, 40H       ; 019C _ @@QQQQ$@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 51H, 40H       ; 01A4 _ OQQQQQQ@
        db 40H, 51H, 51H, 51H, 51H, 51H, 24H, 40H       ; 01AC _ @QQQQQ$@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 40H, 40H       ; 01B4 _ OQQQQQ@@
        db 40H, 40H, 51H, 51H, 51H, 51H, 24H, 40H       ; 01BC _ @@QQQQ$@
        db 4FH, 51H, 51H, 51H, 51H, 40H, 40H, 51H       ; 01C4 _ OQQQQ@@Q
        db 51H, 40H, 40H, 51H, 51H, 51H, 24H, 40H       ; 01CC _ Q@@QQQ$@
        db 4FH, 51H, 51H, 51H, 40H, 40H, 51H, 51H       ; 01D4 _ OQQQ@@QQ
        db 51H, 51H, 40H, 40H, 51H, 51H, 24H, 40H       ; 01DC _ QQ@@QQ$@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 51H, 51H       ; 01E4 _ OQQQQQQQ
        db 51H, 51H, 51H, 51H, 51H, 51H, 24H, 40H       ; 01EC _ QQQQQQ$@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 51H, 51H       ; 01F4 _ OQQQQQQQ
        db 51H, 51H, 51H, 51H, 51H, 51H, 24H, 40H       ; 01FC _ QQQQQQ$@
        db 4FH, 24H, 24H, 24H, 24H, 24H, 24H, 24H       ; 0204 _ O$$$$$$$
        db 24H, 24H, 24H, 24H, 24H, 24H, 24H, 40H       ; 020C _ $$$$$$$@
        db 40H, 40H, 40H, 40H, 40H, 40H, 40H, 40H       ; 0214 _ @@@@@@@@
        db 40H, 40H, 40H, 40H, 40H, 40H, 40H, 40H       ; 021C _ @@@@@@@@


