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
name = "start"
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

;====================<SUPER MOTIONS>====================

[Command]
name = "SPACE"
command = ~D, DF, F, D, DF, F, a+x
time = 32

[Command]
name = "SPACE"
command = ~D, DF, F, D, DF, F, b+y
time = 32

[Command]
name = "SPACE"
command = ~D, DF, F, D, DF, F, c+z
time = 32

[Command]
name = "POWER"
command = ~D, DF, F, D, DF, F, x
time = 32

[Command]
name = "POWER"
command = ~D, DF, F, D, DF, F, y
time = 32

[Command]
name = "POWER"
command = ~D, DF, F, D, DF, F, z
time = 32

[Command]
name = "POWER"
command = ~D, DF, F, D, DF, F, ~x
time = 32

[Command]
name = "POWER"
command = ~D, DF, F, D, DF, F, ~y
time = 32

[Command]
name = "POWER"
command = ~D, DF, F, D, DF, F, ~z
time = 32


[Command]
name = "MAXPOWER"
command = ~D, DF, F, D, DF, F, x+y
time = 32

[Command]
name = "MAXPOWER"
command = ~D, DF, F, D, DF, F, y+z
time = 32

[Command]
name = "MAXPOWER"
command = ~D, DF, F, D, DF, F, x+z
time = 32


[Command]
name = "REALITY"
command = ~D, DF, F, D, DF, F, a
time = 32

[Command]
name = "REALITY"
command = ~D, DF, F, D, DF, F, b
time = 32

[Command]
name = "REALITY"
command = ~D, DF, F, D, DF, F, c
time = 32

[Command]
name = "REALITY"
command = ~D, DF, F, D, DF, F, ~a
time = 32

[Command]
name = "REALITY"
command = ~D, DF, F, D, DF, F, ~b
time = 32

[Command]
name = "REALITY"
command = ~D, DF, F, D, DF, F, ~c
time = 32


[Command]
name = "MAXREALITY"
command = ~D, DF, F, D, DF, F, a+b
time = 32

[Command]
name = "MAXREALITY"
command = ~D, DF, F, D, DF, F, b+c
time = 32

[Command]
name = "MAXREALITY"
command = ~D, DF, F, D, DF, F, a+c
time = 32


[Command]
name = "TIME"
command = ~D, DB, B, D, DB, B, x+y
time = 32

[Command]
name = "TIME"
command = ~D, DB, B, D, DB, B, y+z
time = 32

[Command]
name = "TIME"
command = ~D, DB, B, D, DB, B, a+z
time = 32




[Command]
name = "MAXBeserker Charge"
command = ~D, DB, B, D, DB, B, x+y
time = 32

[Command]
name = "MAXBeserker Charge"
command = ~D, DB, B, D, DB, B, y+z
time = 32

[Command]
name = "MAXBeserker Charge"
command = ~D, DB, B, D, DB, B, x+z
time = 32


[Command]
name = "SOUL"
command = ~D, DB, B, D, DB, B, a
time = 32

[Command]
name = "SOUL"
command = ~D, DB, B, D, DB, B, b
time = 32

[Command]
name = "SOUL"
command = ~D, DB, B, D, DB, B, c
time = 32

[Command]
name = "SOUL"
command = ~D, DB, B, D, DB, B, ~a
time = 32

[Command]
name = "SOUL"
command = ~D, DB, B, D, DB, B, ~b
time = 32

[Command]
name = "SOUL"
command = ~D, DB, B, D, DB, B, ~c
time = 32


[Command]
name = "MAXSOUL"
command = ~D, DB, B, D, DB, B, a+b
time = 32

[Command]
name = "MAXSOUL"
command = ~D, DB, B, D, DB, B, b+c
time = 32

[Command]
name = "MAXSOUL"
command = ~D, DB, B, D, DB, B, a+c
time = 32


[Command]
name = "MIND"
command = ~D, DB, B, D, DB, B, a+x
time = 32

[Command]
name = "MIND"
command = ~D, DB, B, D, DB, B, b+y
time = 32

[Command]
name = "MIND"
command = ~D, DB, B, D, DB, B, c+z
time = 32

;====================<SPECIAL MOTIONS>====================

[Command]
name = "Bubble Throw"
command = ~D, DF, F, a
time = 16

[Command]
name = "Bubble Throw"
command = ~D, DF, F, b
time = 16

[Command]
name = "Bubble Throw"
command = ~D, DF, F, c
time = 16

[Command]
name = "Bubble Throw"
command = ~D, DF, F, ~a
time = 16

[Command]
name = "Bubble Throw"
command = ~D, DF, F, ~b
time = 16

[Command]
name = "Bubble Throw"
command = ~D, DF, F, ~c
time = 16

[Command]
name = "Crouch MSH Hard Punch"
command = ~D, DF, F, x
time = 16

[Command]
name = "Crouch MSH Hard Punch"
command = ~D, DF, F, y
time = 16

[Command]
name = "Crouch MSH Hard Punch"
command = ~D, DF, F, z
time = 16

[Command]
name = "Crouch MSH Hard Punch"
command = ~D, DF, F, ~x
time = 16

[Command]
name = "Crouch MSH Hard Punch"
command = ~D, DF, F, ~y
time = 16

[Command]
name = "Crouch MSH Hard Punch"
command = ~D, DF, F, ~z
time = 16


[Command]
name = "EXCrouch MSH Hard Punch"
command = ~D, DF, F, x+y
time = 16

[Command]
name = "EXCrouch MSH Hard Punch"
command = ~D, DF, F, y+z
time = 16

[Command]
name = "EXCrouch MSH Hard Punch"
command = ~D, DF, F, x+z
time = 16

[Command]
name = "EXBubble Throw"
command = ~D, DF, F, a+b
time = 16

[Command]
name = "EXBubble Throw"
command = ~D, DF, F, b+c
time = 16

[Command]
name = "EXBubble Throw"
command = ~D, DF, F, a+c
time = 16

[Command]
name = "Spear Dash L"
command = ~D, DB, B, a
time = 16

[Command]
name = "Spear Dash L"
command = ~D, DB, B, b
time = 16

[Command]
name = "Spear Dash L"
command = ~D, DB, B, c
time = 16

[Command]
name = "Spear Dash L"
command = ~D, DB, B, ~a
time = 16

[Command]
name = "Spear Dash L"
command = ~D, DB, B, ~b
time = 16

[Command]
name = "Spear Dash L"
command = ~D, DB, B, ~c
time = 16




[Command]
name = "Crouch Fire Twerk"
command = ~D, DB, B, x
time = 16

[Command]
name = "Crouch Fire Twerk"
command = ~D, DB, B, y
time = 16

[Command]
name = "Crouch Fire Twerk"
command = ~D, DB, B, z
time = 16

[Command]
name = "Crouch Fire Twerk"
command = ~D, DB, B, ~x
time = 16

[Command]
name = "Crouch Fire Twerk"
command = ~D, DB, B, ~y
time = 16

[Command]
name = "Crouch Fire Twerk"
command = ~D, DB, B, ~z
time = 16


[Command]
name = "EXCrouch Fire Twerk"
command = ~D, DB, B, x+y
time = 16

[Command]
name = "EXCrouch Fire Twerk"
command = ~D, DB, B, y+z
time = 16

[Command]
name = "EXCrouch Fire Twerk"
command = ~D, DB, B, x+z
time = 16

[Command]
name = "EXSpear Dash L"
command = ~D, DB, B, a+b
time = 16

[Command]
name = "EXSpear Dash L"
command = ~D, DB, B, b+c
time = 16

[Command]
name = "EXSpear Dash L"
command = ~D, DB, B, a+c
time = 16





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
triggerAll = !ctrl
trigger1 = (StateNo = 52 || StateNo = 101 || StateNo = 5120) && !AnimTime
trigger2 = (StateNo = [200,499]) && !AnimTime
trigger3 = ((StateNo = [760,762]) || (StateNo = [700,715]) || (StateNo = [900,905])) && !AnimTime
trigger4 = (StateNo = 5001 || StateNo = 5011 || StateNo = 151 || StateNo = 153) && HitOver
value = 1

[State -1, SPACE]
type = ChangeState;Null;
value = 3350
triggerAll = !AILevel
triggerAll = command = "SPACE"
triggerAll = RoundState = 2 && StateType != A
triggerAll = power >= 3000 && !var(20) && !var(14)
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
trigger2 = var(7)

[State -1, MIND]
type = ChangeState;Null;
value = 3300
triggerAll = !AILevel
triggerAll = command = "MIND"
triggerAll = RoundState = 2 && StateType != A
triggerAll = power >= 3000 && !var(20) && !var(14)
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
trigger2 = var(7)



[State -1, MAXSOUL]
type = ChangeState
value = 3550
triggerAll = !AILevel
triggerAll = command = "MAXSOUL"
triggerAll = RoundState = 2 && StateType != A
triggerAll = power >= 2000 && !var(20) && !var(14)
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
trigger2 = var(7)


[State -1, MAXREALITY]
type = ChangeState
value = 3250
triggerAll = !AILevel
triggerAll = command = "MAXREALITY"
triggerAll = RoundState = 2 && StateType != A
triggerAll = power >= 2000 && var(20) <= 60
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
trigger2 = var(7) || var(8)



[State -1, TIME]
type = ChangeState
value = 3100
triggerAll = !AILevel
triggerAll = command = "TIME"
triggerAll = RoundState = 2 && StateType != A
triggerAll = power >= 2000 && !var(20) && !var(14)
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
trigger2 = var(7)



[State -1, MAXPOWER]
type = ChangeState
value = 3050
triggerAll = !AILevel
triggerAll = command = "MAXPOWER"
triggerAll = RoundState = 2 && StateType != A
triggerAll = power >= 2000 && var(20) <= 60
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
trigger2 = var(7) || var(8)



[State -1, SOUL]
type = ChangeState
value = 3500
triggerAll = !AILevel
triggerAll = command = "SOUL"
triggerAll = RoundState = 2 && StateType != A
triggerAll = power >= 1000 && !var(20) && !var(14)
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
trigger2 = var(7)



[State -1, REALITY]
type = ChangeState
value = 3200
triggerAll = !AILevel
triggerAll = command = "REALITY"
triggerAll = RoundState = 2 && StateType != A
triggerAll = power >= 1000 && var(20) <= 60
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
trigger2 = var(7)



[State -1, POWER]
type = ChangeState
value = 3000
triggerAll = !AILevel
triggerAll = command = "POWER"
triggerAll = RoundState = 2 && StateType != A
triggerAll = power >= 1000 && var(20) <= 60
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
trigger2 = var(7)

[State -1, EXSpear Dash L]
type = ChangeState
value = 1350
triggerAll = !AILevel
triggerAll = command = "EXSpear Dash L"
triggerAll = RoundState = 2 && StateType != A
triggerAll = power >= 500 && var(20) <= 60 && !var(14)
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
trigger2 = var(6)

[State -1, EXCrouch Fire Twerk]
type = ChangeState
value = 1250
triggerAll = !AILevel
triggerAll = command = "EXCrouch Fire Twerk"
triggerAll = RoundState = 2 && StateType != A
triggerAll = power >= 500 && var(20) <= 60 && !var(14)
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
trigger2 = var(6)

[State -1, EXBubble Throw]
type = ChangeState
value = 1150
triggerAll = !AILevel
triggerAll = command = "EXBubble Throw"
triggerAll = RoundState = 2 && StateType != A
triggerAll = power >= 500 && var(20) <= 60 && !var(14)
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
trigger2 = var(6)


[State -1, EXCrouch MSH Hard Punch]
type = ChangeState
value = 1050
triggerAll = !AILevel
triggerAll = command = "EXCrouch MSH Hard Punch"
triggerAll = RoundState = 2 && StateType != A
triggerAll = power >= 500 && var(20) <= 60 && !var(14)
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
trigger2 = var(6)

[State -1, Spear Dash L]
type = ChangeState
value = 1300
triggerAll = !AILevel
triggerAll = command = "Spear Dash L"
triggerAll = RoundState = 2 && StateType != A
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
trigger2 = var(6)


[State -1, Crouch Fire Twerk]
type = ChangeState
value = 1200
triggerAll = !AILevel
triggerAll = command = "Crouch Fire Twerk"
triggerAll = RoundState = 2 && StateType != A
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
trigger2 = var(6)

[State -1, Bubble Throw]
type = ChangeState
value = 1100
triggerAll = !AILevel
triggerAll = command = "Bubble Throw"
triggerAll = RoundState = 2 && StateType != A
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
trigger2 = var(6)


[State -1, Crouch MSH Hard Punch]
type = ChangeState
value = 1000
triggerAll = !AILevel
triggerAll = command = "Crouch MSH Hard Punch"
triggerAll = RoundState = 2 && StateType != A
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
trigger2 = var(6)

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

[State -1, Custom Combo]
type = ChangeState
value = ifElse(StateType = A, 905, 900)
triggerAll = !AILevel
trigger1 = command = "c+z"
trigger1 = RoundState = 2
trigger1 = power >= 1000 && !var(20) && !var(14)
trigger1 = ctrl || StateNo = 52 || (StateNo = [100,101])

[State -1, Throw]
type = ChangeState
value = 800
triggerAll = !AILevel
trigger1 = (command = "holdfwd" || command = "holdback") && (command = "kk" || command = "kk")
trigger1 = RoundState = 2 && StateType = S
trigger1 = ctrl

[State -1, Throw]
type = ChangeState
value = 830
triggerAll = !AILevel
trigger1 = (command = "holdfwd" || command = "holdback") && (command = "pp" || command = "pp")
trigger1 = RoundState = 2 && StateType = S
trigger1 = ctrl


[State -1, Zero Counter]
type = ChangeState
value = 750
triggerAll = !AILevel
trigger1 = StateNo = 150 || StateNo = 152
trigger1 = command = "412p" || command = "412k"
trigger1 = RoundState = 2 && StateType != A
trigger1 = power >= 1000 && !var(20)

[State -1, Power Charge]
type = ChangeState
value = 730
triggerAll = !AILevel
trigger1 = command = "holdb" && command = "holdy"
trigger1 = RoundState = 2 && StateType != A
trigger1 = power < const(data.power) && power < PowerMax && !var(20) && !var(14)
trigger1 = ctrl || (StateNo = [100,101])

[State -1, Standing Light Punch]
type = ChangeState
value = 200
triggerAll = !AILevel
triggerAll = command != "holddown" && command = "x"
triggerAll = StateType != A
trigger1 = ctrl || (StateNo = [100,101])
trigger2 = var(4)

[State -1, Standing Medium Punch]
type = ChangeState
value = 210
triggerAll = !AILevel
triggerAll = command != "holddown" && command = "y"
triggerAll = StateType != A
trigger1 = ctrl || (StateNo = [100,101])
trigger2 = ((StateNo = [200,209]) || (StateNo = [230,239]) ||(StateNo = [400,409])||(StateNo =[430,439])) && MoveContact
trigger3 = var(4)

[State -1, Standing Medium Punch]
type = ChangeState
value = 215
triggerAll = !AILevel
triggerAll = command != "holddown" && command = "y"
triggerAll = StateType != A
trigger1 = ctrl || (StateNo = [100,101])
trigger2 = StateNo = 210 && AnimElemTime(7) < 0

[State -1, Standing Heavy Punch]
type = ChangeState
value = 220
triggerAll = !AILevel
triggerAll = command != "holddown" && command = "z"
triggerAll = StateType != A
trigger1 = ctrl || (StateNo = [100,101])
trigger2 = ((StateNo = [200,219]) || (StateNo = [230,249]) || (StateNo = [400,419]) || (StateNo = [430,449])) && MoveContact
trigger3 = var(4)

[State -1, Standing Light Kick]
type = ChangeState
value = 230
triggerAll = !AILevel
triggerAll = command != "holddown" && command = "a"
triggerAll = StateType != A
trigger1 = ctrl || (StateNo = [100,101])
trigger2 = (StateNo = [200,209]) && MoveContact
trigger3 = var(4)

[State -1, Standing Medium Kick]
type = ChangeState
value = 240 + (command = "holdfwd") * 5
triggerAll = !AILevel
triggerAll = command != "holddown" && command = "b"
triggerAll = StateType != A
trigger1 = ctrl || (StateNo = [100,101])
trigger2 = ((StateNo = [200,219]) || (StateNo = [230,239]) || (StateNo = [400,419]) || (StateNo = [430,439])) && MoveContact
trigger3 = var(4)

[State -1, Standing Heavy Kick]
type = ChangeState
value = 250
triggerAll = !AILevel
triggerAll = command != "holddown" && command = "c"
triggerAll = StateType != A
trigger1 = ctrl || (StateNo = [100,101])
trigger2 = ((StateNo = [200,249]) || (StateNo = [400,449])) && MoveContact
trigger3 = var(4)

[State -1, Crouching Light Punch]
type = ChangeState
value = 400
triggerAll = !AILevel
triggerAll = command = "holddown" && command = "x"
triggerAll = StateType != A
trigger1 = ctrl || (StateNo = [100,101])
trigger2 = var(4)

[State -1, Crouching Medium Punch]
type = ChangeState
value = 410
triggerAll = !AILevel
triggerAll = command = "holddown" && command = "y"
triggerAll = StateType != A
trigger1 = ctrl || (StateNo = [100,101])
trigger2 = ((StateNo = [200,209]) || (StateNo = [230,239]) ||(StateNo = [400,409])||(StateNo =[430,439])) && MoveContact
trigger3 = var(4)

[State -1, Crouching Heavy Punch]
type = ChangeState
value = 420 
triggerAll = !AILevel
triggerAll = command = "holddown" && command = "z"
triggerAll = StateType != A
trigger1 = ctrl || (StateNo = [100,101])
trigger2 = ((StateNo = [200,219]) || (StateNo = [230,249]) || (StateNo = [400,419]) || (StateNo = [430,449])) && MoveContact
trigger3 = var(4)

[State -1, Crouching Light Kick]
type = ChangeState
value = 430
triggerAll = !AILevel
triggerAll = command = "holddown" && command = "a"
triggerAll = StateType != A
trigger1 = ctrl || (StateNo = [100,101])
trigger2 = (StateNo = 200 || StateNo = 230) && (MoveContact && AnimElemTime(6) >= 0)
trigger3 = var(4)

[State -1, Crouching Medium Kick]
type = ChangeState
value = 440
triggerAll = !AILevel
triggerAll = command = "holddown" && command = "b"
triggerAll = StateType != A
trigger1 = ctrl || (StateNo = [100,101])
trigger2 = ((StateNo = [200,219]) || (StateNo = [230,239]) || (StateNo = [400,419]) || (StateNo = [430,439])) && MoveContact
trigger3 = var(4)

[State -1, Crouching Heavy Kick]
type = ChangeState
value = 450
triggerAll = !AILevel
triggerAll = command = "holddown" && command = "c"
triggerAll = StateType != A
trigger1 = ctrl || (StateNo = [100,101])
trigger2 = ((StateNo = [200,249]) || (StateNo = [400,449])) && MoveContact
trigger3 = var(4)

[State -1, Jumping Light Punch]
type = ChangeState
value = 600
triggerAll = !AILevel
triggerAll = command = "x"
triggerAll = StateType = A
trigger1 = ctrl
trigger2 = var(4)

[State -1, Jumping Medium Punch]
type = ChangeState
value = 610
triggerAll = !AILevel
triggerAll = command = "y"
triggerAll = StateType = A
trigger1 = ctrl
trigger2 = var(4)


[State -1, Jumping Heavy Punch]
type = ChangeState
value = 620
triggerAll = !AILevel
triggerAll = command = "z"
triggerAll = StateType = A
trigger1 = ctrl
trigger2 = var(4)

[State -1, Jumping Light Kick]
type = ChangeState
value = 630
triggerAll = !AILevel
triggerAll = command = "a"
triggerAll = StateType = A
trigger1 = ctrl
trigger2 = var(4)


[State -1, Jumping Dive Kick2]
type = ChangeState
value = 655
triggerAll = !AILevel
triggerAll = command = "holddown" && command = "c"
triggerAll = StateType = A
trigger1 = ctrl
trigger2 = var(4)

[State -1, Jumping Medium Kick]
type = ChangeState
value = 640
triggerAll = !AILevel
triggerAll = command = "b"
triggerAll = StateType = A
trigger1 = ctrl
trigger2 = var(4)

[State -1, Jumping Heavy Kick]
type = ChangeState
value = 650
triggerAll = !AILevel
triggerAll = command = "c"
triggerAll = StateType = A
trigger1 = ctrl
trigger2 = var(4)

[State -1, Taunt]
type = ChangeState
value = 195
triggerAll = !AILevel
triggerAll = command = "start"
triggerAll = StateType != A
triggerAll = StateNo != [200,699]
trigger1 = ctrl || (StateNo = [100,101])
trigger2 = var(4)

[State -1, Dash Forward/Run]
type = ChangeState
value = 110
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

[State -1, Wall Jump Forward]
type = ChangeState
value = 60
triggerAll = RoundState = 2 && StateType = A
trigger1 = command = "holdup" && command = "holdfwd"
trigger1 = BackEdgeBodyDist <= 0
trigger1 = vel x < 0 && pos y <= -92
trigger2 = command = "holdup" && command = "holdback"
trigger2 = FrontEdgeBodyDist <= 10
trigger2 = vel x > 0 && pos y <= -92
ctrl = 0

;==============================================================================================
;===========================================< A.I >==============================================
;==============================================================================================

[State -1, Fall Recovery (Air)]
type = ChangeState
value = 5210
TriggerAll = !var(45)
trigger1 = AILevel && NumEnemy
trigger1 = RoundState = 2 && Alive
trigger1 = StateNo = 5050 && CanRecover
trigger1 = vel y > 0 && pos y < -20
trigger1 = Random < (25 * (AILevel ** 2 / 64.0))

[State -1, Fall Recovery (Ground)]
type = ChangeState
value = 5200
TriggerAll = !var(45)
trigger1 = AILevel && NumEnemy
trigger1 = RoundState = 2 && Alive
trigger1 = StateNo = 5050 && GetHitVar(fall.recover)
trigger1 = vel y > 0 && pos y >= -20
trigger1 = Random < (100 * (AILevel ** 2 / 64.0))

[State -1, Idle]
type = changestate
value = 0
triggerall = AIlevel && numenemy&&roundstate = 2 && statetype != A && enemynear, movetype = A && (p2stateno=[5100,5220])
trigger1=ctrl

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

[State -1, Run]
type = ChangeState
value = 100
trigger1 = AILevel && NumEnemy
trigger1 = RoundState = 2 && StateType = S
trigger1 = ctrl && (StateNo != [100,106])
trigger1 = (EnemyNear, MoveType != A) && P2BodyDist x >= 160 && Random < (25 * (AILevel ** 2 / 64.0))

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

[state -1, AI Air Guard]
type = ChangeState
value = 132
triggerall = AIlevel && numenemy&& roundstate = 2&&InGuardDist
triggerall = ctrl&&statetype = A
trigger1 = enemynear,numproj
trigger2 = enemynear,HitDefAttr = SCA, NA,SA,HA
trigger2 = random <=ifelse(backedgedist<=10,950,800)

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

[State -1, Guard]
type = ChangeState
value = 120
triggerall= AILevel && numenemy&& (StateNo!=[120,155]) && !(enemynear,ctrl) && random < (450 * (AIlevel ** 2 / 64.0))
triggerall= Ctrl||stateno = 21
triggerall=enemynear,Movetype=A && !(enemynear,hitdefattr=SCA,AT) 
trigger1 = inguarddist

[State -1, Zero Counter]
type = ChangeState
value = 750
trigger1 = AILevel && NumEnemy
trigger1 = StateNo = 150 || StateNo = 152
trigger1 = RoundState = 2 && StateType != A
trigger1 = Power >= 1000 && var(20) <= 60
trigger1 = Random < (250 * (AILevel ** 2 / 64.0))
trigger1 = (P2BodyDist x = [0,50]) && (Life < 0.5 * LifeMax)

[State -1, Power Charge]
type = ChangeState
value = 730
triggerAll = AILevel && NumEnemy
triggerAll = !var(45)
trigger1 = RoundState = 2 && StateType != A
trigger1 = Power < const(data.power) && !var(20)
trigger1 = ctrl && Power < const(data.power) && Power < PowerMax && !var(20)
trigger1 = !InGuardDist && P2BodyDist x >= 160 && Random < (95 * (AILevel ** 2 / 64.0))

[State -1, Throw]
type = ChangeState
value = 800
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType = S
triggerAll = P2StateType != A && P2StateType != L && P2MoveType != H
triggerAll = (P2BodyDist x = [-23,37]) && P2BodyDist y = 0
trigger1 = ctrl && Random < (200 * (AIlevel ** 2 / 64.0))
trigger2 = ctrl && (P2StateNo = [120,140]) && Random < (325 * (AILevel ** 2 / 64.0))

[State -1, Throw]
type = ChangeState
value = 830
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType = S
triggerAll = P2StateType != A && P2StateType != L && P2MoveType != H
triggerAll = (P2BodyDist x = [-23,37]) && P2BodyDist y = 0
trigger1 = ctrl && Random < (200 * (AIlevel ** 2 / 64.0))
trigger2 = ctrl && (P2StateNo = [120,140]) && Random < (325 * (AILevel ** 2 / 64.0))

[State -1, Custom Combo]
type = ChangeState
value = ifElse(StateType = A, 905, 900)
trigger1 = AILevel && NumEnemy
trigger1 = RoundState = 2 && (StateType != A || (vel x > 0 && vel y >= 0))
trigger1 = Power >= 1000 && !var(20)
trigger1 = (ctrl || StateNo = 52 || (StateNo = [100, 101]))
trigger1 = (EnemyNear, MoveType = A) && (P2BodyDist x = [0,40]) && (P2Dist y = [-60,60]) && (EnemyNear, vel y >= 0)
trigger1 = (EnemyNear, StateNo = [200,699]) && Random < (50 * (AILevel ** 2 / 64.0))

[State -1, Standing Light Punch]
type = ChangeState
value = 200
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType != A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = (P2BodyDist x = [0,35]) && (P2Dist y = [-75,0]) && P2StateType != C && P2StateType != L
triggerAll = (EnemyNear, const(size.head.pos.y) <= -40) || (EnemyNear, StateType = A)
trigger1 = (ctrl || (StateNo = [100,101])) && Random < (100 * (AILevel ** 2 / 64.0))
trigger2 = (StateNo = [200, 499]) && !AnimTime && ctrl
trigger2 = MoveHit && (EnemyNear, GetHitVar(HitTime) >= 3) && Random < (250 * (AILevel ** 2 / 64.0))

[State -1, SLP Target Combo 1]
type = ChangeState
value = 200
trigger1 = AILevel
trigger1 = StateNo = 230 && AnimElemTime(5) < 0 && MoveContact

[State -1, SLP Target Combo 2]
type = ChangeState
value = 210
trigger1 = AILevel
trigger1 = StateNo = 200 && AnimElemTime(5) < 0 && MoveContact

[State -1, SLP Target Combo 3]
type = ChangeState
value = 230
trigger1 = AILevel
trigger1 = StateNo = 230 && AnimElemTime(5) < 0 && MoveContact

[State -1, Quarrel Punch/Standing Normal Medium Punch]
type = ChangeState
value = 210
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType != A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = (P2BodyDist x = [0,50]) && (P2Dist y = [-80,0]) && P2StateType != C && P2StateType != L
triggerAll = (EnemyNear, const(size.head.pos.y) <= -40) || (EnemyNear, StateType = A)
trigger1 = (ctrl || (StateNo = [100,101])) && Random < (250 * (AILevel ** 2 / 64.0))
trigger2 = (StateNo = [200, 499]) && !AnimTime && ctrl
trigger2 = MoveHit && (EnemyNear, GetHitVar(HitTime) >= 3) && Random < (100 * (AILevel ** 2 / 64.0))

[State -1, Quarrel Punch/Standing Normal Medium Punch]
type = ChangeState
value = 215
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType != A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = (P2BodyDist x = [0,40]) && (P2Dist y = [-80,0]) && P2StateType != C && P2StateType != L
triggerAll = (EnemyNear, const(size.head.pos.y) <= -40) || (EnemyNear, StateType = A)
trigger1 = (ctrl || (StateNo = [100,101])) && Random < (250 * (AILevel ** 2 / 64.0))
trigger2 = (StateNo = [200, 499]) && !AnimTime && ctrl
trigger2 = MoveHit && (EnemyNear, GetHitVar(HitTime) >= 3) && Random < (100 * (AILevel ** 2 / 64.0))

[State -1, Standing Normal Hard Punch]
type = ChangeState
value = 220
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType != A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = (P2BodyDist x = [0,50]) && (P2Dist y = [-100,0]) && P2StateType != C && P2StateType != L
triggerAll = (EnemyNear, const(size.head.pos.y) <= -40) || (EnemyNear, StateType = A)
trigger1 = (ctrl || (StateNo = [100,101])) && Random < (250 * (AILevel ** 2 / 64.0))
trigger2 = (StateNo = [200, 499]) && !AnimTime && ctrl
trigger2 = MoveHit && (EnemyNear, GetHitVar(HitTime) >= 3) && Random < (250 * (AILevel ** 2 / 64.0))
trigger3 = StateNo = 420 && AnimElemTime(4)>= 1 && MoveContact && Random < (200 * (AIlevel ** 2 / 64.0))

[State -1, Standing Light Kick]
type = ChangeState
value = 230
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType != A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = (P2BodyDist x = [0,53]) && (P2Dist y = [-17,0]) && P2StateType != L
triggerAll = (EnemyNear, const(size.head.pos.y) <= -40) || (EnemyNear, StateType = A)
trigger1 = (ctrl || (StateNo = [100,101])) && Random < (25 * (AILevel ** 2 / 64.0))
trigger2 = (StateNo = [200, 499]) && !AnimTime && ctrl
trigger2 = MoveHit && (EnemyNear, GetHitVar(HitTime) >= 2) && Random < (250 * (AILevel ** 2 / 64.0))

[State -1, SLK Target Combo 1]
type = ChangeState
value = 200
trigger1 = AILevel
trigger1 = StateNo = 230 && AnimElemTime(5) < 0 && MoveContact

[State -1, SLK Target Combo 2]
type = ChangeState
value = 230
trigger1 = AILevel
trigger1 = StateNo = 230 && AnimElemTime(5) < 0 && MoveContact

[State -1, Standing FWD/Medium Kick]
type = ChangeState
value = 240 + (Abs(P2BodyDist X) <= 25) * 5
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType != A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = (P2BodyDist x = [0,50]) && (P2Dist y = [-80,0]) && P2StateType != C && P2StateType != L
triggerAll = (EnemyNear, const(size.head.pos.y) <= -40) || (EnemyNear, StateType = A)
trigger1 = (ctrl || (StateNo = [100,101])) && Random < (250 * (AILevel ** 2 / 64.0))
trigger2 = (StateNo = [200, 499]) && !AnimTime && ctrl
trigger2 = MoveHit && (EnemyNear, GetHitVar(HitTime) >= 3) && Random < (100 * (AILevel ** 2 / 64.0))

[State -1, Standing Hard Kick]
type = ChangeState
value = 250
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType != A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = (P2BodyDist x = [0,60]) && (P2Dist y = [-120,0]) && P2StateType != C && P2StateType != L
triggerAll = (EnemyNear, const(size.head.pos.y) <= -40) || (EnemyNear, StateType = A)
trigger1 = (ctrl || (StateNo = [100,101])) && Random < (250 * (AILevel ** 2 / 64.0))
trigger2 = (StateNo = [200, 499]) && !AnimTime && ctrl
trigger2 = MoveHit && (EnemyNear, GetHitVar(HitTime) >= 3) && Random < (250 * (AILevel ** 2 / 64.0))

[State -1, Crouching Light Punch]
type = ChangeState
value = 400
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType != A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = (P2BodyDist x = [0,53]) && (P2Dist y = [-30,0]) && P2StateType != A && P2StateType != L
triggerAll = (EnemyNear, const(size.head.pos.y) <= -40) || (EnemyNear, StateType = A)
trigger1 = (ctrl || (StateNo = [100,101])) && Random < (25 * (AILevel ** 2 / 64.0))
trigger2 = (StateNo = [200, 499]) && !AnimTime && ctrl
trigger2 = MoveHit && (EnemyNear, GetHitVar(HitTime) >= 2) && Random < (250 * (AILevel ** 2 / 64.0))

[State -1, Crouching Medium Punch]
type = ChangeState
value = 410
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType != A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = (P2BodyDist x = [0,70]) && P2StateType != A && P2StateType != L
triggerAll = (EnemyNear, const(size.head.pos.y) <= -40) || (EnemyNear, StateType = A)
trigger1 = (ctrl || (StateNo = [100,101])) && Random < (25 * (AILevel ** 2 / 64.0))
trigger2 = (StateNo = [200, 499]) && !AnimTime && ctrl
trigger2 = MoveHit && (EnemyNear, GetHitVar(HitTime) >= 2) && Random < (250 * (AILevel ** 2 / 64.0))

[State -1, Crouching Hard Punch]
type = ChangeState
value = 420
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType != A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = (P2BodyDist x = [0,60]) && (P2Dist y = [-90,0]) && P2StateType != A && P2StateType != L
triggerAll = (EnemyNear, const(size.head.pos.y) <= -40) || (EnemyNear, StateType = A)
trigger1 = (ctrl || (StateNo = [100,101])) && Random < (200 * (AILevel ** 2 / 64.0))
trigger2 = (StateNo = [200, 499]) && !AnimTime && ctrl
trigger2 = MoveHit && (EnemyNear, GetHitVar(HitTime) >= 2) && Random < (200 * (AILevel ** 2 / 64.0))

[State -1, Crouching Light Kick]
type = ChangeState
value = 430
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType != A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = (P2BodyDist x = [0,48]) && P2StateType != A && P2StateType != L
trigger1 = (ctrl || (StateNo = [100,101])) && Random < (25 * (AILevel ** 2 / 64.0))
trigger2 = (StateNo = [200, 499]) && !AnimTime && ctrl
trigger2 = MoveHit && (EnemyNear, GetHitVar(HitTime) >= 2) && Random < (250 * (AILevel ** 2 / 64.0))

[State -1, Crouching Medium Kick]
type = ChangeState
value = 440
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType != A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = (P2BodyDist x = [0,68]) && (P2Dist y = [-12,10]) && P2StateType != A && P2StateType != L
trigger1 = (ctrl || (StateNo = [100,101])) && Random < (25 * (AILevel ** 2 / 64.0))
trigger2 = (StateNo = [200,499]) && !AnimTime && ctrl
trigger2 = MoveHit && (EnemyNear, GetHitVar(HitTime) >= 3) && Random < (250 * (AILevel ** 2 / 64.0))

[State -1, Crouching Heavy Kick]
type = ChangeState
value = 450
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType != A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = (P2BodyDist x = [0,60]) && (P2Dist y = [-20,60]) && P2StateType != A && P2StateType != L
triggerAll = (P2StateType = S || (P2StateType = C && P2MoveType = H))
trigger1 = (ctrl || (StateNo = [100,101])) && Random < (25 * (AILevel ** 2 / 64.0))
trigger2 = (StateNo = [200,499]) && !AnimTime && ctrl
trigger2 = MoveHit && (EnemyNear, GetHitVar(HitTime) >= 6) && Random < (250 * (AILevel ** 2 / 64.0))

[State -1,CFHP]
type = ChangeState
value = 425
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 
triggerall = p2statetype = S && random <= 250
trigger1 = stateno = 440 && animelemtime(3) > 0 && moveguarded
trigger2 = stateno = 210 && animelemtime(3) > 0 && movecontact
trigger3 = stateno = 210 && animelemtime(3) > 0 && moveguarded

[State -1, Jumping Light Punch]
type = ChangeState
value = 600
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType = A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = (P2BodyDist x = [0,23]) && (P2Dist y = [-28,13]) && P2StateType = S
trigger1 = ctrl
trigger1 = vel y > 0 && Random < (100 * (AIlevel ** 2 / 64.0))

[State -1, Jumping Medium Punch]
type = ChangeState
value = 610
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType = A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = (P2BodyDist x = [0,40]) && (P2Dist y = [-35,45]) && P2StateType = S
trigger1 = ctrl
trigger1 = vel y > 0 && Random < (100 * (AILevel ** 2 / 64.0))

[State -1, Jumping Heavy Punch]
type = ChangeState
value = 620
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType = A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = (P2BodyDist x = [0,48]) && (P2Dist y = [-35,45]) && P2StateType = S
trigger1 = ctrl
trigger1 = vel y > 0 && Random < (100 * (AILevel ** 2 / 64.0))
trigger2 = var(4) && Random < (50 * (AILevel ** 2 / 64.0))

[State -1, Jumping Light Kick]
type = ChangeState
value = 630
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType = A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = (P2BodyDist x = [0,20]) && (P2Dist y = [-25,55]) && P2StateType != L
trigger1 = ctrl
trigger1 = vel y > 0 && Random < (ifElse(P2Dist x < 0, 250, 50) * (AILevel ** 2 / 64.0))

[State -1, Jumping Medium Kick]
type = ChangeState
value = 640
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType = A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = (P2BodyDist x = [0,28]) && (P2Dist y = [-25,25]) && P2StateType = A
trigger1 = ctrl
trigger1 = vel y <= 0 && Random < (100 * (AILevel ** 2 / 64.0))

[State -1, Jumping Heavy Kick]
type = ChangeState
value = 650
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType = A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = (P2BodyDist x = [0,50]) && (P2Dist y = [-22,40]) && P2StateType = S
trigger1 = ctrl && Random < (100 * (AILevel ** 2 / 64.0))
trigger2 = var(4) && Random < (100 * (AILevel ** 2 / 64.0))


[State -1, Jumping Dive Kick2]
type = ChangeState
value = 655
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType = A
triggerall = pos y <= -92 && random <= 500 
trigger1 = ctrl && stateno != 52 && (p2bodydist x = [-20,5]) 
trigger2 = var(4)

;----------------------------------------------------------------------------------------------------------
Specials
;----------------------------------------------------------------------------------------------------------
[State -1, Crouch MSH Hard Punch]
type = ChangeState
value = 1000
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType != A
triggerAll = !var(39)
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = p2bodydist x < 45 
triggerAll = P2Dist y >= -120 && EnemyNear, vel y >= 0
triggerAll = P2StateType != A || EnemyNear, vel x < 0
trigger1 = (ctrl || StateNo = 52 || (StateNo = [100,101])) && Random < (50 * (AILevel ** 2 / 64.0))
trigger2 = EnemyNear, StateNo = 195 && Random < (50 * (AILevel ** 2 / 64.0))

[State -1, EXCrouch MSH Hard Punch]
type = ChangeState
value = 1050
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType != A
triggerAll = !var(39)
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerall = power >= 500
triggerAll = p2bodydist x < 50 
triggerAll = P2Dist y >= -120 && EnemyNear, vel y >= 0
triggerAll = P2StateType != A || EnemyNear, vel x < 0
trigger1 = (ctrl || StateNo = 52 || (StateNo = [100,101])) && Random < (50 * (AILevel ** 2 / 64.0))
trigger2 = EnemyNear, StateNo = 195 && Random < (50 * (AILevel ** 2 / 64.0))

[State -1, Bubble Throw]
type = ChangeState
value = 1100
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType != A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = p2bodydist X > 25 
triggerAll = p2bodydist x < 60 
triggerAll = P2StateType != L
triggerAll = (EnemyNear, const(size.head.pos.y) <= -40) || (EnemyNear, StateType = A)
trigger1 = (ctrl || StateNo = 52 || (StateNo = [100,101])) && Random < (250 * (AIlevel ** 2 / 64.0))

[State -1, EXBubble Throw]
type = ChangeState
value = 1150
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType != A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerall = power >= 500
triggerAll = p2bodydist X > 25 
triggerAll = p2bodydist x < 60 
triggerAll = P2StateType != L
triggerAll = (EnemyNear, const(size.head.pos.y) <= -40) || (EnemyNear, StateType = A)
trigger1 = (ctrl || StateNo = 52 || (StateNo = [100,101])) && Random < (250 * (AIlevel ** 2 / 64.0))

[State -1, Crouch Fire Twerk]
type = ChangeState
value = 1200
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType != A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = (P2BodyDist x = [0,70]) && P2StateType != L
triggerAll = (EnemyNear, const(size.head.pos.y) <= -40) || (EnemyNear, StateType = A)
trigger1 = (ctrl || StateNo = 52 || (StateNo = [100,101])) && Random < (150 * (AILevel ** 2 / 64.0))
trigger3 = StateNo = 420 && AnimElemTime(4)>= 1 && MoveContact && Random < (200 * (AIlevel ** 2 / 64.0))
trigger4 = PrevStateNo = 1250 && AnimElemTime(1)>= 0 && Random < (333 * (AIlevel ** 2 / 64.0))
trigger5 = StateNo = 2900 && AnimElemTime(4)>= 1 && MoveContact && Random < (333 * (AIlevel ** 2 / 64.0))

[State -1, EXCrouch Fire Twerk]
type = ChangeState
value = 1250
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType != A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = power >= 500
triggerAll = (P2BodyDist x = [0,70]) && P2StateType != L
triggerAll = (EnemyNear, const(size.head.pos.y) <= -40) || (EnemyNear, StateType = A)
trigger1 = (ctrl || StateNo = 52 || (StateNo = [100,101])) && Random < (150 * (AILevel ** 2 / 64.0))
trigger3 = StateNo = 420 && AnimElemTime(4)>= 1 && MoveContact && Random < (200 * (AIlevel ** 2 / 64.0))
trigger4 = PrevStateNo = 1250 && AnimElemTime(1)>= 0 && Random < (333 * (AIlevel ** 2 / 64.0))
trigger5 = StateNo = 2900 && AnimElemTime(4)>= 1 && MoveContact && Random < (333 * (AIlevel ** 2 / 64.0))

[State -1, Spear Dash L]
type = ChangeState
value = 1300
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType != A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = (P2BodyDist x = [0,70]) && P2StateType != L
triggerAll = (EnemyNear, const(size.head.pos.y) <= -40) || (EnemyNear, StateType = A)
trigger1 = (ctrl || StateNo = 52 || (StateNo = [100,101])) && Random < (150 * (AILevel ** 2 / 64.0))
trigger3 = StateNo = 420 && AnimElemTime(4)>= 1 && MoveContact && Random < (200 * (AIlevel ** 2 / 64.0))
trigger4 = PrevStateNo = 1250 && AnimElemTime(1)>= 0 && Random < (333 * (AIlevel ** 2 / 64.0))
trigger5 = StateNo = 2900 && AnimElemTime(4)>= 1 && MoveContact && Random < (333 * (AIlevel ** 2 / 64.0))

[State -1, EXSpear Dash L]
type = ChangeState
value = 1350
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType != A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = power >= 500
triggerAll = (P2BodyDist x = [0,70]) && P2StateType != L
triggerAll = (EnemyNear, const(size.head.pos.y) <= -40) || (EnemyNear, StateType = A)
trigger1 = (ctrl || StateNo = 52 || (StateNo = [100,101])) && Random < (150 * (AILevel ** 2 / 64.0))
trigger3 = StateNo = 420 && AnimElemTime(4)>= 1 && MoveContact && Random < (200 * (AIlevel ** 2 / 64.0))
trigger4 = PrevStateNo = 1250 && AnimElemTime(1)>= 0 && Random < (333 * (AIlevel ** 2 / 64.0))
trigger5 = StateNo = 2900 && AnimElemTime(4)>= 1 && MoveContact && Random < (333 * (AIlevel ** 2 / 64.0))



;----------------------------------------------------------------------------------------------------------
Supers
;----------------------------------------------------------------------------------------------------------
[State -1, POWER]
type = ChangeState
value = 3000
triggerall=AILevel && numenemy && RoundState=2 && stateno!=3000 && StateType != A && var(20)<=0 && power >= 1000 && random < (100 * (AIlevel ** 2 / 64.0))
triggerall=(enemynear,statetype != L)&&(enemynear,stateno!=[5100,5220])&&(enemynear,stateno!=[120,155])&&(p2bodydist x <=60)&&(p2bodydist y=[-80,5])
trigger1=ctrl || StateNo=40 || StateNo=52 || (StateNo=[100,101])
trigger2=var(6)&&movehit&&random<200

[State -1, MAXPOWER]
type = ChangeState
value = 3050
triggerall=AILevel && numenemy && RoundState=2 && StateType != A && var(20)<=0 && power >= 2000 && random < (150 * (AIlevel ** 2 / 64.0))
triggerall=(enemynear,statetype != L)&&(enemynear,stateno!=[5100,5220])&&(enemynear,stateno!=[120,155])&&(p2bodydist x <=60)&&(p2bodydist y=[-80,5])
trigger1=ctrl || StateNo=40 || StateNo=52 || (StateNo=[100,101])
trigger2=var(6)&&movehit&&random<250

[State -1, TIME]
type = ChangeState
value = 3100
triggerall=AILevel && numenemy && RoundState=2 && StateType != A && var(20)<=0 && power >= 2000 && random < (150 * (AIlevel ** 2 / 64.0))
triggerall=(enemynear,statetype != L)&&(enemynear,stateno!=[5100,5220])&&(enemynear,stateno!=[120,155])&&(p2bodydist x <=60)&&(p2bodydist y=[-80,5])
trigger1=ctrl || StateNo=40 || StateNo=52 || (StateNo=[100,101])
trigger2=var(6)&&movehit&&random<250



[State -1, REALITY]
type=ChangeState
value=3200
triggerall=AILevel && numenemy && RoundState=2 && stateno!=3200 && StateType != A && var(20)<=0 && power >= 1000 && random < (100 * (AIlevel ** 2 / 64.0))
triggerall=(enemynear,statetype != L)&&(enemynear,stateno!=[5100,5220])&&(enemynear,stateno!=[120,155])&&(p2bodydist x <=70)&&(p2bodydist y=[-80,5])
trigger1=ctrl || StateNo=40 || StateNo=52 || (StateNo=[100,101])
trigger2=var(6)&&movehit&&random<200



[State -1, MAXREALITY]
type = ChangeState
value = 3250
triggerall=AILevel && numenemy && RoundState=2 && StateType != A && var(20)<=0 && power >= 2000 && random < (150 * (AIlevel ** 2 / 64.0))
triggerall=(enemynear,statetype != L)&&(enemynear,stateno!=[5100,5220])&&(enemynear,stateno!=[120,155])&&(p2bodydist x <=70)&&(p2bodydist y=[-160,5])
trigger1=ctrl || StateNo=40 || StateNo=52 || (StateNo=[100,101])
trigger2=var(6)&&movehit&&random<250


[State -1, MIND]
type=ChangeState
value=Ifelse(power>=3000&&random<=400,3300,3300)
triggerall=AILevel && numenemy && RoundState=2 && StateType != A && var(20)<=0 && power >= 3000 && random < (350 * (AIlevel ** 2 / 64.0))
triggerall=(enemynear,statetype != L) &&(enemynear,stateno!=[5100,5220])&&(enemynear,stateno!=[120,155])&&(p2bodydist x =[40,120])&&(p2bodydist y=[-50,5])
trigger1=ctrl || StateNo=40 || StateNo=52 || (StateNo=[100,101])
trigger2=var(6)&&movehit&&random<250

[State -1, SPACE]
type=ChangeState
value=Ifelse(power>=3000&&random<=400,3350,3350)
triggerall=AILevel && numenemy && RoundState=2 && StateType != A && var(20)<=0 && power >= 3000 && random < (350 * (AIlevel ** 2 / 64.0))
triggerall=(enemynear,statetype != L) &&(enemynear,stateno!=[5100,5220])&&(enemynear,stateno!=[120,155])&&(p2bodydist x =[40,120])&&(p2bodydist y=[-50,5])
trigger1=ctrl || StateNo=40 || StateNo=52 || (StateNo=[100,101])
trigger2=var(6)&&movehit&&random<250

[State -1, SOUL]
type = ChangeState
value = 3500
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType != A
triggerAll = power >= 1000 && life < 500
triggerAll = var(20)<=0
triggerAll = p2stateno = [5030,5170]
trigger1 = random <= 300 && stateno = 220 && animelemtime(1) > 3 && enemy, gethitvar(fall) = 0 && movehit
trigger2 = random <= 300 && stateno = 425 && animelemtime(2) > 0 && movehit
trigger3 = (ctrl || StateNo = 52 || (StateNo = [100,101]))

[State -1, MAXSOUL]
type = ChangeState
value = 3550
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType != A
triggerAll = power >= 2000 && life < 500
triggerAll = var(20)<=0
triggerAll = p2stateno = [5030,5170]
trigger1 = random <= 700 && stateno = 220 && animelemtime(1) > 3 && enemy, gethitvar(fall) = 0 && movehit
trigger2 = random <= 700 && stateno = 425 && animelemtime(2) > 0 && movehit
trigger3 = (ctrl || StateNo = 52 || (StateNo = [100,101]))


