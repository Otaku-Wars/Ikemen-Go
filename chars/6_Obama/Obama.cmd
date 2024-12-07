[Command]
name = "THEENDISNEARBlack"
command = ~x, x, F, a, b
time = 70

[Command]
name = "THEENDISNEARWhite"
command = ~D,F,D,F, b+c
time = 40

[Command]
name = "WilsonAttacks"
command = ~D,F,D,F, y+z
time = 40

[Command]
name = "armageddon"
command = ~D,F,D,F, x+z
time = 40

[Command]
name = "Bus"
command = x+y
time = 40

[Command]
name = "Bus"
command = y+z
time = 40

[Command]
name = "Bus"
command = z+x
time = 40

;[Command]
;name = "DIO"
;command = D
;time = 20

[Command]
name = "Hooch"
command = a+x

[Command]
name = "Hooch"
command = b+y

[Command]
name = "Hooch"
command = c+z

[Command]
name = "FF"     
command = F, F
time = 10

[Command]
name = "BB"     
command = B, B
time = 10

[Command]
name = "recovery"
command = x+y
time = 1

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

[Command]
name = "holdfwd"
command = /$F
time = 1

[Command]
name = "holdback"
command = /$B
time = 1

[Command]
name = "holdup" 
command = /$U
time = 1

[Command]
name = "holddown"
command = /$D
time = 1

[Statedef -1]

[State -1, TEIN]
type = ChangeState
value = 1915
triggerall = command = "THEENDISNEARBlack"
triggerall = power >= 9000
trigger1 = statetype = S
trigger1 = ctrl

[State -1, TEIN]
type = ChangeState
value = 1900
triggerall = command = "THEENDISNEARWhite"
triggerall = power >= 6000
trigger1 = statetype = S
trigger1 = ctrl

[State -1, TEIN]
type = ChangeState
value = 1960
triggerall = command = "WilsonAttacks"
triggerall = numhelper(1966) = 0
triggerall = power >= 5000
trigger1 = statetype = S
trigger1 = ctrl

[State -1, TEIN]
type = ChangeState
value = 1100
triggerall = command = "armageddon"
triggerall = power >= 4000
triggerall = numhelper(1100) = 0
trigger1 = statetype = S
trigger1 = ctrl

[State -1, Hooch]
type = ChangeState
value = 1000
triggerall = command = "Hooch"
triggerall = power >= 2000
trigger1 = statetype = S
trigger1 = ctrl

[State -1, Run Fwd]
type = ChangeState
value = 100
trigger1 = command = "FF"
trigger1 = statetype = S
trigger1 = ctrl

[State -1, Run Back]
type = ChangeState
value = 105
trigger1 = command = "BB"
trigger1 = statetype = S
trigger1 = ctrl

[State -1, Big]
type = ChangeState
value = 200
triggerall = command = "x"
triggerall = NumHelper(201) < 1
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = statetype = C
trigger2 = ctrl

[State -1, Big Air]
type = ChangeState
value = 203
triggerall = command = "x"
triggerall = NumHelper(201) < 1
trigger1 = statetype = A
trigger1 = ctrl

[State -1, The Green Mile]
type = ChangeState
value = 205
triggerall = command = "y"
triggerall = NumHelper(206) < 1
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = statetype = C
trigger2 = ctrl

[State -1, The Green Mile Air]
type = ChangeState
value = 207
triggerall = command = "y"
triggerall = NumHelper(206) < 1
trigger1 = statetype = A
trigger1 = ctrl

[State -1, Forest Gump]
type = ChangeState
value = 210
triggerall = command = "z"
triggerall = NumHelper(211) < 1
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = statetype = C
trigger2 = ctrl

[State -1, Forest Gump Air]
type = ChangeState
value = 212
triggerall = command = "z"
triggerall = NumHelper(211) < 1
trigger1 = statetype = A
trigger1 = ctrl

[State -1, Sleepless in Seattle]
type = ChangeState
value = 215
triggerall = command = "a"
triggerall = NumHelper(216) < 1
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = statetype = C
trigger2 = ctrl

[State -1, Sleepless in Seattle Air]
type = ChangeState
value = 217
triggerall = command = "a"
triggerall = NumHelper(216) < 1
trigger1 = statetype = A
trigger1 = ctrl

[State -1, Cast Away]
type = ChangeState
value = 220
triggerall = command = "b"
triggerall = NumHelper(221) < 1
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = statetype = C
trigger2 = ctrl

[State -1, Cast Away Air]
type = ChangeState
value = 222
triggerall = command = "b"
triggerall = NumHelper(221) < 1
trigger1 = statetype = A
trigger1 = ctrl

[State -1, Saving Private Ryan]
type = ChangeState
value = 225
triggerall = command = "c"
triggerall = NumHelper(226) < 1
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = statetype = C
trigger2 = ctrl

[State -1, Saving Private Ryan Air]
type = ChangeState
value = 227
triggerall = command = "c"
triggerall = NumHelper(226) < 1
trigger1 = statetype = A
trigger1 = ctrl

;---------------------------------------------------------------------------
;立ち弱パンチ
[State -1, Bus of doom]
type = ChangeState
value = 2000
triggerall = numhelper(2000) = 0
triggerall = power >= 1000
triggerall = command = "Bus"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = stateno = 200
trigger2 = movecontact
;---------------------------------------------------------------------------
;ローラーだッ！
[State -1]
type = ChangeState
value = 3100
triggerall = numhelper(3015) = 0
triggerall = numhelper(3000) = 0
triggerall = numhelper(3100) = 0
triggerall = command = "start"
triggerall = power >= 1000
trigger1 = statetype = S
trigger1 = ctrl
