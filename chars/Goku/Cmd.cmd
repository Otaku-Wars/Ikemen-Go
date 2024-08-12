;#ADD004BASIC PIEs#
; ________________
;| Goku by DJMouF |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==============================================================================================//
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

;====================<SUPER MOTIONS NORMAL>===================
;----------------
;----------------LVL 3 Meteor Break
[Command]
name = "Meteor Break"
command = ~D, DF, F, D, DF, F, a+x
time = 32
[Command]
name = "Meteor Break"
command = ~D, DF, F, D, DF, F, b+y
time = 32
[Command]
name = "Meteor Break"
command = ~D, DF, F, D, DF, F, c+z
time = 32

;----------------LVL 3 Warp Kamehameha
[Command]
name = "Warp Kamehameha"
command = ~D, DB, B, D, DB, B, a+x
time = 32
[Command]
name = "Warp Kamehameha"
command = ~D, DB, B, D, DB, B, b+y
time = 32
[Command]
name = "Warp Kamehameha"
command = ~D, DB, B, D, DB, B, c+z
time = 32

;----------------LVL 3 SSJ2
[Command]
name = "SSJ2"
command = ~D, DF, F, D, DF, F, s
time = 32
[Command]
name = "SSJ2"
command = ~D, DF, F, D, DF, F, s
time = 32
[Command]
name = "SSJ2"
command = ~D, DF, F, F, DF, F, s
time = 32
;----------------MAX Super 1
;------ Max Super Kame 
[Command]
name = "Max Super Kame"
command = ~D, DF, F, D, DF, F, x+y
time = 32

[Command]
name = "Max Super Kame"
command = ~D, DF, F, D, DF, F, y+z
time = 32

[Command]
name = "Max Super Kame"
command = ~D, DF, F, D, DF, F, x+z
time = 32

;------ Max Super Kaioken Attack
[Command]
name = "Max Super Kaioken Attack"
command = ~D, DF, F, D, DF, F, a+b
time = 32

[Command]
name = "Max Super Kaioken Attack"
command = ~D, DF, F, D, DF, F, b+c
time = 32

[Command]
name = "Max Super Kaioken Attack"
command = ~D, DF, F, D, DF, F, a+c
time = 32

;----- Max Super Rapid Kicks -----
[Command]
name = "Max Super Rapid Kicks"
command = ~D, DB, B, D, DB, B, a+b
time = 32

[Command]
name = "Max Super Rapid Kicks"
command = ~D, DB, B, D, DB, B, b+c
time = 32

[Command]
name = "Max Super Rapid Kicks"
command = ~D, DB, B, D, DB, B, a+c
time = 32

;----------------LVL 2 Hand Spirit Bomb
[Command]
name = "Hand Spirit Bomb"
command = ~D, DB, B, D, DB, B, x+y
time = 32
[Command]
name = "Hand Spirit Bomb"
command = ~D, DB, B, D, DB, B, y+z
time = 32
[Command]
name = "Hand Spirit Bomb"
command = ~D, DB, B, D, DB, B, x+z
time = 32

;----------------Super 1
;----- Kame -----
[Command]
name = "Kame"
command = ~D, DF, F, D, DF, F, x
time = 32

[Command]
name = "Kame"
command = ~D, DF, F, D, DF, F, y
time = 32

[Command]
name = "Kame"
command = ~D, DF, F, D, DF, F, z
time = 32

[Command]
name = "Kame"
command = ~D, DF, F, D, DF, F, ~x
time = 32

[Command]
name = "Kame"
command = ~D, DF, F, D, DF, F, ~y
time = 32

[Command]
name = "Kame"
command = ~D, DF, F, D, DF, F, ~z
time = 32

;----- Super Kaioken Attack -----
[Command]
name = "Super Kaioken Attack"
command = ~D, DF, F, D, DF, F, a
time = 32

[Command]
name = "Super Kaioken Attack"
command = ~D, DF, F, D, DF, F, b
time = 32

[Command]
name = "Super Kaioken Attack"
command = ~D, DF, F, D, DF, F, c
time = 32

[Command]
name = "Super Kaioken Attack"
command = ~D, DF, F, D, DF, F, ~a
time = 32

[Command]
name = "Super Kaioken Attack"
command = ~D, DF, F, D, DF, F, ~b
time = 32

[Command]
name = "Super Kaioken Attack"
command = ~D, DF, F, D, DF, F, ~c
time = 32

;----- Super Rapid Kicks -----
[Command]
name = "Super Rapid Kicks"
command = ~D, DB, B, D, DB, B, a
time = 32

[Command]
name = "Super Rapid Kicks"
command = ~D, DB, B, D, DB, B, b
time = 32

[Command]
name = "Super Rapid Kicks"
command = ~D, DB, B, D, DB, B, c
time = 32

[Command]
name = "Super Rapid Kicks"
command = ~D, DB, B, D, DB, B, ~a
time = 32

[Command]
name = "Super Rapid Kicks"
command = ~D, DB, B, D, DB, B, ~b
time = 32

[Command]
name = "Super Rapid Kicks"
command = ~D, DB, B, D, DB, B, ~c
time = 32

;====================<SUPER MOTIONS SSJ2>===================
;----------------

;----------------LVL 3 DragonFist
[Command]
name = "DragonFist"
command = ~D, DF, F, D, DF, F, a+x
time = 32
[Command]
name = "DragonFist"
command = ~D, DF, F, D, DF, F, b+y
time = 32
[Command]
name = "DragonFist"
command = ~D, DF, F, D, DF, F, c+z
time = 32

;----- Max Meteor Strike Bomb -----
[Command]
name = "Max Meteor Strike Bomb"
command = ~D, DB, B, D, DB, B, x+y
time = 32

[Command]
name = "Max Meteor Strike Bomb"
command = ~D, DB, B, D, DB, B, y+z
time = 32

[Command]
name = "Max Meteor Strike Bomb"
command = ~D, DB, B, D, DB, B, x+z
time = 32

;----- Meteor Strike Bomb -----
[Command]
name = "Meteor Strike Bomb"
command = ~D, DB, B, D, DB, B, x
time = 32

[Command]
name = "Meteor Strike Bomb"
command = ~D, DB, B, D, DB, B, y
time = 32

[Command]
name = "Meteor Strike Bomb"
command = ~D, DB, B, D, DB, B, z
time = 32

[Command]
name = "Meteor Strike Bomb"
command = ~D, DB, B, D, DB, B, ~x
time = 32

[Command]
name = "Meteor Strike Bomb"
command = ~D, DB, B, D, DB, B, ~y
time = 32

[Command]
name = "Meteor Strike Bomb"
command = ~D, DB, B, D, DB, B, ~z
time = 32

;====================<SPECIAL MOTIONS NORMAL>====================
;----------------Fireball
[Command]
name = "Fireball"
command = ~D, DF, F, x
time = 16

[Command]
name = "Fireball"
command = ~D, DF, F, y
time = 16

[Command]
name = "Fireball"
command = ~D, DF, F, z
time = 16

[Command]
name = "Fireball"
command = ~D, DF, F, ~x
time = 16

[Command]
name = "Fireball"
command = ~D, DF, F, ~y
time = 16

[Command]
name = "Fireball"
command = ~D, DF, F, ~z
time = 16

;------ Teleport Elbow
[Command]
name = "Teleport Elbow"
command = ~F, D, DF, x
time = 20

[Command]
name = "Teleport Elbow"
command = ~F, D, DF, y
time = 20

[Command]
name = "Teleport Elbow"
command = ~F, D, DF, z
time = 20

[Command]
name = "Teleport Elbow"
command = ~F, D, DF, ~x
time = 20

[Command]
name = "Teleport Elbow"
command = ~F, D, DF, ~y
time = 20

[Command]
name = "Teleport Elbow"
command = ~F, D, DF, ~z
time = 20

;----------------"Rapid Kicks"
[Command]
name = "Rapid Kicks"
command = ~D, DB, B, a
time = 16

[Command]
name = "Rapid Kicks"
command = ~D, DB, B, b
time = 16

[Command]
name = "Rapid Kicks"
command = ~D, DB, B, c
time = 16

[Command]
name = "Rapid Kicks"
command = ~D, DB, B, ~a
time = 16

[Command]
name = "Rapid Kicks"
command = ~D, DB, B, ~b
time = 16

[Command]
name = "Rapid Kicks"
command = ~D, DB, B, ~c
time = 16

;----------------"Kaioken Attack"
[Command]
name = "Kaioken Attack"
command = ~D, DB, B, x
time = 16

[Command]
name = "Kaioken Attack"
command = ~D, DB, B, y
time = 16

[Command]
name = "Kaioken Attack"
command = ~D, DB, B, z
time = 16

[Command]
name = "Kaioken Attack"
command = ~D, DB, B, ~x
time = 16

[Command]
name = "Kaioken Attack"
command = ~D, DB, B, ~y
time = 16

[Command]
name = "Kaioken Attack"
command = ~D, DB, B, ~z
time = 16

;----------------"Flash Kick"
[Command]
name = "Flash Kick"
command = ~D, DF, F, a
time = 16

[Command]
name = "Flash Kick"
command = ~D, DF, F, b
time = 16

[Command]
name = "Flash Kick"
command = ~D, DF, F, c
time = 16

[Command]
name = "Flash Kick"
command = ~D, DF, F, ~a
time = 16

[Command]
name = "Flash Kick"
command = ~D, DF, F, ~b
time = 16

[Command]
name = "Flash Kick"
command = ~D, DF, F, ~c
time = 16

;----------------EX Blast
[Command]
name = "EX Blast"
command = ~D, DF, F, x+y
time = 16

[Command]
name = "EX Blast"
command = ~D, DF, F, y+z
time = 16

[Command]
name = "EX Blast"
command = ~D, DF, F, x+z
time = 16

;----------------EX Flash Kick
[Command]
name = "EX Flash Kick"
command = ~D, DF, F, a+b
time = 16

[Command]
name = "EX Flash Kick"
command = ~D, DF, F, b+c
time = 16

[Command]
name = "EX Flash Kick"
command = ~D, DF, F, a+c
time = 16

;----------------EX Rapid Kicks
[Command]
name = "EX Rapid Kicks"
command = ~D, DB, B, a+b
time = 16

[Command]
name = "EX Rapid Kicks"
command = ~D, DB, B, b+c
time = 16

[Command]
name = "EX Rapid Kicks"
command = ~D, DB, B, a+c
time = 16

;----------------EX Kaioken Attack
[Command]
name = "EX Kaioken Attack"
command = ~D, DB, B, x+y
time = 16

[Command]
name = "EX Kaioken Attack"
command = ~D, DB, B, y+z
time = 16

[Command]
name = "EX Kaioken Attack"
command = ~D, DB, B, x+z
time = 16

;----------------EX TeleportElbow
[Command]
name = "EX Teleport Elbow"
command = ~F, D, DF, x+y
time = 20
[Command]
name = "EX Teleport Elbow"
command = ~F, D, DF, y+z
time = 20
[Command]
name = "EX Teleport Elbow"
command = ~F, D, DF, x+z
time = 20

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

;====================<SPECIAL MOTIONS SSJ2>====================

;------------------- QuickFist
[Command]
name = "Instant Transmission Kick"
command = ~D, DF, F, a
time = 16

[Command]
name = "Instant Transmission Kick"
command = ~D, DF, F, b
time = 16

[Command]
name = "Instant Transmission Kick"
command = ~D, DF, F, c
time = 16

[Command]
name = "Instant Transmission Kick"
command = ~D, DF, F, ~a
time = 16

[Command]
name = "Instant Transmission Kick"
command = ~D, DF, F, ~b
time = 16

[Command]
name = "Instant Transmission Kick"
command = ~D, DF, F, ~c
time = 16

;------------------ Dash Scatter Attack
[Command]
name = "Dash Scatter Attack"
command = ~D, DB, B, x
time = 16

[Command]
name = "Dash Scatter Attack"
command = ~D, DB, B, y
time = 16

[Command]
name = "Dash Scatter Attack"
command = ~D, DB, B, z
time = 16

[Command]
name = "Dash Scatter Attack"
command = ~D, DB, B, ~x
time = 16

[Command]
name = "Dash Scatter Attack"
command = ~D, DB, B, ~y
time = 16

[Command]
name = "Dash Scatter Attack"
command = ~D, DB, B, ~z
time = 16

;---------------- Rising Knee
[Command]
name = "Rising Knee"
command = ~F, D, DF, a
time = 20

[Command]
name = "Rising Knee"
command = ~F, D, DF, b
time = 20

[Command]
name = "Rising Knee"
command = ~F, D, DF, c
time = 20

[Command]
name = "Rising Knee"
command = ~F, D, DF, ~a
time = 20

[Command]
name = "Rising Knee"
command = ~F, D, DF, ~b
time = 20

[Command]
name = "Rising Knee"
command = ~F, D, DF, ~c
time = 20

;----------------EX QuickFist
[Command]
name = "EX Instant Transmission Kick"
command = ~D, DF, F, a+b
time = 16

[Command]
name = "EX Instant Transmission Kick"
command = ~D, DF, F, b+c
time = 16

[Command]
name = "EX Instant Transmission Kick"
command = ~D, DF, F, a+c
time = 16

;------------------ EX Dash Scatter Attack
[Command]
name = "EX Dash Scatter Attack"
command = ~D, DB, B, x+y
time = 16

[Command]
name = "EX Dash Scatter Attack"
command = ~D, DB, B, y+z
time = 16

[Command]
name = "EX Dash Scatter Attack"
command = ~D, DB, B, x+z
time = 16

;----------------EX Rising Knee
[Command]
name = "EX Rising Knee"
command = ~F, D, DF, a+b
time = 16

[Command]
name = "EX Rising Knee"
command = ~F, D, DF, b+c
time = 16

[Command]
name = "EX Rising Knee"
command = ~F, D, DF, a+c
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




[State -1, Omega Kamehameha]
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


;========================== < Goku Base Form > ==========================

;---------------- Lvl 3 -------------------------

[State -1, LVL 3 Meteor Break]
type = ChangeState
value = 4000
triggerall = var(1) = 0
triggerAll = !AILevel
triggerAll = command = "Meteor Break"
triggerAll = RoundState = 2 && StateType != A
triggerAll = power >= 3000 && !var(20)
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
trigger2 = var(7)
trigger3 = (StateNo = [1000,1001])
trigger4 = StateNo = 1400 || StateNo = 1601 || StateNo = 1603

[State -1, LVL 3 SSJ2]
type = ChangeState
value = ifelse(life>=500,4500,4501)
triggerall = var(1) = 0
triggerAll = !AILevel
triggerAll = command = "SSJ2"
triggerAll = RoundState = 2 && StateType != A
triggerAll = power >= 3000 && !var(20)
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
trigger2 = var(7)

;========================== < Goku SSJ2 Form > ==========================

;---------------- Lvl 3 -------------------------
[State -1, LVL 3 DragonFist]
type = ChangeState
value = 4600
triggerall = var(1) = 1
triggerAll = !AILevel
triggerAll = command = "DragonFist"
triggerAll = RoundState = 2 && StateType != A
triggerAll = power >= 3000 && !var(20) && var(20) <= 60
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
trigger2 = var(7)

[State -1, LVL 3 Warp Kamehameha]
type = ChangeState
value = 4100
triggerall = var(1) = 1
triggerAll = !AILevel
triggerAll = command = "Warp Kamehameha"
triggerAll = RoundState = 2 && StateType != A
triggerAll = power >= 3000 && !var(20) && var(20) <= 60
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
trigger2 = var(7)

[State -1, Detransform to Normal]
type = ChangeState
value = 4550
triggerall = var(1) = 1
triggerAll = !AILevel
triggerAll = command = "SSJ2"
triggerAll = RoundState = 2 && StateType != A
triggerAll = power >= 0 && !var(20) && var(20) <= 60
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
trigger2 = var(7)

;========================== < Goku Base Form > ==========================

;---------------- Lvl 2 -------------------------

[State -1, Hand Spirit Bomb]
type = ChangeState
value = 3400
triggerall = var(1) = 0
triggerAll = !AILevel
triggerAll = command = "Hand Spirit Bomb"
triggerAll = RoundState = 2 && StateType != A
triggerAll = power >= 2000 && var(20) <= 60
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
trigger2 = var(7)
trigger3 = (StateNo = [200,450])
trigger4 = (StateNo = [1000,1050]) || (StateNo = [1400,1451]) || (StateNo = [1650,1652])
trigger5 = StateNo = 1601 || StateNo = 1603

[State -1, Air MAX Super Max Super Kame]
type = ChangeState
value = 3040
triggerall = var(1) = 0
triggerAll = !AILevel
triggerAll = command = "Max Super Kame"
triggerAll = RoundState = 2 && StateType = A
triggerAll = power >= 2000 && var(20) <= 60
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
trigger2 = var(7)
trigger3 = (StateNo = [600,650])
trigger4 = (StateNo = [1602,1603])
trigger5 = StateNo = 1200
trigger6 = (StateNo = [3301,3302])

[State -1, MAX Super Max Super Kame]
type = ChangeState
value = 3050
triggerall = var(1) = 0
triggerAll = !AILevel
triggerAll = command = "Max Super Kame"
triggerAll = RoundState = 2 && StateType != A
triggerAll = power >= 2000 && var(20) <= 60
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
trigger2 = var(7)
trigger4 = (StateNo = [1000,1050]) || (StateNo = [1400,1451]) || (StateNo = [1650,1652])
trigger5 = StateNo = 1601 || StateNo = 1603

[State -1, Max Super Kaioken Attack]
type = ChangeState
value = 3250
triggerall = var(1) = 0
triggerAll = !AILevel
triggerAll = command = "Max Super Kaioken Attack"
triggerAll = RoundState = 2 && StateType != A
triggerAll = power >= 2000 && var(20) <= 60
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
trigger2 = var(7)
trigger3 = (StateNo = [200,450])
trigger4 = (StateNo = [1000,1050]) || (StateNo = [1400,1451]) || (StateNo = [1650,1652])
trigger5 = StateNo = 1601 || StateNo = 1603

[State -1, Max Super Rapid Kicks]
type = ChangeState
value = 3350
triggerall = var(1) = 0
triggerAll = !AILevel
triggerAll = command = "Max Super Rapid Kicks"
triggerAll = RoundState = 2 && StateType = A
triggerAll = power >= 2000 && var(20) <= 60
trigger1 = ctrl || StateNo = 40 || StateNo = 50 || StateNo = 1200
trigger2 = var(7)
trigger3 = (StateNo = [600,650])

[State -1, Max Super Rapid Kicks]
type = ChangeState
value = 3350
triggerall = var(1) = 0
triggerAll = !AILevel
triggerAll = command = "Max Super Rapid Kicks"
triggerAll = RoundState = 2 && StateType != A
triggerAll = power >= 2000 && var(20) <= 60
trigger1 = ctrl || StateNo = 40 || StateNo = 50 || StateNo = 1200 || (StateNo = [100,101])
trigger2 = var(7)
trigger3 = (StateNo = [200,450])
trigger4 = (StateNo = [1000,1050]) || (StateNo = [1400,1451]) || (StateNo = [1650,1652])
trigger5 = StateNo = 1601 || StateNo = 1603



;========================== < Goku SSJ2 Form > ==========================

;---------------- Lvl 2 -------------------------
[State -1, MAX Super Max Super Kame]
type = ChangeState
value = 3060
triggerall = var(1) = 1
triggerAll = !AILevel
triggerAll = command = "Max Super Kame"
triggerAll = RoundState = 2 && StateType != A
triggerAll = power >= 2000 && var(20) <= 60
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
trigger2 = var(7)
trigger3 = (StateNo = [200,450])
trigger4 = (StateNo = [2000,2053]) || (StateNo = [2100,2150])
trigger5 = StateNo = 3601 || StateNo = 3651 || StateNo = 3751  || StateNo = 3701
trigger5 = (movehit = [1, 8])

[State -1, Air MAX Super Max Super Kame]
type = ChangeState
value = 3041
triggerall = var(1) = 1
triggerAll = !AILevel
triggerAll = command = "Max Super Kame"
triggerAll = RoundState = 2 && StateType = A
triggerAll = power >= 2000 && var(20) <= 60
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
trigger2 = var(7)
trigger3 = (StateNo = [200,450])
trigger4 = (StateNo = [1605,1606])
trigger5 = StateNo = 1200 || (StateNo = [1250,1251]) || StateNo = 1701 || (StateNo = [1751,1752])
trigger5 = (movehit = [1, 8])
trigger6 = (StateNo = [3301,3302]) || (StateNo = [3351,3352]) || StateNo = 3501 || StateNo = 3551
trigger6 = (movehit = [1, 8])

[State -1, Max Kick Burst]
type = ChangeState
value = 3550
triggerall = var(1) = 1
triggerAll = !AILevel
triggerAll = command = "Max Super Kaioken Attack" ;!!!!!!Max Kick Burst!!!!!
triggerAll = RoundState = 2 && StateType != A
triggerAll = power >= 2000 && var(20) <= 60
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
trigger2 = var(7)
trigger3 = (StateNo = [200,450])
trigger4 = (StateNo = [2000,2053]) || (StateNo = [2100,2150])
trigger5 = StateNo = 3601 || StateNo = 3651 || StateNo = 3751  || StateNo = 3701
trigger5 = (movehit = [1, 8])

[State -1, Max Meteor Strike Bomb]
type = ChangeState
value = 3650
triggerall = var(1) = 1
triggerAll = !AILevel
triggerAll = command = "Max Meteor Strike Bomb"
triggerAll = RoundState = 2 && StateType != A
triggerAll = power >= 2000 && var(20) <= 60
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
trigger2 = var(7)
trigger3 = (StateNo = [200,450])
trigger4 = (StateNo = [2000,2053]) || (StateNo = [2100,2150])
trigger5 = StateNo = 3601 || StateNo = 3751 || StateNo = 3701
trigger5 = (movehit = [1, 8])


[State -1, Max Fierce Rush]
type = ChangeState
value = 3750
triggerall = var(1) = 1
triggerAll = !AILevel
triggerAll = command = "Max Super Rapid Kicks";!!!!!IT'S MAX FIERCE RUSH FOR SSJ2!!!!!
triggerAll = RoundState = 2 && StateType != A
triggerAll = power >= 2000 && var(20) <= 60
trigger1 = ctrl || StateNo = 40 || StateNo = 50 || StateNo = 1200 || (StateNo = [100,101])
trigger2 = var(7)
trigger3 = (StateNo = [200,450])
trigger4 = (StateNo = [2000,2053]) || (StateNo = [2100,2150])
trigger5 = StateNo = 3601 || StateNo = 3651 || StateNo = 3701
trigger5 = (movehit = [1, 8])

;========================== < Goku Base Form > ==========================

;---------------- Lvl 1 -------------------------

[State -1, Super Kame]
type = ChangeState
value = 3000
triggerall = var(1) = 0
triggerAll = !AILevel
triggerAll = command = "Kame"
triggerAll = RoundState = 2 && StateType != A
triggerAll = power >= 1000 && var(20) <= 60
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
trigger2 = var(7)
trigger3 = (StateNo = [200,450])
trigger4 = (StateNo = [1000,1050]) || (StateNo = [1400,1451]) || (StateNo = [1650,1652])
trigger5 = StateNo = 1601 || StateNo = 1603
trigger6 = StateNo = 3210 || StateNo = 3230 || StateNo = 3251
trigger6 = (movehit = [1, 8])

[State -1, Air Super Kame]
type = ChangeState
value = 3030
triggerall = var(1) = 0
triggerAll = !AILevel
triggerAll = command = "Kame"
triggerAll = RoundState = 2 && StateType = A
triggerAll = power >= 1000 && var(20) <= 60
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
trigger2 = var(7)
trigger3 = (StateNo = [200,450])
trigger4 = (StateNo = [1605,1606])
trigger5 = StateNo = 1200
trigger6 = (StateNo = [3301,3302]) || (StateNo = [3351,3352])
trigger6 = (movehit = [1, 8])

[State -1, Super Kaioken Attack]
type = ChangeState
value = 3200
triggerall = var(1) = 0
triggerAll = !AILevel
triggerAll = command = "Super Kaioken Attack"
triggerAll = RoundState = 2 && StateType != A
triggerAll = power >= 1000 && var(20) <= 60
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
trigger2 = var(7)
trigger3 = (StateNo = [200,450])
trigger4 = (StateNo = [1000,1050]) || (StateNo = [1400,1451]) || (StateNo = [1650,1652])
trigger5 = StateNo = 1601 || StateNo = 1603
trigger6 = StateNo = 3000
trigger6 = (movehit = [1, 8])

[State -1, Super Rapid Kicks]
type = ChangeState
value = 3300
triggerall = var(1) = 0
triggerAll = !AILevel
triggerAll = command = "Super Rapid Kicks"
triggerAll = RoundState = 2 && StateType != A
triggerAll = power >= 1000 && var(20) <= 60
trigger1 = ctrl || StateNo = 40 || StateNo = 50 || StateNo = 1200 || (StateNo = [100,101])
trigger2 = var(7)
trigger3 = (StateNo = [200,650])
trigger4 = (StateNo = [1000,1050]) || (StateNo = [1400,1451]) || (StateNo = [1650,1652])
trigger5 = StateNo = 1601 || StateNo = 1603
trigger5 = StateNo = 3210 || StateNo = 3230
trigger5 = (movehit = [1, 8])

[State -1, Super Air Rapid Kicks]
type = ChangeState
value = 3300
triggerall = var(1) = 0
triggerAll = !AILevel
triggerAll = command = "Super Rapid Kicks"
triggerAll = RoundState = 2 && StateType = A
triggerAll = power >= 1000 && var(20) <= 60
trigger1 = ctrl || StateNo = 40 || StateNo = 50 || StateNo = 1200
trigger2 = var(7)
trigger3 = (StateNo = [600,650])

;========================== < Goku SSJ2 Form > ==========================

;---------------- Lvl 1 -------------------------
[State -1, Super Kame]
type = ChangeState
value = 3020
triggerall = var(1) = 1
triggerAll = !AILevel
triggerAll = command = "Kame"
triggerAll = RoundState = 2 && StateType != A
triggerAll = power >= 1000 && var(20) <= 60
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
trigger2 = var(7)
trigger3 = (StateNo = [200,450])
trigger4 = (StateNo = [2000,2053]) || (StateNo = [2100,2150])
trigger5 = StateNo = 3601 || StateNo = 3651 || StateNo = 3701 || StateNo = 3751
trigger5 = (movehit = [1, 8])

[State -1, Air Super Kame]
type = ChangeState
value = 3036
triggerall = var(1) = 1
triggerAll = !AILevel
triggerAll = command = "Kame"
triggerAll = RoundState = 2 && StateType = A
triggerAll = power >= 1000 && var(20) <= 60
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
trigger2 = var(7)
trigger3 = (StateNo = [200,450])
trigger4 = (StateNo = [1605,1606])
trigger5 = StateNo = 1200 || (StateNo = [1250,1251]) || StateNo = 1701 || (StateNo = [1751,1752])
trigger5 = (movehit = [1, 8])
trigger6 = (StateNo = [3301,3302]) || (StateNo = [3351,3352]) || StateNo = 3501 || StateNo = 3551
trigger6 = (movehit = [1, 8])

[State -1, Super Kick Burst Blast]
type = ChangeState
value = 3500
triggerall = var(1) = 1
triggerAll = !AILevel
triggerAll = command = "Super Kaioken Attack";!!!!!IT'S NOT KAIOKEN IT'S "Super Kick Burst Blast" FOR SSJ2!!!!!
triggerAll = RoundState = 2 && StateType != A
triggerAll = power >= 1000 && var(20) <= 60
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
trigger2 = var(7)
trigger3 = (StateNo = [200,450])
trigger4 = (StateNo = [2000,2053]) || (StateNo = [2100,2150])
trigger5 = (StateNo = [3301,3302]) || (StateNo = [3351,3352]) || StateNo = 3501 || StateNo = 3551
trigger5 = (movehit = [1, 8])

[State -1, Meteor Strike Bomb]
type = ChangeState
value = 3600
triggerall = var(1) = 1
triggerAll = !AILevel
triggerAll = command = "Meteor Strike Bomb"
triggerAll = RoundState = 2 && StateType != A
triggerAll = power >= 1000 && var(20) <= 60
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
trigger2 = var(7)
trigger3 = (StateNo = [200,450])
trigger4 = (StateNo = [2000,2053]) || (StateNo = [2100,2150])
trigger5 = StateNo = 3651 || StateNo = 3701 || StateNo = 3751
trigger5 = (movehit = [1, 8])

[State -1, Fierce Rush]
type = ChangeState
value = 3700
triggerall = var(1) = 1
triggerAll = !AILevel
triggerAll = command = "Super Rapid Kicks";!!!!!IT'S FIERCE RUSH FOR SSJ2!!!!!
triggerAll = RoundState = 2 && StateType != A
triggerAll = power >= 1000 && var(20) <= 60
trigger1 = ctrl || StateNo = 40 || StateNo = 50 || StateNo = 1200 || (StateNo = [100,101])
trigger2 = var(7)
trigger3 = (StateNo = [200,450])
trigger4 = (StateNo = [2000,2053]) || (StateNo = [2100,2150])
trigger5 = StateNo = 3601 || StateNo = 3651 || StateNo = 3751
trigger5 = (movehit = [1, 8])

;========================== < Goku Base Form > ==========================

;---------------- EX Specials -------------------------

[State -1, EX Teleport Elbow]
type = ChangeState
value = 1450
triggerall = var(1) = 0
triggerAll = !AILevel
triggerAll = command = "EX Teleport Elbow" 
triggerAll = RoundState = 2 && StateType != A
triggerAll = power >= 500 && var(20) <= 60
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101]) || (StateNo = [200,450])
trigger2 = var(6)

[State -1, EX Kaioken Attack]
type = ChangeState
value = 1650
triggerall = var(1) = 0
triggerAll = !AILevel
triggerAll = command = "EX Kaioken Attack" 
triggerAll = RoundState = 2 && StateType != A
triggerAll = power >= 500 && var(20) <= 60
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101]) || (StateNo = [200,450])
trigger2 = var(6)

[State -1, EX Blast]
type = ChangeState
value = 1050
triggerall = var(1) = 0
triggerAll = !AILevel
triggerAll = command = "EX Blast" 
triggerAll = RoundState = 2 && StateType != A
triggerAll = power >= 500 && var(20) <= 60
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101]) || (StateNo = [200,450])
trigger2 = var(6)
trigger3 = StateNo = 1001 && Time >=24

[State -1, EX Teleport Kicks]
type = ChangeState
value = 1250
triggerall = var(1) = 0
triggerAll = !AILevel
triggerAll = command = "EX Rapid Kicks" 
triggerAll = RoundState = 2 && StateType != A
triggerAll = power >= 500 && var(20) <= 60
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
trigger2 = var(6)
trigger3 = (StateNo = [200,450])

[State -1, EX Flash Kick]
type = ChangeState
value = 1550
triggerall = var(1) = 0
triggerAll = !AILevel
triggerAll = command = "EX Flash Kick"
triggerAll = RoundState = 2 && StateType != A
triggerAll = power >= 500 && var(20) <= 60
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101]) || (StateNo = [200,450])
trigger2 = var(6)

;========================== < Goku SSJ2 Form > ==========================

;---------------- EX Specials -------------------------

[State -1, EX Rising Knee]
type = ChangeState
value = 1850
triggerall = var(1) = 1
triggerAll = !AILevel
triggerAll = command = "EX Rising Knee" 
triggerAll = RoundState = 2 && StateType != A
triggerAll = power >= 500 && var(20) <= 60
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
trigger2 = var(6)
trigger3 = (StateNo = [200,450])

[State -1, EX Instant Transmission Kick]
type = ChangeState
value = 1750
triggerall = var(1) = 1
triggerAll = !AILevel
triggerAll = command = "EX Instant Transmission Kick" 
triggerAll = RoundState = 2 && StateType != A
triggerAll = power >= 500 && var(20) <= 60
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
trigger2 = var(6)
trigger3 = (StateNo = [200,450])

[State -1, EX Instant Transmission Kick]
type = ChangeState
value = 1750
triggerall = var(1) = 1
triggerAll = !AILevel
triggerAll = command = "EX Instant Transmission Kick" 
triggerAll = RoundState = 2 && StateType = A
triggerAll = power >= 500 && var(20) <= 60
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
trigger2 = var(6)
trigger3 = (StateNo = [600,650])

[State -1, EX Teleport Kicks]
type = ChangeState
value = 1350
triggerall = var(1) = 1
triggerAll = !AILevel
triggerAll = command = "EX Rapid Kicks" 
triggerAll = RoundState = 2 && StateType != A
triggerAll = power >= 500 && var(20) <= 60
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
trigger2 = var(6)
trigger3 = (StateNo = [200,450])

[State -1, EX Blast]
type = ChangeState
value = 2150
triggerall = var(1) = 1
triggerAll = !AILevel
triggerAll = command = "EX Blast" 
triggerAll = RoundState = 2 && StateType != A
triggerAll = power >= 500 && var(20) <= 60
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101]) || (StateNo = [200,450])
trigger2 = var(6)
trigger3 = StateNo = 1001 && Time >=24

[State -1, EX Dash Scatter Attack]
type = changestate
value = 2050
triggerall = var(1) = 1
triggerall = !AIlevel
triggerall = command = "EX Dash Scatter Attack"
triggerall = roundstate = 2 && statetype != A
triggerAll = power >= 500 && var(20) <= 60
trigger1 = ctrl || ((stateno = [200, 299]) && time <= 2) || (stateno = 200 || stateno = 230)
trigger2 = (stateno = [200, 255]) && (movecontact = [1, 8])
trigger3 = var(20) && (stateno = [200, 289])
trigger4 = var(20) && ((stateno = [1000, 2999]) || stateno = 52 && (prevstateno = [1000, 2999])) && movecontact
trigger5 = var(20) && (stateno = [1000, 2999]) && numhelper(stateno + 5)
trigger5 = helper(stateno + 5), var(3)


;========================== < Goku Base Form > ==========================

;---------------- Specials ------------------------

[State -1, TeleportElbow]
type = ChangeState
value = 1400
triggerall = var(1) = 0
triggerAll = !AILevel
triggerAll = command = "Teleport Elbow"
triggerAll = RoundState = 2 && StateType != A
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101]) || (StateNo = [200,450])
trigger2 = var(6)

[State -1, Flash Kick]
type = ChangeState
value = 1500
triggerall = var(1) = 0
triggerAll = !AILevel
triggerAll = command = "Flash Kick"
triggerAll = RoundState = 2 && StateType != A
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101]) || (StateNo = [200,450])
trigger2 = var(6)

[State -1, Kaioken Attack]
type = ChangeState
value = 1600
triggerall = var(1) = 0
triggerAll = !AILevel
triggerAll = command = "Kaioken Attack"
triggerAll = RoundState = 2 && StateType != A
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101]) || (StateNo = [200,450])
trigger2 = var(6)

[State -1, Fireball]
type = ChangeState
value = 1000
triggerall = var(1) = 0
triggerAll = !AILevel
triggerAll = command = "Fireball"
triggerAll = RoundState = 2 && StateType != A
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101]) || (StateNo = [200,450])
trigger2 = var(6)

[State -1, Air Rapid Kicks]
type = ChangeState
value = 1200
triggerall = var(1) = 0
triggerAll = !AILevel
triggerAll = command = "Rapid Kicks"
triggerAll = RoundState = 2 && StateType != A
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101]) || (StateNo = [600,650])
trigger2 = var(6)
trigger3 = (StateNo = [200,450])

;========================== < Goku SSJ2 Form > ==========================

;---------------- Specials ------------------------

[State -1, Air Rapid Kicks]
type = ChangeState
value = 1300
triggerall = var(1) = 1
triggerAll = !AILevel
triggerAll = command = "Rapid Kicks"
triggerAll = RoundState = 2 && StateType != A
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101]) || (StateNo = [600,650])
trigger2 = var(6)
trigger3 = (StateNo = [200,450])

[State -1, Dash Scatter Attack]
type = changestate
value = 2000
triggerall = var(1) = 1
triggerall = !AIlevel
triggerall = command = "Dash Scatter Attack"
triggerall = roundstate = 2 && statetype != A
trigger1 = ctrl || ((stateno = [200, 299]) && time <= 2) || (stateno = 200 || stateno = 230)
trigger2 = (stateno = [200, 255]) && (movecontact = [1, 8])
trigger3 = var(20) && (stateno = [200, 289])
trigger4 = var(20) && ((stateno = [1000, 2999]) || stateno = 52 && (prevstateno = [1000, 2999])) && movecontact
trigger5 = var(20) && (stateno = [1000, 2999]) && numhelper(stateno + 5)
trigger5 = helper(stateno + 5), var(3)

[State -1, Fireball]
type = ChangeState
value = 2100
triggerall = var(1) = 1
triggerAll = !AILevel
triggerAll = command = "Fireball"
triggerAll = RoundState = 2 && StateType != A
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101]) || (StateNo = [200,450])
trigger2 = var(6)

[State -1, Rising Knee]
type = ChangeState
value = 1800
triggerall = var(1) = 1
triggerAll = !AILevel
triggerAll = command = "Rising Knee"
triggerAll = RoundState = 2 && StateType != A
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
trigger2 = var(6)
trigger3 = (StateNo = [200,450])

[State -1, Instant Transmission Kick]
type = ChangeState
value = 1700
triggerall = var(1) = 1
triggerAll = !AILevel
triggerAll = command = "Instant Transmission Kick"
triggerAll = RoundState = 2 && StateType != A
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
trigger2 = var(6)
trigger3 = (StateNo = [200,450])

[State -1, Instant Transmission Kick]
type = ChangeState
value = 1700
triggerall = var(1) = 1
triggerAll = !AILevel
triggerAll = command = "Instant Transmission Kick"
triggerAll = RoundState = 2 && StateType = A
trigger1 = ctrl || StateNo = 40 
trigger2 = var(6)
trigger3 = (StateNo = [600,650])

;-----------------------------------------------------------------------------------------------------------------

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

[State -1, MAX Mode]
type = ChangeState
value = 770
triggerall = command = "c+z"&&var(54)
triggerall = RoundState = 2 && StateType != A
triggerall = var(53) <= 0 && Power >= 1000
trigger1 = ctrl || (Stateno = [100,101])

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

[State -1, Kaioken Custom Combo]
type = changestate
value = ifelse(statetype = A, 905, 900)
triggerall = AIlevel && numenemy
triggerall = roundstate = 2 && power >= 1000 && !var(20)
triggerall = ctrl
trigger1 = (enemynear, movetype = A) && (p2bodydist x = [0, 40]) && (enemynear, vel y >= 0)
trigger1 = (enemynear, stateno = [200, 699]) && random < (50 * (AIlevel ** 2 / 64.0))

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
value = 800
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType = S
triggerAll = P2StateType != A && P2StateType != L && P2MoveType != H
triggerAll = (P2BodyDist x = [-20,40]) && P2BodyDist y = 0
trigger1 = ctrl && Random < (125 * (AIlevel ** 2 / 64.0))
trigger2 = ctrl && (P2StateNo = [120,140]) && Random < (450 * (AILevel ** 2 / 64.0))

[State -1, Throw]
type = ChangeState
value = 820
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType = S
triggerAll = P2StateType != A && P2StateType != L && P2MoveType != H
triggerAll = (P2BodyDist x = [-20,40]) && P2BodyDist y = 0
trigger1 = ctrl && Random < (125 * (AIlevel ** 2 / 64.0))
trigger2 = ctrl && (P2StateNo = [120,140]) && Random < (450 * (AILevel ** 2 / 64.0))

[State -1, Run]
type = ChangeState
value = 100
trigger1 = AILevel && NumEnemy
trigger1 = RoundState = 2 && StateType = S
trigger1 = ctrl && (StateNo != [100,106])
trigger1 = (EnemyNear, MoveType != A) && P2BodyDist x >= 160 && Random < (25 * (AILevel ** 2 / 64.0))

[State -1, Standing Heavy Punch]
type = ChangeState
value = 220 
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType != A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = (P2BodyDist x = [0,57]) && (P2Dist y = [-60,0]) && P2StateType != L
triggerAll = (EnemyNear, const(size.head.pos.y) <= -40) || (EnemyNear, StateType = A)
trigger1 = (ctrl || (StateNo = [100,101])) && Random < (25 * (AILevel ** 2 / 64.0))
trigger2 = (StateNo = [200,499]) && !AnimTime && ctrl
trigger2 = MoveHit && (EnemyNear, GetHitVar(HitTime) >= 3) && Random < (250 * (AILevel ** 2 / 64.0))

[State -1, Standing Heavy Kick]
type = ChangeState
value = 250 
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType != A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = (P2BodyDist x = [0,75]) && (P2Dist y = [-64,0]) && P2StateType != L
triggerAll = (EnemyNear, const(size.head.pos.y) <= -40) || (EnemyNear, StateType = A)
trigger1 = (ctrl || (StateNo = [100,101])) && Random < (25 * (AILevel ** 2 / 64.0))
trigger2 = (StateNo = [200,499]) && !AnimTime && ctrl
trigger2 = MoveHit && (EnemyNear, GetHitVar(HitTime) >= 4) && Random < (250 * (AILevel ** 2 / 64.0))

[State -1, Crouching Heavy Punch]
type = ChangeState
value = 420
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && Statetype != A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = (P2BodyDist x = [0,35]) && (P2Dist y = [-135,0]) && P2StateType != L
triggerAll = (EnemyNear, const(size.head.pos.y) <= -40) || (EnemyNear, StateType = A)
trigger1 = (ctrl || (StateNo = [100,101])) && Random < (25 * (AILevel ** 2 / 64.0))
trigger2 = (StateNo = [200,499]) && !AnimTime && ctrl
trigger2 = MoveHit && (EnemyNear, GetHitVar(HitTime) >= 4) && Random < (250 * (AILevel ** 2 / 64.0))

[State -1, Crouching Heavy Kick]
type = ChangeState
value = 450
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType != A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = (P2BodyDist x = [0,78]) && (P2Dist y = [-33,0]) && P2StateType != A && P2StateType != L
triggerAll = (P2StateType = S || (P2StateType = C && P2MoveType = H))
trigger1 = (ctrl || (StateNo = [100,101])) && Random < (25 * (AILevel ** 2 / 64.0))
trigger2 = (StateNo = [200,499]) && !AnimTime && ctrl
trigger2 = MoveHit && (EnemyNear, GetHitVar(HitTime) >= 6) && Random < (250 * (AILevel ** 2 / 64.0))

[State -1, Jumping Heavy Punch]
type = ChangeState
value = 620
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType = A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = (P2BodyDist x = [0,51]) && (P2Dist y = [-101,76]) && P2StateType = S
trigger1 = ctrl
trigger1 = vel y <= 0 && Random < (100 * (AILevel ** 2 / 64.0))
trigger2 = var(4) && Random < (50 * (AILevel ** 2 / 64.0))

[State -1, Neutral Jumping Heavy Kick]
type = ChangeState
value = 650
triggerAll = AILevel && NumEnemy && !vel x
triggerAll = RoundState = 2 && StateType = A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = (P2BodyDist x = [0,63]) && (P2Dist y = [-97,85]) && P2StateType = S
trigger1 = ctrl
trigger1 = vel y <= 0 && Random < (250 * (AILevel ** 2 / 64.0))
trigger2 = var(4) && Random < (50 * (AILevel ** 2 / 64.0))

[State -1, Standing Far/Close Medium Punch]
type = ChangeState
value = 210
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType != A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = (P2BodyDist x = [0,35]) && (P2Dist y = [-60,0]) && P2StateType != L
triggerAll = (EnemyNear, const(size.head.pos.y) <= -40) || (EnemyNear, StateType = A)
trigger1 = (ctrl || (StateNo = [100,101])) && Random < (25 * (AILevel ** 2 / 64.0))
trigger2 = (StateNo = [200,499]) && !AnimTime && ctrl
trigger2 = MoveHit && (EnemyNear, GetHitVar(HitTime) >= 3) && Random < (250 * (AILevel ** 2 / 64.0))

[State -1, Standing Far/Close Medium Kick]
type = ChangeState
value = 240
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType != A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = (P2BodyDist x = [0,60]) && (P2Dist y = [-121,0]) && P2StateType != L
triggerAll = (EnemyNear, const(size.head.pos.y) <= -40) || (EnemyNear, StateType = A)
trigger1 = (ctrl || (StateNo = [100,101])) && Random < (25 * (AILevel ** 2 / 64.0))
trigger2 = (StateNo = [200,499]) && !AnimTime && ctrl
trigger2 = MoveHit && (EnemyNear, GetHitVar(HitTime) >= 3) && Random < (250 * (AILevel ** 2 / 64.0))

[State -1, Crouching Medium Punch]
type = ChangeState
value = 410
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType != A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = (P2BodyDist x = [0,52]) && (P2Dist y = [-50,0]) && P2StateType != L
triggerAll = (EnemyNear, const(size.head.pos.y) <= -40) || (EnemyNear, StateType = A)
trigger1 = (ctrl || (StateNo = [100,101])) && Random < (25 * (AILevel ** 2 / 64.0))
trigger2 = (StateNo = [200,499]) && !AnimTime && ctrl
trigger2 = MoveHit && (EnemyNear, GetHitVar(HitTime) >= 3) && Random < (250 * (AILevel ** 2 / 64.0))

[State -1, Crouching Medium Kick]
type = ChangeState
value = 440
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType != A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = (P2BodyDist x = [0,65]) && (P2Dist y = [-60,0]) && P2StateType != A && P2StateType != L
trigger1 = (ctrl || (StateNo = [100,101])) && Random < (25 * (AILevel ** 2 / 64.0))
trigger2 = (StateNo = [200,499]) && !AnimTime && ctrl
trigger2 = MoveHit && (EnemyNear, GetHitVar(HitTime) >= 3) && Random < (250 * (AILevel ** 2 / 64.0))

[State -1, Jumping Medium Punch]
type = ChangeState
value = 610
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType = A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = (P2BodyDist x = [0,40]) && (P2Dist y = [-80,72]) && P2StateType = S
trigger1 = ctrl
trigger1 = vel y > 0 && Random < (100 * (AILevel ** 2 / 64.0))

[State -1, Jumping Medium Kick]
type = ChangeState
value = 640
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType = A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = (P2BodyDist x = [-60,44]) && (P2Dist y = [-60,68]) && P2StateType = A
trigger1 = ctrl
trigger1 = vel y > 0 && Random < (100 * (AILevel ** 2 / 64.0))

[State -1, Standing Light Punch]
type = ChangeState
value = 200 
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType != A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = (P2BodyDist x = [0,44]) && (P2Dist y = [-68,0]) && P2StateType != C && P2StateType != L
triggerAll = (EnemyNear, const(size.head.pos.y) <= -40) || (EnemyNear, StateType = A)
trigger1 = (ctrl || (StateNo = [100,101])) && Random < (85 * (AILevel ** 2 / 64.0))
trigger2 = (StateNo = [200,499]) && !AnimTime && ctrl
trigger2 = MoveHit && (EnemyNear, GetHitVar(HitTime) >= 3) && Random < (250 * (AILevel ** 2 / 64.0))

[State -1, Standing Light Kick]
type = ChangeState
value = 230
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType != A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = (P2BodyDist x = [0,53]) && (P2Dist y = [-68,0]) && P2StateType != L
triggerAll = (EnemyNear, const(size.head.pos.y) <= -40) || (EnemyNear, StateType = A)
trigger1 = (ctrl || (StateNo = [100,101])) && Random < (25 * (AILevel ** 2 / 64.0))
trigger2 = (StateNo = [200,499]) && !AnimTime && ctrl
trigger2 = MoveHit && (EnemyNear, GetHitVar(HitTime) >= 2) && Random < (250 * (AILevel ** 2 / 64.0))

[State -1, Crouching Light Punch]
type = ChangeState
value = 400
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType != A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = (P2BodyDist x = [0,55]) && (P2Dist y = [-44,0]) && P2StateType != A && P2StateType != L
triggerAll = (EnemyNear, const(size.head.pos.y) <= -40) || (EnemyNear, StateType = A)
trigger1 = (ctrl || (StateNo = [100,101])) && Random < (25 * (AILevel ** 2 / 64.0))
trigger2 = (StateNo = [200,499]) && !AnimTime && ctrl
trigger2 = MoveHit && (EnemyNear, GetHitVar(HitTime) >= 2) && Random < (250 * (AILevel ** 2 / 64.0))

[State -1, Crouching Light Kick]
type = ChangeState
value = 430
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType != A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = (P2BodyDist x = [0,60]) && (P2Dist y = [-25,0]) && P2StateType != A && P2StateType != L
trigger1 = (ctrl || (StateNo = [100, 101])) && Random < (25 * (AILevel ** 2 / 64.0))
trigger2 = (StateNo = [200, 499]) && !AnimTime && ctrl
trigger2 = MoveHit && (EnemyNear, GetHitVar(HitTime) >= 3) && Random < (250 * (AILevel ** 2 / 64.0))
trigger3 = ((stateno = 400) && movehit && !animtime)
trigger3 = (enemy, statetype = S && (enemy, movetype = A || !enemy, ctrl) && random < (125 * (AIlevel ** 2 / 64.0)))

[State -1, Jumping Light Punch]
type = ChangeState
value = 600
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType = A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = (P2BodyDist x = [0,40]) && (P2Dist y = [-51,60]) && P2StateType = S
trigger1 = ctrl
trigger1 = vel y > 0 && Random < (100 * (AIlevel ** 2 / 64.0))

[State -1, Jumping Light Kick]
type = ChangeState
value = 630
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType = A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = (P2BodyDist x = [0,59]) && (P2Dist y = [-80,57]) && P2StateType != L
trigger1 = ctrl
trigger1 = vel y <= 0 && Random < (ifElse(P2Dist x < 0, 250, 50) * (AILevel ** 2 / 64.0))

;===========================A.I.Supers=============================

[State -1, Meteor Break]
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
trigger1 = (movehit = [1, 16]) && (p2bodydist x = [0, 120]) && random < (200 * (AIlevel ** 2 / 64.0))
trigger2 = (stateno = [1000,1050]) && (stateno = [1400,1451]) && stateno = 1601 && stateno = 1603 && (stateno = [1651,1652])
trigger2 = (movehit = [1, 16]) && (p2bodydist x = [0, 120]) && random < (600 * (AIlevel ** 2 / 64.0))
trigger3 = (stateno = [1000,1050]) && (stateno = [1400,1451]) && stateno = 1601 && stateno = 1603 && (stateno = [1651,1652]) && numhelper(stateno + 5) && var(10) <= 6
trigger3 = helper(stateno + 5), var(3) && random < (200 * (AIlevel ** 2 / 64.0)) && stateno != 3600 && stateno != 3200 && stateno != 3100
trigger4 = (ctrl || (StateNo = [100,101])) && enemynear, movetype = A && (p2bodydist x = [0, 120]) && random < (250 * (AIlevel ** 2 / 64.0))

[State -1, Dragon Fist]
type = changestate
value = 4600
triggerall = var(1) = 1
triggerall = AIlevel && numenemy
triggerall = roundstate = 2 && statetype != A && power >= 3000 && var(20) <= 60
triggerall = !(enemynear, ctrl) && (enemynear, stateno != [120, 155])
triggerall = (p2bodydist x = [0, 100]) && p2dist y = 0 && (enemynear, vel y = 0) && (enemynear, vel x > -2) && p2statetype != L
triggerall = (enemynear, const(size.head.pos.y) <= -40) || (enemynear, statetype = A)
triggerall = !var(6)
trigger1 = ctrl && random < (700 * (AIlevel ** 2 / 64.0))
trigger2 = stateno = [200, 450]
trigger2 = (movehit = [1, 16]) && (p2bodydist x = [0, 60]) && random < (200 * (AIlevel ** 2 / 64.0))
trigger3 = (stateno = [2000,2004])
trigger3 = (movehit = [1, 16]) && (p2bodydist x = [0, 60]) && random < (200 * (AIlevel ** 2 / 64.0))
trigger4 = (ctrl || (StateNo = [100,101])) && enemynear, movetype = A && (p2bodydist x = [60, 100]) && random < (200 * (AIlevel ** 2 / 64.0))

[State -1, Warp Kamehameha]
type = changestate
value = 4100
triggerall = var(1) = 1
triggerall = AIlevel && numenemy
triggerall = roundstate = 2 && statetype != A && power >= 3000 && var(20) <= 60
triggerall = !(enemynear, ctrl) && (enemynear, stateno != [120, 155])
triggerall = (p2bodydist x = [0, 50]) && p2dist y = 0 && (enemynear, vel y = 0) && (enemynear, vel x > -2) && p2statetype != L
triggerall = (enemynear, const(size.head.pos.y) <= -40) || (enemynear, statetype = A)
triggerall = !var(6)
trigger1 = ctrl && random < (100 * (AIlevel ** 2 / 64.0))
trigger2 = (ctrl || (StateNo = [100,101])) && enemynear, movetype = A && (p2bodydist x = [0, 50]) && random < (100 * (AIlevel ** 2 / 64.0))

[State -1, Super Kaioken / Max Super Kaioken]
type = changestate
value = ifelse(power>=2000,3250,3200)
triggerall = var(1) = 0
triggerall = AIlevel && numenemy
triggerall = roundstate = 2 && statetype != A && power >= 1000 && var(20) <= 60
triggerall = !(enemynear, ctrl) && (enemynear, stateno != [120, 155])
triggerall = (p2bodydist x = [0, 30]) && p2dist y = 0 && (enemynear, vel y = 0) && (enemynear, vel x > -2) && p2statetype != L
triggerall = (enemynear, const(size.head.pos.y) <= -40) || (enemynear, statetype = A)
triggerall = !var(6)
trigger1 = ctrl && random < (400 * (AIlevel ** 2 / 64.0))
trigger2 = stateno = [200, 450]
trigger2 = (movehit = [1, 16]) && (p2bodydist x = [0, 120]) && random < (200 * (AIlevel ** 2 / 64.0))
trigger3 = (stateno = [1000,1050]) && (stateno = [1400,1451]) && stateno = 1601 && stateno = 1603 && (stateno = [1651,1652])
trigger3 = (movehit = [1, 16]) && (p2bodydist x = [0, 30]) && random < (200 * (AIlevel ** 2 / 64.0))
trigger4 = (stateno = [1001, 4999]) && numhelper(stateno + 5) && var(10) <= 6
trigger4 = helper(stateno + 5), var(3) && random < (100 * (AIlevel ** 2 / 64.0)) && stateno != 3400 && stateno != 3150 && stateno != 3100
trigger5 = (ctrl || (StateNo = [100,101])) && enemynear, movetype = A && (p2bodydist x = [0, 30]) && random < (100 * (AIlevel ** 2 / 64.0))
trigger6 = (stateno = [3000,3050]) 
trigger6 = (movehit = [1, 16]) && (p2bodydist x = [0, 30]) && random < (200 * (AIlevel ** 2 / 64.0))

[State -1, Super Rapid Kicks / Max Rapid Kicks]
type = changestate
value = ifelse(power>=2000,3350,3300)
triggerall = var(1) = 0
triggerall = AIlevel && numenemy
triggerall = roundstate = 2 && statetype != A && power >= 1000 && var(20) <= 60
triggerall = !(enemynear, ctrl) && (enemynear, stateno != [120, 155])
triggerall = (p2bodydist x = [0, 30]) && p2dist y = 0 && (enemynear, vel y = 0) && (enemynear, vel x > -2) && p2statetype != L
triggerall = (enemynear, const(size.head.pos.y) <= -40) || (enemynear, statetype = A)
triggerall = !var(6)
trigger1 = ctrl && random < (400 * (AIlevel ** 2 / 64.0))
trigger2 = stateno = [200, 450]
trigger2 = (movehit = [1, 16]) && (p2bodydist x = [0, 120]) && random < (200 * (AIlevel ** 2 / 64.0))
trigger3 = (stateno = [1000,1050]) && (stateno = [1400,1451]) && stateno = 1601 && stateno = 1603 && (stateno = [1651,1652])
trigger3 = (movehit = [1, 16]) && (p2bodydist x = [0, 30]) && random < (200 * (AIlevel ** 2 / 64.0))
trigger4 = (stateno = [1001, 4999]) && numhelper(stateno + 5) && var(10) <= 6
trigger4 = helper(stateno + 5), var(3) && random < (100 * (AIlevel ** 2 / 64.0)) && stateno != 3400 && stateno != 3150 && stateno != 3100
trigger5 = (ctrl || (StateNo = [100,101])) && enemynear, movetype = A && (p2bodydist x = [0, 30]) && random < (100 * (AIlevel ** 2 / 64.0))
trigger6 = (stateno = [3210,3230]) && stateno = 3251 && (stateno = [3600,3601]) && stateno = 3651 && stateno = 3701 && stateno = 3751 && (stateno = [1651,1652])
trigger6 = (movehit = [1, 16]) && (p2bodydist x = [0, 30]) && random < (200 * (AIlevel ** 2 / 64.0))

[State -1, Hand Spirit Bomb]
type = changestate
value = 3400
triggerall = var(1) = 0
triggerall = AIlevel && numenemy
triggerall = roundstate = 2 && statetype != A && power >= 2000 && var(20) <= 60
triggerall = !numhelper(3405)
triggerall = !(enemynear, ctrl) && ((p2stateno != [120, 155]) || p2statetype = A)
triggerall = (p2bodydist x = [75, 150]) && p2statetype != L
triggerall = (p2dist y = [ -100, 0]) && (enemynear, vel y = [ -7, 1]) && (enemynear, vel x > -2) && p2statetype != L
triggerall = (enemynear, const(size.head.pos.y) <= -40) || (enemynear, statetype = A)
triggerall = !var(6)
trigger1 = ctrl && (p2bodydist x = [40, 150]) && random < (50 * (AIlevel ** 2 / 64.0))
trigger2 = (stateno = [200, 450]) && (movehit = [1, 16]) && random < (50 * (AIlevel ** 2 / 64.0))
trigger3 = (stateno = [1000,1050]) && (stateno = [1400,1451]) && stateno = 1601 && stateno = 1603 && (stateno = [1651,1652]) && (movehit = [1, 16]) && random < (50 * (AIlevel ** 2 / 64.0))
trigger4 = (stateno = [1001, 4999]) && numhelper(stateno + 5) && (stateno != [3210,3230]) && (stateno != [3251,3253])
trigger4 = helper(stateno + 5), var(3) && random < (50 * (AIlevel ** 2 / 64.0))
trigger5 = stateno = 52 && !animtime && (prevstateno = [1000, 2999]) && numtarget && random < (850 * (AIlevel ** 2 / 64.0))
trigger6 = (stateno = [3210,3230]) && stateno = 3251 
trigger6 = (movehit = [1, 16]) && (p2bodydist x = [0, 30]) && random < (200 * (AIlevel ** 2 / 64.0))

[State -1, Kamehameha / Max Kamehameha]
type = changestate
value = ifelse(power>=2000,3050,3000)
triggerall = var(1) = 0
triggerall = AIlevel && numenemy
triggerall = roundstate = 2 && statetype != A && power >= 1000 && var(20) <= 60
triggerall = !numhelper(3005) && !numhelper(3015)
triggerall = !(enemynear, ctrl) && ((p2stateno != [120, 155]) || p2statetype = A)
triggerall = (p2bodydist x = [0, 100]) && p2statetype != L
triggerall = (p2dist y = [ -100, 0]) && (enemynear, vel y = [ -7, 1]) && (enemynear, vel x > -2)
triggerall = (enemynear, const(size.head.pos.y) <= -40) || (enemynear, statetype = A)
triggerall = !var(6)
trigger1 = ctrl && (p2bodydist x = [15, 125]) && random < (50 * (AIlevel ** 2 / 64.0))
trigger2 = (stateno = [200, 450]) && (movehit = [1, 16]) && random < (50 * (AIlevel ** 2 / 64.0))
trigger3 = (stateno = [1000,1050]) && (stateno = [1400,1451]) && stateno = 1601 && stateno = 1603 && (stateno = [1651,1652]) && (movehit = [1, 16]) && random < (50 * (AIlevel ** 2 / 64.0))
trigger4 = (stateno = [1001, 4999]) && numhelper(stateno + 5) && (stateno != [3210,3230]) && (stateno != [3251,3253])
trigger4 = helper(stateno + 5), var(3) && random < (50 * (AIlevel ** 2 / 64.0))
trigger5 = stateno = 52 && !animtime && (prevstateno = [1000, 2999]) && numtarget && random < (250 * (AIlevel ** 2 / 64.0))
trigger6 = (stateno = [3210,3230]) && stateno = 3251 
trigger6 = (movehit = [1, 16]) && (p2bodydist x = [0, 30]) && random < (200 * (AIlevel ** 2 / 64.0))

[State -1, SSJ2 Kamehameha / Max SSJ2 Kamehameha]
type = changestate
value = ifelse(power>=2000,3060,3020)
triggerall = var(1) = 1
triggerall = AIlevel && numenemy
triggerall = roundstate = 2 && statetype != A && power >= 1000 && var(20) <= 60
triggerall = !numhelper(3022) && !numhelper(3024)
triggerall = !(enemynear, ctrl) && ((p2stateno != [120, 155]) || p2statetype = A)
triggerall = (p2bodydist x = [0, 100]) && p2statetype != L
triggerall = (p2dist y = [ -100, 0]) && (enemynear, vel y = [ -7, 1]) && (enemynear, vel x > -2)
triggerall = (enemynear, const(size.head.pos.y) <= -40) || (enemynear, statetype = A)
triggerall = !var(6)
trigger1 = ctrl && (p2bodydist x = [15, 125]) && random < (50 * (AIlevel ** 2 / 64.0))
trigger2 = (stateno = [200, 450]) && (movehit = [1, 16]) && random < (50 * (AIlevel ** 2 / 64.0))
trigger3 = (stateno = [2000,2004]) && (stateno = [2050,2053])
trigger3 = (movehit = [1, 16]) && (p2bodydist x = [0, 60]) && random < (200 * (AIlevel ** 2 / 64.0))
trigger4 = (stateno = [1001, 4999]) && numhelper(stateno + 5) && (stateno != [3600,3601]) && (stateno != [3650,3652])
trigger4 = helper(stateno + 5), var(3) && random < (50 * (AIlevel ** 2 / 64.0))
trigger5 = stateno = 52 && !animtime && (prevstateno = [1000, 2999]) && numtarget && random < (250 * (AIlevel ** 2 / 64.0))
trigger6 = ctrl && random < (400 * (AIlevel ** 2 / 64.0))
trigger7 = (stateno = [3600,3601]) && stateno = 3651 && stateno = 3701 && stateno = 3751
trigger7 = (movehit = [1, 16]) && (p2bodydist x = [0, 30]) && random < (200 * (AIlevel ** 2 / 64.0))

[State -1, Air Kamehameha / Max Air Kamehameha]
type = changestate
value = ifelse(power>=2000,3040,3030)
triggerall = var(1) = 0
triggerall = AIlevel && numenemy
triggerall = roundstate = 2 && statetype = A && power >= 1000 && var(20) <= 60
triggerall = !numhelper(3005) && !numhelper(3015)
triggerall = !(enemynear, ctrl) && (enemynear, stateno != [120, 155])
trigger1 = (stateno = [600, 650])
trigger1 = (movehit = [1, 16]) && random < (100 * (AIlevel ** 2 / 64.0))
trigger2 = stateno = 1200 && (movehit = [1, 16]) && random < (100 * (AIlevel ** 2 / 64.0))
trigger3 = stateno = 3301 && stateno = 3351 
trigger3 = (movehit = [1, 16]) && (p2bodydist x = [0, 30]) && random < (200 * (AIlevel ** 2 / 64.0))

[State -1, SSJ2 Air Kamehameha / Max SSJ2 Air Kamehameha]
type = changestate
value = ifelse(power>=2000,3041,3036)
triggerall = var(1) = 1
triggerall = AIlevel && numenemy
triggerall = roundstate = 2 && statetype = A && power >= 1000 && var(20) <= 60
triggerall = !numhelper(3025) && !numhelper(3042)
triggerall = !(enemynear, ctrl) && (enemynear, stateno != [120, 155])
trigger1 = (stateno = [600, 650])
trigger1 = (movehit = [1, 16]) && random < (100 * (AIlevel ** 2 / 64.0))
trigger2 = stateno = 1200 && (movehit = [1, 16]) && random < (100 * (AIlevel ** 2 / 64.0))
trigger3 = stateno = 3501 && stateno = 3551 && stateno = 3702 && (stateno = [3752,3753])
trigger3 = (movehit = [1, 16]) && (p2bodydist x = [0, 30]) && random < (200 * (AIlevel ** 2 / 64.0))

[State -1, Meteor Strike Bomb / Max Meteor Strike Bomb]
type = changestate
value = ifelse(power>=2000,3650,3600)
triggerall = var(1) = 1
triggerall = AIlevel && numenemy
triggerall = roundstate = 2 && statetype != A && power >= 1000 && var(20) <= 60
triggerall = !(enemynear, ctrl) && (enemynear, stateno != [120, 155])
triggerall = (p2bodydist x = [0, 30]) && p2dist y = 0 && (enemynear, vel y = 0) && (enemynear, vel x > -2) && p2statetype != L
triggerall = (enemynear, const(size.head.pos.y) <= -40) || (enemynear, statetype = A)
triggerall = !var(6)
trigger1 = ctrl && random < (350 * (AIlevel ** 2 / 64.0))
trigger2 = stateno = [200, 450]
trigger2 = (movehit = [1, 16]) && (p2bodydist x = [0, 120]) && random < (200 * (AIlevel ** 2 / 64.0))
trigger3 = (stateno = [2000,2004]) && (stateno = [2050,2053])
trigger3 = (movehit = [1, 16]) && (p2bodydist x = [0, 60]) && random < (200 * (AIlevel ** 2 / 64.0))
trigger4 = (stateno = [1001, 4999]) && numhelper(stateno + 5) && var(10) <= 6
trigger4 = helper(stateno + 5), var(3) && random < (100 * (AIlevel ** 2 / 64.0)) && stateno != 3400 && stateno != 3150 && stateno != 3100
trigger5 = (ctrl || (StateNo = [100,101])) && enemynear, movetype = A && (p2bodydist x = [0, 60]) && random < (300 * (AIlevel ** 2 / 64.0))
trigger6 =  stateno = 3701 && stateno = 3751
trigger6 = (movehit = [1, 16]) && (p2bodydist x = [0, 30]) && random < (200 * (AIlevel ** 2 / 64.0))

[State -1, Kick Burst / Max Kick Burst]
type = changestate
value = ifelse(power>=2000,3550,3500)
triggerall = var(1) = 1
triggerall = AIlevel && numenemy
triggerall = roundstate = 2 && statetype != A && power >= 1000 && var(20) <= 60
triggerall = !(enemynear, ctrl) && (enemynear, stateno != [120, 155])
triggerall = (p2bodydist x = [0, 80]) && p2dist y = 0 && (enemynear, vel y = 0) && (enemynear, vel x > -2) && p2statetype != L
triggerall = (enemynear, const(size.head.pos.y) <= -40) || (enemynear, statetype = A)
triggerall = !var(6)
trigger1 = ctrl && random < (300 * (AIlevel ** 2 / 64.0))
trigger2 = stateno = [200, 450]
trigger2 = (movehit = [1, 16]) && (p2bodydist x = [0, 100]) && random < (200 * (AIlevel ** 2 / 64.0))
trigger3 = (stateno = [2000,2004]) && (stateno = [2050,2053])
trigger3 = (movehit = [1, 16]) && (p2bodydist x = [0, 60]) && random < (200 * (AIlevel ** 2 / 64.0))
trigger4 = (stateno = [1001, 4999]) && numhelper(stateno + 5) && var(10) <= 6
trigger4 = helper(stateno + 5), var(3) && random < (100 * (AIlevel ** 2 / 64.0)) && stateno != 3400 && stateno != 3150 && stateno != 3100
trigger5 = (ctrl || (StateNo = [100,101])) && enemynear, movetype = A && (p2bodydist x = [0, 60]) && random < (200 * (AIlevel ** 2 / 64.0))
trigger6 = (stateno = [3600,3601]) && stateno = 3651 && stateno = 3701 && stateno = 3751
trigger6 = (movehit = [1, 16]) && (p2bodydist x = [0, 30]) && random < (200 * (AIlevel ** 2 / 64.0))

[State -1, Fierce Rush / Max Fierce Rush]
type = changestate
value = ifelse(power>=2000,3750,3700)
triggerall = var(1) = 1
triggerall = AIlevel && numenemy
triggerall = roundstate = 2 && statetype != A && power >= 1000 && var(20) <= 60
triggerall = !(enemynear, ctrl) && (enemynear, stateno != [120, 155])
triggerall = (p2bodydist x = [0, 60]) && p2dist y = 0 && (enemynear, vel y = 0) && (enemynear, vel x > -2) && p2statetype != L
triggerall = (enemynear, const(size.head.pos.y) <= -40) || (enemynear, statetype = A)
triggerall = !var(6)
trigger1 = ctrl && random < (300 * (AIlevel ** 2 / 64.0))
trigger2 = stateno = [200, 450]
trigger2 = (movehit = [1, 16]) && (p2bodydist x = [0, 120]) && random < (200 * (AIlevel ** 2 / 64.0))
trigger3 = (stateno = [2000,2004]) && (stateno = [2050,2053])
trigger3 = (movehit = [1, 16]) && (p2bodydist x = [0, 60]) && random < (200 * (AIlevel ** 2 / 64.0))
trigger4 = (stateno = [1001, 4999]) && numhelper(stateno + 5) && var(10) <= 6
trigger4 = helper(stateno + 5), var(3) && random < (100 * (AIlevel ** 2 / 64.0)) && stateno != 3400 && stateno != 3150 && stateno != 3100
trigger5 = (ctrl || (StateNo = [100,101])) && enemynear, movetype = A && (p2bodydist x = [0, 60]) && random < (200 * (AIlevel ** 2 / 64.0))
trigger6 = (stateno = [3600,3601]) && stateno = 3651
trigger6 = (movehit = [1, 16]) && (p2bodydist x = [0, 30]) && random < (200 * (AIlevel ** 2 / 64.0))

[State -1, SSJmodechange]
type = changestate
value = ifelse(life>=500,4500,4501)
triggerall = var(1) = 0
triggerall = AIlevel && numenemy
triggerall = roundstate = 2 && statetype != A && power >= 3000 && var(20) <= 60
trigger1 = ctrl && random < (2500 * (AIlevel ** 2 / 64.0))

;===========================A.I.Specials(Base)=============================

[State -1, Kaioken Attack / EX Kaioken Attack]
type = changestate
triggerall = var(1) = 0
value = ifelse((power >= 500 && random < 50), 1650, 1600)
triggerall = AIlevel && numenemy
triggerall = roundstate = 2 && statetype != A && var(20) <= 60
triggerall = (p2stateno != [120, 155]) && p2statetype != L && !(enemynear, hitfall)
triggerall = (p2bodydist x = [0, 90]) && (p2bodydist y = [ 0, 60]) && p2statetype != L
triggerall = (enemynear, const(size.head.pos.y) <= -40) || (enemynear, statetype = A)
trigger1 = ctrl && random < (100 * (AIlevel ** 2 / 64.0))
trigger2 = !var(6) && (stateno = [200, 450]) && (movehit = [1, 16]) && random < (50 * (AIlevel ** 2 / 64.0))

[State -1, Dash Elbow / EX Dash Elbow]
type = changestate
triggerall = var(1) = 0
value = ifelse((power >= 500 && random < 50), 1450, 1400)
triggerall = AIlevel && numenemy
triggerall = roundstate = 2 && statetype != A && var(20) <= 60
triggerall = (p2stateno != [120, 155]) && p2statetype != L && !(enemynear, hitfall)
triggerall = (p2bodydist x = [20, 100]) && (p2bodydist y = [ 0, 60])
triggerall = (enemynear, const(size.head.pos.y) <= -40) || (enemynear, statetype = A)
trigger1 = ctrl && random < (200 * (AIlevel ** 2 / 64.0))
trigger2 = !var(6) && (stateno = [200, 450]) && (movehit = [1, 16]) && random < (100 * (AIlevel ** 2 / 64.0))

[State -1, Rapid Kicks / EX Rapid Kicks]
type = changestate
triggerall = var(1) = 0
value =  ifelse((power >= 500 && random < 100), 1250, 1200)
triggerall = AIlevel && numenemy
triggerall = roundstate = 2 && statetype != A && var(20) <= 60
triggerall = !(enemynear, ctrl) && (enemynear, stateno != [120, 155])
triggerall = (p2statetype != L || p2stateno = 5120) && (p2bodydist x = [0, 80]) && (p2dist y = [ -120, 0])
triggerall = (enemynear, const(size.head.pos.y) <= -40) || (enemynear, statetype = A)
triggerall = !var(6)
trigger1 = ctrl && p2statetype = A && random < (ifelse(prevstateno = 1400 || prevstateno = 52, 444, 200) * (AIlevel ** 2 / 64.0))
trigger2 = !var(6) && (stateno = [200, 450]) && stateno!= 225
trigger2 = (movehit = [1, 8]) && (p2bodydist x = [0, 12]) && random < (500 * (AIlevel ** 2 / 64.0))
trigger4 = ctrl && enemynear, movetype = A && (p2bodydist x = [0, 40]) && random < (500 * (AIlevel ** 2 / 64.0))
trigger5 = stateno = 0 && prevstateno = 5120 && time <= 1
trigger5 = ctrl && (p2bodydist x = [ -40, 40]) && random < (500 * (AIlevel ** 2 / 64.0))
trigger6 = ctrl && (p2bodydist x = [ -30, 30])
trigger6 = (enemynear, stateno = 5120) && (enemynear, animtime = [ -6, -3]) && random < (250 * (AIlevel ** 2 / 64.0))

[State -1, Flash Kick / EX Flash Kick]
type = changestate
triggerall = var(1) = 0
value = ifelse((power >= 500 && random < 50), 1550, 1500)
triggerall = AIlevel && numenemy
triggerall = roundstate = 2 && statetype != A && var(20) <= 60
triggerall = (p2stateno != [120, 155]) && p2statetype != L && !(enemynear, hitfall)
triggerall = (p2bodydist x = [50, 100]) && (p2bodydist y = [ 0, 60])
triggerall = (enemynear, const(size.head.pos.y) <= -40) || (enemynear, statetype = A)
trigger1 = ctrl && random < (100 * (AIlevel ** 2 / 64.0))
trigger2 = !var(6) && (stateno = [200, 450]) && (movehit = [1, 16]) && random < (100 * (AIlevel ** 2 / 64.0))

[State -1, FireBlast / EX FireHlast]
type = changestate
triggerall = var(1) = 0
value = ifelse((power >= 500 && random < 100), 1050, 1000)
triggerall = AIlevel && numenemy
triggerall = roundstate = 2 && statetype != A && var(20) <= 60
triggerall = (p2stateno != [120, 155]) && p2statetype != L
triggerall = (enemynear, vel y > -1)
triggerall = ifelse(!var(20), !numhelper(1005) && !numhelper(1001), 1) && !numhelper(1050)
triggerall = (enemynear, const(size.head.pos.y) <= -40) || (enemynear, statetype = A)
triggerall = !var(6)
trigger1 = ctrl && p2dist x > 160 && random < (300 * (AIlevel ** 2 / 64.0))
trigger2 =!var(6) && (stateno = [200, 255]) && random < (200 * (AIlevel ** 2 / 64.0))

;===========================A.I.Specials(SSJ2)=============================

[State -1, Dash Quick Attack / EX Quick Attack]
type = changestate
triggerall = var(1) = 1
value = ifelse((power >= 500 && random < 50), 2050, 2000)
triggerall = AIlevel && numenemy
triggerall = roundstate = 2 && statetype != A && var(20) <= 60
triggerall = (p2stateno != [120, 155]) && p2statetype != L && !(enemynear, hitfall)
triggerall = (p2bodydist x = [20, 100]) && (p2bodydist y = [ 0, 60])
triggerall = (enemynear, const(size.head.pos.y) <= -40) || (enemynear, statetype = A)
trigger1 = ctrl && random < (100 * (AIlevel ** 2 / 64.0))
trigger2 = !var(6) && (stateno = [200, 450]) && (movehit = [1, 16]) && random < (200 * (AIlevel ** 2 / 64.0))

[State -1, Rapid Kicks / EX Rapid Kicks]
type = changestate
triggerall = var(1) = 1
value =  ifelse((power >= 500 && random < 100), 1350, 1300)
triggerall = AIlevel && numenemy
triggerall = roundstate = 2 && statetype != A && var(20) <= 60
triggerall = !(enemynear, ctrl) && (enemynear, stateno != [120, 155])
triggerall = (p2statetype != L || p2stateno = 5120) && (p2bodydist x = [0, 80]) && (p2dist y = [ -120, 0])
triggerall = (enemynear, const(size.head.pos.y) <= -40) || (enemynear, statetype = A)
triggerall = !var(6)
trigger1 = ctrl && p2statetype = A && random < (ifelse(prevstateno = 1400 || prevstateno = 52, 444, 200) * (AIlevel ** 2 / 64.0))
trigger2 = !var(6) && (stateno = [200, 450]) && stateno!= 225
trigger2 = (movehit = [1, 8]) && (p2bodydist x = [0, 12]) && random < (500 * (AIlevel ** 2 / 64.0))
trigger4 = ctrl && enemynear, movetype = A && (p2bodydist x = [0, 40]) && random < (500 * (AIlevel ** 2 / 64.0))
trigger5 = stateno = 0 && prevstateno = 5120 && time <= 1
trigger5 = ctrl && (p2bodydist x = [ -40, 40]) && random < (500 * (AIlevel ** 2 / 64.0))
trigger6 = ctrl && (p2bodydist x = [ -30, 30])
trigger6 = (enemynear, stateno = 5120) && (enemynear, animtime = [ -6, -3]) && random < (250 * (AIlevel ** 2 / 64.0))

[State -1, Instant Transmission Kick / EX Instant Transmission Kick]
type = ChangeState
triggerall = var(1) = 1
value = ifelse(power>=500&&random<75&&enemynear,statetype=S&&power<3000,1750,1700)
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && var(20) <= 60
triggerAll = (P2BodyDist x = [0,150]) && (P2Dist y = [-50,0]) && P2StateType != L
triggerAll = (EnemyNear, const(size.head.pos.y) <= -40) || (EnemyNear, StateType = A)
trigger1 = (ctrl || (StateNo = [100,101])) && Random < (25 * (AILevel ** 2 / 64.0))
trigger2 = (StateNo = [200,650]) && !AnimTime && (ctrl || (StateNo = [100,101]))
trigger2 = MoveHit && (EnemyNear, GetHitVar(HitTime) >= 3) && Random < (200 * (AILevel ** 2 / 64.0))

[State -1, Rising Knee / EX Rising Knee]
type = changestate
value =  ifelse((power >= 500 && random < 100), 1850, 1800)
triggerall = var(1) = 1
triggerall = AIlevel && numenemy
triggerall = roundstate = 2 && statetype != A && var(20) <= 60
triggerall = !(enemynear, ctrl) && (enemynear, stateno != [120, 155])
triggerall = (p2statetype != L || p2stateno = 5120) && (p2bodydist x = [0, 80]) && (p2dist y = [ -120, 0])
triggerall = (enemynear, const(size.head.pos.y) <= -40) || (enemynear, statetype = A)
triggerall = !var(6)
trigger1 = ctrl && p2statetype = A && random < (ifelse(prevstateno = 2004 || prevstateno = 52, 444, 200) * (AIlevel ** 2 / 64.0))
trigger2 = !var(6) && (stateno = [200, 450]) && stateno!= 225
trigger2 = (movehit = [1, 8]) && (p2bodydist x = [0, 12]) && random < (500 * (AIlevel ** 2 / 64.0))
trigger4 = ctrl && enemynear, movetype = A && (p2bodydist x = [0, 40]) && random < (500 * (AIlevel ** 2 / 64.0))
trigger5 = stateno = 0 && prevstateno = 5120 && time <= 1
trigger5 = ctrl && (p2bodydist x = [ -40, 40]) && random < (500 * (AIlevel ** 2 / 64.0))
trigger6 = ctrl && (p2bodydist x = [ -30, 30])
trigger6 = (enemynear, stateno = 5120) && (enemynear, animtime = [ -6, -3]) && random < (250 * (AIlevel ** 2 / 64.0))

[State -1, FireBlast / EX FireHlast]
type = changestate
triggerall = var(1) = 1
value = ifelse((power >= 500 && random < 100), 2150, 2100)
triggerall = AIlevel && numenemy
triggerall = roundstate = 2 && statetype != A && var(20) <= 60
triggerall = (p2stateno != [120, 155]) && p2statetype != L
triggerall = (enemynear, vel y > -1)
triggerall = ifelse(!var(20), !numhelper(1005) && !numhelper(1001), 1) && !numhelper(1050)
triggerall = (enemynear, const(size.head.pos.y) <= -40) || (enemynear, statetype = A)
triggerall = !var(6)
trigger1 = ctrl && p2dist x > 160 && random < (300 * (AIlevel ** 2 / 64.0))
trigger2 =!var(6) && (stateno = [200, 255]) && random < (200 * (AIlevel ** 2 / 64.0))
