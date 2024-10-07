;========================<DRILL CLAW>=============================
;---------------------------------------------------------------------------
; EXSpear Dash L
[Statedef 1350]
type    = A
movetype= A
physics = N
juggle  = 0;ifelse(var(42) & floor(exp(0*ln(2)) + 0.5) ,1,0)
velset = 0,0
ctrl = 0
anim = 1300
poweradd = -500
sprpriority = 2
facep2 = 1

[State 1150, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(5) < 0
value = SCA
time = 1

[State 1150, Custom Combo Juggle Points Reset]
type = VarSet
trigger1 = !Time && var(20)
var(15) = 0
ignoreHitPause = 1

[State 1150, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = var(20) := -1
time = 1

[State 1150, EX Flash]
type = VarSet
trigger1 = !Time
var(25) = 57

[State 1150, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = p1
pos = 25, -55
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1150, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 5

[State 0, PosSet]
type = PosSet
trigger1 = time = 0
trigger1 = pos y > 0
y = 0
ignorehitpause = 1

[State 0, Explod]
type = Explod
trigger1 = time = 0
trigger1 = pos y = 0
anim = 917
ID = 917
pos = 0,0
postype = p1
facing = 1
vfacing = 1
bindtime = 1
vel = 0,0
accel = 0,0
random = 0,0
removetime = -2
scale = const(size.xscale),const(size.yscale)
sprpriority = 3
ownpal = 1

[State 0, Explod]
type = Explod
trigger1 = animelem = 2
anim = 1301
ID = 1301
pos = 80,0
postype = p1
facing = 1
ownpal = 1
ignorehitpause = 1
pausemovetime = var(19)


[State 0, Helper]
type = Helper
trigger1 = animelem = 2
trigger1 = !numhelper(1301)
helpertype = normal
name = "FX"
ID = 1301
stateno = 1301
pos = 0,0
postype = p1
facing = 1
ownpal = 1
ignorehitpause = 1
pausemovetime = var(19)

[State 0, StateTypeSet]
type = StateTypeSet
trigger1 = pos y = 0
statetype = S

[State 0, VelSet]
type = VelSet
trigger1 = animelemtime(2) = 0
x = 10 * (4.0/3.0)

[State 0, VelSet]
type = VelSet
trigger1 = animelemtime(2) > 0
x = ifelse(vel x-(0.28125*(16.0/9.0))<=0,0,vel x-(0.28125*(16.0/9.0)))

[State 0, NotHitBy]
type = NotHitBy
trigger1 = animelemtime(2) >= 0
trigger1 = movetype = A
value = ,NP,SP,HP
time = 2
ignorehitpause = 1

[State 0, VelSet]
type = VelSet
trigger1 = time = 0
y = 0

[State ProRation]
type = VarSet
trigger1 = var(21) = 1
fvar(13) = fvar(13) * 0.85
ignorehitpause = 1

[State 200, 1]
type = PlaySnd
trigger1 = animelem = 2
value = 0, 13
persistent = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 2
value = 3,3
channel = 0
persistent = 0

[State 0, StateTypeSet]
type = StateTypeSet
trigger1 = time = 37
movetype = I

[State 200, 1]
type = HitDef
trigger1 = AnimElemTime(2) >= 0
trigger1 = time <= 37
trigger1 = !movecontact
trigger1 = !movereversed
attr = A, SA
damage = 120, 14
animtype = diagup
guardflag = MA
hitflag = MAFD
pausetime = 8-var(49), 7
sparkno = S901
guard.sparkno = S908
sparkxy = -10, ceil(-70 * const(size.yscale) )
hitsound = S2, 2
guardSound = -1 + 0 * (var(32) := 0)
ground.type = low
ground.slidetime = 16
ground.hittime  = 16
ground.velocity = -6.37806,-17.79009 * (4.0/3.0) * const(size.yscale)
airguard.velocity = -4.99072,1.21875 * const(size.yscale)
air.type = low
air.velocity = -6.37806,-17.79009 * (4.0/3.0) * const(size.yscale)
air.hittime = 37
fall = 1
;air.fall = 1
forcenofall = 1
guard.velocity = -10.18
guard.ctrltime = 16
fall.recovertime = 37;34
yaccel = 0.6875 * (16.0/9.0) * const(size.yscale)
ground.cornerpush.veloff = 0
id = 1300
p2facing = 1
[State this method is superior]
type = TargetState
trigger1 = numtarget(1300)
trigger1 = var(21) = 1
trigger1 = !(target(1300),ishelper) || (PlayerIDExist((target(1300),id)) )
trigger1 = target(1300),statetype!=L
value = ifelse((prevstateno=[600,650])&&sysvar(2)=1,624,500)
ID = 1300
ignorehitpause = 1
[State time to go offscreen]
type = VarSet
triggerall = var(45) = 0
triggerall = prevstateno = [600,650]
triggerall = sysvar(2)=1
trigger1 = numtarget(1300)
trigger1 = var(21) = 1
trigger1 = !(target(1300),ishelper) || (PlayerIDExist((target(1300),id)) )
trigger1 = target(1300),statetype!=L
var(45) = 1

[State 0, ChangeState]
type = ChangeState
trigger1 = animtime = 0;time >= 41
value = ifelse(statetype=A,1303,1302)
ctrl = 0

;---------------------------------------------------------------------------
; Spear Dash L
[Statedef 1300]
type    = A
movetype= A
physics = N
juggle  = 0;ifelse(var(42) & floor(exp(0*ln(2)) + 0.5) ,1,0)
velset = 0,0
ctrl = 0
anim = 1300
poweradd = 35
sprpriority = 2
facep2 = 1

[State 0, PosSet]
type = PosSet
trigger1 = time = 0
trigger1 = pos y > 0
y = 0
ignorehitpause = 1

[State 0, Explod]
type = Explod
trigger1 = time = 0
trigger1 = pos y = 0
anim = 917
ID = 917
pos = 0,0
postype = p1
facing = 1
vfacing = 1
bindtime = 1
vel = 0,0
accel = 0,0
random = 0,0
removetime = -2
scale = const(size.xscale),const(size.yscale)
sprpriority = 3
ownpal = 1

[State 0, Explod]
type = Explod
trigger1 = animelem = 2
anim = 1301
ID = 1301
pos = 80,0
postype = p1
facing = 1
ownpal = 1
ignorehitpause = 1
pausemovetime = var(19)


[State 0, Helper]
type = Helper
trigger1 = animelem = 2
trigger1 = !numhelper(1301)
helpertype = normal
name = "FX"
ID = 1301
stateno = 1301
pos = 0,0
postype = p1
facing = 1
ownpal = 1
ignorehitpause = 1
pausemovetime = var(19)

[State 0, StateTypeSet]
type = StateTypeSet
trigger1 = pos y = 0
statetype = S

[State 0, VelSet]
type = VelSet
trigger1 = animelemtime(2) = 0
x = 10 * (4.0/3.0)

[State 0, VelSet]
type = VelSet
trigger1 = animelemtime(2) > 0
x = ifelse(vel x-(0.28125*(16.0/9.0))<=0,0,vel x-(0.28125*(16.0/9.0)))

[State 0, NotHitBy]
type = NotHitBy
trigger1 = animelemtime(2) >= 0
trigger1 = movetype = A
value = ,NP,SP,HP
time = 2
ignorehitpause = 1

[State 0, VelSet]
type = VelSet
trigger1 = time = 0
y = 0

[State ProRation]
type = VarSet
trigger1 = var(21) = 1
fvar(13) = fvar(13) * 0.85
ignorehitpause = 1

[State 200, 1]
type = PlaySnd
trigger1 = animelem = 2
value = 0, 13
persistent = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 2
value = 3,3
channel = 0
persistent = 0

[State 0, StateTypeSet]
type = StateTypeSet
trigger1 = time = 37
movetype = I

[State 200, 1]
type = HitDef
trigger1 = AnimElemTime(2) >= 0
trigger1 = time <= 37
trigger1 = !movecontact
trigger1 = !movereversed
attr = A, SA
damage = 90, 14
animtype = diagup
guardflag = MA
hitflag = MAFD
pausetime = 8-var(49), 7
sparkno = S901
guard.sparkno = S908
sparkxy = -10, ceil(-70 * const(size.yscale) )
hitsound = S2, 2
guardSound = -1 + 0 * (var(32) := 0)
ground.type = low
ground.slidetime = 16
ground.hittime  = 16
ground.velocity = -6.37806,-17.79009 * (4.0/3.0) * const(size.yscale)
airguard.velocity = -4.99072,1.21875 * const(size.yscale)
air.type = low
air.velocity = -6.37806,-17.79009 * (4.0/3.0) * const(size.yscale)
air.hittime = 37
fall = 1
;air.fall = 1
forcenofall = 1
guard.velocity = -10.18
guard.ctrltime = 16
fall.recovertime = 37;34
yaccel = 0.6875 * (16.0/9.0) * const(size.yscale)
ground.cornerpush.veloff = 0
id = 1300
p2facing = 1
[State this method is superior]
type = TargetState
trigger1 = numtarget(1300)
trigger1 = var(21) = 1
trigger1 = !(target(1300),ishelper) || (PlayerIDExist((target(1300),id)) )
trigger1 = target(1300),statetype!=L
value = ifelse((prevstateno=[600,650])&&sysvar(2)=1,624,500)
ID = 1300
ignorehitpause = 1
[State time to go offscreen]
type = VarSet
triggerall = var(45) = 0
triggerall = prevstateno = [600,650]
triggerall = sysvar(2)=1
trigger1 = numtarget(1300)
trigger1 = var(21) = 1
trigger1 = !(target(1300),ishelper) || (PlayerIDExist((target(1300),id)) )
trigger1 = target(1300),statetype!=L
var(45) = 1

[State 0, ChangeState]
type = ChangeState
trigger1 = animtime = 0;time >= 41
value = ifelse(statetype=A,1303,1302)
ctrl = 0

;---------------------------------------------------------------------------
; FX
[Statedef 1301]
type    = S
movetype= I
physics = N
velset = 0,0
ctrl = 0
anim = (parent,stateno + 1)
sprpriority = 4

[State 0, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 0, DestroySelf]
type = DestroySelf
trigger1 = animtime = 0
trigger2 = parent,anim != 1300
trigger3 = parent,anim != 1350


[State 0, Trans]
type = Trans
trigger1 = 1
trans = add1
ignorehitpause = 1

[State 0, ChangeAnim]
type = ChangeAnim
trigger1 = 1;parent,hitpausetime
value = anim
elem = parent,animelemno(0) - 1;animelemno(0)
ignorehitpause = 1

[State 0, PosAdd]
type = PosAdd
trigger1 = 1
x = parentdist x
y = parentdist y
ignorehitpause = 1

;---------------------------------------------------------------------------
; Ground Recovery state
[Statedef 1302]
type    = S
movetype= I
physics = N
velset = 0,0
ctrl = 0
anim = anim+2

[State 0, ChangeState]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1


