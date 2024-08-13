;#ADD004BASIC PIEs#
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
command = $F
time = 1

[Command]
name = "back"
command = $B
time = 1

[Command]
name = "up"
command = $U
time = 1

[Command]
name = "down"
command = $D
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

[Command]
name = "PerfectBlizzard"
command = ~D, DB, B, D, DB, B, a+x
time = 32

[Command]
name = "PerfectBlizzard"
command = ~D, DB, B, D, DB, B, b+y
time = 32

[Command]
name = "PerfectBlizzard"
command = ~D, DB, B, D, DB, B, c+z
time = 32

[Command]
name = "PerfectBlizzard"
command = ~D, DB, B, D, DB, B, x+y+z
time = 32


[Command]
name = "RUSIAN"
command = ~D, DF, F, D, DF, F, a+x
time = 32

[Command]
name = "RUSIAN"
command = ~D, DF, F, D, DF, F, b+y
time = 32

[Command]
name = "RUSIAN"
command = ~D, DF, F, D, DF, F, c+z
time = 32

[Command]
name = "RUSIAN"
command = ~D, DF, F, D, DF, F, x+y+z
time = 32


[Command]
name = "MaxMeteorStrike"
command = ~D, DF, F, D, DF, F, x+y
time = 32

[Command]
name = "MaxMeteorStrike"
command = ~D, DF, F, D, DF, F, y+z
time = 32

[Command]
name = "MaxMeteorStrike"
command = ~D, DF, F, D, DF, F, x+z
time = 32


[Command]
name = "MeteorStrike"
command = ~D, DF, F, D, DF, F, x
time = 32

[Command]
name = "MeteorStrike"
command = ~D, DF, F, D, DF, F, y
time = 32

[Command]
name = "MeteorStrike"
command = ~D, DF, F, D, DF, F, z
time = 32

[Command]
name = "MeteorStrike"
command = ~D, DF, F, D, DF, F, ~x
time = 32

[Command]
name = "MeteorStrike"
command = ~D, DF, F, D, DF, F, ~y
time = 32

[Command]
name = "MeteorStrike"
command = ~D, DF, F, D, DF, F, ~z
time = 32


[Command]
name = "MaxGOS"
command = ~D, DF, F, D, DB, B, x+y
time = 32

[Command]
name = "MaxGOS"
command = ~D, DF, F, D, DB, B, y+z
time = 32

[Command]
name = "MaxGOS"
command = ~D, DF, F, D, DB, B, x+z
time = 32


[Command]
name = "GOS"
command = ~D, DF, F, D, DB, B, x
time = 32

[Command]
name = "GOS"
command = ~D, DF, F, D, DB, B, y
time = 32

[Command]
name = "GOS"
command = ~D, DF, F, D, DB, B, z
time = 32

[Command]
name = "GOS"
command = ~D, DF, F, D, DB, B, ~x
time = 32

[Command]
name = "GOS"
command = ~D, DF, F, D, DB, B, ~y
time = 32

[Command]
name = "GOS"
command = ~D, DF, F, D, DB, B, ~z
time = 32


[Command]
name = "MaxSuperHeal"
command = ~D, DB, B, D, DB, B, x+y
time = 32

[Command]
name = "MaxSuperHeal"
command = ~D, DB, B, D, DB, B, y+z
time = 32

[Command]
name = "MaxSuperHeal"
command = ~D, DB, B, D, DB, B, x+z
time = 32


[Command]
name = "SuperHeal"
command = ~D, DB, B, D, DB, B, x
time = 32

[Command]
name = "SuperHeal"
command = ~D, DB, B, D, DB, B, y
time = 32

[Command]
name = "SuperHeal"
command = ~D, DB, B, D, DB, B, z
time = 32

[Command]
name = "SuperHeal"
command = ~D, DB, B, D, DB, B, ~x
time = 32

[Command]
name = "SuperHeal"
command = ~D, DB, B, D, DB, B, ~y
time = 32

[Command]
name = "SuperHeal"
command = ~D, DB, B, D, DB, B, ~z
time = 32

;====================<SPECIAL MOTIONS>====================
[Command]
name = "Magic"
command = ~D, DF, F, x
time = 16

[Command]
name = "Magic"
command = ~D, DF, F, y
time = 16

[Command]
name = "Magic"
command = ~D, DF, F, z
time = 16

[Command]
name = "Magic"
command = ~D, DF, F, ~x
time = 16

[Command]
name = "Magic"
command = ~D, DF, F, ~y
time = 16

[Command]
name = "Magic"
command = ~D, DF, F, ~z
time = 16


[Command]
name = "EXMagic"
command = ~D, DF, F, x+y
time = 16

[Command]
name = "EXMagic"
command = ~D, DF, F, y+z
time = 16

[Command]
name = "EXMagic"
command = ~D, DF, F, x+z
time = 16


[Command]
name = "Support"
command = ~D, D, x
time = 16

[Command]
name = "Support"
command = ~D, D, y
time = 16

[Command]
name = "Support"
command = ~D, D, z
time = 16

[Command]
name = "Support"
command = ~D, D, ~x
time = 16

[Command]
name = "Support"
command = ~D, D, ~y
time = 16

[Command]
name = "Support"
command = ~D, D, ~z
time = 16


[Command]
name = "EXSupport"
command = ~D, D, x+y
time = 16

[Command]
name = "EXSupport"
command = ~D, D, y+z
time = 16

[Command]
name = "EXSupport"
command = ~D, D, x+z
time = 16


[Command]
name = "LovelyShot"
command = ~F, D, DF, x
time = 16

[Command]
name = "LovelyShot"
command = ~F, D, DF, y
time = 16

[Command]
name = "LovelyShot"
command = ~F, D, DF, z
time = 16

[Command]
name = "LovelyShot"
command = ~F, D, DF, ~x
time = 16

[Command]
name = "LovelyShot"
command = ~F, D, DF, ~y
time = 16

[Command]
name = "LovelyShot"
command = ~F, D, DF, ~z
time = 16


[Command]
name = "EXLovelyShot"
command = ~F, D, DF, x+y
time = 16

[Command]
name = "EXLovelyShot"
command = ~F, D, DF, y+z
time = 16

[Command]
name = "EXLovelyShot"
command = ~F, D, DF, x+z
time = 16


[Command]
name = "TwinkleStar"
command = ~D, DB, B, x
time = 16

[Command]
name = "TwinkleStar"
command = ~D, DB, B, y
time = 16

[Command]
name = "TwinkleStar"
command = ~D, DB, B, z
time = 16

[Command]
name = "TwinkleStar"
command = ~D, DB, B, ~x
time = 16

[Command]
name = "TwinkleStar"
command = ~D, DB, B, ~y
time = 16

[Command]
name = "TwinkleStar"
command = ~D, DB, B, ~z
time = 16


[Command]
name = "EXTwinkleStar"
command = ~D, DB, B, x+y
time = 16

[Command]
name = "EXTwinkleStar"
command = ~D, DB, B,  y+z
time = 16

[Command]
name = "EXTwinkleStar"
command = ~D, DB, B, x+z
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
name = "recovery"
command = a+b
time = 1

[Command]
name = "recovery"
command = a+c
time = 1

[Command]
name = "recovery"
command = b+c
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

;##[a4b_-1_start.v20200523]##
;//==========================
;// add004-1-sctrls-start
;//==========================
;--- partner_standby
[state 0]
	type=selfstate
	value=190190
	ctrl=0
	trigger1=ctrl && numpartner && !ishelper && roundstate=2 && pos y=0
	trigger1=(sysfvar(4)>0) && (sysfvar(0)>0) && playeridexist(floor(sysfvar(0)))
	trigger1=(playerid(floor(sysfvar(0))),var(0)=90900) && (playerid(floor(sysfvar(0))),var(22)=4)
	ignorehitpause=1
;##Add.List01##
;//==========================
;// add004-1-sctrls-end
;//==========================
;##[a4b_-1_end]##




[State -1, Tick Fix]
type = CtrlSet
triggerall = RoundState = 2
triggerall = !ctrl
triggerall = movetype!=H
trigger1 = (stateno = 52 || stateno = 101 || stateno = 5120) && !AnimTime
trigger2 = (stateno = [200,299]) && !AnimTime
trigger3 = (stateno = [400,499]) && !AnimTime
trigger4 = (stateno = [700,715]) && !AnimTime
trigger5 = (stateno = [6080,6082]) && (!AnimTime || Time >= 15)
value = 1

[State -1, CtrlSet For Helpers]
type = CtrlSet
trigger1 = IsHelper
value = 0

[State -1, Hit Count For Helpers]
type = Null;ParentVarAdd
trigger1 = IsHelper
trigger1 = MoveHit = 1
trigger1 = !HitPauseTime
trigger1 = !(HitDefAttr = SCA, AT)
var(13) = 1

[State -1, Juggle Count For Helpers]
type = Null;ParentVarAdd
trigger1 = IsHelper
trigger1 = MoveHit = 1
trigger1 = !HitPauseTime
trigger1 = !(HitDefAttr = SCA, AT)
var(15) = 1

[State -1, Perfect Blizzard]
type = ChangeState
value = 3400
triggerAll = !var(58)||(var(58)&&sysfvar(4)=0)
triggerAll = !AILevel
triggerall = command = "PerfectBlizzard" 
triggerall = RoundState = 2 && StateType != A
triggerall = (power >= 3000 && var(20) <= 0 && var(53)<=0 && var(54)!=2) || (power >= 1000 && var(53) > 0) || (var(42) > 0)
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
trigger2 = var(7)

[State -1, I Love You Rusian!]
type = ChangeState
value = 3300
triggerAll = !var(58)||(var(58)&&sysfvar(4)=0)
triggerAll = !NumHelper(781) && !numhelper(2000)
triggerAll = !AILevel
triggerall = command = "RUSIAN" 
triggerall = RoundState = 2 && StateType != A
triggerall = (power >= 3000 && var(20) <= 0 && var(53)<=0 && var(54)!=2) || (power >= 1000 && var(53) > 0) || (var(42) > 0)
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
trigger2 = var(7)

[State -1, MAX Heal for me]
type = ChangeState
value = 3250
triggerAll = !var(58)||(var(58)&&sysfvar(4)=0)
triggerAll = life < lifemax
triggerAll = !AILevel
triggerAll = command = "MaxSuperHeal"
triggerAll = RoundState = 2 && StateType != A
triggerAll = (power >= 2000 && var(20) <= 60 && var(53)<=0 && var(54)!=2) || (power >= 500 && var(53) > 0) || (var(42) > 0)
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
trigger2 = var(7) || var(8) && var(22) < 1

[State -1, MAX Green Onion Sword]
type = ChangeState
value = 3150
triggerAll = !var(58)||(var(58)&&sysfvar(4)=0)
triggerAll = !AILevel
triggerAll = command = "MaxGOS"
triggerAll = RoundState = 2 && StateType != A
triggerAll = (power >= 2000 && var(20) <= 60 && var(53)<=0 && var(54)!=2) || (power >= 500 && var(53) > 0) || (var(42) > 0)
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
trigger2 = var(7) || var(8) && var(22) < 1

[State -1, MAX Air MeteorStrike]
type = ChangeState
value = 3075
triggerAll = !var(58)||(var(58)&&sysfvar(4)=0)
triggerAll = !AILevel
triggerAll = command = "MaxMeteorStrike"
triggerAll = RoundState = 2 && StateType = A
triggerAll = (power >= 2000 && var(20) <= 60 && var(53)<=0 && var(54)!=2) || (power >= 500 && var(53) > 0) || (var(42) > 0)
triggerAll = (var(3) != [1,2])
trigger1 = ctrl && pos y <= -40
trigger2 = var(7) || var(8) && var(22) < 1

[State -1, MAX Meteor Strike]
type = ChangeState
value = 3025
triggerAll = !var(58)||(var(58)&&sysfvar(4)=0)
triggerAll = !AILevel
triggerAll = command = "MaxMeteorStrike"
triggerAll = RoundState = 2 && StateType != A
triggerAll = (power >= 2000 && var(20) <= 60 && var(53)<=0 && var(54)!=2) || (power >= 500 && var(53) > 0) || (var(42) > 0)
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
trigger2 = var(7) || var(8) && var(22) < 1

[State -1, Heal for me]
type = ChangeState
value = 3200
triggerAll = !var(58)||(var(58)&&sysfvar(4)=0)
triggerAll = life < lifemax
triggerAll = !AILevel
triggerAll = command = "SuperHeal"
triggerAll = RoundState = 2 && StateType != A
triggerAll = (power >= 1000 && var(20) <= 60 && var(53)<=0 && var(54)!=2) || (var(53) > 0) || (var(42) > 0)
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
trigger2 = var(7) || (var(8) && var(22) < 2 && StateNo != [3200,3201])

[State -1, Green Onion Sword]
type = ChangeState
value = 3100
triggerAll = !var(58)||(var(58)&&sysfvar(4)=0)
triggerAll = !AILevel
triggerAll = command = "GOS"
triggerAll = RoundState = 2 && StateType != A
triggerAll = (power >= 1000 && var(20) <= 60 && var(53)<=0 && var(54)!=2) || (var(53) > 0) || (var(42) > 0)
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
trigger2 = var(7) || (var(8) && var(22) < 2 && StateNo != 3100)

[State -1, Air MeteorStrike]
type = ChangeState
value = 3050
triggerAll = !var(58)||(var(58)&&sysfvar(4)=0)
triggerAll = !AILevel
triggerAll = command = "MeteorStrike"
triggerAll = RoundState = 2 && StateType = A
triggerAll = (power >= 1000 && var(20) <= 60 && var(53)<=0 && var(54)!=2) || (var(53) > 0) || (var(42) > 0)
triggerAll = (var(3) != [1,2])
trigger1 = ctrl && pos y <= -40
trigger2 = var(7) || (var(8) && var(22) < 2 && StateNo != 3050)

[State -1, Meteor Strike]
type = ChangeState
value = 3000
triggerAll = !var(58)||(var(58)&&sysfvar(4)=0)
triggerall = !var(58)||(var(58)&&sysfvar(4)=0)
triggerAll = !AILevel
triggerAll = command = "MeteorStrike"
triggerAll = RoundState = 2 && StateType != A
triggerAll = (power >= 1000 && var(20) <= 60 && var(53)<=0 && var(54)!=2) || (var(53) > 0) || (var(42) > 0)
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
trigger2 = var(7) || (var(8) && var(22) < 2 && StateNo != 3000)

[State -1, EX Rolling Star]
type = ChangeState
value = 1150
triggerAll = !var(58)||(var(58)&&sysfvar(4)=0)
triggerAll = !AILevel
triggerAll = command = "EXTwinkleStar"
triggerAll = RoundState = 2 && StateType = A
triggerAll = (var(3) != [1,2]); && StateNo != 215
triggerAll = (power >= 500 && var(20) <= 60 && var(54) != 2) || var(53) > 0 || (power >= 500 && var(42) > 0)
trigger1 = ctrl
trigger2 = var(6)

[State -1, EX TwinkleStar]
type = ChangeState
value = 1250
triggerAll = !var(58)||(var(58)&&sysfvar(4)=0)
triggerAll = !AILevel
triggerAll = command = "EXTwinkleStar"
triggerAll = RoundState = 2 && StateType != A
triggerAll = (power >= 500 && var(20) <= 60 && var(54) != 2) || var(53) > 0 || (power >= 500 && var(42) > 0)
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
trigger2 = var(6)

[State -1, EX Lovely Shot]
type = ChangeState
value = 1350
triggerAll = !var(58)||(var(58)&&sysfvar(4)=0)
triggerAll = !AILevel
triggerAll = command = "EXLovelyShot"
triggerAll = RoundState = 2 && StateType != A
triggerAll = (power >= 500 && var(20) <= 60 && var(54) != 2) || var(53) > 0 || (power >= 500 && var(42) > 0)
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
trigger2 = var(6)

[State -1, EX Air Magic Scroll]
type = ChangeState
value = 1075
triggerAll = !var(58)||(var(58)&&sysfvar(4)=0)
triggerAll = (!var(39)||var(20))
triggerAll = !AILevel
triggerAll = command = "EXMagic"
triggerAll = RoundState = 2 && StateType = A
triggerAll = (var(3) != [1,2]); && StateNo != 215
triggerAll = (power >= 500 && var(20) <= 60 && var(54) != 2) || var(53) > 0 || (power >= 500 && var(42) > 0)
trigger1 = ctrl
trigger2 = var(6)

[State -1, EX Magic Scroll]
type = ChangeState
value = 1025
triggerAll = !var(58)||(var(58)&&sysfvar(4)=0)
triggerAll = (!var(39)||var(20))
triggerAll = !AILevel
triggerAll = command = "EXMagic"
triggerAll = RoundState = 2 && StateType != A
triggerAll = (power >= 500 && var(20) <= 60 && var(54) != 2) || var(53) > 0 || (power >= 500 && var(42) > 0)
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
trigger2 = var(6)

[State -1, EX Heal for Rusian]
type = ChangeState
value = 1550
triggerAll = !var(58)||(var(58)&&sysfvar(4)=0)
triggerAll = NumHelper(781) && !numhelper(2000)
triggerAll = !AILevel
triggerAll = command = "EXSupport"
triggerAll = RoundState = 2 && StateType != A
triggerAll = (power >= 500 && var(20) <= 60 && var(54) != 2) || var(53) > 0 || (power >= 500 && var(42) > 0)
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
;trigger2 = var(6)

[State -1, EX Support]
type = ChangeState
value = 1450
triggerAll = !var(58)||(var(58)&&sysfvar(4)=0)
triggerAll = !NumHelper(781) && !numhelper(2000)
triggerAll = !AILevel
triggerAll = command = "EXSupport"
triggerAll = RoundState = 2 && StateType != A
triggerAll = (power >= 500 && var(20) <= 60 && var(54) != 2) || var(53) > 0 || (power >= 500 && var(42) > 0)
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
;trigger2 = var(6)

[State -1, Rolling Star]
type = ChangeState
value = 1100
triggerAll = !var(58)||(var(58)&&sysfvar(4)=0)
triggerAll = !AILevel
triggerAll = (command = "TwinkleStar")
triggerAll = RoundState = 2 && StateType = A
triggerAll = (var(3) != [1,2])
trigger1 = ctrl
trigger2 = var(6)

[State -1, Twinkle Star]
type = ChangeState
value = 1200
triggerAll = !var(58)||(var(58)&&sysfvar(4)=0)
triggerAll = !AILevel
triggerAll = command = "TwinkleStar"
triggerAll = RoundState = 2 && StateType != A
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
trigger2 = var(6)

[State -1, Lovely Shot]
type = ChangeState
value = 1300
triggerAll = !var(58)||(var(58)&&sysfvar(4)=0)
triggerAll = !AILevel
triggerAll = command = "LovelyShot"
triggerAll = RoundState = 2 && StateType != A
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
trigger2 = var(6)

[State -1, Air Magic Scroll]
type = ChangeState
value = 1050
triggerAll = !var(58)||(var(58)&&sysfvar(4)=0)
triggerAll = (!var(39)||var(20))
triggerAll = !AILevel
triggerAll = (command = "Magic")
triggerAll = RoundState = 2 && StateType = A
triggerAll = (var(3) != [1,2])
trigger1 = ctrl
trigger2 = var(6)

[State -1, Magic Scroll]
type = ChangeState
value = 1000
triggerAll = !var(58)||(var(58)&&sysfvar(4)=0)
triggerAll = (!var(39)||var(20))
triggerAll = !AILevel
triggerAll = command = "Magic"
triggerAll = RoundState = 2 && StateType != A
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
trigger2 = var(6)

[State -1, Heal]
type = ChangeState
value = 1500
triggerAll = !var(58)||(var(58)&&sysfvar(4)=0)
triggerAll = NumHelper(781) && !numhelper(2000)
triggerAll = !AILevel
triggerAll = command = "Support"
triggerAll = RoundState = 2 && StateType != A
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
;trigger2 = var(6)

[State -1, Support]
type = ChangeState
value = 1400
triggerAll = !var(58)||(var(58)&&sysfvar(4)=0)
triggerAll = !NumHelper(781) && !numhelper(2000)
triggerAll = !AILevel
triggerAll = command = "Support"
triggerAll = RoundState = 2 && StateType != A
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
;trigger2 = var(6)

[State -1, Zero Counter]
type = ChangeState
value = 750
triggerAll = !AILevel
trigger1 = (StateNo = 150 || StateNo = 152) && var(52) = -1
trigger1 = command = "holdfwd" && command = "pp"
trigger1 = RoundState = 2 && StateType != A
trigger1 = power >= 1000 && !var(20) && !var(53) && (var(54) != 2 || var(42) && power >= 3000)

[State -1, Guard Cancel Roll]
type = ChangeState
value = 740
triggerAll = !AILevel
trigger1 = (StateNo = 150 || StateNo = 152) && var(52) = -1
trigger1 = (command = "holdfwd" || command = "holdback") && command = "a"
trigger1 = RoundState = 2 && StateType != A
trigger1 = power >= 1000 && !var(20) && !var(53) && (var(54) != 2 || var(42) && power >= 3000)

[State -1, Rage Explosion]
type = ChangeState
value = 790
triggerAll = !AILevel
triggerall = (command = "c"&&var(54)=2)
triggerall = RoundState = 2 && StateType != A
triggerall = var(53) <= 0 && Power >= 3000 && !var(42)
trigger1 = ctrl || (Stateno = [100,101])

[State -1, MAX Mode]
type = ChangeState
value = 770
triggerAll = !AILevel
triggerall = (command = "c"&&var(54)=1)||(command = "holddown"&&command = "c"&&var(54)>=3)
triggerall = RoundState = 2 && StateType != A
triggerall = var(53) <= 0 && Power >= 1000 && !var(20)
trigger1 = ctrl || (Stateno = [100,101])

[State -1, Custom Combo]
type = ChangeState
value = ifElse(StateType = A, 905, 900)
triggerAll = !AILevel
trigger1 = command = "c"&&(!var(54)||var(54)>=3)
trigger1 = RoundState = 2
trigger1 = power >= 1000 && !var(20) && !var(53)
trigger1 = ctrl || StateNo = 52 || (StateNo = [100,101])
trigger1 = !var(41)

[State -1, Power Charging]
type = ChangeState
value = 730
triggerAll = !var(58)||(var(58)&&sysfvar(4)=0)
triggerAll = !AILevel
trigger1 = command = "holdb"
trigger1 = RoundState = 2 && StateType != A
trigger1 = power < const(data.power) && power < PowerMax && !var(20) && !var(53) && (var(54) != 2 || var(42))
trigger1 = ctrl || (StateNo = [100,101])

[State -1, Roll Forward]
type = ChangeState
value = 710
triggerAll = !AILevel
triggerAll = command = "a" && !(command = "y" || command = "z")
triggerAll = RoundState = 2 && StateType != A
trigger1 = (ctrl || (StateNo = [100,101])) && command = "holdfwd"

[State -1, Roll Backward]
type = ChangeState
value = 715
triggerAll = !AILevel
triggerAll = command = "a" && !(command = "y" || command = "z")
triggerAll = RoundState = 2 && StateType != A
trigger1 = (ctrl || (StateNo = [100,101])) && command = "holdback"

[State -1, Dodge]
type = ChangeState
value = 700
triggerAll = !AILevel
triggerAll = command = "a" && !(command = "y" || command = "z")
triggerAll = RoundState = 2 && StateType != A
trigger1 = (ctrl || (StateNo = [100,101]))

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
triggerAll = !var(58)||(var(58)&&sysfvar(4)=0)
triggerAll = !AILevel
trigger1 = (command = "holdfwd" || command = "holdback") && command = "pp" 
trigger1 = RoundState = 2 && StateType = S
trigger1 = ctrl

[State -1, Standing Heavy Attack]
type = ChangeState
value = 220 
triggerAll = !var(58)||(var(58)&&sysfvar(4)=0)
triggerAll = !AILevel
triggerAll = command != "holddown" && command = "z"
triggerAll = StateType != A
trigger1 = ctrl || (StateNo = [100,101])
trigger2 = var(4)
trigger3 = ((StateNo = [200,210]) || (StateNo = [400,415])) && MoveContact && Var(55)

[State -1, Standing Medium Attack]
type = ChangeState
value = 210
triggerAll = !var(58)||(var(58)&&sysfvar(4)=0)
triggerAll = !AILevel
triggerAll = command != "holddown" && command = "y"
triggerAll = StateType != A
trigger1 = ctrl || (StateNo = [100,101])
trigger2 = var(4)
trigger3 = (StateNo = 200 || StateNo = 400) && MoveContact && Var(55)

[State -1, Standing Light Attack]
type = ChangeState
value = 200 
triggerAll = !var(58)||(var(58)&&sysfvar(4)=0)
triggerAll = !AILevel
triggerAll = command != "holddown" && command = "x"
triggerAll = StateType != A
trigger1 = ctrl || (StateNo = [100,101])
trigger1 = 1||(var(12):=0)
trigger2 = var(4)
trigger2 = 1||(var(12):=var(12)+1)
trigger3 = (StateNo = 200 || StateNo = 400) && MoveContact && var(12) < 2
trigger3 = 1||(var(12):=var(12)+1)

[State -1, Crouching Heavy Attack]
type = ChangeState
value = 420
triggerAll = !var(58)||(var(58)&&sysfvar(4)=0)
triggerAll = !AILevel
triggerAll = command = "holddown" && command = "z"
triggerAll = StateType != A
trigger1 = ctrl || (StateNo = [100,101])
trigger2 = var(4)
trigger3 = ((StateNo = [200,210]) || (StateNo = [400,415])) && MoveContact && Var(55)

[State -1, Crouching Medium Attack]
type = ChangeState
value = 410
triggerAll = !var(58)||(var(58)&&sysfvar(4)=0)
triggerAll = !AILevel
triggerAll = command  ="holddown" && command = "y"
triggerAll = StateType != A
trigger1 = ctrl || (StateNo = [100,101])
trigger2 = var(4)
trigger3 = (StateNo = 200 || StateNo = 400) && MoveContact && Var(55)

[State -1, Crouching Light Attack]
type = ChangeState
value = 400
triggerAll = !var(58)||(var(58)&&sysfvar(4)=0)
triggerAll = !AILevel
triggerAll = command = "holddown" && command = "x"
triggerAll = StateType != A
trigger1 = ctrl || (StateNo = [100,101])
trigger1 = 1||(var(12):=0)
trigger2 = var(4)
trigger2 = 1||(var(12):=var(12)+1)
trigger3 = (StateNo = 200 || StateNo = 400) && MoveContact && var(12) < 2
trigger3 = 1||(var(12):=var(12)+1)

[State -1, Jumping Heavy Attack]
type = ChangeState
value = 620
triggerAll = !var(58)||(var(58)&&sysfvar(4)=0)
triggerAll = !AILevel
triggerAll = command = "z"
triggerAll = StateType = A
trigger1 = ctrl
trigger2 = var(4)

[State -1, Jumping Medium Attack]
type = ChangeState
value = 610
triggerAll = !var(58)||(var(58)&&sysfvar(4)=0)
triggerAll = !AILevel
triggerAll = command = "y"
triggerAll = StateType = A
trigger1 = ctrl
trigger2 = var(4)

[State -1, Jumping Light Attack]
type = ChangeState
value = 600
triggerAll = !var(58)||(var(58)&&sysfvar(4)=0)
triggerAll = !AILevel
triggerAll = command = "x"
triggerAll = StateType = A
trigger1 = ctrl
trigger2 = var(4)

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
trigger1 = Random < (50 * (var(59) ** 2 / 64.0))
trigger1 = (ctrl || (StateNo = [100,101])) && var(20) <= 164 && !var(26)
trigger1 = (EnemyNear, MoveType = A) && !(EnemyNear, HitDefAttr = SCA, AT) && (P2BodyDist x = [92,122])

[State -1, Dodge]
type = ChangeState
value = 700
trigger1 = AILevel && NumEnemy
trigger1 = RoundState = 2 && StateType != A
trigger1 = Random < (50 * (var(59) ** 2 / 64.0))
trigger1 = (ctrl || (StateNo = [100,101])) && var(20) <= 164 && !var(26)
trigger1 = (EnemyNear, MoveType = A) && !(EnemyNear, HitDefAttr = SCA, AT) && (P2BodyDist x = [0,60])

[State -1, Dodge]
type = ChangeState
value = 700
triggerall = AIlevel && numenemy
triggerall = (facing=1 && (enemy,facing=-1)) || (facing=-1 && (enemy,facing=1))
triggerall = (ctrl || StateNo = 52 || (StateNo = [100,101])) && Random < (145 * (var(59) ** 2 / 64.0))
triggerall = roundstate=2  && statetype != A
trigger1 = enemynear,movetype=A && (p2bodydist x=[0,40])&&(p2bodydist y=[0,0])
trigger2 = ((enemynear,numproj) || (enemynear,numhelper)) && inguarddist && p2bodydist x>=25 
trigger3 = RoundState = 2 && InGuardDist
trigger3 = ctrl && (StateNo != [120, 155]) && !var(20)
trigger3 = !var(26) || P2BodyDist x >= 40
trigger3 = !(EnemyNear, HitDefAttr = SCA, AT) && (EnemyNear, Time < 120)
trigger3 = StateType != A || P2StateType = A
trigger3 = ifElse(StateType = A, ((var(3) != [1, 2]) || StateNo = 5210), 1)
trigger3 = Random <  (ifElse((P2StateNo = [200, 699]), 125, ifElse((P2StateNo = [1000,2999]), 333, 1000)) * (var(59) ** 2 / 64.0))

[State -1, Dash Backward]
type = ChangeState
value = 105
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType = S
triggerAll = ctrl && (StateNo != [100,106]) && var(20) <= 150 && !var(26)
trigger1 = (EnemyNear, MoveType = A) && BackEdgeDist >= 80 && (P2BodyDist x = [80,120]) && (EnemyNear, vel x)
trigger1 = Random < (ifElse((EnemyNear, HitDefAttr = SC, AT), 150, 50) * (var(59) ** 2 / 64.0))
trigger2 = (P2BodyDist x = [0,80]) && BackEdgeBodyDist >= 80
trigger2 = EnemyNear, StateNo = 5120 && EnemyNear, AnimTime = -4 && Random < (750 * (var(59) ** 2 / 64.0))

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
trigger1 = Random < (ifElse((P2StateNo = [200, 699]), 100, ifElse((P2StateNo = [1000,2999]), 333, 1000)) * (var(59) ** 2 / 64.0))

[State -1, AI Custom Combo]
type = ChangeState
value = 900
triggerall = AILevel && power >= 1000 && !var(20) && roundstate = 2 && statetype != A && numenemy && (!var(54)||var(54)>=3)
triggerall = p2statetype != A && p2statetype != L && p2movetype = A && (p2stateno = [0,499])
triggerall = numenemy = 1 || (numenemy = 2 && ((enemy, alive = 0) || (enemy(numenemy = 2), alive = 0))) || (numenemy = 2 && (((enemy, facing = 1) && (enemy(numenemy = 2), facing = 1)) || ((enemy, facing = -1) && (enemy(numenemy = 2), facing = -1))))
triggerall = (ctrl || stateno = 21 || stateno = 22 || stateno = 52 || stateno = 100 || ((Stateno = [120,131]) && movetype != H)) && random < (150 * (var(59) ** 2 / 64.0))
trigger1 = (p2bodydist x = [51,80]) && power >= 1000
trigger2 = (p2bodydist x = [0,80]) && power >= 2000

[State -1, MAX Mode]
type = ChangeState
value = 770
triggerall = AILevel && NumEnemy
triggerall = (var(54) = 1 || var(54) >= 3) && var(59) >= 4
triggerall = RoundState = 2 && StateType != A
triggerall = var(53) <= 0 && Power >= 1000 && !var(20)
triggerall = ctrl || (Stateno = [100,101])
triggerall = p2movetype !=A
triggerall = enemynear, vel x <= 0
trigger1 = random < ifelse(var(59) < 7,(50 * (var(59) ** 2 / 64.0)),(200 * (var(59) ** 2 / 64.0)))
trigger1 = power > 1000
trigger1 = p2statetype = L && p2dist x > 120
trigger2 = power > 2000
trigger2 = p2dist x > 140
trigger2 = random < ifelse(var(59) < 7,(50 * (var(59) ** 2 / 64.0)),(900 * (var(59) ** 2 / 64.0)))
trigger3 = p2dist x > 120
trigger3 = prevstateno = 731
trigger3 = power = 3000

[State -1, Zero Counter]
type = ChangeState
value = 750
trigger1 = AILevel && NumEnemy
trigger1 = (StateNo = 150 || StateNo = 152) && var(52) = -1
trigger1 = RoundState = 2 && StateType != A
trigger1 = Power >= 1000 && !var(20) && !var(53) && (var(54) != 2 || var(42) && Power >= 3000)
trigger1 = Random < (25 * (var(59) ** 2 / 64.0))
trigger1 = (P2BodyDist x = [0,50]) && (Life < 0.5 * LifeMax)

[State -1, Guard Cancel Roll]
type = ChangeState
value = 740
trigger1 = AILevel && NumEnemy
trigger1 = stateno = 150 || stateno = 152
trigger1 = roundstate = 2 && statetype != A
trigger1 = power >= 1000 && !var(20) && !var(53) && (var(54) != 2 || var(42) && Power >= 3000)
trigger1 = (p2bodydist x = [0,50]) && (life < 0.5 * lifemax)
trigger1 = enemynear, animtime = [-45,-30]
trigger1 = random < (power / 10.0)
trigger1 = random < (50 * (var(59) ** 2.0 / 64.0))

[State -1, Power Charge]
type = ChangeState
value = 730
triggerAll = !var(58)||(var(58)&&sysfvar(4)=0)
triggerAll = AILevel && NumEnemy
trigger1 = RoundState = 2 && StateType != A
trigger1 = Power < const(data.power) && !var(20) && !var(53) && (var(54) != 2 || var(42))
trigger1 = ctrl && Power < const(data.power) && Power < PowerMax && !var(20) && PrevStateNo != 5120
trigger1 = !InGuardDist && P2BodyDist x >= 160 && Random < (50 * (var(59) ** 2 / 64.0))

[State -1, Throw]
type = ChangeState
value = 800
triggerAll = !var(58)||(var(58)&&sysfvar(4)=0)
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType = S
triggerAll = P2StateType != A && P2StateType != L && P2MoveType != H
triggerAll = (P2BodyDist x = [-20,40]) && P2BodyDist y = 0
trigger1 = ctrl && Random < (125 * (var(59) ** 2 / 64.0))
trigger2 = ctrl && (P2StateNo = [120,140]) && Random < (250 * (var(59) ** 2 / 64.0))

[State -1, Run]
type = ChangeState
value = 100
trigger1 = AILevel && NumEnemy
trigger1 = RoundState = 2 && StateType = S
trigger1 = ctrl && (StateNo != [100,106])
trigger1 = (EnemyNear, MoveType != A) && P2BodyDist x >= 160 && Random < (25 * (var(59) ** 2 / 64.0))

[State -1, Standing Heavy Attack]
type = ChangeState
value = 220 
triggerAll = !var(58)||(var(58)&&sysfvar(4)=0)
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType != A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = (P2BodyDist x = [0,57]) && (P2Dist y = [-60,0]) && P2StateType != L
triggerAll = (EnemyNear, const(size.head.pos.y) <= -40) || (EnemyNear, StateType = A)
trigger1 = (ctrl || (StateNo = [100,101])) && Random < (25 * (var(59) ** 2 / 64.0))
trigger2 = (StateNo = [200,499]) && !AnimTime && ctrl
trigger2 = MoveHit && (EnemyNear, GetHitVar(HitTime) >= 3) && Random < (250 * (var(59) ** 2 / 64.0))

[State -1, Crouching Heavy Attack]
type = ChangeState
value = 420
triggerAll = !var(58)||(var(58)&&sysfvar(4)=0)
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType != A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = (P2BodyDist x = [0,78]) && (P2Dist y = [-33,0]) && P2StateType != A && P2StateType != L
triggerAll = (P2StateType = S || (P2StateType = C && P2MoveType = H))
trigger1 = (ctrl || (StateNo = [100,101])) && Random < (25 * (var(59) ** 2 / 64.0))
trigger2 = (StateNo = [200,499]) && !AnimTime && ctrl
trigger2 = MoveHit && (EnemyNear, GetHitVar(HitTime) >= 6) && Random < (250 * (var(59) ** 2 / 64.0))

[State -1, Jumping Heavy Attack]
type = ChangeState
value = 620
triggerAll = !var(58)||(var(58)&&sysfvar(4)=0)
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType = A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = (P2BodyDist x = [0,51]) && (P2Dist y = [-101,76]) && P2StateType = S
trigger1 = ctrl
trigger1 = vel y <= 0 && Random < (100 * (var(59) ** 2 / 64.0))
trigger2 = var(4) && Random < (50 * (var(59) ** 2 / 64.0))

[State -1, Standing Far/Close Medium Attack]
type = ChangeState
value = 210
triggerAll = !var(58)||(var(58)&&sysfvar(4)=0)
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType != A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = (P2BodyDist x = [0,35]) && (P2Dist y = [-60,0]) && P2StateType != L
triggerAll = (EnemyNear, const(size.head.pos.y) <= -40) || (EnemyNear, StateType = A)
trigger1 = (ctrl || (StateNo = [100,101])) && Random < (25 * (var(59) ** 2 / 64.0))
trigger2 = (StateNo = [200,499]) && !AnimTime && ctrl
trigger2 = MoveHit && (EnemyNear, GetHitVar(HitTime) >= 3) && Random < (250 * (var(59) ** 2 / 64.0))

[State -1, Crouching Medium Attack]
type = ChangeState
value = 410
triggerAll = !var(58)||(var(58)&&sysfvar(4)=0)
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType != A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = (P2BodyDist x = [0,52]) && (P2Dist y = [-50,0]) && P2StateType != L
triggerAll = (EnemyNear, const(size.head.pos.y) <= -40) || (EnemyNear, StateType = A)
trigger1 = (ctrl || (StateNo = [100,101])) && Random < (25 * (var(59) ** 2 / 64.0))
trigger2 = (StateNo = [200,499]) && !AnimTime && ctrl
trigger2 = MoveHit && (EnemyNear, GetHitVar(HitTime) >= 3) && Random < (250 * (var(59) ** 2 / 64.0))

[State -1, Jumping Medium Attack]
type = ChangeState
value = 610
triggerAll = !var(58)||(var(58)&&sysfvar(4)=0)
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType = A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = (P2BodyDist x = [0,40]) && (P2Dist y = [-80,72]) && P2StateType = S
trigger1 = ctrl
trigger1 = vel y > 0 && Random < (100 * (var(59) ** 2 / 64.0))

[State -1, Standing Light Attack]
type = ChangeState
value = 200 
triggerAll = !var(58)||(var(58)&&sysfvar(4)=0)
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType != A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = (P2BodyDist x = [0,44]) && (P2Dist y = [-68,0]) && P2StateType != C && P2StateType != L
triggerAll = (EnemyNear, const(size.head.pos.y) <= -40) || (EnemyNear, StateType = A)
trigger1 = (ctrl || (StateNo = [100,101])) && Random < (85 * (var(59) ** 2 / 64.0))
trigger2 = (StateNo = [200,499]) && !AnimTime && ctrl
trigger2 = MoveHit && (EnemyNear, GetHitVar(HitTime) >= 3) && Random < (250 * (var(59) ** 2 / 64.0))

[State -1, Crouching Light Attack]
type = ChangeState
value = 400
triggerAll = !var(58)||(var(58)&&sysfvar(4)=0)
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType != A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = (P2BodyDist x = [0,55]) && (P2Dist y = [-44,0]) && P2StateType != A && P2StateType != L
triggerAll = (EnemyNear, const(size.head.pos.y) <= -40) || (EnemyNear, StateType = A)
trigger1 = (ctrl || (StateNo = [100,101])) && Random < (25 * (var(59) ** 2 / 64.0))
trigger2 = (StateNo = [200,499]) && !AnimTime && ctrl
trigger2 = MoveHit && (EnemyNear, GetHitVar(HitTime) >= 2) && Random < (250 * (var(59) ** 2 / 64.0))

[State -1, Jumping Light Attack]
type = ChangeState
value = 600
triggerAll = !var(58)||(var(58)&&sysfvar(4)=0)
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType = A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = (P2BodyDist x = [0,40]) && (P2Dist y = [-51,60]) && P2StateType = S
trigger1 = ctrl
trigger1 = vel y > 0 && Random < (100 * (var(59) ** 2 / 64.0))

[State -1, Rolling Star]
type = ChangeState
value = ifElse(((var(53) <= 0 && Power >= 500 && var(54) != 2) || (var(53) > 0) || (var(42) > 0 && Power >= 500)) && Random < 50 && var(20) <= 600, 1150, 1100)
triggerAll = !var(58)||(var(58)&&sysfvar(4)=0)
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType = A
triggerAll = var(3) != [1,2]
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = P2StateType = A
triggerAll = (P2BodyDist x = [-8,160]) && P2Dist y >= -120
trigger1 = ctrl && Random < (50 * (var(59) ** 2 / 64.0))
trigger2 = var(6) && MoveHit && P2StateType = A

[State -1, Lovely Shot]
type = ChangeState
value = ifElse(((var(53) <= 0 && Power >= 500 && var(54) != 2) || (var(53) > 0) || (var(42) > 0 && Power >= 500)) && Random < 133 && var(20) <= 60, 1350, 1300)
triggerAll = !var(58)||(var(58)&&sysfvar(4)=0)
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType != A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = P2StateType != L && (P2Dist y = [-80,32])
triggerAll = ((P2BodyDist x = [-48,48]) && P2StateType != A) || ((P2BodyDist x = [-140,140]) && P2StateType = A)
trigger1 = (ctrl || StateNo = 52 || (StateNo = [100,101])) && Random < (25 * (var(59) ** 2 / 64.0))
trigger2 = var(6) && MoveHit && Random < (100 * (var(59) ** 2 / 64.0))
trigger2 = EnemyNear, GetHitVar(HitTime) >= 3
trigger3 = (StateNo = 5120 || StateNo = 5201) && !AnimTime && Random < (50 * (var(59) ** 2 / 64.0))

[State -1, Twinkle Star]
type = ChangeState
value = ifElse(((var(53) <= 0 && Power >= 500 && var(54) != 2) || (var(53) > 0) || (var(42) > 0 && Power >= 500)) && Random < 100 && var(20) <= 60, 1250, 1200)
triggerAll = !var(58)||(var(58)&&sysfvar(4)=0)
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType != A
triggerAll = (EnemyNear, MoveType != A) || (EnemyNear, StateNo = [200, 499])
triggerAll = (P2BodyDist x = [-8,165]) && P2StateType != A && (P2StateType != L || P2StateNo = 5120)
trigger1 = (ctrl || StateNo = 52 || (StateNo = [100,101]))
trigger1 = P2BodyDist x >= 15 && Random < (50 * (var(59) ** 2 / 64.0))
trigger2 = (ctrl || StateNo = 52 || (StateNo = [100,101]))
trigger2 = (EnemyNear, StateNo = 5120 || EnemyNear, StateNo = 5201) && (EnemyNear, AnimTime = -18) && Random < (250 * (var(59) ** 2 / 64.0))
trigger3 = var(6) && MoveHit && Random < (100 * (var(59) ** 2 / 64.0))
trigger3 = EnemyNear, GetHitVar(HitTime) >= 6

[State -1, Air Magic Scroll]
type = ChangeState
value = ifElse(((var(53) <= 0 && Power >= 500 && var(54) != 2) || (var(53) > 0) || (var(42) > 0 && Power >= 500)) && Random < 100 && var(20) <= 60, 1075, 1050)
triggerAll = !var(58)||(var(58)&&sysfvar(4)=0)
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType = A && pos y <= -40
triggerAll = !var(39)
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = P2BodyDist x >= 25 && P2Dist y >= -120 && EnemyNear, vel y >= 0
triggerAll = P2StateType != A || EnemyNear, vel x < 0
trigger1 = (ctrl || StateNo = 52 || (StateNo = [100,101])) && Random < (25 * (var(59) ** 2 / 64.0))
trigger2 = (ctrl || StateNo = 52 || (StateNo = [100,101]))
trigger2 = EnemyNear, StateNo = 195 && Random < (50 * (var(59) ** 2 / 64.0))

[State -1, Magic Scroll]
type = ChangeState
value = ifElse(((var(53) <= 0 && Power >= 500 && var(54) != 2) || (var(53) > 0) || (var(42) > 0 && Power >= 500)) && Random < 100 && var(20) <= 60, 1025, 1000)
triggerAll = !var(58)||(var(58)&&sysfvar(4)=0)
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType != A
triggerAll = !var(39)
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = P2BodyDist x >= 25 && P2Dist y >= -120 && EnemyNear, vel y >= 0
triggerAll = P2StateType != A || EnemyNear, vel x < 0
trigger1 = (ctrl || StateNo = 52 || (StateNo = [100,101])) && Random < (25 * (var(59) ** 2 / 64.0))
trigger2 = (ctrl || StateNo = 52 || (StateNo = [100,101]))
trigger2 = EnemyNear, StateNo = 195 && Random < (50 * (var(59) ** 2 / 64.0))

[State -1, Support EX]
type = ChangeState
value = 1450
triggerAll = !var(58)||(var(58)&&sysfvar(4)=0)
triggerAll = !NumHelper(781) && !numhelper(2000) && ((var(53) <= 0 && Power >= 500 && var(54) != 2) || (var(53) > 0) || (var(42) > 0 && Power >= 500)) && var(20) <= 60
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType != A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = P2BodyDist x >= 70 && P2Dist y >= -120 && EnemyNear, vel y >= 0
triggerAll = P2StateType != A || EnemyNear, vel x < 0
trigger1 = (ctrl || StateNo = 52 || (StateNo = [100,101])) && Random < (25 * (var(59) ** 2 / 64.0))
trigger2 = (ctrl || StateNo = 52 || (StateNo = [100,101]))
trigger2 = EnemyNear, StateNo = 195 && Random < (50 * (var(59) ** 2 / 64.0))

[State -1, Support Normal]
type = ChangeState
value = 1400
triggerAll = !var(58)||(var(58)&&sysfvar(4)=0)
triggerAll = !NumHelper(781) && !numhelper(2000)
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType != A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = (P2BodyDist x = [25,65]) && P2Dist y >= -120 && EnemyNear, vel y >= 0
triggerAll = P2StateType != A || EnemyNear, vel x < 0
trigger1 = (ctrl || StateNo = 52 || (StateNo = [100,101])) && Random < (25 * (var(59) ** 2 / 64.0))
trigger2 = (ctrl || StateNo = 52 || (StateNo = [100,101]))
trigger2 = EnemyNear, StateNo = 195 && Random < (50 * (var(59) ** 2 / 64.0))

[State -1, Perfect Blizzard]
type=ChangeState
value=3400
triggerall = !var(58)||(var(58)&&sysfvar(4)=0)
triggerall = AILevel && numenemy && RoundState=2 && (stateno!=[3200,3299]) && StateType != A
triggerall = ((var(53) <= 0 && Power >= 3000 && var(20) <= 0 && var(54) != 2) || (var(53) > 0 && Power >= 1000) || (var(42) > 0))
triggerall = (enemynear,statetype != L) &&(enemynear,stateno!=[5100,5220])&&(enemynear,stateno!=[120,155])&&(p2bodydist x =[40,160])&&(p2bodydist y=[-80,5])
triggerall = (enemynear,Statetype!=A) && (enemynear,Statetype!=C)
trigger1 = ctrl || StateNo=40 || StateNo=52 || (StateNo=[100,101]) && Random < (100 * (var(59) ** 2 / 64.0))
trigger2 = var(7) && MoveHit && Random < (ifElse((var(20) = [1,30]), 200, 50) * (var(59) ** 2 / 64.0))
trigger2 = EnemyNear, GetHitVar(HitTime) >= 4

[State -1, I Love You Rusian!]
type = ChangeState
value = 3300
triggerAll = !var(58)||(var(58)&&sysfvar(4)=0)
triggerAll = !NumHelper(781) && !numhelper(2000)
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType != A
triggerAll = ((var(53) <= 0 && Power >= 3000 && var(20) <= 0 && var(54) != 2) || (var(53) > 0 && Power >= 1000) || (var(42) > 0))
triggerAll = !var(16) && (var(15) < 1 || var(20) || (StateNo = [1000,4999]))
triggerAll = !(EnemyNear, ctrl) && (EnemyNear, StateNo != [120,155])
triggerAll = (P2BodyDist x = [0,75]) && (P2Dist y = [-60,0]) && P2StateType != L
trigger1 = (ctrl || StateNo = 52 || (StateNo = [100, 101])) && Random < (100 * (AILevel ** 2 / 64.0))
trigger2 = var(7) && MoveHit && Random < (ifElse((var(20) = [1,30]),200,50) * (AILevel ** 2 / 64.0))
trigger2 = EnemyNear, GetHitVar(HitTime) >= 4

[State -1, MAX Green Onion Sword]
type = ChangeState
value = 3150
triggerAll = !var(58)||(var(58)&&sysfvar(4)=0)
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType != A && (StateNo!= [3050,3060])
triggerAll = ((var(53) <= 0 && Power >= 2000 && var(20) <= 60 && var(54) != 2) || (var(53) > 0 && Power >= 500) || (var(42) > 0))
triggerAll = !var(16) && (var(15) < 1 || var(20) || (StateNo = [1000,4999]))
triggerAll = !(EnemyNear, ctrl) && ((EnemyNear, StateNo != [120,155]) || EnemyNear, StateType = A)
triggerAll = (P2BodyDist x = [-140,140]) && (P2Dist y = [-32,32])
triggerAll = P2StateType != A && P2StateType != L
trigger1 = (ctrl || StateNo = 52 || (StateNo = [100,101])) && Random < (100 * (var(59) ** 2 / 64.0))
trigger2 = var(7) && MoveHit && Random < (ifElse((var(20) = [1,30]), 200, 50) * (var(59) ** 2 / 64.0))
trigger2 = EnemyNear, GetHitVar(HitTime) >= 4

[State -1, Meteor Strike]
type=ChangeState
value=Ifelse(((var(53) <= 0 && Power >= 2000 && var(20) <= 60 && var(54) != 2) || (var(53) > 0 && Power >= 500) || (var(42) > 0))&&random<=500,3050,3000)
triggerAll = !var(58)||(var(58)&&sysfvar(4)=0)
triggerAll = (!var(39)||var(20))
triggerall = AILevel && numenemy && RoundState=2 && (stateno!=[3200,3299]) && StateType != A
triggerAll = ((var(53) <= 0 && Power >= 1000 && var(20) <= 60 && var(54) != 2) || (var(53) > 0) || (var(42) > 0))
triggerall = (enemynear,statetype != L) &&(enemynear,stateno!=[5100,5220])&&(enemynear,stateno!=[120,155])&&(p2bodydist x =[40,160])&&(p2bodydist y=[-80,5])
triggerall = (enemynear,Statetype!=A) && (enemynear,Statetype!=C)
trigger1 = ctrl || StateNo=40 || StateNo=52 || (StateNo=[100,101]) && Random < (100 * (var(59) ** 2 / 64.0))
trigger2 = var(7) && MoveHit && Random < (ifElse((var(20) = [1,30]), 200, 50) * (var(59) ** 2 / 64.0))
trigger2 = EnemyNear, GetHitVar(HitTime) >= 4

[State -1, Green Onion Sword]
type = ChangeState
value = 3100
triggerAll = !var(58)||(var(58)&&sysfvar(4)=0)
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType != A && StateNo!= 3000
triggerAll = ((var(53) <= 0 && Power >= 1000 && var(20) <= 60 && var(54) != 2) || (var(53) > 0) || (var(42) > 0))
triggerAll = !var(16) && (var(15) < 1 || var(20) || (StateNo = [1000,4999]))
triggerAll = !(EnemyNear, ctrl) && ((EnemyNear, StateNo != [120,155]) || EnemyNear, StateType = A)
triggerAll = (P2BodyDist x = [-100,100]) && (P2Dist y = [-32,32])
triggerAll = P2StateType != A && P2StateType != L && P2MoveType != A
trigger1 = (ctrl || StateNo = 52 || (StateNo = [100,101])) && Random < (100 * (var(59) ** 2 / 64.0))
trigger2 = var(7) && MoveHit && Random < (ifElse((var(20) = [1,30]), 200, 50) * (var(59) ** 2 / 64.0))
trigger2 = EnemyNear, GetHitVar(HitTime) >= 4
