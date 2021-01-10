; Disassembly of file: os.o
; Sat Jan  9 18:53:10 2021
; Mode: 32 bits
; Syntax: YASM/NASM
; Instruction set: Pentium Pro


global CMain: function
global initBootInfo: function
global fifo8_init: function
global init_keyboard: function
global enable_mouse: function
global memman_init: function
global memman_free: function
global init_palette: function
global shtctl_init: function
global memman_alloc_4k: function
global sheet_alloc: function
global sheet_setbuf: function
global draw_desktop: function
global sheet_slide: function
global init_mouse_cursor: function
global draw_window: function
global sheet_updown: function
global sheet_refresh: function
global intToHexStr: function
global boxfill8: function
global showString: function
global fifo8_status: function
global fifo8_get: function
global mouse_decode: function
global charToHexVal: function
global charToHexStr: function
global set_palette: function
global putblock: function
global showFont8: function
global fifo8_put: function
global intHandler21: function
global wait_KBC_sendready: function
global show_key_info: function
global intHandler2C: function
global show_mouse_info: function
global memman_total: function
global memman_alloc: function
global memman_free_4k: function
global showMemoryInfo: function
global sheet_refreshsub: function

extern systemFont                                       ; byte
extern io_store_eflags                                  ; near
extern io_stihlt                                        ; near
extern io_sti                                           ; near
extern io_out8                                          ; near
extern io_load_eflags                                   ; near
extern io_in8                                           ; near
extern io_cli                                           ; near


SECTION .text   align=16 execute                        ; section number 1, code

CMain:  ; Function begin
        push    ebp                                     ; 0000 _ 55
        mov     ebp, esp                                ; 0001 _ 89. E5
        push    edi                                     ; 0003 _ 57
        push    esi                                     ; 0004 _ 56
        sub     esp, 592                                ; 0005 _ 81. EC, 00000250
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
        mov     dword [ebp-214H], eax                   ; 009E _ 89. 85, FFFFFDEC
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
        mov     dword [ebp-218H], eax                   ; 018A _ 89. 85, FFFFFDE8
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
        call    init_mouse_cursor                       ; 01E9 _ E8, 00000EB2
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
        mov     dword [ebp-208H], eax                   ; 026D _ 89. 85, FFFFFDF8
        mov     eax, dword [ebp-208H]                   ; 0273 _ 8B. 85, FFFFFDF8
        mov     ecx, dword [ebp-204H]                   ; 0279 _ 8B. 8D, FFFFFDFC
        mov     dword [esp], eax                        ; 027F _ 89. 04 24
        mov     dword [esp+4H], ecx                     ; 0282 _ 89. 4C 24, 04
        mov     dword [esp+8H], 160                     ; 0286 _ C7. 44 24, 08, 000000A0
        mov     dword [esp+0CH], 52                     ; 028E _ C7. 44 24, 0C, 00000034
        mov     dword [esp+10H], -1                     ; 0296 _ C7. 44 24, 10, FFFFFFFF
        call    sheet_setbuf                            ; 029E _ E8, 000008ED
        mov     eax, dword [ebp-204H]                   ; 02A3 _ 8B. 85, FFFFFDFC
        mov     dword [esp], eax                        ; 02A9 _ 89. 04 24
        mov     dword [esp+4H], 160                     ; 02AC _ C7. 44 24, 04, 000000A0
        mov     dword [esp+8H], 52                      ; 02B4 _ C7. 44 24, 08, 00000034
        lea     eax, [CMain.win_title]                  ; 02BC _ 8D. 05, 00000004(d)
        mov     dword [esp+0CH], eax                    ; 02C2 _ 89. 44 24, 0C
        call    draw_window                             ; 02C6 _ E8, 00000EC5
        mov     eax, dword [CMain.shtctl]               ; 02CB _ A1, 00000040(d)
        mov     ecx, dword [ebp-208H]                   ; 02D0 _ 8B. 8D, FFFFFDF8
        mov     dword [esp], eax                        ; 02D6 _ 89. 04 24
        mov     dword [esp+4H], ecx                     ; 02D9 _ 89. 4C 24, 04
        mov     dword [esp+8H], 80                      ; 02DD _ C7. 44 24, 08, 00000050
        mov     dword [esp+0CH], 72                     ; 02E5 _ C7. 44 24, 0C, 00000048
        call    sheet_slide                             ; 02ED _ E8, 00000CCE
        xor     eax, eax                                ; 02F2 _ 31. C0
        mov     ecx, dword [CMain.shtctl]               ; 02F4 _ 8B. 0D, 00000040(d)
        mov     esi, dword [ebp-1FCH]                   ; 02FA _ 8B. B5, FFFFFE04
        mov     dword [esp], ecx                        ; 0300 _ 89. 0C 24
        mov     dword [esp+4H], esi                     ; 0303 _ 89. 74 24, 04
        mov     dword [esp+8H], 0                       ; 0307 _ C7. 44 24, 08, 00000000
        mov     dword [ebp-21CH], eax                   ; 030F _ 89. 85, FFFFFDE4
        call    sheet_updown                            ; 0315 _ E8, 00001226
        mov     eax, dword [CMain.shtctl]               ; 031A _ A1, 00000040(d)
        mov     ecx, dword [ebp-208H]                   ; 031F _ 8B. 8D, FFFFFDF8
        mov     dword [esp], eax                        ; 0325 _ 89. 04 24
        mov     dword [esp+4H], ecx                     ; 0328 _ 89. 4C 24, 04
        mov     dword [esp+8H], 1                       ; 032C _ C7. 44 24, 08, 00000001
        call    sheet_updown                            ; 0334 _ E8, 00001207
        mov     eax, dword [CMain.shtctl]               ; 0339 _ A1, 00000040(d)
        mov     ecx, dword [ebp-200H]                   ; 033E _ 8B. 8D, FFFFFE00
        mov     dword [esp], eax                        ; 0344 _ 89. 04 24
        mov     dword [esp+4H], ecx                     ; 0347 _ 89. 4C 24, 04
        mov     dword [esp+8H], 2                       ; 034B _ C7. 44 24, 08, 00000002
        call    sheet_updown                            ; 0353 _ E8, 000011E8
        xor     eax, eax                                ; 0358 _ 31. C0
        mov     ecx, dword [CMain.shtctl]               ; 035A _ 8B. 0D, 00000040(d)
        mov     esi, dword [ebp-1FCH]                   ; 0360 _ 8B. B5, FFFFFE04
        mov     dword [esp], ecx                        ; 0366 _ 89. 0C 24
        mov     dword [esp+4H], esi                     ; 0369 _ 89. 74 24, 04
        mov     dword [esp+8H], 0                       ; 036D _ C7. 44 24, 08, 00000000
        mov     dword [esp+0CH], 0                      ; 0375 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+10H], 320                    ; 037D _ C7. 44 24, 10, 00000140
        mov     dword [esp+14H], 48                     ; 0385 _ C7. 44 24, 14, 00000030
        mov     dword [ebp-220H], eax                   ; 038D _ 89. 85, FFFFFDE0
        call    sheet_refresh                           ; 0393 _ E8, 00001498
        mov     dword [ebp-20CH], 0                     ; 0398 _ C7. 85, FFFFFDF4, 00000000
        mov     dword [ebp-224H], eax                   ; 03A2 _ 89. 85, FFFFFDDC
?_001:  mov     eax, dword [CMain.counter]              ; 03A8 _ A1, 00000144(d)
        add     eax, 1                                  ; 03AD _ 83. C0, 01
        mov     dword [CMain.counter], eax              ; 03B0 _ A3, 00000144(d)
        mov     eax, dword [CMain.counter]              ; 03B5 _ A1, 00000144(d)
        mov     dword [esp], eax                        ; 03BA _ 89. 04 24
        call    intToHexStr                             ; 03BD _ E8, 000014FE
        mov     dword [ebp-210H], eax                   ; 03C2 _ 89. 85, FFFFFDF0
        mov     eax, dword [ebp-204H]                   ; 03C8 _ 8B. 85, FFFFFDFC
        mov     dword [esp], eax                        ; 03CE _ 89. 04 24
        mov     dword [esp+4H], 160                     ; 03D1 _ C7. 44 24, 04, 000000A0
        mov     dword [esp+8H], 8                       ; 03D9 _ C7. 44 24, 08, 00000008
        mov     dword [esp+0CH], 40                     ; 03E1 _ C7. 44 24, 0C, 00000028
        mov     dword [esp+10H], 28                     ; 03E9 _ C7. 44 24, 10, 0000001C
        mov     dword [esp+14H], 119                    ; 03F1 _ C7. 44 24, 14, 00000077
        mov     dword [esp+18H], 43                     ; 03F9 _ C7. 44 24, 18, 0000002B
        call    boxfill8                                ; 0401 _ E8, 0000159A
        xor     eax, eax                                ; 0406 _ 31. C0
        mov     ecx, dword [ebp-204H]                   ; 0408 _ 8B. 8D, FFFFFDFC
        mov     edx, dword [ebp-210H]                   ; 040E _ 8B. 95, FFFFFDF0
        mov     dword [esp], ecx                        ; 0414 _ 89. 0C 24
        mov     dword [esp+4H], 160                     ; 0417 _ C7. 44 24, 04, 000000A0
        mov     dword [esp+8H], 40                      ; 041F _ C7. 44 24, 08, 00000028
        mov     dword [esp+0CH], 28                     ; 0427 _ C7. 44 24, 0C, 0000001C
        mov     dword [esp+10H], 0                      ; 042F _ C7. 44 24, 10, 00000000
        mov     dword [esp+14H], edx                    ; 0437 _ 89. 54 24, 14
        mov     dword [ebp-228H], eax                   ; 043B _ 89. 85, FFFFFDD8
        call    showString                              ; 0441 _ E8, 000015FA
        mov     eax, dword [CMain.shtctl]               ; 0446 _ A1, 00000040(d)
        mov     ecx, dword [ebp-208H]                   ; 044B _ 8B. 8D, FFFFFDF8
        mov     dword [esp], eax                        ; 0451 _ 89. 04 24
        mov     dword [esp+4H], ecx                     ; 0454 _ 89. 4C 24, 04
        mov     dword [esp+8H], 40                      ; 0458 _ C7. 44 24, 08, 00000028
        mov     dword [esp+0CH], 28                     ; 0460 _ C7. 44 24, 0C, 0000001C
        mov     dword [esp+10H], 119                    ; 0468 _ C7. 44 24, 10, 00000077
        mov     dword [esp+14H], 43                     ; 0470 _ C7. 44 24, 14, 0000002B
        call    sheet_refresh                           ; 0478 _ E8, 000013B3
        mov     dword [ebp-22CH], eax                   ; 047D _ 89. 85, FFFFFDD4
        call    io_cli                                  ; 0483 _ E8, FFFFFFFC(rel)
        lea     eax, [keyfifo]                          ; 0488 _ 8D. 05, 00000000(d)
        mov     dword [esp], eax                        ; 048E _ 89. 04 24
        call    fifo8_status                            ; 0491 _ E8, 0000164A
        lea     ecx, [mousefifo]                        ; 0496 _ 8D. 0D, 00000018(d)
        mov     dword [esp], ecx                        ; 049C _ 89. 0C 24
        mov     dword [ebp-230H], eax                   ; 049F _ 89. 85, FFFFFDD0
        call    fifo8_status                            ; 04A5 _ E8, 00001636
        mov     ecx, dword [ebp-230H]                   ; 04AA _ 8B. 8D, FFFFFDD0
        add     ecx, eax                                ; 04B0 _ 01. C1
        cmp     ecx, 0                                  ; 04B2 _ 83. F9, 00
; Note: Immediate operand could be made smaller by sign extension
        jne     ?_002                                   ; 04B5 _ 0F 85, 0000000A
        call    io_stihlt                               ; 04BB _ E8, FFFFFFFC(rel)
        jmp     ?_011                                   ; 04C0 _ E9, 00000161

?_002:  lea     eax, [keyfifo]                          ; 04C5 _ 8D. 05, 00000000(d)
        mov     dword [esp], eax                        ; 04CB _ 89. 04 24
        call    fifo8_status                            ; 04CE _ E8, 0000160D
        cmp     eax, 0                                  ; 04D3 _ 83. F8, 00
; Note: Immediate operand could be made smaller by sign extension
        je      ?_003                                   ; 04D6 _ 0F 84, 0000001E
        call    io_sti                                  ; 04DC _ E8, FFFFFFFC(rel)
        lea     eax, [keyfifo]                          ; 04E1 _ 8D. 05, 00000000(d)
        mov     dword [esp], eax                        ; 04E7 _ 89. 04 24
        call    fifo8_get                               ; 04EA _ E8, 00001611
        mov     dword [ebp-20CH], eax                   ; 04EF _ 89. 85, FFFFFDF4
        jmp     ?_010                                   ; 04F5 _ E9, 00000127

?_003:  lea     eax, [mousefifo]                        ; 04FA _ 8D. 05, 00000018(d)
        mov     dword [esp], eax                        ; 0500 _ 89. 04 24
        call    fifo8_status                            ; 0503 _ E8, 000015D8
        cmp     eax, 0                                  ; 0508 _ 83. F8, 00
        je      ?_009                                   ; 050B _ 0F 84, 0000010B
        lea     eax, [mousefifo]                        ; 0511 _ 8D. 05, 00000018(d)
        mov     dword [esp], eax                        ; 0517 _ 89. 04 24
        call    fifo8_get                               ; 051A _ E8, 000015E1
        mov     dword [ebp-20CH], eax                   ; 051F _ 89. 85, FFFFFDF4
        call    io_sti                                  ; 0525 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-20CH]                   ; 052A _ 8B. 85, FFFFFDF4
        mov     cl, al                                  ; 0530 _ 88. C1
        lea     eax, [mdec]                             ; 0532 _ 8D. 05, 00000030(d)
        mov     dword [esp], eax                        ; 0538 _ 89. 04 24
        movzx   eax, cl                                 ; 053B _ 0F B6. C1
        mov     dword [esp+4H], eax                     ; 053E _ 89. 44 24, 04
        call    mouse_decode                            ; 0542 _ E8, 00001639
        cmp     eax, 0                                  ; 0547 _ 83. F8, 00
        je      ?_008                                   ; 054A _ 0F 84, 000000C7
        mov     eax, dword [?_148]                      ; 0550 _ A1, 00000034(d)
        add     eax, dword [ebp-1E8H]                   ; 0555 _ 03. 85, FFFFFE18
        mov     dword [ebp-1E8H], eax                   ; 055B _ 89. 85, FFFFFE18
        mov     eax, dword [?_149]                      ; 0561 _ A1, 00000038(d)
        add     eax, dword [ebp-1ECH]                   ; 0566 _ 03. 85, FFFFFE14
        mov     dword [ebp-1ECH], eax                   ; 056C _ 89. 85, FFFFFE14
        cmp     dword [ebp-1E8H], 0                     ; 0572 _ 83. BD, FFFFFE18, 00
; Note: Immediate operand could be made smaller by sign extension
        jge     ?_004                                   ; 0579 _ 0F 8D, 0000000A
        mov     dword [ebp-1E8H], 0                     ; 057F _ C7. 85, FFFFFE18, 00000000
?_004:  cmp     dword [ebp-1ECH], 0                     ; 0589 _ 83. BD, FFFFFE14, 00
; Note: Immediate operand could be made smaller by sign extension
        jge     ?_005                                   ; 0590 _ 0F 8D, 0000000A
        mov     dword [ebp-1ECH], 0                     ; 0596 _ C7. 85, FFFFFE14, 00000000
?_005:  mov     eax, dword [ebp-1E8H]                   ; 05A0 _ 8B. 85, FFFFFE18
        mov     ecx, dword [ebp-1CH]                    ; 05A6 _ 8B. 4D, E4
        mov     ecx, dword [ecx+4H]                     ; 05A9 _ 8B. 49, 04
        sub     ecx, 16                                 ; 05AC _ 83. E9, 10
        cmp     eax, ecx                                ; 05AF _ 39. C8
; Note: Immediate operand could be made smaller by sign extension
        jle     ?_006                                   ; 05B1 _ 0F 8E, 0000000F
        mov     eax, dword [ebp-1CH]                    ; 05B7 _ 8B. 45, E4
        mov     eax, dword [eax+4H]                     ; 05BA _ 8B. 40, 04
        sub     eax, 16                                 ; 05BD _ 83. E8, 10
        mov     dword [ebp-1E8H], eax                   ; 05C0 _ 89. 85, FFFFFE18
?_006:  mov     eax, dword [ebp-1ECH]                   ; 05C6 _ 8B. 85, FFFFFE14
        mov     ecx, dword [ebp-1CH]                    ; 05CC _ 8B. 4D, E4
        mov     ecx, dword [ecx+8H]                     ; 05CF _ 8B. 49, 08
        sub     ecx, 16                                 ; 05D2 _ 83. E9, 10
        cmp     eax, ecx                                ; 05D5 _ 39. C8
; Note: Immediate operand could be made smaller by sign extension
        jle     ?_007                                   ; 05D7 _ 0F 8E, 0000000F
        mov     eax, dword [ebp-1CH]                    ; 05DD _ 8B. 45, E4
        mov     eax, dword [eax+8H]                     ; 05E0 _ 8B. 40, 08
        sub     eax, 16                                 ; 05E3 _ 83. E8, 10
        mov     dword [ebp-1ECH], eax                   ; 05E6 _ 89. 85, FFFFFE14
?_007:  mov     eax, dword [CMain.shtctl]               ; 05EC _ A1, 00000040(d)
        mov     ecx, dword [ebp-200H]                   ; 05F1 _ 8B. 8D, FFFFFE00
        mov     edx, dword [ebp-1E8H]                   ; 05F7 _ 8B. 95, FFFFFE18
        mov     esi, dword [ebp-1ECH]                   ; 05FD _ 8B. B5, FFFFFE14
        mov     dword [esp], eax                        ; 0603 _ 89. 04 24
        mov     dword [esp+4H], ecx                     ; 0606 _ 89. 4C 24, 04
        mov     dword [esp+8H], edx                     ; 060A _ 89. 54 24, 08
        mov     dword [esp+0CH], esi                    ; 060E _ 89. 74 24, 0C
        call    sheet_slide                             ; 0612 _ E8, 000009A9
?_008:
; Note: Immediate operand could be made smaller by sign extension
        jmp     ?_009                                   ; 0617 _ E9, 00000000

?_009:
; Note: Immediate operand could be made smaller by sign extension
        jmp     ?_010                                   ; 061C _ E9, 00000000

?_010:
; Note: Immediate operand could be made smaller by sign extension
        jmp     ?_011                                   ; 0621 _ E9, 00000000

?_011:  jmp     ?_001                                   ; 0626 _ E9, FFFFFD7D
; CMain End of function

; Filling space: 5H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 44H, 00H, 00H

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
        call    wait_KBC_sendready                      ; 06C6 _ E8, 00001A85
        mov     dword [esp], 100                        ; 06CB _ C7. 04 24, 00000064
        mov     dword [esp+4H], 96                      ; 06D2 _ C7. 44 24, 04, 00000060
        call    io_out8                                 ; 06DA _ E8, FFFFFFFC(rel)
        call    wait_KBC_sendready                      ; 06DF _ E8, 00001A6C
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
        call    wait_KBC_sendready                      ; 070C _ E8, 00001A3F
        mov     dword [esp], 100                        ; 0711 _ C7. 04 24, 00000064
        mov     dword [esp+4H], 212                     ; 0718 _ C7. 44 24, 04, 000000D4
        call    io_out8                                 ; 0720 _ E8, FFFFFFFC(rel)
        call    wait_KBC_sendready                      ; 0725 _ E8, 00001A26
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
        call    set_palette                             ; 09D4 _ E8, 000013C7
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
        call    memman_alloc                            ; 0AD2 _ E8, 00001899
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
        call    boxfill8                                ; 0C4F _ E8, 00000D4C
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
        call    boxfill8                                ; 0C94 _ E8, 00000D07
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
        call    boxfill8                                ; 0CD9 _ E8, 00000CC2
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
        call    boxfill8                                ; 0D1E _ E8, 00000C7D
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
        call    boxfill8                                ; 0D5C _ E8, 00000C3F
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
        call    boxfill8                                ; 0D9A _ E8, 00000C01
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
        call    boxfill8                                ; 0DD8 _ E8, 00000BC3
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
        call    boxfill8                                ; 0E16 _ E8, 00000B85
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
        call    boxfill8                                ; 0E59 _ E8, 00000B42
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
        call    boxfill8                                ; 0E9C _ E8, 00000AFF
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
        call    boxfill8                                ; 0EDE _ E8, 00000ABD
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
        call    boxfill8                                ; 0F20 _ E8, 00000A7B
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
        call    boxfill8                                ; 0F62 _ E8, 00000A39
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
        call    boxfill8                                ; 0FA4 _ E8, 000009F7
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
        sub     esp, 60                                 ; 0FC6 _ 83. EC, 3C
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
        jl      ?_036                                   ; 100C _ 0F 8C, 0000007D
        xor     eax, eax                                ; 1012 _ 31. C0
        mov     ecx, dword [ebp+8H]                     ; 1014 _ 8B. 4D, 08
        mov     edx, dword [ebp-10H]                    ; 1017 _ 8B. 55, F0
        mov     esi, dword [ebp-14H]                    ; 101A _ 8B. 75, EC
        mov     edi, dword [ebp-10H]                    ; 101D _ 8B. 7D, F0
        mov     ebx, dword [ebp+0CH]                    ; 1020 _ 8B. 5D, 0C
        add     edi, dword [ebx+4H]                     ; 1023 _ 03. 7B, 04
        mov     ebx, dword [ebp-14H]                    ; 1026 _ 8B. 5D, EC
        mov     dword [ebp-28H], eax                    ; 1029 _ 89. 45, D8
        mov     eax, dword [ebp+0CH]                    ; 102C _ 8B. 45, 0C
        add     ebx, dword [eax+8H]                     ; 102F _ 03. 58, 08
        mov     dword [esp], ecx                        ; 1032 _ 89. 0C 24
        mov     dword [esp+4H], edx                     ; 1035 _ 89. 54 24, 04
        mov     dword [esp+8H], esi                     ; 1039 _ 89. 74 24, 08
        mov     dword [esp+0CH], edi                    ; 103D _ 89. 7C 24, 0C
        mov     dword [esp+10H], ebx                    ; 1041 _ 89. 5C 24, 10
        mov     dword [esp+14H], 0                      ; 1045 _ C7. 44 24, 14, 00000000
        call    sheet_refreshsub                        ; 104D _ E8, 0000168E
        mov     eax, dword [ebp+8H]                     ; 1052 _ 8B. 45, 08
        mov     ecx, dword [ebp+10H]                    ; 1055 _ 8B. 4D, 10
        mov     edx, dword [ebp+14H]                    ; 1058 _ 8B. 55, 14
        mov     esi, dword [ebp+10H]                    ; 105B _ 8B. 75, 10
        mov     edi, dword [ebp+0CH]                    ; 105E _ 8B. 7D, 0C
        add     esi, dword [edi+4H]                     ; 1061 _ 03. 77, 04
        mov     edi, dword [ebp+14H]                    ; 1064 _ 8B. 7D, 14
        mov     ebx, dword [ebp+0CH]                    ; 1067 _ 8B. 5D, 0C
        add     edi, dword [ebx+8H]                     ; 106A _ 03. 7B, 08
        mov     ebx, dword [ebp+0CH]                    ; 106D _ 8B. 5D, 0C
        mov     ebx, dword [ebx+18H]                    ; 1070 _ 8B. 5B, 18
        mov     dword [esp], eax                        ; 1073 _ 89. 04 24
        mov     dword [esp+4H], ecx                     ; 1076 _ 89. 4C 24, 04
        mov     dword [esp+8H], edx                     ; 107A _ 89. 54 24, 08
        mov     dword [esp+0CH], esi                    ; 107E _ 89. 74 24, 0C
        mov     dword [esp+10H], edi                    ; 1082 _ 89. 7C 24, 10
        mov     dword [esp+14H], ebx                    ; 1086 _ 89. 5C 24, 14
        call    sheet_refreshsub                        ; 108A _ E8, 00001651
?_036:  add     esp, 60                                 ; 108F _ 83. C4, 3C
        pop     esi                                     ; 1092 _ 5E
        pop     edi                                     ; 1093 _ 5F
        pop     ebx                                     ; 1094 _ 5B
        pop     ebp                                     ; 1095 _ 5D
        ret                                             ; 1096 _ C3
; sheet_slide End of function

; Filling space: 9H
; Filler type: Multi-byte NOP
;       db 66H, 0FH, 1FH, 84H, 00H, 00H, 00H, 00H
;       db 00H

ALIGN   16

init_mouse_cursor:; Function begin
        push    ebp                                     ; 10A0 _ 55
        mov     ebp, esp                                ; 10A1 _ 89. E5
        sub     esp, 16                                 ; 10A3 _ 83. EC, 10
        mov     al, byte [ebp+0CH]                      ; 10A6 _ 8A. 45, 0C
        mov     ecx, dword [ebp+8H]                     ; 10A9 _ 8B. 4D, 08
        mov     dword [ebp-8H], 0                       ; 10AC _ C7. 45, F8, 00000000
        mov     byte [ebp-9H], al                       ; 10B3 _ 88. 45, F7
        mov     dword [ebp-10H], ecx                    ; 10B6 _ 89. 4D, F0
?_037:  cmp     dword [ebp-8H], 16                      ; 10B9 _ 83. 7D, F8, 10
        jge     ?_045                                   ; 10BD _ 0F 8D, 000000C3
        mov     dword [ebp-4H], 0                       ; 10C3 _ C7. 45, FC, 00000000
?_038:  cmp     dword [ebp-4H], 16                      ; 10CA _ 83. 7D, FC, 10
        jge     ?_043                                   ; 10CE _ 0F 8D, 0000009F
        mov     eax, dword [ebp-8H]                     ; 10D4 _ 8B. 45, F8
        shl     eax, 4                                  ; 10D7 _ C1. E0, 04
        lea     ecx, [init_mouse_cursor.cursor]         ; 10DA _ 8D. 0D, 00000044(d)
        add     ecx, eax                                ; 10E0 _ 01. C1
        mov     eax, dword [ebp-4H]                     ; 10E2 _ 8B. 45, FC
        movsx   eax, byte [ecx+eax]                     ; 10E5 _ 0F BE. 04 01
        cmp     eax, 42                                 ; 10E9 _ 83. F8, 2A
; Note: Immediate operand could be made smaller by sign extension
        jne     ?_039                                   ; 10EC _ 0F 85, 00000010
        mov     eax, dword [ebp+8H]                     ; 10F2 _ 8B. 45, 08
        mov     ecx, dword [ebp-8H]                     ; 10F5 _ 8B. 4D, F8
        shl     ecx, 4                                  ; 10F8 _ C1. E1, 04
        add     ecx, dword [ebp-4H]                     ; 10FB _ 03. 4D, FC
        mov     byte [eax+ecx], 0                       ; 10FE _ C6. 04 08, 00
?_039:  mov     eax, dword [ebp-8H]                     ; 1102 _ 8B. 45, F8
        shl     eax, 4                                  ; 1105 _ C1. E0, 04
        lea     ecx, [init_mouse_cursor.cursor]         ; 1108 _ 8D. 0D, 00000044(d)
        add     ecx, eax                                ; 110E _ 01. C1
        mov     eax, dword [ebp-4H]                     ; 1110 _ 8B. 45, FC
        movsx   eax, byte [ecx+eax]                     ; 1113 _ 0F BE. 04 01
        cmp     eax, 79                                 ; 1117 _ 83. F8, 4F
; Note: Immediate operand could be made smaller by sign extension
        jne     ?_040                                   ; 111A _ 0F 85, 00000010
        mov     eax, dword [ebp+8H]                     ; 1120 _ 8B. 45, 08
        mov     ecx, dword [ebp-8H]                     ; 1123 _ 8B. 4D, F8
        shl     ecx, 4                                  ; 1126 _ C1. E1, 04
        add     ecx, dword [ebp-4H]                     ; 1129 _ 03. 4D, FC
        mov     byte [eax+ecx], 7                       ; 112C _ C6. 04 08, 07
?_040:  mov     eax, dword [ebp-8H]                     ; 1130 _ 8B. 45, F8
        shl     eax, 4                                  ; 1133 _ C1. E0, 04
        lea     ecx, [init_mouse_cursor.cursor]         ; 1136 _ 8D. 0D, 00000044(d)
        add     ecx, eax                                ; 113C _ 01. C1
        mov     eax, dword [ebp-4H]                     ; 113E _ 8B. 45, FC
        movsx   eax, byte [ecx+eax]                     ; 1141 _ 0F BE. 04 01
        cmp     eax, 46                                 ; 1145 _ 83. F8, 2E
; Note: Immediate operand could be made smaller by sign extension
        jne     ?_041                                   ; 1148 _ 0F 85, 00000012
        mov     al, byte [ebp+0CH]                      ; 114E _ 8A. 45, 0C
        mov     ecx, dword [ebp+8H]                     ; 1151 _ 8B. 4D, 08
        mov     edx, dword [ebp-8H]                     ; 1154 _ 8B. 55, F8
        shl     edx, 4                                  ; 1157 _ C1. E2, 04
        add     edx, dword [ebp-4H]                     ; 115A _ 03. 55, FC
        mov     byte [ecx+edx], al                      ; 115D _ 88. 04 11
?_041:
; Note: Immediate operand could be made smaller by sign extension
        jmp     ?_042                                   ; 1160 _ E9, 00000000

?_042:  mov     eax, dword [ebp-4H]                     ; 1165 _ 8B. 45, FC
        add     eax, 1                                  ; 1168 _ 83. C0, 01
        mov     dword [ebp-4H], eax                     ; 116B _ 89. 45, FC
        jmp     ?_038                                   ; 116E _ E9, FFFFFF57

?_043:
; Note: Immediate operand could be made smaller by sign extension
        jmp     ?_044                                   ; 1173 _ E9, 00000000

?_044:  mov     eax, dword [ebp-8H]                     ; 1178 _ 8B. 45, F8
        add     eax, 1                                  ; 117B _ 83. C0, 01
        mov     dword [ebp-8H], eax                     ; 117E _ 89. 45, F8
        jmp     ?_037                                   ; 1181 _ E9, FFFFFF33

?_045:  add     esp, 16                                 ; 1186 _ 83. C4, 10
        pop     ebp                                     ; 1189 _ 5D
        ret                                             ; 118A _ C3
; init_mouse_cursor End of function

; Filling space: 5H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 44H, 00H, 00H

ALIGN   8

draw_window:; Function begin
        push    ebp                                     ; 1190 _ 55
        mov     ebp, esp                                ; 1191 _ 89. E5
        push    ebx                                     ; 1193 _ 53
        push    edi                                     ; 1194 _ 57
        push    esi                                     ; 1195 _ 56
        sub     esp, 76                                 ; 1196 _ 83. EC, 4C
        mov     eax, dword [ebp+14H]                    ; 1199 _ 8B. 45, 14
        mov     ecx, dword [ebp+10H]                    ; 119C _ 8B. 4D, 10
        mov     edx, dword [ebp+0CH]                    ; 119F _ 8B. 55, 0C
        mov     esi, dword [ebp+8H]                     ; 11A2 _ 8B. 75, 08
        xor     edi, edi                                ; 11A5 _ 31. FF
        mov     ebx, dword [ebp+8H]                     ; 11A7 _ 8B. 5D, 08
        mov     dword [ebp-1CH], eax                    ; 11AA _ 89. 45, E4
        mov     eax, dword [ebp+0CH]                    ; 11AD _ 8B. 45, 0C
        mov     dword [ebp-20H], eax                    ; 11B0 _ 89. 45, E0
        mov     eax, dword [ebp+0CH]                    ; 11B3 _ 8B. 45, 0C
        sub     eax, 1                                  ; 11B6 _ 83. E8, 01
        mov     dword [esp], ebx                        ; 11B9 _ 89. 1C 24
        mov     ebx, dword [ebp-20H]                    ; 11BC _ 8B. 5D, E0
        mov     dword [esp+4H], ebx                     ; 11BF _ 89. 5C 24, 04
        mov     dword [esp+8H], 8                       ; 11C3 _ C7. 44 24, 08, 00000008
        mov     dword [esp+0CH], 0                      ; 11CB _ C7. 44 24, 0C, 00000000
        mov     dword [esp+10H], 0                      ; 11D3 _ C7. 44 24, 10, 00000000
        mov     dword [esp+14H], eax                    ; 11DB _ 89. 44 24, 14
        mov     dword [esp+18H], 0                      ; 11DF _ C7. 44 24, 18, 00000000
        mov     dword [ebp-24H], ecx                    ; 11E7 _ 89. 4D, DC
        mov     dword [ebp-28H], edx                    ; 11EA _ 89. 55, D8
        mov     dword [ebp-2CH], esi                    ; 11ED _ 89. 75, D4
        mov     dword [ebp-30H], edi                    ; 11F0 _ 89. 7D, D0
        call    boxfill8                                ; 11F3 _ E8, 000007A8
        mov     eax, dword [ebp+8H]                     ; 11F8 _ 8B. 45, 08
        mov     ecx, dword [ebp+0CH]                    ; 11FB _ 8B. 4D, 0C
        mov     edx, dword [ebp+0CH]                    ; 11FE _ 8B. 55, 0C
        sub     edx, 2                                  ; 1201 _ 83. EA, 02
        mov     dword [esp], eax                        ; 1204 _ 89. 04 24
        mov     dword [esp+4H], ecx                     ; 1207 _ 89. 4C 24, 04
        mov     dword [esp+8H], 7                       ; 120B _ C7. 44 24, 08, 00000007
        mov     dword [esp+0CH], 1                      ; 1213 _ C7. 44 24, 0C, 00000001
        mov     dword [esp+10H], 1                      ; 121B _ C7. 44 24, 10, 00000001
        mov     dword [esp+14H], edx                    ; 1223 _ 89. 54 24, 14
        mov     dword [esp+18H], 1                      ; 1227 _ C7. 44 24, 18, 00000001
        call    boxfill8                                ; 122F _ E8, 0000076C
        xor     eax, eax                                ; 1234 _ 31. C0
        mov     ecx, dword [ebp+8H]                     ; 1236 _ 8B. 4D, 08
        mov     edx, dword [ebp+0CH]                    ; 1239 _ 8B. 55, 0C
        mov     esi, dword [ebp+10H]                    ; 123C _ 8B. 75, 10
        sub     esi, 1                                  ; 123F _ 83. EE, 01
        mov     dword [esp], ecx                        ; 1242 _ 89. 0C 24
        mov     dword [esp+4H], edx                     ; 1245 _ 89. 54 24, 04
        mov     dword [esp+8H], 8                       ; 1249 _ C7. 44 24, 08, 00000008
        mov     dword [esp+0CH], 0                      ; 1251 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+10H], 0                      ; 1259 _ C7. 44 24, 10, 00000000
        mov     dword [esp+14H], 0                      ; 1261 _ C7. 44 24, 14, 00000000
        mov     dword [esp+18H], esi                    ; 1269 _ 89. 74 24, 18
        mov     dword [ebp-34H], eax                    ; 126D _ 89. 45, CC
        call    boxfill8                                ; 1270 _ E8, 0000072B
        mov     eax, dword [ebp+8H]                     ; 1275 _ 8B. 45, 08
        mov     ecx, dword [ebp+0CH]                    ; 1278 _ 8B. 4D, 0C
        mov     edx, dword [ebp+10H]                    ; 127B _ 8B. 55, 10
        sub     edx, 2                                  ; 127E _ 83. EA, 02
        mov     dword [esp], eax                        ; 1281 _ 89. 04 24
        mov     dword [esp+4H], ecx                     ; 1284 _ 89. 4C 24, 04
        mov     dword [esp+8H], 7                       ; 1288 _ C7. 44 24, 08, 00000007
        mov     dword [esp+0CH], 1                      ; 1290 _ C7. 44 24, 0C, 00000001
        mov     dword [esp+10H], 1                      ; 1298 _ C7. 44 24, 10, 00000001
        mov     dword [esp+14H], 1                      ; 12A0 _ C7. 44 24, 14, 00000001
        mov     dword [esp+18H], edx                    ; 12A8 _ 89. 54 24, 18
        call    boxfill8                                ; 12AC _ E8, 000006EF
        mov     eax, dword [ebp+8H]                     ; 12B1 _ 8B. 45, 08
        mov     ecx, dword [ebp+0CH]                    ; 12B4 _ 8B. 4D, 0C
        mov     edx, dword [ebp+0CH]                    ; 12B7 _ 8B. 55, 0C
        sub     edx, 2                                  ; 12BA _ 83. EA, 02
        mov     esi, dword [ebp+0CH]                    ; 12BD _ 8B. 75, 0C
        sub     esi, 2                                  ; 12C0 _ 83. EE, 02
        mov     edi, dword [ebp+10H]                    ; 12C3 _ 8B. 7D, 10
        sub     edi, 2                                  ; 12C6 _ 83. EF, 02
        mov     dword [esp], eax                        ; 12C9 _ 89. 04 24
        mov     dword [esp+4H], ecx                     ; 12CC _ 89. 4C 24, 04
        mov     dword [esp+8H], 15                      ; 12D0 _ C7. 44 24, 08, 0000000F
        mov     dword [esp+0CH], edx                    ; 12D8 _ 89. 54 24, 0C
        mov     dword [esp+10H], 1                      ; 12DC _ C7. 44 24, 10, 00000001
        mov     dword [esp+14H], esi                    ; 12E4 _ 89. 74 24, 14
        mov     dword [esp+18H], edi                    ; 12E8 _ 89. 7C 24, 18
        call    boxfill8                                ; 12EC _ E8, 000006AF
        xor     eax, eax                                ; 12F1 _ 31. C0
        mov     ecx, dword [ebp+8H]                     ; 12F3 _ 8B. 4D, 08
        mov     edx, dword [ebp+0CH]                    ; 12F6 _ 8B. 55, 0C
        mov     esi, dword [ebp+0CH]                    ; 12F9 _ 8B. 75, 0C
        sub     esi, 1                                  ; 12FC _ 83. EE, 01
        mov     edi, dword [ebp+0CH]                    ; 12FF _ 8B. 7D, 0C
        sub     edi, 1                                  ; 1302 _ 83. EF, 01
        mov     ebx, dword [ebp+10H]                    ; 1305 _ 8B. 5D, 10
        sub     ebx, 1                                  ; 1308 _ 83. EB, 01
        mov     dword [esp], ecx                        ; 130B _ 89. 0C 24
        mov     dword [esp+4H], edx                     ; 130E _ 89. 54 24, 04
        mov     dword [esp+8H], 0                       ; 1312 _ C7. 44 24, 08, 00000000
        mov     dword [esp+0CH], esi                    ; 131A _ 89. 74 24, 0C
        mov     dword [esp+10H], 0                      ; 131E _ C7. 44 24, 10, 00000000
        mov     dword [esp+14H], edi                    ; 1326 _ 89. 7C 24, 14
        mov     dword [esp+18H], ebx                    ; 132A _ 89. 5C 24, 18
        mov     dword [ebp-38H], eax                    ; 132E _ 89. 45, C8
        call    boxfill8                                ; 1331 _ E8, 0000066A
        mov     eax, dword [ebp+8H]                     ; 1336 _ 8B. 45, 08
        mov     ecx, dword [ebp+0CH]                    ; 1339 _ 8B. 4D, 0C
        mov     edx, dword [ebp+0CH]                    ; 133C _ 8B. 55, 0C
        sub     edx, 3                                  ; 133F _ 83. EA, 03
        mov     esi, dword [ebp+10H]                    ; 1342 _ 8B. 75, 10
        sub     esi, 3                                  ; 1345 _ 83. EE, 03
        mov     dword [esp], eax                        ; 1348 _ 89. 04 24
        mov     dword [esp+4H], ecx                     ; 134B _ 89. 4C 24, 04
        mov     dword [esp+8H], 8                       ; 134F _ C7. 44 24, 08, 00000008
        mov     dword [esp+0CH], 2                      ; 1357 _ C7. 44 24, 0C, 00000002
        mov     dword [esp+10H], 2                      ; 135F _ C7. 44 24, 10, 00000002
        mov     dword [esp+14H], edx                    ; 1367 _ 89. 54 24, 14
        mov     dword [esp+18H], esi                    ; 136B _ 89. 74 24, 18
        call    boxfill8                                ; 136F _ E8, 0000062C
        mov     eax, dword [ebp+8H]                     ; 1374 _ 8B. 45, 08
        mov     ecx, dword [ebp+0CH]                    ; 1377 _ 8B. 4D, 0C
        mov     edx, dword [ebp+0CH]                    ; 137A _ 8B. 55, 0C
        sub     edx, 4                                  ; 137D _ 83. EA, 04
        mov     dword [esp], eax                        ; 1380 _ 89. 04 24
        mov     dword [esp+4H], ecx                     ; 1383 _ 89. 4C 24, 04
        mov     dword [esp+8H], 12                      ; 1387 _ C7. 44 24, 08, 0000000C
        mov     dword [esp+0CH], 3                      ; 138F _ C7. 44 24, 0C, 00000003
        mov     dword [esp+10H], 3                      ; 1397 _ C7. 44 24, 10, 00000003
        mov     dword [esp+14H], edx                    ; 139F _ 89. 54 24, 14
        mov     dword [esp+18H], 20                     ; 13A3 _ C7. 44 24, 18, 00000014
        call    boxfill8                                ; 13AB _ E8, 000005F0
        mov     eax, dword [ebp+8H]                     ; 13B0 _ 8B. 45, 08
        mov     ecx, dword [ebp+0CH]                    ; 13B3 _ 8B. 4D, 0C
        mov     edx, dword [ebp+10H]                    ; 13B6 _ 8B. 55, 10
        sub     edx, 2                                  ; 13B9 _ 83. EA, 02
        mov     esi, dword [ebp+0CH]                    ; 13BC _ 8B. 75, 0C
        sub     esi, 2                                  ; 13BF _ 83. EE, 02
        mov     edi, dword [ebp+10H]                    ; 13C2 _ 8B. 7D, 10
        sub     edi, 2                                  ; 13C5 _ 83. EF, 02
        mov     dword [esp], eax                        ; 13C8 _ 89. 04 24
        mov     dword [esp+4H], ecx                     ; 13CB _ 89. 4C 24, 04
        mov     dword [esp+8H], 15                      ; 13CF _ C7. 44 24, 08, 0000000F
        mov     dword [esp+0CH], 1                      ; 13D7 _ C7. 44 24, 0C, 00000001
        mov     dword [esp+10H], edx                    ; 13DF _ 89. 54 24, 10
        mov     dword [esp+14H], esi                    ; 13E3 _ 89. 74 24, 14
        mov     dword [esp+18H], edi                    ; 13E7 _ 89. 7C 24, 18
        call    boxfill8                                ; 13EB _ E8, 000005B0
        xor     eax, eax                                ; 13F0 _ 31. C0
        mov     ecx, dword [ebp+8H]                     ; 13F2 _ 8B. 4D, 08
        mov     edx, dword [ebp+0CH]                    ; 13F5 _ 8B. 55, 0C
        mov     esi, dword [ebp+10H]                    ; 13F8 _ 8B. 75, 10
        sub     esi, 1                                  ; 13FB _ 83. EE, 01
        mov     edi, dword [ebp+0CH]                    ; 13FE _ 8B. 7D, 0C
        sub     edi, 1                                  ; 1401 _ 83. EF, 01
        mov     ebx, dword [ebp+10H]                    ; 1404 _ 8B. 5D, 10
        sub     ebx, 1                                  ; 1407 _ 83. EB, 01
        mov     dword [esp], ecx                        ; 140A _ 89. 0C 24
        mov     dword [esp+4H], edx                     ; 140D _ 89. 54 24, 04
        mov     dword [esp+8H], 0                       ; 1411 _ C7. 44 24, 08, 00000000
        mov     dword [esp+0CH], 0                      ; 1419 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+10H], esi                    ; 1421 _ 89. 74 24, 10
        mov     dword [esp+14H], edi                    ; 1425 _ 89. 7C 24, 14
        mov     dword [esp+18H], ebx                    ; 1429 _ 89. 5C 24, 18
        mov     dword [ebp-3CH], eax                    ; 142D _ 89. 45, C4
        call    boxfill8                                ; 1430 _ E8, 0000056B
        mov     eax, dword [ebp+8H]                     ; 1435 _ 8B. 45, 08
        mov     ecx, dword [ebp+0CH]                    ; 1438 _ 8B. 4D, 0C
        mov     edx, dword [ebp+14H]                    ; 143B _ 8B. 55, 14
        mov     dword [esp], eax                        ; 143E _ 89. 04 24
        mov     dword [esp+4H], ecx                     ; 1441 _ 89. 4C 24, 04
        mov     dword [esp+8H], 24                      ; 1445 _ C7. 44 24, 08, 00000018
        mov     dword [esp+0CH], 4                      ; 144D _ C7. 44 24, 0C, 00000004
        mov     dword [esp+10H], 7                      ; 1455 _ C7. 44 24, 10, 00000007
        mov     dword [esp+14H], edx                    ; 145D _ 89. 54 24, 14
        call    showString                              ; 1461 _ E8, 000005DA
        mov     dword [ebp-14H], 0                      ; 1466 _ C7. 45, EC, 00000000
?_046:  cmp     dword [ebp-14H], 14                     ; 146D _ 83. 7D, EC, 0E
        jge     ?_056                                   ; 1471 _ 0F 8D, 000000B7
        mov     dword [ebp-10H], 0                      ; 1477 _ C7. 45, F0, 00000000
?_047:  cmp     dword [ebp-10H], 16                     ; 147E _ 83. 7D, F0, 10
        jge     ?_054                                   ; 1482 _ 0F 8D, 00000093
        mov     eax, dword [ebp-14H]                    ; 1488 _ 8B. 45, EC
        shl     eax, 4                                  ; 148B _ C1. E0, 04
        lea     ecx, [draw_window.closebtn]             ; 148E _ 8D. 0D, 00000144(d)
        add     ecx, eax                                ; 1494 _ 01. C1
        mov     eax, dword [ebp-10H]                    ; 1496 _ 8B. 45, F0
        mov     dl, byte [ecx+eax]                      ; 1499 _ 8A. 14 01
        mov     byte [ebp-15H], dl                      ; 149C _ 88. 55, EB
        movsx   eax, byte [ebp-15H]                     ; 149F _ 0F BE. 45, EB
        cmp     eax, 64                                 ; 14A3 _ 83. F8, 40
; Note: Immediate operand could be made smaller by sign extension
        jne     ?_048                                   ; 14A6 _ 0F 85, 00000009
        mov     byte [ebp-15H], 0                       ; 14AC _ C6. 45, EB, 00
; Note: Immediate operand could be made smaller by sign extension
        jmp     ?_053                                   ; 14B0 _ E9, 0000003A

?_048:  movsx   eax, byte [ebp-15H]                     ; 14B5 _ 0F BE. 45, EB
        cmp     eax, 36                                 ; 14B9 _ 83. F8, 24
; Note: Immediate operand could be made smaller by sign extension
        jne     ?_049                                   ; 14BC _ 0F 85, 00000009
        mov     byte [ebp-15H], 15                      ; 14C2 _ C6. 45, EB, 0F
; Note: Immediate operand could be made smaller by sign extension
        jmp     ?_052                                   ; 14C6 _ E9, 0000001F

?_049:  movsx   eax, byte [ebp-15H]                     ; 14CB _ 0F BE. 45, EB
        cmp     eax, 81                                 ; 14CF _ 83. F8, 51
; Note: Immediate operand could be made smaller by sign extension
        jne     ?_050                                   ; 14D2 _ 0F 85, 00000009
        mov     byte [ebp-15H], 8                       ; 14D8 _ C6. 45, EB, 08
; Note: Immediate operand could be made smaller by sign extension
        jmp     ?_051                                   ; 14DC _ E9, 00000004

?_050:  mov     byte [ebp-15H], 7                       ; 14E1 _ C6. 45, EB, 07
?_051:
; Note: Immediate operand could be made smaller by sign extension
        jmp     ?_052                                   ; 14E5 _ E9, 00000000

?_052:
; Note: Immediate operand could be made smaller by sign extension
        jmp     ?_053                                   ; 14EA _ E9, 00000000

?_053:  mov     al, byte [ebp-15H]                      ; 14EF _ 8A. 45, EB
        mov     ecx, dword [ebp+8H]                     ; 14F2 _ 8B. 4D, 08
        mov     edx, dword [ebp-14H]                    ; 14F5 _ 8B. 55, EC
        add     edx, 5                                  ; 14F8 _ 83. C2, 05
        imul    edx, dword [ebp+0CH]                    ; 14FB _ 0F AF. 55, 0C
        mov     esi, dword [ebp+0CH]                    ; 14FF _ 8B. 75, 0C
        sub     esi, 21                                 ; 1502 _ 83. EE, 15
        add     esi, dword [ebp-10H]                    ; 1505 _ 03. 75, F0
        add     edx, esi                                ; 1508 _ 01. F2
        mov     byte [ecx+edx], al                      ; 150A _ 88. 04 11
        mov     eax, dword [ebp-10H]                    ; 150D _ 8B. 45, F0
        add     eax, 1                                  ; 1510 _ 83. C0, 01
        mov     dword [ebp-10H], eax                    ; 1513 _ 89. 45, F0
        jmp     ?_047                                   ; 1516 _ E9, FFFFFF63

?_054:
; Note: Immediate operand could be made smaller by sign extension
        jmp     ?_055                                   ; 151B _ E9, 00000000

?_055:  mov     eax, dword [ebp-14H]                    ; 1520 _ 8B. 45, EC
        add     eax, 1                                  ; 1523 _ 83. C0, 01
        mov     dword [ebp-14H], eax                    ; 1526 _ 89. 45, EC
        jmp     ?_046                                   ; 1529 _ E9, FFFFFF3F

?_056:  add     esp, 76                                 ; 152E _ 83. C4, 4C
        pop     esi                                     ; 1531 _ 5E
        pop     edi                                     ; 1532 _ 5F
        pop     ebx                                     ; 1533 _ 5B
        pop     ebp                                     ; 1534 _ 5D
        ret                                             ; 1535 _ C3
; draw_window End of function

; Filling space: 0AH
; Filler type: Multi-byte NOP
;       db 66H, 2EH, 0FH, 1FH, 84H, 00H, 00H, 00H
;       db 00H, 00H

ALIGN   16

sheet_updown:; Function begin
        push    ebp                                     ; 1540 _ 55
        mov     ebp, esp                                ; 1541 _ 89. E5
        push    ebx                                     ; 1543 _ 53
        push    edi                                     ; 1544 _ 57
        push    esi                                     ; 1545 _ 56
        sub     esp, 60                                 ; 1546 _ 83. EC, 3C
        mov     eax, dword [ebp+10H]                    ; 1549 _ 8B. 45, 10
        mov     ecx, dword [ebp+0CH]                    ; 154C _ 8B. 4D, 0C
        mov     edx, dword [ebp+8H]                     ; 154F _ 8B. 55, 08
        mov     esi, dword [ebp+0CH]                    ; 1552 _ 8B. 75, 0C
        mov     esi, dword [esi+18H]                    ; 1555 _ 8B. 76, 18
        mov     dword [ebp-14H], esi                    ; 1558 _ 89. 75, EC
        mov     esi, dword [ebp+10H]                    ; 155B _ 8B. 75, 10
        mov     edi, dword [ebp+8H]                     ; 155E _ 8B. 7D, 08
        mov     edi, dword [edi+0CH]                    ; 1561 _ 8B. 7F, 0C
        add     edi, 1                                  ; 1564 _ 83. C7, 01
        cmp     esi, edi                                ; 1567 _ 39. FE
        mov     dword [ebp-18H], eax                    ; 1569 _ 89. 45, E8
        mov     dword [ebp-1CH], ecx                    ; 156C _ 89. 4D, E4
        mov     dword [ebp-20H], edx                    ; 156F _ 89. 55, E0
; Note: Immediate operand could be made smaller by sign extension
        jle     ?_057                                   ; 1572 _ 0F 8E, 0000000C
        mov     eax, dword [ebp+8H]                     ; 1578 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 157B _ 8B. 40, 0C
        add     eax, 1                                  ; 157E _ 83. C0, 01
        mov     dword [ebp+10H], eax                    ; 1581 _ 89. 45, 10
?_057:  cmp     dword [ebp+10H], -1                     ; 1584 _ 83. 7D, 10, FF
; Note: Immediate operand could be made smaller by sign extension
        jge     ?_058                                   ; 1588 _ 0F 8D, 00000007
        mov     dword [ebp+10H], -1                     ; 158E _ C7. 45, 10, FFFFFFFF
?_058:  mov     eax, dword [ebp+10H]                    ; 1595 _ 8B. 45, 10
        mov     ecx, dword [ebp+0CH]                    ; 1598 _ 8B. 4D, 0C
        mov     dword [ecx+18H], eax                    ; 159B _ 89. 41, 18
        mov     eax, dword [ebp-14H]                    ; 159E _ 8B. 45, EC
        cmp     eax, dword [ebp+10H]                    ; 15A1 _ 3B. 45, 10
        jle     ?_066                                   ; 15A4 _ 0F 8E, 00000164
        cmp     dword [ebp+10H], 0                      ; 15AA _ 83. 7D, 10, 00
        jl      ?_061                                   ; 15AE _ 0F 8C, 000000A2
        mov     eax, dword [ebp-14H]                    ; 15B4 _ 8B. 45, EC
        mov     dword [ebp-10H], eax                    ; 15B7 _ 89. 45, F0
?_059:  mov     eax, dword [ebp-10H]                    ; 15BA _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 15BD _ 3B. 45, 10
; Note: Immediate operand could be made smaller by sign extension
        jle     ?_060                                   ; 15C0 _ 0F 8E, 00000035
        mov     eax, dword [ebp+8H]                     ; 15C6 _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 15C9 _ 8B. 4D, F0
        sub     ecx, 1                                  ; 15CC _ 83. E9, 01
        mov     eax, dword [eax+ecx*4+10H]              ; 15CF _ 8B. 44 88, 10
        mov     ecx, dword [ebp+8H]                     ; 15D3 _ 8B. 4D, 08
        mov     edx, dword [ebp-10H]                    ; 15D6 _ 8B. 55, F0
        mov     dword [ecx+edx*4+10H], eax              ; 15D9 _ 89. 44 91, 10
        mov     eax, dword [ebp-10H]                    ; 15DD _ 8B. 45, F0
        mov     ecx, dword [ebp+8H]                     ; 15E0 _ 8B. 4D, 08
        mov     edx, dword [ebp-10H]                    ; 15E3 _ 8B. 55, F0
        mov     ecx, dword [ecx+edx*4+10H]              ; 15E6 _ 8B. 4C 91, 10
        mov     dword [ecx+18H], eax                    ; 15EA _ 89. 41, 18
        mov     eax, dword [ebp-10H]                    ; 15ED _ 8B. 45, F0
        add     eax, -1                                 ; 15F0 _ 83. C0, FF
        mov     dword [ebp-10H], eax                    ; 15F3 _ 89. 45, F0
; Note: Immediate operand could be made smaller by sign extension
        jmp     ?_059                                   ; 15F6 _ E9, FFFFFFBF

?_060:  mov     eax, dword [ebp+0CH]                    ; 15FB _ 8B. 45, 0C
        mov     ecx, dword [ebp+8H]                     ; 15FE _ 8B. 4D, 08
        mov     edx, dword [ebp+10H]                    ; 1601 _ 8B. 55, 10
        mov     dword [ecx+edx*4+10H], eax              ; 1604 _ 89. 44 91, 10
        mov     eax, dword [ebp+8H]                     ; 1608 _ 8B. 45, 08
        mov     ecx, dword [ebp+0CH]                    ; 160B _ 8B. 4D, 0C
        mov     ecx, dword [ecx+0CH]                    ; 160E _ 8B. 49, 0C
        mov     edx, dword [ebp+0CH]                    ; 1611 _ 8B. 55, 0C
        mov     edx, dword [edx+10H]                    ; 1614 _ 8B. 52, 10
        mov     esi, dword [ebp+0CH]                    ; 1617 _ 8B. 75, 0C
        mov     esi, dword [esi+0CH]                    ; 161A _ 8B. 76, 0C
        mov     edi, dword [ebp+0CH]                    ; 161D _ 8B. 7D, 0C
        add     esi, dword [edi+4H]                     ; 1620 _ 03. 77, 04
        mov     edi, dword [ebp+0CH]                    ; 1623 _ 8B. 7D, 0C
        mov     edi, dword [edi+10H]                    ; 1626 _ 8B. 7F, 10
        mov     ebx, dword [ebp+0CH]                    ; 1629 _ 8B. 5D, 0C
        add     edi, dword [ebx+8H]                     ; 162C _ 03. 7B, 08
        mov     ebx, dword [ebp+10H]                    ; 162F _ 8B. 5D, 10
        add     ebx, 1                                  ; 1632 _ 83. C3, 01
        mov     dword [esp], eax                        ; 1635 _ 89. 04 24
        mov     dword [esp+4H], ecx                     ; 1638 _ 89. 4C 24, 04
        mov     dword [esp+8H], edx                     ; 163C _ 89. 54 24, 08
        mov     dword [esp+0CH], esi                    ; 1640 _ 89. 74 24, 0C
        mov     dword [esp+10H], edi                    ; 1644 _ 89. 7C 24, 10
        mov     dword [esp+14H], ebx                    ; 1648 _ 89. 5C 24, 14
        call    sheet_refreshsub                        ; 164C _ E8, 0000108F
        jmp     ?_065                                   ; 1651 _ E9, 000000B3

?_061:  mov     eax, dword [ebp+8H]                     ; 1656 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 1659 _ 8B. 40, 0C
        cmp     eax, dword [ebp-14H]                    ; 165C _ 3B. 45, EC
; Note: Immediate operand could be made smaller by sign extension
        jle     ?_064                                   ; 165F _ 0F 8E, 0000004C
        mov     eax, dword [ebp-14H]                    ; 1665 _ 8B. 45, EC
        mov     dword [ebp-10H], eax                    ; 1668 _ 89. 45, F0
?_062:  mov     eax, dword [ebp-10H]                    ; 166B _ 8B. 45, F0
        mov     ecx, dword [ebp+8H]                     ; 166E _ 8B. 4D, 08
        cmp     eax, dword [ecx+0CH]                    ; 1671 _ 3B. 41, 0C
; Note: Immediate operand could be made smaller by sign extension
        jge     ?_063                                   ; 1674 _ 0F 8D, 00000032
        mov     eax, dword [ebp+8H]                     ; 167A _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 167D _ 8B. 4D, F0
        mov     eax, dword [eax+ecx*4+14H]              ; 1680 _ 8B. 44 88, 14
        mov     ecx, dword [ebp+8H]                     ; 1684 _ 8B. 4D, 08
        mov     edx, dword [ebp-10H]                    ; 1687 _ 8B. 55, F0
        mov     dword [ecx+edx*4+10H], eax              ; 168A _ 89. 44 91, 10
        mov     eax, dword [ebp-10H]                    ; 168E _ 8B. 45, F0
        mov     ecx, dword [ebp+8H]                     ; 1691 _ 8B. 4D, 08
        mov     edx, dword [ebp-10H]                    ; 1694 _ 8B. 55, F0
        mov     ecx, dword [ecx+edx*4+10H]              ; 1697 _ 8B. 4C 91, 10
        mov     dword [ecx+18H], eax                    ; 169B _ 89. 41, 18
        mov     eax, dword [ebp-10H]                    ; 169E _ 8B. 45, F0
        add     eax, 1                                  ; 16A1 _ 83. C0, 01
        mov     dword [ebp-10H], eax                    ; 16A4 _ 89. 45, F0
; Note: Immediate operand could be made smaller by sign extension
        jmp     ?_062                                   ; 16A7 _ E9, FFFFFFBF

?_063:
; Note: Immediate operand could be made smaller by sign extension
        jmp     ?_064                                   ; 16AC _ E9, 00000000

?_064:  xor     eax, eax                                ; 16B1 _ 31. C0
        mov     ecx, dword [ebp+8H]                     ; 16B3 _ 8B. 4D, 08
        mov     edx, dword [ecx+0CH]                    ; 16B6 _ 8B. 51, 0C
        add     edx, -1                                 ; 16B9 _ 83. C2, FF
        mov     dword [ecx+0CH], edx                    ; 16BC _ 89. 51, 0C
        mov     ecx, dword [ebp+8H]                     ; 16BF _ 8B. 4D, 08
        mov     edx, dword [ebp+0CH]                    ; 16C2 _ 8B. 55, 0C
        mov     edx, dword [edx+0CH]                    ; 16C5 _ 8B. 52, 0C
        mov     esi, dword [ebp+0CH]                    ; 16C8 _ 8B. 75, 0C
        mov     esi, dword [esi+10H]                    ; 16CB _ 8B. 76, 10
        mov     edi, dword [ebp+0CH]                    ; 16CE _ 8B. 7D, 0C
        mov     edi, dword [edi+0CH]                    ; 16D1 _ 8B. 7F, 0C
        mov     ebx, dword [ebp+0CH]                    ; 16D4 _ 8B. 5D, 0C
        add     edi, dword [ebx+4H]                     ; 16D7 _ 03. 7B, 04
        mov     ebx, dword [ebp+0CH]                    ; 16DA _ 8B. 5D, 0C
        mov     ebx, dword [ebx+10H]                    ; 16DD _ 8B. 5B, 10
        mov     dword [ebp-24H], eax                    ; 16E0 _ 89. 45, DC
        mov     eax, dword [ebp+0CH]                    ; 16E3 _ 8B. 45, 0C
        add     ebx, dword [eax+8H]                     ; 16E6 _ 03. 58, 08
        mov     dword [esp], ecx                        ; 16E9 _ 89. 0C 24
        mov     dword [esp+4H], edx                     ; 16EC _ 89. 54 24, 04
        mov     dword [esp+8H], esi                     ; 16F0 _ 89. 74 24, 08
        mov     dword [esp+0CH], edi                    ; 16F4 _ 89. 7C 24, 0C
        mov     dword [esp+10H], ebx                    ; 16F8 _ 89. 5C 24, 10
        mov     dword [esp+14H], 0                      ; 16FC _ C7. 44 24, 14, 00000000
        call    sheet_refreshsub                        ; 1704 _ E8, 00000FD7
?_065:  jmp     ?_074                                   ; 1709 _ E9, 0000011A

?_066:  mov     eax, dword [ebp-14H]                    ; 170E _ 8B. 45, EC
        cmp     eax, dword [ebp+10H]                    ; 1711 _ 3B. 45, 10
        jge     ?_073                                   ; 1714 _ 0F 8D, 00000109
        cmp     dword [ebp-14H], 0                      ; 171A _ 83. 7D, EC, 00
; Note: Immediate operand could be made smaller by sign extension
        jl      ?_069                                   ; 171E _ 0F 8C, 00000056
        mov     eax, dword [ebp-14H]                    ; 1724 _ 8B. 45, EC
        mov     dword [ebp-10H], eax                    ; 1727 _ 89. 45, F0
?_067:  mov     eax, dword [ebp-10H]                    ; 172A _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 172D _ 3B. 45, 10
; Note: Immediate operand could be made smaller by sign extension
        jge     ?_068                                   ; 1730 _ 0F 8D, 00000032
        mov     eax, dword [ebp+8H]                     ; 1736 _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 1739 _ 8B. 4D, F0
        mov     eax, dword [eax+ecx*4+14H]              ; 173C _ 8B. 44 88, 14
        mov     ecx, dword [ebp+8H]                     ; 1740 _ 8B. 4D, 08
        mov     edx, dword [ebp-10H]                    ; 1743 _ 8B. 55, F0
        mov     dword [ecx+edx*4+10H], eax              ; 1746 _ 89. 44 91, 10
        mov     eax, dword [ebp-10H]                    ; 174A _ 8B. 45, F0
        mov     ecx, dword [ebp+8H]                     ; 174D _ 8B. 4D, 08
        mov     edx, dword [ebp-10H]                    ; 1750 _ 8B. 55, F0
        mov     ecx, dword [ecx+edx*4+10H]              ; 1753 _ 8B. 4C 91, 10
        mov     dword [ecx+18H], eax                    ; 1757 _ 89. 41, 18
        mov     eax, dword [ebp-10H]                    ; 175A _ 8B. 45, F0
        add     eax, 1                                  ; 175D _ 83. C0, 01
        mov     dword [ebp-10H], eax                    ; 1760 _ 89. 45, F0
; Note: Immediate operand could be made smaller by sign extension
        jmp     ?_067                                   ; 1763 _ E9, FFFFFFC2

?_068:  mov     eax, dword [ebp+0CH]                    ; 1768 _ 8B. 45, 0C
        mov     ecx, dword [ebp+8H]                     ; 176B _ 8B. 4D, 08
        mov     edx, dword [ebp+10H]                    ; 176E _ 8B. 55, 10
        mov     dword [ecx+edx*4+10H], eax              ; 1771 _ 89. 44 91, 10
; Note: Immediate operand could be made smaller by sign extension
        jmp     ?_072                                   ; 1775 _ E9, 00000063

?_069:  mov     eax, dword [ebp+8H]                     ; 177A _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 177D _ 8B. 40, 0C
        mov     dword [ebp-10H], eax                    ; 1780 _ 89. 45, F0
?_070:  mov     eax, dword [ebp-10H]                    ; 1783 _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 1786 _ 3B. 45, 10
; Note: Immediate operand could be made smaller by sign extension
        jl      ?_071                                   ; 1789 _ 0F 8C, 00000035
        mov     eax, dword [ebp+8H]                     ; 178F _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 1792 _ 8B. 4D, F0
        mov     eax, dword [eax+ecx*4+10H]              ; 1795 _ 8B. 44 88, 10
        mov     ecx, dword [ebp+8H]                     ; 1799 _ 8B. 4D, 08
        mov     edx, dword [ebp-10H]                    ; 179C _ 8B. 55, F0
        mov     dword [ecx+edx*4+14H], eax              ; 179F _ 89. 44 91, 14
        mov     eax, dword [ebp-10H]                    ; 17A3 _ 8B. 45, F0
        add     eax, 1                                  ; 17A6 _ 83. C0, 01
        mov     ecx, dword [ebp+8H]                     ; 17A9 _ 8B. 4D, 08
        mov     edx, dword [ebp-10H]                    ; 17AC _ 8B. 55, F0
        mov     ecx, dword [ecx+edx*4+14H]              ; 17AF _ 8B. 4C 91, 14
        mov     dword [ecx+18H], eax                    ; 17B3 _ 89. 41, 18
        mov     eax, dword [ebp-10H]                    ; 17B6 _ 8B. 45, F0
        add     eax, -1                                 ; 17B9 _ 83. C0, FF
        mov     dword [ebp-10H], eax                    ; 17BC _ 89. 45, F0
; Note: Immediate operand could be made smaller by sign extension
        jmp     ?_070                                   ; 17BF _ E9, FFFFFFBF

?_071:  mov     eax, dword [ebp+0CH]                    ; 17C4 _ 8B. 45, 0C
        mov     ecx, dword [ebp+8H]                     ; 17C7 _ 8B. 4D, 08
        mov     edx, dword [ebp+10H]                    ; 17CA _ 8B. 55, 10
        mov     dword [ecx+edx*4+10H], eax              ; 17CD _ 89. 44 91, 10
        mov     eax, dword [ebp+8H]                     ; 17D1 _ 8B. 45, 08
        mov     ecx, dword [eax+0CH]                    ; 17D4 _ 8B. 48, 0C
        add     ecx, 1                                  ; 17D7 _ 83. C1, 01
        mov     dword [eax+0CH], ecx                    ; 17DA _ 89. 48, 0C
?_072:  mov     eax, dword [ebp+8H]                     ; 17DD _ 8B. 45, 08
        mov     ecx, dword [ebp+0CH]                    ; 17E0 _ 8B. 4D, 0C
        mov     ecx, dword [ecx+0CH]                    ; 17E3 _ 8B. 49, 0C
        mov     edx, dword [ebp+0CH]                    ; 17E6 _ 8B. 55, 0C
        mov     edx, dword [edx+10H]                    ; 17E9 _ 8B. 52, 10
        mov     esi, dword [ebp+0CH]                    ; 17EC _ 8B. 75, 0C
        mov     esi, dword [esi+0CH]                    ; 17EF _ 8B. 76, 0C
        mov     edi, dword [ebp+0CH]                    ; 17F2 _ 8B. 7D, 0C
        add     esi, dword [edi+4H]                     ; 17F5 _ 03. 77, 04
        mov     edi, dword [ebp+0CH]                    ; 17F8 _ 8B. 7D, 0C
        mov     edi, dword [edi+10H]                    ; 17FB _ 8B. 7F, 10
        mov     ebx, dword [ebp+0CH]                    ; 17FE _ 8B. 5D, 0C
        add     edi, dword [ebx+8H]                     ; 1801 _ 03. 7B, 08
        mov     ebx, dword [ebp+10H]                    ; 1804 _ 8B. 5D, 10
        mov     dword [esp], eax                        ; 1807 _ 89. 04 24
        mov     dword [esp+4H], ecx                     ; 180A _ 89. 4C 24, 04
        mov     dword [esp+8H], edx                     ; 180E _ 89. 54 24, 08
        mov     dword [esp+0CH], esi                    ; 1812 _ 89. 74 24, 0C
        mov     dword [esp+10H], edi                    ; 1816 _ 89. 7C 24, 10
        mov     dword [esp+14H], ebx                    ; 181A _ 89. 5C 24, 14
        call    sheet_refreshsub                        ; 181E _ E8, 00000EBD
?_073:
; Note: Immediate operand could be made smaller by sign extension
        jmp     ?_074                                   ; 1823 _ E9, 00000000

?_074:  add     esp, 60                                 ; 1828 _ 83. C4, 3C
        pop     esi                                     ; 182B _ 5E
        pop     edi                                     ; 182C _ 5F
        pop     ebx                                     ; 182D _ 5B
        pop     ebp                                     ; 182E _ 5D
        ret                                             ; 182F _ C3
; sheet_updown End of function

sheet_refresh:; Function begin
        push    ebp                                     ; 1830 _ 55
        mov     ebp, esp                                ; 1831 _ 89. E5
        push    ebx                                     ; 1833 _ 53
        push    edi                                     ; 1834 _ 57
        push    esi                                     ; 1835 _ 56
        sub     esp, 60                                 ; 1836 _ 83. EC, 3C
        mov     eax, dword [ebp+1CH]                    ; 1839 _ 8B. 45, 1C
        mov     ecx, dword [ebp+18H]                    ; 183C _ 8B. 4D, 18
        mov     edx, dword [ebp+14H]                    ; 183F _ 8B. 55, 14
        mov     esi, dword [ebp+10H]                    ; 1842 _ 8B. 75, 10
        mov     edi, dword [ebp+0CH]                    ; 1845 _ 8B. 7D, 0C
        mov     ebx, dword [ebp+8H]                     ; 1848 _ 8B. 5D, 08
        mov     dword [ebp-10H], eax                    ; 184B _ 89. 45, F0
        mov     eax, dword [ebp+0CH]                    ; 184E _ 8B. 45, 0C
        cmp     dword [eax+18H], 0                      ; 1851 _ 83. 78, 18, 00
        mov     dword [ebp-14H], ecx                    ; 1855 _ 89. 4D, EC
        mov     dword [ebp-18H], edx                    ; 1858 _ 89. 55, E8
        mov     dword [ebp-1CH], esi                    ; 185B _ 89. 75, E4
        mov     dword [ebp-20H], edi                    ; 185E _ 89. 7D, E0
        mov     dword [ebp-24H], ebx                    ; 1861 _ 89. 5D, DC
; Note: Immediate operand could be made smaller by sign extension
        jl      ?_075                                   ; 1864 _ 0F 8C, 00000049
        mov     eax, dword [ebp+8H]                     ; 186A _ 8B. 45, 08
        mov     ecx, dword [ebp+0CH]                    ; 186D _ 8B. 4D, 0C
        mov     ecx, dword [ecx+0CH]                    ; 1870 _ 8B. 49, 0C
        add     ecx, dword [ebp+10H]                    ; 1873 _ 03. 4D, 10
        mov     edx, dword [ebp+0CH]                    ; 1876 _ 8B. 55, 0C
        mov     edx, dword [edx+10H]                    ; 1879 _ 8B. 52, 10
        add     edx, dword [ebp+14H]                    ; 187C _ 03. 55, 14
        mov     esi, dword [ebp+0CH]                    ; 187F _ 8B. 75, 0C
        mov     esi, dword [esi+0CH]                    ; 1882 _ 8B. 76, 0C
        add     esi, dword [ebp+18H]                    ; 1885 _ 03. 75, 18
        mov     edi, dword [ebp+0CH]                    ; 1888 _ 8B. 7D, 0C
        mov     edi, dword [edi+10H]                    ; 188B _ 8B. 7F, 10
        add     edi, dword [ebp+1CH]                    ; 188E _ 03. 7D, 1C
        mov     ebx, dword [ebp+0CH]                    ; 1891 _ 8B. 5D, 0C
        mov     ebx, dword [ebx+18H]                    ; 1894 _ 8B. 5B, 18
        mov     dword [esp], eax                        ; 1897 _ 89. 04 24
        mov     dword [esp+4H], ecx                     ; 189A _ 89. 4C 24, 04
        mov     dword [esp+8H], edx                     ; 189E _ 89. 54 24, 08
        mov     dword [esp+0CH], esi                    ; 18A2 _ 89. 74 24, 0C
        mov     dword [esp+10H], edi                    ; 18A6 _ 89. 7C 24, 10
        mov     dword [esp+14H], ebx                    ; 18AA _ 89. 5C 24, 14
        call    sheet_refreshsub                        ; 18AE _ E8, 00000E2D
?_075:  xor     eax, eax                                ; 18B3 _ 31. C0
        add     esp, 60                                 ; 18B5 _ 83. C4, 3C
        pop     esi                                     ; 18B8 _ 5E
        pop     edi                                     ; 18B9 _ 5F
        pop     ebx                                     ; 18BA _ 5B
        pop     ebp                                     ; 18BB _ 5D
        ret                                             ; 18BC _ C3
; sheet_refresh End of function

; Filling space: 3H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 00H

ALIGN   8

intToHexStr:; Function begin
        push    ebp                                     ; 18C0 _ 55
        mov     ebp, esp                                ; 18C1 _ 89. E5
        sub     esp, 20                                 ; 18C3 _ 83. EC, 14
        mov     eax, dword [ebp+8H]                     ; 18C6 _ 8B. 45, 08
        mov     byte [intToHexStr.str], 48              ; 18C9 _ C6. 05, 00000148(d), 30
        mov     byte [?_150], 88                        ; 18D0 _ C6. 05, 00000149(d), 58
        mov     byte [?_151], 0                         ; 18D7 _ C6. 05, 00000152(d), 00
        mov     dword [ebp-4H], 2                       ; 18DE _ C7. 45, FC, 00000002
        mov     dword [ebp-10H], eax                    ; 18E5 _ 89. 45, F0
?_076:  cmp     dword [ebp-4H], 10                      ; 18E8 _ 83. 7D, FC, 0A
; Note: Immediate operand could be made smaller by sign extension
        jge     ?_077                                   ; 18EC _ 0F 8D, 00000019
        mov     eax, dword [ebp-4H]                     ; 18F2 _ 8B. 45, FC
; Note: SIB byte unnecessary here
        mov     byte [intToHexStr.str+eax], 48          ; 18F5 _ C6. 04 05, 00000148(d), 30
        mov     eax, dword [ebp-4H]                     ; 18FD _ 8B. 45, FC
        add     eax, 1                                  ; 1900 _ 83. C0, 01
        mov     dword [ebp-4H], eax                     ; 1903 _ 89. 45, FC
; Note: Immediate operand could be made smaller by sign extension
        jmp     ?_076                                   ; 1906 _ E9, FFFFFFDD

?_077:  mov     dword [ebp-8H], 9                       ; 190B _ C7. 45, F8, 00000009
?_078:  xor     eax, eax                                ; 1912 _ 31. C0
        mov     cl, al                                  ; 1914 _ 88. C1
        cmp     dword [ebp-8H], 1                       ; 1916 _ 83. 7D, F8, 01
        mov     byte [ebp-11H], cl                      ; 191A _ 88. 4D, EF
; Note: Immediate operand could be made smaller by sign extension
        jle     ?_079                                   ; 191D _ 0F 8E, 0000000A
        cmp     dword [ebp+8H], 0                       ; 1923 _ 83. 7D, 08, 00
        seta    al                                      ; 1927 _ 0F 97. C0
        mov     byte [ebp-11H], al                      ; 192A _ 88. 45, EF
?_079:  mov     al, byte [ebp-11H]                      ; 192D _ 8A. 45, EF
        test    al, 01H                                 ; 1930 _ A8, 01
; Note: Immediate operand could be made smaller by sign extension
        jne     ?_080                                   ; 1932 _ 0F 85, 00000005
; Note: Immediate operand could be made smaller by sign extension
        jmp     ?_083                                   ; 1938 _ E9, 00000056

?_080:  mov     eax, dword [ebp+8H]                     ; 193D _ 8B. 45, 08
        and     eax, 0FH                                ; 1940 _ 83. E0, 0F
        mov     dword [ebp-0CH], eax                    ; 1943 _ 89. 45, F4
        mov     eax, dword [ebp+8H]                     ; 1946 _ 8B. 45, 08
        shr     eax, 4                                  ; 1949 _ C1. E8, 04
        mov     dword [ebp+8H], eax                     ; 194C _ 89. 45, 08
        cmp     dword [ebp-0CH], 10                     ; 194F _ 83. 7D, F4, 0A
; Note: Immediate operand could be made smaller by sign extension
        jl      ?_081                                   ; 1953 _ 0F 8C, 0000001A
        mov     eax, dword [ebp-0CH]                    ; 1959 _ 8B. 45, F4
        add     eax, 65                                 ; 195C _ 83. C0, 41
        sub     eax, 10                                 ; 195F _ 83. E8, 0A
        mov     cl, al                                  ; 1962 _ 88. C1
        mov     eax, dword [ebp-8H]                     ; 1964 _ 8B. 45, F8
; Note: SIB byte unnecessary here
        mov     byte [intToHexStr.str+eax], cl          ; 1967 _ 88. 0C 05, 00000148(d)
; Note: Immediate operand could be made smaller by sign extension
        jmp     ?_082                                   ; 196E _ E9, 00000012

?_081:  mov     eax, dword [ebp-0CH]                    ; 1973 _ 8B. 45, F4
        add     eax, 48                                 ; 1976 _ 83. C0, 30
        mov     cl, al                                  ; 1979 _ 88. C1
        mov     eax, dword [ebp-8H]                     ; 197B _ 8B. 45, F8
; Note: SIB byte unnecessary here
        mov     byte [intToHexStr.str+eax], cl          ; 197E _ 88. 0C 05, 00000148(d)
?_082:  mov     eax, dword [ebp-8H]                     ; 1985 _ 8B. 45, F8
        add     eax, -1                                 ; 1988 _ 83. C0, FF
        mov     dword [ebp-8H], eax                     ; 198B _ 89. 45, F8
        jmp     ?_078                                   ; 198E _ E9, FFFFFF7F

?_083:  lea     eax, [intToHexStr.str]                  ; 1993 _ 8D. 05, 00000148(d)
        add     esp, 20                                 ; 1999 _ 83. C4, 14
        pop     ebp                                     ; 199C _ 5D
        ret                                             ; 199D _ C3
; intToHexStr End of function

; Filling space: 2H
; Filler type: NOP with prefixes
;       db 66H, 90H

ALIGN   8

boxfill8:; Function begin
        push    ebp                                     ; 19A0 _ 55
        mov     ebp, esp                                ; 19A1 _ 89. E5
        push    ebx                                     ; 19A3 _ 53
        push    edi                                     ; 19A4 _ 57
        push    esi                                     ; 19A5 _ 56
        sub     esp, 36                                 ; 19A6 _ 83. EC, 24
        mov     eax, dword [ebp+20H]                    ; 19A9 _ 8B. 45, 20
        mov     ecx, dword [ebp+1CH]                    ; 19AC _ 8B. 4D, 1C
        mov     edx, dword [ebp+18H]                    ; 19AF _ 8B. 55, 18
        mov     esi, dword [ebp+14H]                    ; 19B2 _ 8B. 75, 14
        mov     bl, byte [ebp+10H]                      ; 19B5 _ 8A. 5D, 10
        mov     edi, dword [ebp+0CH]                    ; 19B8 _ 8B. 7D, 0C
        mov     dword [ebp-18H], eax                    ; 19BB _ 89. 45, E8
        mov     eax, dword [ebp+8H]                     ; 19BE _ 8B. 45, 08
        mov     dword [ebp-1CH], eax                    ; 19C1 _ 89. 45, E4
        mov     eax, dword [ebp+18H]                    ; 19C4 _ 8B. 45, 18
        mov     dword [ebp-14H], eax                    ; 19C7 _ 89. 45, EC
        mov     dword [ebp-20H], ecx                    ; 19CA _ 89. 4D, E0
        mov     dword [ebp-24H], edx                    ; 19CD _ 89. 55, DC
        mov     dword [ebp-28H], esi                    ; 19D0 _ 89. 75, D8
        mov     byte [ebp-29H], bl                      ; 19D3 _ 88. 5D, D7
        mov     dword [ebp-30H], edi                    ; 19D6 _ 89. 7D, D0
?_084:  mov     eax, dword [ebp-14H]                    ; 19D9 _ 8B. 45, EC
        cmp     eax, dword [ebp+20H]                    ; 19DC _ 3B. 45, 20
; Note: Immediate operand could be made smaller by sign extension
        jg      ?_088                                   ; 19DF _ 0F 8F, 00000046
        mov     eax, dword [ebp+14H]                    ; 19E5 _ 8B. 45, 14
        mov     dword [ebp-10H], eax                    ; 19E8 _ 89. 45, F0
?_085:  mov     eax, dword [ebp-10H]                    ; 19EB _ 8B. 45, F0
        cmp     eax, dword [ebp+1CH]                    ; 19EE _ 3B. 45, 1C
; Note: Immediate operand could be made smaller by sign extension
        jg      ?_086                                   ; 19F1 _ 0F 8F, 00000021
        mov     al, byte [ebp+10H]                      ; 19F7 _ 8A. 45, 10
        mov     ecx, dword [ebp+8H]                     ; 19FA _ 8B. 4D, 08
        mov     edx, dword [ebp-14H]                    ; 19FD _ 8B. 55, EC
        imul    edx, dword [ebp+0CH]                    ; 1A00 _ 0F AF. 55, 0C
        add     edx, dword [ebp-10H]                    ; 1A04 _ 03. 55, F0
        mov     byte [ecx+edx], al                      ; 1A07 _ 88. 04 11
        mov     eax, dword [ebp-10H]                    ; 1A0A _ 8B. 45, F0
        add     eax, 1                                  ; 1A0D _ 83. C0, 01
        mov     dword [ebp-10H], eax                    ; 1A10 _ 89. 45, F0
; Note: Immediate operand could be made smaller by sign extension
        jmp     ?_085                                   ; 1A13 _ E9, FFFFFFD3

?_086:
; Note: Immediate operand could be made smaller by sign extension
        jmp     ?_087                                   ; 1A18 _ E9, 00000000

?_087:  mov     eax, dword [ebp-14H]                    ; 1A1D _ 8B. 45, EC
        add     eax, 1                                  ; 1A20 _ 83. C0, 01
        mov     dword [ebp-14H], eax                    ; 1A23 _ 89. 45, EC
; Note: Immediate operand could be made smaller by sign extension
        jmp     ?_084                                   ; 1A26 _ E9, FFFFFFAE

?_088:  add     esp, 36                                 ; 1A2B _ 83. C4, 24
        pop     esi                                     ; 1A2E _ 5E
        pop     edi                                     ; 1A2F _ 5F
        pop     ebx                                     ; 1A30 _ 5B
        pop     ebp                                     ; 1A31 _ 5D
        ret                                             ; 1A32 _ C3
; boxfill8 End of function

; Filling space: 0DH
; Filler type: Multi-byte NOP
;       db 66H, 2EH, 0FH, 1FH, 84H, 00H, 00H, 00H
;       db 00H, 00H, 0FH, 1FH, 00H

ALIGN   16

showString:; Function begin
        push    ebp                                     ; 1A40 _ 55
        mov     ebp, esp                                ; 1A41 _ 89. E5
        push    ebx                                     ; 1A43 _ 53
        push    edi                                     ; 1A44 _ 57
        push    esi                                     ; 1A45 _ 56
        sub     esp, 60                                 ; 1A46 _ 83. EC, 3C
        mov     eax, dword [ebp+1CH]                    ; 1A49 _ 8B. 45, 1C
        mov     cl, byte [ebp+18H]                      ; 1A4C _ 8A. 4D, 18
        mov     edx, dword [ebp+14H]                    ; 1A4F _ 8B. 55, 14
        mov     esi, dword [ebp+10H]                    ; 1A52 _ 8B. 75, 10
        mov     edi, dword [ebp+0CH]                    ; 1A55 _ 8B. 7D, 0C
        mov     ebx, dword [ebp+8H]                     ; 1A58 _ 8B. 5D, 08
        mov     dword [ebp-10H], eax                    ; 1A5B _ 89. 45, F0
        mov     byte [ebp-11H], cl                      ; 1A5E _ 88. 4D, EF
        mov     dword [ebp-18H], edx                    ; 1A61 _ 89. 55, E8
        mov     dword [ebp-1CH], esi                    ; 1A64 _ 89. 75, E4
        mov     dword [ebp-20H], edi                    ; 1A67 _ 89. 7D, E0
        mov     dword [ebp-24H], ebx                    ; 1A6A _ 89. 5D, DC
?_089:  mov     eax, dword [ebp+1CH]                    ; 1A6D _ 8B. 45, 1C
        movzx   eax, byte [eax]                         ; 1A70 _ 0F B6. 00
        cmp     eax, 0                                  ; 1A73 _ 83. F8, 00
; Note: Immediate operand could be made smaller by sign extension
        je      ?_090                                   ; 1A76 _ 0F 84, 0000005C
        mov     eax, dword [ebp+8H]                     ; 1A7C _ 8B. 45, 08
        mov     ecx, dword [ebp+0CH]                    ; 1A7F _ 8B. 4D, 0C
        mov     edx, dword [ebp+10H]                    ; 1A82 _ 8B. 55, 10
        mov     esi, dword [ebp+14H]                    ; 1A85 _ 8B. 75, 14
        mov     bl, byte [ebp+18H]                      ; 1A88 _ 8A. 5D, 18
        mov     edi, dword [ebp+1CH]                    ; 1A8B _ 8B. 7D, 1C
        movzx   edi, byte [edi]                         ; 1A8E _ 0F B6. 3F
        shl     edi, 4                                  ; 1A91 _ C1. E7, 04
        mov     dword [ebp-28H], eax                    ; 1A94 _ 89. 45, D8
        lea     eax, [systemFont]                       ; 1A97 _ 8D. 05, 00000000(d)
        add     eax, edi                                ; 1A9D _ 01. F8
        mov     edi, dword [ebp-28H]                    ; 1A9F _ 8B. 7D, D8
        mov     dword [esp], edi                        ; 1AA2 _ 89. 3C 24
        mov     dword [esp+4H], ecx                     ; 1AA5 _ 89. 4C 24, 04
        mov     dword [esp+8H], edx                     ; 1AA9 _ 89. 54 24, 08
        mov     dword [esp+0CH], esi                    ; 1AAD _ 89. 74 24, 0C
        movsx   ecx, bl                                 ; 1AB1 _ 0F BE. CB
        mov     dword [esp+10H], ecx                    ; 1AB4 _ 89. 4C 24, 10
        mov     dword [esp+14H], eax                    ; 1AB8 _ 89. 44 24, 14
        call    showFont8                               ; 1ABC _ E8, 0000045F
        mov     eax, dword [ebp+10H]                    ; 1AC1 _ 8B. 45, 10
        add     eax, 8                                  ; 1AC4 _ 83. C0, 08
        mov     dword [ebp+10H], eax                    ; 1AC7 _ 89. 45, 10
        mov     eax, dword [ebp+1CH]                    ; 1ACA _ 8B. 45, 1C
        add     eax, 1                                  ; 1ACD _ 83. C0, 01
        mov     dword [ebp+1CH], eax                    ; 1AD0 _ 89. 45, 1C
; Note: Immediate operand could be made smaller by sign extension
        jmp     ?_089                                   ; 1AD3 _ E9, FFFFFF95

?_090:  add     esp, 60                                 ; 1AD8 _ 83. C4, 3C
        pop     esi                                     ; 1ADB _ 5E
        pop     edi                                     ; 1ADC _ 5F
        pop     ebx                                     ; 1ADD _ 5B
        pop     ebp                                     ; 1ADE _ 5D
        ret                                             ; 1ADF _ C3
; showString End of function

fifo8_status:; Function begin
        push    ebp                                     ; 1AE0 _ 55
        mov     ebp, esp                                ; 1AE1 _ 89. E5
        push    eax                                     ; 1AE3 _ 50
        mov     eax, dword [ebp+8H]                     ; 1AE4 _ 8B. 45, 08
        mov     ecx, dword [ebp+8H]                     ; 1AE7 _ 8B. 4D, 08
        mov     ecx, dword [ecx+0CH]                    ; 1AEA _ 8B. 49, 0C
        mov     edx, dword [ebp+8H]                     ; 1AED _ 8B. 55, 08
        sub     ecx, dword [edx+10H]                    ; 1AF0 _ 2B. 4A, 10
        mov     dword [ebp-4H], eax                     ; 1AF3 _ 89. 45, FC
        mov     eax, ecx                                ; 1AF6 _ 89. C8
        add     esp, 4                                  ; 1AF8 _ 83. C4, 04
        pop     ebp                                     ; 1AFB _ 5D
        ret                                             ; 1AFC _ C3
; fifo8_status End of function

; Filling space: 3H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 00H

ALIGN   8

fifo8_get:; Function begin
        push    ebp                                     ; 1B00 _ 55
        mov     ebp, esp                                ; 1B01 _ 89. E5
        sub     esp, 12                                 ; 1B03 _ 83. EC, 0C
        mov     eax, dword [ebp+8H]                     ; 1B06 _ 8B. 45, 08
        mov     ecx, dword [ebp+8H]                     ; 1B09 _ 8B. 4D, 08
        mov     ecx, dword [ecx+10H]                    ; 1B0C _ 8B. 49, 10
        mov     edx, dword [ebp+8H]                     ; 1B0F _ 8B. 55, 08
        cmp     ecx, dword [edx+0CH]                    ; 1B12 _ 3B. 4A, 0C
        mov     dword [ebp-0CH], eax                    ; 1B15 _ 89. 45, F4
; Note: Immediate operand could be made smaller by sign extension
        jne     ?_091                                   ; 1B18 _ 0F 85, 0000000C
        mov     dword [ebp-4H], -1                      ; 1B1E _ C7. 45, FC, FFFFFFFF
; Note: Immediate operand could be made smaller by sign extension
        jmp     ?_093                                   ; 1B25 _ E9, 0000004C

?_091:  mov     eax, dword [ebp+8H]                     ; 1B2A _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1B2D _ 8B. 00
        mov     ecx, dword [ebp+8H]                     ; 1B2F _ 8B. 4D, 08
        mov     ecx, dword [ecx+8H]                     ; 1B32 _ 8B. 49, 08
        movzx   eax, byte [eax+ecx]                     ; 1B35 _ 0F B6. 04 08
        mov     dword [ebp-8H], eax                     ; 1B39 _ 89. 45, F8
        mov     eax, dword [ebp+8H]                     ; 1B3C _ 8B. 45, 08
        mov     ecx, dword [eax+8H]                     ; 1B3F _ 8B. 48, 08
        add     ecx, 1                                  ; 1B42 _ 83. C1, 01
        mov     dword [eax+8H], ecx                     ; 1B45 _ 89. 48, 08
        mov     eax, dword [ebp+8H]                     ; 1B48 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 1B4B _ 8B. 40, 08
        mov     ecx, dword [ebp+8H]                     ; 1B4E _ 8B. 4D, 08
        cmp     eax, dword [ecx+0CH]                    ; 1B51 _ 3B. 41, 0C
; Note: Immediate operand could be made smaller by sign extension
        jne     ?_092                                   ; 1B54 _ 0F 85, 0000000A
        mov     eax, dword [ebp+8H]                     ; 1B5A _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 1B5D _ C7. 40, 08, 00000000
?_092:  mov     eax, dword [ebp+8H]                     ; 1B64 _ 8B. 45, 08
        mov     ecx, dword [eax+10H]                    ; 1B67 _ 8B. 48, 10
        add     ecx, 1                                  ; 1B6A _ 83. C1, 01
        mov     dword [eax+10H], ecx                    ; 1B6D _ 89. 48, 10
        mov     eax, dword [ebp-8H]                     ; 1B70 _ 8B. 45, F8
        mov     dword [ebp-4H], eax                     ; 1B73 _ 89. 45, FC
?_093:  mov     eax, dword [ebp-4H]                     ; 1B76 _ 8B. 45, FC
        add     esp, 12                                 ; 1B79 _ 83. C4, 0C
        pop     ebp                                     ; 1B7C _ 5D
        ret                                             ; 1B7D _ C3
; fifo8_get End of function

; Filling space: 2H
; Filler type: NOP with prefixes
;       db 66H, 90H

ALIGN   8

mouse_decode:; Function begin
        push    ebp                                     ; 1B80 _ 55
        mov     ebp, esp                                ; 1B81 _ 89. E5
        sub     esp, 12                                 ; 1B83 _ 83. EC, 0C
        mov     al, byte [ebp+0CH]                      ; 1B86 _ 8A. 45, 0C
        mov     ecx, dword [ebp+8H]                     ; 1B89 _ 8B. 4D, 08
        mov     edx, dword [ebp+8H]                     ; 1B8C _ 8B. 55, 08
        movzx   edx, byte [edx+3H]                      ; 1B8F _ 0F B6. 52, 03
        cmp     edx, 0                                  ; 1B93 _ 83. FA, 00
        mov     byte [ebp-5H], al                       ; 1B96 _ 88. 45, FB
        mov     dword [ebp-0CH], ecx                    ; 1B99 _ 89. 4D, F4
; Note: Immediate operand could be made smaller by sign extension
        jne     ?_095                                   ; 1B9C _ 0F 85, 00000022
        movzx   eax, byte [ebp+0CH]                     ; 1BA2 _ 0F B6. 45, 0C
        cmp     eax, 250                                ; 1BA6 _ 3D, 000000FA
; Note: Immediate operand could be made smaller by sign extension
        jne     ?_094                                   ; 1BAB _ 0F 85, 00000007
        mov     eax, dword [ebp+8H]                     ; 1BB1 _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 1BB4 _ C6. 40, 03, 01
?_094:  mov     dword [ebp-4H], 0                       ; 1BB8 _ C7. 45, FC, 00000000
        jmp     ?_102                                   ; 1BBF _ E9, 00000115

?_095:  mov     eax, dword [ebp+8H]                     ; 1BC4 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 1BC7 _ 0F B6. 40, 03
        cmp     eax, 1                                  ; 1BCB _ 83. F8, 01
; Note: Immediate operand could be made smaller by sign extension
        jne     ?_097                                   ; 1BCE _ 0F 85, 0000002D
        movzx   eax, byte [ebp+0CH]                     ; 1BD4 _ 0F B6. 45, 0C
        and     eax, 0C8H                               ; 1BD8 _ 25, 000000C8
        cmp     eax, 8                                  ; 1BDD _ 83. F8, 08
; Note: Immediate operand could be made smaller by sign extension
        jne     ?_096                                   ; 1BE0 _ 0F 85, 0000000F
        mov     al, byte [ebp+0CH]                      ; 1BE6 _ 8A. 45, 0C
        mov     ecx, dword [ebp+8H]                     ; 1BE9 _ 8B. 4D, 08
        mov     byte [ecx], al                          ; 1BEC _ 88. 01
        mov     ecx, dword [ebp+8H]                     ; 1BEE _ 8B. 4D, 08
        mov     byte [ecx+3H], 2                        ; 1BF1 _ C6. 41, 03, 02
?_096:  mov     dword [ebp-4H], 0                       ; 1BF5 _ C7. 45, FC, 00000000
        jmp     ?_102                                   ; 1BFC _ E9, 000000D8

?_097:  mov     eax, dword [ebp+8H]                     ; 1C01 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 1C04 _ 0F B6. 40, 03
        cmp     eax, 2                                  ; 1C08 _ 83. F8, 02
; Note: Immediate operand could be made smaller by sign extension
        jne     ?_098                                   ; 1C0B _ 0F 85, 0000001C
        mov     al, byte [ebp+0CH]                      ; 1C11 _ 8A. 45, 0C
        mov     ecx, dword [ebp+8H]                     ; 1C14 _ 8B. 4D, 08
        mov     byte [ecx+1H], al                       ; 1C17 _ 88. 41, 01
        mov     ecx, dword [ebp+8H]                     ; 1C1A _ 8B. 4D, 08
        mov     byte [ecx+3H], 3                        ; 1C1D _ C6. 41, 03, 03
        mov     dword [ebp-4H], 0                       ; 1C21 _ C7. 45, FC, 00000000
        jmp     ?_102                                   ; 1C28 _ E9, 000000AC

?_098:  mov     eax, dword [ebp+8H]                     ; 1C2D _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 1C30 _ 0F B6. 40, 03
        cmp     eax, 3                                  ; 1C34 _ 83. F8, 03
        jne     ?_101                                   ; 1C37 _ 0F 85, 00000095
        mov     al, byte [ebp+0CH]                      ; 1C3D _ 8A. 45, 0C
        mov     ecx, dword [ebp+8H]                     ; 1C40 _ 8B. 4D, 08
        mov     byte [ecx+2H], al                       ; 1C43 _ 88. 41, 02
        mov     ecx, dword [ebp+8H]                     ; 1C46 _ 8B. 4D, 08
        mov     byte [ecx+3H], 1                        ; 1C49 _ C6. 41, 03, 01
        mov     ecx, dword [ebp+8H]                     ; 1C4D _ 8B. 4D, 08
        movzx   ecx, byte [ecx]                         ; 1C50 _ 0F B6. 09
        and     ecx, 07H                                ; 1C53 _ 83. E1, 07
        mov     edx, dword [ebp+8H]                     ; 1C56 _ 8B. 55, 08
        mov     dword [edx+0CH], ecx                    ; 1C59 _ 89. 4A, 0C
        mov     ecx, dword [ebp+8H]                     ; 1C5C _ 8B. 4D, 08
        movzx   ecx, byte [ecx+1H]                      ; 1C5F _ 0F B6. 49, 01
        mov     edx, dword [ebp+8H]                     ; 1C63 _ 8B. 55, 08
        mov     dword [edx+4H], ecx                     ; 1C66 _ 89. 4A, 04
        mov     ecx, dword [ebp+8H]                     ; 1C69 _ 8B. 4D, 08
        movzx   ecx, byte [ecx+2H]                      ; 1C6C _ 0F B6. 49, 02
        mov     edx, dword [ebp+8H]                     ; 1C70 _ 8B. 55, 08
        mov     dword [edx+8H], ecx                     ; 1C73 _ 89. 4A, 08
        mov     ecx, dword [ebp+8H]                     ; 1C76 _ 8B. 4D, 08
        movzx   ecx, byte [ecx]                         ; 1C79 _ 0F B6. 09
        and     ecx, 10H                                ; 1C7C _ 83. E1, 10
        cmp     ecx, 0                                  ; 1C7F _ 83. F9, 00
; Note: Immediate operand could be made smaller by sign extension
        je      ?_099                                   ; 1C82 _ 0F 84, 0000000F
        mov     eax, dword [ebp+8H]                     ; 1C88 _ 8B. 45, 08
        mov     ecx, dword [eax+4H]                     ; 1C8B _ 8B. 48, 04
        or      ecx, 0FFFFFF00H                         ; 1C8E _ 81. C9, FFFFFF00
        mov     dword [eax+4H], ecx                     ; 1C94 _ 89. 48, 04
?_099:  mov     eax, dword [ebp+8H]                     ; 1C97 _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 1C9A _ 0F B6. 00
        and     eax, 20H                                ; 1C9D _ 83. E0, 20
        cmp     eax, 0                                  ; 1CA0 _ 83. F8, 00
; Note: Immediate operand could be made smaller by sign extension
        je      ?_100                                   ; 1CA3 _ 0F 84, 0000000F
        mov     eax, dword [ebp+8H]                     ; 1CA9 _ 8B. 45, 08
        mov     ecx, dword [eax+8H]                     ; 1CAC _ 8B. 48, 08
        or      ecx, 0FFFFFF00H                         ; 1CAF _ 81. C9, FFFFFF00
        mov     dword [eax+8H], ecx                     ; 1CB5 _ 89. 48, 08
?_100:  xor     eax, eax                                ; 1CB8 _ 31. C0
        mov     ecx, dword [ebp+8H]                     ; 1CBA _ 8B. 4D, 08
        sub     eax, dword [ecx+8H]                     ; 1CBD _ 2B. 41, 08
        mov     ecx, dword [ebp+8H]                     ; 1CC0 _ 8B. 4D, 08
        mov     dword [ecx+8H], eax                     ; 1CC3 _ 89. 41, 08
        mov     dword [ebp-4H], 1                       ; 1CC6 _ C7. 45, FC, 00000001
; Note: Immediate operand could be made smaller by sign extension
        jmp     ?_102                                   ; 1CCD _ E9, 00000007

?_101:  mov     dword [ebp-4H], -1                      ; 1CD2 _ C7. 45, FC, FFFFFFFF
?_102:  mov     eax, dword [ebp-4H]                     ; 1CD9 _ 8B. 45, FC
        add     esp, 12                                 ; 1CDC _ 83. C4, 0C
        pop     ebp                                     ; 1CDF _ 5D
        ret                                             ; 1CE0 _ C3
; mouse_decode End of function

; Filling space: 0FH
; Filler type: Multi-byte NOP
;       db 66H, 2EH, 0FH, 1FH, 84H, 00H, 00H, 00H
;       db 00H, 00H, 0FH, 1FH, 44H, 00H, 00H

ALIGN   16

charToHexVal:; Function begin
        push    ebp                                     ; 1CF0 _ 55
        mov     ebp, esp                                ; 1CF1 _ 89. E5
        push    eax                                     ; 1CF3 _ 50
        mov     al, byte [ebp+8H]                       ; 1CF4 _ 8A. 45, 08
        movzx   ecx, byte [ebp+8H]                      ; 1CF7 _ 0F B6. 4D, 08
        cmp     ecx, 10                                 ; 1CFB _ 83. F9, 0A
        mov     byte [ebp-2H], al                       ; 1CFE _ 88. 45, FE
; Note: Immediate operand could be made smaller by sign extension
        jl      ?_103                                   ; 1D01 _ 0F 8C, 00000014
        movzx   eax, byte [ebp+8H]                      ; 1D07 _ 0F B6. 45, 08
        add     eax, 65                                 ; 1D0B _ 83. C0, 41
        sub     eax, 10                                 ; 1D0E _ 83. E8, 0A
        mov     cl, al                                  ; 1D11 _ 88. C1
        mov     byte [ebp-1H], cl                       ; 1D13 _ 88. 4D, FF
; Note: Immediate operand could be made smaller by sign extension
        jmp     ?_104                                   ; 1D16 _ E9, 0000000C

?_103:  movzx   eax, byte [ebp+8H]                      ; 1D1B _ 0F B6. 45, 08
        add     eax, 48                                 ; 1D1F _ 83. C0, 30
        mov     cl, al                                  ; 1D22 _ 88. C1
        mov     byte [ebp-1H], cl                       ; 1D24 _ 88. 4D, FF
?_104:  movzx   eax, byte [ebp-1H]                      ; 1D27 _ 0F B6. 45, FF
        add     esp, 4                                  ; 1D2B _ 83. C4, 04
        pop     ebp                                     ; 1D2E _ 5D
        ret                                             ; 1D2F _ C3
; charToHexVal End of function

charToHexStr:; Function begin
        push    ebp                                     ; 1D30 _ 55
        mov     ebp, esp                                ; 1D31 _ 89. E5
        push    ebx                                     ; 1D33 _ 53
        sub     esp, 20                                 ; 1D34 _ 83. EC, 14
        mov     al, byte [ebp+8H]                       ; 1D37 _ 8A. 45, 08
        mov     dword [ebp-8H], 0                       ; 1D3A _ C7. 45, F8, 00000000
        movzx   ecx, byte [ebp+8H]                      ; 1D41 _ 0F B6. 4D, 08
        mov     byte [ebp-0AH], al                      ; 1D45 _ 88. 45, F6
        mov     eax, ecx                                ; 1D48 _ 89. C8
        cdq                                             ; 1D4A _ 99
        mov     ecx, 16                                 ; 1D4B _ B9, 00000010
        idiv    ecx                                     ; 1D50 _ F7. F9
        mov     bl, dl                                  ; 1D52 _ 88. D3
        mov     byte [ebp-9H], bl                       ; 1D54 _ 88. 5D, F7
        movzx   ecx, byte [ebp-9H]                      ; 1D57 _ 0F B6. 4D, F7
        mov     dword [esp], ecx                        ; 1D5B _ 89. 0C 24
        call    charToHexVal                            ; 1D5E _ E8, FFFFFF8D
        mov     byte [?_153], al                        ; 1D63 _ A2, 00000012(d)
        movzx   eax, byte [ebp+8H]                      ; 1D68 _ 0F B6. 45, 08
        cdq                                             ; 1D6C _ 99
        mov     ecx, 16                                 ; 1D6D _ B9, 00000010
        idiv    ecx                                     ; 1D72 _ F7. F9
        mov     bl, al                                  ; 1D74 _ 88. C3
        mov     byte [ebp+8H], bl                       ; 1D76 _ 88. 5D, 08
        movzx   eax, byte [ebp+8H]                      ; 1D79 _ 0F B6. 45, 08
        mov     dword [esp], eax                        ; 1D7D _ 89. 04 24
        call    charToHexVal                            ; 1D80 _ E8, FFFFFF6B
        mov     byte [?_152], al                        ; 1D85 _ A2, 00000011(d)
        lea     eax, [keyval]                           ; 1D8A _ 8D. 05, 0000000F(d)
        add     esp, 20                                 ; 1D90 _ 83. C4, 14
        pop     ebx                                     ; 1D93 _ 5B
        pop     ebp                                     ; 1D94 _ 5D
        ret                                             ; 1D95 _ C3
; charToHexStr End of function

; Filling space: 0AH
; Filler type: Multi-byte NOP
;       db 66H, 2EH, 0FH, 1FH, 84H, 00H, 00H, 00H
;       db 00H, 00H

ALIGN   16

set_palette:; Function begin
        push    ebp                                     ; 1DA0 _ 55
        mov     ebp, esp                                ; 1DA1 _ 89. E5
        sub     esp, 40                                 ; 1DA3 _ 83. EC, 28
        mov     eax, dword [ebp+10H]                    ; 1DA6 _ 8B. 45, 10
        mov     ecx, dword [ebp+0CH]                    ; 1DA9 _ 8B. 4D, 0C
        mov     edx, dword [ebp+8H]                     ; 1DAC _ 8B. 55, 08
        mov     dword [ebp-0CH], eax                    ; 1DAF _ 89. 45, F4
        mov     dword [ebp-10H], ecx                    ; 1DB2 _ 89. 4D, F0
        mov     dword [ebp-14H], edx                    ; 1DB5 _ 89. 55, EC
        call    io_load_eflags                          ; 1DB8 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-8H], eax                     ; 1DBD _ 89. 45, F8
        call    io_cli                                  ; 1DC0 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 1DC5 _ 8B. 45, 08
        mov     dword [esp], 968                        ; 1DC8 _ C7. 04 24, 000003C8
        mov     dword [esp+4H], eax                     ; 1DCF _ 89. 44 24, 04
        call    io_out8                                 ; 1DD3 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 1DD8 _ 8B. 45, 08
        mov     dword [ebp-4H], eax                     ; 1DDB _ 89. 45, FC
?_105:  mov     eax, dword [ebp-4H]                     ; 1DDE _ 8B. 45, FC
        cmp     eax, dword [ebp+0CH]                    ; 1DE1 _ 3B. 45, 0C
; Note: Immediate operand could be made smaller by sign extension
        jg      ?_106                                   ; 1DE4 _ 0F 8F, 00000073
        mov     eax, dword [ebp+10H]                    ; 1DEA _ 8B. 45, 10
        movzx   eax, byte [eax]                         ; 1DED _ 0F B6. 00
        cdq                                             ; 1DF0 _ 99
        mov     ecx, 4                                  ; 1DF1 _ B9, 00000004
        idiv    ecx                                     ; 1DF6 _ F7. F9
        mov     dword [esp], 969                        ; 1DF8 _ C7. 04 24, 000003C9
        mov     dword [esp+4H], eax                     ; 1DFF _ 89. 44 24, 04
        call    io_out8                                 ; 1E03 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 1E08 _ 8B. 45, 10
        movzx   eax, byte [eax+1H]                      ; 1E0B _ 0F B6. 40, 01
        cdq                                             ; 1E0F _ 99
        mov     ecx, 4                                  ; 1E10 _ B9, 00000004
        idiv    ecx                                     ; 1E15 _ F7. F9
        mov     dword [esp], 969                        ; 1E17 _ C7. 04 24, 000003C9
        mov     dword [esp+4H], eax                     ; 1E1E _ 89. 44 24, 04
        call    io_out8                                 ; 1E22 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 1E27 _ 8B. 45, 10
        movzx   eax, byte [eax+2H]                      ; 1E2A _ 0F B6. 40, 02
        cdq                                             ; 1E2E _ 99
        mov     ecx, 4                                  ; 1E2F _ B9, 00000004
        idiv    ecx                                     ; 1E34 _ F7. F9
        mov     dword [esp], 969                        ; 1E36 _ C7. 04 24, 000003C9
        mov     dword [esp+4H], eax                     ; 1E3D _ 89. 44 24, 04
        call    io_out8                                 ; 1E41 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 1E46 _ 8B. 45, 10
        add     eax, 3                                  ; 1E49 _ 83. C0, 03
        mov     dword [ebp+10H], eax                    ; 1E4C _ 89. 45, 10
        mov     eax, dword [ebp-4H]                     ; 1E4F _ 8B. 45, FC
        add     eax, 1                                  ; 1E52 _ 83. C0, 01
        mov     dword [ebp-4H], eax                     ; 1E55 _ 89. 45, FC
; Note: Immediate operand could be made smaller by sign extension
        jmp     ?_105                                   ; 1E58 _ E9, FFFFFF81

?_106:  mov     eax, dword [ebp-8H]                     ; 1E5D _ 8B. 45, F8
        mov     dword [esp], eax                        ; 1E60 _ 89. 04 24
        call    io_store_eflags                         ; 1E63 _ E8, FFFFFFFC(rel)
        add     esp, 40                                 ; 1E68 _ 83. C4, 28
        pop     ebp                                     ; 1E6B _ 5D
        ret                                             ; 1E6C _ C3
; set_palette End of function

; Filling space: 3H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 00H

ALIGN   8

putblock:; Function begin
        push    ebp                                     ; 1E70 _ 55
        mov     ebp, esp                                ; 1E71 _ 89. E5
        push    ebx                                     ; 1E73 _ 53
        push    edi                                     ; 1E74 _ 57
        push    esi                                     ; 1E75 _ 56
        sub     esp, 40                                 ; 1E76 _ 83. EC, 28
        mov     eax, dword [ebp+24H]                    ; 1E79 _ 8B. 45, 24
        mov     ecx, dword [ebp+20H]                    ; 1E7C _ 8B. 4D, 20
        mov     edx, dword [ebp+1CH]                    ; 1E7F _ 8B. 55, 1C
        mov     esi, dword [ebp+18H]                    ; 1E82 _ 8B. 75, 18
        mov     edi, dword [ebp+14H]                    ; 1E85 _ 8B. 7D, 14
        mov     ebx, dword [ebp+10H]                    ; 1E88 _ 8B. 5D, 10
        mov     dword [ebp-18H], eax                    ; 1E8B _ 89. 45, E8
        mov     eax, dword [ebp+0CH]                    ; 1E8E _ 8B. 45, 0C
        mov     dword [ebp-1CH], eax                    ; 1E91 _ 89. 45, E4
        mov     eax, dword [ebp+8H]                     ; 1E94 _ 8B. 45, 08
        mov     dword [ebp-14H], 0                      ; 1E97 _ C7. 45, EC, 00000000
        mov     dword [ebp-20H], ecx                    ; 1E9E _ 89. 4D, E0
        mov     dword [ebp-24H], edx                    ; 1EA1 _ 89. 55, DC
        mov     dword [ebp-28H], esi                    ; 1EA4 _ 89. 75, D8
        mov     dword [ebp-2CH], edi                    ; 1EA7 _ 89. 7D, D4
        mov     dword [ebp-30H], ebx                    ; 1EAA _ 89. 5D, D0
        mov     dword [ebp-34H], eax                    ; 1EAD _ 89. 45, CC
?_107:  mov     eax, dword [ebp-14H]                    ; 1EB0 _ 8B. 45, EC
        cmp     eax, dword [ebp+14H]                    ; 1EB3 _ 3B. 45, 14
; Note: Immediate operand could be made smaller by sign extension
        jge     ?_111                                   ; 1EB6 _ 0F 8D, 0000005C
        mov     dword [ebp-10H], 0                      ; 1EBC _ C7. 45, F0, 00000000
?_108:  mov     eax, dword [ebp-10H]                    ; 1EC3 _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 1EC6 _ 3B. 45, 10
; Note: Immediate operand could be made smaller by sign extension
        jge     ?_109                                   ; 1EC9 _ 0F 8D, 00000036
        mov     eax, dword [ebp+20H]                    ; 1ECF _ 8B. 45, 20
        mov     ecx, dword [ebp-14H]                    ; 1ED2 _ 8B. 4D, EC
        imul    ecx, dword [ebp+24H]                    ; 1ED5 _ 0F AF. 4D, 24
        add     ecx, dword [ebp-10H]                    ; 1ED9 _ 03. 4D, F0
        mov     dl, byte [eax+ecx]                      ; 1EDC _ 8A. 14 08
        mov     eax, dword [ebp+8H]                     ; 1EDF _ 8B. 45, 08
        mov     ecx, dword [ebp+1CH]                    ; 1EE2 _ 8B. 4D, 1C
        add     ecx, dword [ebp-14H]                    ; 1EE5 _ 03. 4D, EC
        imul    ecx, dword [ebp+0CH]                    ; 1EE8 _ 0F AF. 4D, 0C
        mov     esi, dword [ebp+18H]                    ; 1EEC _ 8B. 75, 18
        add     esi, dword [ebp-10H]                    ; 1EEF _ 03. 75, F0
        add     ecx, esi                                ; 1EF2 _ 01. F1
        mov     byte [eax+ecx], dl                      ; 1EF4 _ 88. 14 08
        mov     eax, dword [ebp-10H]                    ; 1EF7 _ 8B. 45, F0
        add     eax, 1                                  ; 1EFA _ 83. C0, 01
        mov     dword [ebp-10H], eax                    ; 1EFD _ 89. 45, F0
; Note: Immediate operand could be made smaller by sign extension
        jmp     ?_108                                   ; 1F00 _ E9, FFFFFFBE

?_109:
; Note: Immediate operand could be made smaller by sign extension
        jmp     ?_110                                   ; 1F05 _ E9, 00000000

?_110:  mov     eax, dword [ebp-14H]                    ; 1F0A _ 8B. 45, EC
        add     eax, 1                                  ; 1F0D _ 83. C0, 01
        mov     dword [ebp-14H], eax                    ; 1F10 _ 89. 45, EC
; Note: Immediate operand could be made smaller by sign extension
        jmp     ?_107                                   ; 1F13 _ E9, FFFFFF98

?_111:  add     esp, 40                                 ; 1F18 _ 83. C4, 28
        pop     esi                                     ; 1F1B _ 5E
        pop     edi                                     ; 1F1C _ 5F
        pop     ebx                                     ; 1F1D _ 5B
        pop     ebp                                     ; 1F1E _ 5D
        ret                                             ; 1F1F _ C3
; putblock End of function

showFont8:; Function begin
        push    ebp                                     ; 1F20 _ 55
        mov     ebp, esp                                ; 1F21 _ 89. E5
        push    ebx                                     ; 1F23 _ 53
        push    edi                                     ; 1F24 _ 57
        push    esi                                     ; 1F25 _ 56
        sub     esp, 36                                 ; 1F26 _ 83. EC, 24
        mov     eax, dword [ebp+1CH]                    ; 1F29 _ 8B. 45, 1C
        mov     cl, byte [ebp+18H]                      ; 1F2C _ 8A. 4D, 18
        mov     edx, dword [ebp+14H]                    ; 1F2F _ 8B. 55, 14
        mov     esi, dword [ebp+10H]                    ; 1F32 _ 8B. 75, 10
        mov     edi, dword [ebp+0CH]                    ; 1F35 _ 8B. 7D, 0C
        mov     ebx, dword [ebp+8H]                     ; 1F38 _ 8B. 5D, 08
        mov     dword [ebp-10H], 0                      ; 1F3B _ C7. 45, F0, 00000000
        mov     dword [ebp-1CH], eax                    ; 1F42 _ 89. 45, E4
        mov     byte [ebp-1DH], cl                      ; 1F45 _ 88. 4D, E3
        mov     dword [ebp-24H], edx                    ; 1F48 _ 89. 55, DC
        mov     dword [ebp-28H], esi                    ; 1F4B _ 89. 75, D8
        mov     dword [ebp-2CH], edi                    ; 1F4E _ 89. 7D, D4
        mov     dword [ebp-30H], ebx                    ; 1F51 _ 89. 5D, D0
?_112:  cmp     dword [ebp-10H], 16                     ; 1F54 _ 83. 7D, F0, 10
        jge     ?_122                                   ; 1F58 _ 0F 8D, 000000FD
        mov     eax, dword [ebp+8H]                     ; 1F5E _ 8B. 45, 08
        mov     ecx, dword [ebp+14H]                    ; 1F61 _ 8B. 4D, 14
        add     ecx, dword [ebp-10H]                    ; 1F64 _ 03. 4D, F0
        imul    ecx, dword [ebp+0CH]                    ; 1F67 _ 0F AF. 4D, 0C
        add     eax, ecx                                ; 1F6B _ 01. C8
        add     eax, dword [ebp+10H]                    ; 1F6D _ 03. 45, 10
        mov     dword [ebp-14H], eax                    ; 1F70 _ 89. 45, EC
        mov     eax, dword [ebp+1CH]                    ; 1F73 _ 8B. 45, 1C
        mov     ecx, dword [ebp-10H]                    ; 1F76 _ 8B. 4D, F0
        mov     dl, byte [eax+ecx]                      ; 1F79 _ 8A. 14 08
        mov     byte [ebp-15H], dl                      ; 1F7C _ 88. 55, EB
        movsx   eax, byte [ebp-15H]                     ; 1F7F _ 0F BE. 45, EB
        and     eax, 80H                                ; 1F83 _ 25, 00000080
        cmp     eax, 0                                  ; 1F88 _ 83. F8, 00
; Note: Immediate operand could be made smaller by sign extension
        je      ?_113                                   ; 1F8B _ 0F 84, 00000008
        mov     al, byte [ebp+18H]                      ; 1F91 _ 8A. 45, 18
        mov     ecx, dword [ebp-14H]                    ; 1F94 _ 8B. 4D, EC
        mov     byte [ecx], al                          ; 1F97 _ 88. 01
?_113:  movsx   eax, byte [ebp-15H]                     ; 1F99 _ 0F BE. 45, EB
        and     eax, 40H                                ; 1F9D _ 83. E0, 40
        cmp     eax, 0                                  ; 1FA0 _ 83. F8, 00
; Note: Immediate operand could be made smaller by sign extension
        je      ?_114                                   ; 1FA3 _ 0F 84, 00000009
        mov     al, byte [ebp+18H]                      ; 1FA9 _ 8A. 45, 18
        mov     ecx, dword [ebp-14H]                    ; 1FAC _ 8B. 4D, EC
        mov     byte [ecx+1H], al                       ; 1FAF _ 88. 41, 01
?_114:  movsx   eax, byte [ebp-15H]                     ; 1FB2 _ 0F BE. 45, EB
        and     eax, 20H                                ; 1FB6 _ 83. E0, 20
        cmp     eax, 0                                  ; 1FB9 _ 83. F8, 00
; Note: Immediate operand could be made smaller by sign extension
        je      ?_115                                   ; 1FBC _ 0F 84, 00000009
        mov     al, byte [ebp+18H]                      ; 1FC2 _ 8A. 45, 18
        mov     ecx, dword [ebp-14H]                    ; 1FC5 _ 8B. 4D, EC
        mov     byte [ecx+2H], al                       ; 1FC8 _ 88. 41, 02
?_115:  movsx   eax, byte [ebp-15H]                     ; 1FCB _ 0F BE. 45, EB
        and     eax, 10H                                ; 1FCF _ 83. E0, 10
        cmp     eax, 0                                  ; 1FD2 _ 83. F8, 00
; Note: Immediate operand could be made smaller by sign extension
        je      ?_116                                   ; 1FD5 _ 0F 84, 00000009
        mov     al, byte [ebp+18H]                      ; 1FDB _ 8A. 45, 18
        mov     ecx, dword [ebp-14H]                    ; 1FDE _ 8B. 4D, EC
        mov     byte [ecx+3H], al                       ; 1FE1 _ 88. 41, 03
?_116:  movsx   eax, byte [ebp-15H]                     ; 1FE4 _ 0F BE. 45, EB
        and     eax, 08H                                ; 1FE8 _ 83. E0, 08
        cmp     eax, 0                                  ; 1FEB _ 83. F8, 00
; Note: Immediate operand could be made smaller by sign extension
        je      ?_117                                   ; 1FEE _ 0F 84, 00000009
        mov     al, byte [ebp+18H]                      ; 1FF4 _ 8A. 45, 18
        mov     ecx, dword [ebp-14H]                    ; 1FF7 _ 8B. 4D, EC
        mov     byte [ecx+4H], al                       ; 1FFA _ 88. 41, 04
?_117:  movsx   eax, byte [ebp-15H]                     ; 1FFD _ 0F BE. 45, EB
        and     eax, 04H                                ; 2001 _ 83. E0, 04
        cmp     eax, 0                                  ; 2004 _ 83. F8, 00
; Note: Immediate operand could be made smaller by sign extension
        je      ?_118                                   ; 2007 _ 0F 84, 00000009
        mov     al, byte [ebp+18H]                      ; 200D _ 8A. 45, 18
        mov     ecx, dword [ebp-14H]                    ; 2010 _ 8B. 4D, EC
        mov     byte [ecx+5H], al                       ; 2013 _ 88. 41, 05
?_118:  movsx   eax, byte [ebp-15H]                     ; 2016 _ 0F BE. 45, EB
        and     eax, 02H                                ; 201A _ 83. E0, 02
        cmp     eax, 0                                  ; 201D _ 83. F8, 00
; Note: Immediate operand could be made smaller by sign extension
        je      ?_119                                   ; 2020 _ 0F 84, 00000009
        mov     al, byte [ebp+18H]                      ; 2026 _ 8A. 45, 18
        mov     ecx, dword [ebp-14H]                    ; 2029 _ 8B. 4D, EC
        mov     byte [ecx+6H], al                       ; 202C _ 88. 41, 06
?_119:  movsx   eax, byte [ebp-15H]                     ; 202F _ 0F BE. 45, EB
        and     eax, 01H                                ; 2033 _ 83. E0, 01
        cmp     eax, 0                                  ; 2036 _ 83. F8, 00
; Note: Immediate operand could be made smaller by sign extension
        je      ?_120                                   ; 2039 _ 0F 84, 00000009
        mov     al, byte [ebp+18H]                      ; 203F _ 8A. 45, 18
        mov     ecx, dword [ebp-14H]                    ; 2042 _ 8B. 4D, EC
        mov     byte [ecx+7H], al                       ; 2045 _ 88. 41, 07
?_120:
; Note: Immediate operand could be made smaller by sign extension
        jmp     ?_121                                   ; 2048 _ E9, 00000000

?_121:  mov     eax, dword [ebp-10H]                    ; 204D _ 8B. 45, F0
        add     eax, 1                                  ; 2050 _ 83. C0, 01
        mov     dword [ebp-10H], eax                    ; 2053 _ 89. 45, F0
        jmp     ?_112                                   ; 2056 _ E9, FFFFFEF9

?_122:  add     esp, 36                                 ; 205B _ 83. C4, 24
        pop     esi                                     ; 205E _ 5E
        pop     edi                                     ; 205F _ 5F
        pop     ebx                                     ; 2060 _ 5B
        pop     ebp                                     ; 2061 _ 5D
        ret                                             ; 2062 _ C3
; showFont8 End of function

; Filling space: 0DH
; Filler type: Multi-byte NOP
;       db 66H, 2EH, 0FH, 1FH, 84H, 00H, 00H, 00H
;       db 00H, 00H, 0FH, 1FH, 00H

ALIGN   16

fifo8_put:; Function begin
        push    ebp                                     ; 2070 _ 55
        mov     ebp, esp                                ; 2071 _ 89. E5
        sub     esp, 12                                 ; 2073 _ 83. EC, 0C
        mov     al, byte [ebp+0CH]                      ; 2076 _ 8A. 45, 0C
        mov     ecx, dword [ebp+8H]                     ; 2079 _ 8B. 4D, 08
        mov     edx, dword [ebp+8H]                     ; 207C _ 8B. 55, 08
        cmp     dword [edx+10H], 0                      ; 207F _ 83. 7A, 10, 00
        mov     byte [ebp-5H], al                       ; 2083 _ 88. 45, FB
        mov     dword [ebp-0CH], ecx                    ; 2086 _ 89. 4D, F4
; Note: Immediate operand could be made smaller by sign extension
        jne     ?_123                                   ; 2089 _ 0F 85, 00000018
        mov     eax, dword [ebp+8H]                     ; 208F _ 8B. 45, 08
        mov     ecx, dword [eax+14H]                    ; 2092 _ 8B. 48, 14
        or      ecx, 01H                                ; 2095 _ 83. C9, 01
        mov     dword [eax+14H], ecx                    ; 2098 _ 89. 48, 14
        mov     dword [ebp-4H], -1                      ; 209B _ C7. 45, FC, FFFFFFFF
; Note: Immediate operand could be made smaller by sign extension
        jmp     ?_125                                   ; 20A2 _ E9, 0000004C

?_123:  mov     al, byte [ebp+0CH]                      ; 20A7 _ 8A. 45, 0C
        mov     ecx, dword [ebp+8H]                     ; 20AA _ 8B. 4D, 08
        mov     ecx, dword [ecx]                        ; 20AD _ 8B. 09
        mov     edx, dword [ebp+8H]                     ; 20AF _ 8B. 55, 08
        mov     edx, dword [edx+4H]                     ; 20B2 _ 8B. 52, 04
        mov     byte [ecx+edx], al                      ; 20B5 _ 88. 04 11
        mov     ecx, dword [ebp+8H]                     ; 20B8 _ 8B. 4D, 08
        mov     edx, dword [ecx+4H]                     ; 20BB _ 8B. 51, 04
        add     edx, 1                                  ; 20BE _ 83. C2, 01
        mov     dword [ecx+4H], edx                     ; 20C1 _ 89. 51, 04
        mov     ecx, dword [ebp+8H]                     ; 20C4 _ 8B. 4D, 08
        mov     ecx, dword [ecx+4H]                     ; 20C7 _ 8B. 49, 04
        mov     edx, dword [ebp+8H]                     ; 20CA _ 8B. 55, 08
        cmp     ecx, dword [edx+0CH]                    ; 20CD _ 3B. 4A, 0C
; Note: Immediate operand could be made smaller by sign extension
        jne     ?_124                                   ; 20D0 _ 0F 85, 0000000A
        mov     eax, dword [ebp+8H]                     ; 20D6 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 20D9 _ C7. 40, 04, 00000000
?_124:  mov     eax, dword [ebp+8H]                     ; 20E0 _ 8B. 45, 08
        mov     ecx, dword [eax+10H]                    ; 20E3 _ 8B. 48, 10
        add     ecx, -1                                 ; 20E6 _ 83. C1, FF
        mov     dword [eax+10H], ecx                    ; 20E9 _ 89. 48, 10
        mov     dword [ebp-4H], 0                       ; 20EC _ C7. 45, FC, 00000000
?_125:  mov     eax, dword [ebp-4H]                     ; 20F3 _ 8B. 45, FC
        add     esp, 12                                 ; 20F6 _ 83. C4, 0C
        pop     ebp                                     ; 20F9 _ 5D
        ret                                             ; 20FA _ C3
; fifo8_put End of function

; Filling space: 5H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 44H, 00H, 00H

ALIGN   8

intHandler21:; Function begin
        push    ebp                                     ; 2100 _ 55
        mov     ebp, esp                                ; 2101 _ 89. E5
        sub     esp, 24                                 ; 2103 _ 83. EC, 18
        mov     eax, dword [ebp+8H]                     ; 2106 _ 8B. 45, 08
        mov     dword [esp], 32                         ; 2109 _ C7. 04 24, 00000020
        mov     dword [esp+4H], 97                      ; 2110 _ C7. 44 24, 04, 00000061
        mov     dword [ebp-8H], eax                     ; 2118 _ 89. 45, F8
        call    io_out8                                 ; 211B _ E8, FFFFFFFC(rel)
        mov     dword [esp], 96                         ; 2120 _ C7. 04 24, 00000060
        call    io_in8                                  ; 2127 _ E8, FFFFFFFC(rel)
        mov     cl, al                                  ; 212C _ 88. C1
        mov     byte [ebp-1H], cl                       ; 212E _ 88. 4D, FF
        lea     eax, [keyfifo]                          ; 2131 _ 8D. 05, 00000000(d)
        mov     dword [esp], eax                        ; 2137 _ 89. 04 24
        movzx   eax, byte [ebp-1H]                      ; 213A _ 0F B6. 45, FF
        mov     dword [esp+4H], eax                     ; 213E _ 89. 44 24, 04
        call    fifo8_put                               ; 2142 _ E8, FFFFFF29
        mov     dword [ebp-0CH], eax                    ; 2147 _ 89. 45, F4
        add     esp, 24                                 ; 214A _ 83. C4, 18
        pop     ebp                                     ; 214D _ 5D
        ret                                             ; 214E _ C3
; intHandler21 End of function

        nop                                             ; 214F _ 90

ALIGN   16
wait_KBC_sendready:; Function begin
        push    ebp                                     ; 2150 _ 55
        mov     ebp, esp                                ; 2151 _ 89. E5
        sub     esp, 8                                  ; 2153 _ 83. EC, 08
; Note: Immediate operand could be made smaller by sign extension
        jmp     ?_126                                   ; 2156 _ E9, 00000000

?_126:  mov     dword [esp], 100                        ; 215B _ C7. 04 24, 00000064
        call    io_in8                                  ; 2162 _ E8, FFFFFFFC(rel)
        and     eax, 02H                                ; 2167 _ 83. E0, 02
        cmp     eax, 0                                  ; 216A _ 83. F8, 00
; Note: Immediate operand could be made smaller by sign extension
        jne     ?_127                                   ; 216D _ 0F 85, 00000005
; Note: Immediate operand could be made smaller by sign extension
        jmp     ?_128                                   ; 2173 _ E9, 00000005

?_127:
; Note: Immediate operand could be made smaller by sign extension
        jmp     ?_126                                   ; 2178 _ E9, FFFFFFDE

?_128:  add     esp, 8                                  ; 217D _ 83. C4, 08
        pop     ebp                                     ; 2180 _ 5D
        ret                                             ; 2181 _ C3
; wait_KBC_sendready End of function

; Filling space: 0EH
; Filler type: Multi-byte NOP
;       db 66H, 2EH, 0FH, 1FH, 84H, 00H, 00H, 00H
;       db 00H, 00H, 0FH, 1FH, 40H, 00H

ALIGN   16

show_key_info:; Function begin
        push    ebp                                     ; 2190 _ 55
        mov     ebp, esp                                ; 2191 _ 89. E5
        push    ebx                                     ; 2193 _ 53
        push    edi                                     ; 2194 _ 57
        push    esi                                     ; 2195 _ 56
        sub     esp, 44                                 ; 2196 _ 83. EC, 2C
        mov     eax, dword [ebp+0CH]                    ; 2199 _ 8B. 45, 0C
        mov     ecx, dword [ebp+8H]                     ; 219C _ 8B. 4D, 08
        mov     byte [ebp-0DH], 0                       ; 219F _ C6. 45, F3, 00
        mov     dword [ebp-18H], eax                    ; 21A3 _ 89. 45, E8
        mov     dword [ebp-1CH], ecx                    ; 21A6 _ 89. 4D, E4
        call    io_sti                                  ; 21A9 _ E8, FFFFFFFC(rel)
        lea     eax, [keyfifo]                          ; 21AE _ 8D. 05, 00000000(d)
        mov     dword [esp], eax                        ; 21B4 _ 89. 04 24
        call    fifo8_get                               ; 21B7 _ E8, FFFFF944
        mov     dl, al                                  ; 21BC _ 88. C2
        mov     byte [ebp-0DH], dl                      ; 21BE _ 88. 55, F3
        movzx   eax, byte [ebp-0DH]                     ; 21C1 _ 0F B6. 45, F3
        mov     dword [esp], eax                        ; 21C5 _ 89. 04 24
        call    charToHexStr                            ; 21C8 _ E8, FFFFFB63
        xor     ecx, ecx                                ; 21CD _ 31. C9
        mov     dword [ebp-14H], eax                    ; 21CF _ 89. 45, EC
        mov     eax, dword [ebp+8H]                     ; 21D2 _ 8B. 45, 08
        mov     esi, dword [ebp+0CH]                    ; 21D5 _ 8B. 75, 0C
        mov     edi, dword [show_key_info.showXPos]     ; 21D8 _ 8B. 3D, 00000154(d)
        mov     ebx, dword [ebp-14H]                    ; 21DE _ 8B. 5D, EC
        mov     dword [esp], eax                        ; 21E1 _ 89. 04 24
        mov     dword [esp+4H], esi                     ; 21E4 _ 89. 74 24, 04
        mov     dword [esp+8H], edi                     ; 21E8 _ 89. 7C 24, 08
        mov     dword [esp+0CH], 0                      ; 21EC _ C7. 44 24, 0C, 00000000
        mov     dword [esp+10H], 7                      ; 21F4 _ C7. 44 24, 10, 00000007
        mov     dword [esp+14H], ebx                    ; 21FC _ 89. 5C 24, 14
        mov     dword [ebp-20H], ecx                    ; 2200 _ 89. 4D, E0
        call    showString                              ; 2203 _ E8, FFFFF838
        mov     eax, dword [show_key_info.showXPos]     ; 2208 _ A1, 00000154(d)
        add     eax, 32                                 ; 220D _ 83. C0, 20
        mov     dword [show_key_info.showXPos], eax     ; 2210 _ A3, 00000154(d)
        add     esp, 44                                 ; 2215 _ 83. C4, 2C
        pop     esi                                     ; 2218 _ 5E
        pop     edi                                     ; 2219 _ 5F
        pop     ebx                                     ; 221A _ 5B
        pop     ebp                                     ; 221B _ 5D
        ret                                             ; 221C _ C3
; show_key_info End of function

; Filling space: 3H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 00H

ALIGN   8

intHandler2C:; Function begin
        push    ebp                                     ; 2220 _ 55
        mov     ebp, esp                                ; 2221 _ 89. E5
        sub     esp, 24                                 ; 2223 _ 83. EC, 18
        mov     eax, dword [ebp+8H]                     ; 2226 _ 8B. 45, 08
        mov     dword [esp], 160                        ; 2229 _ C7. 04 24, 000000A0
        mov     dword [esp+4H], 100                     ; 2230 _ C7. 44 24, 04, 00000064
        mov     dword [ebp-8H], eax                     ; 2238 _ 89. 45, F8
        call    io_out8                                 ; 223B _ E8, FFFFFFFC(rel)
        mov     dword [esp], 32                         ; 2240 _ C7. 04 24, 00000020
        mov     dword [esp+4H], 98                      ; 2247 _ C7. 44 24, 04, 00000062
        call    io_out8                                 ; 224F _ E8, FFFFFFFC(rel)
        mov     dword [esp], 96                         ; 2254 _ C7. 04 24, 00000060
        call    io_in8                                  ; 225B _ E8, FFFFFFFC(rel)
        mov     cl, al                                  ; 2260 _ 88. C1
        mov     byte [ebp-1H], cl                       ; 2262 _ 88. 4D, FF
        lea     eax, [mousefifo]                        ; 2265 _ 8D. 05, 00000018(d)
        mov     dword [esp], eax                        ; 226B _ 89. 04 24
        movzx   eax, byte [ebp-1H]                      ; 226E _ 0F B6. 45, FF
        mov     dword [esp+4H], eax                     ; 2272 _ 89. 44 24, 04
        call    fifo8_put                               ; 2276 _ E8, FFFFFDF5
        mov     dword [ebp-0CH], eax                    ; 227B _ 89. 45, F4
        add     esp, 24                                 ; 227E _ 83. C4, 18
        pop     ebp                                     ; 2281 _ 5D
        ret                                             ; 2282 _ C3
; intHandler2C End of function

; Filling space: 0DH
; Filler type: Multi-byte NOP
;       db 66H, 2EH, 0FH, 1FH, 84H, 00H, 00H, 00H
;       db 00H, 00H, 0FH, 1FH, 00H

ALIGN   16

show_mouse_info:; Function begin
        push    ebp                                     ; 2290 _ 55
        mov     ebp, esp                                ; 2291 _ 89. E5
        push    ebx                                     ; 2293 _ 53
        push    edi                                     ; 2294 _ 57
        push    esi                                     ; 2295 _ 56
        sub     esp, 44                                 ; 2296 _ 83. EC, 2C
        mov     eax, dword [ebp+0CH]                    ; 2299 _ 8B. 45, 0C
        mov     ecx, dword [ebp+8H]                     ; 229C _ 8B. 4D, 08
        mov     byte [ebp-0DH], 0                       ; 229F _ C6. 45, F3, 00
        mov     dword [ebp-18H], eax                    ; 22A3 _ 89. 45, E8
        mov     dword [ebp-1CH], ecx                    ; 22A6 _ 89. 4D, E4
        call    io_sti                                  ; 22A9 _ E8, FFFFFFFC(rel)
        lea     eax, [mousefifo]                        ; 22AE _ 8D. 05, 00000018(d)
        mov     dword [esp], eax                        ; 22B4 _ 89. 04 24
        call    fifo8_get                               ; 22B7 _ E8, FFFFF844
        mov     dl, al                                  ; 22BC _ 88. C2
        mov     byte [ebp-0DH], dl                      ; 22BE _ 88. 55, F3
        movzx   eax, byte [ebp-0DH]                     ; 22C1 _ 0F B6. 45, F3
        mov     dword [esp], eax                        ; 22C5 _ 89. 04 24
        call    charToHexStr                            ; 22C8 _ E8, FFFFFA63
        xor     ecx, ecx                                ; 22CD _ 31. C9
        mov     dword [ebp-14H], eax                    ; 22CF _ 89. 45, EC
        mov     eax, dword [ebp+8H]                     ; 22D2 _ 8B. 45, 08
        mov     esi, dword [ebp+0CH]                    ; 22D5 _ 8B. 75, 0C
        mov     edi, dword [show_mouse_info.showXPos]   ; 22D8 _ 8B. 3D, 00000158(d)
        mov     ebx, dword [ebp-14H]                    ; 22DE _ 8B. 5D, EC
        mov     dword [esp], eax                        ; 22E1 _ 89. 04 24
        mov     dword [esp+4H], esi                     ; 22E4 _ 89. 74 24, 04
        mov     dword [esp+8H], edi                     ; 22E8 _ 89. 7C 24, 08
        mov     dword [esp+0CH], 0                      ; 22EC _ C7. 44 24, 0C, 00000000
        mov     dword [esp+10H], 7                      ; 22F4 _ C7. 44 24, 10, 00000007
        mov     dword [esp+14H], ebx                    ; 22FC _ 89. 5C 24, 14
        mov     dword [ebp-20H], ecx                    ; 2300 _ 89. 4D, E0
        call    showString                              ; 2303 _ E8, FFFFF738
        mov     eax, dword [show_mouse_info.showXPos]   ; 2308 _ A1, 00000158(d)
        add     eax, 32                                 ; 230D _ 83. C0, 20
        mov     dword [show_mouse_info.showXPos], eax   ; 2310 _ A3, 00000158(d)
        add     esp, 44                                 ; 2315 _ 83. C4, 2C
        pop     esi                                     ; 2318 _ 5E
        pop     edi                                     ; 2319 _ 5F
        pop     ebx                                     ; 231A _ 5B
        pop     ebp                                     ; 231B _ 5D
        ret                                             ; 231C _ C3
; show_mouse_info End of function

; Filling space: 3H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 00H

ALIGN   8

memman_total:; Function begin
        push    ebp                                     ; 2320 _ 55
        mov     ebp, esp                                ; 2321 _ 89. E5
        sub     esp, 12                                 ; 2323 _ 83. EC, 0C
        mov     eax, dword [ebp+8H]                     ; 2326 _ 8B. 45, 08
        mov     dword [ebp-8H], 0                       ; 2329 _ C7. 45, F8, 00000000
        mov     dword [ebp-4H], 0                       ; 2330 _ C7. 45, FC, 00000000
        mov     dword [ebp-0CH], eax                    ; 2337 _ 89. 45, F4
?_129:  mov     eax, dword [ebp-4H]                     ; 233A _ 8B. 45, FC
        mov     ecx, dword [ebp+8H]                     ; 233D _ 8B. 4D, 08
        cmp     eax, dword [ecx]                        ; 2340 _ 3B. 01
; Note: Immediate operand could be made smaller by sign extension
        jnc     ?_130                                   ; 2342 _ 0F 83, 0000001E
        mov     eax, dword [ebp+8H]                     ; 2348 _ 8B. 45, 08
        mov     ecx, dword [ebp-4H]                     ; 234B _ 8B. 4D, FC
        mov     eax, dword [eax+ecx*8+14H]              ; 234E _ 8B. 44 C8, 14
        add     eax, dword [ebp-8H]                     ; 2352 _ 03. 45, F8
        mov     dword [ebp-8H], eax                     ; 2355 _ 89. 45, F8
        mov     eax, dword [ebp-4H]                     ; 2358 _ 8B. 45, FC
        add     eax, 1                                  ; 235B _ 83. C0, 01
        mov     dword [ebp-4H], eax                     ; 235E _ 89. 45, FC
; Note: Immediate operand could be made smaller by sign extension
        jmp     ?_129                                   ; 2361 _ E9, FFFFFFD4

?_130:  mov     eax, dword [ebp-8H]                     ; 2366 _ 8B. 45, F8
        add     esp, 12                                 ; 2369 _ 83. C4, 0C
        pop     ebp                                     ; 236C _ 5D
        ret                                             ; 236D _ C3
; memman_total End of function

; Filling space: 2H
; Filler type: NOP with prefixes
;       db 66H, 90H

ALIGN   8

memman_alloc:; Function begin
        push    ebp                                     ; 2370 _ 55
        mov     ebp, esp                                ; 2371 _ 89. E5
        push    esi                                     ; 2373 _ 56
        sub     esp, 20                                 ; 2374 _ 83. EC, 14
        mov     eax, dword [ebp+0CH]                    ; 2377 _ 8B. 45, 0C
        mov     ecx, dword [ebp+8H]                     ; 237A _ 8B. 4D, 08
        mov     dword [ebp-0CH], 0                      ; 237D _ C7. 45, F4, 00000000
        mov     dword [ebp-14H], eax                    ; 2384 _ 89. 45, EC
        mov     dword [ebp-18H], ecx                    ; 2387 _ 89. 4D, E8
?_131:  mov     eax, dword [ebp-0CH]                    ; 238A _ 8B. 45, F4
        mov     ecx, dword [ebp+8H]                     ; 238D _ 8B. 4D, 08
        cmp     eax, dword [ecx]                        ; 2390 _ 3B. 01
; Note: Immediate operand could be made smaller by sign extension
        jnc     ?_135                                   ; 2392 _ 0F 83, 0000007D
        mov     eax, dword [ebp+8H]                     ; 2398 _ 8B. 45, 08
        mov     ecx, dword [ebp-0CH]                    ; 239B _ 8B. 4D, F4
        mov     eax, dword [eax+ecx*8+14H]              ; 239E _ 8B. 44 C8, 14
        cmp     eax, dword [ebp+0CH]                    ; 23A2 _ 3B. 45, 0C
; Note: Immediate operand could be made smaller by sign extension
        jc      ?_133                                   ; 23A5 _ 0F 82, 00000057
        mov     eax, dword [ebp+8H]                     ; 23AB _ 8B. 45, 08
        mov     ecx, dword [ebp-0CH]                    ; 23AE _ 8B. 4D, F4
        mov     eax, dword [eax+ecx*8+10H]              ; 23B1 _ 8B. 44 C8, 10
        mov     dword [ebp-10H], eax                    ; 23B5 _ 89. 45, F0
        mov     eax, dword [ebp+0CH]                    ; 23B8 _ 8B. 45, 0C
        mov     ecx, dword [ebp+8H]                     ; 23BB _ 8B. 4D, 08
        mov     edx, dword [ebp-0CH]                    ; 23BE _ 8B. 55, F4
        add     eax, dword [ecx+edx*8+10H]              ; 23C1 _ 03. 44 D1, 10
        mov     dword [ecx+edx*8+10H], eax              ; 23C5 _ 89. 44 D1, 10
        mov     eax, dword [ebp+0CH]                    ; 23C9 _ 8B. 45, 0C
        mov     ecx, dword [ebp+8H]                     ; 23CC _ 8B. 4D, 08
        mov     edx, dword [ebp-0CH]                    ; 23CF _ 8B. 55, F4
        mov     esi, dword [ecx+edx*8+14H]              ; 23D2 _ 8B. 74 D1, 14
        sub     esi, eax                                ; 23D6 _ 29. C6
        mov     dword [ecx+edx*8+14H], esi              ; 23D8 _ 89. 74 D1, 14
        mov     eax, dword [ebp+8H]                     ; 23DC _ 8B. 45, 08
        mov     ecx, dword [ebp-0CH]                    ; 23DF _ 8B. 4D, F4
        cmp     dword [eax+ecx*8+14H], 0                ; 23E2 _ 83. 7C C8, 14, 00
; Note: Immediate operand could be made smaller by sign extension
        jne     ?_132                                   ; 23E7 _ 0F 85, 0000000A
        mov     eax, dword [ebp+8H]                     ; 23ED _ 8B. 45, 08
        mov     ecx, dword [eax]                        ; 23F0 _ 8B. 08
        add     ecx, -1                                 ; 23F2 _ 83. C1, FF
        mov     dword [eax], ecx                        ; 23F5 _ 89. 08
?_132:  mov     eax, dword [ebp-10H]                    ; 23F7 _ 8B. 45, F0
        mov     dword [ebp-8H], eax                     ; 23FA _ 89. 45, F8
; Note: Immediate operand could be made smaller by sign extension
        jmp     ?_136                                   ; 23FD _ E9, 0000001A

?_133:
; Note: Immediate operand could be made smaller by sign extension
        jmp     ?_134                                   ; 2402 _ E9, 00000000

?_134:  mov     eax, dword [ebp-0CH]                    ; 2407 _ 8B. 45, F4
        add     eax, 1                                  ; 240A _ 83. C0, 01
        mov     dword [ebp-0CH], eax                    ; 240D _ 89. 45, F4
        jmp     ?_131                                   ; 2410 _ E9, FFFFFF75

?_135:  mov     dword [ebp-8H], 0                       ; 2415 _ C7. 45, F8, 00000000
?_136:  mov     eax, dword [ebp-8H]                     ; 241C _ 8B. 45, F8
        add     esp, 20                                 ; 241F _ 83. C4, 14
        pop     esi                                     ; 2422 _ 5E
        pop     ebp                                     ; 2423 _ 5D
        ret                                             ; 2424 _ C3
; memman_alloc End of function

; Filling space: 0BH
; Filler type: Multi-byte NOP
;       db 66H, 2EH, 0FH, 1FH, 84H, 00H, 00H, 00H
;       db 00H, 00H, 90H

ALIGN   16

memman_free_4k:; Function begin
        push    ebp                                     ; 2430 _ 55
        mov     ebp, esp                                ; 2431 _ 89. E5
        push    ebx                                     ; 2433 _ 53
        push    edi                                     ; 2434 _ 57
        push    esi                                     ; 2435 _ 56
        sub     esp, 28                                 ; 2436 _ 83. EC, 1C
        mov     eax, dword [ebp+10H]                    ; 2439 _ 8B. 45, 10
        mov     ecx, dword [ebp+0CH]                    ; 243C _ 8B. 4D, 0C
        mov     edx, dword [ebp+8H]                     ; 243F _ 8B. 55, 08
        mov     esi, dword [ebp+10H]                    ; 2442 _ 8B. 75, 10
        add     esi, 4095                               ; 2445 _ 81. C6, 00000FFF
        and     esi, 0FFFFF000H                         ; 244B _ 81. E6, FFFFF000
        mov     dword [ebp+10H], esi                    ; 2451 _ 89. 75, 10
        mov     esi, dword [ebp+8H]                     ; 2454 _ 8B. 75, 08
        mov     edi, dword [ebp+0CH]                    ; 2457 _ 8B. 7D, 0C
        mov     ebx, dword [ebp+10H]                    ; 245A _ 8B. 5D, 10
        mov     dword [esp], esi                        ; 245D _ 89. 34 24
        mov     dword [esp+4H], edi                     ; 2460 _ 89. 7C 24, 04
        mov     dword [esp+8H], ebx                     ; 2464 _ 89. 5C 24, 08
        mov     dword [ebp-14H], eax                    ; 2468 _ 89. 45, EC
        mov     dword [ebp-18H], ecx                    ; 246B _ 89. 4D, E8
        mov     dword [ebp-1CH], edx                    ; 246E _ 89. 55, E4
        call    memman_free                             ; 2471 _ E8, FFFFE31A
        mov     dword [ebp-10H], eax                    ; 2476 _ 89. 45, F0
        mov     eax, dword [ebp-10H]                    ; 2479 _ 8B. 45, F0
        add     esp, 28                                 ; 247C _ 83. C4, 1C
        pop     esi                                     ; 247F _ 5E
        pop     edi                                     ; 2480 _ 5F
        pop     ebx                                     ; 2481 _ 5B
        pop     ebp                                     ; 2482 _ 5D
        ret                                             ; 2483 _ C3
; memman_free_4k End of function

; Filling space: 0CH
; Filler type: Multi-byte NOP
;       db 66H, 2EH, 0FH, 1FH, 84H, 00H, 00H, 00H
;       db 00H, 00H, 66H, 90H

ALIGN   16

showMemoryInfo:; Function begin
        push    ebp                                     ; 2490 _ 55
        mov     ebp, esp                                ; 2491 _ 89. E5
        push    ebx                                     ; 2493 _ 53
        push    edi                                     ; 2494 _ 57
        push    esi                                     ; 2495 _ 56
        sub     esp, 108                                ; 2496 _ 83. EC, 6C
        mov     eax, dword [ebp+18H]                    ; 2499 _ 8B. 45, 18
        mov     ecx, dword [ebp+14H]                    ; 249C _ 8B. 4D, 14
        mov     edx, dword [ebp+10H]                    ; 249F _ 8B. 55, 10
        mov     esi, dword [ebp+0CH]                    ; 24A2 _ 8B. 75, 0C
        mov     edi, dword [ebp+8H]                     ; 24A5 _ 8B. 7D, 08
        xor     ebx, ebx                                ; 24A8 _ 31. DB
        mov     dword [ebp-10H], 0                      ; 24AA _ C7. 45, F0, 00000000
        mov     dword [ebp-14H], 0                      ; 24B1 _ C7. 45, EC, 00000000
        mov     dword [ebp-18H], 104                    ; 24B8 _ C7. 45, E8, 00000068
        mov     dword [ebp-1CH], 80                     ; 24BF _ C7. 45, E4, 00000050
        mov     dword [ebp-38H], eax                    ; 24C6 _ 89. 45, C8
        mov     eax, dword [ebp+0CH]                    ; 24C9 _ 8B. 45, 0C
        mov     dword [ebp-3CH], eax                    ; 24CC _ 89. 45, C4
        mov     eax, dword [ebp+14H]                    ; 24CF _ 8B. 45, 14
        mov     dword [ebp-40H], eax                    ; 24D2 _ 89. 45, C0
        mov     eax, dword [ebp+14H]                    ; 24D5 _ 8B. 45, 14
        mov     dword [ebp-44H], eax                    ; 24D8 _ 89. 45, BC
        mov     eax, dword [ebp-3CH]                    ; 24DB _ 8B. 45, C4
        mov     dword [esp], eax                        ; 24DE _ 89. 04 24
        mov     eax, dword [ebp-40H]                    ; 24E1 _ 8B. 45, C0
        mov     dword [esp+4H], eax                     ; 24E4 _ 89. 44 24, 04
        mov     dword [esp+8H], 14                      ; 24E8 _ C7. 44 24, 08, 0000000E
        mov     dword [esp+0CH], 0                      ; 24F0 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+10H], 0                      ; 24F8 _ C7. 44 24, 10, 00000000
        mov     eax, dword [ebp-44H]                    ; 2500 _ 8B. 45, BC
        mov     dword [esp+14H], eax                    ; 2503 _ 89. 44 24, 14
        mov     dword [esp+18H], 100                    ; 2507 _ C7. 44 24, 18, 00000064
        mov     dword [ebp-48H], ecx                    ; 250F _ 89. 4D, B8
        mov     dword [ebp-4CH], edx                    ; 2512 _ 89. 55, B4
        mov     dword [ebp-50H], esi                    ; 2515 _ 89. 75, B0
        mov     dword [ebp-54H], edi                    ; 2518 _ 89. 7D, AC
        mov     dword [ebp-58H], ebx                    ; 251B _ 89. 5D, A8
        call    boxfill8                                ; 251E _ E8, FFFFF47D
        mov     eax, dword [ebp+10H]                    ; 2523 _ 8B. 45, 10
        mov     dword [esp], eax                        ; 2526 _ 89. 04 24
        call    intToHexStr                             ; 2529 _ E8, FFFFF392
        mov     dword [ebp-20H], eax                    ; 252E _ 89. 45, E0
        mov     eax, dword [ebp+0CH]                    ; 2531 _ 8B. 45, 0C
        mov     ecx, dword [ebp+14H]                    ; 2534 _ 8B. 4D, 14
        mov     edx, dword [ebp-18H]                    ; 2537 _ 8B. 55, E8
        mov     esi, dword [ebp-14H]                    ; 253A _ 8B. 75, EC
        mov     ebx, dword [ebp+18H]                    ; 253D _ 8B. 5D, 18
        mov     edi, dword [ebp-20H]                    ; 2540 _ 8B. 7D, E0
        mov     dword [esp], eax                        ; 2543 _ 89. 04 24
        mov     dword [esp+4H], ecx                     ; 2546 _ 89. 4C 24, 04
        mov     dword [esp+8H], edx                     ; 254A _ 89. 54 24, 08
        mov     dword [esp+0CH], esi                    ; 254E _ 89. 74 24, 0C
        movsx   eax, bl                                 ; 2552 _ 0F BE. C3
        mov     dword [esp+10H], eax                    ; 2555 _ 89. 44 24, 10
        mov     dword [esp+14H], edi                    ; 2559 _ 89. 7C 24, 14
        call    showString                              ; 255D _ E8, FFFFF4DE
        mov     eax, dword [ebp-14H]                    ; 2562 _ 8B. 45, EC
        add     eax, 16                                 ; 2565 _ 83. C0, 10
        mov     dword [ebp-14H], eax                    ; 2568 _ 89. 45, EC
        mov     eax, dword [ebp+8H]                     ; 256B _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 256E _ 8B. 00
        mov     dword [esp], eax                        ; 2570 _ 89. 04 24
        call    intToHexStr                             ; 2573 _ E8, FFFFF348
        mov     dword [ebp-24H], eax                    ; 2578 _ 89. 45, DC
        mov     eax, dword [ebp+0CH]                    ; 257B _ 8B. 45, 0C
        mov     ecx, dword [ebp+14H]                    ; 257E _ 8B. 4D, 14
        mov     edx, dword [ebp-18H]                    ; 2581 _ 8B. 55, E8
        mov     esi, dword [ebp-14H]                    ; 2584 _ 8B. 75, EC
        mov     ebx, dword [ebp+18H]                    ; 2587 _ 8B. 5D, 18
        mov     edi, dword [ebp-24H]                    ; 258A _ 8B. 7D, DC
        mov     dword [esp], eax                        ; 258D _ 89. 04 24
        mov     dword [esp+4H], ecx                     ; 2590 _ 89. 4C 24, 04
        mov     dword [esp+8H], edx                     ; 2594 _ 89. 54 24, 08
        mov     dword [esp+0CH], esi                    ; 2598 _ 89. 74 24, 0C
        movsx   eax, bl                                 ; 259C _ 0F BE. C3
        mov     dword [esp+10H], eax                    ; 259F _ 89. 44 24, 10
        mov     dword [esp+14H], edi                    ; 25A3 _ 89. 7C 24, 14
        call    showString                              ; 25A7 _ E8, FFFFF494
        mov     eax, dword [ebp-14H]                    ; 25AC _ 8B. 45, EC
        add     eax, 16                                 ; 25AF _ 83. C0, 10
        mov     dword [ebp-14H], eax                    ; 25B2 _ 89. 45, EC
        mov     eax, dword [ebp+8H]                     ; 25B5 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 25B8 _ 8B. 40, 04
        mov     dword [esp], eax                        ; 25BB _ 89. 04 24
        call    intToHexStr                             ; 25BE _ E8, FFFFF2FD
        mov     dword [ebp-28H], eax                    ; 25C3 _ 89. 45, D8
        mov     eax, dword [ebp+0CH]                    ; 25C6 _ 8B. 45, 0C
        mov     ecx, dword [ebp+14H]                    ; 25C9 _ 8B. 4D, 14
        mov     edx, dword [ebp-18H]                    ; 25CC _ 8B. 55, E8
        mov     esi, dword [ebp-14H]                    ; 25CF _ 8B. 75, EC
        mov     ebx, dword [ebp+18H]                    ; 25D2 _ 8B. 5D, 18
        mov     edi, dword [ebp-28H]                    ; 25D5 _ 8B. 7D, D8
        mov     dword [esp], eax                        ; 25D8 _ 89. 04 24
        mov     dword [esp+4H], ecx                     ; 25DB _ 89. 4C 24, 04
        mov     dword [esp+8H], edx                     ; 25DF _ 89. 54 24, 08
        mov     dword [esp+0CH], esi                    ; 25E3 _ 89. 74 24, 0C
        movsx   eax, bl                                 ; 25E7 _ 0F BE. C3
        mov     dword [esp+10H], eax                    ; 25EA _ 89. 44 24, 10
        mov     dword [esp+14H], edi                    ; 25EE _ 89. 7C 24, 14
        call    showString                              ; 25F2 _ E8, FFFFF449
        mov     eax, dword [ebp-14H]                    ; 25F7 _ 8B. 45, EC
        add     eax, 16                                 ; 25FA _ 83. C0, 10
        mov     dword [ebp-14H], eax                    ; 25FD _ 89. 45, EC
        mov     eax, dword [ebp+8H]                     ; 2600 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2603 _ 8B. 40, 08
        mov     dword [esp], eax                        ; 2606 _ 89. 04 24
        call    intToHexStr                             ; 2609 _ E8, FFFFF2B2
        mov     dword [ebp-2CH], eax                    ; 260E _ 89. 45, D4
        mov     eax, dword [ebp+0CH]                    ; 2611 _ 8B. 45, 0C
        mov     ecx, dword [ebp+14H]                    ; 2614 _ 8B. 4D, 14
        mov     edx, dword [ebp-18H]                    ; 2617 _ 8B. 55, E8
        mov     esi, dword [ebp-14H]                    ; 261A _ 8B. 75, EC
        mov     ebx, dword [ebp+18H]                    ; 261D _ 8B. 5D, 18
        mov     edi, dword [ebp-2CH]                    ; 2620 _ 8B. 7D, D4
        mov     dword [esp], eax                        ; 2623 _ 89. 04 24
        mov     dword [esp+4H], ecx                     ; 2626 _ 89. 4C 24, 04
        mov     dword [esp+8H], edx                     ; 262A _ 89. 54 24, 08
        mov     dword [esp+0CH], esi                    ; 262E _ 89. 74 24, 0C
        movsx   eax, bl                                 ; 2632 _ 0F BE. C3
        mov     dword [esp+10H], eax                    ; 2635 _ 89. 44 24, 10
        mov     dword [esp+14H], edi                    ; 2639 _ 89. 7C 24, 14
        call    showString                              ; 263D _ E8, FFFFF3FE
        mov     eax, dword [ebp-14H]                    ; 2642 _ 8B. 45, EC
        add     eax, 16                                 ; 2645 _ 83. C0, 10
        mov     dword [ebp-14H], eax                    ; 2648 _ 89. 45, EC
        mov     eax, dword [ebp+8H]                     ; 264B _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 264E _ 8B. 40, 0C
        mov     dword [esp], eax                        ; 2651 _ 89. 04 24
        call    intToHexStr                             ; 2654 _ E8, FFFFF267
        mov     dword [ebp-30H], eax                    ; 2659 _ 89. 45, D0
        mov     eax, dword [ebp+0CH]                    ; 265C _ 8B. 45, 0C
        mov     ecx, dword [ebp+14H]                    ; 265F _ 8B. 4D, 14
        mov     edx, dword [ebp-18H]                    ; 2662 _ 8B. 55, E8
        mov     esi, dword [ebp-14H]                    ; 2665 _ 8B. 75, EC
        mov     ebx, dword [ebp+18H]                    ; 2668 _ 8B. 5D, 18
        mov     edi, dword [ebp-30H]                    ; 266B _ 8B. 7D, D0
        mov     dword [esp], eax                        ; 266E _ 89. 04 24
        mov     dword [esp+4H], ecx                     ; 2671 _ 89. 4C 24, 04
        mov     dword [esp+8H], edx                     ; 2675 _ 89. 54 24, 08
        mov     dword [esp+0CH], esi                    ; 2679 _ 89. 74 24, 0C
        movsx   eax, bl                                 ; 267D _ 0F BE. C3
        mov     dword [esp+10H], eax                    ; 2680 _ 89. 44 24, 10
        mov     dword [esp+14H], edi                    ; 2684 _ 89. 7C 24, 14
        call    showString                              ; 2688 _ E8, FFFFF3B3
        mov     eax, dword [ebp-14H]                    ; 268D _ 8B. 45, EC
        add     eax, 16                                 ; 2690 _ 83. C0, 10
        mov     dword [ebp-14H], eax                    ; 2693 _ 89. 45, EC
        mov     eax, dword [ebp+8H]                     ; 2696 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2699 _ 8B. 40, 10
        mov     dword [esp], eax                        ; 269C _ 89. 04 24
        call    intToHexStr                             ; 269F _ E8, FFFFF21C
        mov     dword [ebp-34H], eax                    ; 26A4 _ 89. 45, CC
        mov     eax, dword [ebp+0CH]                    ; 26A7 _ 8B. 45, 0C
        mov     ecx, dword [ebp+14H]                    ; 26AA _ 8B. 4D, 14
        mov     edx, dword [ebp-18H]                    ; 26AD _ 8B. 55, E8
        mov     esi, dword [ebp-14H]                    ; 26B0 _ 8B. 75, EC
        mov     ebx, dword [ebp+18H]                    ; 26B3 _ 8B. 5D, 18
        mov     edi, dword [ebp-34H]                    ; 26B6 _ 8B. 7D, CC
        mov     dword [esp], eax                        ; 26B9 _ 89. 04 24
        mov     dword [esp+4H], ecx                     ; 26BC _ 89. 4C 24, 04
        mov     dword [esp+8H], edx                     ; 26C0 _ 89. 54 24, 08
        mov     dword [esp+0CH], esi                    ; 26C4 _ 89. 74 24, 0C
        movsx   eax, bl                                 ; 26C8 _ 0F BE. C3
        mov     dword [esp+10H], eax                    ; 26CB _ 89. 44 24, 10
        mov     dword [esp+14H], edi                    ; 26CF _ 89. 7C 24, 14
        call    showString                              ; 26D3 _ E8, FFFFF368
        add     esp, 108                                ; 26D8 _ 83. C4, 6C
        pop     esi                                     ; 26DB _ 5E
        pop     edi                                     ; 26DC _ 5F
        pop     ebx                                     ; 26DD _ 5B
        pop     ebp                                     ; 26DE _ 5D
        ret                                             ; 26DF _ C3
; showMemoryInfo End of function

sheet_refreshsub:; Function begin
        push    ebp                                     ; 26E0 _ 55
        mov     ebp, esp                                ; 26E1 _ 89. E5
        push    ebx                                     ; 26E3 _ 53
        push    edi                                     ; 26E4 _ 57
        push    esi                                     ; 26E5 _ 56
        sub     esp, 60                                 ; 26E6 _ 83. EC, 3C
        mov     eax, dword [ebp+1CH]                    ; 26E9 _ 8B. 45, 1C
        mov     ecx, dword [ebp+18H]                    ; 26EC _ 8B. 4D, 18
        mov     edx, dword [ebp+14H]                    ; 26EF _ 8B. 55, 14
        mov     esi, dword [ebp+10H]                    ; 26F2 _ 8B. 75, 10
        mov     edi, dword [ebp+0CH]                    ; 26F5 _ 8B. 7D, 0C
        mov     ebx, dword [ebp+8H]                     ; 26F8 _ 8B. 5D, 08
        mov     dword [ebp-34H], eax                    ; 26FB _ 89. 45, CC
        mov     eax, dword [ebp+8H]                     ; 26FE _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 2701 _ 8B. 00
        mov     dword [ebp-2CH], eax                    ; 2703 _ 89. 45, D4
        mov     eax, dword [ebp+1CH]                    ; 2706 _ 8B. 45, 1C
        mov     dword [ebp-10H], eax                    ; 2709 _ 89. 45, F0
        mov     dword [ebp-38H], ecx                    ; 270C _ 89. 4D, C8
        mov     dword [ebp-3CH], edx                    ; 270F _ 89. 55, C4
        mov     dword [ebp-40H], esi                    ; 2712 _ 89. 75, C0
        mov     dword [ebp-44H], edi                    ; 2715 _ 89. 7D, BC
        mov     dword [ebp-48H], ebx                    ; 2718 _ 89. 5D, B8
?_137:  mov     eax, dword [ebp-10H]                    ; 271B _ 8B. 45, F0
        mov     ecx, dword [ebp+8H]                     ; 271E _ 8B. 4D, 08
        cmp     eax, dword [ecx+0CH]                    ; 2721 _ 3B. 41, 0C
        jg      ?_147                                   ; 2724 _ 0F 8F, 00000103
        mov     eax, dword [ebp+8H]                     ; 272A _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 272D _ 8B. 4D, F0
        mov     eax, dword [eax+ecx*4+10H]              ; 2730 _ 8B. 44 88, 10
        mov     dword [ebp-30H], eax                    ; 2734 _ 89. 45, D0
        mov     eax, dword [ebp-30H]                    ; 2737 _ 8B. 45, D0
        mov     eax, dword [eax]                        ; 273A _ 8B. 00
        mov     dword [ebp-24H], eax                    ; 273C _ 89. 45, DC
        mov     dword [ebp-18H], 0                      ; 273F _ C7. 45, E8, 00000000
?_138:  mov     eax, dword [ebp-18H]                    ; 2746 _ 8B. 45, E8
        mov     ecx, dword [ebp-30H]                    ; 2749 _ 8B. 4D, D0
        cmp     eax, dword [ecx+8H]                     ; 274C _ 3B. 41, 08
        jge     ?_145                                   ; 274F _ 0F 8D, 000000C5
        mov     eax, dword [ebp-30H]                    ; 2755 _ 8B. 45, D0
        mov     eax, dword [eax+10H]                    ; 2758 _ 8B. 40, 10
        add     eax, dword [ebp-18H]                    ; 275B _ 03. 45, E8
        mov     dword [ebp-20H], eax                    ; 275E _ 89. 45, E0
        mov     dword [ebp-14H], 0                      ; 2761 _ C7. 45, EC, 00000000
?_139:  mov     eax, dword [ebp-14H]                    ; 2768 _ 8B. 45, EC
        mov     ecx, dword [ebp-30H]                    ; 276B _ 8B. 4D, D0
        cmp     eax, dword [ecx+4H]                     ; 276E _ 3B. 41, 04
        jge     ?_143                                   ; 2771 _ 0F 8D, 00000090
        mov     eax, dword [ebp-30H]                    ; 2777 _ 8B. 45, D0
        mov     eax, dword [eax+0CH]                    ; 277A _ 8B. 40, 0C
        add     eax, dword [ebp-14H]                    ; 277D _ 03. 45, EC
        mov     dword [ebp-1CH], eax                    ; 2780 _ 89. 45, E4
        mov     eax, dword [ebp+0CH]                    ; 2783 _ 8B. 45, 0C
        cmp     eax, dword [ebp-1CH]                    ; 2786 _ 3B. 45, E4
; Note: Immediate operand could be made smaller by sign extension
        jg      ?_141                                   ; 2789 _ 0F 8F, 00000065
        mov     eax, dword [ebp-1CH]                    ; 278F _ 8B. 45, E4
        cmp     eax, dword [ebp+14H]                    ; 2792 _ 3B. 45, 14
; Note: Immediate operand could be made smaller by sign extension
        jge     ?_141                                   ; 2795 _ 0F 8D, 00000059
        mov     eax, dword [ebp+10H]                    ; 279B _ 8B. 45, 10
        cmp     eax, dword [ebp-20H]                    ; 279E _ 3B. 45, E0
; Note: Immediate operand could be made smaller by sign extension
        jg      ?_141                                   ; 27A1 _ 0F 8F, 0000004D
        mov     eax, dword [ebp-20H]                    ; 27A7 _ 8B. 45, E0
        cmp     eax, dword [ebp+18H]                    ; 27AA _ 3B. 45, 18
; Note: Immediate operand could be made smaller by sign extension
        jge     ?_141                                   ; 27AD _ 0F 8D, 00000041
        mov     eax, dword [ebp-24H]                    ; 27B3 _ 8B. 45, DC
        mov     ecx, dword [ebp-18H]                    ; 27B6 _ 8B. 4D, E8
        mov     edx, dword [ebp-30H]                    ; 27B9 _ 8B. 55, D0
        imul    ecx, dword [edx+4H]                     ; 27BC _ 0F AF. 4A, 04
        add     ecx, dword [ebp-14H]                    ; 27C0 _ 03. 4D, EC
        mov     bl, byte [eax+ecx]                      ; 27C3 _ 8A. 1C 08
        mov     byte [ebp-25H], bl                      ; 27C6 _ 88. 5D, DB
        movzx   eax, byte [ebp-25H]                     ; 27C9 _ 0F B6. 45, DB
        mov     ecx, dword [ebp-30H]                    ; 27CD _ 8B. 4D, D0
        cmp     eax, dword [ecx+14H]                    ; 27D0 _ 3B. 41, 14
; Note: Immediate operand could be made smaller by sign extension
        je      ?_140                                   ; 27D3 _ 0F 84, 00000016
        mov     al, byte [ebp-25H]                      ; 27D9 _ 8A. 45, DB
        mov     ecx, dword [ebp-2CH]                    ; 27DC _ 8B. 4D, D4
        mov     edx, dword [ebp-20H]                    ; 27DF _ 8B. 55, E0
        mov     esi, dword [ebp+8H]                     ; 27E2 _ 8B. 75, 08
        imul    edx, dword [esi+4H]                     ; 27E5 _ 0F AF. 56, 04
        add     edx, dword [ebp-1CH]                    ; 27E9 _ 03. 55, E4
        mov     byte [ecx+edx], al                      ; 27EC _ 88. 04 11
?_140:
; Note: Immediate operand could be made smaller by sign extension
        jmp     ?_141                                   ; 27EF _ E9, 00000000

?_141:
; Note: Immediate operand could be made smaller by sign extension
        jmp     ?_142                                   ; 27F4 _ E9, 00000000

?_142:  mov     eax, dword [ebp-14H]                    ; 27F9 _ 8B. 45, EC
        add     eax, 1                                  ; 27FC _ 83. C0, 01
        mov     dword [ebp-14H], eax                    ; 27FF _ 89. 45, EC
        jmp     ?_139                                   ; 2802 _ E9, FFFFFF61

?_143:
; Note: Immediate operand could be made smaller by sign extension
        jmp     ?_144                                   ; 2807 _ E9, 00000000

?_144:  mov     eax, dword [ebp-18H]                    ; 280C _ 8B. 45, E8
        add     eax, 1                                  ; 280F _ 83. C0, 01
        mov     dword [ebp-18H], eax                    ; 2812 _ 89. 45, E8
        jmp     ?_138                                   ; 2815 _ E9, FFFFFF2C

?_145:
; Note: Immediate operand could be made smaller by sign extension
        jmp     ?_146                                   ; 281A _ E9, 00000000

?_146:  mov     eax, dword [ebp-10H]                    ; 281F _ 8B. 45, F0
        add     eax, 1                                  ; 2822 _ 83. C0, 01
        mov     dword [ebp-10H], eax                    ; 2825 _ 89. 45, F0
        jmp     ?_137                                   ; 2828 _ E9, FFFFFEEE

?_147:  add     esp, 60                                 ; 282D _ 83. C4, 3C
        pop     esi                                     ; 2830 _ 5E
        pop     edi                                     ; 2831 _ 5F
        pop     ebx                                     ; 2832 _ 5B
        pop     ebp                                     ; 2833 _ 5D
        ret                                             ; 2834 _ C3
; sheet_refreshsub End of function


SECTION .bss    align=4 noexecute                       ; section number 2, bss

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

CMain.counter:                                          ; dword
        resd    1                                       ; 0144

intToHexStr.str:                                        ; byte
        resb    1                                       ; 0148

?_150:  resb    9                                       ; 0149

?_151:  resb    2                                       ; 0152

show_key_info.showXPos:                                 ; dword
        resd    1                                       ; 0154

show_mouse_info.showXPos:                               ; dword
        resd    1                                       ; 0158


SECTION .data   align=4 noexecute                       ; section number 3, data

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


