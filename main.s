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
	.file	"main.c"
	.text
	.align	2
	.global	goToStart
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r3, #67108864
	mov	r4, #0
	ldr	r2, .L4
	strh	r4, [r3, #22]	@ movhi
	strh	r4, [r3, #20]	@ movhi
	mov	lr, pc
	bx	r2
	ldr	r3, .L4+4
	mov	lr, pc
	bx	r3
	ldr	r5, .L4+8
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L4+12
	mov	lr, pc
	bx	r5
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L4+16
	mov	lr, pc
	bx	r5
	mov	r3, #16384
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L4+20
	mov	lr, pc
	bx	r5
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L4+24
	ldr	r1, .L4+28
	mov	lr, pc
	bx	r5
	mov	r2, #1
	ldr	r0, .L4+32
	ldr	r1, .L4+36
	ldr	r3, .L4+40
	str	r4, [r0]
	str	r4, [r1]
	str	r2, [r3]
	pop	{r4, r5, r6, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	waitForVBlank
	.word	hideSprites
	.word	DMANow
	.word	shadowOAM
	.word	bgStartPal
	.word	bgStartTiles
	.word	100726784
	.word	bgStartMap
	.word	state
	.word	seed
	.word	gameProgress
	.size	goToStart, .-goToStart
	.align	2
	.global	initialize
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #67108864
	mov	ip, #4608
	mov	r0, #7936
	mov	r1, #1
	ldr	r2, .L7
	strh	ip, [r3]	@ movhi
	strh	r0, [r3, #10]	@ movhi
	str	r1, [r2]
	b	goToStart
.L8:
	.align	2
.L7:
	.word	mapSwitch
	.size	initialize, .-initialize
	.align	2
	.global	goToGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToGame, %function
goToGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L27
	push	{r4, r5, r6, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L27+4
	ldr	r2, [r3]
	and	r3, r2, #1
	mov	r1, r3
	cmp	r2, #0
	rsblt	r1, r3, #0
	cmp	r1, #1
	beq	.L24
	cmp	r3, #0
	beq	.L22
	ldr	r4, .L27+8
.L13:
	mov	r2, #67108864
	ldr	r3, .L27+12
	ldrh	r1, [r3]
	ldr	r3, .L27+16
	strh	r1, [r2, #22]	@ movhi
	ldrh	r1, [r3]
	mov	r0, #3
	strh	r1, [r2, #20]	@ movhi
	mov	r3, #16384
	ldr	r2, .L27+20
	ldr	r1, .L27+24
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L27+28
	ldr	r1, .L27+32
	mov	r3, #256
	mov	lr, pc
	bx	r4
	ldr	r3, .L27+36
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L27+40
	mov	lr, pc
	bx	r4
	mov	r2, #1
	ldr	r3, .L27+44
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L22:
	ldr	r5, .L27+48
	ldr	r3, [r5]
	cmp	r3, #1
	bne	.L25
.L14:
	ldr	r4, .L27+8
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L27+52
	mov	lr, pc
	bx	r4
	mov	r3, #16384
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L27+56
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L27+60
	ldr	r1, .L27+64
	mov	lr, pc
	bx	r4
	mov	r3, #0
	str	r3, [r5]
	b	.L13
.L24:
	cmp	r2, #1
	beq	.L11
	ldr	r5, .L27+48
	ldr	r3, [r5]
	cmp	r3, #1
	bne	.L26
.L12:
	ldr	r4, .L27+8
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L27+68
	mov	lr, pc
	bx	r4
	mov	r3, #16384
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L27+72
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L27+60
	ldr	r1, .L27+76
	mov	lr, pc
	bx	r4
	mov	r3, #0
	str	r3, [r5]
	b	.L13
.L25:
	ldr	r3, .L27+80
	mov	lr, pc
	bx	r3
	b	.L14
.L26:
	ldr	r3, .L27+80
	mov	lr, pc
	bx	r3
	b	.L12
.L11:
	ldr	r4, .L27+8
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L27+68
	mov	lr, pc
	bx	r4
	mov	r3, #16384
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L27+72
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L27+60
	ldr	r1, .L27+76
	mov	lr, pc
	bx	r4
	b	.L13
.L28:
	.align	2
.L27:
	.word	waitForVBlank
	.word	gameProgress
	.word	DMANow
	.word	vOff
	.word	hOff
	.word	100728832
	.word	spritesheetTiles
	.word	83886592
	.word	spritesheetPal
	.word	hideSprites
	.word	shadowOAM
	.word	state
	.word	pauseCheck
	.word	gameMap2Pal
	.word	gameMap2Tiles
	.word	100726784
	.word	gameMap2Map
	.word	gameMap1Pal
	.word	gameMap1Tiles
	.word	gameMap1Map
	.word	initGame
	.size	goToGame, .-goToGame
	.align	2
	.global	start
	.syntax unified
	.arm
	.fpu softvfp
	.type	start, %function
start:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L38
	ldr	r2, .L38+4
	ldr	r0, [r3]
	ldrh	r2, [r2]
	add	r0, r0, #1
	tst	r2, #8
	str	r0, [r3]
	bxeq	lr
	ldr	r3, .L38+8
	ldrh	r3, [r3]
	tst	r3, #8
	bxne	lr
	push	{r4, lr}
	ldr	r3, .L38+12
	mov	lr, pc
	bx	r3
	bl	goToGame
	ldr	r3, .L38+16
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L39:
	.align	2
.L38:
	.word	seed
	.word	oldButtons
	.word	buttons
	.word	srand
	.word	initGame
	.size	start, .-start
	.align	2
	.global	goToPause
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToPause, %function
goToPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #0
	mov	r3, #67108864
	push	{r4, lr}
	ldr	r1, .L42
	strh	r2, [r3, #22]	@ movhi
	strh	r2, [r3, #20]	@ movhi
	mov	lr, pc
	bx	r1
	ldr	r3, .L42+4
	mov	lr, pc
	bx	r3
	mov	lr, #1
	ldr	ip, .L42+8
	ldr	r4, .L42+12
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L42+16
	str	lr, [ip]
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L42+20
	mov	lr, pc
	bx	r4
	mov	r3, #16384
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L42+24
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L42+28
	mov	r0, #3
	ldr	r1, .L42+32
	mov	lr, pc
	bx	r4
	mov	r2, #2
	ldr	r3, .L42+36
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L43:
	.align	2
.L42:
	.word	waitForVBlank
	.word	hideSprites
	.word	pauseCheck
	.word	DMANow
	.word	shadowOAM
	.word	bgPausePal
	.word	bgPauseTiles
	.word	100726784
	.word	bgPauseMap
	.word	state
	.size	goToPause, .-goToPause
	.align	2
	.global	pause
	.syntax unified
	.arm
	.fpu softvfp
	.type	pause, %function
pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r4, .L56
	ldr	r3, .L56+4
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	tst	r3, #8
	beq	.L45
	ldr	r2, .L56+8
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L54
.L45:
	tst	r3, #4
	beq	.L44
	ldr	r3, .L56+8
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L55
.L44:
	pop	{r4, lr}
	bx	lr
.L55:
	pop	{r4, lr}
	b	goToStart
.L54:
	bl	goToGame
	ldrh	r3, [r4]
	b	.L45
.L57:
	.align	2
.L56:
	.word	oldButtons
	.word	waitForVBlank
	.word	buttons
	.size	pause, .-pause
	.align	2
	.global	goToLose
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToLose, %function
goToLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L60
	mov	lr, pc
	bx	r3
	ldr	r3, .L60+4
	mov	lr, pc
	bx	r3
	ldr	r4, .L60+8
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L60+12
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L60+16
	mov	lr, pc
	bx	r4
	mov	r3, #16384
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L60+20
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L60+24
	ldr	r1, .L60+28
	mov	lr, pc
	bx	r4
	mov	r0, #1
	mov	r2, #3
	ldr	r1, .L60+32
	ldr	r3, .L60+36
	str	r0, [r1]
	str	r2, [r3]
	pop	{r4, lr}
	bx	lr
.L61:
	.align	2
.L60:
	.word	waitForVBlank
	.word	hideSprites
	.word	DMANow
	.word	shadowOAM
	.word	bgLosePal
	.word	bgLoseTiles
	.word	100726784
	.word	bgLoseMap
	.word	gameProgress
	.word	state
	.size	goToLose, .-goToLose
	.align	2
	.global	game
	.syntax unified
	.arm
	.fpu softvfp
	.type	game, %function
game:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L73
	mov	lr, pc
	bx	r3
	ldr	r3, .L73+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L73+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L63
	ldr	r3, .L73+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L70
.L63:
	ldr	r3, .L73+16
	ldr	r3, [r3]
	cmp	r3, #0
	ble	.L71
.L64:
	ldr	r3, .L73+20
	ldr	r3, [r3]
	cmp	r3, #0
	ble	.L72
	pop	{r4, lr}
	bx	lr
.L72:
	ldr	r2, .L73+24
	ldr	r3, [r2]
	pop	{r4, lr}
	add	r3, r3, #1
	str	r3, [r2]
	b	goToGame
.L71:
	bl	goToLose
	b	.L64
.L70:
	bl	goToPause
	b	.L63
.L74:
	.align	2
.L73:
	.word	updateGame
	.word	drawGame
	.word	oldButtons
	.word	buttons
	.word	pacLives
	.word	pelletCount
	.word	gameProgress
	.size	game, .-game
	.align	2
	.global	lose
	.syntax unified
	.arm
	.fpu softvfp
	.type	lose, %function
lose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L82
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L82+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L75
	ldr	r3, .L82+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L81
.L75:
	pop	{r4, lr}
	bx	lr
.L81:
	pop	{r4, lr}
	b	goToStart
.L83:
	.align	2
.L82:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.size	lose, .-lose
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	mov	ip, #4608
	mov	r0, #7936
	mov	r1, #1
	ldr	r2, .L95
	push	{r4, r7, fp, lr}
	strh	ip, [r3]	@ movhi
	strh	r0, [r3, #10]	@ movhi
	ldr	r3, .L95+4
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	ldr	r6, .L95+8
	ldr	fp, .L95+12
	ldr	r5, .L95+16
	ldr	r10, .L95+20
	ldr	r9, .L95+24
	ldr	r8, .L95+28
	ldr	r7, .L95+32
	ldr	r4, .L95+36
.L85:
	ldr	r2, [r6]
	ldrh	r3, [fp]
.L86:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [fp]	@ movhi
	cmp	r2, #3
	ldrls	pc, [pc, r2, asl #2]
	b	.L86
.L88:
	.word	.L91
	.word	.L90
	.word	.L89
	.word	.L87
.L87:
	mov	lr, pc
	bx	r8
	b	.L85
.L89:
	mov	lr, pc
	bx	r7
	b	.L85
.L90:
	mov	lr, pc
	bx	r9
	b	.L85
.L91:
	mov	lr, pc
	bx	r10
	b	.L85
.L96:
	.align	2
.L95:
	.word	mapSwitch
	.word	goToStart
	.word	state
	.word	buttons
	.word	oldButtons
	.word	start
	.word	game
	.word	lose
	.word	pause
	.word	67109120
	.size	main, .-main
	.comm	seed,4,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	pauseCheck,4,4
	.comm	mapSwitch,4,4
	.comm	state,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
