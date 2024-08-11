; _________________________________________
;| Elektrosoldat by Saikou Shiva           |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==============================================================================================
;========================================<NORMAL MOVES>========================================
;==============================================================================================

;---------------------------------------------------------------------------
; Light Punch
[Statedef 200]
type    = S
physics = S
movetype= A
ctrl = 0
velset = 0,0
sprpriority = 1
poweradd = 0
facep2 = 1

[State 200, Anim]
type=changeanim
trigger1=!time
value=200

[State 200,Posset]
type=posset
trigger1=!time
y=0

[State 200, Snd]
type=playsnd
trigger1= !time && random<250
value= 4, 0
channel=0

[State 200, Snd]
type=playsnd
trigger1= !time
value=1,0
channel=1

[State 200, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = !Time
forcenofall = !var(20)
attr = S, NA
hitflag = MAF
guardflag = M
damage = ceil(ifelse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 0
getpower = 72 * !var(20), 36 * !var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
guard.pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
animtype = Light
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 11 + 2 * var(9)
ground.slidetime = 11 + 2 * var(9)
guard.hittime = 11
air.hittime = 120
ground.velocity = ifelse(var(20), -2.01, -4.09), 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -2.41, -4.49)
guard.cornerpush.veloff = 0
air.velocity = -3.01, -4.16
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0 * (var(31) := 0)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8010)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 62), var(36) := -80
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

[State 200, Type]
type=statetypeset
trigger1= animelemtime(3)>=0
movetype=I

[State 200, 5]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Medium Punch
[Statedef 210]
type    = S
physics = S
movetype= A
ctrl = 0
velset = 0,0
sprPriority = 1
powerAdd = 18 * !var(20)
faceP2 = 1

[State 210, Anim]
type=changeanim
trigger1=!time
value=210

[State 210,Posset]
type=posset
trigger1=!time
y=0

[State 210, Snd]
type=playsnd
trigger1= animelem=2 && random<375
value= 4, 1
channel=0

[State 210, Snd]
type=playsnd
trigger1= animelem=2
value=1,1
channel=1

[State 210, Hit]
type=hitdef
trigger1= !var(16) && (var(15)< 1 || var(20))
trigger1= !Time
forcenofall = !var(20)
attr = S,NA
hitflag = MAF
guardflag = M
damage = ceil(ifElse(fvar(11) * 56 < 7, 7, fvar(11) * 56)), 0
getpower = ifelse(!var(13),144,72)*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
guard.pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
animtype = Medium
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 15 + 3*var(9)
ground.slidetime = 15 + 3*var(9)
guard.hittime = 13
air.hittime = 120
ground.velocity = ifElse(var(20), -2.66, -4.51), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -2.66, -4.51)
guard.cornerPush.velOff = 0
air.velocity = -3.04, -4.53
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0*(var(31):=1)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8011)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=56), var(36):=-61
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time=10*var(45)
envshake.ampl=Ifelse(random<=500,-3,3)

[State 200, Type]
type=statetypeset
trigger1= animelemtime(3)>=0
movetype=I

[State 210, 5]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Far Strong Punch
[Statedef 220]
type = S
physics = S
moveType = A
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 18 * !var(20)
facep2 = 1

[State 220, Anim]
type=changeanim
trigger1=!time
value=220

[State 220,Posset]
type=posset
trigger1=!time
y=0

[State 220, Width]
type = Width
trigger1 = animelemtime(2) >= 0
trigger1 = animelemtime(5) <= 0
edge = 10,0
player = 10,0

[State 220, Snd]
type=playsnd
trigger1= animelem=3 && random<500
value= 4, 2
channel=0

[State 220, Snd]
type=playsnd
trigger1= animelem=3
value=1,2
channel=1

[State 220, Hit]
type=hitdef
trigger1= !var(16) && (var(15)< 1 || var(20))
trigger1= !Time
forcenofall = !var(20)
attr = S,NA
hitflag = MAF
guardflag = M
damage = ceil(ifelse(fvar(11)*77<7, 7, fvar(11)*77)), 0
getpower = ifelse(!var(13), 216, 72)*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 18 + 4*var(9)
ground.slidetime = 18 + 4*var(9)
guard.hittime = 16
air.hittime = 120
ground.velocity = ifElse(var(20), -2.86, -3.52), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -2.86, -3.52)
guard.cornerPush.velOff = 0
air.velocity = -3.39, -4.65
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0*(var(31):=2)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8012)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=77), var(36):=-55
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time=12*var(45)
envshake.ampl=Ifelse(random<=500,-4,4)

[State 200, Type]
type=statetypeset
trigger1= animelemtime(5)>=0
movetype=I

[State 220, 5]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Evade Punch
[Statedef 221]
type = S
physics = S
moveType = A
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 18 * !var(20)
facep2 = 1

[State 221, Anim]
type=changeanim
trigger1=!time
value=221

[State 221,Posset]
type=posset
trigger1=!time
y=0

[State 221, Width]
type = Width
trigger1 = animelemtime(2) >= 0
trigger1 = animelemtime(5) <= 0
edge = 10,0
player = 10,0

[State 221, Snd]
type=playsnd
trigger1= animelem=3 && random<500
value= 4, 2
channel=0

[State 221, Snd]
type=playsnd
trigger1= animelem=2
value=1,2
channel=1

[State 221, Hit]
type=hitdef
trigger1= !var(16) && (var(15)< 1 || var(20))
trigger1= !Time
forcenofall = !var(20)
attr = S,NA
hitflag = MAF
guardflag = M
damage = ceil(ifelse(fvar(11)*77<7, 7, fvar(11)*77)), 0
getpower = ifelse(!var(13), 216, 72)*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 18 + 4*var(9)
ground.slidetime = 18 + 4*var(9)
guard.hittime = 18
air.hittime = 120
ground.velocity = ifElse(var(20), -4.86, -10.52), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -4.86, -10.52)
guard.cornerPush.velOff = 0
air.velocity = -5.39, -5.65
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0*(var(31):=2)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8012)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=77), var(36):=-55
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time=12*var(45)
envshake.ampl=Ifelse(random<=500,-4,4)

[State 221, Type]
type=statetypeset
trigger1= animelemtime(4)>=0
movetype=I

[State 221, 5]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Close Strong Punch
[Statedef 225]
type = S
physics = S
moveType = A
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 18 * !var(20)
facep2 = 1

[State 225, Anim]
type=changeanim
trigger1=!time
value=225

[State 225,Posset]
type=posset
trigger1=!time
y=0

[State 225, Snd]
type=playsnd
trigger1= animelem=3 && random<500
value= 4, 2
channel=0

[State 225, Snd]
type=playsnd
trigger1= animelem=2
value=1,2
channel=1

[State 225, Hit]
type=hitdef
trigger1= !var(16) && (var(15)< 1 || var(20))
trigger1= !Time
forcenofall = !var(20)
attr = S,NA
hitflag = MAF
guardflag = M
damage = ceil(ifelse(fvar(11)*77<7, 7, fvar(11)*77)), 0
getpower = ifelse(!var(13), 216, 72)*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 19 + 4*var(9)
ground.slidetime = 18 + 4*var(9)
guard.hittime = 15
air.hittime = 120
ground.velocity = ifElse(var(20), -2.86, -4.52), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -2.86, -4.52)
guard.cornerPush.velOff = 0
air.velocity = -3.39, -4.65
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0*(var(31):=2)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8012)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=46), var(36):=-80
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time=12*var(45)
envshake.ampl=Ifelse(random<=500,-4,4)

[State 225, Type]
type=statetypeset
trigger1= animelemtime(4)>=0
movetype=I

[State 225, 5]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Light Kick
[Statedef 230]
type    = S
physics = S
moveType = A
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 0
facep2 = 1

[State 230, Anim]
type=changeanim
trigger1=!time
value=230

[State 230,Posset]
type=posset
trigger1=!time
y=0

[State 230, Width]
type = Width
trigger1 = animelemtime(3) >= 0
trigger1 = animelemtime(6) <= 0
edge = 20,0
player = 20,0

[State 230, Snd]
type=playsnd
trigger1= animelem = 3 && random<500
value= 4, 0
channel=0

[State 230, Snd]
type=playsnd
trigger1= animelem = 3
value=1,3
channel=1

[State 230, Hit]
type=hitdef
trigger1= !var(16) && (var(15)< 1 || var(20))
trigger1= !Time
forcenofall = !var(20)
attr = S,NA
hitflag = MAF
guardflag = M
damage = ceil(ifelse(fvar(11)*28<7, 7, fvar(11)*28)), 0
getpower = 72*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
guard.pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
animtype = Light
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 14 + 2 * var(9)
ground.slidetime = 13 + 2 * var(9)
guard.hittime = 14
air.hittime = 120
ground.velocity = ifelse(var(20), -2.01, -4.09), 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -2.41, -4.49)
guard.cornerpush.veloff = 0
air.velocity = -3.01, -4.16
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0*(var(31):=3)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8010)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=75), var(36):=-69
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 200, Type]
type=statetypeset
trigger1= animelemtime(4)>=0
movetype=I

[State 230, 5]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Medium Kick
[Statedef 240]
type    = S
physics = S
moveType = A
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 18 * !var(20)
faceP2 = 1

[State 240, Anim]
type=changeanim
trigger1=!time
value=240

[State 240,Posset]
type=posset
trigger1=!time
y=0

[State 240, Width]
type = Width
trigger1 = animelemtime(3) >= 0
trigger1 = animelemtime(7) <= 0
edge = 20,0
player = 20,0

[State 240, Snd]
type=playsnd
trigger1= animelem=3 && random<350
value= 4, 1
channel=0

[State 240, Snd]
type=playsnd
trigger1= animelem=4
value=1,4
channel=1

[State 240, Hit]
type=hitdef
trigger1= !var(16) && (var(15)< 1 || var(20))
trigger1= !Time
forcenofall = !var(20)
attr = S,NA
hitflag = MAF
guardflag = M
damage = ceil(ifelse(fvar(11)*56<7, 7, fvar(11)*56)), 0
getpower = ifelse(!var(13),144,72)*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
guard.pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
animtype = Medium
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 14 + 3*var(9)
ground.slidetime = 14 + 3*var(9)
guard.hittime = 12
air.hittime = 120
ground.velocity = ifElse(var(20), -2.66, -4.51), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -2.66, -4.51)
guard.cornerPush.velOff = 0
air.velocity = -3.01, -4.15
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0*(var(31):=4)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8011)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=92), var(36):=-60
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time=10*var(45)
envshake.ampl=Ifelse(random<=500,-3,3)

[State 200, Type]
type=statetypeset
trigger1= animelemtime(5)>=0
movetype=I

[State 240, 5]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Panzersfaust
[StateDef 245]
type = S
physics = S
moveType = A
anim = 245
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 0
facep2 = 1

[State 245, Voice]
type = PlaySnd
trigger1 = Animelem = 4 && Random < 500
value = 4, 3
channel = 0

[State 245, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 4
value = 1,3
channel = 1

[State 245, Dust Helper]
type = Helper
trigger1 = AnimElem = 2
helperType = Normal
stateNo = 8100
ID = 8100
name = "Panzersfaust Dust"
posType = P1
ownPal = 1

[State 245, StateTypeSet]
type = StateTypeSet
trigger1 = AnimElem = 2
stateType = A
physics = N

[State 251, Velocity]
type = VelSet
trigger1 = AnimElem = 2
x = 3.8
y = -4

[state 245, Gravity]
type = VelAdd
trigger1 = Animelem = 3,>= 0
y = 0.6

[State 245, HitDef]
type = HitDef
trigger1 = AnimElem = 5
forceNoFall = !var(20)
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 6, Hit
damage = ceil(ifElse(fvar(11) * 77 < 7, 7, fvar(11) * 77)), 0
getPower = 72 * !var(20), 36 * !var(20)
givePower = 36, 36
pausetime = ifelse(var(20), 5, 12), ifelse(var(20), 6, 12)
guard.pausetime = ifelse(var(20), 5, 12), ifelse(var(20), 6, 12)
animType = Back
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 6 + 2 * var(9)
ground.slideTime = 6 + 2 * var(9)
guard.hitTime = 12
air.hitTime = 6
ground.velocity = ifElse(var(20), -2.41, -2.49), -6.8
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -4.41, -6.49)
guard.cornerPush.velOff = 0
air.velocity = -2.46, -5.05
air.cornerPush.velOff = 0
yAccel = 0.54
fall = 1
air.fall = 1
fall.recover = 0
hitsound = -1 + 0*(var(31):=5)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8012)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkXY = -10 + 0 * (var(35) := 66), var(36) := -47
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
;envshake.time = 10
;envshake.ampl = 4
;envshake.freq = 50
;fall.envshake.time = ifelse(p2statetype = L,0,9)
;fall.envshake.freq = ifelse(p2statetype = L,0,50)
;fall.envshake.ampl = ifelse(p2statetype = L,0,3)
;fall.envshake.phase = ifelse(p2statetype = L,0,20)
envshake.time=12*var(45)
envshake.ampl=Ifelse(random<=500,-4,4)

[State 245, ChangeState Blocked]
type = ChangeState
trigger1 = MoveGuarded
value = 246

[State 245, ChangeState Hit]
type = ChangeState
trigger1 = Vel Y > 5 && Pos Y >= 5
value = 247

;--------------------------------------------------------------
; Panzersfaust Fall
[Statedef 246]
type     = A
movetype = I
physics  = N
juggle   = 1
poweradd = 30
ctrl     = 0
anim     = 246
sprpriority = 2

[State 246, Velocity]
type = VelSet
trigger1 = time = 0
x = -3
y = -3

[state 246, Gravity]
type = VelAdd
trigger1 = Animelem = 2>= 0
y = 0.6

[State 246, ChangeState Land]
type = ChangeState
trigger1 = Vel Y > 5 && Pos Y >= 5
value = 247

;--------------------------------------------------------------
; Panzersfaust Land
[Statedef 247]
type     = S
movetype = I
physics  = S
juggle   = 1
poweradd = 0
ctrl     = 0
anim     = 247
sprpriority = 2

[State 247, Land Sound]
type = PlaySnd
trigger1 = Time = 0
value = 10, 0

[State 247, Velocity]
type = VelSet
trigger1 = time = 0
x = 0
y = 0

[State 247, PosSet]
type = PosSet
trigger1 = Pos Y >= 0
y = 0

[state 247, Changestate]
type = Changestate
trigger1 = Animtime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Panzerschreck
[Statedef 249]
type    = S
physics = S
moveType = A
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 18 * !var(20)
faceP2 = 1

[State 249, Anim]
type=changeanim
trigger1=!time
value=249

[State 249,Posset]
type=posset
trigger1=!time
y=0

[State 249, Velocity]
type = VelSet
trigger1 = Animelem = 1
x = 10

[State 249, Width]
type = Width
trigger1 = 1
edge = 5,0
player = 5,0

[State 249, Voice]
type = PlaySnd
trigger1 = Animelem = 3 && Random < 200
value = 4, 3
channel=0

[State 249, Snd]
type=playsnd
trigger1= animelem=4
value=1,5
channel=1

[State 249, Hit]
type = HitDef
trigger1 = !var(16) && (var(15) < 2 || var(20))
trigger1 = AnimElem = 4
forceNoFall = !var(20)
attr = S, NA
hitFlag = MAF
guardFlag = M
priority = 4,Hit
damage = ceil(ifElse(fvar(11) * 77 < 7, 7, fvar(11) * 77)), 0
getPower = ifElse(!var(13), 144, 72) * !var(20), 36 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18 + 4 * var(9)
ground.slideTime = 18 + 4 * var(9)
guard.hitTime = 18
air.hitTime = 120
ground.velocity = ifElse(var(20), -4.86, -9.52), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -3.86, -6.52)
guard.cornerPush.velOff = 0
air.velocity = -3.01, -2.15
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recoverTime = 120
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8012)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 69), var(36) := -61
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envshake.time=12*var(45)
envshake.ampl=Ifelse(random<=500,-4,4)
envshake.time=12*var(45)
envshake.ampl=Ifelse(random<=500,-4,4)

[State 249, Type]
type=statetypeset
trigger1= animelemtime(5)>=0
movetype=I

[State 249, 5]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Strong Kick
[Statedef 250]
type = S
physics = S
moveType = A
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 18 * !var(20)
faceP2 = 1

[State 250, Anim]
type=changeanim
trigger1=!time
value=250

[State 250,Posset]
type=posset
trigger1=!time
y=0

[State 250, Width]
type = Width
trigger1 = animelemtime(2) >= 0
trigger1 = animelemtime(7) <= 0
edge = 20,0
player = 20,0

[State 250, Snd]
type=playsnd
trigger1= animelem=3 && random<500
value= 4, 2
channel=0

[State 250, Snd]
type=playsnd
trigger1= animelem=3
value=1,5
channel=1

[State 250, Hit]
type=hitdef
trigger1= !var(16) && (var(15)< 1 || var(20))
trigger1= !Time
forcenofall = !var(20)
attr = S,NA
hitflag = MAF
guardflag = M
damage = ceil(ifelse(fvar(11)*77<7, 7, fvar(11)*77)), 0
getpower = ifelse(!var(13), 216, 72)*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 18 + 4*var(9)
ground.slidetime = 17 + 4*var(9)
guard.hittime = 15
air.hittime = 120
ground.velocity = ifElse(PrevStateNo = 700, -5.46, ifElse(var(20), -2.86, -4.52)), ifElse(PrevStateNo = 700, -8.25, -7)
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -3.86, -4.52)
guard.cornerPush.velOff = 0
air.velocity = -3.06, -4.15
air.cornerPush.velOff = 0
yaccel = 0.58
fall = 1
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0*(var(31):=5)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8012)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=83), var(36):=-105
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time=12*var(45)
envshake.ampl=Ifelse(random<=500,-4,4)

[State 200, Type]
type=statetypeset
trigger1= animelemtime(4)>=0
movetype=I

[State 250, 5]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Crouching Light Punch
[Statedef 400]
type = C
physics = C
moveType = A
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 0
faceP2 = 1

[State 400, Anim]
type=changeanim
trigger1=!time
value=400

[State 400,Posset]
type=posset
trigger1=!time
y=0

[State 400, Snd]
type=playsnd
trigger1= !Time && random<200
value= 4, 0
channel=0

[State 400, Snd]
type=playsnd
trigger1= !time
value=1,0
channel=1

[State 400, Hit]
type=hitdef
trigger1= !var(16) && (var(15)< 1 || var(20))
trigger1= !Time
forcenofall = !var(20)
attr = C,NA
hitflag = MAF
guardflag = M
damage = ceil(ifelse(fvar(11)*21<7, 7, fvar(11)*21)), 0
getpower = 72*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
guard.pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
animtype = Light
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 11 + 2*var(9)
ground.slidetime = 11 + 2*var(9)
guard.hittime = 14
air.hittime = 120
ground.velocity = ifElse(var(20), -2.01, -4.09), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -2.41, -4.49)
guard.cornerPush.velOff = 0
air.velocity = -2.46, -4.25
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0*(var(31):=0)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8010)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=55), var(36):=-55
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 400, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(3) >= 0
moveType = I

[State 400, 5]
type = ChangeState
trigger1 = !AnimTime
value = 11
ctrl = 1

;---------------------------------------------------------------------------
; Crouching Medium Punch
[Statedef 410]
type = C
physics = C
moveType = A
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 18 * !var(20)
faceP2 = 1

[State 410, Anim]
type=changeanim
trigger1=!time
value=410

[State 410,Posset]
type=posset
trigger1=!time
y=0

[State 410, Snd]
type=playsnd
trigger1= !time && random<350
value= 4, 1
channel=0

[State 410, Snd]
type=playsnd
trigger1= !time
value=1,1
channel=1

[State 410, Hit]
type=hitdef
trigger1= !var(16) && (var(15)< 1 || var(20))
trigger1= !Time
forcenofall = !var(20)
attr = C,NA
hitflag = MAF
guardflag = M
damage = ceil(ifelse(fvar(11)*56<7, 7, fvar(11)*56)), 0
getpower = ifelse(!var(13),144,72)*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
guard.pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
animtype = Medium
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 15 + 3*var(9)
ground.slidetime = 15 + 3*var(9)
guard.hittime = 13
air.hittime = 120
ground.velocity = ifElse(var(20), -2.66, -4.51), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -2.66, -4.51)
guard.cornerPush.velOff = 0
air.velocity = -6.46, -5.25
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0*(var(31):=1)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8011)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=47), var(36):=-37
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time=10*var(45)
envshake.ampl=Ifelse(random<=500,-3,3)

[State 410, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(3) >= 0
moveType = I

[State 410, 5]
type = ChangeState
trigger1 = !AnimTime
value = 11
ctrl = 1

;---------------------------------------------------------------------------
; Crouching Strong Punch
[Statedef 420]
type = C
physics = C
moveType = A
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 18 * !var(20)
faceP2 = 1

[State 420, Anim]
type=changeanim
trigger1=!time
value=420

[State 420,Posset]
type=posset
trigger1=!time
y=0

[State 420, Snd]
type=playsnd
trigger1= !time && random<500
value= 4, 2
channel=0

[State 420, Snd]
type=playsnd
trigger1= !time
value=1,2
channel=1

[State 420, Hit]
type=hitdef
trigger1= !var(16) && (var(15)< 1 || var(20))
trigger1= !Time
forcenofall = !var(20)
attr = C,NA
hitflag = MAF
guardflag = M
damage = ceil(ifelse(fvar(11)*77<7, 7, fvar(11)*77)), 0
getpower = ifelse(!var(13), 216, 72)*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
air.animtype = Up
fall.animtype = Up
ground.type = Low
air.type = Low
ground.hittime = 18 + 4*var(9)
ground.slidetime = 18 + 4*var(9)
guard.hittime = 18
air.hittime = 120
ground.velocity=ifelse(var(59)>2,-1,ifElse(var(20), -4.86, -7.52)),ifelse(var(59)>2,-9,0);*(ifelse(!var(20),1,.5)) disabled
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -4.86, -7.52)
guard.cornerPush.velOff = 0
air.velocity = ifelse(var(59)>2,-1,-3.23),ifelse(var(59)>2,-8,-7.73)
air.cornerPush.velOff = 0
yAccel = ifelse(var(59)>2,.3,.58)
fall = 0
fall.recover = 1
fall=ifelse(var(59)>2,1,0)
fall.recovertime = 120
hitsound = -1 + 0*(var(31):=2)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8012)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=46), var(36):=-80
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
forceStand = 1
envshake.time=12*var(45)
envshake.ampl=Ifelse(random<=500,-4,4)

[State 420, End]
type=ChangeState
triggerall=var(59)>2
trigger1 = !AIlevel && command = "holdup" && movecontact
trigger2 = AIlevel && movehit
value=123
ctrl=0

[State 420, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(3) >= 0
moveType = I

[State 420, 5]
type = ChangeState
trigger1 = !AnimTime
value = 11
ctrl = 1

;---------------------------------------------------------------------------
; Crouching Light Kick
[Statedef 430]
type = C
physics = C
moveType = A
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 0
faceP2 = 1

[State 430, Anim]
type=changeanim
trigger1=!time
value=430

[State 430,Posset]
type=posset
trigger1=!time
y=0

[State 430, Width]
type = Width
trigger1 = animelemtime(1) >= 0
trigger1 = animelemtime(4) <= 0
edge = 15,0
player = 15,0

[State 430, Snd]
type=playsnd
trigger1= !time && random<200
value= 4, 0
channel=0
[State 430, Snd]
type=playsnd
trigger1= !time
value=1,3
channel=1

[State 430, Hit]
type=hitdef
trigger1= !var(16) && (var(15)< 1 || var(20))
trigger1=  !Time
forcenofall = !var(20)
attr = C,NA
hitflag = MAF
guardflag = L
damage = ceil(ifelse(fvar(11)*28<7, 7, fvar(11)*28)), 0
getpower = 72*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
guard.pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
animtype = Light
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 19 + 2*var(9)
ground.slidetime = 19 + 2*var(9)
guard.hittime = 18
air.hittime = 120
ground.velocity = ifElse(var(20), -2.41, -4.49), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -2.41, -4.49)
guard.cornerPush.velOff = 0
air.velocity = -6.46, -5.25
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0*(var(31):=3)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8010)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=64), var(36):=-31
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 430, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(3) >= 0
moveType = I

[State 430, 5]
type = ChangeState
trigger1 = !AnimTime
value = 11
ctrl = 1


;---------------------------------------------------------------------------
; Crouching Medium Kick
[Statedef 440]
type = C
physics = C
moveType = A
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 18 * !var(20)
faceP2 = 1

[State 440, Anim]
type=changeanim
trigger1=!time
value=440

[State 440,Posset]
type=posset
trigger1=!time
y=0

[State 440, Width]
type = Width
trigger1 = animelemtime(3) >= 0
trigger1 = animelemtime(6) <= 0
edge = 15,0
player = 15,0

[State 440, Snd]
type=playsnd
trigger1= animelem=2 && random<350
value= 4, 1
channel=0

[State 440, Snd]
type=playsnd
trigger1= animelem=2
value=1,4
channel=1

[State 440, Hit]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 4
forceNoFall = !var(20)
attr = C, NA
hitFlag = MAF
guardFlag = L
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 56 < 7, 7, fvar(11) * 56)), 0
getPower = ifElse(!var(13),144,72) * !var(20), 36 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 5, 10), ifElse(var(20), 5, 10)
guard.pauseTime = ifElse(var(20), 5, 10), ifElse(var(20), 5, 10)
animType = Medium
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 17 + 3 * var(9)
ground.slideTime = 17 + 3 * var(9)
guard.hitTime = 15
air.hitTime = 120
ground.velocity = ifElse(var(20), -3.66, -5.51), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -3.66, -5.51)
guard.cornerPush.velOff = 0
air.velocity = -6.46, -5.25
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recoverTime = 120
hitSound = -1 + 0 * (var(31) := 4)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8011)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 82), var(36) := -10
palFX.time = 12*var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envshake.time=10*var(45)
envshake.ampl=Ifelse(random<=500,-3,3)

[State 440, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(5) >= 0
movetype = I

[State 440, 5]
type = ChangeState
trigger1 = !AnimTime
value = 11
ctrl = 1

;---------------------------------------------------------------------------
; Crouch Strong Kick
[Statedef 450]
type = C
physics = C
moveType = A
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 18 * !var(20)
faceP2 = 1

[State 450, Anim]
type=changeanim
trigger1=!time
value=450

[State 450,Posset]
type=posset
trigger1=!time
y=0

[State 450, Width]
type = Width
trigger1 = animelemtime(2) >= 0
trigger1 = animelemtime(6) <= 0
edge = 15,0
player = 15,0

[State 450, Width]
type = Width
trigger1 = animelemtime(6) >= 1
trigger1 = animelemtime(10) <= 0
edge = 25,0
player = 25,0

[State 450, Snd]
type=playsnd
trigger1= animelem=2 && random<500
value= 4, 1
channel=0

[State 450, Snd]
type=playsnd
trigger1= animelem = 2
trigger2 = animelem = 7
value=1,5
channel=1

[State 450, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 3
attr = C, NA
hitFlag = MAF
guardFlag = L
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 84 < 7, 7, fvar(11) * 84)), 0
getpower = ifElse(!var(13), 216, 72) * !var(20), 36 * !var(20)
givepower = 36, 36
pauseTime = ifElse(var(20), 5, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 5, 12), ifElse(var(20), 6, 12)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Trip
air.type = Trip
ground.hitTime = 18 + 4 * var(9)
ground.slideTime = 18 + 4 * var(9)
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -1, -6.25
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -3.86, -6.52)
guard.cornerPush.velOff = 0
air.velocity = -1, -5.74
air.cornerPush.velOff = 0
yAccel = 0.52
fall = 1
fall.recover = 1
fall.recoverTime = 120
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8012)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 64), var(36) := -31
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envshake.time=12*var(45)
envshake.ampl=Ifelse(random<=500,-4,4)

[State 450, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 2 || var(20))
trigger1 = AnimElem = 7 && !MoveHit
attr = C, NA
hitFlag = MAF
guardFlag = L
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 70 < 7, 7, fvar(11) * 70)), 0
getpower = ifElse(!var(13), 216, 72) * !var(20), 36 * !var(20)
givepower = 36, 36
pauseTime = ifElse(var(20), 5, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 5, 12), ifElse(var(20), 6, 12)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Trip
air.type = Trip
ground.hitTime = 18 + 4 * var(9)
ground.slideTime = 18 + 4 * var(9)
guard.hitTime = 10
air.hitTime = 120
ground.velocity = -1, -6.25
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -4.86, -7.52)
guard.cornerPush.velOff = 0
air.velocity = -3, -4.24
air.cornerPush.velOff = 0
yAccel = 0.677
fall = 1
fall.recover = 1
fall.recoverTime = 120
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8012)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 98), var(36) := -10
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envshake.time=12*var(45)
envshake.ampl=Ifelse(random<=500,-4,4)

[State 450, TargetState]
type = TargetState
trigger1 = MoveHit && NumTarget(450)
value = 455
ID = 450
ignoreHitPause = 1
persistent = 0

[State 450, StateTypeSet: Idle]
type = StateTypeset
trigger1= AnimElemTime(8) >= 0
moveType = I

[State 450, 5]
type = ChangeState
trigger1 = !AnimTime
value = 11
ctrl = 1


;---------------------------------------------------------------------------
; Tripped get-hit (shaking)
[Statedef 455]
type    = A
movetype= H
physics = N
velset = 0,0

[State 5070, 1]
type = ChangeAnim
trigger1 = 1
value = 5070

[State 5070, 2]
type = ChangeState
trigger1 = HitShakeOver
value = 456

[State 5070, 3]
type = ForceFeedback
trigger1 = time = 0
time = 12
waveform = sinesquare
ampl = 140


; Tripped get-hit (knocked away)
[Statedef 456]
type    = A
movetype= H
physics = N

[State 5071, 1]
type = HitVelSet
trigger1 = Time = 0
x = 1
y = 1

[State 5071, 2] ;Acceleration
type = VelAdd
trigger1 = time > 0
y = GetHitVar(yaccel)

[State 5071, 3] ;Hit ground
trigger1 = Vel Y > 0
trigger1 = Pos Y >= Const(movement.air.gethit.trip.groundlevel)
type = SelfState
value = 5110


;---------------------------------------------------------------------------
; Jump Light Punch
[Statedef 600]
type = A
physics = N
moveType = A
ctrl = 0
sprPriority = 1
powerAdd = 0

[State 600, Anim]
type=changeanim
trigger1=!time
value=600

[State 600, Snd]
type=playsnd
trigger1= animelem=2 && random<200
value= 4, 0
channel=0

[State 600, Snd]
type=playsnd
trigger1= animelem=2
value=1,0
channel=1

[State 600, Hit]
type=hitdef
trigger1= (!var(16) && (var(15)<1 || var(20)))||var(59)>2
trigger1 = AnimElem = 3
forcenofall = !var(20)
attr = A,NA
hitflag = MAF
guardflag = HA
damage = ceil(ifelse(fvar(11)*35<7, 7, fvar(11)*35)), 0
getpower = 72*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
guard.pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
animtype = Light
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 12 + 2*var(9)
ground.slidetime = 12 + 2*var(9)
guard.hittime = 12
air.hittime = 120
airguard.ctrltime = 16
ground.velocity = ifElse(var(20), -2.41, -4.49), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -2.41, -4.49)
guard.cornerPush.velOff = 0
air.velocity=Ifelse(var(59)>2,-1,-4),Ifelse(var(59)>2,-4,-7.36)
air.cornerPush.velOff = 0
airguard.velocity = -5, 0
airguard.cornerPush.velOff = 0
yaccel=Ifelse(var(59)>2,.45,.58)
fall = 0
fall.recover = 1
fall.recoverTime = 120
hitsound = -1 + 0*(var(31):=0)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8010)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=53), var(36):=-40
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 620, Type]
type=statetypeset
trigger1= animelemtime(4)>=0
movetype=I

[State 600, Gravity]
type = Gravity
trigger1 = Time >= 0

[State 620, End]
type=changestate
trigger1= pos y>-vel y
value=52

;---------------------------------------------------------------------------
; Jump Medium Punch
[Statedef 610]
type = A
physics  = N
moveType = A
ctrl = 0
sprPriority = 1
powerAdd = 18 * !var(20)

[State 610, Anim]
type=changeanim
trigger1=!time
value=610

[State 610, Snd]
type=playsnd
trigger1= animelem=3 && random<350
value= 4, 1
channel=0

[State 610, Snd]
type=playsnd
trigger1= animelem=3
value=1,1
channel=1

[State 610, Hit]
type=hitdef
trigger1= (!var(16) && (var(15)<1 || var(20)))||var(59)>2
trigger1= animelem=3
forcenofall = !var(20)
attr = A,NA
hitflag = MAF
guardflag = HA
damage = ceil(ifelse(fvar(11)*63<7, 7, fvar(11)*63)), 0
getpower = ifelse(!var(13),144,72)*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
guard.pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
animtype = Medium
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = High
ground.hittime = 12 + 3*var(9)
ground.slidetime = 12 + 3*var(9)
guard.hittime = 15
air.hittime = 120
airguard.ctrltime = 16
ground.velocity = ifElse(var(20), -2.41, -4.49), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -3.66, -7.51)
guard.cornerPush.velOff = 0
air.velocity=Ifelse(var(59)>2,-1,-6.46),Ifelse(var(59)>2,-4,-5.25)
air.cornerPush.velOff = 0
airguard.velocity = -5, 0
airguard.cornerPush.velOff = 0
yaccel=Ifelse(var(59)>2,.45,.58)
fall = 0
fall.recover = 1
fall.recoverTime = 120
air.fall=var(59)>2
hitsound = -1 + 0*(var(31):=1)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8011)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=55), var(36):=-40
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time=10*var(45)
envshake.ampl=Ifelse(random<=500,-3,3)

[State 610, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(4) >= 0
movetype = I

[State 610, Gravity]
type = Gravity
trigger1 = Time >= 0

[State 620, End]
type=changestate
trigger1= pos y>-vel y
value=52

;---------------------------------------------------------------------------
; Jump Strong Punch
[Statedef 620]
type = A
physics = N
moveType = A
ctrl = 0
sprPriority = 1
powerAdd = 18 * !var(20)

[State 620, Anim]
type=changeanim
trigger1=!time
value=620

[State 620, Snd]
type=playsnd
trigger1= animelem=2 && random<500
value= 4, 2
channel=0

[State 620, Snd]
type=playsnd
trigger1= animelem=2
value=1,2
channel=1

[State 620, Hit]
type=hitdef
trigger1= (!var(16) && (var(15)<1 || var(20)))||var(59)>2
trigger1= animelem=3
forcenofall = !var(20)
attr = A,NA
hitflag = MAF
guardflag = HA
damage = ceil(ifelse(fvar(11)*84<7, 7, fvar(11)*84)), 0
getpower = ifelse(!var(13), 216, 72)*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 12 + 4*var(9)
ground.slidetime = 12 + 4*var(9)
guard.hittime = 18
air.hittime = 120
airguard.ctrltime = 16
ground.velocity = ifElse(var(20), -2.41, -4.49), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -4.86, -10.52)
guard.cornerPush.velOff = 0
air.velocity=Ifelse(var(59)>2,-15,-6.46),Ifelse(var(59)>2,15,-5.25)
air.cornerPush.velOff = 0
airguard.velocity = -5, 0
airguard.cornerPush.velOff = 0
yaccel=Ifelse(var(59)>2,.45,.58)
fall = 0
fall.recover = 1
air.fall=var(59)>2
fall.recoverTime = 120
hitsound = -1 + 0*(var(31):=2)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8012)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=55), var(36):=-40
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time=12*var(45)
envshake.ampl=Ifelse(random<=500,-4,4)

[State 620, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(4) >= 0
moveType = I

[State 620, Gravity]
type = Gravity
trigger1 = Time >= 0

[State 620, End]
type=changestate
trigger1= pos y>-vel y
value=52

;---------------------------------------------------------------------------
; Jump Light Kick
[Statedef 630]
type = A
physics = N
moveType = A
ctrl = 0
sprPriority = 1
powerAdd = 0

[State 630, Anim]
type=changeanim
trigger1=!time
value=630

[State 630, Snd]
type=playsnd
trigger1= animelem=2 && random<200
value= 4, 0
channel=0

[State 630, Snd]
type=playsnd
trigger1= animelem=2
value=1,3
channel=1

[State 630, Hit]
type=hitdef
trigger1= (!var(16) && (var(15)<1 || var(20)))||var(59)>2
trigger1 = AnimElem = 2
forcenofall = !var(20)
attr = A,NA
hitflag = MAF
guardflag = HA
damage = ceil(ifelse(fvar(11)*35<7, 7, fvar(11)*35)), 0
getpower = 72*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
guard.pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
animtype = Light
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 12 + 2*var(9)
ground.slidetime = 12 + 2*var(9)
guard.hittime = 12
air.hittime = 120
airguard.ctrltime = 16
ground.velocity = ifElse(var(20), -2.41, -4.49), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -2.41, -4.49)
guard.cornerPush.velOff = 0
air.velocity=Ifelse(var(59)>2,-1,-3.23),Ifelse(var(59)>2,-4,-7.73)
air.cornerPush.velOff = 0
airguard.velocity = -5, 0
airguard.cornerPush.velOff = 0
yaccel=Ifelse(var(59)>2,.45,.58)
fall = 0
fall.recover = 1
fall.recoverTime = 120
hitsound = -1 + 0*(var(31):=3)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8010)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=41), var(36):=-75
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 630, Type]
type=statetypeset
trigger1= animelemtime(4)>=0
movetype=I

[State 630, Gravity]
type = Gravity
trigger1 = Time >= 0

[State 620, End]
type=changestate
trigger1= pos y>-vel y
value=52


;---------------------------------------------------------------------------
; Jump Medium Kick
[Statedef 640]
type = A
physics = N
moveType = A
ctrl = 0
sprPriority = 1
powerAdd = 18 * !var(20)

[State 640, Anim]
type=changeanim
trigger1=!time
value=640

[State 640, Snd]
type=playsnd
trigger1= animelem=2 && random<350
value= 4, 1
channel=0

[State 640, Snd]
type=playsnd
trigger1= animelem=2
value=1,4
channel=1

[State 640, Width]
type = Width
trigger1 = animelemtime(2) >= 0
trigger1 = animelemtime(6) <= 0
edge = 10,0
player = 10,0

[State 640, Hit]
type=hitdef
trigger1= (!var(16) && (var(15)<1 || var(20)))||var(59)>2
trigger1 = AnimElem = 3
forcenofall = !var(20)
attr = A,NA
hitflag = MAF
guardflag = HA
damage = ceil(ifelse(fvar(11)*56<7, 7, fvar(11)*56)), 0
getpower = ifelse(!var(13),144,72)*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
guard.pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
animtype = Medium
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 12 + 3*var(9)
ground.slidetime = 12 + 3*var(9)
guard.hittime = 15
air.hittime = 120
airguard.ctrltime = 16
ground.velocity = ifElse(var(20), -2.41, -4.49), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -3.66, -7.51)
guard.cornerPush.velOff = 0
air.velocity=Ifelse(var(59)>2,-1,-3.23),Ifelse(var(59)>2,-4,-7.73)
air.cornerPush.velOff = 0
airguard.velocity = -5, 0
airguard.cornerPush.velOff = 0
air.fall=var(59)>2
yaccel=Ifelse(var(59)>2,.45,.58)
fall = 0
fall.recover = 1
fall.recoverTime = 120
hitsound = -1 + 0*(var(31):=4)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8011)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=76), var(36):=-71
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time=10*var(45)
envshake.ampl=Ifelse(random<=500,-3,3)

[State 640, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(4) >= 0
movetype = I

[State 640, Gravity]
type = Gravity
trigger1 = Time >= 0

[State 640, End]
type=changestate
trigger1= pos y>-vel y
value=52


;---------------------------------------------------------------------------
; Hubschrauber Forward
[Statedef 641]
type = A
physics = N
moveType = A
ctrl = 0
sprPriority = 1
powerAdd = 18 * !var(20)

[State 641, Anim]
type=changeanim
trigger1=!time
value=641

[State 641, Velocity]
type = VelSet
trigger1 = time = 0
x = 2
y = -5

[State 641, Snd]
type=playsnd
trigger1= animelem=2 && random<650
value= 4, 1
channel=0

[State 641, Snd]
type=playsnd
trigger1= animelem=2
value=1,4
channel=1

[State 641, Hit]
type=hitdef
trigger1= (!var(16) && (var(15)<1 || var(20)))||var(59)>2
trigger1 = AnimElem = 3
forcenofall = !var(20)
attr = A,NA
hitflag = MAF
guardflag = HA
damage = ceil(ifelse(fvar(11)*56<7, 7, fvar(11)*56)), 0
getpower = ifelse(!var(13),144,72)*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
guard.pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
animtype = Medium
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 12 + 3*var(9)
ground.slidetime = 12 + 3*var(9)
guard.hittime = 15
air.hittime = 120
airguard.ctrltime = 16
ground.velocity = ifElse(var(20), -2.41, -4.49), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -3.66, -7.51)
guard.cornerPush.velOff = 0
air.velocity=Ifelse(var(59)>2,-1,-3.23),Ifelse(var(59)>2,-4,-7.73)
air.cornerPush.velOff = 0
airguard.velocity = -5, 0
airguard.cornerPush.velOff = 0
yaccel=Ifelse(var(59)>2,.45,.58)
air.fall=var(59)>2
fall = 0
fall.recover = 1
fall.recoverTime = 120
hitsound = -1 + 0*(var(31):=4)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8011)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=82), var(36):=-79
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time=10*var(45)
envshake.ampl=Ifelse(random<=500,-3,3)

[State 641, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(4) >= 0
movetype = I

[State 641, Gravity]
type = Gravity
trigger1 = Time >= 0

[State 641, End]
type=changestate
trigger1= pos y>-vel y
value=52


;---------------------------------------------------------------------------
; Hubschrauber Back
[Statedef 642]
type = A
physics = N
moveType = A
ctrl = 0
sprPriority = 1
powerAdd = 18 * !var(20)

[State 642, Anim]
type=changeanim
trigger1=!time
value=641

[State 642, Velocity]
type = VelSet
trigger1 = time = 0
x = -2
y = -5

[State 642, Snd]
type=playsnd
trigger1= animelem=2 && random<650
value= 4, 1
channel=0

[State 642, Snd]
type=playsnd
trigger1= animelem=2
value=1,4
channel=1

[State 642, Hit]
type=hitdef
trigger1= (!var(16) && (var(15)<1 || var(20)))||var(59)>2
trigger1 = AnimElem = 3
forcenofall = !var(20)
attr = A,NA
hitflag = MAF
guardflag = HA
damage = ceil(ifelse(fvar(11)*56<7, 7, fvar(11)*56)), 0
getpower = ifelse(!var(13),144,72)*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
guard.pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
animtype = Medium
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 12 + 3*var(9)
ground.slidetime = 12 + 3*var(9)
guard.hittime = 15
air.hittime = 120
airguard.ctrltime = 16
ground.velocity = ifElse(var(20), -2.41, -4.49), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -3.66, -7.51)
guard.cornerPush.velOff = 0
air.velocity=Ifelse(var(59)>2,-1,-3.23),Ifelse(var(59)>2,-4,-7.73)
air.cornerPush.velOff = 0
airguard.velocity = -5, 0
airguard.cornerPush.velOff = 0
yaccel=Ifelse(var(59)>2,.45,.58)
air.fall=var(59)>2
fall = 0
fall.recover = 1
fall.recoverTime = 120
hitsound = -1 + 0*(var(31):=4)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8011)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=82), var(36):=-79
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time=10*var(45)
envshake.ampl=Ifelse(random<=500,-3,3)

[State 642, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(4) >= 0
movetype = I

[State 642, Gravity]
type = Gravity
trigger1 = Time >= 0

[State 642, End]
type=changestate
trigger1= pos y>-vel y
value=52

;---------------------------------------------------------------------------
; Jump Strong Kick
[Statedef 650]
type = A
physics = N
moveType = A
ctrl = 0
sprPriority = 1
powerAdd = 18 * !var(20)

[State 650, Anim]
type=changeanim
trigger1=!time
value=650

[State 650, Snd]
type=playsnd
trigger1= animelem=3 && random<500
value= 4, 2
channel=0

[State 650, Snd]
type=playsnd
trigger1= animelem=3
value=1,5
channel=1

[State 650, Width]
type = Width
trigger1 = animelemtime(4) >= 0
trigger1 = animelemtime(7) <= 0
edge = 10,0
player = 10,0

[State 650, Hit]
type=hitdef
trigger1= (!var(16) && (var(15)<1 || var(20)))||var(59)>2
trigger1= animelem=4
forcenofall = !var(20)
attr = A,NA
hitflag = MAF
guardflag = HA
damage = ceil(ifelse(fvar(11)*98<7, 7, fvar(11)*98)), 0
getpower = ifelse(!var(13), 216, 72)*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 12 + 4*var(9)
ground.slidetime = 12 + 4*var(9)
guard.hittime = 18
air.hittime = 120
airguard.ctrltime = 16
ground.velocity = ifElse(var(20), -2.41, -4.49), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -4.86, -10.52)
guard.cornerPush.velOff = 0
air.velocity=Ifelse(var(59)>2,-15,-6.46),Ifelse(var(59)>2,15,-5.25)
air.cornerPush.velOff = 0
airguard.velocity = -5, 0
airguard.cornerPush.velOff = 0
yaccel=Ifelse(var(59)>2,.45,.58)
air.fall=var(59)>2
fall = 0
fall.recover = 1
fall.recoverTime = 120
hitsound = -1 + 0*(var(31):=5)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8012)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=62), var(36):=-52
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time=12*var(45)
envshake.ampl=Ifelse(random<=500,-4,4)

[State 650, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(5) >= 0
moveType = I

[State 650, Gravity]
type = Gravity
trigger1 = Time >= 0

[State 650, End]
type=changestate
trigger1= pos y>-vel y
value=52

;--------------------------------------------------------------
; Throw Attempt
[StateDef 800]
type = S
physics = S
movetype = A
anim = 800
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 18 * !var(20)
faceP2 = 1

[State 800, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = (command = "kk")

[State 800, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = (Random < 500)

[State 800, Tech Hit Reset]
type = VarSet
trigger1 = 1
var(19) = 0

[State 800, Tech Hit]
type = VarSet
trigger1 = NumEnemy
trigger1 = EnemyNear, StateType != A
trigger1 = (EnemyNear, StateNo = [0,999]) && (EnemyNear, StateNo != [100,119]) && (EnemyNear, StateNo != [200,799])
var(19) = 7

[State 800, AttackDist]
type = AttackDist
trigger1 = 1
value = 0

[State 800, HitDef: PP Throw]
type = HitDef
trigger1 = AnimElem = 2
trigger1 = !var(38)
trigger1 = P2BodyDist x < 50
attr = S, NT
hitFlag = M-
priority = 1, Miss
getPower = 0,0
givePower = 0,0
sparkNo = -1 +0 * (var(33) := 0)
guard.sparkNo = -1 +0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 40), var(36) := -50
hitSound = -1 +0 * (var(31) := 800)
guardSound = -1 +0 * (var(32) := 0)
fall = 1
fall.recover = 1
numHits = 0
p1StateNo = ifElse(command = "holdback", 805, 810)

[State 800, HitDef: KK Throw]
type = HitDef
trigger1 = AnimElem = 2 && var(10)
trigger1 = !var(38)
trigger1 = P2BodyDist x < 50
attr = S, NT
hitFlag = M-
priority = 1, Miss
getPower = 0,0
givePower = 0,0
sparkNo = -1 + 0 * (var(33) := 0)
guard.sparkNo = -1 +0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 40), var(36) := -50
hitSound = -1 +0 * (var(31) := 800)
guardSound = -1 +0 * (var(32) := 0)
fall = 1
fall.recover = 1
numhits = 0
p1StateNo = ifElse(command = "holdback", 805, 820)

[State 800, Voice (Missed)]
type = PlaySnd
trigger1 = AnimElem = 5
value = 5000,0
channel = 0

[State 800, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1,0
channel = 1

[State 800, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(3) >= 0
moveType = I

[State 800, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;--------------------------------------------------------------
;---PLAYER TURNS---
[StateDef 805]
type = S
moveType = A
physics = S
anim = 805
ctrl = 0
sprPriority = 0

[State 805, TargetState]
type = TargetState
trigger1 = !Time && NumTarget
value = 806

[State 805, TargetFacing]
type = TargetFacing
trigger1 = !Time && NumTarget
value = -1

[State 805, Width]
type = Width
trigger1 = 1
edge = 24,24
ignoreHitPause = 1

[State 805, Turn]
type = Turn
trigger1 = AnimElem = 3

[State 805, Facing]
type = TargetFacing
trigger1 = 1
value = -1

[State 805, Tech Hit]
type = ChangeState
trigger1 = NumTarget && var(19)
trigger1 = (Target, command = "holdfwd" || Target, command = "holdback") && Target, command != "holdup" && Target, command != "holddown"
trigger1 = (Target, command = "b" || Target, command = "c" || Target, command = "y" || Target, command = "z")
value = 890

[State 805, Tech Hit Countdown]
type = VarAdd
trigger1 = var(19) > 0
var(19) = -1

[State 805, TargetBind 1]
type = TargetBind
trigger1 = AnimElemTime(2) < 0 || AnimElemTime(4) >= 0
pos = ceil(50 * const(size.xScale)), 0

[State 805, TargetBind 2]
type = TargetBind
trigger1 = AnimElemTime(2) >= 0 && AnimElemTime(4) < 0
pos = ceil(20 * const(size.xScale)), 0

[State 805, SprPriority 1]
type = SprPriority
trigger1 = AnimElemTime(2) < 0 || AnimElemTime(4) >= 0
value = 1

[State 805, SprPriority -1]
type = SprPriority
trigger1 = AnimElemTime(2) >= 0 && AnimElemTime(4)< 0
value = -1

[State 805, End]
type = ChangeState
trigger1 = !NumTarget
value = 0
ctrl = 1

[State 805, End]
type = ChangeState
trigger1 = AnimElemTime(4) >= 0
value = ifElse(var(10), 820, 810)



;---TARGET---
[Statedef 806]
type = S
moveType = H
physics = N
velSet = 0,0
sprPriority = 0

[State 806, Turn]
type = Turn
trigger1 = !Time
trigger1 = NumEnemy
trigger1 = Facing = EnemyNear, Facing
ignoreHitPause = 1

[State 806, NHB]
type=nothitby
trigger1= 1
value=SCA
time=1

[State 806, Anim]
type=changeanim2
trigger1= !time
value=806

[State 806, Camera]
type=screenbound
trigger1= 1
value=0
movecamera=1,1
ignoreHitPause = 1

[State 806, Safety]
type=selfstate
trigger1= time>=60
value= ifelse(pos y<0, 5040, 0)
ctrl=1

;---------------------------------------------------------------
; Grab 1
[StateDef 810]
type = S
physics = N
moveType = A
anim = 810
ctrl = 0
velset = 0,0
sprpriority = 1

[State 810, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 0
ctrl = 1

[State 810, Tech Hit]
type = ChangeState
trigger1 = NumTarget && var(19)
trigger1 = (Target, command = "holdfwd" || Target, command = "holdback")
trigger1 = (Target, command = "b" || Target, command = "c" || Target, command = "y" || Target, command = "z")
value = 890

[State 810, Throw Escape]
type = VarAdd
trigger1 = var(19) > 0
var(19) = -1

[State 810, 2]
type = Playerpush
trigger1 = 1
value = 0

[State 810, TargetState]
type = TargetState
trigger1 = !Time && NumTarget
value = 815

[State 810, TargetFacing]
type = TargetFacing
trigger1 = !Time && NumTarget
value = -1

[State 810, Width]
type = Width
trigger1 = 1
edge = 16,16
player = 16,16

[State 810, TargetBind]
Type = TargetBind
trigger1 = time = 6
Pos = 50, 0

[State 810,]
type = EnvShake
trigger1 = animelem = 4
trigger2 = animelem = 7
trigger3 = animelem = 10
trigger4 = animelem = 13
time = 7
ampl = 3
freq = 50

[State 810, TargetBind]
type = TargetBind
trigger1 = AnimElem = 2, >= 0
trigger1 = AnimElem = 14, < 0
time = 1
pos = 41, 0

[State 810, Hit Sound]
type = PlaySnd
trigger1 = animelem = 4
trigger2 = animelem = 7
trigger3 = animelem = 10
trigger4 = animelem = 13
trigger5 = animelem = 16
value = 2, 3+var(52)*20

[State 810, Voice]
type = PlaySnd
trigger1 = animelem = 4
trigger2 = animelem = 7
trigger3 = animelem = 10
trigger4 = animelem = 13
trigger5 = animelem = 16
value = 4, 2

[State 810, HitAdd]
type = HitAdd
trigger1 = animelem = 4
trigger2 = animelem = 7
trigger3 = animelem = 10
trigger4 = animelem = 13
value = 1

[State 810, LifeAdd]
type = TargetLifeAdd
trigger1 = animelem = 4
trigger2 = animelem = 7
trigger3 = animelem = 10
trigger4 = animelem = 13
value = -14
kill = 0

[State 810, Helper]
type = Helper
trigger1 = animelem = 4
trigger2 = animelem = 7
trigger3 = animelem = 10
trigger4 = animelem = 13
helpertype = normal
name = "HitSpark"
ID = 8010
stateno = 8010
pos = 60, -60
size.xscale = 1
size.yscale = 1
postype = p1
facing = 1
keyctrl = 0
ownpal = 1
supermove
pausemovetime = 99999

[State 810, TargetPowerAdd]
type = TargetPowerAdd
trigger1 = NumTarget && AnimElem = 16
value = 36

[State 810, Power]
type = PowerAdd
trigger1 = NumTarget && AnimElem = 16 && !var(20)
value = 72

[State 810, Hitcount Reset]
type = varset
trigger1 = animtime = 0
var(15) = 0
ignorehitpause = 1

[State 810, Punch Hit]
type=hitdef
trigger1= AnimElem = 16
forcenofall = !var(20)
attr = S, SA
hitflag = MAF
guardflag = MA
damage = 28, 0
getpower = ifelse(!var(13), 216, 72)*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = 10, 10
animtype = Back
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 18 + 4*var(9)
ground.slidetime = 18 + 4*var(9)
guard.hittime = 18
air.hittime = 120
ground.velocity = -2, -10.2
guard.velocity = -6
air.velocity = -3.5, -2
down.velocity = -4, 0
air.cornerPush.velOff = 0
yaccel = 0.62
fall = 1
fall.recover = 0
fall.recovertime = 120
hitsound = -1 + 0*(var(31):=2)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8012)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=81), var(36):=-85
envshake.time = 10
envshake.ampl = 4
envshake.freq = 50
fall.envshake.time = ifelse(p2statetype = L,0,10)
fall.envshake.freq = ifelse(p2statetype = L,0,50)
fall.envshake.ampl = ifelse(p2statetype = L,0,4)
fall.envshake.phase = ifelse(p2statetype = L,0,20)

;[State 810, Zoom pointer]; Disabled due to debug flow
;type = VarSet
;trigger1 = numtarget
;var(10)=target, pos x

[State 810, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;--------------------------------------------------------------
; Grab P2 state
[Statedef 815]
type     = S
movetype = H
physics  = S
juggle   = 1
velset   = 0,0
ctrl     = 0
poweradd = 0
sprpriority = 2

[State 815, ChangeAnim]
Type = ChangeAnim2
trigger1 = time = 0
value = 815

[State 815, ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------
; Grab 2
[StateDef 820]
type = S
physics = N
moveType = A
anim = 820
ctrl = 0
velset = 0,0
sprpriority = 1

[State 820, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 0
ctrl = 1

[State 820, Tech Hit]
type = ChangeState
trigger1 = NumTarget && var(19)
trigger1 = (Target, command = "holdfwd" || Target, command = "holdback")
trigger1 = (Target, command = "b" || Target, command = "c" || Target, command = "y" || Target, command = "z")
value = 890

[State 820, Throw Escape]
type = VarAdd
trigger1 = var(19) > 0
var(19) = -1

[State 820, 2]
type = Playerpush
trigger1 = 1
value = 0

[State 820, TargetState]
type = TargetState
trigger1 = !Time && NumTarget
value = 825

[State 820, TargetFacing]
type = TargetFacing
trigger1 = !Time && NumTarget
value = -1

[State 820, Width]
type = Width
trigger1 = 1
edge = 16,16
player = 16,16

[State 820, TargetBind]
Type = TargetBind
trigger1 = time = 6
Pos = 50, 0

[State 820,]
type = EnvShake
trigger1 = animelem = 4
trigger2 = animelem = 7
trigger3 = animelem = 10
trigger4 = animelem = 13
time = 7
ampl = 3
freq = 50

[State 820, TargetBind]
type = TargetBind
trigger1 = AnimElem = 2, >= 0
trigger1 = AnimElem = 14, < 0
time = 1
pos = 35, 0

[State 820, TargetBind]
type = TargetBind
trigger1 = AnimElem = 15
time = 1
pos = 55, 0

[State 810, Hit Sound]
type = PlaySnd
trigger1 = animelem = 4
trigger2 = animelem = 7
trigger3 = animelem = 10
trigger4 = animelem = 13
value = 2, 3+var(52)*20

[State 810, Voice]
type = PlaySnd
trigger1 = animelem = 4
trigger2 = animelem = 7
trigger3 = animelem = 10
trigger4 = animelem = 13
trigger5 = animelem = 17
value = 4, 2

[State 820, HitAdd]
type = HitAdd
trigger1 = animelem = 4
trigger2 = animelem = 7
trigger3 = animelem = 10
trigger4 = animelem = 13
value = 1

[State 820, LifeAdd]
type = TargetLifeAdd
trigger1 = animelem = 4
trigger2 = animelem = 7
trigger3 = animelem = 10
trigger4 = animelem = 13
value = -28
kill = 0

[State 820, Helper]
type = Helper
trigger1 = animelem = 4
trigger2 = animelem = 7
trigger3 = animelem = 10
trigger4 = animelem = 13
helpertype = normal
name = "HitSpark"
ID = 8010
stateno = 8010
pos = 49, -60
size.xscale = 1
size.yscale = 1
postype = p1
facing = 1
keyctrl = 0
ownpal = 1
supermove
pausemovetime = 99999

[State 820, TargetPowerAdd]
type = TargetPowerAdd
trigger1 = NumTarget && AnimElem = 16
value = 36

[State 820, Power]
type = PowerAdd
trigger1 = NumTarget && AnimElem = 16 && !var(20)
value = 72

[State 820, Kick Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= AnimElem = 17
forcenofall = !var(20)
attr = S, SA
hitflag = MAF
guardflag = MA
damage = 28, 0
getpower = ifelse(!var(13), 216, 72)*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = 10, 10
animtype = Back
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 18 + 4*var(9)
ground.slidetime = 18 + 4*var(9)
guard.hittime = 18
air.hittime = 120
ground.velocity = -4.5, -9
guard.velocity = -6
air.velocity = -3.5, -2
down.velocity = -4, 0
air.cornerPush.velOff = 0
yaccel = 0.61
fall = 1
fall.recover = 0
fall.recovertime = 120
hitsound = -1 + 0*(var(31):=5)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8012)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=81), var(36):=-85
envshake.time = 10
envshake.ampl = 4
envshake.freq = 50
fall.envshake.time = ifelse(p2statetype = L,0,10)
fall.envshake.freq = ifelse(p2statetype = L,0,50)
fall.envshake.ampl = ifelse(p2statetype = L,0,4)
fall.envshake.phase = ifelse(p2statetype = L,0,20)

;[State 820, Zoom pointer]; Disabled due to debug flow
;type = VarSet
;trigger1 = numtarget
;var(10)=target, pos x

[State 820, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;--------------------------------------------------------------
; Grab P2 state
[Statedef 825]
type     = S
movetype = H
physics  = S
juggle   = 1
velset   = 0,0
ctrl     = 0
poweradd = 0
sprpriority = 2

[State 825, ChangeAnim]
Type = ChangeAnim2
trigger1 = time = 0
value = 825

[State 825, ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;--------------------------------------------------------------
; Air Grab Attempt
[StateDef 850]
type = A
physics = N
moveType = A
anim = 850
ctrl = 0
sprPriority = 1
powerAdd = 18 * !var(20)

[State 850, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = (command = "kk")

[State 850, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = (Random < 500)

[State 850, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 1, 851, 850)

[State 850, Tech Hit Reset]
type = VarSet
trigger1 = 1
var(19) = 0

[State 850, AttackDist]
type = AttackDist
trigger1 = 1
value = 0

[State 850, HitDef: PP Throw]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 2
trigger1 = !var(38)
attr = A,NT
hitFlag = AF
priority = 1,Miss
getPower = 0,0
givePower = 0,0
sparkNo = -1 + 0 * (var(33) := 0)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 40), var(36) := -50
hitSound = -1 + 0 * (var(31) := 800)
guardSound = -1 + 0 * (var(32) := 0)
fall = 1
fall.recover = 1
numHits = 0
p1StateNo = 870

[State 850, HitDef: KK Throw]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 2 && var(10)
trigger1 = !var(38)
attr = A,NT
hitFlag = AF
priority = 1,Miss
getPower = 0,0
givePower = 0,0
sparkNo = -1 + 0 * (var(33) := 0)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 40), var(36) := -50
hitSound = -1 + 0 * (var(31) := 800)
guardSound = -1 + 0 * (var(32) := 0)
fall = 1
fall.recover = 1
numHits = 0
p1StateNo = 870

[State 850, Voice (Missed)]
type = PlaySnd
trigger1 = AnimElem = 3
value = 800,0
channel = 0

[State 850, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1,0
channel = 1

[State 850, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(3) >= 0
moveType = I

[State 850, Gravity]
type = Gravity
trigger1 = Time >= 0

[State 850, End]
type = ChangeState
trigger1 = pos y > -vel y
value = 52

;--------------------------------------------------------------
; Back Breaker
[StateDef 870]
type = A
physics = N
moveType = A
anim = 870
ctrl = 0
velSet = 0,0
sprPriority = 1

[State 870, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 51
ctrl = 1

[State 870, Turn]
type = Turn
triggerAll = !Time
trigger1 = !AILevel && command = "holdback"
trigger2 = AILevel && BackEdgeDist < FrontEdgeDist

[State 870, TargetState]
type = TargetState
trigger1 = !Time && NumTarget
value = 875

[State 870, TargetFacing]
type = TargetFacing
trigger1 = Time <= 1
value = -1

[State 870, Width]
type = Width
trigger1 = 1
edge = 32,0

[State 870, TargetBind]
type = TargetBind
trigger1 = NumTarget
pos = ceil(0 * const(size.xScale)), ceil(-210 * const(size.yScale))

[State 870, VelAdd]
type = VelAdd
trigger1 = AnimElemtime(1) >= 0
trigger1 = AnimElemTime(1)<= 11
y = 0.61

[State 870, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(1) > 12
y = 0.72

[State 641, Velocity]
type = VelSet
trigger1 = time = 0
x = 0
y = -5.5

[State 870, Voice]
type = PlaySnd
trigger1 = !Time
value = 870,0
channel = 0

[State 870, End]
type = ChangeState
trigger1 = pos y > -vel y
value = 871

;--------------------------------------------------------------
;Landing
[StateDef 871]
type = S
physics = N
movetype = A
ctrl = 0
anim = 871
velSet = 0,0
sprPriority = 1

[State 871, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 871, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 871, Landing Sound]
type = PlaySnd
trigger1 = !Time
value = 52,0

[State 871, Voice]
type = PlaySnd
trigger1 = NumTarget
trigger1 = AnimElemTime(1) = 4
value = 871,0
channel = 0

[State 871, Impact Sound]
type = PlaySnd
trigger1 = NumTarget && !Time
value = 820,2
channel = 1

[State 871, Hit Sound]
type = PlaySnd
trigger1 = NumTarget && !Time
value = 2,2+var(52)*20
channel = 2

[State 871, EnvShake]
type = EnvShake
trigger1 = NumTarget && !Time
time = 14
ampl = -4
freq = 120

[State 871, Impact Dust]
type = Helper
trigger1 = NumTarget && !Time
helperType = Normal
stateNo = 8110
ID = 8110
name = "Impact Dust"
posType = P1
facing = -1
ownPal = 1

[State 871, Hit Spark]
type = Helper
trigger1 = NumTarget && !Time
helperType = Normal
stateNo = 8012
ID = 8000
name = "Spark"
posType = P1
pos = ceil(30 * const(size.xScale)), ceil(-35 * const(size.yScale))
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
size.xscale = 1
size.yscale = 1
ignoreHitPause = 1

[State 870, TargetBind]
type = TargetBind
trigger1 = NumTarget && !Time
pos = ceil(28 * const(size.xScale)), ceil(-48 * const(size.yScale))

[State 871, Damage]
type = TargetLifeAdd
trigger1 = NumTarget && !Time
value = floor(ifElse(77 * fvar(11) < 7, -7, -77 * fvar(11)))
kill = 1

[State 871, TargetPowerAdd]
type = TargetPowerAdd
trigger1 = NumTarget && !Time
value = 36

[State 871, Power]
type = PowerAdd
trigger1 = NumTarget && !Time && !var(20)
value = 72

[State 871, HitAdd]
type = HitAdd
trigger1 = NumTarget && !Time
value = 1

[State 871, HitCount]
type = VarAdd
trigger1 = NumTarget && !Time
var(13) = 1

;===== Disable for Juggle || Enable for I-Frames =====
;[State 871, Juggle]
;type = VarAdd
;trigger1 = NumTarget && !Time
;var(15) = 1
;ignoreHitPause = 1

;[State 871, Juggle]
;type = VarSet
;trigger1 = NumTarget && !Time
;var(16) = 1
;ignoreHitPause = 1
;=====================================================

[State 871, Throw]
type = TargetState
trigger1 = NumTarget && !Time
value = 876

[State 871, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;--------------------------------------------------------------
;In Air
[StateDef 875]
type = A
moveType = H
physics = N
velSet = 0,0
sprPriority = 0

[State 875, Turn]
type = Turn
trigger1 = NumEnemy
trigger1 = Facing = EnemyNear, Facing
ignoreHitPause = 1

[State 875, ChangeAnim2]
type = ChangeAnim2
trigger1 = !Time
value = 875

[State 875, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
moveCamera = 0,0
ignoreHitPause = 1

;--------------------------------------------------------------
;Finish
[StateDef 876]
type = A
physics = N
movetype = H
ctrl = 0
velSet = 0,0
sprPriority = 2

[State 876, ChangeAnim2]
type = ChangeAnim2
trigger1 = !Time && !SelfAnimExist(5946)
value = 876

[State 876, ChangeAnim]
type = ChangeAnim
trigger1 = !Time && SelfAnimExist(5946)
value = 5946

[State 876, Back Explod]
type = Explod
triggerAll = SelfAnimExist(5946) && SelfAnimExist(5947)
trigger1 = !Time
anim = 5947
ID = 5947
sprPriority = 0
posType = P1
removeTime = 18
bindTime = -1

[State 876, ChangeAnim2]
type = ChangeAnim2
trigger1 = SelfAnimExist(5946)
trigger1 = Time = 18
value = 876
elem = 3

[State 876, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
moveCamera = 1,0
ignoreHitPause = 1

[State 876, VelSet]
type = VelSet
trigger1 = Time = 18
x = -4.5
y = -5.4

[State 876, VelAdd]
type = VelAdd
trigger1 = Time >= 18
y = 0.61

[State 876, Recover]
type = SelfState
trigger1 = Alive
trigger1 = command = "recovery"
trigger1 = vel y > 0 && pos y >= const(movement.air.getHit.groundRecover.ground.threshold)
value = 5200

[State 876, End]
type = SelfState
trigger1 = pos y > -vel y
value = 5100

;--------------------------------------------------------------
; Throw Escape
[StateDef 890]
type = S
physics = N
movetype = I
anim = 5945
ctrl = 0
velset = 0,0
sprPriority = 1

[State 890, TargetBind]
type = TargetBind
trigger1 = !Time && NumTarget
pos = 0,0

[State 890, TargetState]
type = TargetState
trigger1 = !Time && NumTarget
value = 895

[State 890, TargetFacing]
type = TargetFacing
trigger1 = !Time && NumTarget
value = -1

[State 890, PosAdd]
type = PosAdd
trigger1 = !Time
x = 24

[State 890, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1

[State 890, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0
ignoreHitPause = 1

[State 890, SprPriority 1]
type = SprPriority
trigger1 = AnimElemTime(6) >= 0
value = 1

[State 890, SprPriority -1]
type = SprPriority
trigger1 = AnimElemTime(2) <= 0
value = -1

[State 890, PosSet]
type = PosSet
trigger1 = !Time
y = 0

[State 890, VelSet]
type = VelSet
trigger1 = 1
x = -2.425
y = 0

[State 890, Voice]
type = PlaySnd
trigger1 = AnimElem = 2
value = 5000,2
channel = 0

[State 890, Escape Sound]
type = PlaySnd
trigger1= !Time
value = 2,800

[State 890, Throw Escape FX]
type = Helper
trigger1 = !Time
helperType = Normal
stateNo = 8000
ID = 8000
name = "Spark"
PosType = P1
pos = 0, -68
facing = -1
ownPal = 1
size.xScale = 0.5
size.yScale = 0.5
pauseMoveTime = 65535
superMoveTime = 65535

[State 890, End]
type = ChangeState
trigger1 = Time >= 27
value = 0
ctrl = 1

;--------------------------------------------------------------
;Target Escape
[StateDef 895]
type = S
physics = N
moveType = I
ctrl = 0
velSet = 0,0
sprPriority = 1

[State 895, ChangeAnim]
type = ChangeAnim
trigger1= !Time
value = ifElse(SelfAnimExist(5940), 5940, 130)

[State 895, ChangeAnim]
type = ChangeAnim
trigger1 = !Time && !SelfAnimExist(5945) && SelfAnimExist(5940)
value = 5940

[State 895, ChangeAnim]
type = ChangeAnim
trigger1= !Time && !SelfAnimExist(5945) && !SelfAnimExist(5940) && SelfAnimExist(5910)
value = 5910

[State 895, ChangeAnim]
type = ChangeAnim
trigger1 = Time >= 20 && Anim = 130
value = 140

[State 895, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1

[State 895, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0
ignoreHitPause = 1

[State 895, PosSet]
type = PosSet
trigger1 = !Time
y = 0

[State 895, VelSet]
type = VelSet
trigger1 = 1
x = -2.425
y = 0

[State 895, End]
type = SelfState
trigger1 = Time >= 27
value = 0
ctrl = 1