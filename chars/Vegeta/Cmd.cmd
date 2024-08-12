;#ADD004BASIC PIEs#
; __________________
;| Vegeta by DJMouF |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==============================================================================================
;=======================================<COMMAND FILE>=========================================
;==============================================================================================

;====================<BUTTON REMAPPING>====================

[Remap]
x = x
y = y
z = z
a = a
b = b
c = c
s = s

;====================<DEFAULT VALUES>====================

[Defaults]
command.time = 15
command.buffer.time = 1

;====================<SINGLE BUTTON>====================

[Command]
name = "a"
command = a
time = 1

[Command]
name = "b"
command = b
time = 1

[Command]
name = "c"
command = c
time = 1

[Command]
name = "x"
command = x
time = 1

[Command]
name = "y"
command = y
time = 1

[Command]
name = "z"
command = z
time = 1

[Command]
name = "s"
command = s
time = 1

;==================<HOLD DIRECTION>==================

[Command]
name = "holdfwd"
command=/$F
time=1

[Command]
name = "holdback"
command = /$B
time = 1

[Command]
name = "holdup"
command = /$U
time=1

[Command]
name = "holddown"
command = /$D
time = 1

;====================<HOLD BUTTON>====================

[Command]
name = "holda"
command = /a
time = 1

[Command]
name = "holdb"
command = /b
time = 1

[Command]
name = "holdc"
command = /c
time = 1

[Command]
name = "holdx"
command = /x
time = 1

[Command]
name = "holdy"
command = /y
time = 1

[Command]
name = "holdz"
command = /z
time = 1

[Command]
name = "holdstart"
command = /s
time = 1

;====================<DIRECTION>====================

[Command]
name = "fwd"
command = F
time = 1

[Command]
name = "back"
command = B
time = 1

[Command]
name = "up"
command = U
time = 1

[Command]
name = "down"
command = D
time = 1

;====================<RELEASE DIR>====================

[Command]
name = "rlsfwd"
command = ~$F
time = 1

[Command]
name = "rlsback"
command = ~$B
time = 1

[Command]
name = "rlsup"
command = ~$U
time = 1

[Command]
name = "rlsdown"
command = ~$D
time = 1

;====================<RELEASE BUTTON>====================

[Command]
name = "rlsx"
command = ~x
time = 1

[Command]
name = "rlsy"
command = ~y
time = 1

[Command]
name = "rlsz"
command = ~z
time = 1

[Command]
name = "rlsa"
command = ~a
time = 1

[Command]
name = "rlsb"
command = ~b
time = 1

[Command]
name = "rlsc"
command = ~c
time = 1

;====================<SUPER MOTIONS>===================
;----------------

;----------------LVL 3 Final Shine Attack
[Command]
name = "Final Shine Attack"
command = ~D, DB, B, D, DB, B, a+x
time = 32
[Command]
name = "Final Shine Attack"
command = ~D, DB, B, D, DB, B, b+y
time = 32
[Command]
name = "Final Shine Attack"
command = ~D, DB, B, D, DB, B, c+z
time = 32

;----------------LVL 3 SSJ
[Command]
name = "SSJ"
command = ~D, DF, F, D, DF, F, s
time = 32
[Command]
name = "SSJ"
command = ~D, DF, F, D, DF, F, s
time = 32
[Command]
name = "SSJ"
command = ~D, DF, F, F, DF, F, s
time = 32
;----------------LVL 3 Saiyan Rage/Dirty Fireworks
[Command]
name = "Saiyan Rage/Dirty Fireworks"
command = ~D, DF, F, D, DF, F, a+x
time = 32
[Command]
name = "Saiyan Rage/Dirty Fireworks"
command = ~D, DF, F, D, DF, F, b+y
time = 32
[Command]
name = "Saiyan Rage/Dirty Fireworks"
command = ~D, DF, F, D, DF, F, c+z
time = 32
;----------------LVL 3 Final Flash
[Command]
name = "Final Flash"
command = ~D, DF, F, D, DF, F, a+x
time = 32
[Command]
name = "Final Flash"
command = ~D, DF, F, D, DF, F, b+y
time = 32
[Command]
name = "Final Flash"
command = ~D, DF, F, D, DF, F, c+z
time = 32

;-------------------------- MAX Super 1

;-----------MAX Galick Gun
[Command]
name = "MAX Galick Gun"
command = ~D, DF, F, D, DF, F, x+y
time = 32

[Command]
name = "MAX Galick Gun"
command = ~D, DF, F, D, DF, F, y+z
time = 32

[Command]
name = "MAX Galick Gun"
command = ~D, DF, F, D, DF, F, x+z
time = 32

;-----------MAX Flasher
[Command]
name = "Maximum Flasher"
command = ~D, DF, F, D, DB, B, x+y
time = 32

[Command]
name = "Maximum Flasher"
command = ~D, DF, F, D, DB, B, y+z
time = 32

[Command]
name = "Maximum Flasher"
command = ~D, DF, F, D, DB, B, x+z
time = 32

;-----------Max Super Kick
[Command]
name = "Max Super Kick"
command = ~D, DF, F, D, DF, F, a+b
time = 32

[Command]
name = "Max Super Kick"
command = ~D, DF, F, D, DF, F, b+c
time = 32

[Command]
name = "Max Super Kick"
command = ~D, DF, F, D, DF, F, a+c
time = 32

;-----------Max Big Bang Attack
[Command]
name = "Max Big Bang Attack"
command = ~D, DF, F, D, DF, F, x+y
time = 32

[Command]
name = "Max Big Bang Attack"
command = ~D, DF, F, D, DF, F, y+z
time = 32

[Command]
name = "Max Big Bang Attack"
command = ~D, DF, F, D, DF, F, x+z
time = 32

;-----------Max Saiyan Beat Down
[Command]
name = "Max Saiyan Beat Down"
command = ~D, DB, B, D, DB, B, x+y
time = 32

[Command]
name = "Max Saiyan Beat Down"
command = ~D, DB, B, D, DB, B, y+z
time = 32

[Command]
name = "Max Saiyan Beat Down"
command = ~D, DB, B, D, DB, B, x+z
time = 32

;----------------Super 1

;-----------Galick Gun
[Command]
name = "Galick Gun"
command = ~D, DF, F, D, DF, F, x
time = 32

[Command]
name = "Galick Gun"
command = ~D, DF, F, D, DF, F, y
time = 32

[Command]
name = "Galick Gun"
command = ~D, DF, F, D, DF, F, z
time = 32

[Command]
name = "Galick Gun"
command = ~D, DF, F, D, DF, F, ~x
time = 32

[Command]
name = "Galick Gun"
command = ~D, DF, F, D, DF, F, ~y
time = 32

[Command]
name = "Galick Gun"
command = ~D, DF, F, D, DF, F, ~z
time = 32

;-----------Saiyan Beat Down
[Command]
name = "Saiyan Beat Down"
command = ~D, DB, B, D, DB, B, x
time = 32

[Command]
name = "Saiyan Beat Down"
command = ~D, DB, B, D, DB, B, y
time = 32

[Command]
name = "Saiyan Beat Down"
command = ~D, DB, B, D, DB, B, z
time = 32

[Command]
name = "Saiyan Beat Down"
command = ~D, DB, B, D, DB, B, ~x
time = 32

[Command]
name = "Saiyan Beat Down"
command = ~D, DB, B, D, DB, B, ~y
time = 32

[Command]
name = "Saiyan Beat Down"
command = ~D, DB, B, D, DB, B, ~z
time = 32

;-----------Big Bang Attack
[Command]
name = "Big Bang Attack"
command = ~D, DF, F, D, DF, F, x
time = 32

[Command]
name = "Big Bang Attack"
command = ~D, DF, F, D, DF, F, y
time = 32

[Command]
name = "Big Bang Attack"
command = ~D, DF, F, D, DF, F, z
time = 32

[Command]
name = "Big Bang Attack"
command = ~D, DF, F, D, DF, F, ~x
time = 32

[Command]
name = "Big Bang Attack"
command = ~D, DF, F, D, DF, F, ~y
time = 32

[Command]
name = "Big Bang Attack"
command = ~D, DF, F, D, DF, F, ~z
time = 32

;-----------Super Kick
[Command]
name = "Super Kick"
command = ~D, DF, F, D, DF, F, a
time = 32

[Command]
name = "Super Kick"
command = ~D, DF, F, D, DF, F, b
time = 32

[Command]
name = "Super Kick"
command = ~D, DF, F, D, DF, F, c
time = 32

[Command]
name = "Super Kick"
command = ~D, DF, F, D, DF, F, ~a
time = 32

[Command]
name = "Super Kick"
command = ~D, DF, F, D, DF, F, ~b
time = 32

[Command]
name = "Super Kick"
command = ~D, DF, F, D, DF, F, ~c
time = 32

;====================<SPECIAL MOTIONS>====================
;----------------Elbow Rush
[Command]
name = "Elbow Rush"
command = ~F, D, DF, x
time = 16

[Command]
name = "Elbow Rush"
command = ~F, D, DF, y
time = 16

[Command]
name = "Elbow Rush"
command = ~F, D, DF, z
time = 16

[Command]
name = "Elbow Rush"
command = ~F, D, DF, ~x
time = 16

[Command]
name = "Elbow Rush"
command = ~F, D, DF, ~y
time = 16

[Command]
name = "Elbow Rush"
command = ~F, D, DF, ~z
time = 16

;----------------Knee Bash
[Command]
name = "Knee Bash"
command = ~D, DF, F, a
time = 16

[Command]
name = "Knee Bash"
command = ~D, DF, F, b
time = 16

[Command]
name = "Knee Bash"
command = ~D, DF, F, c
time = 16

[Command]
name = "Knee Bash"
command = ~D, DF, F, ~a
time = 16

[Command]
name = "Knee Bash"
command = ~D, DF, F, ~b
time = 16

[Command]
name = "Knee Bash"
command = ~D, DF, F, ~c
time = 16

;----------------FireBlast
[Command]
name = "FireBlast"
command = ~D, DF, F, x
time = 16

[Command]
name = "FireBlast"
command = ~D, DF, F, y
time = 16

[Command]
name = "FireBlast"
command = ~D, DF, F, z
time = 16

[Command]
name = "FireBlast"
command = ~D, DF, F, ~x
time = 16

[Command]
name = "FireBlast"
command = ~D, DF, F, ~y
time = 16

[Command]
name ="FireBlast"
command = ~D, DF, F, ~z
time = 16

;---------------RisngKick
[Command]
name = "RisngKicka"
command = ~F, D, DF, a
time = 20

[Command]
name = "RisngKickb"
command = ~F, D, DF, b
time = 20

[Command]
name = "RisngKickc"
command = ~F, D, DF, c
time = 20

[Command]
name = "RisngKicka"
command = ~F, D, DF, ~a
time = 20

[Command]
name = "RisngKickb"
command = ~F, D, DF, ~b
time = 20

[Command]
name = "RisngKickc"
command = ~F, D, DF, ~c
time = 20

;---------DashKick

[Command]
name = "DashKick"
command = ~D, DB, B, a
time = 30

[Command]
name = "DashKick"
command = ~D, DB, B, b
time = 30

[Command]
name = "DashKick"
command = ~D, DB, B, c
time = 30

[Command]
name = "DashKick"
command = ~D, DF, B, ~a
time = 30

[Command]
name = "DashKick"
command = ~D, DB, B, ~b
time = 30

[Command]
name = "DashKick"
command = ~D, DB, B, ~c
time = 30

;----------------EX Elbow Rush
[Command]
name = "EX Elbow Rush"
command = ~F, D, DF, x+y
time = 16

[Command]
name = "EX Elbow Rush"
command = ~F, D, DF, y+z
time = 16

[Command]
name = "EX Elbow Rush"
command = ~F, D, DF, x+z
time = 16

;----------EX Rising Kick

[Command]
name = "EX Rising Kick"
command = ~F, D, DF, a+b
time = 20
[Command]
name = "EX Rising Kick"
command = ~F, D, DF, b+c
time = 20
[Command]
name = "EX Rising Kick"
command = ~F, D, DF, a+c
time = 20

;----------EX Knee Bash

[Command]
name = "EX Knee Bash"
command = ~D, DF, F, a+b
time = 20
[Command]
name = "EX Knee Bash"
command = ~D, DF, F, b+c
time = 20
[Command]
name = "EX Knee Bash"
command = ~D, DF, F, a+c
time = 20

;----------EX FireBlast

[Command]
name = "EX FireBlast"
command = ~D, DF, F, x+y
time = 20
[Command]
name = "EX FireBlast"
command = ~D, DF, F, y+z
time = 20
[Command]
name = "EX FireBlast"
command = ~D, DF, F, x+z
time = 20


;----------------EX DashKick
[Command]
name = "EX DashKick"
command = ~D, DB, B, a+b
time = 16

[Command]
name = "EX DashKick"
command = ~D, DB, B, b+c
time = 16

[Command]
name = "EX DashKick"
command = ~D, DB, B, a+c
time = 16


;----------------

[Command]
name = "412p"
command = ~B, DB, D, x
time = 16

[Command]
name = "412p"
command = ~B, DB, D, y
time = 16

[Command]
name = "412p"
command = ~B, DB, D, z
time = 16

[Command]
name = "412p"
command = ~B, DB, D, ~x
time = 16

[Command]
name = "412p"
command = ~B, DB, D, ~y
time = 16

[Command]
name = "412p"
command = ~B, DB, D, ~z
time = 16

[Command]
name = "412k"
command = ~B, DB, D, a
time = 16

[Command]
name = "412k"
command = ~B, DB, D, b
time = 16

[Command]
name=  "412k"
command = ~B, DB, D, c
time = 16

[Command]
name = "412k"
command = ~B, DB, D, ~a
time = 16

[Command]
name = "412k"
command = ~B, DB, D, ~b
time = 16

[Command]
name = "412k"
command = ~B, DB, D, ~c
time = 16

;====================<OTHER>====================

[Command]
name = "highjump"
command = $D, $U
time = 15

;====================<DOUBLE TAP>====================

[Command]
name = "FF"
command = F, F
time = 10

[Command]
name = "BB"
command = B, B
time = 10

;====================<2/3 BUTTON COMBINATION>====================

[Command]
name = "recovery"
command = x+y
time = 1

[Command]
name = "recovery"
command = x+z
time = 1

[Command]
name = "recovery"
command = y+z
time = 1

[Command]
name = "recovery"
command = a+x
time = 1

[Command]
name = "pp"
command = x+y
time = 1

[Command]
name = "pp"
command = x+z
time = 1

[Command]
name = "pp"
command = y+z
time = 1

[Command]
name = "kk"
command = a+b
time = 1

[Command]
name = "kk"
command = a+c
time = 1

[Command]
name = "kk"
command = b+c
time = 1

[Command]
name = "a+x"
command = a+x
time=1

[Command]
name = "b+y"
command = b+y
time = 1

[Command]
name = "c+z"
command = c+z
time = 1

;==============================================================================================
;========================================<-1 STATES>===========================================
;==============================================================================================
[StateDef -1]

;//==========================
;// add004-1-sctrls-start
;//==========================
;--- partner_standby
[state 0]
	type=selfstate
	trigger1=ctrl && numpartner && !ishelper && roundstate=2 && pos y=0
	trigger1=sysfvar(4)>0 && sysfvar(0)>0 && playeridexist(floor(sysfvar(0)))
	trigger1=playerid(floor(sysfvar(0))),var(0)=90900 && playerid(floor(sysfvar(0))),var(22)=4
	value=190190
	ctrl=0
	ignorehitpause=1
;//==========================
;// add004-1-sctrls-end
;//==========================




[State -1, Omega Galick Gun]
type = changestate
value = 4400
triggerall = RoundState = 2 && numpartner
triggerall = ifelse(numpartner,(partner, name = "Broly" && partner, authorname = "Mr.Ansatsuken"),0)
trigger1 = (stateno!=[3500,4409]) && ifelse(numpartner,(partner,stateno = [4400,4401]),0) && alive

[State -1, Tick Fix]
type = CtrlSet
triggerAll = !ctrl
trigger1 = (StateNo = 52 || StateNo = 101 || StateNo = 5120) && !AnimTime
trigger2 = (StateNo = [200,499]) && !AnimTime && Anim != 251 
trigger3 = ((StateNo = [760,762]) || (StateNo = [700,715]) || (StateNo = [900,905])) && !AnimTime
trigger4 = (StateNo = 5001 || StateNo = 5011 || StateNo = 151 || StateNo = 153) && HitOver
value = 1

[State -1, CtrlSet For Helpers]
type = CtrlSet
trigger1 = IsHelper
value = 0

[State -1, Hit Count For Helpers]
type = ParentVarAdd
trigger1 = IsHelper
trigger1 = MoveHit = 1
trigger1 = !HitPauseTime
trigger1 = !(HitDefAttr = SCA, AT)
var(13) = 1

[State -1, Juggle Count For Helpers]
type = ParentVarAdd
trigger1 = IsHelper
trigger1 = MoveHit = 1
trigger1 = !HitPauseTime
trigger1 = !(HitDefAttr = SCA, AT)
var(15) = 1

;------------------ Supers Lvl 3 ----------------------

[State -1, MAX AIR Super Galick Gun]
type = ChangeState
value = 3400
triggerall = var(1) = 0
triggerAll = !AILevel
triggerAll = command = "MAX Galick Gun"; AIR Super Galick Gun!!!!!!!!!!!!!!!!!!!!
triggerAll = RoundState = 2 && StateType = A
triggerAll = power >= 3000 && var(20) <= 60
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101]) || (StateNo = [600,650])
trigger2 = var(7)
trigger3 = StateNo = 1052 && Time >= 13
trigger4 = StateNo = 1200 && Time >= 23
trigger5 = StateNo = 1400 
trigger6 = StateNo = 1450

[State -1, LVL 3 Saiyan Rage/Dirty Fireworks]
type = ChangeState
value = 4000
triggerall = var(1) = 0
triggerAll = !AILevel
triggerAll = command = "Saiyan Rage/Dirty Fireworks"
triggerAll = RoundState = 2 && StateType != A
triggerAll = power >= 3000 && !var(20)
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
trigger2 = var(7)

[State -1, LVL 3 Final Flash]
type = ChangeState
value = 4100
triggerall = var(1) = 1
triggerAll = !AILevel
triggerAll = command = "Final Flash"
triggerAll = RoundState = 2 && StateType != A
triggerAll = power >= 3000 && !var(20)
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
trigger2 = var(7)

[State -1, LVL 3 Final Shine Attack]
type = ChangeState
value = 4200
triggerall = var(1) = 1
triggerAll = !AILevel
triggerAll = command = "Final Shine Attack"
triggerAll = RoundState = 2 && StateType != A
triggerAll = power >= 3000 && !var(20)
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
trigger2 = var(7)

[State -1, SSJ2]
type = ChangeState
value = 4500
triggerall = var(1) = 0 && Life >=500
triggerAll = !AILevel
triggerAll = command = "SSJ"
triggerAll = RoundState = 2 && StateType != A
triggerAll = power >= 3000 && !var(20)
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
trigger2 = var(7)

[State -1, Quick SSJ2]
type = ChangeState
value = 4502
triggerall = var(1) = 0 && Life <=499
triggerAll = !AILevel
triggerAll = command = "SSJ"
triggerAll = RoundState = 2 && StateType != A
triggerAll = power >= 3000 && !var(20)
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
trigger2 = var(7)

[State -1, Detransform]
type = ChangeState
value = 4501
triggerall = var(1) = 1
triggerAll = !AILevel
triggerAll = command = "SSJ"; Actually Back to Normal From SSJ
triggerAll = RoundState = 2 && StateType != A
triggerAll = power >= 0 && !var(20)
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
trigger2 = var(7)

;------------------ Supers Lvl 2 ----------------------

[State -1, MAX BBA]
type = ChangeState
value = 3600
triggerall = var(1) = 1
triggerAll = !AILevel
triggerAll = command = "Maximum Flasher"
triggerAll = RoundState = 2 && StateType != A
triggerAll = power >= 2000 && var(20) <= 60
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101]) || (StateNo = [200,450])
trigger2 = var(7)
trigger3 = (StateNo = [1000,1053])
trigger4 = StateNo = 1351

[State -1, Super Kick]
type = ChangeState
value = 3350
triggerAll = !AILevel
triggerAll = command = "Max Super Kick"
triggerAll = RoundState = 2 && StateType != A
triggerAll = power >= 2000 && var(20) <= 60
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101]) || (StateNo = [200,450])
trigger2 = var(7)
trigger3 = (StateNo = [1000,1053])
trigger4 = StateNo = 1351

[State -1, MAX Saiyan Beat Down]
type = ChangeState
value = 3550
triggerall = var(1) = 1
triggerAll = !AILevel
triggerAll = command = "Max Saiyan Beat Down"
triggerAll = RoundState = 2 && StateType != A
triggerAll = power >= 2000 && var(20) <= 60
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101]) || (StateNo = [200,450])
trigger2 = var(7)
trigger3 = (StateNo = [1000,1053])
trigger4 = StateNo = 1351

[State -1, MAX Galick Gun]
type = ChangeState
value = 3250
triggerall = var(1) = 0
triggerAll = !AILevel
triggerAll = command = "MAX Galick Gun"
triggerAll = RoundState = 2 && StateType != A
triggerAll = power >= 2000 && var(20) <= 60
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101]) || (StateNo = [200,450])
trigger2 = var(7)
trigger3 = (StateNo = [1000,1050])
trigger4 = StateNo = 1351

[State -1, Max Rapid Fire]
type = ChangeState
value = 3150
triggerall = var(1) = 1
triggerAll = !AILevel
triggerAll = command = "MAX Galick Gun" ;Max Rapid Fire
triggerAll = RoundState = 2 && StateType = A
triggerAll = power >= 2000 && var(20) <= 60
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101]) || (StateNo = [600,650])
trigger2 = var(7)
trigger3 = StateNo = 1200 && Time >= 23
trigger4 = StateNo = 1251 && Time >= 30
trigger5 = StateNo = 1400 
trigger6 = StateNo = 1450 

[State -1, Max Big Bang Attack]
type = ChangeState
value = 3050
triggerall = var(1) = 1
triggerAll = !AILevel
triggerAll = command = "Max Big Bang Attack"
triggerAll = RoundState = 2 && StateType != A
triggerAll = power >= 2000 && var(20) <= 60
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101]) || (StateNo = [200,450])
trigger2 = var(7)
trigger3 = (StateNo = [1000,1053])
trigger4 = StateNo = 1351

;------------------ Supers Lvl 1 ----------------------

[State -1, Big Bang Attack]
type = ChangeState
value = 3000
triggerall = var(1) = 1
triggerAll = !AILevel
triggerAll = command = "Big Bang Attack"
triggerAll = RoundState = 2 && StateType != A
triggerAll = power >= 1000 && var(20) <= 60
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101]) || (StateNo = [200,450])
trigger2 = var(7)
trigger3 = (StateNo = [1000,1053])
trigger4 = StateNo = 1351

[State -1, Super Kick]
type = ChangeState
value = 3300
triggerAll = !AILevel
triggerAll = command = "Super Kick"
triggerAll = RoundState = 2 && StateType != A
triggerAll = power >= 1000 && var(20) <= 60
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101]) || (StateNo = [200,450])
trigger2 = var(7)
trigger3 = (StateNo = [1000,1053])
trigger4 = StateNo = 1351

[State -1, Galick Gun]
type = ChangeState
value = 3200
triggerall = var(1) = 0
triggerAll = !AILevel
triggerAll = command = "Galick Gun"
triggerAll = RoundState = 2 && StateType != A
triggerAll = power >= 1000 && var(20) <= 60
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101]) || (StateNo = [200,450])
trigger2 = var(7)
trigger3 = (StateNo = [1000,1050])
trigger4 = StateNo = 1351

[State -1, Saiyan Beat Down]
type = ChangeState
value = 3500
triggerall = var(1) = 1
triggerAll = !AILevel
triggerAll = command = "Saiyan Beat Down"
triggerAll = RoundState = 2 && StateType != A
triggerAll = power >= 1000 && var(20) <= 60
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101]) || (StateNo = [200,450])
trigger2 = var(7)
trigger3 = (StateNo = [1000,1050])
trigger4 = StateNo = 1351

[State -1, Rapid Fire]
type = ChangeState
value = 3100
triggerall = var(1) = 1
triggerAll = !AILevel
triggerAll = command = "Big Bang Attack"; !!!!!!It's Not The Big Bang Attack!!! It's Rapid Fire(Same Command)
triggerAll = RoundState = 2 && StateType = A
triggerAll = power >= 1000 && var(20) <= 60
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101]) || (StateNo = [600,650])
trigger2 = var(7)
trigger3 = StateNo = 1200 && Time >= 27
trigger4 = StateNo = 1251 && Time >= 38
trigger5 = (StateNo = [1400,1450]) 


;------------------ EX Specials ----------------------

[State -1, EX Elbow Rush]
type = ChangeState
value = 1050
triggerAll = !AILevel
triggerAll = command = "EX Elbow Rush" 
triggerAll = RoundState = 2 && StateType != A
triggerAll = power >= 500 && var(20) <= 60
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101]) || (StateNo = [200,450])
trigger2 = var(6)

[State -1, EX Rising Kick]
type = ChangeState
value = 1150
triggerAll = !AILevel
triggerAll = command = "EX Rising Kick" 
triggerAll = RoundState = 2 && StateType != A
triggerAll = power >= 500 && var(20) <= 60
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101]) || (StateNo = [200,450])
trigger2 = var(6)

[State -1, EX Knee Bash]
type = ChangeState
value = 1250
triggerAll = !AILevel
triggerAll = command = "EX Knee Bash"
triggerAll = RoundState = 2 && StateType != A
triggerAll = power >= 500 && var(20) <= 60
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101]) || (StateNo = [200,450])
trigger2 = var(6)

[State -1, EX AirFireBlast]
type = ChangeState
value = 1450
triggerAll = !AILevel
triggerAll = command = "EX FireBlast";IN AIR!!!!!!
triggerAll = RoundState = 2 && StateType = A
triggerAll = power >= 500 && var(20) <= 60
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101]) || (StateNo = [200,450])
trigger2 = var(6)
trigger3 = StateNo = 1200 && Time >= 27
trigger4 = StateNo = 1400 && Time >= 20

[State -1, FireBlast]
type = ChangeState
value = 1350
triggerAll = !AILevel
triggerAll = command = "EX FireBlast"
triggerAll = RoundState = 2 && StateType != A
triggerAll = power >= 500 && var(20) <= 60
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101]) || (StateNo = [200,450])
trigger2 = var(6)

[State -1, EX DashKick]
type = ChangeState
value = 1550
triggerAll = !AILevel
triggerAll = command = "EX DashKick"
triggerAll = RoundState = 2 && StateType != A
triggerAll = power >= 500 && var(20) <= 60
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101]) || (StateNo = [200,450])
trigger2 = var(6)
;------------------ Specials ----------------------

[State -1, Elbow Rush]
type = ChangeState
value = 1000
triggerAll = !AILevel
triggerAll = command = "Elbow Rush"
triggerAll = RoundState = 2 && StateType != A
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101]) || (StateNo = [200,450])
trigger2 = var(6)

[State -1, RisngKick]
type = ChangeState
value = 1100
triggerAll = !AILevel
triggerall = command = "RisngKicka" || command = "RisngKickb" || command = "RisngKickc"
triggerAll = RoundState = 2 && StateType != A
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101]) || (StateNo = [200,450])
trigger2 = var(6)

[State -1, Knee Bash]
type = ChangeState
value = 1200
triggerAll = !AILevel
triggerAll = command = "Knee Bash"
triggerAll = RoundState = 2 && StateType != A
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101]) || (StateNo = [200,450])
trigger2 = var(6)

[State -1, FireBlast]
type = ChangeState
value = 1300
triggerAll = !AILevel
triggerAll = command = "FireBlast"
triggerAll = RoundState = 2 && StateType != A
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101]) || (StateNo = [200,450])
trigger2 = var(6)

[State -1, AirFireBlast]
type = ChangeState
value = 1400
triggerAll = !AILevel
triggerAll = command = "FireBlast";IN AIR!!!!
triggerAll = RoundState = 2 && StateType = A
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101]) || (StateNo = [200,450])
trigger2 = var(6)
trigger3 = StateNo = 1200 && Time >= 27

[State -1, DashKick]
type = ChangeState
value = 1500
triggerAll = !AILevel
triggerAll = command = "DashKick"
triggerAll = RoundState = 2 && StateType != A
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101]) || (StateNo = [200,450])
trigger2 = var(6)

;--------------------------------------------------

[State -1, Zero Counter]
type = ChangeState
value = 750
triggerAll = !AILevel
trigger1 = StateNo = 150 || StateNo = 152
trigger1 = command = "412p" || command = "412k"
trigger1 = RoundState = 2 && StateType != A
trigger1 = power >= 1000 && !var(20)

[State -1, Custom Combo]
type = ChangeState
value = ifElse(StateType = A, 905, 900)
triggerAll = !AILevel
trigger1 = command = "c+z"&&!var(54)
trigger1 = RoundState = 2
trigger1 = power >= 1000 && !var(20)
trigger1 = ctrl || StateNo = 52 || (StateNo = [100,101])
trigger1 = !var(41)

[State -1, MAX Mode]
type = ChangeState
value = 770
triggerall = command = "c+z"&&var(54)
triggerall = RoundState = 2 && StateType != A
triggerall = var(53) <= 0 && Power >= 1000
trigger1 = ctrl || (Stateno = [100,101])

[State -1, Roll Forward]
type = ChangeState
value = 710
triggerAll = !AILevel
triggerAll = command = "a+x"
triggerAll = RoundState = 2 && StateType != A
trigger1 = (ctrl || (StateNo = [100,101])) && command = "holdfwd"
trigger2 = var(20) && var(4)

[State -1, Roll Backward]
type = ChangeState
value = 715
triggerAll = !AILevel
triggerAll = command = "a+x"
triggerAll = RoundState = 2 && StateType != A
trigger1 = (ctrl || (StateNo = [100,101])) && command = "holdback"

[State -1, Dodge]
type = ChangeState
value = 700
triggerAll = !AILevel
triggerAll = command = "a+x"
triggerAll = RoundState = 2 && StateType != A
trigger1 = (ctrl || (StateNo = [100,101]))

[State -1, Power Charging]
type = ChangeState
value = 730
triggerAll = !AILevel
trigger1 = command = "holdb" && command = "holdy"
trigger1 = RoundState = 2 && StateType != A
trigger1 = power < const(data.power) && power < PowerMax && !var(20)
trigger1 = ctrl || (StateNo = [100,101])

[State -1, Dash Forward/Run]
type = ChangeState
value = 100
triggerAll = !AILevel
trigger1 = command = "FF"
trigger1 = roundstate = 2 && StateType = S
trigger1 = ctrl

[State -1, Dash Backward]
type = ChangeState
value = 105
triggerAll = !AILevel
trigger1 = command = "BB"
trigger1 = RoundState = 2 && StateType = S
trigger1 = ctrl

[State -1, Throw]
type = ChangeState
value = 800
triggerAll = !AILevel
trigger1 = (command = "holdfwd" || command = "holdback") && command = "pp" 
trigger1 = RoundState = 2 && StateType = S
trigger1 = ctrl

[State -1, Throw]
type = ChangeState
value = 820
triggerAll = !AILevel
trigger1 = (command = "holdfwd" || command = "holdback") && command = "kk"
trigger1 = RoundState = 2 && StateType = S
trigger1 = ctrl

[State -1, Standing Heavy Punch]
type = ChangeState
value = 220 
triggerAll = !AILevel
triggerAll = command != "holddown" && command = "z"
triggerAll = StateType != A
trigger1 = ctrl || (StateNo = [100,101])
trigger2 = var(4)
trigger3 = (StateNo = 210)

[State -1, Standing Heavy Kick]
type = ChangeState
value = 250 
triggerAll = !AILevel
triggerAll = command != "holddown" && command = "c"
triggerAll = StateType != A
trigger1 = ctrl || (StateNo = [100,101])
trigger2 = var(4)
trigger3 = (StateNo = 240)

[State -1, Standing Medium Punch]
type = ChangeState
value = 210
triggerAll = !AILevel
triggerAll = command != "holddown" && command = "y"
triggerAll = StateType != A
trigger1 = ctrl || (StateNo = [100,101])
trigger2 = var(4)
trigger3 = (StateNo = 200)

[State -1, Standing Medium Kick]
type = ChangeState
value = 240 
triggerAll = !AILevel
triggerAll = command != "holddown" && command = "b"
triggerAll = StateType != A
trigger1 = ctrl || (StateNo = [100,101])
trigger2 = var(4)
trigger3 = (StateNo = 230)

[State -1, Standing Light Punch]
type = ChangeState
value = 200 
triggerAll = !AILevel
triggerAll = command != "holddown" && command = "x"
triggerAll = StateType != A
trigger1 = ctrl || (StateNo = [100,101])
trigger2 = (StateNo = 200 || StateNo = 230 || StateNo = 400 || StateNo = 430)
trigger3 = var(4)

[State -1, Standing Light Kick]
type = ChangeState
value = 230 
triggerAll = !AILevel
triggerAll = command != "holddown" && command = "a"
triggerAll = StateType != A
trigger1 = ctrl || (StateNo = [100,101])
trigger2 = (StateNo = 200 || StateNo = 400 || StateNo = 430)
trigger3 = var(4)

[State -1, Crouching Heavy Punch]
type = ChangeState
value = 420
triggerAll = !AILevel
triggerAll = command = "holddown" && command = "z"
triggerAll = StateType != A
trigger1 = (ctrl || (StateNo = [100,101]))
trigger2 = var(20) && (stateno = [200, 699]) && (movecontact = [1, 24])
trigger3 = var(20) && (stateno = [1000, 2999]) && statetype != A && (movecontact = [1, 24])
trigger4 = var(20) && (stateno = [1000, 2999]) && statetype != A && numhelper(stateno + 5)
trigger4 = helper(stateno + 5), var(3)
trigger5 = var(41) && (movecontact = [1, 8])
trigger5 = stateno = 200 || stateno = 210 || stateno = 230 || stateno = 240 || stateno = 400 || stateno = 410 || stateno = 430 || stateno = 440

[State -1, Crouching Heavy Kick]
type = ChangeState
value = 450
triggerAll = !AILevel
triggerAll = command = "holddown" && command = "c"
triggerAll = StateType != A
trigger1 = (ctrl || (StateNo = [100,101]))
trigger2 = var(20) && (stateno = [200, 699]) && (movecontact = [1, 24])
trigger3 = var(20) && (stateno = [1000, 2999]) && statetype != A && (movecontact = [1, 24])
trigger4 = var(20) && (stateno = [1000, 2999]) && statetype != A && numhelper(stateno + 5)
trigger4 = helper(stateno + 5), var(3)
trigger5 = var(41) && (movecontact = [1, 7])
trigger5 = (stateno = [200,240]) || stateno = 400 || stateno = 410 || stateno = 430 || stateno = 440

[State -1, Crouching Medium Punch]
type = ChangeState
value = 410
triggerAll = !AILevel
triggerAll = command  ="holddown" && command = "y"
triggerAll = StateType != A
trigger1 = ctrl || (StateNo = [100,101])
trigger2 = var(4)

[State -1, Crouching Medium Kick]
type = ChangeState
value = 440
triggerAll = !AILevel
triggerAll = command = "holddown" && command = "b"
triggerAll = StateType != A
trigger1 = (ctrl || (StateNo = [100,101]))
trigger2 = var(20) && (stateno = [200, 699]) && (movecontact = [1, 24])
trigger3 = var(20) && (stateno = [1000, 2999]) && statetype != A && (movecontact = [1, 24])
trigger4 = var(20) && (stateno = [1000, 2999]) && statetype != A && numhelper(stateno + 5)
trigger4 = helper(stateno + 5), var(3)
trigger5 = var(41) && (movecontact = [1, 4])
trigger5 = stateno = 200 || stateno = 230 || stateno = 400 || stateno = 430

[State -1, Crouching Light Punch]
type = ChangeState
value = 400
triggerAll = !AILevel
triggerAll = command = "holddown" && command = "x"
triggerAll = StateType != A
trigger1 = (ctrl || (StateNo = [100,101]))
trigger2 = (stateno = 200 || stateno = 400) && time >= 5
trigger3 = var(20) && (stateno = [200, 699]) && (movecontact = [1, 24])
trigger4 = var(20) && (stateno = [1000, 2999]) && statetype != A && (movecontact = [1, 24])
trigger5 = var(20) && (stateno = [1000, 2999]) && statetype != A && numhelper(stateno + 5)
trigger5 = helper(stateno + 5), var(3)

[State -1, Crouching Light Kick]
type = ChangeState
value = 430
triggerAll = !AILevel
triggerAll = command = "holddown" && command = "a"
triggerAll = StateType != A
trigger1 = (ctrl || (StateNo = [100,101]))
trigger2 = (stateno = 200 || stateno = 400) && time >= 5
trigger3 = var(20) && (stateno = [200, 699]) && (movecontact = [1, 24])
trigger4 = var(20) && (stateno = [1000, 2999]) && statetype != A && (movecontact = [1, 24])
trigger5 = var(20) && (stateno = [1000, 2999]) && statetype != A && numhelper(stateno + 5)
trigger5 = helper(stateno + 5), var(3)

[State -1, Jumping Heavy Punch]
type = ChangeState
value = 620
triggerAll = !AILevel
triggerAll = command = "z"
triggerAll = StateType = A
trigger1 = (ctrl || (StateNo = [100,101]))
trigger2 = var(20) && (stateno = [200, 699]) && (movecontact = [1, 24])
trigger3 = var(20) && (stateno = [1000, 2999]) && statetype != A && (movecontact = [1, 24])
trigger4 = var(20) && (stateno = [1000, 2999]) && statetype != A && numhelper(stateno + 5)
trigger4 = helper(stateno + 5), var(3)
trigger5 = var(41) && (movecontact = [1, 9])
trigger5 = stateno = 600 || stateno = 610 || stateno = 630 || stateno = 640

[State -1, Neutral Jumping Heavy Kick]
type = ChangeState
value = 650
triggerAll = !AILevel
triggerAll = command = "c"
triggerAll = StateType = A
trigger1 = (ctrl || (StateNo = [100,101]))
trigger2 = var(20) && (stateno = [200, 699]) && (movecontact = [1, 24])
trigger3 = var(20) && (stateno = [1000, 2999]) && statetype != A && (movecontact = [1, 24])
trigger4 = var(20) && (stateno = [1000, 2999]) && statetype != A && numhelper(stateno + 5)
trigger4 = helper(stateno + 5), var(3)
trigger5 = var(41) && (movecontact = [1, 9])
trigger5 = stateno = 600 || stateno = 610 || stateno = 630 || stateno = 640

[State -1, Jumping Medium Punch]
type = ChangeState
value = 610
triggerAll = !AILevel
triggerAll = command = "y"
triggerAll = StateType = A
trigger1 = (ctrl || (StateNo = [100,101]))
trigger2 = var(20) && (stateno = [200, 699]) && (movecontact = [1, 24])
trigger3 = var(20) && (stateno = [1000, 2999]) && statetype != A && (movecontact = [1, 24])
trigger4 = var(20) && (stateno = [1000, 2999]) && statetype != A && numhelper(stateno + 5)
trigger4 = helper(stateno + 5), var(3)
trigger5 = var(41) && (movecontact = [1, 9])
trigger5 = stateno = 600 || stateno = 630

[State -1, Jumping Medium Kick]
type = ChangeState
value = 640
triggerAll = !AILevel
triggerAll = command = "b"
triggerAll = StateType = A
trigger1 = (ctrl || (StateNo = [100,101]))
trigger2 = var(20) && (stateno = [200, 699]) && (movecontact = [1, 24])
trigger3 = var(20) && (stateno = [1000, 2999]) && statetype != A && (movecontact = [1, 24])
trigger4 = var(20) && (stateno = [1000, 2999]) && statetype != A && numhelper(stateno + 5)
trigger4 = helper(stateno + 5), var(3)
trigger5 = var(41) && (movecontact = [1, 8])
trigger5 = stateno = 600 || stateno = 630

[State -1, Jumping Light Punch]
type = ChangeState
value = 600
triggerAll = !AILevel
triggerAll = command = "x"
triggerAll = StateType = A
trigger1 = (ctrl || (StateNo = [100,101]))
trigger2 = var(20) && (stateno = [200, 699]) && (movecontact = [1, 24])
trigger3 = var(20) && (stateno = [1000, 2999]) && statetype != A && (movecontact = [1, 24])
trigger4 = var(20) && (stateno = [1000, 2999]) && statetype != A && numhelper(stateno + 5)
trigger4 = helper(stateno + 5), var(3)

[State -1, Jumping Light Kick]
type = ChangeState
value = 630
triggerAll = !AILevel
triggerAll = command = "a"
triggerAll = StateType = A
trigger1 = (ctrl || (StateNo = [100,101]))
trigger2 = var(20) && (stateno = [200, 699]) && (movecontact = [1, 24])
trigger3 = var(20) && (stateno = [1000, 2999]) && statetype != A && (movecontact = [1, 24])
trigger4 = var(20) && (stateno = [1000, 2999]) && statetype != A && numhelper(stateno + 5)
trigger4 = helper(stateno + 5), var(3)

[State -1, Taunt]
type = ChangeState
value = 195
triggerall = command = "s"
triggerall = !AILevel&&Roundstate=2&&StateType != A
triggerall = StateNo != [200,699]
trigger1 = ctrl || (StateNo = [100,101])
trigger2 = var(5)

;==============================================================================================
;===========================================< A.I >============================================
;==============================================================================================

[State -1, Fall Recovery (Air)]
type = ChangeState
value = 5210
trigger1 = AILevel && NumEnemy
trigger1 = RoundState = 2 && Alive
trigger1 = StateNo = 5050 && CanRecover
trigger1 = vel y > 0 && pos y < -20
trigger1 = Random < (25 * (AILevel ** 2 / 64.0))

[State -1, Fall Recovery (Ground)]
type = ChangeState
value = 5200
trigger1 = AILevel && NumEnemy
trigger1 = RoundState = 2 && Alive
trigger1 = StateNo = 5050 && GetHitVar(fall.recover)
trigger1 = vel y > 0 && pos y >= -20
trigger1 = Random < (100 * (AILevel ** 2 / 64.0))

[State -1, Jump]
type = ChangeState
value = 40
trigger1 = AILevel && NumEnemy
trigger1 = RoundState = 2 && StateType != A && ctrl
trigger1 = EnemyNear, MoveType = A && P2BodyDist x < 160 && EnemyNear, HitDefAttr = SC, AT

[State -1, Roll Forward]
type = ChangeState
value = 710
trigger1 = AILevel && NumEnemy
trigger1 = RoundState = 2 && StateType != A
trigger1 = Random < (50 * (AILevel ** 2 / 64.0))
trigger1 = (ctrl || (StateNo = [100,101])) && var(20) <= 164 && !var(26)
trigger1 = (EnemyNear, MoveType = A) && !(EnemyNear, HitDefAttr = SCA, AT) && (P2BodyDist x = [92,122])

[State -1, Dodge]
type = ChangeState
value = 700
trigger1 = AILevel && NumEnemy
trigger1 = RoundState = 2 && StateType != A
trigger1 = Random < (50 * (AIlevel ** 2 / 64.0))
trigger1 = (ctrl || (StateNo = [100,101])) && var(20) <= 164 && !var(26)
trigger1 = (EnemyNear, MoveType = A) && !(EnemyNear, HitDefAttr = SCA, AT) && (P2BodyDist x = [0,60])

[State -1, Dodge]
type = ChangeState
value = 700
triggerall = AIlevel && numenemy
triggerall = (facing=1 && (enemy,facing=-1)) || (facing=-1 && (enemy,facing=1))
triggerall = (ctrl || StateNo = 52 || (StateNo = [100,101])) && Random < (145 * (AILevel ** 2 / 64.0))
triggerall = roundstate=2  && statetype != A
trigger1 = enemynear,movetype=A && (p2bodydist x=[0,40])&&(p2bodydist y=[0,0])
trigger2 = ((enemynear,numproj) || (enemynear,numhelper)) && inguarddist && p2bodydist x>=25 
trigger3 = RoundState = 2 && InGuardDist
trigger3 = ctrl && (StateNo != [120, 155]) && !var(20)
trigger3 = !var(26) || P2BodyDist x >= 40
trigger3 = !(EnemyNear, HitDefAttr = SCA, AT) && (EnemyNear, Time < 120)
trigger3 = StateType != A || P2StateType = A
trigger3 = ifElse(StateType = A, ((var(3) != [1, 2]) || StateNo = 5210), 1)
trigger3 = Random <  (ifElse((P2StateNo = [200, 699]), 125, ifElse((P2StateNo = [1000,2999]), 333, 1000)) * (AILevel ** 2 / 64.0))

[State -1, Custom Combo]
type = changestate
value = ifelse(statetype = A, 905, 900)
trigger1 = AIlevel && numenemy
trigger1 = roundstate = 2 && (statetype != A || (vel x > 0 && vel y >= 0))
trigger1 = power >= 1000 && !var(20)
trigger1 = (ctrl || stateno = 52 || (stateno = [100, 101]))
trigger1 = (enemynear, movetype = A) && (p2bodydist x = [0, 40]) && (p2dist y = [ -60, 60]) && (enemynear, vel y >= 0)
trigger1 = (enemynear, stateno = [200, 699]) && random < (250 * (AIlevel ** 2 / 64.0))

[State -1, AI Standing Parry]
type = hitoverride
triggerall = AIlevel && numenemy
triggerall = roundstate = 2 && statetype != A
trigger1 = ((ctrl || (StateNo = [100,101])) && random < (75 * (AIlevel ** 2 / 64.0))) || ((stateno = [700, 701]) && random < (250 * (AIlevel ** 2 / 64.0)))
trigger1 = var(21) := 1
attr = SA, AA, AP
stateno = 760
slot = 0
time = 8

[State -1, AI Crouching Parry]
type = hitoverride
triggerall = AIlevel && numenemy
triggerall = roundstate = 2 && statetype != A
trigger1 = ((ctrl || (StateNo = [100,101])) && random < (75 * (AIlevel ** 2 / 64.0))) || ((stateno = [700, 701]) && random < (250 * (AIlevel ** 2 / 64.0)))
trigger1 = var(21) := 2
attr = C, AA, AP
stateno = 761
slot = 0
time = 8

[State -1, AI Air Parry]
type = hitoverride
triggerall = AIlevel && numenemy
triggerall = roundstate = 2 && statetype = A
trigger1 = ((ctrl || (StateNo = [100,101])) && random < (75 * (AIlevel ** 2 / 64.0))) || (stateno = 702 && random < (250 * (AIlevel ** 2 / 64.0)))
trigger1 = var(21) := 3
attr = SA, AA, AP
stateno = 762
forceair = 1
slot = 0
time = 7

[State -1, Dash Backward]
type = ChangeState
value = 105
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType = S
triggerAll = ctrl && (StateNo != [100,106]) && var(20) <= 150 && !var(26)
trigger1 = (EnemyNear, MoveType = A) && BackEdgeDist >= 80 && (P2BodyDist x = [80,120]) && (EnemyNear, vel x)
trigger1 = Random < (ifElse((EnemyNear, HitDefAttr = SC, AT), 150, 50) * (AILevel ** 2 / 64.0))
trigger2 = (P2BodyDist x = [0,80]) && BackEdgeBodyDist >= 80
trigger2 = EnemyNear, StateNo = 5120 && EnemyNear, AnimTime = -4 && Random < (750 * (AILevel ** 2 / 64.0))

[State -1, Guard]
type = ChangeState
value = 120
trigger1 = AILevel && NumEnemy
trigger1 = RoundState = 2 && InGuardDist
trigger1 = ctrl && (StateNo != [120, 155]) && !var(20)
trigger1 = !var(26) || P2BodyDist x >= 40
trigger1 = !(EnemyNear, HitDefAttr = SCA, AT) && (EnemyNear, Time < 120)
trigger1 = StateType != A || P2StateType = A
trigger1 = ifElse(StateType = A, ((var(3) != [1, 2]) || StateNo = 5210), 1)
trigger1 = Random < (ifElse((P2StateNo = [200, 699]), 100, ifElse((P2StateNo = [1000,2999]), 333, 1000)) * (AILevel ** 2 / 64.0))

[State -1, Zero Counter]
type = ChangeState
value = 750
trigger1 = AILevel && NumEnemy
trigger1 = StateNo = 150 || StateNo = 152
trigger1 = RoundState = 2 && StateType != A
trigger1 = Power >= 1000 && var(20) <= 60
trigger1 = Random < (25 * (AILevel ** 2 / 64.0))
trigger1 = (P2BodyDist x = [0,50]) && (Life < 0.5 * LifeMax)

[State -1, Power Charge]
type = ChangeState
value = 730
triggerAll = AILevel && NumEnemy
trigger1 = RoundState = 2 && StateType != A
trigger1 = Power < const(data.power) && !var(20)
trigger1 = ctrl && Power < const(data.power) && Power < PowerMax && !var(20) && PrevStateNo != 5120
trigger1 = !InGuardDist && P2BodyDist x >= 160 && Random < (50 * (AILevel ** 2 / 64.0))

[State -1, Throw]
type = ChangeState
value = ifelse((random < 100),820,800)
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType = S
triggerAll = P2StateType != A && P2StateType != L && P2MoveType != H
triggerAll = (P2BodyDist x = [-20,40]) && P2BodyDist y = 0
trigger1 = ctrl && Random < (125 * (AIlevel ** 2 / 64.0))
trigger2 = ctrl && (P2StateNo = [120,140]) && Random < (400 * (AILevel ** 2 / 64.0))

[State -1, Run]
type = ChangeState
value = 100
trigger1 = AILevel && NumEnemy
trigger1 = RoundState = 2 && StateType = S
trigger1 = ctrl && (StateNo != [100,106])
trigger1 = (EnemyNear, MoveType != A) && P2BodyDist x >= 160 && Random < (25 * (AILevel ** 2 / 64.0))

[State -1, SHP]
type = changestate
value = 220
triggerall = AIlevel && numenemy
triggerall = roundstate = 2 && statetype != A
triggerall = (p2bodydist x = [0, 80]) && (p2dist y = [ -50, 50]) && p2statetype != C && p2statetype != L && !(enemynear, hitfall)
triggerall = (p2stateno != [120, 155]) && p2movetype != A && !(enemynear, hitfall)
triggerall = (enemynear, const(size.head.pos.y) <= -40) || (enemynear, statetype = A)
trigger1 = (ctrl || (StateNo = [100,101])) && p2bodydist x < 25 && random < (100 * (AIlevel ** 2 / 64.0))
trigger2 = (stateno = 200 || stateno = 210 || stateno = 230 || stateno = 240 || stateno = 400 || stateno = 410 || stateno = 430 || stateno = 440)
trigger2 = var(41) && p2bodydist x <= 50 && (movehit = [1, 16]) && random < (250 * (AIlevel ** 2 / 64.0))

[State -1, SHK]
type = changestate
value = 250
triggerall = AIlevel && numenemy
triggerall = roundstate = 2 && statetype != A
triggerall = (p2bodydist x = [0, 70]) && (p2dist y = [ -50, 50]) && p2statetype != C && p2statetype != L && !(enemynear, hitfall)
triggerall = (p2stateno != [120, 155]) && p2movetype != A && !(enemynear, hitfall)
triggerall = (enemynear, const(size.head.pos.y) <= -40) || (enemynear, statetype = A)
trigger1 = (stateno = 200 || stateno = 210 || stateno = 230 || stateno = 240 || stateno = 400 || stateno = 410 || stateno = 430 || stateno = 440)
trigger1 = var(41) && p2bodydist x = 0 && (movehit = [1, 16]) && random < (250 * (AIlevel ** 2 / 64.0))

[State -1, SMP]
type = changestate
value = 210
triggerall = AIlevel && numenemy
triggerall = roundstate = 2 && statetype != A
triggerall = (p2bodydist x = [0, 60]) && (p2dist y = [ -50, 50]) && p2statetype != C && p2statetype != L && !(enemynear, hitfall)
triggerall = (p2stateno != [120, 155]) && p2movetype != A && !(enemynear, hitfall)
triggerall = (enemynear, const(size.head.pos.y) <= -40) || (enemynear, statetype = A)
trigger1 = (stateno = 200 || stateno = 400 || stateno = 230 || stateno = 430)
trigger1 = var(41) && p2bodydist x <= 16 && (movehit = [1, 16]) && random < (250 * (AIlevel ** 2 / 64.0))

[State -1, SMK]
type = changestate
value = 240
triggerall = AIlevel && numenemy
triggerall = roundstate = 2 && statetype != A
triggerall = (p2bodydist x = [0, 60]) && (p2dist y = [ -50, 50]) && p2statetype != C && p2statetype != L && !(enemynear, hitfall)
triggerall = (p2stateno != [120, 155]) && p2movetype != A && !(enemynear, hitfall)
triggerall = (enemynear, const(size.head.pos.y) <= -40) || (enemynear, statetype = A)
trigger1 = (stateno = 200 || stateno = 400 || stateno = 230 || stateno = 430)
trigger1 = var(41) && p2bodydist x <= 16 && (movehit = [1, 16]) && random < (250 * (AIlevel ** 2 / 64.0))

[State -1, SLP]
type = changestate
value = 200
triggerall = AIlevel && numenemy
triggerall = roundstate = 2 && statetype != A && !inguarddist
triggerall = (p2bodydist x = [0, 60]) && (p2dist y = [ -50, 50]) && p2statetype != C && p2statetype != L && !(enemynear, hitfall)
triggerall = (p2stateno != [120, 155]) && p2movetype != A && !(enemynear, hitfall)
triggerall = (enemynear, const(size.head.pos.y) <= -40) || (enemynear, statetype = A)
trigger1 = (ctrl || (StateNo = [100,101])) && random < (100 * (AIlevel ** 2 / 64.0))
;trigger2 = (stateno = 200 || stateno = 230 || stateno = 245) && time >= 5 && random < (50 * (AIlevel ** 2 / 64.0))

[State -1, SLK]
type = changestate
value = 230
triggerall = AIlevel && numenemy
triggerall = roundstate = 2 && statetype != A && !inguarddist
triggerall = (p2bodydist x = [0, 60]) && (p2dist y = [ -50, 50]) && p2statetype != C && p2statetype != L && !(enemynear, hitfall)
triggerall = (p2stateno != [120, 155]) && p2movetype != A && !(enemynear, hitfall)
trigger1 = (stateno = 200 || stateno = 400)
trigger1 = p2bodydist x <= 4 && ((movehit = [1, 16]) = [1, 4]) && random < (250 * (AIlevel ** 2 / 64.0))

[State -1, CHP]
type = changestate
value = 420
triggerall = AIlevel && numenemy
triggerall = roundstate = 2 && statetype != A && !inguarddist
triggerall = (p2bodydist x = [0, 40]) && (p2dist y = [ -50, 50]) && p2statetype != L && !(enemynear, hitfall)
triggerall = (p2stateno != [120, 155]) && p2movetype != A && !(enemynear, hitfall)
triggerall = (enemynear, const(size.head.pos.y) <= -40) || (enemynear, statetype = A)
trigger1 = (stateno = 200 || stateno = 210 || stateno = 230 || stateno = 240 || stateno = 400 || stateno = 410 || stateno = 430 || stateno = 440)
trigger1 = var(41) && p2bodydist x <= 4 && ((movehit = [1, 16]) = [1, 4]) && random < (250 * (AIlevel ** 2 / 64.0))

[State -1, CHK]
type = changestate
value = 450
triggerall = AIlevel && numenemy
triggerall = roundstate = 2 && statetype != A && !inguarddist
triggerall = (p2bodydist x = [0, 60]) && (p2dist y = [ -50, 50]) && p2statetype != A && p2stateno != 5120
triggerall = ((p2stateno != [120, 155]) || p2stateno = 130 || p2stateno = 150 || p2stateno = 151) && p2movetype != A
trigger1 = (stateno = 200 || stateno = 210 || stateno = 230 || stateno = 240 || stateno = 400 || stateno = 410 || stateno = 430 || stateno = 440)
trigger1 = var(41) && p2bodydist x <= 30 && ((movecontact = [1, 32]) = [1, 4]) && random < (250 * (AIlevel ** 2 / 64.0))

[State -1, CMP]
type = changestate
value = 410
triggerall = AIlevel && numenemy
triggerall = roundstate = 2 && statetype != A && !inguarddist
triggerall = (p2bodydist x = [0, 45]) && (p2dist y = [ -50, 50]) && p2statetype = C
triggerall = (p2stateno != [120, 155]) && p2movetype != A && !(enemynear, hitfall)
trigger1 = (stateno = 200 || stateno = 400 || stateno = 230 || stateno = 430)
trigger1 = var(41) && p2bodydist x <= 20 && ((movehit = [1, 16]) = [1, 4]) && random < (250 * (AIlevel ** 2 / 64.0))

[State -1, CMK]
type = changestate
value = 440
triggerall = AIlevel && numenemy
triggerall = roundstate = 2 && statetype != A && !inguarddist
triggerall = (p2bodydist x = [0, 70]) && (p2dist y = [ -50, 50]) && p2statetype = S
triggerall = ((p2stateno != [120, 155]) || p2stateno = 130 || p2stateno = 150 || p2stateno = 151) && p2movetype != A
trigger1 = (stateno = 200 || stateno = 400 || stateno = 230 || stateno = 430)
trigger1 = var(41) && p2bodydist x <= 20 && ((movehit = [1, 16]) = [1, 4]) && random < (250 * (AIlevel ** 2 / 64.0))

[State -1, CLP]
type = changestate
value = 400
triggerall = AIlevel && numenemy
triggerall = roundstate = 2 && statetype != A && !inguarddist && !(enemynear, hitfall)
triggerall = (p2bodydist x = [0, 50]) && (p2dist y = [ -50, 50]) && p2statetype = C
triggerall = (p2stateno != [120, 155]) && p2movetype != A
trigger1 = (ctrl || (StateNo = [100,101])) && random < (100 * (AIlevel ** 2 / 64.0))
;trigger2 = (stateno = 200 || stateno = 230 || stateno = 245) && time >= 5 && random < (50 * (AIlevel ** 2 / 64.0))

[State -1, CLK]
type = changestate
value = 430
triggerall = AIlevel && numenemy
triggerall = roundstate = 2 && statetype != A && !inguarddist
triggerall = (p2bodydist x = [0, 36]) && (p2dist y = [ -50, 50]) && p2statetype = S
triggerall = ((p2stateno != [120, 155]) || p2stateno = 130 || p2stateno = 150 || p2stateno = 151) && p2movetype != A
trigger1 = (ctrl || (StateNo = [100,101]))
trigger1 = random < (100 * (AIlevel ** 2 / 64.0)) || (p2stateno = 130 || p2stateno = 150 || p2stateno = 151) || p2stateno = 5110
;trigger2 = (stateno = 200 || stateno = 230 || stateno = 245) && time >= 5 && random < (50 * (AIlevel ** 2 / 64.0))

[State -1, AHP]
type = changestate
value = 620
triggerall = AIlevel && numenemy
triggerall = roundstate = 2 && statetype = A && !inguarddist
triggerall = (p2bodydist x = [0, 45]) && (p2dist y = [ -50, 50]) && p2statetype != L && !(enemynear, hitfall)
trigger1 = (ctrl || (StateNo = [100,101])) && random < (25 * (AIlevel ** 2 / 64.0))
trigger2 = var(41) && (stateno = 640 || stateno = 630 || stateno = 610 || stateno = 600) && var(9) != 2 && ((movehit = [1, 16]) = [1, 4]) && random < (250 * (AIlevel ** 2 / 64.0))

[State -1, AHK]
type = changestate
value = 650
triggerall = AIlevel && numenemy
triggerall = roundstate = 2 && statetype = A && !inguarddist
triggerall = (p2bodydist x = [0, 50]) && (p2dist y = [ -50, 50]) && p2statetype != L && !(enemynear, hitfall)
trigger1 = (ctrl || (StateNo = [100,101])) && random < (25 * (AIlevel ** 2 / 64.0))
trigger2 = var(41) && (stateno = 640 || stateno = 630 || stateno = 610 || stateno = 600) && var(9) != 2 && ((movehit = [1, 16]) = [1, 4]) && random < (250 * (AIlevel ** 2 / 64.0))

[State -1, AMP]
type = changestate
value = 610
triggerall = AIlevel && numenemy
triggerall = roundstate = 2 && statetype = A
triggerall = (p2bodydist x = [0, 100]) && (p2dist y = [ -50, 50]) && p2statetype != L && !(enemynear, hitfall)
trigger1 = (ctrl || (StateNo = [100,101])) && random < (25 * (AIlevel ** 2 / 64.0))

[State -1, AMK]
type = changestate
value = 640
triggerall = AIlevel && numenemy
triggerall = roundstate = 2 && statetype = A
triggerall = (p2bodydist x = [ -50, 30]) && (p2dist y = [ -50, 50]) && p2statetype != L && !(enemynear, hitfall)
trigger1 = (ctrl || (StateNo = [100,101])) && random < (25 * (AIlevel ** 2 / 64.0))

[State -1, ALP]
type = changestate
value = 600
triggerall = AIlevel && numenemy
triggerall = roundstate = 2 && statetype = A
triggerall = (p2bodydist x = [0, 30]) && (p2dist y = [ -50, 50]) && p2statetype != L && !(enemynear, hitfall)
trigger1 = (ctrl || (StateNo = [100,101])) && random < (25 * (AIlevel ** 2 / 64.0))

[State -1, ALK]
type = changestate
value = 600
triggerall = AIlevel && numenemy
triggerall = roundstate = 2 && statetype = A
triggerall = (p2bodydist x = [0, 30]) && (p2dist y = [ -50, 50]) && p2statetype != L && !(enemynear, hitfall)
trigger1 = (ctrl || (StateNo = [100,101])) && random < (25 * (AIlevel ** 2 / 64.0))

;===========================A.I.Supers=============================

[State -1, Saiyan Rage/Dirty Fireworks]
type = changestate
value = 4000
triggerall = var(1) = 0
triggerall = AIlevel && numenemy
triggerall = roundstate = 2 && statetype != A
triggerall = power >= 3000 && var(20) <= 60
triggerall = !(enemynear, ctrl) && (enemynear, stateno != [120, 155])
triggerall = (p2bodydist x = [ -80, 80]) && (p2dist y = [ -40, 0]) && p2statetype != L
triggerall = (enemynear, const(size.head.pos.y) <= -40) || (enemynear, statetype = A)
trigger1 = stateno = [200, 450]
trigger1 = (movehit = [1, 16]) && (p2bodydist x = [0, 150]) && random < (200 * (AIlevel ** 2 / 64.0))
trigger2 = (stateno = [1000,1551])
trigger2 = (movehit = [1, 16]) && (p2bodydist x = [0, 150]) && random < (200 * (AIlevel ** 2 / 64.0))
trigger3 = (stateno = [1001, 4999]) && numhelper(stateno + 5) && var(10) <= 6
trigger3 = helper(stateno + 5), var(3) && random < (200 * (AIlevel ** 2 / 64.0)) && stateno != 3600 && stateno != 3200 && stateno != 3100
trigger4 = (ctrl || (StateNo = [100,101])) && enemynear, movetype = A && (p2bodydist x = [0, 150]) && random < (250 * (AIlevel ** 2 / 64.0))

[State -1, Final Flash]
type = changestate
value = 4100
triggerall = var(1) = 1
triggerall = AIlevel && numenemy
triggerall = roundstate = 2 && statetype != A && power >= 3000 && var(20) <= 60
triggerall = !(enemynear, ctrl) && (enemynear, stateno != [120, 155])
triggerall = (p2bodydist x = [0, 40]) && p2dist y = 0 && (enemynear, vel y = 0) && (enemynear, vel x > -2) && p2statetype != L
triggerall = (enemynear, const(size.head.pos.y) <= -40) || (enemynear, statetype = A)
triggerall = !var(6)
trigger1 = ctrl && random < (500 * (AIlevel ** 2 / 64.0))
trigger2 = stateno = [200, 450]
trigger2 = (movehit = [1, 16]) && (p2bodydist x = [0, 40]) && random < (200 * (AIlevel ** 2 / 64.0))
trigger3 = (stateno = [1000,1051])
trigger3 = (movehit = [1, 16]) && (p2bodydist x = [0, 40]) && random < (200 * (AIlevel ** 2 / 64.0))
trigger4 = (ctrl || (StateNo = [100,101])) && enemynear, movetype = A && (p2bodydist x = [0, 40]) && random < (200 * (AIlevel ** 2 / 64.0))

[State -1, Final Shine Attack]
type = changestate
value = 4200
triggerall = var(1) = 1
triggerall = AIlevel && numenemy
triggerall = roundstate = 2 && statetype != A && power >= 3000 && var(20) <= 60 
triggerall = !numhelper(3205) && !numhelper(3055)
triggerall = !(enemynear, ctrl) && (enemynear, movetype != A)
triggerall = p2dist x >= 100 && p2dist x <= 120 && p2dist y > -40 && (enemynear, vel y > -2) && random < (600 * (AIlevel ** 2 / 64.0)) && p2statetype != L
triggerall = (enemynear, const(size.head.pos.y) <= -40) || (enemynear, statetype = A)
triggerall = !var(6)
trigger1 = ctrl && random < (600 * (AIlevel ** 2 / 64.0))
trigger2 = stateno = [200, 450]
trigger2 = (movehit = [1, 16]) && (p2bodydist x = [0, 50]) && random < (200 * (AIlevel ** 2 / 64.0))
trigger3 = (stateno = [1000,1551])
trigger3 = (movehit = [1, 16]) && (p2bodydist x = [0, 50]) && random < (200 * (AIlevel ** 2 / 64.0))

[State -1, Maximum Flasher]
type = changestate
value = 3600
triggerall = var(1) = 1
triggerall = AIlevel && numenemy
triggerall = roundstate = 2 && statetype != A && power >= 2000 && var(20) <= 60
triggerall = !numhelper(3005) && !numhelper(3055)
triggerall = !(enemynear, ctrl) && ((p2stateno != [120, 155]) || p2statetype = A)
triggerall = (p2bodydist x = [0, 150]) && p2statetype != L
triggerall = (p2dist y = [ 0, 100]) && (enemynear, vel y = [ 0, 40]) && (enemynear, vel x > -2) && p2statetype != L
triggerall = (enemynear, const(size.head.pos.y) <= -40) || (enemynear, statetype = A)
triggerall = !var(6)
trigger1 = ctrl && (p2bodydist x = [0, 150]) && random < (200 * (AIlevel ** 2 / 64.0))
trigger2 = stateno = [200, 450]
trigger2 = (movehit = [1, 16]) && (p2bodydist x = [0, 120]) && random < (200 * (AIlevel ** 2 / 64.0))
trigger3 = (stateno = 1110 || stateno = 1000 || (stateno = [1300, 1350])) && (movehit = [1, 16]) && random < (200 * (AIlevel ** 2 / 64.0))
trigger4 = (stateno = [1001, 4999]) && numhelper(stateno + 5) && stateno != 3000 && stateno != 3020
trigger4 = helper(stateno + 5), var(3) && random < (100 * (AIlevel ** 2 / 64.0))
trigger5 = stateno = 52 && !animtime && (prevstateno = [1000, 2999]) && numtarget && random < (250 * (AIlevel ** 2 / 64.0))

[State -1, Air Super Galick Gun]
type = changestate
value = 3400
triggerall = var(1) = 0
triggerall = AIlevel && numenemy
triggerall = roundstate = 2 && statetype = A && power >= 3000 && var(20) <= 60
triggerall = !numhelper(3401) && !numhelper(3155) && !numhelper(3105)
triggerall = !(enemynear, ctrl) && (enemynear, stateno != [120, 155])
triggerall = p2bodydist x >= 40 && p2dist y >= 40
trigger1 = stateno = 1504
trigger2 = (movehit = [1, 16]) && random < (250 * (AIlevel ** 2 / 64.0))
trigger3 = stateno = 1200 && time >= 27 && (movehit = [9, 13]) && random < (200 * (AIlevel ** 2 / 64.0))
trigger4 = (stateno = [1000, 4999]) && numhelper(stateno + 5) && var(10) <= 6 && stateno != 3600 && stateno != 3200 && stateno != 3100
trigger4 = helper(stateno + 5), var(3) && random < (100 * (AIlevel ** 2 / 64.0))
trigger5 = stateno = 1250 && time >= 27 && (movehit = [9, 13]) && random < (200 * (AIlevel ** 2 / 64.0))

[State -1, Saiyan Beat Down / Max Saiyan Beat Down]
type = changestate
value = ifelse(power>=2000,3550,3500)
triggerall = var(1) = 1
triggerall = AIlevel && numenemy
triggerall = roundstate = 2 && statetype != A && power >= 1000 && var(20) <= 60
triggerall = !numhelper(3005) && !numhelper(3055)
triggerall = !(enemynear, ctrl) && ((p2stateno != [120, 155]) || p2statetype = A)
triggerall = (p2bodydist x = [0, 60]) && p2dist y = 0 && (enemynear, vel y = 0) && (enemynear, vel x > -2) && p2statetype != L
triggerall = (enemynear, const(size.head.pos.y) <= -40) || (enemynear, statetype = A)
triggerall = !var(6)
trigger1 = ctrl && (p2bodydist x = [0, 125]) && random < (200 * (AIlevel ** 2 / 64.0))
trigger2 = (stateno = [200, 450]) && (movehit = [1, 16]) && random < (200 * (AIlevel ** 2 / 64.0))
trigger3 = (stateno = 1110 || stateno = 1000 || (stateno = [1300, 1350])) && (movehit = [1, 16]) && random < (200 * (AIlevel ** 2 / 64.0))
trigger4 = (stateno = [1001, 4999]) && numhelper(stateno + 5) && stateno != 3000 && stateno != 3020
trigger4 = helper(stateno + 5), var(3) && random < (2000 * (AIlevel ** 2 / 64.0))
trigger5 = stateno = 52 && !animtime && (prevstateno = [1000, 2999]) && numtarget && random < (250 * (AIlevel ** 2 / 64.0))
trigger6 = (ctrl || (StateNo = [100,101])) && enemynear, movetype = A && (p2bodydist x = [0, 60]) && random < (200 * (AIlevel ** 2 / 64.0))

[State -1, Super Kick / Max Super Kick]
type = changestate
value = ifelse(power>=2000,3350,3300)
triggerall = AIlevel && numenemy
triggerall = roundstate = 2 && statetype != A && power >= 1000 && var(20) <= 60
triggerall = !(enemynear, ctrl) && (enemynear, stateno != [120, 155])
triggerall = (p2bodydist x = [0, 30]) && p2dist y > -120 && (enemynear, vel y > -15) && (enemynear, vel x > -2) && p2statetype != L
triggerall = (enemynear, const(size.head.pos.y) <= -40) || (enemynear, statetype = A)
triggerall = !var(6)
trigger1 = ctrl && random < (100 * (AIlevel ** 2 / 64.0))
trigger2 = (stateno = [200, 450])
trigger2 = (movehit = [1, 16]) && (p2bodydist x = [0, 120]) && random < (100 * (AIlevel ** 2 / 64.0))
trigger3 = (stateno = [1001,1551])
trigger3 = (movehit = [1, 16]) && (p2bodydist x = [0, 30]) && random < (100 * (AIlevel ** 2 / 64.0))
trigger4 = (stateno = [1001, 4999]) && numhelper(stateno + 5) && var(10) <= 6
trigger4 = helper(stateno + 5), var(3) && random < (100 * (AIlevel ** 2 / 64.0)) && stateno != 3400 && stateno != 3150 && stateno != 3100
trigger5 = (ctrl || (StateNo = [100,101])) && enemynear, movetype = A && (p2bodydist x = [0, 30]) && random < (100 * (AIlevel ** 2 / 64.0))

[State -1, Galick Gun / Max Galick Gun]
type = changestate
value = ifelse(power>=2000,3250,3200)
triggerall = var(1) = 0
triggerall = AIlevel && numenemy
triggerall = roundstate = 2 && statetype != A && power >= 1000 && var(20) <= 60
triggerall = !numhelper(3205) && !numhelper(3255)
triggerall = !(enemynear, ctrl) && ((p2stateno != [120, 155]) || p2statetype = A)
triggerall = (p2bodydist x = [0, 100]) && p2statetype != L
triggerall = (p2dist y = [ -100, 0]) && (enemynear, vel y = [ -7, 1]) && (enemynear, vel x > -2)
triggerall = (enemynear, const(size.head.pos.y) <= -40) || (enemynear, statetype = A)
triggerall = !var(6)
trigger1 = ctrl && (p2bodydist x = [15, 125]) && random < (50 * (AIlevel ** 2 / 64.0))
trigger2 = (stateno = [200, 450]) && (movehit = [1, 16]) && random < (50 * (AIlevel ** 2 / 64.0))
trigger3 = (stateno = 1110 || stateno = 1001 || (stateno = [1300, 1350])) && (movehit = [1, 16]) && random < (50 * (AIlevel ** 2 / 64.0))
trigger4 = (stateno = [1001, 4999]) && numhelper(stateno + 5) && stateno != 3000 && stateno != 3020
trigger4 = helper(stateno + 5), var(3) && random < (50 * (AIlevel ** 2 / 64.0))
trigger5 = stateno = 52 && !animtime && (prevstateno = [1000, 2999]) && numtarget && random < (250 * (AIlevel ** 2 / 64.0))

[State -1, Big Bang Attack / Max Big Bang Attack]
type = changestate
value = ifelse(power>=2000,3050,3000)
triggerall = var(1) = 1
triggerall = AIlevel && numenemy
triggerall = roundstate = 2 && statetype != A && power >= 1000 && var(20) <= 60
triggerall = !numhelper(3005) && !numhelper(3055)
triggerall = !(enemynear, ctrl) && ((p2stateno != [120, 155]) || p2statetype = A)
triggerall = (p2bodydist x = [0, 100]) && p2statetype != L
triggerall = (p2dist y = [ -100, 0]) && (enemynear, vel y = [ -7, 1]) && (enemynear, vel x > -2)
triggerall = (enemynear, const(size.head.pos.y) <= -40) || (enemynear, statetype = A)
triggerall = !var(6)
trigger1 = ctrl && (p2bodydist x = [15, 125]) && random < (50 * (AIlevel ** 2 / 64.0))
trigger2 = (stateno = [200, 450]) && (movehit = [1, 16]) && random < (50 * (AIlevel ** 2 / 64.0))
trigger3 = (stateno = 1110 || stateno = 1000 || (stateno = [1300, 1350])) && (movehit = [1, 16]) && random < (50 * (AIlevel ** 2 / 64.0))
trigger4 = (stateno = [1001, 4999]) && numhelper(stateno + 5) && stateno != 3000 && stateno != 3020
trigger4 = helper(stateno + 5), var(3) && random < (50 * (AIlevel ** 2 / 64.0))
trigger5 = stateno = 52 && !animtime && (prevstateno = [1000, 2999]) && numtarget && random < (250 * (AIlevel ** 2 / 64.0))

[State -1, Air Rapid Fire / Max Air Rapid Fire]
type = changestate
value = ifelse(power>=2000,3150,3100)
triggerall = var(1) = 1
triggerall = AIlevel && numenemy
triggerall = roundstate = 2 && statetype = A && var(9) != 2 && prevstateno != 1200
triggerall = !numhelper(3401) && !numhelper(3155) && !numhelper(3105)
triggerall = power >= 1000 && var(20) <= 60
triggerall = !(enemynear, ctrl) && (enemynear, stateno != [120, 155])
triggerall = (p2bodydist x = [0, 120]) && p2dist y >= -20 && (enemynear, vel y < 4)
trigger1 = (stateno = 270 || stateno = 285)
trigger1 = (movehit = [1, 16]) && (p2bodydist x = [0, 30]) && random < (100 * (AIlevel ** 2 / 64.0))
trigger2 = (stateno = [1000,1551])
trigger2 = (movehit = [1, 16]) && random < (100 * (AIlevel ** 2 / 64.0))
trigger3 = stateno = 1250 && (movehit = [9, 13]) && random < (100 * (AIlevel ** 2 / 64.0))
trigger4 = (stateno = [1000, 4999]) && numhelper(stateno + 5) && var(10) <= 6 && stateno != 3400 && stateno != 3150 && stateno != 3100
trigger4 = helper(stateno + 5), var(3) && random < (100 * (AIlevel ** 2 / 64.0))
trigger5 = (stateno = [1400,1450]) && (movehit = [9, 13]) && random < (100 * (AIlevel ** 2 / 64.0))

[State -1, SSJmodechange]
type = changestate
value = ifelse(life>=500,4500,4502)
triggerall = var(1) = 0
trigger1 = AIlevel && numenemy
trigger1 = roundstate = 2 && statetype != A && power >= 3000 && var(20) <= 60
trigger1 = ctrl && random < (2500 * (AIlevel ** 2 / 64.0))

;===========================A.I.Specials=============================

[State -1, Dash Kick / EX Dash Kick]
type = ChangeState
value = ifelse((power>=500&&random<100),1550,1500)
triggerAll = AILevel && NumEnemy || var(20)
triggerAll = RoundState = 2 && StateType != A
triggerAll = (p2bodydist x = [0, 60]) && p2statetype != L
triggerAll = (P2BodyDist x = [0,60]) && (P2Dist y = [0,20])
triggerAll = (EnemyNear, const(size.head.pos.y) <= -60) || (EnemyNear, StateType = A)
trigger1 = (ctrl || (StateNo = [100,101])) && Random < (85 * (AILevel ** 2 / 64.0))
trigger2 = (StateNo = [200,499]) && !AnimTime && (ctrl || (StateNo = [100,101]))
trigger2 = MoveHit && (EnemyNear, GetHitVar(HitTime) >= 4) && Random < (100 * (AILevel ** 2 / 64.0))

[State -1, Elbow Rush / EX Elbow Rush]
type = ChangeState
value = ifelse((power>=500&&random<100),1050,1000)
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType != A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = (P2BodyDist x = [0,75]) && (P2Dist y = [-64,0]) && P2StateType != L
triggerAll = (EnemyNear, const(size.head.pos.y) <= -40) || (EnemyNear, StateType = A)
trigger1 = (ctrl || (StateNo = [100,101])) && Random < (25 * (AILevel ** 2 / 64.0))
trigger2 = (StateNo = [200,499]) && !AnimTime && (ctrl || (StateNo = [100,101]))
trigger2 = MoveHit && (EnemyNear, GetHitVar(HitTime) >= 4) && Random < (250 * (AILevel ** 2 / 64.0))

[State -1, Knee Bash / EX Knee Bash]
type = changestate
value = ifelse((power >= 500 && random < 100), 1250, 1200)
triggerall = AIlevel && numenemy || var(20)
triggerall = roundstate = 2 && statetype != A
triggerall = (p2stateno != [120, 155]) && p2statetype != L && !(enemynear, hitfall)
triggerall = (p2bodydist x = [0, 90]) && (p2bodydist y = [ -180, 60])
triggerall = (enemynear, const(size.head.pos.y) <= -40) || (enemynear, statetype = A)
trigger1 = ctrl && random < (50 * (AIlevel ** 2 / 64.0))
trigger2 = !var(6) && (stateno = [200, 255]) && stateno != 207 && stateno!= 225 && (movehit = [1, 16]) && random < (200 * (AIlevel ** 2 / 64.0))

[State -1, Rizing Kick / EX Rizing Kick]
type = changestate
value =  ifelse((power >= 500 && random < 100), 1150, 1100)
triggerall = AIlevel && numenemy || var(20)
triggerall = roundstate = 2 && statetype != A
triggerall = !(enemynear, ctrl) && (enemynear, stateno != [120, 155])
triggerall = (p2statetype != L || p2stateno = 5120) && (p2bodydist x = [0, 80]) && (p2dist y = [ -120, 0])
triggerall = (enemynear, const(size.head.pos.y) <= -40) || (enemynear, statetype = A)
triggerall = !var(6)
trigger1 = ctrl && p2statetype = A && random < (ifelse(prevstateno = 1200 || prevstateno = 52, 444, 200) * (AIlevel ** 2 / 64.0))
trigger2 = !var(6) && (stateno = [200, 255]) && stateno!= 225
trigger2 = (movehit = [1, 8]) && (p2bodydist x = [0, 12]) && random < (500 * (AIlevel ** 2 / 64.0))
trigger4 = ctrl && enemynear, movetype = A && (p2bodydist x = [0, 40]) && random < (500 * (AIlevel ** 2 / 64.0))
trigger5 = stateno = 0 && prevstateno = 5120 && time <= 1
trigger5 = ctrl && (p2bodydist x = [ -40, 40]) && random < (500 * (AIlevel ** 2 / 64.0))
trigger6 = ctrl && (p2bodydist x = [ -30, 30])
trigger6 = (enemynear, stateno = 5120) && (enemynear, animtime = [ -6, -3]) && random < (250 * (AIlevel ** 2 / 64.0))

[State -1, FireBlast / EX FireHlast]
type = changestate
value = ifelse((power >= 500 && random < 100), 1350, 1300)
triggerall = AIlevel && numenemy || var(20)
triggerall = roundstate = 2 && statetype != A
triggerall = (p2stateno != [120, 155]) && p2statetype != L
triggerall = (enemynear, vel y > -1)
triggerall = ifelse(!var(20), !numhelper(1305) && !numhelper(1315), 1) && !numhelper(1308) && !numhelper(1309) && !numhelper(1318) && !numhelper(1319) && !numhelper(3055)
triggerall = (enemynear, const(size.head.pos.y) <= -40) || (enemynear, statetype = A)
triggerall = !var(6)
trigger1 = ctrl && p2dist x > 160 && random < (300 * (AIlevel ** 2 / 64.0))
trigger2 =!var(6) && (stateno = [200, 255]) && random < (200 * (AIlevel ** 2 / 64.0))

[State -1, Air FireBlast / EX Air FireBlast]
type = changestate
value = ifelse((power>=500&&random<50),1450,1400)
triggerall = AIlevel && numenemy || var(20)
triggerall = roundstate = 2 && statetype = A
triggerall = p2bodydist x >= 40 && p2dist y >= 40
trigger1 = ctrl && random < (50 * (AIlevel ** 2 / 64.0))
trigger2 = (stateno = [600, 650]) && (movehit = [1, 16]) && random < (50 * (AIlevel ** 2 / 64.0))
