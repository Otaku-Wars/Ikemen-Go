;==============================================================================================
;========================================<SPECIAL MOVES>=======================================
;==============================================================================================
; Bubble Throw
[Statedef 1150]
type    = S
movetype= A
physics = S
ctrl = 0
anim = 1000
poweradd = -500
sprpriority = 2
facep2 = 1
;velset = 0,0


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


[State 0, Explod]
type = Explod
trigger1 = time = 0
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

[State 0, VelSet]
type = VelSet
trigger1 = time = 0
trigger1 = prevstateno != [100,105]
x = 0
[State 0, VelSet]
type = VelSet
trigger1 = time = 0
y = 0

[State 200, 1]
type = PlaySnd
trigger1 = animelem = 2
value = 0, 2

[State 200, 1]
type = PlaySnd
trigger1 = animelem = 2
value = 0, 14

[State 0, Helper]
type = Helper
trigger1 = time = 0
helpertype = normal
name = "FX"
ID = 1001
stateno = 1001
pos = 0,0
postype = p1
facing = 1
ownpal = 1
pausemovetime = var(19)

[State 0, Helper]
type = Helper
trigger1 = animelem = 4
helpertype = normal
name = "BUBBLE BUTT"
ID = 1103
stateno = 1103
pos = ceil(82*const(size.xscale)),ceil(-62*const(size.yscale))
postype = p1
facing = 1
ownpal = 1
pausemovetime = var(19)



[State 0, StateTypeSet]
type = StateTypeSet
trigger1 = animelem = 6
movetype = I


[State 200, 7]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Bubble
[Statedef 1103]
type    = A
movetype= A
physics = N
ctrl = 0
anim = 1004
poweradd = 0
sprpriority = 4
velset = 0,0

[State 0, NotHitBy]
type = NotHitBy
trigger1 = 1
value = ,NA,SA,NT,ST,HT
time = 2
ignorehitpause = 1


[State 0, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 0, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,AA,AP,AT
slot = 0
stateno = 1006
time = -1
forceair = 1
ignorehitpause = 1

[State 0, Helper]
type = Helper
trigger1 = (time%6)=2
helpertype = normal
name = "Trail"
ID = 1008
stateno = 1008
pos = 0,0
postype = p1
facing = -1
ownpal = 1

[State 0, PalFX]
type = PalFX
trigger1 = (time%2)=0
time = 1
add = 0,0,0
mul = 0,256,0
color = 0

[State 0, VelSet]
type = VelSet
trigger1 = animelemtime(2) = 0
x = 10 * (4.0/3.0)

[State 0, VelSet]
type = VelSet
trigger1 = animelemtime(2) > 0
x = ifelse(vel x-(0.28125*(16.0/9.0))<=0,0,vel x-(0.28125*(16.0/9.0)))

[State 200, 1]
type = HitDef
trigger1 = time = 1
attr = S, SP
damage = 102, 7
animtype = hard
guardflag = MA
hitflag = MAF
pausetime = 0,6
sparkno = S1009
guard.sparkno = S908
sparkxy = 0,0
hitsound = S2, 7
guardSound = S3,0
ground.type = High
ground.slidetime = 14
ground.hittime  = 14
ground.velocity = -10.3960536745
guard.velocity = -10.3960536745
airguard.velocity = -4.99536,-0.996088 * const(size.yscale)
air.type = High
air.velocity = -4.99536,-0.996088 * const(size.yscale)
air.hittime = 14;24
;air.fall = 1
guard.ctrltime = 14
fall.recovertime = 14;24
yaccel = 0.6875 * (16.0/9.0) * const(size.yscale)
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
sprpriority = 4
forcenofall = 1

[State 0, ChangeState]
type = ChangeState
trigger1 = movecontact
trigger2 = movereversed
value = ifelse(movehit&&numtarget&&var(0)=0,1104,1009)
ctrl = 0
ignorehitpause = 1

[State 0, DestroySelf]
type = DestroySelf
trigger1 = time > 3
trigger1 = frontedgedist < -42

;---------------------------------------------------------------------------
; GOTCHA
[Statedef 1104]
type    = A
movetype= A
physics = N
ctrl = 0
anim = 1003
poweradd = 0
sprpriority = 4
velset = 0,0

[State ProRation]
type = ParentVarSet
trigger1 = time = 0
fvar(13) = (parent,fvar(13)) * 0.9
;ignorehitpause = 1
persistent = 0

[State 0, PalFX]
type = PalFX
trigger1 = (time%2)=0
time = 1
add = 0,0,0
mul = 0,256,0
color = 0

[State 0, VarSet]
type = VarSet
trigger1 = time = 0
var(0) = 0
[State 0, VarSet]
type = VarSet
trigger1 = time = 0
var(1) = 0

[State 0, VarSet]
type = VarAdd
triggerall = numtarget
triggerall = !(target,ishelper)
triggerall = target,alive
trigger1 = target,command = "x"
trigger2 = target,command = "y"
trigger3 = target,command = "z"
trigger4 = target,command = "a"
trigger5 = target,command = "b"
trigger6 = target,command = "c"
var(0) = 4

[State 0, ChangeState]
type = ChangeState
triggerall = numtarget
;triggerall = target,hitshakeover
triggerall = time >= 8100-var(0)
trigger1 = !(target,ishelper)
trigger2 = PlayerIDExist(target,ID)
;trigger4 = 
value = 1018
ctrl = 0

[State 0, ChangeState]
type = ChangeState
trigger1 = !numtarget
trigger2 = time
trigger2 = numtarget
trigger2 = (target,stateno != 1005) && (target,anim != 5300)
;trigger2 = target,anim != 5300
;trigger2 = (target,anim != [5000,5007]) || (target,time > 6)
trigger3 = numtarget
trigger3 = target,ishelper
;trigger4 = 
value = 1006
ctrl = 0

;[State 0, PlaySnd]
;type = PlaySnd
;trigger1 = time = 0
;value = S0,24

[State , Mr.Freeze]
type = TargetState
triggerall = numtarget
triggerall = time = 0
trigger1 = !(target,ishelper)
trigger2 = PlayerIDExist(target,ID)
value = 1005
;ID = 1400
ignorehitpause = 1
persistent = 0

[State 0, PosAdd]
type = PosAdd
trigger1 = numtarget
x = p2dist x + (target, const(size.mid.pos.x) )
y = p2dist y + (target, const(size.mid.pos.y) )
ignorehitpause = 1

;[State 0, Explod]
;type = Explod
;trigger1 = time = 0
;anim = 1009
;ID = 1009
;pos = 0,0
;postype = p1
;facing = 1
;vfacing = 1
;bindtime = 1
;vel = 0,0
;accel = 0,0
;random = 0,0
;removetime = -2
;pausemovetime = 20
;supermovetime = 20
;scale = 1,1
;sprpriority = 5
;ontop = 1
;ownpal = 1


;---------------------------------------------------------------------------
; Bubble Throw
[Statedef 1100]
type    = S
movetype= A
physics = S
ctrl = 0
anim = 1000
poweradd = 35
sprpriority = 2
facep2 = 1
;velset = 0,0

[State 0, Explod]
type = Explod
trigger1 = time = 0
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

[State 0, VelSet]
type = VelSet
trigger1 = time = 0
trigger1 = prevstateno != [100,105]
x = 0
[State 0, VelSet]
type = VelSet
trigger1 = time = 0
y = 0

[State 200, 1]
type = PlaySnd
trigger1 = animelem = 2
value = 0, 2

[State 200, 1]
type = PlaySnd
trigger1 = animelem = 2
value = 0, 14

[State 0, Helper]
type = Helper
trigger1 = time = 0
helpertype = normal
name = "FX"
ID = 1001
stateno = 1001
pos = 0,0
postype = p1
facing = 1
ownpal = 1
pausemovetime = var(19)

[State 0, Helper]
type = Helper
trigger1 = animelem = 4
helpertype = normal
name = "BUBBLE BUTT"
ID = 1003
stateno = 1003
pos = ceil(82*const(size.xscale)),ceil(-62*const(size.yscale))
postype = p1
facing = 1
ownpal = 1
pausemovetime = var(19)



[State 0, StateTypeSet]
type = StateTypeSet
trigger1 = animelem = 6
movetype = I


[State 200, 7]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

; FX
[Statedef 1001]
type    = S
movetype= I
physics = N
velset = 0,0
ctrl = 0
anim = 1001
sprpriority = 4

[State 0, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 0, DestroySelf]
type = DestroySelf
trigger1 = animtime = 0
trigger2 = parent,anim != 1100
trigger3 = parent,anim != 1150

[State 0, Trans]
type = Trans
trigger1 = 1
trans = add1
ignorehitpause = 1

[State 0, ChangeAnim]
type = ChangeAnim
trigger1 = time = 0
value = parent,anim + 1
ignorehitpause = 1

[State 0, PosAdd]
type = PosAdd
trigger1 = 1
x = parentdist x
y = parentdist y
ignorehitpause = 1

;---------------------------------------------------------------------------
; Bubble
[Statedef 1003]
type    = A
movetype= A
physics = N
ctrl = 0
anim = 1004
poweradd = 0
sprpriority = 4
velset = 0,0

[State 0, NotHitBy]
type = NotHitBy
trigger1 = 1
value = ,NA,SA,NT,ST,HT
time = 2
ignorehitpause = 1


[State 0, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 0, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,AA,AP,AT
slot = 0
stateno = 1006
time = -1
forceair = 1
ignorehitpause = 1

[State 0, Helper]
type = Helper
trigger1 = (time%6)=2
helpertype = normal
name = "Trail"
ID = 1008
stateno = 1008
pos = 0,0
postype = p1
facing = -1
ownpal = 1

[State 0, PalFX]
type = PalFX
trigger1 = (time%2)=0
time = 1
add = 0,0,0
mul = 0,256,0
color = 0

[State 0, VelSet]
type = VelSet
trigger1 = animelemtime(2) = 0
x = 10 * (4.0/3.0)

[State 0, VelSet]
type = VelSet
trigger1 = animelemtime(2) > 0
x = ifelse(vel x-(0.28125*(16.0/9.0))<=0,0,vel x-(0.28125*(16.0/9.0)))

[State 200, 1]
type = HitDef
trigger1 = time = 1
attr = S, SP
damage = 100, 5
animtype = hard
guardflag = MA
hitflag = MAF
pausetime = 0,6
sparkno = S1009
guard.sparkno = S908
sparkxy = 0,0
hitsound = S2, 7
guardSound = S3,0
ground.type = High
ground.slidetime = 14
ground.hittime  = 14
ground.velocity = -10.3960536745
guard.velocity = -10.3960536745
airguard.velocity = -4.99536,-0.996088 * const(size.yscale)
air.type = High
air.velocity = -4.99536,-0.996088 * const(size.yscale)
air.hittime = 14;24
;air.fall = 1
guard.ctrltime = 14
fall.recovertime = 14;24
yaccel = 0.6875 * (16.0/9.0) * const(size.yscale)
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
sprpriority = 4
forcenofall = 1

[State 0, ChangeState]
type = ChangeState
trigger1 = movecontact
trigger2 = movereversed
value = ifelse(movehit&&numtarget&&var(0)=0,1004,1009)
ctrl = 0
ignorehitpause = 1

[State 0, DestroySelf]
type = DestroySelf
trigger1 = time > 3
trigger1 = frontedgedist < -42

;---------------------------------------------------------------------------
; GOTCHA
[Statedef 1004]
type    = A
movetype= A
physics = N
ctrl = 0
anim = 1003
poweradd = 0
sprpriority = 4
velset = 0,0

[State ProRation]
type = ParentVarSet
trigger1 = time = 0
fvar(13) = (parent,fvar(13)) * 0.9
;ignorehitpause = 1
persistent = 0

[State 0, PalFX]
type = PalFX
trigger1 = (time%2)=0
time = 1
add = 0,0,0
mul = 0,256,0
color = 0

[State 0, VarSet]
type = VarSet
trigger1 = time = 0
var(0) = 0
[State 0, VarSet]
type = VarSet
trigger1 = time = 0
var(1) = 0

[State 0, VarSet]
type = VarAdd
triggerall = numtarget
triggerall = !(target,ishelper)
triggerall = target,alive
trigger1 = target,command = "x"
trigger2 = target,command = "y"
trigger3 = target,command = "z"
trigger4 = target,command = "a"
trigger5 = target,command = "b"
trigger6 = target,command = "c"
var(0) = 4

[State 0, ChangeState]
type = ChangeState
triggerall = numtarget
;triggerall = target,hitshakeover
triggerall = time >= 81-var(0)
trigger1 = !(target,ishelper)
trigger2 = PlayerIDExist(target,ID)
;trigger4 = 
value = 1018
ctrl = 0

[State 0, ChangeState]
type = ChangeState
trigger1 = !numtarget
trigger2 = time
trigger2 = numtarget
trigger2 = (target,stateno != 1005) && (target,anim != 5300)
;trigger2 = target,anim != 5300
;trigger2 = (target,anim != [5000,5007]) || (target,time > 6)
trigger3 = numtarget
trigger3 = target,ishelper
;trigger4 = 
value = 1006
ctrl = 0

;[State 0, PlaySnd]
;type = PlaySnd
;trigger1 = time = 0
;value = S0,24

[State , Mr.Freeze]
type = TargetState
triggerall = numtarget
triggerall = time = 0
trigger1 = !(target,ishelper)
trigger2 = PlayerIDExist(target,ID)
value = 1005
;ID = 1400
ignorehitpause = 1
persistent = 0

[State 0, PosAdd]
type = PosAdd
trigger1 = numtarget
x = p2dist x + (target, const(size.mid.pos.x) )
y = p2dist y + (target, const(size.mid.pos.y) )
ignorehitpause = 1

;[State 0, Explod]
;type = Explod
;trigger1 = time = 0
;anim = 1009
;ID = 1009
;pos = 0,0
;postype = p1
;facing = 1
;vfacing = 1
;bindtime = 1
;vel = 0,0
;accel = 0,0
;random = 0,0
;removetime = -2
;pausemovetime = 20
;supermovetime = 20
;scale = 1,1
;sprpriority = 5
;ontop = 1
;ownpal = 1

;---------------------------------------------------------------------------
; AW SHIT
[Statedef 1005]
type    = A
movetype= H
physics = N
velset = 0,0
ctrl = 0

[State 0, ChangeAnim]
type = ChangeAnim
trigger1 = time = 0
value = 5002
ignorehitpause = 1

[State 0, ChangeAnim]
type = ChangeAnim
trigger1 = time < 6
trigger1 = animtime = 0
trigger1 = anim = 5002
value = 5007

[State 0, ChangeAnim]
type = ChangeAnim
trigger1 = time >= 6
trigger1 = anim != 5300
value = 5300

[State 0, ChangeAnim]
type = ChangeAnim
triggerall = alive
triggerall = anim = 5300
;triggerall = animelemtime(animelemno(0)) >= 1
;triggerall = animelemno(0) != AnimElemNo(-1*(Animtime+1))
trigger1 = command = "x"
trigger2 = command = "y"
trigger3 = command = "z"
trigger4 = command = "a"
trigger5 = command = "b"
trigger6 = command = "c"
value = anim
elem = ifelse(animelemno(2)<animelemno(0),animelemno(2),animelemno(0)+1)
ignorehitpause = 1


[State 0, Gravity]
type = VelAdd
trigger1 = pos y < 0
y = 0.4
[State 0, STOP]
type = VelSet
trigger1 = pos y >= 0
trigger1 = vel y > 0
y = 0
[State 0, STOP]
type = PosSet
trigger1 = pos y > 0
y = 0
[State 0, StateTypeSet]
type = StateTypeSet
trigger1 = pos y >= 0
statetype = S
physics = S
persistent = 0
[State 0, HitFallSet]
type = HitFallSet
trigger1 = statetype = S
value = 0

[State 0, SelfState]
type = SelfState
trigger1 = time >= 160
value = ifelse(alive,0,5050)
ctrl = ifelse(alive,1,0)

;---------------------------------------------------------------------------
; FREE
[Statedef 1025]
type    = A
movetype= H
physics = N
velset = 0,0
ctrl = 0

[State 0, STOP]
type = VelSet
trigger1 = pos y >= 0
trigger1 = vel y > 0
y = 0
[State 0, STOP]
type = PosSet
trigger1 = pos y >= 0
y = 0
[State 0, StateTypeSet]
type = StateTypeSet
trigger1 = pos y >= 0
statetype = S
physics = S
persistent = 0
[State 0, HitFallSet]
type = HitFallSet
trigger1 = statetype = S
value = 0

[State 0, SelfState]
type = SelfState
trigger1 = 1
value = ifelse(alive,ifelse(statetype=A,5040,0),5050)
ctrl = ifelse(alive,1,0)

;---------------------------------------------------------------------------
; POP
[Statedef 1006]
type    = A
movetype= I
physics = N
ctrl = 0
anim = 9741
poweradd = 0
sprpriority = 4
velset = 0,0

[State 0, Helper]
type = Helper
trigger1 = time = [0,5]
helpertype = normal
name = "Boba Fett"
ID = 1007
stateno = 1007
pos = 0,0
postype = p1
facing = ifelse(random<500,-1,1)
ownpal = 1
pausemovetime = parent,var(19)

[State 0, Helper]
type = Helper
trigger1 = time = [4,8]
helpertype = normal
name = "Bubbles"
ID = 1008
stateno = 1008
pos = 0,0
postype = p1
facing = ifelse(random<500,-1,1)
ownpal = 1
pausemovetime = parent,var(19)


[State 0, DestroySelf]
type = DestroySelf
trigger1 = time > 9

;---------------------------------------------------------------------------
; FREE
[Statedef 1018]
type    = A
movetype= I
physics = N
ctrl = 0
anim = 9741
poweradd = 0
sprpriority = 4
velset = 0,0

[State , Mr.Freeze]
type = TargetState
triggerall = numtarget
triggerall = time = 0
trigger1 = !(target,ishelper)
trigger2 = PlayerIDExist(target,ID)
value = 1025
;ID = 1400
ignorehitpause = 1
persistent = 0

[State 0, ChangeState]
type = ChangeState
trigger1 = 1
value = 1006
ctrl = 0


;---------------------------------------------------------------------------
; NOPE
[Statedef 1009]
type    = A
movetype= I
physics = N
ctrl = 0
anim = 9741
poweradd = 0
sprpriority = 4
velset = 0,0

[State 0, DestroySelf]
type = DestroySelf
trigger1 = time

;---------------------------------------------------------------------------
; Small Bubble
[Statedef 1007]
type    = A
movetype= I
physics = N
ctrl = 0
anim = 1005
poweradd = 0
sprpriority = 1
velset = 0,0

[State 0, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 0, PalFX]
type = PalFX
trigger1 = (time%2)=0
time = 1
add = 0,0,0
mul = 0,256,0
color = 0

[State 0, VarSet]
type = VarSet
trigger1 = time = 0
fvar(0) = 100+random%333
[State 0, VarSet]
type = VarSet
trigger1 = time = 0
fvar(1) = -200+random%400

[State 0, VelSet]
type = VelSet
trigger1 = time = 0
x = fvar(0)/100
y = fvar(1)/100

[State 0, VelSet]
type = VelSet
trigger1 = time
x = vel x * 0.94
y = vel y * 0.94

[State 0, DestroySelf]
type = DestroySelf
trigger1 = time >= 30

;---------------------------------------------------------------------------
; Smaller Bubble
[Statedef 1008]
type    = A
movetype= I
physics = N
ctrl = 0
anim = 1006
poweradd = 0
sprpriority = 2
velset = 0,0

[State 0, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 0, PalFX]
type = PalFX
trigger1 = (time%2)=1
time = 1
add = 0,0,0
mul = 0,256,0
color = 0

[State 0, VarSet]
type = VarSet
trigger1 = time = 0
fvar(0) = 100+random%200
[State 0, VarSet]
type = VarSet
trigger1 = time = 0
fvar(1) = -100+random%200

[State 0, VelSet]
type = VelSet
trigger1 = time = 0
x = fvar(0)/100
y = fvar(1)/100

[State 0, VelSet]
type = VelSet
trigger1 = time
x = vel x * 0.97
y = vel y * 0.97

[State 0, DestroySelf]
type = DestroySelf
trigger1 = time >= 28

;---------------------------------------------------------------------------
; Crouch MSH Hard Punch
[Statedef 1000]
type    = C
movetype= A
physics = C
juggle  = 0;ifelse(var(42) & floor(exp(2*ln(2)) + 0.5) ,1,0)
;velset = 0,0
ctrl = 0
anim = 425
poweradd = 55
sprpriority = 2
facep2 = 1

[State 0, VelSet]
type = VelSet
trigger1 = time = 0
trigger1 = prevstateno != [100,105]
trigger2 = movecontact
x = 0
[State 0, VelSet]
type = VelSet
trigger1 = time = 0
y = 0

[State 0, Helper]
type = Helper
trigger1 = time = 0
trigger1 = !numhelper(426)
helpertype = normal
name = "FX"
ID = 426
stateno = 426
pos = 0,0
postype = p1
facing = 1
ownpal = 1
ignorehitpause = 1
pausemovetime = var(19)

[State ProRation]
type = VarSet
trigger1 = var(21) = 1
fvar(13) = fvar(13) * 0.91
ignorehitpause = 1

[State 200, 1]
type = PlaySnd
trigger1 = animelem = 2
value = 0, 2

[State 200, 1]
type = PlaySnd
trigger1 = animelem = 3
value = 0, 10

; 4,3,3,2,3,2
[State 200, 1]
type = HitDef
trigger1 = animelem = 3
trigger2 = animelem = 4
trigger3 = animelem = 5
trigger4 = animelem = 6
trigger5 = animelem = 7
trigger6 = animelem = 8
attr = C, NA
damage = 48,0
getPower = ifElse(!var(13), 216, 72) * (!var(14) && !var(20)), 36 * (!var(14) && !var(20))
givePower = 36, 36
animtype = hard
guardflag = MA
hitflag = MAF
pausetime = 10-var(49), 9
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 212), var(36) := -52
hitsound = S2, 2
guardSound = S3,0
ground.type = low
ground.slidetime = 17
ground.hittime  = 17
ground.velocity = -7.168238299
guard.velocity = -7.168238299
airguard.velocity =  -4.99072,1.21875 * (4.0/3.0) * const(size.yscale)
air.type = low
air.velocity = -10.47063,-4.51699 * (4.0/3.0) * const(size.yscale)
air.hittime = 17;26
;air.fall = 1
guard.ctrltime = 15
fall.recovertime = 17;26
yaccel = 0.6875 * (16.0/9.0) * const(size.yscale)
ground.cornerpush.veloff = 0
sprpriority = 2
p2facing = 1
envshake.time = 14
envshake.ampl = 4
envShake.freq = 120

[State 0, StateTypeSet]
type = StateTypeSet
trigger1 = animelem = 11
movetype = I

[State 200, 7]
type = ChangeState
trigger1 = AnimTime = 0
value = 11
ctrl = 1


;---------------------------------------------------------------------------
; Crouch MSH Hard Punch
[Statedef 1050]
type    = C
movetype= A
physics = C
juggle  = 0;ifelse(var(42) & floor(exp(2*ln(2)) + 0.5) ,1,0)
;velset = 0,0
ctrl = 0
anim = 425
poweradd = -500
sprpriority = 2
facep2 = 1

[State 1050, NotHitBy]
type = NotHitBy
trigger1 = Anim = 1000
value = SCA
time = 1

[State 1050, Custom Combo Juggle Points Reset]
type = VarSet
trigger1 = !Time && var(20)
var(15) = 0
ignoreHitPause = 1

[State 1050, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = var(20) := -1
time = 1

[State 1050, EX Flash]
type = VarSet
trigger1 = !Time
var(25) = 72

[State 1050, EX FX]
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

[State 1050, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 5

[State 0, VelSet]
type = VelSet
trigger1 = time = 0
trigger1 = prevstateno != [100,105]
trigger2 = movecontact
x = 0
[State 0, VelSet]
type = VelSet
trigger1 = time = 0
y = 0

[State 0, Helper]
type = Helper
trigger1 = time = 0
trigger1 = !numhelper(426)
helpertype = normal
name = "FX"
ID = 426
stateno = 426
pos = 0,0
postype = p1
facing = 1
ownpal = 1
ignorehitpause = 1
pausemovetime = var(19)

[State ProRation]
type = VarSet
trigger1 = var(21) = 1
fvar(13) = fvar(13) * 0.91
ignorehitpause = 1

[State 200, 1]
type = PlaySnd
trigger1 = animelem = 2
value = 0, 2

[State 200, 1]
type = PlaySnd
trigger1 = animelem = 3
value = 0, 10

; 4,3,3,2,3,2
[State 200, 1]
type = HitDef
trigger1 = animelem = 3
trigger2 = animelem = 4
trigger3 = animelem = 5
trigger4 = animelem = 6
trigger5 = animelem = 7
trigger6 = animelem = 8
attr = C, NA
damage = 50,0
getPower = ifElse(!var(13), 216, 72) * (!var(14) && !var(20)), 36 * (!var(14) && !var(20))
givePower = 36, 36
animtype = hard
guardflag = MA
hitflag = MAF
pausetime = 10-var(49), 9
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 212), var(36) := -52
hitsound = S2, 2
guardSound = S3,0
ground.type = low
ground.slidetime = 17
ground.hittime  = 17
ground.velocity = -7.168238299
guard.velocity = -7.168238299
airguard.velocity =  -4.99072,1.21875 * (4.0/3.0) * const(size.yscale)
air.type = low
air.velocity = -10.47063,-4.51699 * (4.0/3.0) * const(size.yscale)
air.hittime = 17;26
;air.fall = 1
guard.ctrltime = 15
fall.recovertime = 17;26
yaccel = 0.6875 * (16.0/9.0) * const(size.yscale)
ground.cornerpush.veloff = 0
sprpriority = 2
p2facing = 1
envshake.time = 14
envshake.ampl = 4
envShake.freq = 120

[State 0, StateTypeSet]
type = StateTypeSet
trigger1 = animelem = 11
movetype = I

[State 200, 7]
type = ChangeState
trigger1 = AnimTime = 0
value = 11
ctrl = 1
;---------------------------------------------------------------------------
; FX
[Statedef 426]
type    = S
movetype= I
physics = N
velset = 0,0
ctrl = 0
anim = 426
sprpriority = 4

[State 0, DestroySelf]
type = DestroySelf
trigger1 = animtime = 0
trigger2 = parent,anim != 425
trigger3 = parent,anim = 425
trigger3 = parent,animelemtime(13) >= 0

[State 0, ChangeAnim]
type = ChangeAnim
trigger1 = parent,anim = 425
trigger1 = parent,animelemtime(13) < 0
value = 426
elem = parent,animelemno(0)
ignorehitpause = 1

[State 0, PosAdd]
type = PosAdd
trigger1 = 1
x = parentdist x
y = parentdist y
ignorehitpause = 1

;---------------------------------------------------------------------------
; Crouch Fire Twerk
[Statedef 1200]
type    = S
movetype= A
physics = S
juggle  = 0;ifelse(var(41) & floor(exp(2*ln(2)) + 0.5) ,1,0)
;velset = 0,0
ctrl = 0
anim = 455
poweradd = 55
sprpriority = 2
facep2 = 1

[State 0, StateTypeSet]
type = StateTypeSet
trigger1 = animelem = 3
statetype = C
physics = C

[State 0, VelSet]
type = VelSet
trigger1 = time = 0
trigger1 = prevstateno != [100,105]
x = 0
[State 0, VelSet]
type = VelSet
trigger1 = time = 0
y = 0

[State 200, 1]
type = PlaySnd
trigger1 = time = 2
value = 0, 5

[State 0, Helper]
type = Helper
trigger1 = animelemtime(3) = -1
helpertype = normal
name = "Firetwerk"
ID = 456
stateno = 456
pos = ceil(87*const(size.xscale)),ceil(18*const(size.yscale))
postype = p1
facing = 1
ownpal = 1
pausemovetime = var(19)

[State 200, 1]
type = HitDef
trigger1 = animelem = 3
trigger2 = animelem = 4
trigger3 = animelem = 5
trigger4 = animelem = 6
trigger5 = animelem = 7
trigger6 = animelem = 8
trigger7 = animelem = 9
trigger8 = animelem = 10
attr = C, SP
damage = 45,0;35,0;49 , 0
animtype = hard
guardflag = MA
hitflag = MAF
pausetime = 0,6
sparkno = S901
guard.sparkno = S908
sparkxy = -5, ceil(-66 * const(size.yscale) )
hitsound = S2, 7
guardSound = S3,0
ground.type = low
ground.slidetime = 15
ground.hittime  = 15
ground.velocity = -7.168238299
guard.velocity = -7.168238299
airguard.velocity = -4.99072,-1.52344 * const(size.yscale)
air.type = low
air.velocity = -5,-4.8 * const(size.yscale)
air.hittime = 15;24
;air.fall = 1
guard.ctrltime = 15
fall.recovertime = 15;24
yaccel = 0.6875 * (16.0/9.0) * const(size.yscale)
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
sprpriority = 4
palfx.time = 20
palfx.add = 240,50,0
palfx.mul = 250,224,120
palfx.sinadd = 110,55,85,10
palfx.invertall = 0
palfx.color = 0
forcenofall = 1
envshake.time = 7
envshake.ampl = 7
envShake.freq = 10

[State 0, StateTypeSet]
type = StateTypeSet
trigger1 = animelem = 10
movetype = I

[State 200, 7]
type = ChangeState
trigger1 = AnimTime = 0
value = 11
ctrl = 1

;---------------------------------------------------------------------------
; Firetwerk
[Statedef 456]
type    = C
movetype= A
physics = N
ctrl = 0
anim = 456
poweradd = 0
juggle = 0
sprpriority = 4
velset = 0,0

[State 0, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 2
value = S0,12
channel = 0

[State 0, VelSet]
type = VelSet
trigger1 = time = 0
y = 0

[State ProRation]
type = VarSet
trigger1 = 1
var(31) = parent,var(31)
ignorehitpause = 1
[State 0, AttackMulSet]
type = AttackMulSet
trigger1 = 1
time = 2
value = (parent,fvar(13)); * ifelse(var(31),1.25,1)
ignorehitpause = 1
[State ProRation]
type = ParentVarSet
trigger1 = movehit = 2
fvar(13) = (parent,fvar(13)) * 0.95
ignorehitpause = 1


[State 200, 1]
type = HitDef
trigger1 = animelem = 3
trigger2 = animelem = 4
trigger3 = animelem = 5
trigger4 = animelem = 6
trigger5 = animelem = 7
trigger6 = animelem = 8
trigger7 = animelem = 9
trigger8 = animelem = 10
attr = C, SP
damage = 45,0;35,0;49 , 0
animtype = hard
guardflag = MA
hitflag = MAF
pausetime = 0,6
sparkno = S901
guard.sparkno = S908
sparkxy = -5, ceil(-66 * const(size.yscale) )
hitsound = S2, 7
guardSound = S3,0
ground.type = low
ground.slidetime = 15
ground.hittime  = 15
ground.velocity = -7.168238299
guard.velocity = -7.168238299
airguard.velocity = -4.99072,-1.52344 * const(size.yscale)
air.type = low
air.velocity = -5,-4.8 * const(size.yscale)
air.hittime = 15;24
;air.fall = 1
guard.ctrltime = 15
fall.recovertime = 15;24
yaccel = 0.6875 * (16.0/9.0) * const(size.yscale)
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
sprpriority = 4
palfx.time = 20
palfx.add = 240,50,0
palfx.mul = 250,224,120
palfx.sinadd = 110,55,85,10
palfx.invertall = 0
palfx.color = 0
forcenofall = 1
envshake.time = 7
envshake.ampl = 7
envShake.freq = 10

[State 0, Explod]
type = Explod
trigger1 = animtime = 0
anim = 457
ID = 457
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
sprpriority = 4
pausemovetime = parent,var(19)

[State 0, PosAdd]
type = PosAdd
trigger1 = animelem = 2
trigger1 = time > 2
x = 49 * const(size.xscale)

[State 0, DestroySelf]
type = DestroySelf
trigger1 = animtime = 0
trigger1 = time >= 19
;trigger1 = frontedgedist < -16

;---------------------------------------------------------------------------
; Crouch Fire Twerk
[Statedef 1250]
type    = S
movetype= A
physics = S
juggle  = 0;ifelse(var(41) & floor(exp(2*ln(2)) + 0.5) ,1,0)
;velset = 0,0
ctrl = 0
anim = 455
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

[State 0, StateTypeSet]
type = StateTypeSet
trigger1 = animelem = 3
statetype = C
physics = C

[State 0, VelSet]
type = VelSet
trigger1 = time = 0
trigger1 = prevstateno != [100,105]
x = 0
[State 0, VelSet]
type = VelSet
trigger1 = time = 0
y = 0

[State 200, 1]
type = PlaySnd
trigger1 = time = 2
value = 0, 5

[State 0, Helper]
type = Helper
trigger1 = animelemtime(3) = -1
helpertype = normal
name = "Firetwerk"
ID = 456
stateno = 456
pos = ceil(87*const(size.xscale)),ceil(18*const(size.yscale))
postype = p1
facing = 1
ownpal = 1
pausemovetime = var(19)

[State 200, 1]
type = HitDef
trigger1 = animelem = 3
trigger2 = animelem = 4
trigger3 = animelem = 5
trigger4 = animelem = 6
trigger5 = animelem = 7
trigger6 = animelem = 8
trigger7 = animelem = 9
trigger8 = animelem = 10
attr = C, SP
damage = 55,0;35,0;49 , 0
animtype = hard
guardflag = MA
hitflag = MAF
pausetime = 0,6
sparkno = S901
guard.sparkno = S908
sparkxy = -5, ceil(-66 * const(size.yscale) )
hitsound = S2, 7
guardSound = S3,0
ground.type = low
ground.slidetime = 15
ground.hittime  = 15
ground.velocity = -7.168238299
guard.velocity = -7.168238299
airguard.velocity = -4.99072,-1.52344 * const(size.yscale)
air.type = low
air.velocity = -5,-4.8 * const(size.yscale)
air.hittime = 15;24
;air.fall = 1
guard.ctrltime = 15
fall.recovertime = 15;24
yaccel = 0.6875 * (16.0/9.0) * const(size.yscale)
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
sprpriority = 4
palfx.time = 20
palfx.add = 240,50,0
palfx.mul = 250,224,120
palfx.sinadd = 110,55,85,10
palfx.invertall = 0
palfx.color = 0
forcenofall = 1
envshake.time = 7
envshake.ampl = 7
envShake.freq = 10

[State 0, StateTypeSet]
type = StateTypeSet
trigger1 = animelem = 10
movetype = I

[State 200, 7]
type = ChangeState
trigger1 = AnimTime = 0
value = 11
ctrl = 1


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
guardSound = S3,0
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
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
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
guardSound = S3,0
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
envshake.time = 14
envshake.ampl = 4
envShake.freq = 120
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




;========================<PUNCH ZERO COUNTER>=============================
[StateDef 2900]
type = S
physics = N
moveType = A
anim = 2900
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 0
faceP2 = 1

[State 2900, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(5) < 0
value = SCA
time = 1

[State 2900, Voice]
type = PlaySND
trigger1 = !Time
value = 3,4
channel = 0

[State 2900, Woosh Sound]
type = PlaySND
trigger1 = AnimElem = 5
value = 1,5
channel = 1


[State 2900, Jump Sound]
type = PlaySND
trigger1 = AnimElem = 5
value = 40,0
channel = 3

[State 2900, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElem = 5
stateType = A
physics = N

[State 2900, Dust Helper]
type = Helper
trigger1 = AnimElem = 6
helperType = Normal
stateNo = 8100
ID = 8100
name = "Beserker Slash Dust"
posType = P1
ownPal = 1

[State 2900, Landing Dust Explod]
type = Explod
trigger1 = AnimElem = 10
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 0, Helper]
type = Helper
trigger1 = AnimElem = 6
trigger1 = !numhelper(221)
helpertype = normal
name = "FX"
ID = 221
stateno = 221
pos = 0,0
postype = p1
facing = 1
ownpal = 1
ignorehitpause = 1
pausemovetime = var(19)


[State 2900, VelSet]
type = VelSet
trigger1 = AnimElem = 2
x = 6.57

[State 2900, VelSet]
type = VelSet
trigger1 = AnimElem = 6
x = 1.15

[State 2900, VelSet]
type = VelSet
trigger1 = AnimElem = 7
x = 0

[State 2900, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(10) >= 0
stateType = S
physics = S

[State 2900, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || (var(20) || var(14)))
trigger1 = AnimElem = 6
attr = S, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 100 < 7, 7, fvar(11) * 100)), 0
getpower = 0,0
givePower = 36, 36
pauseTime = ifElse((var(20) || var(14)), 6, 12), ifElse((var(20) || var(14)), 6, 12)
guard.pauseTime = ifElse((var(20) || var(14)), 6, 12), ifElse((var(20) || var(14)), 6, 12)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = High
ground.hitTime = 15 + 3 * var(9)
ground.slideTime = 15 + 3 * var(9)
guard.hitTime = 15
air.hitTime = 120
ground.velocity = -8.51, -3.66
ground.cornerPush.velOff = 0
guard.velocity = -7.51
guard.cornerPush.velOff = 0
air.velocity = -3.46, -4.25
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 1
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
hitsound = S2,2
guardSound = S3,0
sparkNo = -1 + 0 * (var(33) := 8016)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 61), var(36) := -69
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envshake.time = 14
envshake.ampl = 4
envShake.freq = 120


[State 2900, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(9) >= 0
movetype = I

[State 2900, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;========================<KICK ZERO COUNTER>=============================
[StateDef 2910]
type = S
physics = N
moveType = A
anim = 2910
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 0

[State 2910, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(4) < 0
value = SCA
time = 1
ignoreHitPause = 1

[State 450, VelSet]
type = VelSet
trigger1 = AnimElemTime (5) >= 0
x = 6.45

[State 450, VelSet]
type = VelSet
trigger1 = AnimElemTime (6) >= 4
x = 1.45

[State 450, VelSet]
type = VelSet
trigger1 = AnimElem = 7
x = 0

[State 450, Voice]
type = PlaySnd
trigger1 = AnimElem = 4 && Random < 800
value = 4, 4
channel = 0

[State 450, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 5
value = 1,5
channel = 1

[State 450, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || (var(20) || var(14)))
trigger1 = AnimElem = 5
attr = C, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 78 < 7, 7, fvar(11) * 78)), 0
getpower = 0,0
givepower = 36, 36
pauseTime = ifElse((var(20) || var(14)), 6, 12), ifElse((var(20) || var(14)), 6, 12)
guard.pauseTime = ifElse((var(20) || var(14)), 6, 12), ifElse((var(20) || var(14)), 6, 12)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Trip
air.type = Trip
ground.hitTime = 18 + 4 * var(9)
ground.slideTime = 18 + 4 * var(9)
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -4.85, -6.25
ground.cornerPush.velOff = 0
guard.velocity = ifElse((var(20) || var(14)), -4.86, -10.52)
guard.cornerPush.velOff = 0
air.velocity = -1, -8.24
air.cornerPush.velOff = 0
yAccel = 0.677
fall = 1
fall.recover = 0
fall.recoverTime = 120
hitsound = S2,5
guardSound = S3,0
sparkNo = -1 + 0 * (var(33) := 8012)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 75), var(36) := -40
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48

[State 450, StateTypeSet: Idle]
type = StateTypeset
trigger1= AnimElemTime(7) >= 0
moveType = I

[State 2910, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


