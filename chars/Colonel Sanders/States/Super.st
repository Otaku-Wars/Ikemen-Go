; _________________________________________
;| Colonel Sanders by IkuTronHD            |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==============================================================================================
;========================================<SUPER MOVES>========================================
;==============================================================================================

;---------------------------------------------------------------------------
;Super 1
[Statedef 3000]
type=S
physics=N
movetype=A
ctrl=0
velset=0,0
sprpriority=1
poweradd=-1000
facep2=1

[State 3000, Anim]
type=changeanim
trigger1=!time
value=3010

[state 3000,Posset]
type=posset
trigger1=!time
y=0

[State 3000, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "x" || command = "rlsx"), 0, ifElse((command = "y" || command = "rlsy"), 1, 2))

[State 3000, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 3000, Super Cancel Flag]
type = varset
trigger1 = !time
var(21) = ((prevstateno = [1000, 2999]) && var(7)) || var(20)

[State 3000, Hyper Cancel Flag]
type = varset
trigger1 = !time
var(22) = (prevstateno = [3000, 4999]) && var(8)

[State 3000, CC Reset]
type = palfx
trigger1 = !time
trigger1 = !(var(20) := 0)
time = 1

[State 3000, Corner Push]
type = varset
trigger1 = time = 3
fvar(5) = 0

[State 3000, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 40

[State 3000, Super Cancel Flash]
type = palfx
trigger1 = var(21) || var(22)
trigger1 = !(time % 2) && time <= 12
time = 1
add = 255, 255, 255
ignorehitpause = 1

[State 3000, Super Cancel Juggle]
type = varset
trigger1 = !time
trigger1 = var(21) || var(22)
var(15) = 0
ignorehitpause = 1

[State 3000, Superpause FX]
type = helper
trigger1 = Time = 1
stateno = 8500
ID = 8500
name = "Superpause FX"
postype = p1
pos = 3, -104
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 3000, Superpause]
type = superpause
trigger1 = Time = 1
time = 40
movetime = 40
p2defmul = 1
unhittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3000, Idle]
type = StateTypeSet
trigger1 = AnimElemTime(9) >= 0
moveType = I

[state 1200, 1]
type = Helper
trigger1 = Time = 34
ID = 3000
pos = ceil(P2Dist X), 0
postype = p1
stateno = 3001
helpertype = normal
name = "pressure fryer"
keyctrl = 1
ownpal = 1

[state 3000]
type = PlaySnd
trigger1 = Time = 0
value = s3,3

[State 3000, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 0
ctrl = 1
;---------------------------------------------------------------------------
;ˆ³—ÍŠ˜

[Statedef 3001]
type    = A
movetype= A
physics = N
ctrl = 0
anim = 3000
sprpriority = -10

[State 3001, Explod]
type = Explod
trigger1 = Time%8 = 0
anim = 4022
ID = 4022
pos = Random%128-64,-20
postype = P1
sprpriority = 3
ownpal = 1

[State 3001, 7]
type = AssertSpecial
trigger1 = 1
flag = NoShadow

[State 3001, 8]
type = HitDef
trigger1 = Time = 0
attr = C, HT
hitflag = MAF
guardflag = MA
getpower = 50,30
priority = 3, Miss
hitsound   = S800,0
guardsound = S6,0
Guard.pausetime = 0,80
ground.hittime  = 0
numhits = 0
sparkno = -1
p1stateno = 3002
p2stateno = 3010
fall = 1

[State 3001, 9]
type = Changestate
trigger1 = time >= 100
trigger2 = movecontact
value = 3004

;---------------------------------------------------------------------------
;ˆ³—Í“ç@ˆø‚«‚¸‚èž‚Þ

[Statedef 3002]
type    = A
movetype= A
physics = N
anim = 3000
sprpriority = -10

[State 3002, 1] 
type = AssertSpecial
trigger1 = 1
flag = NoShadow

[State 3002, 2]
type = PlaySnd
trigger1 = time = 0
value = 1200,10

[state 3002, 1]
type = Helper
trigger1 = Time = 0
ID = 3004
pos = 0, -200
postype = p1
stateno = 3005
helpertype = normal
name = "futa"
keyctrl = 0
ownpal = 1

[State 3002, 3]
type = Targetbind
trigger1 = NumTarget
trigger1 = time < 99
pos = 0,0

[State 3002, 4]
type = PlaySnd
trigger1 = time = 105
value = 1200,15

[State 3002, 5]
type = TargetLifeadd
trigger1 = NumTarget
trigger1 = time = [30,99]
value = -1
absolute = 1

[State 3002,14]
type = Changestate
trigger1 = time = 100
value = 3003

;---------------------------------------------------------------------------
;“ç”š”­

[Statedef 3003]
type    = A
movetype= I
physics = N
anim = 4300
sprpriority = 8

[State 3002, 8]
type = Hitadd
trigger1 = time = 0
value = 1

[State 3002, 9]
type = TargetLifeadd
trigger1 = time = 0
value = -200
absolute = 1

[State 3002,11]
type = EnvShake
trigger1 = time = 0
time = 24
freq = 120
ampl = -5

[State 3002,12]
type = TargetVelset
trigger1 = Numtarget
trigger1 = time = 0
y = -Const(size.yscale)*20

[State 3002,13]
type = Targetstate
trigger1 = Numtarget
trigger1 = time = 0
value = 3012

[State 3003, Explod]
type = Explod
trigger1 = Time%2 = 0
anim = 1955
ID = 1955
pos = Random%128-64,0
postype = P1
sprpriority = 3
ownpal = 1

[State 3003, Explod]
type = Explod
trigger1 = Time%4 = 0
anim = 1955
ID = 1955
pos = 0,0
postype = P2
sprpriority = 3
ownpal = 1

[State 3003, 1]
type = PlaySnd
trigger1 = Time = 0
value = s6,6

[State 3003, 1] 
type = AssertSpecial
trigger1 = 1
flag = NoShadow

[State 3003, 4]
type = Destroyself
trigger1 = AnimTime = 0

;---------------------------------------------------------------------------
;“çÁ‚¦‚é

[Statedef 3004]
type    = A
movetype= I
physics = N
anim = 3000
sprpriority = -8

[State 3004, 1] 
type = AssertSpecial
trigger1 = 1
flag = NoShadow

[State 3001, Explod]
type = Explod
trigger1 = Time%8 = 0
anim = 4022
ID = 4022
pos = Random%128-64,-20
postype = P1
sprpriority = 3
ownpal = 1

[State 3004, 4]
type = Destroyself
trigger1 = time >= 80

;---------------------------------------------------------------------
;ŠW

[Statedef 3005]
type    = A
movetype= A
physics = N
velset = 0,0
anim = 3001
ctrl = 0
sprpriority = 8

[State 3005]
type = VelAdd
trigger1 = Time > 0
y = .35

[State 3005]
type = ChangeState
trigger1 = Vel Y > 0 && Pos Y >= -10
value = 3006

;---------------------------------------------------------------------------
;ŠW’…’n

[Statedef 3006]
type    = A
movetype= A
physics = N
velset = 0,0
anim = 3001
ctrl = 0
sprpriority = 8

[State 3006]
type = PlaySnd
trigger1 = Time = 0
value = s3400,0

[State 3006]
type = PlaySnd
trigger1 = Time = 0
value = s3400,0

[State 3006]
type = PalFX
trigger1 = Time = 0
time = 167
sinadd=128,0,0,668

[State 3006]
type = Posset
trigger1 = Time = 0
y = 0

[State 3006]
type = Velset
trigger1 = Time = 0
y = 0

[State 3006]
type = DestroySelf
trigger1 = Time = 67


;---------------------------------------------------------------------
;‘ŠŽè

[Statedef 3010]
type    = A
movetype= H
physics = N
velset = 0,0
ctrl = 0
sprpriority = 0

[State 3010, 1]
type = Changeanim2
trigger1 = time = 0
value = 3002

[State 3010, 5]
type = PlaySnd
triggerall = !alive
trigger1 = time = [120,163]
trigger1 = time % 3 = 2
trigger2 = time = 186
value = 11,0
channel = 30

[State 3011, 0]
type = AngleDraw
trigger1 = time > 0
scale = 1.0-Time*0.01,1.0-Time*0.01

[State 3410, 6]
type = ChangeState
trigger1 = AnimTime = 0
value = 3011

;---------------------------------------------------------------------
;“|‚ê‚Ä‚¢‚é‘ŠŽè

[Statedef 3011]
type    = A
movetype= H
physics = N
velset = 0,0
ctrl = 0
sprpriority = 0

[State 3012, 3]
type = NotHitBy
Trigger1 = 1
value = SCA
time = 100

[State 3011, 0]
type = AngleDraw
trigger1 = time > 0
scale = .1, .1

[State 3011, 1]
type = Changeanim2
trigger1 = time = 0
value = 5110

;-----------------------
;‚Á”ò‚Ô‘ŠŽè
[Statedef 3012]
type    = A
movetype= H
physics = N
sprpriority = 3
anim = 5050

[State 3002, 3]
type = ScreenBound
trigger1 = time = 0
value = 1

[State 3006]
type = PalFX
trigger1 = Time = 0
time = 80
add = 150,0,-100
sinadd = 50,50,0,10
color = 0
invertall = 1

[State 3012, 1]
type = ChangeAnim
Trigger1 = time = 0
Trigger1 = SelfAnimExist(5051)
Trigger1 = anim != 5051
value = 5051

[State 3012, 2]
type = ChangeAnim
Trigger1 = Vel Y > -1
Trigger1 = SelfAnimExist(5061)
Trigger1 = anim != 5061
value = 5061

[State 3012, 3]
type = NotHitBy
Trigger1 = 1
value = SCA
time = 1

[State 3412, 4]
type = Veladd
Trigger1 = 1
Y = 0.55

[State 3012, 5]
type = SelfState
triggerall = Vel Y > 0
triggerall = alive
triggerall = CanRecover
trigger1 = Command = "recovery"
value = ifelse(Pos Y >= -20,5200,5210)

[State 3012, 6]
type = Selfstate
Trigger1 = Vel Y > 0
Trigger1 = Pos Y >= 0
value = 5100
;---------------------------------------------------------------------------
;Super 2
[Statedef 3020]
type=S
physics=N
movetype=A
ctrl=0
velset=0,0
sprpriority=1
poweradd=-1000
facep2=1

[State 3020, Anim]
type=changeanim
trigger1=!time
value=3020

[state 3000,Posset]
type=posset
trigger1=!time
y=0

[State 3020, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "x" || command = "rlsx"), 0, ifElse((command = "y" || command = "rlsy"), 1, 2))

[State 3020, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 3020, Super Cancel Flag]
type = varset
trigger1 = !time
var(21) = ((prevstateno = [1000, 2999]) && var(7)) || var(20)

[State 3020, Hyper Cancel Flag]
type = varset
trigger1 = !time
var(22) = (prevstateno = [3000, 4999]) && var(8)

[State 3020, CC Reset]
type = palfx
trigger1 = !time
trigger1 = !(var(20) := 0)
time = 1

[State 3020, Corner Push]
type = varset
trigger1 = time = 3
fvar(5) = 0

[State 3020, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 40

[State 3020, Super Cancel Flash]
type = palfx
trigger1 = var(21) || var(22)
trigger1 = !(time % 2) && time <= 12
time = 1
add = 255, 255, 255
ignorehitpause = 1

[State 3020, Super Cancel Juggle]
type = varset
trigger1 = !time
trigger1 = var(21) || var(22)
var(15) = 0
ignorehitpause = 1

[State 3020, Superpause FX]
type = helper
trigger1 = Time = 1
stateno = 8500
ID = 8500
name = "Superpause FX"
postype = p1
pos = 3, -104
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 3020, Superpause]
type = superpause
trigger1 = Time = 1
time = 40
movetime = 40
p2defmul = 1
unhittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3020, 6];ˆêu
type = PlaySnd
trigger1 = AnimElem = 1
value = 3000,0

[State 3020, 6];U‚è
type = PlaySnd
trigger1 = AnimElem = 5
value = 3000,2

[State 3020, 4];Žc‘œ
type = AfterImage
trigger1 = animelem = 2
time = -1
trans = add1
timegap = 2
framegap = 2
length = 6
palbright = 6,6,6
palcontrast = 225,225,225
palpostbright = 0,0,0
paladd = 0,0,0
palmul = 1,1,1
ignorehitpause = 0

[state 3020]
type = changestate
trigger1 = AnimTime = 0
value = 3021

;---------------------------------------------------------------------------
; Œõ‚é
[Statedef 3021]
type    = S
movetype= A
physics = S
juggle  = 0
poweradd= 0
velset = 0,0
anim = 3021
ctrl = 0

[State 3021, 4];Žc‘œÁ‹Ž
type = AfterImage
trigger1 = animtime = 0
time = 0

[State 3021, ƒwƒ‹ƒp[‚ðo‚·]
type = Helper
trigger1 = Time = 0
name = "senko"
stateno = 3022
ID = 3022
pos = 30,0
keyctrl = 0
postype = p1
supermovetime = 99999999
pausemovetime = 99999999
ownpal = 1
IgnoreHitPause = 1
Persistent = 0

[State 3021, ƒwƒ‹ƒp[‚ðo‚·2]
type = Helper
trigger1 = Time = 0
name = "senko2"
stateno = 3023
ID = 3023
pos = 0,0
keyctrl = 0
postype = p1
supermovetime = 99999999
pausemovetime = 99999999
ownpal = 1
IgnoreHitPause = 1
Persistent = 0

;---------------------[Œø‰Ê‰¹]
[State 3020, 6];U‚è
type = PlaySnd
trigger1 = Time = 0
value = 0,3

;---------------------[Œø‰Ê‰¹]
[State 3020, 6];‚¨‚³‚ß‚é
type = PlaySnd
trigger1 = AnimElem = 6
value = 3000,3

;---------------------[UŒ‚”»’è]
[State 3021];UŒ‚‚ÌŽw’è
type = HitDef
trigger1 = Time = 0
attr = S, HA
animtype  = Back
damage    = 240,20
getpower = 0,0
hitflag = MAFLH
guardflag = MA
pausetime = 4,4
sparkno = s8014
sparkxy = -10 + 0 * (var(35) := 55), var(36) := -82
hitsound   = s1,4
guard.sparkno = s4000
guardsound = s1,5
ground.slidetime = 18
ground.hittime  = 18
ground.velocity = 0,0
air.velocity = -1,20
fall = 1
air.fall = 1
fall.recover = 0
p2facing = 1

;---------------------[ƒXƒe[ƒgˆÚs]
[state 3021]
type = changestate
trigger1 = AnimTime = 0
value = 0
ctrl = 1

[Statedef 3022]
type     = A
movetype = I
physics  = N
ctrl     = 0
anim     = 3022

[State 3022]
type = AssertSpecial
trigger1 = AnimTime != 0
flag = noshadow


[State 3022]
type = PalFX
trigger1 = AnimElem = 4
Time = 80
add = 0,0,0
sinadd=-255,-255,-255,320
IgnoreHitPause = 1
Persistent = 4

[State 3022]
type = DestroySelf
trigger1 = AnimTime = 0

[Statedef 3023]
type     = A
movetype = I
physics  = N
ctrl     = 0
anim     = 3023

[State 3023]
type = AssertSpecial
trigger1 = AnimTime != 0
flag = noshadow


[State 3023]
type = PalFX
trigger1 = AnimElem = 1
Time = 40
add = 0,0,0
sinadd=-255,-255,-255,160
IgnoreHitPause = 1
Persistent = 4

[State 3023]
type = DestroySelf
trigger1 = AnimTime = 0



[State 3020, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 0
ctrl = 1
;---------------------------------------------------------------------------
;Super 3
[Statedef 3030]
type=S
physics=N
movetype=A
ctrl=0
velset=0,0
sprpriority=1
poweradd=-1000
facep2=1

[State 3030, Anim]
type=changeanim
trigger1=!time
value=3030

[state 3030,Posset]
type=posset
trigger1=!time
y=0

[State 3030, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "x" || command = "rlsx"), 0, ifElse((command = "y" || command = "rlsy"), 1, 2))

[State 3030, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 3030, Super Cancel Flag]
type = varset
trigger1 = !time
var(21) = ((prevstateno = [1000, 2999]) && var(7)) || var(20)

[State 3030, Hyper Cancel Flag]
type = varset
trigger1 = !time
var(22) = (prevstateno = [3000, 4999]) && var(8)

[State 3030, CC Reset]
type = palfx
trigger1 = !time
trigger1 = !(var(20) := 0)
time = 1

[State 3030, Corner Push]
type = varset
trigger1 = time = 3
fvar(5) = 0

[State 3030, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 40

[State 3030, Super Cancel Flash]
type = palfx
trigger1 = var(21) || var(22)
trigger1 = !(time % 2) && time <= 12
time = 1
add = 255, 255, 255
ignorehitpause = 1

[State 3030, Super Cancel Juggle]
type = varset
trigger1 = !time
trigger1 = var(21) || var(22)
var(15) = 0
ignorehitpause = 1

[State 3030, Superpause FX]
type = helper
trigger1 = Time = 1
stateno = 8500
ID = 8500
name = "Superpause FX"
postype = p1
pos = 3, -104
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 3030, Superpause]
type = superpause
trigger1 = Time = 1
time = 40
movetime = 40
p2defmul = 1
unhittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3030, 1]
type = HitDef
Trigger1 = Time = 0
attr = S, HT          ;Attributes: Standing, Normal Throw
hitflag = M-          ;Affect only ground people who are not being hit
priority = 1, Miss    ;Throw has low priority, must be miss or dodge type.
sparkno = s8020          ;No spark
p1sprpriority = 1     ;Draw p1's sprite in front of p2
p1facing = 1
p2facing = 1          ;Force p2 to face KFM
p1stateno = 3032       ;On success, KFM changes to state 810
p2stateno = 3310       ;If hit, p2 changes to state 820 in KFM's cns
guard.dist = 0        ;This prevents p2 from going into a guard state if close
fall = 1              ;Force p2 into falling down

[State 3030]
type = PlaySnd
trigger1 = Time = 0
value = s3300,0

[State 3030, 2]
type = ChangeState
Trigger1 = AnimTime = 1
value = 3031

[State 3030, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 0
ctrl = 1
;---------------------------------------------------------------------------
;“Š‚°Ž¸”s

[Statedef 3031]
type    = S
movetype= I
physics = N
anim = 3031
SprPriority = 0

[State 3031, 4]
type = AfterImage
trigger1 = Time = 0
time = 0

[State 3031]
type = ChangeState
Trigger1 = AnimTime = 0
ctrl = 1
value = 0

;---------------------------------------------------------------------------
;“Š‚°‚é

[Statedef 3032]
type    = S
movetype= A
physics = N
anim = 3032
SprPriority = 3

[State 5110, 6]
type = PlaySnd
trigger1 = Time = 0
value = S2,800

[State 3032, Playerpush]
type = Playerpush
trigger1 = 1
value = 0

[State 3032, TargetBind]
type = TargetBind
trigger1 = AnimElem = 1
pos = ceil(68*const(size.xscale)), ceil(-87*const(size.xscale))

[State 3032, TargetBind]
type = TargetBind
trigger1 = AnimElem = 2
pos = ceil(40*const(size.xscale)), ceil(-48*const(size.xscale))

[State 3032, TargetBind]
type = SprPriority
trigger1 = AnimElem = 3
value = -1

[State 3032, TargetBind]
type = TargetBind
trigger1 = AnimElem = 3
SprPriority = 56
pos = ceil(-60*const(size.xscale)), ceil(-15*const(size.yscale))

[State 3032, State End]
type = ChangeState
trigger1 = AnimTime = 0
value = 3033

[Statedef 3033]
type    = A
movetype= A
physics = A
velset = 1.0,-20
anim = 3033

[State 3300]
type = PlaySnd
trigger1 = Time = 0
value = s3300,1

[State 5110, 6]
type = PlaySnd
trigger1 = Time%8 = 0
value = s1,1

[State 3033]
type = SprPriority
trigger1 = AnimElem = 1
value = 3

[State 3303, TargetBind]
type = TargetBind
trigger1 = AnimElem = 1
pos = ceil(-20*const(size.xscale)), ceil(-80*const(size.xscale))

[State 3033, TargetBind]
type = TargetBind
trigger1 = AnimElem = 2
pos = ceil(0*const(size.xscale)), ceil(-80*const(size.xscale))

[State 3033]
type = SprPriority
trigger1 = AnimElem = 3
value = -1

[State 3033, TargetBind]
type = TargetBind
trigger1 = AnimElem = 3
SprPriority = 56
pos = ceil(20*const(size.xscale)), ceil(-80*const(size.yscale))

[State 3033, TargetBind]
type = TargetBind
trigger1 = AnimElem = 4
SprPriority = 56
pos = ceil(0*const(size.xscale)), ceil(-80*const(size.yscale))

[State 3033]
type = ChangeState
trigger1 = Vel Y > 0
value = 3034

;---------------------------------------------------------------------------
—Ž‚¿‚é

[Statedef 3034]
type    = A
movetype= A
physics = A
SprPriority = 3
anim = 3034

[State 3034, TargetBind]
type = TargetBind
trigger1 = 1
pos = ceil(0*const(size.xscale)), ceil(8*const(size.xscale))

[State 3034]
type = ChangeState
trigger1 = Vel Y > 0 && Pos Y >= -10
value = 3035

;---------------------------------------------------------------------------
Œƒ“Ë

[Statedef 3035]
type    = S
movetype= I
physics = N
SprPriority = 3
velset = 0,0
anim = 3034

[State 3030]
type = PlaySnd
trigger1 = Time = 0
value = s3300,2

[State 5110, 6]
type = PlaySnd
trigger1 = Time = 0
value = S6,0

[State -2, Poweradd]
type = TargetPoweradd
trigger1 = Time = 0
value = 60

[State -2, TargetLifeadd]
type = TargetLifeadd
trigger1 = Time = 0
value = -260

[State 3035]
type = PosSet
trigger1 = Time = 0
y = 0

[State 810, Envshake]
type = Envshake
trigger1 = Time = 0
time = 20
freq = 80
ampl = -8

[State 3034, TargetBind]
type = TargetBind
trigger1 = 1
pos = 0, 0

[State 3035]
type = ChangeState
trigger1 = Time = 20
value = 3036

;---------------------------------------------------------------------------
I‚í‚è

[Statedef 3036]
type    = S
movetype= I
physics = N
SprPriority = 0
velset = 0,0
anim = 3035

[State 3000, 4]
type = AfterImage
trigger1 = Time = 0
time = 0

[State 3036]
type = PosSet
trigger1 = Time = 0
y = 0

[State 3036, TargetBind]
type = TargetBind
trigger1 = 1
pos = 1, 0

[State 3036]
type = ChangeState
trigger1 = AnimTime = 0
ctrl = 1
value = 0
[State 3500, 4];Žc‘œ
type = AfterImage
trigger1 = AnimTime = 0
time = 0

;---------------------------------------------------------------------------
;MAX Super 1
[StateDef 3500]
type=S
movetype=A
physics=N
poweradd=-2000
ctrl=0
velset=0,0
sprpriority=1
facep2=1

[State 3500, Anim]
type=changeanim
trigger1=!time
value=3050

[state 3500,Posset]
type=posset
trigger1=!time
y=0

[State 3500, Button Detect]
type = VarSet
trigger1 = !Time
var(10) = 3

[State 3500, Super Cancel Flag]
type = VarSet
trigger1 = !Time
var(21) = ((PrevStateNo = [1000,2999]) && var(7)) || var(20)

[State 3500, Hyper Cancel Flag]
type = VarSet
trigger1 = !Time
var(22) = (PrevStateNo = [3000,4999]) && var(8)

[State 3500, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = !(var(20) := 0)
time = 1

[State 3500, Corner Push]
type = VarSet
trigger1 = Time = 3
fvar(5) = 0

[State 3500, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 40

[State 3500, Super Cancel Flash]
type = PalFX
trigger1 = var(21) || var(22)
trigger1 = !(Time % 2) && Time <= 12
time = 1
add = 255,255,255
ignoreHitPause = 1

[State 3500, Super Cancel Juggle]
type = VarSet
trigger1 = !Time
trigger1 = var(21) || var(22)
var(15) = 0
ignoreHitPause = 1

[State 3500, Super Pause FX]
type = Helper
trigger1 = Time = 1
stateNo = 8510
ID = 8500
name = "Superpause FX"
posType = P1
pos = 3, -104
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3500, Super Pause]
type = SuperPause
trigger1 = Time = 1
time = 40
moveTime = 40
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3500, ƒqƒbƒg’è‹`]
type = HitDef
id = 3500
trigger1 = Time = 0
attr             = S, HA
animtype         = Up
damage           = 40,4
getpower         = 30,10
hitflag		 = MA
guardflag        = MA
priority         = 5
pausetime        = 8,12
sparkno          = s8012
sparkxy = -10 + 0 * (var(35) := 55), var(36) := -82
guard.sparkno    = s8000
hitsound         = s2,3
guardsound       = s3,0
ground.type      = Low
ground.slidetime = 16
ground.hittime   = 19
ground.velocity  = -2.4,-8
guard.velocity   = -7
air.velocity     = -2.4,0
airguard.velocity= -6,-4.5
p2stateno = 3510

[State 3412, 3]
type = NotHitBy
trigger1 = MoveHit
value = SCA
time = 1

[State 3500]
type = ChangeState
trigger1 = (Time > 30)&&(MoveHit)
value = 3501

[State 3500]
type = PlaySnd
trigger1 = Time = 0
value = s3,4

[State 3500, 2]
type = ChangeState
Trigger1 = AnimTime = 0
ctrl = 1
value = 0

;---------------------------------------------------------------------------
ƒqƒbƒgŒã

[Statedef 3501]
type    = S
movetype= A
physics = N
juggle  = 0
ctrl = 0
anim = 40
sprpriority = 2

[State 3412, 3]
type = NotHitBy
Trigger1 = 1
value = SCA
time = 1

[State 3501]
type = ChangeState
trigger1 = AnimTime = 0
value = 3502
;---------------------------------------------------------------------------
”ò‚Ñã‚ª‚è

[Statedef 3502]
type    = A
movetype= A
physics = N
juggle  = 0
velset = -3,-20
ctrl = 0
anim = 41
sprpriority = 2

[State 3412, 3]
type = NotHitBy
Trigger1 = 1
value = SCA
time = 1

[State 3502]
type = ScreenBound
trigger1 = Time = 0
value = 1

[State 3502]
type = ChangeState
trigger1 = Pos Y < -300
value = 3503

;---------------------------------------------------------------------------
‹ó’†’âŽ~A‘¼ƒƒCƒ“ˆ—

[Statedef 3503]
type    = A
movetype= A
physics = N
velset = 0,0
ctrl = 0
sprpriority = 2

[State 3503, 3]
type = NotHitBy
Trigger1 = 1
value = SCA
time = 1

[State 3505, 4];Žc‘œ
type = AfterImage
trigger1 = Time = 0
time = 0

[state 3503]
type = AssertSpecial
trigger1 = Time >= 0
flag = invisible

[state 3503]
type = PosSet
trigger1 = Time = 1
x = Target(3500),Pos X
y = Target(3500),Pos Y

[state 3503]
type = VarSet
trigger1 = Time = 0
v = 20
value = ceil(Target(3500),Pos X)

[state 3503]
type = VarSet
trigger1 = Time = 0
v = 21
value = ceil(Target(3500),Pos Y)

[state 3503, 1]
type = Helper
trigger1 = Time = 350
ID = 3530
pos = ceil(Target(3500),Pos X - Pos X)*Facing - 200, ceil(Target(3500),Pos Y - Pos Y-200);
postype = p1
stateno = 3530
helpertype = normal
name = "colonel kick"
ownpal = 1

[state 3503, 1]
type = Helper
trigger1 = (Time%10 = 0) && (Time < 340)
ID = 3520
pos = ceil((Target(3500),Pos X - Pos X)*Facing + 200*cos(Random)), ceil(Target(3500),Pos Y - Pos Y + 200*sin(Random));
postype = p1
stateno = 3520
helpertype = normal
name = "doll"
ownpal = 1

[state 3503,2]
type = Explod
trigger1 = Var(22) > 0
anim = 8012
ID = 8012
pos = ceil(Target(3500),Pos X - Pos X)*Facing + Random%64-32,ceil(Target(3500),Pos Y - Pos Y) + Random%64-32
postype = P1
sprpriority = 3
ownpal = 1

[state 3503]
type = TargetBind
trigger1 = Time > 13
pos = (Var(20) - Pos X)*Facing + Random%6 - 3, Var(21) - Pos Y + Random%6 - 3

[state 3503,2]
type = PlaySnd
trigger1 = Var(22) > 0
trigger1 = HitCount != 35
value = s2,1

[state 3503,2]
type = PlaySnd
trigger1 = Var(22) > 0
trigger1 = HitCount = 35
value = s2,3200

[state 3503,2]
type = HitAdd
trigger1 = Var(22) > 0
value = 1

[state 3503,2]
type = TargetLifeAdd
trigger1 = Var(22) > 0
kill = (HitCount = 35)
value = ifelse(HitCount = 35,-60,-8)

[state 3503,2]
type = VarSet
trigger1 = Var(22) > 0
v = 22
value = Var(22) - 1

[State 3503]
type = ChangeState
trigger1 = NumHelper(3530)
trigger1 = Helper(3530),StateNo = 3531
value = 3504

;---------------------------------------------------------------------------
ƒ^[ƒQƒbƒg‚ð‚Á”ò‚Î‚µ‚ÄŽ©•ª‚Íƒwƒ‹ƒp[‚ÌˆÊ’u‚ÉˆÚ“®

[Statedef 3504]
type    = A
movetype= A
physics = N
juggle  = 0
ctrl = 0
sprpriority = 2

[State 3412, 3]
type = NotHitBy
Trigger1 = 1
value = SCA
time = 1

[state 3503]
type = AssertSpecial
trigger1 = Time >= 0
flag = invisible

[State 3504]
type = TargetState
trigger1 = Time = 0
trigger1 = NumHelper(3530)
value = 3512

[State 3504]
type = PosSet
trigger1 = NumHelper(3530)
trigger1 = Helper(3530),Pos Y > -10
x = Helper(3530),Pos X
y = 0

[State 3504]
type = ChangeState
trigger1 = NumHelper(3530)
trigger1 = Helper(3530),Pos Y > -10
trigger2 = time = 200
value = 52

;---------------------------------------------------------------------------
‘ŠŽè

[Statedef 3510]
type    = A
movetype= H
physics = N
juggle  = 0
velset = 0,-10
ctrl = 0
sprpriority = 2

[State 3510]
type = ChangeAnim2
trigger1 = Time = 0
value = 3510

[State 3510]
type = ChangeState
trigger1 = Pos Y < -150
value = 3511

;---------------------------------------------------------------------------
‘ŠŽè‚½‚±‰£‚è

[Statedef 3511]
type    = A
movetype= H
physics = N
juggle  = 0
velset = 0,0
ctrl = 0
sprpriority = 2

[State 3511]
type = Null
trigger1 = 1

;---------------------------------------------------------------------------
‘ŠŽè‚Á”ò‚Ô

[Statedef 3512]
type    = A
movetype= H
physics = N
juggle  = 0
velset = -16,16
ctrl = 0
sprpriority = 2

[State 3512]
type = Selfstate
trigger1 = Time = 0
value = 5050

;---------------------------------------------------------------------------
;”ò—ˆ‚·‚élŒ`
[Statedef 3520]
type     = A
movetype = I
physics  = N
ctrl     = 0
SprPriority = 2
anim = 3520

[State 3520, 1]
type = VelSet
trigger1 = time = 0
x = (Root,Var(20)-Pos X)*Facing/6
y = (Root,Var(21)-Pos Y)/6

[State 3520, lŒ`‚Ìƒqƒbƒgƒtƒ‰ƒO]
type = VarSet
trigger1 = Root,Var(20)-Pos X = [-20,20]
trigger1 = Root,Var(21)-Pos Y = [-20,20]
v = 22
value = Var(22) + 1

[State 3520, lŒ`‚Ìƒqƒbƒgƒtƒ‰ƒO]
type = ParentVarSet
trigger1 = Var(22) = 1
v = 22
value = Root,Var(22) + 1

[State 3520, lŒ`‚Ìƒqƒbƒgƒtƒ‰ƒO]
type = VarSet
trigger1 = Var(22) = 1
v = 22
value = 2

[State 3520]
type = AssertSpecial
trigger1 = Time >= 0
flag = noshadow
flag2 = noautoturn
IgnoreHitPause = 1
Persistent = 1

[State 3520]
type = AngleSet
trigger1 = Time = 0
trigger1 = Vel X != 0
value = 90-ceil(atan((Vel Y)/(Vel X))*180/Pi)

[State 3520]
type = AngleDraw
trigger1 = Time >= 0

[State 3520]
type = DestroySelf
trigger1 = Time = 100

;---------------------------------------------------------------------------
;”ò—ˆ‚·‚éƒJ[ƒlƒ‹‚¨‚¶‚³‚ñ
[Statedef 3530]
type     = A
movetype = I
physics  = N
ctrl     = 0
SprPriority = 2
anim = 3501

[State 3530, 1]
type = VelSet
trigger1 = time = 0
x = 15
y = 15

[State 3530, ƒqƒbƒgƒtƒ‰ƒO]
type = VarSet
trigger1 = (Root,Var(20)-Pos X)*Facing = [20,40]
trigger1 = Root,Var(21)-Pos Y = [20,40]
v = 22
value = Var(22) + 1

[State 3530, e‚Ìƒqƒbƒgƒtƒ‰ƒO]
type = ParentVarSet
trigger1 = Var(22) = 1
v = 22
value = Root,Var(22) + 1

[State 3530]
type = ChangeState
trigger1 = Var(22) = 1
value = 3531

;---------------------------------------------------------------------------
;”ò—ˆ‚·‚éƒJ[ƒlƒ‹‚¨‚¶‚³‚ñÕ“ËŒã

[Statedef 3531]
type     = A
movetype = I
physics  = N
ctrl     = 0
velset	 = 0,0
SprPriority = 2
anim = 3502

[State 3531]
type = VelSet
trigger1 = time = 10
x = 15
y = 15

[State 3531]
type = AssertSpecial
trigger1 = Time >= 0
flag = noshadow
flag2 = noautoturn
IgnoreHitPause = 1
Persistent = 1

[State 3531]
type = DestroySelf
trigger1 = Time = 100
trigger2 = Root,StateNo = 52


;------------------------------------------------------------------
; ‘ŠŽè
[Statedef 3310]
type    = S
movetype= H
physics = N
velset = 0,0
ctrl = 0
SprPriority = 1

[State 802, 1]
type = ScreenBound
Trigger1 = 1
value = 1

[State 3310, ChangeAnim2]
type = ChangeAnim2
trigger1 = Time = 1
value = 3310

[State 3310, 12]
type = ChangeState
trigger1 = AnimTime = 0
value = 3311

;------------------------------------------------------------------
; ‘ŠŽè’µ‚Ô
[Statedef 3311]
type    = A
movetype= H
physics = N
SprPriority = 1

[State 5100, 2]
type = ChangeAnim2
trigger1 = time = 1
value = 3311

[State 5100, 12]
type = ChangeState
trigger1 = EnemyNear,Vel Y > 0
value = 3312

;---------------------------------------------------------------------------
; ‘ŠŽè—Ž‚¿‚é
[Statedef 3312]
type    = A
movetype= H
physics = N

[State 3312, 1]
type = ChangeAnim2
trigger1 = time = 0
value = 3312

[State 3312, 6]
type = ChangeState
trigger1 = EnemyNear,Vel Y > 0 && EnemyNear,Pos Y >= -10
value = 3313

;---------------------------------------------------------------------------
; ‘ŠŽèŒƒ“Ë
[Statedef 3313]
type    = L
movetype= H
physics = N

[State 3000, 4]
type = AfterImage
trigger1 = Time = 0
time = 0

[State 3313, 6]
type = SelfState
trigger1 = Time = 20
value = 5110
;-----------------------------------------------
;LVL 3 Super
[StateDef 3200]
type = S
physics = S
moveType = A
ctrl = 0
velSet = 0,0
sprpriority = 1
powerAdd = -3000
faceP2 = 1

[State 3200, Anim]
type=changeanim
trigger1=!time
value=3500

[state 3200,Posset]
type=posset
trigger1=!time
y=0

[State 3000, Super Cancel Flag]
type = varset
trigger1 = !time
var(21) = ((prevstateno = [1000, 2999]) && var(7)) || var(20)

[State 3000, Hyper Cancel Flag]
type = varset
trigger1 = !time
var(22) = (prevstateno = [3000, 4999]) && var(8)

[State 3000, CC Reset]
type = palfx
trigger1 = !time
trigger1 = !(var(20) := 0)
time = 1

[State 3000, Corner Push]
type = varset
trigger1 = time = 3
fvar(5) = 0

[State 3000, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 40

[State 3000, Super Cancel Flash]
type = palfx
trigger1 = var(21) || var(22)
trigger1 = !(time % 2) && time <= 12
time = 1
add = 255, 255, 255
ignorehitpause = 1

[State 3000, Super Cancel Juggle]
type = varset
trigger1 = !time
trigger1 = var(21) || var(22)
var(15) = 0
ignorehitpause = 1

[State 3500, Super Pause FX]
type = Helper
trigger1 = animelem = 1
stateNo = 8520
ID = 8500
name = "Superpause FX"
posType = p1
pos = 11, -63
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3200, Super Pause]
type = SuperPause
trigger1 = animelem = 1
time = 43
moveTime = 43
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3200, Œ©‚¹‚Ä‚ ‚°‚æ‚¤]
type = PlaySnd
trigger1 = Time = 32
value = 2200,0

[state 3200]
type = velset
trigger1 = animelem = 2
x = 11

[State 3200]
type = HitDef
trigger1 = animelem = 2
attr = S, HA
animtype  = hard
damage    = 0,0
getpower = 0,0
hitflag = MAFLD
guardflag = M
pausetime = 4,4
sparkno = s8014;7022
sparkxy = -10 + 0 * (var(35) := 55), var(36) := -82
hitsound   = s2,800;s510,1
guard.sparkno = s8000
guardsound = s3,0;s122,0
ground.type = Low
ground.slidetime = 18
ground.hittime  = 18
ground.velocity = 0,0
air.velocity = -1,-3
fall = 0
air.fall = 1
fall.recover = 0
kill = 0
p2facing = 1
p1stateno = 3202

[state 3200]
type = changestate
trigger1 = time = 60
trigger2 = moveguarded
value = 3201

;---------------------------------------------------------------------------
;ƒ_ƒbƒVƒ…I—¹

[Statedef 3201]
type    = S
movetype= A
physics = S
juggle  = 8
poweradd= 0
velset = 12,0
anim = 3201
sprpriority = 2
ctrl = 0

[State 3201, 4]
type = AfterImage
trigger1 = animtime = 0
time = 0

[state 3201]
type = changestate
trigger1 = animtime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;ƒqƒbƒg

[Statedef 3202]
type    = S
movetype= A
physics = N
juggle  = 8
poweradd= 0
velset = 12,0
anim = 3202
sprpriority = 2
ctrl = 0

[State 3202, 2]
type = TargetBind
trigger1 = 1
pos = 79,-10

[state 3202]
type = targetstate
trigger1 = time = 0
value = 3210

[state 3202]
type = screenbound
trigger1 = time > 500
value = 1

[state 3202]
type = changestate
trigger1 = FrontEdgeBodyDist < 50
trigger2 = facing = 1
trigger2 = NumHelper(7000)
trigger2 = Helper(7000),Pos X - 80 < Pos X
trigger3 = facing = -1
trigger3 = NumHelper(7001)
trigger3 = Helper(7001),Pos X + 80 > Pos X
value = 3203

;---------------------------------------------------------------------------
;•Ç‚É‚ ‚½‚é

[Statedef 3203]
type    = S
movetype= A
physics = N
juggle  = 8
poweradd= 0
velset = 0,0
anim = 3203
sprpriority = 2
ctrl = 0

[State 3203]
type = BGPalfx
trigger1 = 1
time = 3
mul = 0,0,0
under = 2

[State 3203]
type = EnvShake
trigger1 = time = 0
time = 10
ampl = -5
freq = 95
phase = 95

[State 3203]
type = Explod
trigger1 = time = 0
anim = 7002
id = 3020
sprpriority = 2
postype = p1
pos = 62,-68
bindtime = 1
supermove = 0
under = 0

[state 3203]
type = playsnd
trigger1 = time = 0
value  = 6,0

[state 3203]
type = velset
trigger1 = animelem = 2
x = -8

[state 3203]
type = veladd
trigger1 = animelem = 2,>= 0
x = 0.2

[State 3203]
type = Width
trigger1 = time = 0
edge = 75,0

[State 3203]
type = TargetBind
trigger1 = time = 0
pos = 100,0

[state 3203]
type = targetstate
trigger1 = time = 0
value = 3211

[state 3203]
type = changestate
trigger1 = time = 64
value = 3204

;---------------------------------------------------------------------------
;€”õ

[Statedef 3204]
type    = S
movetype= A
physics = N
juggle  = 8
poweradd= 0
velset = 0,0
anim = 3204
sprpriority = 0
ctrl = 0

[State 3206]
type = PalFX
trigger1 = AnimElem = 10
time = 80
add = 0,0,0
sinadd = -255,-255,-255,320

[State 3204]
type = BGPalfx
trigger1 = 1
time = 3
mul = 0,0,0
under = 2

[state 3204, ƒJ[ƒlƒ‹‚Ì^‘]
type = playsnd
trigger1 = animelem = 8
value  = 2200,1

[state 3204]
type = changestate
trigger1 = animelemtime(10) = 80
value = 3205

;---------------------------------------------------------------------------
; “Š±

[Statedef 3205]
type    = S
movetype= A
physics = N
juggle  = 8
poweradd= 0
velset = 0,0
anim = 3205
sprpriority = 0
ctrl = 0

[State 3205]
type = BGPalfx
trigger1 = 1
time = 3
mul = 0,0,0
under = 2

[State 3205]
type = Explod
trigger1 = animelem = 2
trigger2 = animelem = 6
trigger3 = animelem = 10
trigger4 = animelem = 14
trigger5 = animelem = 18
trigger6 = animelem = 22
anim = 8012;7022
id = 3020
sprpriority = 2
postype = p1
pos = 180,-95
bindtime = 1
supermove = 0
under = 0

[State 3205]
type = Explod
trigger1 = animelem = 4
trigger2 = animelem = 8
trigger3 = animelem = 12
trigger4 = animelem = 16
trigger5 = animelem = 20
trigger6 = animtime = 0
trigger7 = animelem = 1
anim = 8012
id = 3020
sprpriority = 2
postype = p1
pos = 175,-45
bindtime = 1
supermove = 0
under = 0

[state 3205]
type = playsnd
trigger1 = animelem = 1
trigger2 = animelem = 5
trigger3 = animelem = 9
trigger4 = animelem = 13
trigger5 = animelem = 17
trigger6 = animelem = 21
trigger7 = animtime = 0
value  = 0,0

[state 3205]
type = playsnd
trigger1 = animelem = 2
trigger2 = animelem = 6
trigger3 = animelem = 10
trigger4 = animelem = 14
trigger5 = animelem = 18
trigger6 = animelem = 22
value  = 2,0

[State 3205]
type = Explod
trigger1 = animelem = 1
trigger2 = animtime = 0
anim = 3230
id = 3020
sprpriority = 2
postype = p1
pos = 180,-65
bindtime = 1
supermove = 0
under = 0

[State 3205]
type = Explod
trigger1 = animelem = 2
anim = 3230
id = 3020
sprpriority = 2
postype = p1
pos = 197,-104
bindtime = 1
supermove = 0
under = 0

[State 3205]
type = Explod
trigger1 = animelem = 3
anim = 3230
id = 3020
sprpriority = 2
postype = p1
pos = 143,-12
bindtime = 1
supermove = 0
under = 0

[State 3205]
type = Explod
trigger1 = animelem = 4
anim = 3230
id = 3020
sprpriority = 2
postype = p1
pos = 187,-44
bindtime = 1
supermove = 0
under = 0

[State 3205]
type = Explod
trigger1 = animelem = 5
anim = 3230
id = 3020
sprpriority = 2
postype = p1
pos = 209,-38
bindtime = 1
supermove = 0
under = 0

[State 3205]
type = Explod
trigger1 = animelem = 6
anim = 3230
id = 3020
sprpriority = 2
postype = p1
pos = 98,-102
bindtime = 1
supermove = 0
under = 0

[State 3205]
type = Explod
trigger1 = animelem = 7
anim = 3230
id = 3020
sprpriority = 2
postype = p1
pos = 164,-25
bindtime = 1
supermove = 0
under = 0

[State 3205]
type = Explod
trigger1 = animelem = 8
anim = 3230
id = 3020
sprpriority = 2
postype = p1
pos = 121,-8
bindtime = 1
supermove = 0
under = 0

[State 3205]
type = Explod
trigger1 = animelem = 9
anim = 3230
id = 3020
sprpriority = 2
postype = p1
pos = 152,-71
bindtime = 1
supermove = 0
under = 0

[State 3205]
type = Explod
trigger1 = animelem = 10
anim = 3230
id = 3020
sprpriority = 2
postype = p1
pos = 172,-116
bindtime = 1
supermove = 0
under = 0

[State 3205]
type = Explod
trigger1 = animelem = 11
anim = 3230
id = 3020
sprpriority = 2
postype = p1
pos = 142,-91
bindtime = 1
supermove = 0
under = 0

[State 3205]
type = Explod
trigger1 = animelem = 12
anim = 3230
id = 3020
sprpriority = 2
postype = p1
pos = 90,-17
bindtime = 1
supermove = 0
under = 0

[State 3205]
type = Explod
trigger1 = animelem = 13
anim = 3230
id = 3020
sprpriority = 2
postype = p1
pos = 132,-43
bindtime = 1
supermove = 0
under = 0

[State 3205]
type = Explod
trigger1 = animelem = 14
anim = 3230
id = 3020
sprpriority = 2
postype = p1
pos = 174,-89
bindtime = 1
supermove = 0
under = 0

[State 3205]
type = Explod
trigger1 = animelem = 15
anim = 3230
id = 3020
sprpriority = 2
postype = p1
pos = 140,-15
bindtime = 1
supermove = 0
under = 0

[State 3205]
type = Explod
trigger1 = animelem = 16
anim = 3230
id = 3020
sprpriority = 2
postype = p1
pos = 214,-61
bindtime = 1
supermove = 0
under = 0

[State 3205]
type = Explod
trigger1 = animelem = 17
anim = 3230
id = 3020
sprpriority = 2
postype = p1
pos = 118,-34
bindtime = 1
supermove = 0
under = 0

[State 3205]
type = Explod
trigger1 = animelem = 18
anim = 3230
id = 3020
sprpriority = 2
postype = p1
pos = 162,-116
bindtime = 1
supermove = 0
under = 0

[State 3205]
type = Explod
trigger1 = animelem = 19
anim = 3230
id = 3020
sprpriority = 2
postype = p1
pos = 152,-42
bindtime = 1
supermove = 0
under = 0

[State 3205]
type = Explod
trigger1 = animelem = 20
anim = 3230
id = 3020
sprpriority = 2
postype = p1
pos = 107,-118
bindtime = 1
supermove = 0
under = 0

[State 3205]
type = Explod
trigger1 = animelem = 21
anim = 3230
id = 3020
sprpriority = 2
postype = p1
pos = 109,-1
bindtime = 1
supermove = 0
under = 0

[State 3205]
type = Explod
trigger1 = animelem = 22
anim = 3230
id = 3020
sprpriority = 2
postype = p1
pos = 130,-92
bindtime = 1
supermove = 0
under = 0


;---------------------[ƒwƒ‹ƒp[]
[state 3205]
type = Helper
trigger1 = time = 1
id = 3020
name = "chicken"
sprpriority = 2
pos = 180,-100
postype = p1
stateno = 3220
helpertype = normal
keyctrl = 0 
ownpal = 1

[state 3205]
type = Helper
trigger1 = time = 4
id = 3020
name = "chicken"
sprpriority = 2
pos = 190,-30
postype = p1
stateno = 3220
helpertype = normal
keyctrl = 0 
ownpal = 1

[state 3205]
type = Helper
trigger1 = time = 2
id = 3020
name = "chicken"
sprpriority = 2
pos = 170,-100
postype = p1
stateno = 3221
helpertype = normal
keyctrl = 0 
ownpal = 1

[state 3205]
type = Helper
trigger1 = time = 5
id = 3020
name = "chicken"
sprpriority = 2
pos = 180,-30
postype = p1
stateno = 3221
helpertype = normal
keyctrl = 0 
ownpal = 1

[state 3205]
type = targetstate
trigger1 = time = 2
value = 3212

[state 3205]
type = hitadd
trigger1 = animelem = 2
trigger2 = animelem = 4
trigger3 = animelem = 6
trigger4 = animelem = 8
trigger5 = animelem = 10
trigger6 = animelem = 12
trigger7 = animelem = 14
trigger8 = animelem = 16
trigger9 = animelem = 18
trigger10= animelem = 20
trigger11= animelem = 22
value  = 1

[state 3205]
type = targetlifeadd
trigger1 = animelem = 2
trigger2 = animelem = 4
trigger3 = animelem = 6
trigger4 = animelem = 8
trigger5 = animelem = 10
trigger6 = animelem = 12
trigger7 = animelem = 14
trigger8 = animelem = 16
trigger9 = animelem = 18
trigger10= animelem = 20
trigger11= animelem = 22
value  = ifelse((time/2)%2 = 0,-6,-7)
kill = 0

[state 3205]
type = changestate
trigger1 = time >= 203
value = 3206

;---------------------------------------------------------------------------
; I‚í‚è

[Statedef 3206]
type    = S
movetype= A
physics = N
juggle  = 8
poweradd= 0
velset = 0,0
anim = 3206
ctrl = 0

[State 3206]
type = BGPalfx
trigger1 = time = 1
time = 1
mul = 0,0,0
under = 2

[State 3206]
type = PalFX
trigger1 = AnimElem = 1
time = 40
add = -255,-255,-255
sinadd = 255,255,255,160

[State 3206]
type = Explod
trigger1 = time = 0
anim = 8012
id = 3020
sprpriority = 2
postype = p1
pos = 180,-65
bindtime = 1
supermove = 0
under = 0

[state 3206]
type = playsnd
trigger1 = time = 1
value = 2,3200

[state 3206]
type = playsnd
trigger1 = animelem = 2
value = 2200,2

[state 3206]
type = Helper
trigger1 = time = 0
id = 3020
name = "chicken"
sprpriority = 2
pos = 180,-60
postype = p1
stateno = 3225
helpertype = normal
keyctrl = 0 
ownpal = 1

[state 3206]
type = targetstate
trigger1 = time = 12
value = 3213

[state 3206]
type = hitadd
trigger1 = time = 1
value  = 1

[state 3206]
type = targetlifeadd
trigger1 = time = 1
value  = -120

[State 3206, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

[Statedef 3210]
type    = A
movetype= H
physics = N
velset = 0,0
sprpriority = 1

[State 3210, 1]
type = ChangeAnim2
Trigger1 = Time = 0
value = 3211

[State 3210];ƒJƒƒ‰ŒÅ’è
type = screenbound
trigger1 = 1
value = 1
movecamera = 1,0

;---------------------------------------------------------------------------
;’@‚«‚Â‚¯‚ç‚ê‚é‘ŠŽè

[Statedef 3211]
type    = A
movetype= H
physics = N
velset = 0,0
sprpriority = 1

[State 3211]
type = ChangeAnim2
Trigger1 = Time = 0
value = 3211

[State 3211];ƒJƒƒ‰ŒÅ’è
type = screenbound
trigger1 = 1
value = 1
movecamera = 0,0

;---------------------------------------------------------------------------
;ƒ`ƒLƒ“‚ð“Š‚°‚Â‚¯‚ç‚ê‚é‘ŠŽè

[Statedef 3212]
type    = A
movetype= H
physics = N
velset = 0,0
sprpriority = 1

[State 3212, 1]
type = DefenceMulset
Trigger1 = 1
value = 1.0

[State 3212, 1]
type = ChangeAnim2
Trigger1 = Time = 1
value = 3212

[State 3212];ƒJƒƒ‰ŒÅ’è
type = screenbound
trigger1 = 1
value = 1
movecamera = 0,0


;---------------------------------------------------------------------------
;‘ŠŽèI‚í‚è

[Statedef 3213]
type    = A
movetype= H
physics = N
velset = -6,-9.5
sprpriority = 1

[State 3213]
type = NotHitBy
trigger1 = 1
value = SCA

[State 3213]
type = ChangeAnim
Trigger1 = Time = 1
value = 5050

[state 3213]
type = changeanim
trigger1 = time= 1
trigger1 = SelfAnimExist(5052) = 1
value = 5052

[state 3213]
type = changeanim
trigger1 = time= 18
trigger1 = SelfAnimExist(5062) = 1
value = 5062

[State 3213]
type = screenbound
trigger1 = 1
value = 1
movecamera = 1

[State 3213]
type = VelAdd
Trigger1 = 1
y = .41

[State 3213] 
type = SelfState
triggerall = Vel Y > 0
trigger1 = Pos Y >= 0
value = 5100
;---------------------------------------------------------------------------
;ƒ`ƒLƒ“1

[Statedef 3220]
type = S
ctrl = 0
anim = 3220
velset = 0,0
movetype = A
physics = S
sprpriority = 2

[State 3220]
type = destroyself
trigger1 = root,stateno != 3205

;---------------------------------------------------------------------------
;ƒ`ƒLƒ“2

[Statedef 3221]
type = S
ctrl = 0
anim = 3221
velset = 0,0
movetype = A
physics = S
sprpriority = 2

[state 3221]
type = changeanim
trigger1 = root,stateno != 3205
trigger1 = anim = 3221
value = 3223

[State 3221]
type = destroyself
trigger1 = animtime = 0
trigger1 = anim = 3223

;---------------------------------------------------------------------------
;ƒ`ƒLƒ“3

[Statedef 3222]
type = S
ctrl = 0
anim = 3222
velset = 0,0
movetype = A
physics = S
sprpriority = 2

[state 3222]
type = changeanim
trigger1 = root,stateno != 3205
trigger1 = anim = 3222
value = 3224

[State 3222]
type = destroyself
trigger1 = animtime = 0
trigger1 = anim = 3224

;---------------------------------------------------------------------------
;ƒ`ƒLƒ“4
[Statedef 3225]
type = S
ctrl = 0
anim = 3225
velset = 0,0
movetype = A
physics = S
sprpriority = 2

[State 3225]
type = destroyself
trigger1 = animtime = 0