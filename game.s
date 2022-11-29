	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"game.c"
	.text
	.align	2
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPlayer.part.0, %function
drawPlayer.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r1, .L3
	ldr	r3, [r1, #40]
	ldr	ip, [r1, #80]
	ldr	r2, [r1, #72]
	lsl	r3, r3, #23
	ldr	r0, .L3+4
	ldrb	r1, [r1, #36]	@ zero_extendqisi2
	lsr	r3, r3, #23
	add	r2, r2, ip, lsl #5
	orr	r3, r3, #16384
	lsl	r2, r2, #1
	strh	r3, [r0, #2]	@ movhi
	strh	r1, [r0]	@ movhi
	strh	r2, [r0, #4]	@ movhi
	bx	lr
.L4:
	.align	2
.L3:
	.word	pacMan
	.word	shadowOAM
	.size	drawPlayer.part.0, .-drawPlayer.part.0
	.align	2
	.global	initPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPlayer, %function
initPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L9
	ldr	r3, [r3]
	tst	r3, #1
	push	{r4, r5, r6, r7, lr}
	mov	r2, #0
	mov	ip, #16
	mov	r1, #1
	moveq	r7, #186
	movne	r7, #216
	mov	r6, #121
	mov	r5, #3
	mov	r0, #13
	mov	r4, #96
	mov	lr, #9
	ldr	r3, .L9+4
	str	r7, [r3, #44]
	str	r6, [r3, #48]
	str	r5, [r3, #84]
	str	ip, [r3, #60]
	str	ip, [r3, #64]
	str	r1, [r3, #52]
	str	r1, [r3, #56]
	ldr	ip, .L9+8
	str	r0, [r3, #8]
	str	r0, [r3, #4]
	ldr	r1, .L9+12
	str	r2, [r3, #68]
	str	r2, [r3, #80]
	str	r2, [r3, #72]
	ldr	r3, .L9+16
	str	r4, [r1]
	str	lr, [r3]
	str	r2, [ip]
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L10:
	.align	2
.L9:
	.word	.LANCHOR0
	.word	pacMan
	.word	toggleMovement
	.word	vOff
	.word	hOff
	.size	initPlayer, .-initPlayer
	.align	2
	.global	initGhosts
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGhosts, %function
initGhosts:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	lr, #0
	mov	r0, #70
	mov	ip, lr
	mov	r2, lr
	mov	r8, #16
	mov	r7, #14
	mov	r6, #1
	mov	r5, #2
	mov	r10, #180
	mov	r9, #112
	ldr	r1, .L22
	ldr	r3, .L22+4
	ldr	r4, [r1]
.L17:
	rsb	r1, r0, r0, lsl #4
	cmp	r4, #1
	str	r8, [r3, #64]
	str	r8, [r3, #60]
	str	r7, [r3, #4]
	str	r7, [r3, #8]
	str	r6, [r3, #52]
	str	r6, [r3, #56]
	str	ip, [r3, #20]
	strle	lr, [r3, #24]
	sub	r1, r1, #1040
	ble	.L13
	cmp	r4, #2
	sub	r1, r1, #10
	beq	.L20
	cmp	r4, #4
	ble	.L21
	cmp	r4, #8
	str	r2, [r3, #24]
	strgt	r5, [r3, #52]
	strgt	r5, [r3, #56]
.L13:
	add	ip, ip, #1
	cmp	ip, #4
	str	r0, [r3, #48]
	str	r2, [r3, #12]
	str	r9, [r3, #44]
	str	r2, [r3, #68]
	str	r2, [r3, #80]
	str	r5, [r3, #84]
	str	r2, [r3, #72]
	str	r2, [r3]
	str	r2, [r3, #32]
	str	r2, [r3, #16]
	str	r2, [r3, #28]
	str	r2, [r3, #88]
	add	r0, r0, #20
	add	r3, r3, #92
	add	lr, lr, #420
	bne	.L17
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L21:
	mul	r1, r10, ip
.L20:
	str	r1, [r3, #24]
	b	.L13
.L23:
	.align	2
.L22:
	.word	.LANCHOR0
	.word	ghosts
	.size	initGhosts, .-initGhosts
	.global	__aeabi_uidivmod
	.global	__aeabi_idivmod
	.align	2
	.global	initPellets
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPellets, %function
initPellets:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r3, .L92
	ldr	r4, [r3]
	ands	r4, r4, #1
	bne	.L25
	mov	r7, #8
	mov	fp, r4
	mov	r6, #3
	mov	r10, #238
	mov	r9, #198
	ldr	r5, .L92+4
	ldr	r8, .L92+8
	b	.L42
.L26:
	sub	r3, r4, #5
	cmp	r3, #4
	bls	.L67
	sub	r3, r4, #10
	cmp	r3, #4
	bls	.L68
.L27:
	sub	r3, r4, #15
	cmp	r3, #4
	bls	.L69
.L29:
	sub	r3, r4, #20
	cmp	r3, #4
	bls	.L70
.L30:
	sub	r3, r4, #25
	cmp	r3, #4
	bls	.L71
.L31:
	sub	r3, r4, #30
	cmp	r3, #9
	bls	.L72
.L32:
	sub	r3, r4, #40
	cmp	r3, #4
	bls	.L73
.L33:
	sub	r3, r4, #45
	cmp	r3, #9
	bls	.L74
.L34:
	sub	r3, r4, #55
	cmp	r3, #4
	bls	.L75
.L35:
	sub	r3, r4, #60
	cmp	r3, #4
	bls	.L76
.L36:
	sub	r3, r4, #65
	cmp	r3, #4
	movls	r1, #65
	strls	r9, [r5, #44]
	bls	.L66
.L37:
	sub	r3, r4, #70
	cmp	r3, #4
	bls	.L77
.L38:
	sub	r3, r4, #75
	cmp	r3, #4
	bls	.L78
.L39:
	add	r4, r4, #1
	cmp	r4, #80
	str	fp, [r5, #88]
	add	r5, r5, #92
	beq	.L24
.L42:
	cmp	r4, #4
	str	r7, [r5, #64]
	str	r7, [r5, #60]
	str	r6, [r5, #4]
	str	r6, [r5, #8]
	bgt	.L26
	mov	r2, #14
	lsl	r3, r4, #3
	add	r3, r3, #22
	str	r3, [r5, #48]
	str	r2, [r5, #44]
	b	.L27
.L24:
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L25:
	mov	r4, #0
	mov	r7, #8
	mov	fp, r4
	mov	r6, #3
	mov	r9, #235
	mov	r10, #238
	ldr	r5, .L92+4
	ldr	r8, .L92+8
	b	.L58
.L43:
	sub	r3, r4, #5
	cmp	r3, #4
	bls	.L79
	sub	r3, r4, #10
	cmp	r3, #4
	bls	.L80
.L44:
	sub	r3, r4, #15
	cmp	r3, #4
	bls	.L81
.L46:
	sub	r3, r4, #20
	cmp	r3, #4
	bls	.L82
.L47:
	sub	r3, r4, #25
	cmp	r3, #4
	bls	.L83
.L48:
	sub	r3, r4, #30
	cmp	r3, #9
	bls	.L84
.L49:
	sub	r3, r4, #40
	cmp	r3, #4
	bls	.L85
.L50:
	sub	r3, r4, #45
	cmp	r3, #9
	bls	.L86
.L51:
	sub	r3, r4, #55
	cmp	r3, #4
	bls	.L87
.L52:
	sub	r3, r4, #60
	cmp	r3, #4
	bls	.L88
.L53:
	sub	r3, r4, #65
	cmp	r3, #4
	bls	.L89
.L54:
	sub	r3, r4, #70
	cmp	r3, #4
	bls	.L90
.L55:
	sub	r3, r4, #75
	cmp	r3, #4
	bls	.L91
.L56:
	add	r4, r4, #1
	cmp	r4, #80
	str	fp, [r5, #88]
	add	r5, r5, #92
	beq	.L24
.L58:
	cmp	r4, #4
	str	r7, [r5, #64]
	str	r7, [r5, #60]
	str	r6, [r5, #4]
	str	r6, [r5, #8]
	bgt	.L43
	mov	r2, #14
	lsl	r3, r4, #3
	add	r3, r3, #22
	str	r3, [r5, #48]
	str	r2, [r5, #44]
	b	.L44
.L67:
	mov	r3, #14
	mov	r1, #5
	str	r3, [r5, #44]
	mov	r0, r4
	mov	lr, pc
	bx	r8
	lsl	r3, r1, #3
	add	r3, r3, #194
	str	r3, [r5, #48]
	b	.L29
.L91:
	mov	r1, #75
	mov	r0, r4
	str	r9, [r5, #44]
	mov	lr, pc
	bx	r8
	lsl	r3, r1, #3
	add	r3, r3, #191
	str	r3, [r5, #48]
	b	.L56
.L90:
	mov	r0, r4
	str	r9, [r5, #44]
	mov	r1, #70
	mov	lr, pc
	bx	r8
	lsl	r3, r1, #3
	add	r3, r3, #30
	str	r3, [r5, #48]
	str	fp, [r5, #88]
	add	r4, r4, #1
	add	r5, r5, #92
	b	.L58
.L89:
	mov	r1, #65
	mov	r0, r4
	mov	lr, pc
	bx	r8
	lsl	r3, r1, #3
	add	r3, r3, #190
	str	r3, [r5, #44]
	str	r10, [r5, #48]
	b	.L56
.L88:
	mov	r1, #60
	mov	r0, r4
	mov	lr, pc
	bx	r8
	mov	r2, #12
	lsl	r3, r1, #3
	add	r3, r3, #190
	str	r3, [r5, #44]
	str	r2, [r5, #48]
	b	.L55
.L87:
	mov	r3, #148
	mov	r1, #55
	str	r3, [r5, #44]
	mov	r0, r4
	mov	lr, pc
	bx	r8
	lsl	r3, r1, #3
	add	r3, r3, #108
	str	r3, [r5, #48]
	b	.L54
.L86:
	mov	r1, #45
	mov	r0, r4
	mov	lr, pc
	bx	r8
	mov	r2, #212
	lsl	r3, r1, #3
	add	r3, r3, #67
	str	r3, [r5, #44]
	str	r2, [r5, #48]
	b	.L53
.L85:
	mov	r3, #94
	mov	r1, #40
	str	r3, [r5, #44]
	mov	r0, r4
	mov	lr, pc
	bx	r8
	lsl	r3, r1, #3
	add	r3, r3, #110
	str	r3, [r5, #48]
	b	.L52
.L84:
	mov	r1, #30
	mov	r0, r4
	mov	lr, pc
	bx	r8
	mov	r2, #36
	lsl	r3, r1, #3
	add	r3, r3, #67
	str	r3, [r5, #44]
	str	r2, [r5, #48]
	b	.L51
.L83:
	mov	r1, #25
	mov	r0, r4
	mov	lr, pc
	bx	r8
	mov	r2, #236
	lsl	r3, r1, #3
	add	r3, r3, #25
	str	r3, [r5, #44]
	str	r2, [r5, #48]
	b	.L50
.L82:
	mov	r1, #20
	mov	r0, r4
	mov	lr, pc
	bx	r8
	mov	r2, #180
	lsl	r3, r1, #3
	add	r3, r3, #25
	str	r3, [r5, #44]
	str	r2, [r5, #48]
	b	.L49
.L81:
	mov	r1, #15
	mov	r0, r4
	mov	lr, pc
	bx	r8
	mov	r2, #68
	lsl	r3, r1, #3
	add	r3, r3, #25
	str	r3, [r5, #44]
	str	r2, [r5, #48]
	b	.L48
.L80:
	mov	r1, #10
	mov	r0, r4
	mov	lr, pc
	bx	r8
	mov	r2, #12
	lsl	r3, r1, #3
	add	r3, r3, #25
	str	r3, [r5, #44]
	str	r2, [r5, #48]
	b	.L47
.L79:
	mov	r3, #14
	mov	r1, #5
	str	r3, [r5, #44]
	mov	r0, r4
	mov	lr, pc
	bx	r8
	lsl	r3, r1, #3
	add	r3, r3, #194
	str	r3, [r5, #48]
	b	.L46
.L78:
	mov	r1, #75
	str	r10, [r5, #44]
.L66:
	mov	r0, r4
	mov	lr, pc
	bx	r8
	lsl	r3, r1, #3
	add	r3, r3, #191
	str	r3, [r5, #48]
	b	.L39
.L77:
	mov	r0, r4
	str	r10, [r5, #44]
	mov	r1, #70
	mov	lr, pc
	bx	r8
	lsl	r3, r1, #3
	add	r3, r3, #30
	str	r3, [r5, #48]
	str	fp, [r5, #88]
	add	r4, r4, #1
	add	r5, r5, #92
	b	.L42
.L76:
	mov	r1, #60
	mov	r0, r4
	str	r9, [r5, #44]
	mov	lr, pc
	bx	r8
	lsl	r3, r1, #3
	add	r3, r3, #30
	str	r3, [r5, #48]
	b	.L38
.L75:
	mov	r1, #55
	mov	r0, r4
	mov	lr, pc
	bx	r8
	mov	r2, #124
	lsl	r3, r1, #3
	add	r3, r3, #154
	str	r3, [r5, #44]
	str	r2, [r5, #48]
	b	.L37
.L74:
	mov	r1, #45
	mov	r0, r4
	mov	lr, pc
	bx	r8
	mov	r2, #212
	lsl	r3, r1, #3
	add	r3, r3, #82
	str	r3, [r5, #44]
	str	r2, [r5, #48]
	b	.L36
.L73:
	mov	r3, #94
	mov	r1, #40
	str	r3, [r5, #44]
	mov	r0, r4
	mov	lr, pc
	bx	r8
	lsl	r3, r1, #3
	add	r3, r3, #111
	str	r3, [r5, #48]
	b	.L35
.L72:
	mov	r1, #30
	mov	r0, r4
	mov	lr, pc
	bx	r8
	mov	r2, #36
	lsl	r3, r1, #3
	add	r3, r3, #82
	str	r3, [r5, #44]
	str	r2, [r5, #48]
	b	.L34
.L71:
	mov	r1, #25
	mov	r0, r4
	mov	lr, pc
	bx	r8
	mov	r2, #236
	lsl	r3, r1, #3
	add	r3, r3, #25
	str	r3, [r5, #44]
	str	r2, [r5, #48]
	b	.L33
.L70:
	mov	r1, #20
	mov	r0, r4
	mov	lr, pc
	bx	r8
	mov	r2, #196
	lsl	r3, r1, #3
	add	r3, r3, #25
	str	r3, [r5, #44]
	str	r2, [r5, #48]
	b	.L32
.L69:
	mov	r1, #15
	mov	r0, r4
	mov	lr, pc
	bx	r8
	mov	r2, #52
	lsl	r3, r1, #3
	add	r3, r3, #25
	str	r3, [r5, #44]
	str	r2, [r5, #48]
	b	.L31
.L68:
	mov	r1, #10
	mov	r0, r4
	mov	lr, pc
	bx	r8
	mov	r2, #12
	lsl	r3, r1, #3
	add	r3, r3, #25
	str	r3, [r5, #44]
	str	r2, [r5, #48]
	b	.L30
.L93:
	.align	2
.L92:
	.word	.LANCHOR0
	.word	pellets
	.word	__aeabi_idivmod
	.size	initPellets, .-initPellets
	.align	2
	.global	initPowerPellets
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPowerPellets, %function
initPowerPellets:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r2, #8
	mov	r1, #0
	mov	r0, #13
	mov	lr, #234
	mov	r4, #12
	mov	ip, #235
	ldr	r3, .L96
	str	r4, [r3, #44]
	str	lr, [r3, #140]
	str	lr, [r3, #324]
	str	r2, [r3, #64]
	str	r2, [r3, #60]
	str	r2, [r3, #4]
	str	r2, [r3, #8]
	str	r2, [r3, #156]
	str	r2, [r3, #152]
	str	r2, [r3, #96]
	str	r2, [r3, #100]
	str	r2, [r3, #248]
	str	r2, [r3, #244]
	str	r2, [r3, #188]
	str	r2, [r3, #192]
	str	r2, [r3, #340]
	str	r2, [r3, #336]
	str	r2, [r3, #280]
	str	r2, [r3, #284]
	str	r1, [r3, #88]
	str	r1, [r3, #180]
	str	r1, [r3, #272]
	str	r1, [r3, #364]
	str	r0, [r3, #48]
	str	r0, [r3, #136]
	str	r0, [r3, #232]
	str	ip, [r3, #228]
	str	ip, [r3, #320]
	pop	{r4, lr}
	bx	lr
.L97:
	.align	2
.L96:
	.word	powerPellets
	.size	initPowerPellets, .-initPowerPellets
	.align	2
	.global	initText
	.syntax unified
	.arm
	.fpu softvfp
	.type	initText, %function
initText:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #0
	mov	r0, #10
	ldr	r2, .L106
	b	.L103
.L101:
	lsl	r1, r3, #3
	add	r1, r1, #50
	str	r1, [r2, #40]
.L100:
	add	r3, r3, #1
	add	r2, r2, #92
.L103:
	cmp	r3, #4
	lsl	r1, r3, #3
	addls	r1, r1, #10
	strls	r0, [r2, #36]
	strls	r1, [r2, #40]
	bls	.L100
	cmp	r3, #8
	str	r0, [r2, #36]
	add	r1, r1, #55
	ble	.L101
	cmp	r3, #13
	str	r1, [r2, #40]
	bne	.L100
	bx	lr
.L107:
	.align	2
.L106:
	.word	text
	.size	initText, .-initText
	.align	2
	.global	initGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, #96
	mov	r0, #9
	push	{r4, r5, r6, lr}
	mov	r4, #0
	mov	r1, #80
	ldr	r2, .L116
	str	ip, [r2]
	ldr	r2, .L116+4
	str	r0, [r2]
	ldr	r2, .L116+8
	ldr	r5, .L116+12
	str	r4, [r2]
	ldr	r0, .L116+16
	ldr	r2, .L116+20
	ldr	r3, [r5]
	str	r4, [r0]
	str	r4, [r2]
	ldr	r0, .L116+24
	ldr	r2, .L116+28
	cmp	r3, #1
	str	r4, [r0]
	str	r1, [r2]
	beq	.L115
.L109:
	tst	r3, #1
	ldreq	r2, .L116+32
	ldreq	r3, .L116+36
	ldrne	r2, .L116+40
	ldrne	r3, .L116+44
	stmib	r5, {r2, r3}
	bl	initPlayer
	bl	initGhosts
	bl	initPellets
	pop	{r4, r5, r6, lr}
	b	initPowerPellets
.L115:
	bl	initText
	mov	r1, #20
	mov	ip, #26
	mov	r2, #100
	ldr	r3, .L116+48
	mov	r0, r1
	str	r1, [r3, #36]
	str	ip, [r3, #40]
	ldr	r1, .L116+52
	ldr	r3, .L116+56
.L110:
	str	r2, [r3, #40]
	add	r2, r2, #8
	cmp	r2, #156
	str	r0, [r3, #36]
	str	r4, [r1], #4
	add	r3, r3, #92
	bne	.L110
	mov	r1, #3
	ldr	r2, .L116+60
	ldr	r3, [r5]
	str	r1, [r2]
	b	.L109
.L117:
	.align	2
.L116:
	.word	vOff
	.word	hOff
	.word	ghostMulti
	.word	.LANCHOR0
	.word	poweredUp
	.word	powerTimer
	.word	toggleMovement
	.word	pelletCount
	.word	playerCollisionmap2Bitmap
	.word	enemyCollisionmap2Bitmap
	.word	playerCollisionmap1Bitmap
	.word	enemyCollisionmap1Bitmap
	.word	lives
	.word	scoreDigits
	.word	score
	.word	pacLives
	.size	initGame, .-initGame
	.align	2
	.global	initLives
	.syntax unified
	.arm
	.fpu softvfp
	.type	initLives, %function
initLives:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r1, #20
	mov	r2, #26
	ldr	r3, .L119
	str	r1, [r3, #36]
	str	r2, [r3, #40]
	bx	lr
.L120:
	.align	2
.L119:
	.word	lives
	.size	initLives, .-initLives
	.align	2
	.global	initScore
	.syntax unified
	.arm
	.fpu softvfp
	.type	initScore, %function
initScore:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #100
	mov	ip, #20
	mov	r0, #0
	ldr	r3, .L125
	ldr	r1, .L125+4
.L122:
	str	r2, [r3, #40]
	add	r2, r2, #8
	cmp	r2, #156
	str	ip, [r3, #36]
	str	r0, [r1], #4
	add	r3, r3, #92
	bne	.L122
	bx	lr
.L126:
	.align	2
.L125:
	.word	score
	.word	scoreDigits
	.size	initScore, .-initScore
	.align	2
	.global	drawScore
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawScore, %function
drawScore:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L133
	push	{r4, r5, lr}
	ldr	r1, [r2, #40]
	ldr	r4, .L133+4
	ldr	r3, .L133+8
	ldrb	r0, [r2, #36]	@ zero_extendqisi2
	ldr	ip, .L133+12
	and	r1, r1, r4
	strh	r1, [r3, #2]	@ movhi
	strh	r0, [r3]	@ movhi
	add	r5, ip, #24
	add	r3, r3, #4
.L128:
	ldr	r0, [ip, #4]!
	ldr	r1, [r2, #132]
	ldrb	lr, [r2, #128]	@ zero_extendqisi2
	add	r0, r0, #72
	and	r1, r1, r4
	cmp	ip, r5
	strh	r0, [r3]	@ movhi
	strh	r1, [r3, #6]	@ movhi
	strh	lr, [r3, #4]	@ movhi
	add	r2, r2, #92
	add	r3, r3, #8
	bne	.L128
	mov	r2, #72
	ldr	r3, .L133+16
	pop	{r4, r5, lr}
	strh	r2, [r3]	@ movhi
	bx	lr
.L134:
	.align	2
.L133:
	.word	score
	.word	511
	.word	shadowOAM+840
	.word	scoreDigits-4
	.word	shadowOAM+892
	.size	drawScore, .-drawScore
	.align	2
	.global	drawLives
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawLives, %function
drawLives:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L141
	ldr	r1, .L141+4
	ldr	r3, [r2, #40]
	ldr	r1, [r1]
	ldrb	r0, [r2, #36]	@ zero_extendqisi2
	lsl	r3, r3, #23
	ldr	r2, .L141+8
	lsr	r3, r3, #23
	cmp	r1, #3
	strh	r3, [r2, #2]	@ movhi
	strh	r0, [r2]	@ movhi
	beq	.L139
	cmp	r1, #2
	beq	.L140
	cmp	r1, #1
	moveq	r3, #73
	strheq	r3, [r2, #4]	@ movhi
	bx	lr
.L140:
	mov	r3, #74
	strh	r3, [r2, #4]	@ movhi
	bx	lr
.L139:
	mov	r3, #75
	strh	r3, [r2, #4]	@ movhi
	bx	lr
.L142:
	.align	2
.L141:
	.word	lives
	.word	pacLives
	.word	shadowOAM+832
	.size	drawLives, .-drawLives
	.align	2
	.global	drawText
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawText, %function
drawText:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r2, #0
	ldr	r0, .L149
	ldr	r3, .L149+4
	ldr	r4, .L149+8
	b	.L147
.L145:
	add	r2, r2, #1
	add	r0, r0, #92
	add	r3, r3, #8
.L147:
	ldr	r1, [r0, #40]
	cmp	r2, #4
	and	r1, r1, r4
	ldrb	ip, [r0, #36]	@ zero_extendqisi2
	strh	r1, [r3, #2]	@ movhi
	addls	r1, r2, #40
	strh	ip, [r3]	@ movhi
	strhls	r1, [r3, #4]	@ movhi
	add	lr, r2, #3
	bls	.L145
	cmp	r2, #13
	strh	lr, [r3, #4]	@ movhi
	bne	.L145
	pop	{r4, lr}
	bx	lr
.L150:
	.align	2
.L149:
	.word	text
	.word	shadowOAM+712
	.word	511
	.size	drawText, .-drawText
	.align	2
	.global	updatePowerPellet
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePowerPellet, %function
updatePowerPellet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r3, .L168
	ldmib	r3, {r5, r6}
	ldr	lr, [r3, #44]
	ldr	ip, [r3, #48]
	sub	sp, sp, #16
	ldmib	r0, {r2, r3}
	ldr	r1, [r0, #44]
	mov	r4, r0
	ldr	r0, [r0, #48]
	str	r5, [sp, #8]
	stm	sp, {ip, lr}
	str	r6, [sp, #12]
	ldr	r5, .L168+4
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	beq	.L152
	ldr	r3, [r4, #88]
	cmp	r3, #1
	beq	.L152
	ldr	r3, .L168+8
	ldr	r3, [r3]
	mov	r6, #1
	cmp	r3, #4
	mov	ip, #0
	ldr	lr, .L168+12
	movgt	lr, #1000
	ldr	r2, .L168+16
	ldr	r3, .L168+20
	ldr	r5, [r2, #20]
	ldr	r1, .L168+24
	movle	r1, r3
	add	r3, r5, #5
	str	r3, [r2, #20]
	cmp	r3, #9
	ldr	r3, .L168+28
	ldr	r0, .L168+32
	str	r6, [r3]
	ldr	r3, .L168+36
	str	r6, [r4, #88]
	str	lr, [r0]
	str	ip, [r3, #28]
	str	ip, [r3, #120]
	str	ip, [r3, #212]
	str	ip, [r3, #304]
	ble	.L156
	ldr	r3, [r2, #16]
	add	ip, r3, r6
	sub	r5, r5, #5
	cmp	ip, #9
	str	r5, [r2, #20]
	str	ip, [r2, #16]
	ble	.L156
	ldr	ip, [r2, #12]
	add	lr, ip, r6
	sub	r3, r3, #9
	cmp	lr, #9
	str	r3, [r2, #16]
	str	lr, [r2, #12]
	ble	.L156
	ldr	r3, [r2, #8]
	add	lr, r3, r6
	sub	ip, ip, #9
	cmp	lr, #9
	str	ip, [r2, #12]
	str	lr, [r2, #8]
	ble	.L156
	ldr	ip, [r2, #4]
	add	lr, ip, r6
	sub	r3, r3, #9
	cmp	lr, #9
	str	r3, [r2, #8]
	str	lr, [r2, #4]
	ble	.L156
	ldr	r3, [r2]
	cmp	r3, #9
	addne	r3, r3, r6
	subne	ip, ip, #9
	stmne	r2, {r3, ip}
	b	.L156
.L152:
	ldr	r0, .L168+32
	ldr	r3, [r0]
	cmp	r3, #0
	movle	r2, #0
	sub	r1, r3, #1
	ldrle	r3, .L168+28
	strle	r2, [r3]
.L156:
	ldr	r2, .L168+40
	ldr	r3, .L168+44
	ldr	ip, [r2]
	ldr	r3, [r3]
	ldr	r2, [r4, #44]
	sub	r2, r2, r3
	ldr	r3, [r4, #48]
	sub	r3, r3, ip
	str	r1, [r0]
	str	r2, [r4, #36]
	str	r3, [r4, #40]
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L169:
	.align	2
.L168:
	.word	pacMan
	.word	collision
	.word	.LANCHOR0
	.word	1620
	.word	scoreDigits
	.word	1619
	.word	999
	.word	poweredUp
	.word	powerTimer
	.word	ghosts
	.word	hOff
	.word	vOff
	.size	updatePowerPellet, .-updatePowerPellet
	.align	2
	.global	drawPowerPellets
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPowerPellets, %function
drawPowerPellets:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L176
	push	{r4, lr}
	ldr	r2, .L176+4
	ldr	r4, .L176+8
	ldr	lr, .L176+12
	add	r0, r3, #368
.L173:
	ldr	r1, [r3, #88]
	cmp	r1, #0
	ldrhne	r1, [r2]
	ldreq	r1, [r3, #40]
	ldrbeq	ip, [r3, #36]	@ zero_extendqisi2
	orrne	r1, r1, #512
	andeq	r1, r1, r4
	add	r3, r3, #92
	strhne	r1, [r2]	@ movhi
	strheq	lr, [r2, #4]	@ movhi
	strheq	r1, [r2, #2]	@ movhi
	strheq	ip, [r2]	@ movhi
	cmp	r3, r0
	add	r2, r2, #8
	bne	.L173
	pop	{r4, lr}
	bx	lr
.L177:
	.align	2
.L176:
	.word	powerPellets
	.word	shadowOAM+680
	.word	511
	.word	833
	.size	drawPowerPellets, .-drawPowerPellets
	.align	2
	.global	updatePellet
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePellet, %function
updatePellet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r3, .L194
	ldmib	r3, {r5, r6}
	ldr	lr, [r3, #44]
	ldr	ip, [r3, #48]
	sub	sp, sp, #16
	ldmib	r0, {r2, r3}
	ldr	r1, [r0, #44]
	mov	r4, r0
	ldr	r0, [r0, #48]
	str	r5, [sp, #8]
	stm	sp, {ip, lr}
	str	r6, [sp, #12]
	ldr	r5, .L194+4
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	beq	.L179
	ldr	r3, [r4, #88]
	cmp	r3, #1
	beq	.L179
	ldr	r2, .L194+8
	ldr	r3, [r2, #20]
	add	r3, r3, #1
	cmp	r3, #10
	str	r3, [r2, #20]
	beq	.L193
.L181:
	mov	r1, #1
	ldr	r2, .L194+12
	ldr	r3, [r2]
	sub	r3, r3, #1
	str	r3, [r2]
	str	r1, [r4, #88]
.L179:
	ldr	r2, .L194+16
	ldr	r3, .L194+20
	ldr	r0, [r2]
	ldr	r1, [r3]
	ldr	r2, [r4, #44]
	ldr	r3, [r4, #48]
	sub	r2, r2, r0
	sub	r3, r3, r1
	str	r2, [r4, #36]
	str	r3, [r4, #40]
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L193:
	mov	r1, #0
	ldr	r3, [r2, #16]
	add	r3, r3, #1
	cmp	r3, #10
	str	r3, [r2, #16]
	str	r1, [r2, #20]
	bne	.L181
	ldr	r3, [r2, #12]
	add	r3, r3, #1
	cmp	r3, #10
	str	r1, [r2, #16]
	str	r3, [r2, #12]
	bne	.L181
	ldr	r3, [r2, #8]
	add	r3, r3, #1
	cmp	r3, #10
	str	r1, [r2, #12]
	str	r3, [r2, #8]
	bne	.L181
	ldr	r3, [r2, #4]
	add	r3, r3, #1
	cmp	r3, #10
	str	r1, [r2, #8]
	str	r3, [r2, #4]
	bne	.L181
	ldr	r3, [r2]
	cmp	r3, #9
	addne	r3, r3, #1
	strne	r3, [r2]
	strne	r1, [r2, #4]
	b	.L181
.L195:
	.align	2
.L194:
	.word	pacMan
	.word	collision
	.word	scoreDigits
	.word	pelletCount
	.word	vOff
	.word	hOff
	.size	updatePellet, .-updatePellet
	.align	2
	.global	drawPellets
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPellets, %function
drawPellets:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r4, #832
	ldr	r3, .L202
	ldr	r2, .L202+4
	ldr	lr, .L202+8
	add	r0, r3, #7360
.L199:
	ldr	r1, [r3, #88]
	cmp	r1, #0
	ldrhne	r1, [r2, #40]
	ldreq	r1, [r3, #40]
	ldrbeq	ip, [r3, #36]	@ zero_extendqisi2
	orrne	r1, r1, #512
	andeq	r1, r1, lr
	add	r3, r3, #92
	strhne	r1, [r2, #40]	@ movhi
	strheq	r4, [r2, #44]	@ movhi
	strheq	r1, [r2, #42]	@ movhi
	strheq	ip, [r2, #40]	@ movhi
	cmp	r3, r0
	add	r2, r2, #8
	bne	.L199
	pop	{r4, lr}
	bx	lr
.L203:
	.align	2
.L202:
	.word	pellets
	.word	shadowOAM
	.word	511
	.size	drawPellets, .-drawPellets
	.align	2
	.global	animateGhost
	.syntax unified
	.arm
	.fpu softvfp
	.type	animateGhost, %function
animateGhost:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r4, r0
	ldr	r5, [r0, #68]
	add	r3, r5, r5, lsl #4
	ldr	r2, .L212
	add	r3, r3, r3, lsl #8
	ldr	r0, .L212+4
	add	r3, r3, r3, lsl #16
	ldr	r1, [r4, #72]
	sub	r2, r2, r3
	cmp	r2, r0
	str	r1, [r4, #76]
	bcs	.L205
	ldr	r0, [r4, #80]
	ldr	r3, .L212+8
	ldr	r1, [r4, #84]
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	str	r1, [r4, #80]
.L205:
	ldr	r3, [r4]
	cmp	r3, #0
	moveq	r3, #1
	streq	r3, [r4, #72]
	beq	.L207
	cmp	r3, #1
	moveq	r3, #0
	streq	r3, [r4, #72]
	beq	.L207
	cmp	r3, #3
	beq	.L211
	cmp	r3, #2
	beq	.L211
.L207:
	add	r5, r5, #1
	str	r5, [r4, #68]
	pop	{r4, r5, r6, lr}
	bx	lr
.L211:
	add	r5, r5, #1
	str	r3, [r4, #72]
	str	r5, [r4, #68]
	pop	{r4, r5, r6, lr}
	bx	lr
.L213:
	.align	2
.L212:
	.word	143165576
	.word	286331153
	.word	__aeabi_idivmod
	.size	animateGhost, .-animateGhost
	.align	2
	.global	updateGhost
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateGhost, %function
updateGhost:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r3, [r0, #16]
	cmp	r3, #0
	mov	r4, r0
	sub	sp, sp, #16
	bne	.L215
	ldr	r2, [r0, #24]
	cmp	r2, #0
	ble	.L325
.L265:
	ldr	r5, .L334
	ldr	r3, [r5]
	cmp	r3, #1
	beq	.L326
.L217:
	cmp	r3, #0
	beq	.L327
.L219:
	ldr	r2, [r4]
	cmp	r2, #0
	bne	.L242
	ldr	r3, [r4, #44]
	cmp	r3, #0
	ble	.L243
	ldr	r2, .L334+4
	ldr	r1, [r4, #52]
	ldr	r2, [r2, #8]
	sub	r1, r3, r1
	ldr	r3, [r4, #48]
	add	r2, r2, r1, lsl #8
	ldrb	r0, [r2, r3]	@ zero_extendqisi2
	cmp	r0, #0
	add	r2, r2, r3
	bne	.L328
.L243:
	ldr	r3, .L334+8
	mov	lr, pc
	bx	r3
	cmp	r0, #0
	and	r0, r0, #1
	mov	r3, r0
	ldr	r2, .L334+12
	rsblt	r3, r0, #0
	cmp	r0, #0
	str	r3, [r2]
	beq	.L324
	cmp	r3, #1
	beq	.L248
	ldr	r2, [r4]
.L242:
	cmp	r2, #1
	bne	.L329
	ldr	r0, [r4, #44]
	ldr	r2, [r4, #64]
	add	r3, r0, r2
	cmp	r3, #255
	bgt	.L252
	ldr	ip, [r4, #52]
	ldr	r3, .L334+4
	sub	r1, r0, ip
	add	r1, r1, r2
	ldr	r2, [r3, #8]
	add	r1, r1, #1
	ldr	r3, [r4, #48]
	add	r2, r2, r1, lsl #8
	ldrb	r1, [r2, r3]	@ zero_extendqisi2
	cmp	r1, #0
	add	r2, r2, r3
	beq	.L252
	ldr	r1, [r4, #60]
	add	r2, r2, r1
	ldrb	r2, [r2, #-1]	@ zero_extendqisi2
	cmp	r2, #0
	addne	r0, r0, ip
	strne	r0, [r4, #44]
	bne	.L244
.L252:
	ldr	r3, .L334+8
	mov	lr, pc
	bx	r3
	cmp	r0, #0
	and	r0, r0, #1
	mov	r3, r0
	ldr	r2, .L334+12
	rsblt	r3, r0, #0
	cmp	r0, #0
	str	r3, [r2]
	bne	.L253
.L324:
	mov	r2, #2
	cmp	r3, #1
	str	r2, [r4]
	ldr	r3, [r4, #48]
	beq	.L255
.L247:
	ldr	r1, [r4, #60]
	add	r1, r3, r1
	cmp	r1, #255
	bgt	.L263
	ldr	r0, .L334+4
	ldr	r2, [r4, #44]
	ldr	r0, [r0, #8]
	add	ip, r0, r2, lsl #8
	ldrb	ip, [ip, r1]	@ zero_extendqisi2
	cmp	ip, #0
	beq	.L263
	ldr	ip, [r4, #52]
	ldr	lr, [r4, #64]
	sub	ip, r2, ip
	add	ip, ip, lr
	add	r0, r0, ip, lsl #8
	ldrb	r1, [r0, r1]	@ zero_extendqisi2
	cmp	r1, #0
	beq	.L263
	ldr	r1, [r4, #56]
	add	r3, r3, r1
	str	r3, [r4, #48]
	b	.L261
.L327:
	ldr	r3, .L334+16
	add	r2, r3, #44
	ldr	r0, [r3, #8]
	ldr	r1, [r3, #4]
	ldm	r2, {r2, r3}
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	ldr	r5, .L334+20
	ldmib	r4, {r2, r3}
	ldr	r1, [r4, #44]
	ldr	r0, [r4, #48]
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	beq	.L241
	ldr	r3, [r4, #88]
	cmp	r3, #0
	bne	.L241
	ldr	r2, .L334+24
	ldr	r3, [r2]
	sub	r3, r3, #1
	str	r3, [r2]
	bl	initPlayer
	bl	initGhosts
.L241:
	mov	r1, #0
	ldr	r3, [r4, #24]
	ldr	r2, .L334+28
	sub	r3, r3, #1
	str	r3, [r4, #24]
	str	r1, [r2]
	b	.L219
.L329:
	ldr	r3, [r4, #48]
.L251:
	cmp	r2, #3
	beq	.L249
.L256:
	cmp	r2, #2
	beq	.L247
.L244:
	ldr	r2, [r4, #44]
.L261:
	ldr	r0, .L334+32
	ldr	r0, [r0]
	sub	r2, r2, r0
	mov	r0, r4
	ldr	r1, .L334+36
	ldr	r1, [r1]
	sub	r3, r3, r1
	str	r2, [r4, #36]
	str	r3, [r4, #40]
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	b	animateGhost
.L325:
	mov	r1, #120
	mov	r2, #1
	ldr	r5, .L334
	str	r3, [r0]
	ldr	r3, [r5]
	cmp	r3, #1
	str	r1, [r0, #48]
	str	r2, [r0, #16]
	bne	.L217
.L326:
	ldr	r3, [r4, #28]
	cmp	r3, #0
	bne	.L219
	ldr	r3, [r4, #16]
	sub	r3, r3, #2
	cmp	r3, #1
	bls	.L220
	ldr	r3, [r4, #24]
	cmp	r3, #0
	movle	r3, #3
	strle	r3, [r4, #16]
.L220:
	ldr	r3, .L334+16
	add	r2, r3, #44
	ldr	r0, [r3, #8]
	ldr	r1, [r3, #4]
	ldm	r2, {r2, r3}
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	ldr	r6, .L334+20
	ldmib	r4, {r2, r3}
	ldr	r1, [r4, #44]
	ldr	r0, [r4, #48]
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L222
	ldr	r3, [r4, #88]
	cmp	r3, #1
	beq	.L222
	mov	r2, #1
	mov	r0, #2
	ldr	r1, .L334+28
	ldr	r3, [r1]
	cmp	r3, #0
	str	r2, [r4, #88]
	str	r2, [r4, #28]
	str	r0, [r4, #16]
	beq	.L330
	cmp	r3, #1
	beq	.L331
	cmp	r3, #2
	beq	.L332
	cmp	r3, #3
	bne	.L222
	ldr	r3, .L334+40
	add	r1, r3, #12
	ldm	r1, {r1, r2}
	add	r0, r2, #6
	add	ip, r1, #1
	cmp	r0, #9
	str	ip, [r3, #12]
	str	r0, [r3, #16]
	ble	.L222
	add	r0, r1, #2
	sub	r2, r2, #4
	cmp	r0, #9
	str	r2, [r3, #16]
	str	r0, [r3, #12]
	ble	.L222
	ldr	r0, [r3, #8]
	add	r2, r0, #1
	sub	r1, r1, #8
	cmp	r2, #9
	str	r1, [r3, #12]
	str	r2, [r3, #8]
	ble	.L222
	ldr	r2, [r3, #4]
	add	r1, r2, #1
	sub	r0, r0, #9
	cmp	r1, #9
	str	r0, [r3, #8]
	str	r1, [r3, #4]
	ble	.L222
	ldr	r1, [r3]
	cmp	r1, #9
	addne	r1, r1, #1
	subne	r2, r2, #9
	stmne	r3, {r1, r2}
.L222:
	ldr	r2, [r4, #32]
	cmp	r2, #0
	ldr	r3, [r5]
	bne	.L217
	ldr	r1, [r4]
	cmp	r1, #0
	moveq	r2, #1
	streq	r2, [r4]
	beq	.L237
	cmp	r1, #1
	beq	.L321
	cmp	r1, #3
	moveq	r2, #2
	streq	r2, [r4]
	beq	.L237
	cmp	r1, #2
	bne	.L237
	mov	r2, #3
.L321:
	str	r2, [r4]
.L237:
	mov	r2, #1
	str	r2, [r4, #32]
	b	.L217
.L263:
	ldr	r3, .L334+8
	mov	lr, pc
	bx	r3
	cmp	r0, #0
	and	r0, r0, #1
	mov	r3, r0
	ldr	r2, .L334+12
	rsblt	r3, r0, #0
	cmp	r0, #0
	str	r3, [r2]
	moveq	r2, #1
	streq	r2, [r4]
	cmp	r3, #1
	add	r2, r4, #44
	ldm	r2, {r2, r3}
	bne	.L261
.L322:
	mov	r1, #0
	str	r1, [r4]
	b	.L261
.L215:
	cmp	r3, #2
	bne	.L265
	ldr	r3, [r0, #12]
	add	r3, r3, #1
	cmp	r3, #179
	str	r3, [r0, #12]
	ble	.L265
	mov	r3, #0
	mov	r0, #1
	mov	r1, #120
	mov	r2, #112
	str	r0, [r4, #16]
	str	r1, [r4, #48]
	str	r2, [r4, #44]
	str	r3, [r4]
	str	r3, [r4, #12]
	str	r3, [r4, #88]
	b	.L265
.L248:
	ldr	r3, [r4, #48]
.L255:
	mov	r2, #3
	str	r2, [r4]
.L249:
	cmp	r3, #0
	ble	.L257
	ldr	r1, .L334+4
	ldr	r2, [r4, #44]
	ldr	r1, [r1, #8]
	sub	ip, r3, #1
	add	r0, r1, r2, lsl #8
	ldrb	r0, [r0, ip]	@ zero_extendqisi2
	cmp	r0, #0
	beq	.L257
	ldr	r0, [r4, #64]
	ldr	lr, [r4, #52]
	add	r0, r2, r0
	sub	r0, r0, lr
	add	r1, r1, r0, lsl #8
	ldrb	r1, [r1, ip]	@ zero_extendqisi2
	cmp	r1, #0
	ldrne	r1, [r4, #56]
	subne	r3, r3, r1
	strne	r3, [r4, #48]
	bne	.L261
.L257:
	ldr	r3, .L334+8
	mov	lr, pc
	bx	r3
	cmp	r0, #0
	and	r0, r0, #1
	mov	r3, r0
	ldr	r2, .L334+12
	rsblt	r3, r0, #0
	cmp	r0, #0
	str	r3, [r2]
	beq	.L333
	cmp	r3, #1
	ldr	r3, [r4, #48]
	beq	.L262
	ldr	r2, [r4]
	b	.L256
.L328:
	ldr	r0, [r4, #60]
	add	r2, r2, r0
	ldrb	r2, [r2, #-1]	@ zero_extendqisi2
	cmp	r2, #0
	strne	r1, [r4, #44]
	bne	.L244
	b	.L243
.L253:
	cmp	r3, #1
	ldr	r3, [r4, #48]
	beq	.L255
	ldr	r2, [r4]
	b	.L251
.L333:
	mov	r2, #1
	cmp	r3, r2
	str	r2, [r4]
	add	r2, r4, #44
	ldm	r2, {r2, r3}
	bne	.L261
	b	.L322
.L330:
	ldr	r3, .L334+40
	ldr	r2, [r3, #16]
	add	r0, r2, r0
	cmp	r0, #9
	str	r0, [r3, #16]
	ble	.L226
	ldr	r0, [r3, #12]
	add	ip, r0, #1
	sub	r2, r2, #8
	cmp	ip, #9
	str	r2, [r3, #16]
	str	ip, [r3, #12]
	ble	.L226
	ldr	r2, [r3, #8]
	add	ip, r2, #1
	sub	r0, r0, #9
	cmp	ip, #9
	str	r0, [r3, #12]
	str	ip, [r3, #8]
	ble	.L226
	ldr	r0, [r3, #4]
	add	ip, r0, #1
	sub	r2, r2, #9
	cmp	ip, #9
	str	r2, [r3, #8]
	str	ip, [r3, #4]
	ble	.L226
	ldr	r2, [r3]
	cmp	r2, #9
	addne	r2, r2, #1
	subne	r0, r0, #9
	strne	r2, [r3]
	strne	r0, [r3, #4]
.L226:
	mov	r3, #1
	str	r3, [r1]
	b	.L222
.L262:
	ldr	r2, [r4, #44]
	b	.L322
.L331:
	ldr	r3, .L334+40
	ldr	r2, [r3, #16]
	add	r0, r2, #4
	cmp	r0, #9
	str	r0, [r3, #16]
	ble	.L230
	ldr	r0, [r3, #12]
	add	ip, r0, #1
	sub	r2, r2, #6
	cmp	ip, #9
	str	r2, [r3, #16]
	str	ip, [r3, #12]
	ble	.L230
	ldr	r2, [r3, #8]
	add	ip, r2, #1
	sub	r0, r0, #9
	cmp	ip, #9
	str	r0, [r3, #12]
	str	ip, [r3, #8]
	ble	.L230
	ldr	r0, [r3, #4]
	add	ip, r0, #1
	sub	r2, r2, #9
	cmp	ip, #9
	str	r2, [r3, #8]
	str	ip, [r3, #4]
	ble	.L230
	ldr	r2, [r3]
	cmp	r2, #9
	addne	r2, r2, #1
	subne	r0, r0, #9
	strne	r2, [r3]
	strne	r0, [r3, #4]
.L230:
	mov	r3, #2
	str	r3, [r1]
	b	.L222
.L332:
	ldr	r3, .L334+40
	ldr	r2, [r3, #16]
	add	r0, r2, #8
	cmp	r0, #9
	str	r0, [r3, #16]
	ble	.L234
	ldr	r0, [r3, #12]
	add	ip, r0, #1
	sub	r2, r2, #2
	cmp	ip, #9
	str	r2, [r3, #16]
	str	ip, [r3, #12]
	ble	.L234
	ldr	ip, [r3, #8]
	add	r2, ip, #1
	sub	r0, r0, #9
	cmp	r2, #9
	str	r0, [r3, #12]
	str	r2, [r3, #8]
	ble	.L234
	ldr	r2, [r3, #4]
	add	r0, r2, #1
	sub	ip, ip, #9
	cmp	r0, #9
	stmib	r3, {r0, ip}
	ble	.L234
	ldr	r0, [r3]
	cmp	r0, #9
	addne	r0, r0, #1
	subne	r2, r2, #9
	stmne	r3, {r0, r2}
.L234:
	mov	r3, #3
	str	r3, [r1]
	b	.L222
.L335:
	.align	2
.L334:
	.word	poweredUp
	.word	.LANCHOR0
	.word	rand
	.word	ghostRand
	.word	pacMan
	.word	collision
	.word	pacLives
	.word	ghostMulti
	.word	vOff
	.word	hOff
	.word	scoreDigits
	.size	updateGhost, .-updateGhost
	.align	2
	.global	drawGhosts
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawGhosts, %function
drawGhosts:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #6
	ldr	r3, .L346
	ldr	r2, .L346+4
	ldr	ip, [r3]
	smull	r3, r2, ip, r2
	asr	r3, ip, #31
	add	r2, r2, ip
	rsb	r3, r3, r2, asr #5
	ldr	r2, .L346+8
	rsb	r3, r3, r3, lsl #4
	push	{r4, r5, r6, lr}
	sub	r0, ip, r3, lsl #2
	ldr	r5, [r2]
	ldr	r3, .L346+12
	ldr	r2, .L346+16
	ldr	r4, .L346+20
	sub	lr, r0, #1
.L341:
	ldr	r0, [r3, #88]
	cmp	r0, #0
	beq	.L337
	ldrh	r0, [r2, #8]
	orr	r0, r0, #512
	strh	r0, [r2, #8]	@ movhi
.L338:
	add	r1, r1, #4
	cmp	r1, #22
	add	r3, r3, #92
	add	r2, r2, #8
	bne	.L341
	pop	{r4, r5, r6, lr}
	bx	lr
.L337:
	ldr	r0, [r3, #40]
	ldrb	r6, [r3, #36]	@ zero_extendqisi2
	and	r0, r0, r4
	orr	r0, r0, #16384
	cmp	r5, #1
	strh	r6, [r2, #8]	@ movhi
	strh	r0, [r2, #10]	@ movhi
	ldr	r6, [r3, #80]
	beq	.L345
.L339:
	ldr	r0, [r3, #72]
	add	r6, r1, r6, lsl #1
	add	r0, r0, r6, lsl #4
	lsl	r0, r0, #1
.L344:
	strh	r0, [r2, #12]	@ movhi
	b	.L338
.L345:
	ldr	r0, [r3, #16]
	sub	r0, r0, #1
	cmp	r0, #1
	bls	.L339
	add	r0, r6, #352
	cmp	ip, #240
	lsl	r0, r0, #1
	bgt	.L344
	cmp	lr, #28
	addls	r0, r6, #384
	lslls	r0, r0, #1
	strhls	r0, [r2, #12]	@ movhi
	bhi	.L344
	b	.L338
.L347:
	.align	2
.L346:
	.word	powerTimer
	.word	-2004318071
	.word	poweredUp
	.word	ghosts
	.word	shadowOAM
	.word	511
	.size	drawGhosts, .-drawGhosts
	.align	2
	.global	drawGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawGame, %function
drawGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L352
	ldr	r3, [r3, #88]
	cmp	r3, #0
	push	{r4, lr}
	beq	.L349
	ldr	r2, .L352+4
	ldrh	r3, [r2]
	orr	r3, r3, #512
	strh	r3, [r2]	@ movhi
.L350:
	bl	drawGhosts
	bl	drawPellets
	bl	drawPowerPellets
	bl	drawLives
	bl	drawText
	bl	drawScore
	ldr	r3, .L352+8
	mov	lr, pc
	bx	r3
	ldr	r4, .L352+12
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L352+4
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	ldr	r2, .L352+16
	ldrh	r1, [r2]
	ldr	r2, .L352+20
	ldrh	r2, [r2]
	strh	r1, [r3, #20]	@ movhi
	pop	{r4, lr}
	strh	r2, [r3, #22]	@ movhi
	bx	lr
.L349:
	bl	drawPlayer.part.0
	b	.L350
.L353:
	.align	2
.L352:
	.word	pacMan
	.word	shadowOAM
	.word	waitForVBlank
	.word	DMANow
	.word	hOff
	.word	vOff
	.size	drawGame, .-drawGame
	.align	2
	.global	animatePlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	animatePlayer, %function
animatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L370
	ldr	r3, .L370+4
	ldr	r5, [r4, #68]
	smull	r1, r2, r3, r5
	asr	r3, r5, #31
	rsb	r3, r3, r2, asr #1
	ldr	r6, [r4, #72]
	add	r3, r3, r3, lsl #2
	cmp	r5, r3
	str	r6, [r4, #76]
	bne	.L355
	ldr	r0, [r4, #80]
	ldr	r3, .L370+8
	ldr	r1, [r4, #84]
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	str	r1, [r4, #80]
.L355:
	ldr	r3, .L370+12
	ldr	r3, [r3]
	cmp	r3, #1
	beq	.L368
	cmp	r3, #2
	moveq	r3, #0
	bne	.L369
.L368:
	add	r5, r5, #1
	str	r3, [r4, #72]
	str	r5, [r4, #68]
	pop	{r4, r5, r6, lr}
	bx	lr
.L369:
	cmp	r3, #3
	beq	.L368
	cmp	r3, #4
	moveq	r3, #2
	beq	.L368
	mov	r3, #0
	str	r6, [r4, #72]
	str	r3, [r4, #80]
	str	r3, [r4, #68]
	pop	{r4, r5, r6, lr}
	bx	lr
.L371:
	.align	2
.L370:
	.word	pacMan
	.word	1717986919
	.word	__aeabi_idivmod
	.word	toggleMovement
	.size	animatePlayer, .-animatePlayer
	.align	2
	.global	updatePlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePlayer, %function
updatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L447
	ldrh	r3, [r3]
	tst	r3, #64
	push	{r4, r5, r6, r7, lr}
	beq	.L441
	ldr	r2, .L447+4
	ldrh	r2, [r2]
	tst	r2, #64
	beq	.L434
.L441:
	ldr	r2, .L447+8
.L373:
	tst	r3, #128
	beq	.L374
	ldr	r1, .L447+4
	ldrh	r1, [r1]
	tst	r1, #128
	moveq	r1, #2
	streq	r1, [r2]
.L374:
	tst	r3, #32
	and	r3, r3, #16
	beq	.L375
	ldr	r1, .L447+4
	ldrh	r0, [r1]
	tst	r0, #32
	bne	.L375
	mov	r1, #3
	cmp	r3, #0
	str	r1, [r2]
	beq	.L444
	tst	r0, #16
	bne	.L445
.L391:
	mov	r1, #4
	ldr	r3, .L447+12
	ldr	lr, .L447+16
	str	r1, [r2]
	ldr	r0, [r3, #48]
	ldr	ip, [r3, #44]
	ldr	r2, [lr]
.L379:
	ldr	r1, [r3, #60]
	add	r1, r0, r1
	cmp	r1, #255
	bgt	.L442
	ldr	r4, .L447+20
	ldr	r1, [r3, #4]
	ldr	r5, [r4, #4]
	add	r1, r0, r1
	add	r4, r5, ip, lsl #8
	add	r1, r1, #2
	ldrb	r4, [r4, r1]	@ zero_extendqisi2
	cmp	r4, #0
	beq	.L442
	ldr	r4, [r3, #52]
	ldr	r6, [r3, #8]
	sub	r4, ip, r4
	add	r4, r4, r6
	add	r4, r5, r4, lsl #8
	ldrb	r1, [r4, r1]	@ zero_extendqisi2
	cmp	r1, #0
	beq	.L442
	ldr	r4, [r3, #56]
	ldr	r1, .L447+24
	add	r0, r0, r4
	cmp	r2, #15
	str	r0, [r3, #48]
	ldr	r1, [r1]
	bgt	.L385
	ldr	r4, [r3, #40]
	cmp	r4, #120
	addgt	r2, r2, #1
	strgt	r2, [lr]
	b	.L385
.L375:
	cmp	r3, #0
	bne	.L446
.L378:
	ldr	r1, [r2]
	ldr	r3, .L447+12
	cmp	r1, #1
	ldr	ip, [r3, #44]
	ldr	r0, [r3, #48]
	bne	.L380
	cmp	ip, #0
	ble	.L443
	ldr	r2, .L447+20
	ldr	r1, [r3, #52]
	ldr	r2, [r2, #4]
	sub	r1, ip, r1
	add	r2, r2, r1, lsl #8
	ldrb	lr, [r2, r0]	@ zero_extendqisi2
	cmp	lr, #0
	add	r2, r2, r0
	bne	.L436
.L443:
	ldr	lr, .L447+24
.L381:
	ldr	r2, .L447+16
	ldr	r2, [r2]
.L389:
	ldr	r1, [lr]
	b	.L385
.L380:
	cmp	r1, #2
	bne	.L390
	ldr	lr, [r3, #64]
	ldr	r5, .L447+24
	add	r2, lr, ip
	cmp	r2, #255
	ldr	r1, [r5]
	bgt	.L384
	ldr	r6, [r3, #52]
	ldr	r2, [r3, #8]
	ldr	r4, .L447+20
	sub	r7, ip, r6
	ldr	r4, [r4, #4]
	add	r2, r7, r2
	add	r2, r2, #1
	add	r2, r4, r2, lsl #8
	ldrb	r2, [r2, r0]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L384
	add	lr, lr, r7
	add	lr, lr, #1
	add	lr, r4, lr, lsl #8
	ldr	r4, [r3, #4]
	add	lr, lr, r0
	add	lr, lr, r4
	ldrb	r2, [lr, #-1]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L384
	add	ip, ip, r6
	cmp	r1, #95
	str	ip, [r3, #44]
	bgt	.L384
	ldr	r2, [r3, #36]
	cmp	r2, #80
	addgt	r1, r1, #1
	strgt	r1, [r5]
.L384:
	ldr	r2, .L447+16
	ldr	r2, [r2]
.L385:
	sub	r1, ip, r1
	sub	r2, r0, r2
	pop	{r4, r5, r6, r7, lr}
	str	r1, [r3, #36]
	str	r2, [r3, #40]
	b	animatePlayer
.L446:
	ldr	r3, .L447+4
	ldrh	r3, [r3]
	tst	r3, #16
	bne	.L378
	b	.L391
.L434:
	mov	r1, #1
	ldr	r2, .L447+8
	str	r1, [r2]
	b	.L373
.L442:
	ldr	r1, .L447+24
	ldr	r1, [r1]
	b	.L385
.L436:
	ldr	lr, [r3, #4]
	add	r2, r2, lr
	ldrb	r2, [r2, #-1]	@ zero_extendqisi2
	cmp	r2, #0
	ldr	lr, .L447+24
	beq	.L381
	ldr	r2, [lr]
	cmp	r2, #0
	str	r1, [r3, #44]
	ble	.L394
	ldr	ip, [r3, #36]
	cmp	ip, #79
	bgt	.L394
	sub	r2, r2, #1
	mov	ip, r1
	str	r2, [lr]
	b	.L381
.L444:
	ldr	r3, .L447+12
	ldr	lr, .L447+16
	ldr	r0, [r3, #48]
	ldr	ip, [r3, #44]
	ldr	r2, [lr]
.L377:
	ldr	r1, .L447+24
	cmp	r0, #0
	ldr	r1, [r1]
	ble	.L385
	ldr	r4, .L447+20
	ldr	r4, [r4, #4]
	sub	r6, r0, #2
	add	r5, r4, ip, lsl #8
	ldrb	r5, [r5, r6]	@ zero_extendqisi2
	cmp	r5, #0
	beq	.L385
	ldr	r5, [r3, #8]
	ldr	r7, [r3, #52]
	add	r5, ip, r5
	sub	r5, r5, r7
	add	r4, r4, r5, lsl #8
	ldrb	r4, [r4, r6]	@ zero_extendqisi2
	cmp	r4, #0
	beq	.L385
	ldr	r4, [r3, #56]
	cmp	r2, #0
	sub	r0, r0, r4
	str	r0, [r3, #48]
	ble	.L385
	ldr	r4, [r3, #40]
	cmp	r4, #119
	suble	r2, r2, #1
	strle	r2, [lr]
	b	.L385
.L394:
	mov	ip, r1
	b	.L381
.L445:
	ldr	r3, .L447+12
	ldr	ip, [r3, #44]
	ldr	r0, [r3, #48]
.L390:
	ldr	lr, .L447+16
	cmp	r1, #3
	ldr	r2, [lr]
	beq	.L377
	cmp	r1, #4
	beq	.L379
	ldr	lr, .L447+24
	b	.L389
.L448:
	.align	2
.L447:
	.word	oldButtons
	.word	buttons
	.word	toggleMovement
	.word	pacMan
	.word	hOff
	.word	.LANCHOR0
	.word	vOff
	.size	updatePlayer, .-updatePlayer
	.align	2
	.global	updateGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateGame, %function
updateGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	bl	updatePlayer
	ldr	r0, .L453
	bl	updateGhost
	ldr	r0, .L453+4
	bl	updateGhost
	ldr	r0, .L453+8
	bl	updateGhost
	ldr	r0, .L453+12
	bl	updateGhost
	ldr	r4, .L453+16
	add	r5, r4, #7360
.L450:
	mov	r0, r4
	add	r4, r4, #92
	bl	updatePellet
	cmp	r4, r5
	bne	.L450
	ldr	r0, .L453+20
	bl	updatePowerPellet
	ldr	r0, .L453+24
	bl	updatePowerPellet
	ldr	r0, .L453+28
	bl	updatePowerPellet
	ldr	r0, .L453+32
	pop	{r4, r5, r6, lr}
	b	updatePowerPellet
.L454:
	.align	2
.L453:
	.word	ghosts
	.word	ghosts+92
	.word	ghosts+184
	.word	ghosts+276
	.word	pellets
	.word	powerPellets
	.word	powerPellets+92
	.word	powerPellets+184
	.word	powerPellets+276
	.size	updateGame, .-updateGame
	.align	2
	.global	drawPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPlayer, %function
drawPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L459
	ldr	r3, [r3, #88]
	cmp	r3, #0
	beq	.L456
	ldr	r2, .L459+4
	ldrh	r3, [r2]
	orr	r3, r3, #512
	strh	r3, [r2]	@ movhi
	bx	lr
.L456:
	b	drawPlayer.part.0
.L460:
	.align	2
.L459:
	.word	pacMan
	.word	shadowOAM
	.size	drawPlayer, .-drawPlayer
	.global	enemyCollisionmap
	.global	playerCollisionmap
	.comm	powerPellets,368,4
	.comm	pellets,7360,4
	.comm	ghosts,368,4
	.comm	text,1288,4
	.comm	score,644,4
	.comm	lives,92,4
	.comm	pacMan,92,4
	.comm	shadowOAM,1024,4
	.comm	scoreDigits,24,4
	.global	gameProgress
	.comm	pelletCount,4,4
	.comm	powerTimer,4,4
	.comm	ghostMulti,4,4
	.comm	pacLives,4,4
	.comm	poweredUp,4,4
	.comm	toggleMovement,4,4
	.comm	ghostRand,4,4
	.comm	vOff,4,4
	.comm	hOff,4,4
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	gameProgress, %object
	.size	gameProgress, 4
gameProgress:
	.word	1
	.type	playerCollisionmap, %object
	.size	playerCollisionmap, 4
playerCollisionmap:
	.word	playerCollisionmap2Bitmap
	.type	enemyCollisionmap, %object
	.size	enemyCollisionmap, 4
enemyCollisionmap:
	.word	enemyCollisionmap2Bitmap
	.ident	"GCC: (devkitARM release 53) 9.1.0"
