;-------------------------------------------------------------------------------
; MSP430 Assembler Code Template for use with TI Code Composer Studio
;
;
;-------------------------------------------------------------------------------
            .cdecls C,LIST,"msp430.h"       ; Include device header file
            
;-------------------------------------------------------------------------------
            .def    RESET                   ; Export program entry-point to
                                            ; make it known to linker.
;-------------------------------------------------------------------------------
            .data
DISP 		.byte 0x7E, 0x30, 0x6D, 0x79
			.byte 0x33, 0x5B, 0x5F, 0x70
			.byte 0x7F, 0x73, 0x77, 0x1F
			.byte 0x4E, 0x3D, 0x4F, 0x47
			.text
            .retain                         ; Override ELF conditional linking
                                            ; and retain current section.
            .retainrefs                     ; And retain any sections that have
                                            ; references to current section.

;-------------------------------------------------------------------------------
RESET       mov.w   #__STACK_END,SP         ; Initialize stackpointer
StopWDT     mov.w   #WDTPW|WDTHOLD,&WDTCTL  ; Stop watchdog timer


;-------------------------------------------------------------------------------
; Main loop here
;-------------------------------------------------------------------------------

	bic.b #01111111b, &P1SEL
	bic.b #01111111b, &P1SEL2
	bis.b #01111111b, &P1DIR

	bic.b #01111111b, &P2SEL
	bic.b #01111111b, &P2SEL2
	bis.b #01111111b, &P2DIR

	mov.b #0, r4
	mov.b #0, r6
loopA:
	cmp.b #16, r4
	jl dispA
	mov.b #0, r4
dispA:
	bic.b #01111111b, &P2OUT
	bis.b DISP(r4), &P2OUT
loopB:
	cmp.b #16, r6
	jl dispB
	mov.b #0, r6
	jmp cont
dispB:
	bic.b #01111111b, &P1OUT
	bis.b DISP(r6), &P1OUT
	call #Delay
	add.b #1, r6
	jmp loopB
cont:
	add.b #1, r4
	jmp loopA

Delay:
	push r5
    mov.w #0, r5
dloop:
	push r7
	push r7
	pop r7
	pop r7
	add.w #1, r5
	jne dloop
	pop r5
	ret







;-------------------------------------------------------------------------------
; Stack Pointer definition
;-------------------------------------------------------------------------------
            .global __STACK_END
            .sect   .stack
            
;-------------------------------------------------------------------------------
; Interrupt Vectors
;-------------------------------------------------------------------------------
            .sect   ".reset"                ; MSP430 RESET Vector
            .short  RESET
            
