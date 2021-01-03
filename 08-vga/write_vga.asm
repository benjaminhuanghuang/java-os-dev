; Disassembly of file: write_vga.o
; Sat Sep  7 21:55:43 2019
; Mode: 32 bits
; Syntax: YASM/NASM
; Instruction set: 80386


;;;global CMain: function

;;;extern io_hlt                                           ; near


;;;SECTION .text   align=1 execute                         ; section number 1, code

CMain:  ; Function begin
        push    ebp                                     ; 0000 _ 55
        mov     ebp, esp                                ; 0001 _ 89. E5
        sub     esp, 24                                 ; 0003 _ 83. EC, 18
        mov     dword [ebp-0CH], 0                      ; 0006 _ C7. 45, F4, 00000000
        mov     dword [ebp-10H], 655360                 ; 000D _ C7. 45, F0, 000A0000
        jmp     ?_002                                   ; 0014 _ EB, 14

?_001:  mov     eax, dword [ebp-10H]                    ; 0016 _ 8B. 45, F0
        mov     dword [ebp-0CH], eax                    ; 0019 _ 89. 45, F4
        mov     eax, dword [ebp-10H]                    ; 001C _ 8B. 45, F0
        mov     edx, eax                                ; 001F _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 0021 _ 8B. 45, F4
        mov     byte [eax], dl                          ; 0024 _ 88. 10
        add     dword [ebp-10H], 1                      ; 0026 _ 83. 45, F0, 01
?_002:  cmp     dword [ebp-10H], 720895                 ; 002A _ 81. 7D, F0, 000AFFFF
        jle     ?_001                                   ; 0031 _ 7E, E3
?_003:  call    io_hlt                                  ; 0033 _ E8, FFFFFFFC(rel)
        jmp     ?_003                                   ; 0038 _ EB, F9
; CMain End of function


;;;SECTION .data   align=1 noexecute                       ; section number 2, data


;;;SECTION .bss    align=1 noexecute                       ; section number 