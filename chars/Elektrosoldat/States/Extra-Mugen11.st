; _________________________________________
;| Elektrosoldat by Saikou Shiva           |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==============================================================================================
;========================================<EXTRA STATESS>========================================
;==============================================================================================

;========================<CAMERA-ZOOM (MUGEN 1.1)>========================
;Camera-Zoom Helper
[Statedef 6009]
physics=N
anim = 9999
[State 0, VarSet]
type = VarSet
trigger1 = !time
fv = 35
value = (root,fvar(35))

[State 0, Turn]
type = Turn
trigger1 = facing!=(root,facing)


[State 0, Stage CameraZoom detection var]
type = ParentVarSet
trigger1 = 1
fv = 7
value = camerazoom

[State 0, BindToRoot]
type = BindToRoot
trigger1 = 1
time = 1
pos = 0,0
ignorehitpause = 1
persistent = 1


[State 3000, ZOOM (Throw - 1)]
type = zoom
triggerall = fvar(35)>1
triggerall = (root,time)<=10
trigger1 = root, stateno = 810
trigger2 = root, stateno = 820
scale = 1 + (0.04*(root,time))
pos = (pos x + (root,var(10)))*0.5 * (0.1*(root,time)), 0;zoom
ignorehitpause = 1
[State 3000, ZOOM (Throw - 2)]
type = zoom
triggerall = fvar(35)>1
triggerall = (root,time)>10
triggerall = (root, time<=78)
trigger1 = root, stateno = 810
trigger2 = root, stateno = 820
scale = 1.4
pos = (pos x + (root,var(10)))*0.5, 0;zoom
ignorehitpause = 1
[State 3000, ZOOM (Throw - 3)]
type = zoom
triggerall = fvar(35)>1
triggerall = (root,time)>78
triggerall = (root,time)<=88
trigger1 = root, stateno = 810
trigger2 = root, stateno = 820
scale = 1.4 - (0.04*((root,time)-78))
pos = ((pos x + (root,var(10)))*0.5) - (0.1*((pos x + (root,var(10)))*0.5) * ((root,time)-78)), 0;zoom
ignorehitpause = 1

[State 3000, ZOOM (Lv1 Super)]
type = zoom
triggerall = fvar(35)>3
triggerall = (root,time)<=10
trigger1 = root, stateno = 3000
trigger2 = root, stateno = 3100
scale = 1 + (0.01*(root,time))
;pos = (pos x + target, pos x) / 2, pos y;zoom
pos = pos x*(root,time)*0.1, pos y*(root,time)*0.1;zoom
ignorehitpause = 1
[State 3000, ZOOM (Lv1 Super)]
type = zoom
triggerall = fvar(35)>3
triggerall = (root,time)>10
triggerall = (root,time)<=33
trigger1 = root, stateno = 3000
trigger2 = root, stateno = 3100
scale = 1.1
;pos = (pos x + target, pos x) / 2, pos y;zoom
pos = pos x, pos y;zoom
ignorehitpause = 1
[State 3000, ZOOM (Lv1 Super)]
type = zoom
triggerall = fvar(35)>3
triggerall = (root,time)>33
triggerall = (root,time)<=43
trigger1 = root, stateno = 3000
trigger2 = root, stateno = 3100
scale = 1.1 - (0.01*((root,time)-33))
;pos = (pos x + target, pos x) / 2, pos y;zoom
pos = pos x-(pos x * 0.1*((root,time)-33)), pos y-(pos y * 0.1*((root,time)-33));zoom
ignorehitpause = 1

[State 3500, ZOOM (Lv2 Super)]
type = zoom
triggerall = fvar(35)>3
triggerall = (root,time)<=10
trigger1 = root, stateno = 3050
trigger2 = root, stateno = 3150
scale = 1 + (0.0225*(root,time))
;pos = (pos x + target, pos x) / 2, pos y;zoom
pos = pos x*(root,time)*0.1, pos y*(root,time)*0.1;zoom
ignorehitpause = 1
[State 3500, ZOOM (Lv2 Super)]
type = zoom
triggerall = fvar(35)>3
triggerall = (root,time)>10
triggerall = (root,time)<=33
trigger1 = root, stateno = 3050
trigger2 = root, stateno = 3150
scale = 1.225
;pos = (pos x + target, pos x) / 2, pos y;zoom
pos = pos x, pos y;zoom
ignorehitpause = 1
[State 3500, ZOOM (Lv2 Super)]
type = zoom
triggerall = fvar(35)>3
triggerall = (root,time)>33
triggerall = (root,time)<=43
trigger1 = root, stateno = 3050
trigger2 = root, stateno = 3150
scale = 1.225 - (0.0225*((root,time)-33))
;pos = (pos x + target, pos x) / 2, pos y;zoom
pos = pos x-(pos x * 0.1*((root,time)-33)), pos y-(pos y * 0.1*((root,time)-33));zoom
ignorehitpause = 1

[State 4000, ZOOM (Lv3 Super)]
type = zoom
triggerall = fvar(35)>3
triggerall = (root,time)<=10
trigger1 = root, stateno = 3300
scale = 1 + (0.045*(root,time))
;pos = (pos x + target, pos x) / 2, pos y;zoom
pos = pos x*(root,time)*0.1, pos y*(root,time)*0.1;zoom
ignorehitpause = 1
[State 4000, ZOOM (Lv3 Super)]
type = zoom
triggerall = fvar(35)>3
triggerall = (root,time)>10
triggerall = (root,time)<=33
trigger1 = root, stateno = 3300
scale = 1.45
;pos = (pos x + target, pos x) / 2, pos y;zoom
pos = pos x, pos y;zoom
ignorehitpause = 1
[State 4000, ZOOM (Lv3 Super)]
type = zoom
triggerall = fvar(35)>3
triggerall = (root,time)>33
triggerall = (root,time)<=43
trigger1 = root, stateno = 3300
scale = 1.45 - (0.045*((root,time)-33))
;pos = (pos x + target, pos x) / 2, pos y;zoom
pos = pos x-(pos x * 0.1*((root,time)-33)), pos y-(pos y * 0.1*((root,time)-33));zoom
ignorehitpause = 1

[State 900, ZOOM (Custom Combo)]
type = zoom
triggerall = fvar(35)>3
triggerall = (root,time)<=10
trigger1 = root,stateno=900
scale = 1 + (0.04*(root,time))
;pos = (pos x + target, pos x) / 2, pos y;zoom
pos = pos x, pos y;zoom
ignorehitpause = 1
[State 900, ZOOM (Custom Combo)]
type = zoom
triggerall = fvar(35)>3
triggerall = (root,time)>10
triggerall = (root,time)<=20
trigger1 = root,stateno=900
scale = 1.4
;pos = (pos x + target, pos x) / 2, pos y;zoom
pos = pos x, pos y;zoom
ignorehitpause = 1
[State 900, ZOOM (Custom Combo)]
type = zoom
triggerall = fvar(35)>3
triggerall = (root,time)>20
triggerall = (root,time)<=30
trigger1 = root,stateno=900
scale = 1.4 - (0.04*((root,time)-20))
;pos = (pos x + target, pos x) / 2, pos y;zoom
pos = pos x, pos y;zoom
ignorehitpause = 1


[State 3000, Camera Focus Var (Win Pose)]
type = varset
trigger1 = numhelper(6001)
var(11)=0
[State 3000, ZOOM (Win Pose)]
type = zoom
triggerall = fvar(35)>1 && matchover
triggerall = !numpartner || (numpartner && !partner, alive)
triggerall = var(11)=[1,20]
trigger1 = root, stateno = [181,183]
scale = 1 + (0.02*var(11))
pos = (pos x *0.05*var(11))*camerazoom, 0;(pos y*0.1*time)*camerazoom;zoom
ignorehitpause = 1
[State 3000, ZOOM (Win Pose)]
type = zoom
triggerall = fvar(35)>1 && matchover
triggerall = fvar(35)>1 && matchover
triggerall = !numpartner || (numpartner && !partner, alive)
trigger1 = root, stateno = [181,183]
trigger1 = var(11)>20
scale = 1.4
pos = pos x*camerazoom, 0;pos y*camerazoom;zoom
ignorehitpause = 1

[State 182, 1]
type = AssertSpecial
trigger1 = root, stateno = [181,183]
trigger1 = fvar(35)>0 && matchover
flag = nobardisplay

[State 3000, Camera Focus Var (Win Pose)]
type = varadd
trigger1 = root, stateno = [181,183]
trigger1 = !numhelper(6001)
var(11)=1



;========================<STUNNED>========================
;----- Air get-hit (Shaking) -----
[Statedef 1115310]
type = A
movetype= H
physics = N
velset = 0, 0

[State 1115310, NHB]
type = nothitby
trigger1 = 1
value = SCA

[State 1115310]
type = HitFallSet
trigger1 = 1
value = 1
ignorehitpause = 1

[State 1115310, Anim]
type = ChangeAnim
trigger1 = Time = 0
value = 5030

[State 1115310, Diagup]
type = ChangeAnim
trigger1 = Time = 0
trigger1 = SelfAnimExist(5052)
value = 5052

[State 1115310, Anim]
type = ChangeAnim
trigger1 = Time > 0
value = anim

[State 1115310, Shake]
type = offset
trigger1 = 1
x = ifelse((gametime % 2), -1, 1)

[State 1115310, 5]
type = ChangeState
trigger1 = HitShakeOver
value = 1115311


;----- Knocked away -----
[Statedef 1115311]
type = A
physics = N
movetype = H
ctrl = 0

[State 1115311, NHB]
type = nothitby
trigger1 = 1
value = sca

[State 1115311, Accel]
type = veladd
trigger1 = 1
y = 0.4850;yaccel

[State 1115311, Vel]
type = velset
trigger1 = !time
x = ifelse(p2dist x < 0, 4.31, -4.31)
y = -7.36

[State 1115311, Anim]
type = changeanim
trigger1 = anim != [5000, 5199]
trigger1 = selfanimexist(5030)
value = 5030

[State 1115311, Anim]
type = changeanim
trigger1 = !animtime
trigger1 = anim < 5035
trigger1 = selfanimexist(5035)
value = 5035

[State 1115311, Anim]
type = changeanim
trigger1 = !animtime
trigger1 = anim = 5035
value = 5050

[State 1115311, Anim]
type = changeanim
trigger1 = anim = 5052
trigger1 = vel y >= ifelse(anim = 5050, const720p(4), const720p(-8))
trigger1 = selfanimexist(5062)
value = 5062
persistent = 0

[State 1115311, End]
type = changestate
trigger1 = vel y > 0
trigger1 = pos y >= ifelse(anim = 5052, 0, const(movement.air.gethit.groundlevel))
value = 1115313


;----- Thrown -----
[Statedef 1115312]
type = A
movetype= H
physics = N
ctrl = 0

[State 1115312, NHB]
type = nothitby
trigger1 = 1
value = SCA

[State 1115312, Accel]
type = VelAdd
trigger1 = 1
y = 0.4850;yaccel

[State 1115312, Anim]
type = changeanim
trigger1 = !animtime
trigger1 = selfanimexist(5035)
trigger1 = anim = [5000, 5030]
value = 5035

[State 1115312, Anim]
type = changeanim
triggerall = !animtime
trigger1 = anim = 5035
trigger2 = anim < 5050
trigger2 = !selfanimexist(5035)
value = 5050

[State 1115312, Up Type]
type = changeanim
trigger1 = anim = [5050,5059]
trigger1 = vel y > 0
trigger1 = selfanimexist(anim + 10)
value = anim + 10
persistent = 0

[State 1115312, End]
type = ChangeState
trigger1 = Vel Y > 0
trigger1 = Pos Y >= Const(movement.air.gethit.groundlevel)
value = 1115313


;----- hit ground from fall -----
[Statedef 1115313]
type = L
movetype= H
physics = N

[State 1115313, NHB]
type = nothitby
trigger1 = 1
value = SCA

[State 1115313, EnvShake]
type = FallEnvShake
trigger1 = Time = 0

[State 1115313, Var] ;Save fall velocity
type = VarSet
trigger1 = Time = 0
sysvar(1) = floor(vel y)

[State 1115313, 2] ;Hit ground anim (normal)
type = ChangeAnim
triggerall = time = 0
trigger1 = (anim != [5051,5059]) && (anim != [5061,5069])
trigger2 = !SelfAnimExist(5100 + (anim % 10))
value = 5100

[State 1115313, 3] ;Hit ground anim (for hit up)
type = ChangeAnim
trigger1 = time = 0
trigger1 = (anim = [5051,5059]) || (anim = [5061,5069])
trigger1 = SelfAnimExist(5100 + (anim % 10))
value = 5100 + (anim % 10)

[State 1115313, 4]
type = PosSet
trigger1 = Time = 0
y = 0

[State 1115313, 5]
type = velset
trigger1 = Time = 0
y = 0

[State 1115313, 6] ;Reduce speed
type = VelMul
trigger1 = Time = 0
x = 0.75

[State 1115313, 7]
type = ChangeState
trigger1 = Time = 0
trigger1 = GetHitVar(fall.yvel) = 0
value = 1115315 ;Downed get-hit (lying down)

[State 1115313, 8]
type = Explod
trigger1 = Time = 1
anim = F(60 + (sysvar(1) > Const720p(20)) + (sysvar(1) > Const720p(56)))
pos = 0, 0
sprpriority = ifelse (sysvar(1) <= Const720p(56), -10, 10)

[State 1115313, 9]
type = HitFallDamage
trigger1 = Time = 3

[State 1115313, 10]
type = PlaySnd
trigger1 = Time = 1
value = F7, (sysvar(1) > Const720p(20)) + (sysvar(1) > Const720p(56))

[State 1115313, 11]
type = PosFreeze
trigger1 = 1

[State 1115313, 12]
type = ChangeState
trigger1 = AnimTime = 0
value = 1115314 ;Downed get-hit (bounce off ground)

[State 1115313, 13]
type = ForceFeedback
trigger1 = Time = 0
waveform = sinesquare
ampl = 128,-3,-.2,.005
time = 20


;----- bounce off ground -----
[Statedef 1115314]
type = L
movetype= H
physics = N

[State 1115314, NHB]
type = nothitby
trigger1 = 1
value = SCA

[State 1115314, 1] ;Coming hit ground anim (normal)
type = ChangeAnim
triggerall = time = 0
trigger1 = anim != [5101,5109]
trigger2 = !SelfAnimExist(5160 + (anim % 10))
value = 5160

[State 1115314, 2] ;Coming hit ground anim (for hit up)
type = ChangeAnim
triggerall = time = 0
trigger1 = anim = [5101,5109]
trigger1 = SelfAnimExist(5160 + (anim % 10))
value = 5160 + (anim % 10)

[State 1115314, 3]
type = HitFallVel
trigger1 = Time = 0

[State 1115314, 4]
type = PosSet
trigger1 = Time = 0
y = Const(movement.down.bounce.offset.y)

[State 1115314, 5]
type = PosAdd
trigger1 = Time = 0
x = Const(movement.down.bounce.offset.x)

[State 1115314, 6] ;Acceleration
type = VelAdd
trigger1 = 1
y = Const(movement.down.bounce.yaccel)

[State 1115314, 7] ;Hit ground
trigger1 = Vel Y > 0
trigger1 = Pos Y >= Const(movement.down.bounce.groundlevel)
type = ChangeState
value = 1115315


;----- lying down -----
[Statedef 1115315]
type = L
movetype= H
physics = N

[State 1115315, NHB]
type = nothitby
trigger1 = 1
value = SCA

[State 1115315, EnvShake]
type = FallEnvShake
trigger1 = Time = 0

[State 1115315, 1] ;For hit up/up-diag type (from state 5081)
type = ChangeAnim
persistent = 0
trigger1 = SelfAnimExist(5110 + (anim % 10))
trigger1 = anim = [5081,5089]
value = 5110 + (anim % 10)

[State 1115315, 2] ;Hit ground anim (normal)
type = ChangeAnim
triggerall = time = 0
triggerall = anim != [5110,5119] ;Not already changed anim
trigger1 = anim != [5161,5169]
trigger2 = !SelfAnimExist(5170 + (anim % 10))
value = 5170

[State 1115315, 3] ;Hit ground anim (for hit up)
type = ChangeAnim
triggerall = time = 0
triggerall = anim != [5110,5119] ;Not already changed anim
trigger1 = anim = [5161,5169]
trigger1 = SelfAnimExist(5170 + (anim % 10))
value = 5170 + (anim % 10)

[State 1115315, 5]
type = PosSet
trigger1 = Time = 0
y = 0

[State 1115315, Var] ;Get fall velocity
type = VarSet
trigger1 = Time = 0
trigger1 = GetHitVar(fall.yvel) != 0
sysvar(1) = floor(vel y)

[State 1115315, 6]
type = PlaySnd
trigger1 = Time = 0
trigger1 = !SysVar(0)
value = F7, (sysvar(1) > Const720p(20)) + (sysvar(1) > Const720p(56))

[State 1115315, 7]
type = Explod
trigger1 = Time = 0
trigger1 = !SysVar(0)
anim = F(60 + (sysvar(1) > Const720p(20)) + (sysvar(1) > Const720p(56)))
pos = 0, 0
sprpriority = ifelse (sysvar(1) <= Const720p(56), -10, 10)

[State 1115315, 8]
type = velset
trigger1 = Time = 0
y = 0

[State 1115315, Up type]
type = ChangeAnim
persistent = 0
triggerall = anim = [5171,5179]
triggerall = SelfAnimExist(5110 + (anim % 10))
trigger1 = AnimTime = 0
trigger2 = SysVar(0) ;SysVar(0) = 1 avoids hit ground anim
value = 5110 + (anim % 10)

[State 1115315, 10] ;For normal
type = ChangeAnim
persistent = 0
triggerall = Anim != [5111,5119]
trigger1 = AnimTime = 0
trigger2 = SysVar(0) ;SysVar(0) = 1 avoids hit ground frame
value = 5110

[State 1115315, 11]
type = changestate
trigger1 = alive
trigger1 = time >= 10
value = 1115316

[State 1115315, KO]
type = selfState
triggerall = !alive
trigger1 = AnimTime = 0
trigger2 = SysVar(0) ;SysVar(0) = 1 avoids hit ground frame
trigger3 = Anim = [5110,5119]
value = 5150

[State 1115315, 12]
type = VarSet
trigger1 = SysVar(0)
trigger1 = Time = 0
sysvar(0) = 0

[State 1115315, 13]
type = VelMul
trigger1 = 1
x = 0.85

[State 1115315, 14]
type = velset
trigger1 = abs(Vel x) < Const(movement.down.friction.threshold)
persistent = 0
x = 0


;----- getting up -----
[Statedef 1115316]
type = L
movetype= H
physics = N

[State 1115316, NHB]
type = nothitby
trigger1 = 1
value = SCA

[State 1115316, 1a] ;Get up anim (normal)
type = ChangeAnim
triggerall = time = 0
trigger1 = anim != [5111,5119]
trigger2 = !SelfAnimExist(5120 + (anim % 10))
value = 5120

[State 1115316, 1b] ;Get up anim (for hit up/diag-up)
type = ChangeAnim
triggerall = time = 0
trigger1 = anim = [5111,5119]
trigger1 = SelfAnimExist(5120 + (anim % 10))
value = 5120 + (anim % 10)

[State 1115316, 2]
type = velset
trigger1 = Time = 0
x = 0

[State 1115316, 4]
type = HitFallSet
trigger1 = 1
value = 0

[State 1115316, 7]
type = ChangeState
trigger1 = !animtime
trigger2 = time >= 60
value = 1115300


;--- Dizzy ---
[Statedef 1115300]
type = S
physics = S
movetype = H
velset = 0, 0
anim = 5300

[State 1115300, Simul]
type = statetypeset
trigger1 = numenemy > 1
trigger1 = enemynear(0), hitdefattr = SCA, AT
movetype = I

[State 1115300, Hitfall]
type = hitfallset
trigger1 = 1
value = 0

[State 1115300, Max Timer]
type = varset
trigger1 = !time
sysfvar(2) = 120

[State 1115300, Timer]
type = varadd
trigger1 = time
sysfvar(2) = -1
[State 1115300, Timer]
type = varadd
trigger1 = command = "up" || command = "down" || command = "back" || command = "fwd"
sysfvar(2) = -2
[State 1115300, Timer]
type = varadd
trigger1 = command = "x" || command = "y" || command = "z" || command = "a" || command = "b" || command = "c"
sysfvar(2) = -1

[State 1115300, Signal]
type = palfx
trigger1 = command = "up" || command = "down" || command = "back" || command = "fwd"
trigger2 = command = "x" || command = "y" || command = "z" || command = "a" || command = "b" || command = "c"
time = 1
add = 64, 64, 64

[State 1115300, Skip]
type = varset
trigger1 = !time
sysfvar(3) = 0
[State 1115300, Skip]
type = varadd
trigger1 = command = "up" || command = "down" || command = "back" || command = "fwd"
trigger2 = command = "a" || command = "b" || command = "c" || command = "x" || command = "y" || command = "z"
sysfvar(3) = 1

[State 1115300, Skip]
type = changeanim
trigger1 = animelemtime(animelemno(0)) > 0 && animelemtime(animelemno(0) + 1) < 0
trigger1 = animelemtime(animelemno(0) + 1) >= -sysfvar(3)
value = 5300
elem = animelemno(0) + 1
[State 1115300, Skip]
type = varset
trigger1 = animelemtime(1) >= 0 && !animelemtime(animelemno(0))
sysfvar(3) = 0

[State 1115300, End]
type = varset
trigger1 = sysfvar(2) < 0
sysfvar(2) = 0

[State 1115300, End]
type = selfstate
trigger1 = sysfvar(2) <= 0 || time >= 120 || roundstate != 2
value = 0
ctrl = 1



;========================<MOVELIST>=============================
; PAUSE / MOVE LIST!
[Statedef 8980]
type = A
physics = N
movetype = I
anim = 9741

[State 8980, SFIV Pause sound]
type = playsnd
trigger1 = !time
value = 8980,0
channel = 0
[State 8980, SFIV Pause sound]
type = playsnd
trigger1 = !time
value = 8980,0
channel = 2

[State -3, Movelist Visuals]
type = helper
trigger1 = !time
trigger1 = !numhelper(8982)
name = "Soldat Movelist (Visuals)"
ID = 8982
postype = p1
stateno = 8982
ownpal = 1
supermovetime = 987654321
pausemovetime = 987654321
size.air.back = 1
size.air.front = 1


[State 8980, How many moves in the grid number 0? (Normal Throws)]
type = varset
trigger1 = !time
v=10
value = 3
[State 8980, How many moves in the grid number 1? (Unique Attacks)]
type = varset
trigger1 = !time
v=11
value = 4 +ifelse(root,var(59)>2,1,0)
[State 8980, How many moves in the grid number 2? (Target Combos)]
type = varset
trigger1 = !time
v=12
value = 0
[State 8980, How many moves in the grid number 3? (Special Moves)]
type = varset
trigger1 = !time
v=13
value = 2
[State 8980, How many moves in the grid number 4? (Lv1 Super Moves)]
type = varset
trigger1 = !time
v=14
value = 2
[State 8980, How many moves in the grid number 5? (Lv2 Super Moves)]
type = varset
trigger1 = !time
v=15
value = 2
[State 8980, How many moves in the grid number 6? (Lv3 Super Moves)]
type = varset
trigger1 = !time
v=16
value = 1
[State 8980, How many moves in the grid number 7? (Lv5 Super Moves)]
type = varset
trigger1 = !time
v=17
value = 0
[State 8980, How many moves in the grid number 8? (System Moves)]
type = varset
trigger1 = !time
v=18
value = 12
[State 8980, How many moves in the grid number 9? (Basic Commands)]
type = varset
trigger1 = !time
v=19
value = 9
;-------------------------------------------------------------------------------

[State 8980, Conditions to use a different grid number 0? (Normal Throws)]
type = varset
trigger1 = !time
v=40
value = 0
[State 8980, Conditions to use a different grid number 1? (Unique Attacks)]
type = varset
trigger1 = !time
v=41
value = ifelse(root,var(59)>2,1,0)
[State 8980, Conditions to use a different grid number 2? (Target Combos)]
type = varset
trigger1 = !time
v=42
value = 0
[State 8980, Conditions to use a different grid number 3? (Special Moves)]
type = varset
trigger1 = !time
v=43
value = 0
[State 8980, Conditions to use a different grid number 4? (Lv1 Super Moves)]
type = varset
trigger1 = !time
v=44
value = 0
[State 8980, Conditions to use a different grid number 5? (Lv2 Super Moves)]
type = varset
trigger1 = !time
v=45
value = 0
[State 8980, Conditions to use a different grid number 6? (Lv3 Super Moves)]
type = varset
trigger1 = !time
v=46
value = 0
[State 8980, Conditions to use a different grid number 7? (Lv5 Super Moves)]
type = varset
trigger1 = !time
v=47
value = 0
[State 8980, Conditions to use a different grid number 8? (System Moves)]
type = varset
trigger1 = !time
v=48
value = ifelse(root,var(54)>=1,1,0)
[State 8980, Conditions to use a different grid number 9? (Basic Commands)]
type = varset
trigger1 = !time
v=49
value = 0
;=================================================================================================
;=================================================================================================
;===============================<DO NOT MODIFY BELOW THIS LINE>===================================
;=================================================================================================
;=================================================================================================
[State 8980, Spacing before the grid number 0 (Normal Throws)]
type = varset
trigger1 = !time
v=20
value = 61

[State 8980, Spacing before the grid number 1 (Unique Attacks)]
type = varset
trigger1 = !time
v=21
value = var(20) + ifelse(var(10)>0,26+var(10)*13,0)
[State 8980, Spacing before the grid number 2 (Target Combos)]
type = varset
trigger1 = !time
v=22
value = var(21) + ifelse(var(11)>0,26+var(11)*13,0)
[State 8980, Spacing before the grid number 3 (Special Moves)]
type = varset
trigger1 = !time
v=23
value = var(22) + ifelse(var(12)>0,26+var(12)*13,0)
[State 8980, Spacing before the grid number 4 (Lv1 Super Moves)]
type = varset
trigger1 = !time
v=24
value = var(23) + ifelse(var(13)>0,26+var(13)*13,0)
[State 8980, Spacing before the grid number 5 (Lv2 Super Moves)]
type = varset
trigger1 = !time
v=25
value = var(24) + ifelse(var(14)>0,26+var(14)*13,0)
[State 8980, Spacing before the grid number 6 (Lv3 Super Moves)]
type = varset
trigger1 = !time
v=26
value = var(25) + ifelse(var(15)>0,26+var(15)*13,0)
[State 8980, Spacing before the grid number 7 (Lv5 Super Moves)]
type = varset
trigger1 = !time
v=27
value = var(26) + ifelse(var(16)>0,26+var(16)*13,0)
[State 8980, Spacing before the grid number 8 (System Moves)]
type = varset
trigger1 = !time
v=28
value = var(27) + ifelse(var(17)>0,26+var(17)*13,0)
[State 8980, Spacing before the grid number 9 (Basic Commands)]
type = varset
trigger1 = !time
v=29
value = var(28) + ifelse(var(18)>0,26+var(18)*13,0)
[State 8980, Spacing in total]
type = varset
trigger1 = !time
v=30
value = var(29) + ifelse(var(19)>0,26+var(19)*13,0)
[State 8980, Vertical location of the move-preview box]
type = varset
trigger1 = !time
v=50
value = var(20)-9


[State 8980, Root]
type = varset
trigger1 = !time
sysvar(0) = root, ID

[State 8980, Turn]
type = turn
trigger1 = !time
trigger1 = facing = -1

[State 8980, Pos]
type = posset
trigger1 = 1
x = 0
y = pos y - screenpos y

[State 8980, Assert]
type = assertspecial
trigger1 = 1
flag = nobardisplay

[State 8980, Black BG]
type = explod
trigger1 = !numexplod(8979)
anim = 8989
ID = 8979
postype = left
pos = 160, 120
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
pausemovetime = -1
scale = 8, 8
ontop = 1
ownpal = 0


;
;[State 8980, Pos Y]
;type = varadd
;trigger1 = root, command = "holdup"
;var(1) = 4
;[State 8980, Pos Y]
;type = varadd
;trigger1 = root, command = "holddown"
;var(1) = -4




;----------------------------------------------------------------------------------------
[State 8980, Pos Y]
type = varset
trigger1 = !time;&& var(10)>0
fvar(14) = root, fvar(14)
[State 8980, Pos Y]
type = varset
trigger1 = !time && !fvar(14);&& var(10)>0
var(5) = ifelse(var(10)>0,0,ifelse(var(11)>0,1,ifelse(var(12)>0,2,ifelse(var(13)>0,3,ifelse(var(14)>0,4,ifelse(var(15)>0,5,ifelse(var(16)>0,6,ifelse(var(17)>0,7,ifelse(var(18)>0,8,9)))))))))
[State 8980, Pos Y]
type = varset
trigger1 = !time && fvar(14);&& var(10)>0
var(5) = ifelse(fvar(14)>=900,9,ifelse(fvar(14)>=800,8,ifelse(fvar(14)>=700,7,ifelse(fvar(14)>=600,6,ifelse(fvar(14)>=500,5,ifelse(fvar(14)>=400,4,ifelse(fvar(14)>=300,3,ifelse(fvar(14)>=200,2,ifelse(fvar(14)>=100,1,0)))))))))
[State 8980, Pos Y]
type = varadd
trigger1 = var(6)>0
var(6) =-1
[State 8980, Pos Y]; PST1
type = varset
trigger1 = !time && !fvar(14)
var(7) = 1
[State 8980, Pos Y]; PST1
type = varset
trigger1 = !time && fvar(14)
var(7) = fvar(14) -ifelse(fvar(14)>=900,900,ifelse(fvar(14)>=800,800,ifelse(fvar(14)>=700,700,ifelse(fvar(14)>=600,600,ifelse(fvar(14)>=500,500,ifelse(fvar(14)>=400,400,ifelse(fvar(14)>=300,300,ifelse(fvar(14)>=200,200,ifelse(fvar(14)>=100,100,0)))))))))
[State 8980, Pos Y]
type = varset
trigger1 = 1
var(3) = var(7)
[State 8980, Pos Y]
type = varset
trigger1 = !time
var(4) = var(5)
[State 8980, (Visual glitch-proof)]
type = varset
trigger1 = var(7)<1
var(7) = 1

;----------------------------------------------------------------------------------------
[State 8980, Movelist 00 - Moving up]
type = varadd
triggerall = var(5)=0
trigger1 = root, command = "holdup" && var(6)<=0
trigger1 = var(7)>0
var(7) = -1
[State 8980, Movelist 00 - Moving down]
type = varadd
triggerall = var(5)=0
trigger1 = root, command = "holddown"&& (var(6)<=0||var(7)=0)
trigger1 = var(7)<=var(10)
var(7) = 1
[State 8980, Movelist 00 - Jumpin' into the next visible movelist-section!]
type = varset
triggerall = var(5)=0
trigger1 = root, command = "holddown"&& var(6)<=0
trigger1 = var(7)>var(10)
var(3) = var(7)
[State 8980, Movelist 00 - Jumpin' into the next visible movelist-section!]
type = varset
triggerall = var(5)=0
trigger1 = root, command = "holddown"&& var(6)<=0
trigger1 = var(7)>var(10)
var(7) = 0
[State 8980, Movelist 00 - Jumpin' into the next visible movelist-section!]
type = varset
triggerall = var(5)=0
trigger1 = var(6)<=0
trigger1 = root, command = "back" || root, command = "fwd"
var(7) = 1
[State 8980, Movelist 00 - Jumpin' into the next visible movelist-section!]
type = varset
triggerall = var(5)=0
trigger1 = root, command = "holdup"&& var(6)<=0
trigger1 = var(7)=0
trigger2 = var(7)=1
var(3) = var(7)
[State 8980, Movelist 00 - Jumpin' into the next visible movelist-section!]
type = varset
triggerall = var(5)=0
trigger1 = root, command = "holdup"&& var(6)<=0
trigger1 = var(7)=0
var(7) = ifelse(var(19)>0,var(19),ifelse(var(18)>0,var(18),ifelse(var(17)>0,var(17),ifelse(var(16)>0,var(16),ifelse(var(15)>0,var(15),ifelse(var(14)>0,var(14),ifelse(var(13)>0,var(13),ifelse(var(12)>0,var(12),ifelse(var(11)>0,var(11),var(10))))))))))
[State 8980, Movelist 00 - Jumpin' into the next visible movelist-section!]
type = varset
triggerall = var(5)=0
trigger1 = root, command = "holddown"&& var(6)<=0
trigger1 = var(3)>var(10)
trigger2 = var(4) = var(5)
trigger2 = (root, facing = 1 && root, command = "fwd") || (root, facing = -1 && root, command = "back")
var(5) = ifelse(var(11)>0,1,ifelse(var(12)>0,2,ifelse(var(13)>0,3,ifelse(var(14)>0,4,ifelse(var(15)>0,5,ifelse(var(16)>0,6,ifelse(var(17)>0,7,ifelse(var(18)>0,8,ifelse(var(19)>0,9,0)))))))))
[State 8980, Movelist 00 - Jumpin' into the next visible movelist-section!]
type = varset
triggerall = var(5)=0
trigger1 = root, command = "holdup"&& var(6)<=0
trigger1 = var(3)=0
trigger2 = var(4) = var(5)
trigger2 = (root, facing = -1 && root, command = "fwd") || (root, facing = 1 && root, command = "back")
var(5) = ifelse(var(19)>0,9,ifelse(var(18)>0,8,ifelse(var(17)>0,7,ifelse(var(16)>0,6,ifelse(var(15)>0,5,ifelse(var(14)>0,4,ifelse(var(13)>0,3,ifelse(var(12)>0,2,ifelse(var(11)>0,1,0)))))))))+(0*(var(6):=6))
[State 8980, Movelist 00 - Pos Y]
type = varset
trigger1 = var(5)=0
var(8) = var(20) + (((13)*var(7))-13)
;----------------------------------------------------------------------------------------
[State 8980, Movelist 01 - Moving up]
type = varadd
triggerall = var(5)=1
trigger1 = root, command = "holdup" && var(6)<=0
trigger1 = var(7)>0
var(7) = -1
[State 8980, Movelist 01 - Moving down]
type = varadd
triggerall = var(5)=1
trigger1 = root, command = "holddown"&& (var(6)<=0||var(7)=0)
trigger1 = var(7)<=var(11)
var(7) = 1
[State 8980, Movelist 01 - Jumpin' into the next visible movelist-section!]
type = varset
triggerall = var(5)=1
trigger1 = root, command = "holddown"&& var(6)<=0
trigger1 = var(7)>var(11)
var(3) = var(7)
[State 8980, Movelist 01 - Jumpin' into the next visible movelist-section!]
type = varset
triggerall = var(5)=1
trigger1 = root, command = "holddown"&& var(6)<=0
trigger1 = var(7)>var(11)
var(7) = 0
[State 8980, Movelist 01 - Jumpin' into the next visible movelist-section!]
type = varset
triggerall = var(5)=1
trigger1 = var(6)<=0
trigger1 = root, command = "back" || root, command = "fwd"
var(7) = 1
[State 8980, Movelist 01 - Jumpin' into the next visible movelist-section!]
type = varset
triggerall = var(5)=1
trigger1 = root, command = "holdup"&& var(6)<=0
trigger1 = var(7)=0
trigger2 = var(7)=1
var(3) = var(7)
[State 8980, Movelist 01 - Jumpin' into the next visible movelist-section!]
type = varset
triggerall = var(5)=1
trigger1 = root, command = "holdup"&& var(6)<=0
trigger1 = var(7)=0
var(7) = ifelse(var(10)>0,var(10),ifelse(var(19)>0,var(19),ifelse(var(18)>0,var(18),ifelse(var(17)>0,var(17),ifelse(var(16)>0,var(16),ifelse(var(15)>0,var(15),ifelse(var(14)>0,var(14),ifelse(var(13)>0,var(13),ifelse(var(12)>0,var(12),var(11))))))))))
[State 8980, Movelist 01 - Jumpin' into the next visible movelist-section!]
type = varset
triggerall = var(5)=1
trigger1 = root, command = "holddown"&& var(6)<=0
trigger1 = var(3)>var(11)
trigger2 = var(4) = var(5)
trigger2 = (root, facing = 1 && root, command = "fwd") || (root, facing = -1 && root, command = "back")
var(5) = ifelse(var(12)>0,2,ifelse(var(13)>0,3,ifelse(var(14)>0,4,ifelse(var(15)>0,5,ifelse(var(16)>0,6,ifelse(var(17)>0,7,ifelse(var(18)>0,8,ifelse(var(19)>0,9,ifelse(var(10)>0,0,1)))))))))
[State 8980, Movelist 01 - Jumpin' into the next visible movelist-section!]
type = varset
triggerall = var(5)=1
trigger1 = root, command = "holdup"&& var(6)<=0
trigger1 = var(3)=0
trigger2 = var(4) = var(5)
trigger2 = (root, facing = -1 && root, command = "fwd") || (root, facing = 1 && root, command = "back")
var(5) = ifelse(var(10)>0,0,ifelse(var(19)>0,9,ifelse(var(18)>0,8,ifelse(var(17)>0,7,ifelse(var(16)>0,6,ifelse(var(15)>0,5,ifelse(var(14)>0,4,ifelse(var(13)>0,3,ifelse(var(12)>0,2,1)))))))))+(0*(var(6):=6))
[State 8980, Movelist 01 - Pos Y]
type = varset
trigger1 = var(5)=1
var(8) = var(21) + (((13)*var(7))-13)
;----------------------------------------------------------------------------------------
[State 8980, Movelist 02 - Moving up]
type = varadd
triggerall = var(5)=2
trigger1 = root, command = "holdup" && var(6)<=0
trigger1 = var(7)>0
var(7) = -1
[State 8980, Movelist 02 - Moving down]
type = varadd
triggerall = var(5)=2
trigger1 = root, command = "holddown"&& (var(6)<=0||var(7)=0)
trigger1 = var(7)<=var(12)
var(7) = 1
[State 8980, Movelist 02 - Jumpin' into the next visible movelist-section!]
type = varset
triggerall = var(5)=2
trigger1 = root, command = "holddown"&& var(6)<=0
trigger1 = var(7)>var(12)
var(3) = var(7)
[State 8980, Movelist 02 - Jumpin' into the next visible movelist-section!]
type = varset
triggerall = var(5)=2
trigger1 = root, command = "holddown"&& var(6)<=0
trigger1 = var(7)>var(12)
var(7) = 0
[State 8980, Movelist 02 - Jumpin' into the next visible movelist-section!]
type = varset
triggerall = var(5)=2
trigger1 = var(6)<=0
trigger1 = root, command = "back" || root, command = "fwd"
var(7) = 1
[State 8980, Movelist 02 - Jumpin' into the next visible movelist-section!]
type = varset
triggerall = var(5)=2
trigger1 = root, command = "holdup"&& var(6)<=0
trigger1 = var(7)=0
trigger2 = var(7)=1
var(3) = var(7)
[State 8980, Movelist 02 - Jumpin' into the next visible movelist-section!]
type = varset
triggerall = var(5)=2
trigger1 = root, command = "holdup"&& var(6)<=0
trigger1 = var(7)=0
var(7) = ifelse(var(11)>0,var(11),ifelse(var(10)>0,var(10),ifelse(var(19)>0,var(19),ifelse(var(18)>0,var(18),ifelse(var(17)>0,var(17),ifelse(var(16)>0,var(16),ifelse(var(15)>0,var(15),ifelse(var(14)>0,var(14),ifelse(var(13)>0,var(13),var(12))))))))))
[State 8980, Movelist 02 - Jumpin' into the next visible movelist-section!]
type = varset
triggerall = var(5)=2
trigger1 = root, command = "holddown"&& var(6)<=0
trigger1 = var(3)>var(12)
trigger2 = var(4) = var(5)
trigger2 = (root, facing = 1 && root, command = "fwd") || (root, facing = -1 && root, command = "back")
var(5) = ifelse(var(13)>0,3,ifelse(var(14)>0,4,ifelse(var(15)>0,5,ifelse(var(16)>0,6,ifelse(var(17)>0,7,ifelse(var(18)>0,8,ifelse(var(19)>0,9,ifelse(var(10)>0,0,ifelse(var(11)>0,1,2)))))))))
[State 8980, Movelist 02 - Jumpin' into the next visible movelist-section!]
type = varset
triggerall = var(5)=2
trigger1 = root, command = "holdup"&& var(6)<=0
trigger1 = var(3)=0
trigger2 = var(4) = var(5)
trigger2 = (root, facing = -1 && root, command = "fwd") || (root, facing = 1 && root, command = "back")
var(5) = ifelse(var(11)>0,1,ifelse(var(10)>0,0,ifelse(var(19)>0,9,ifelse(var(18)>0,8,ifelse(var(17)>0,7,ifelse(var(16)>0,6,ifelse(var(15)>0,5,ifelse(var(14)>0,4,ifelse(var(13)>0,3,2)))))))))+(0*(var(6):=6))
[State 8980, Movelist 02 - Pos Y]
type = varset
trigger1 = var(5)=2
var(8) = var(22) + (((13)*var(7))-13)
;----------------------------------------------------------------------------------------
[State 8980, Movelist 03 - Moving up]
type = varadd
triggerall = var(5)=3
trigger1 = root, command = "holdup" && var(6)<=0
trigger1 = var(7)>0
var(7) = -1
[State 8980, Movelist 03 - Moving down]
type = varadd
triggerall = var(5)=3
trigger1 = root, command = "holddown"&& (var(6)<=0||var(7)=0)
trigger1 = var(7)<=var(13)
var(7) = 1
[State 8980, Movelist 03 - Jumpin' into the next visible movelist-section!]
type = varset
triggerall = var(5)=3
trigger1 = root, command = "holddown"&& var(6)<=0
trigger1 = var(7)>var(13)
var(3) = var(7)
[State 8980, Movelist 03 - Jumpin' into the next visible movelist-section!]
type = varset
triggerall = var(5)=3
trigger1 = root, command = "holddown"&& var(6)<=0
trigger1 = var(7)>var(13)
var(7) = 0
[State 8980, Movelist 03 - Jumpin' into the next visible movelist-section!]
type = varset
triggerall = var(5)=3
trigger1 = var(6)<=0
trigger1 = root, command = "back" || root, command = "fwd"
var(7) = 1
[State 8980, Movelist 03 - Jumpin' into the next visible movelist-section!]
type = varset
triggerall = var(5)=3
trigger1 = root, command = "holdup"&& var(6)<=0
trigger1 = var(7)=0
trigger2 = var(7)=1
var(3) = var(7)
[State 8980, Movelist 03 - Jumpin' into the next visible movelist-section!]
type = varset
triggerall = var(5)=3
trigger1 = root, command = "holdup"&& var(6)<=0
trigger1 = var(7)=0
var(7) = ifelse(var(12)>0,var(12),ifelse(var(11)>0,var(11),ifelse(var(10)>0,var(10),ifelse(var(19)>0,var(19),ifelse(var(18)>0,var(18),ifelse(var(17)>0,var(17),ifelse(var(16)>0,var(16),ifelse(var(15)>0,var(15),ifelse(var(14)>0,var(14),var(13))))))))))
[State 8980, Movelist 03 - Jumpin' into the next visible movelist-section!]
type = varset
triggerall = var(5)=3
trigger1 = root, command = "holddown"&& var(6)<=0
trigger1 = var(3)>var(13)
trigger2 = var(4) = var(5)
trigger2 = (root, facing = 1 && root, command = "fwd") || (root, facing = -1 && root, command = "back")
var(5) = ifelse(var(14)>0,4,ifelse(var(15)>0,5,ifelse(var(16)>0,6,ifelse(var(17)>0,7,ifelse(var(18)>0,8,ifelse(var(19)>0,9,ifelse(var(10)>0,0,ifelse(var(11)>0,1,ifelse(var(12)>0,2,3)))))))))
[State 8980, Movelist 03 - Jumpin' into the next visible movelist-section!]
type = varset
triggerall = var(5)=3
trigger1 = root, command = "holdup"&& var(6)<=0
trigger1 = var(3)=0
trigger2 = var(4) = var(5)
trigger2 = (root, facing = -1 && root, command = "fwd") || (root, facing = 1 && root, command = "back")
var(5) = ifelse(var(12)>0,2,ifelse(var(11)>0,1,ifelse(var(10)>0,0,ifelse(var(19)>0,9,ifelse(var(18)>0,8,ifelse(var(17)>0,7,ifelse(var(16)>0,6,ifelse(var(15)>0,5,ifelse(var(14)>0,4,3)))))))))+(0*(var(6):=6))
[State 8980, Movelist 03 - Pos Y]
type = varset
trigger1 = var(5)=3
var(8) = var(23) + (((13)*var(7))-13)
;----------------------------------------------------------------------------------------
[State 8980, Movelist 04 - Moving up]
type = varadd
triggerall = var(5)=4
trigger1 = root, command = "holdup" && var(6)<=0
trigger1 = var(7)>0
var(7) = -1
[State 8980, Movelist 04 - Moving down]
type = varadd
triggerall = var(5)=4
trigger1 = root, command = "holddown"&& (var(6)<=0||var(7)=0)
trigger1 = var(7)<=var(14)
var(7) = 1
[State 8980, Movelist 04 - Jumpin' into the next visible movelist-section!]
type = varset
triggerall = var(5)=4
trigger1 = root, command = "holddown"&& var(6)<=0
trigger1 = var(7)>var(14)
var(3) = var(7)
[State 8980, Movelist 04 - Jumpin' into the next visible movelist-section!]
type = varset
triggerall = var(5)=4
trigger1 = root, command = "holddown"&& var(6)<=0
trigger1 = var(7)>var(14)
var(7) = 0
[State 8980, Movelist 04 - Jumpin' into the next visible movelist-section!]
type = varset
triggerall = var(5)=4
trigger1 = var(6)<=0
trigger1 = root, command = "back" || root, command = "fwd"
var(7) = 1
[State 8980, Movelist 04 - Jumpin' into the next visible movelist-section!]
type = varset
triggerall = var(5)=4
trigger1 = root, command = "holdup"&& var(6)<=0
trigger1 = var(7)=0
trigger2 = var(7)=1
var(3) = var(7)
[State 8980, Movelist 04 - Jumpin' into the next visible movelist-section!]
type = varset
triggerall = var(5)=4
trigger1 = root, command = "holdup"&& var(6)<=0
trigger1 = var(7)=0
var(7) = ifelse(var(13)>0,var(13),ifelse(var(12)>0,var(12),ifelse(var(11)>0,var(11),ifelse(var(10)>0,var(10),ifelse(var(19)>0,var(19),ifelse(var(18)>0,var(18),ifelse(var(17)>0,var(17),ifelse(var(16)>0,var(16),ifelse(var(15)>0,var(15),var(14))))))))))
[State 8980, Movelist 04 - Jumpin' into the next visible movelist-section!]
type = varset
triggerall = var(5)=4
trigger1 = root, command = "holddown"&& var(6)<=0
trigger1 = var(3)>var(14)
trigger2 = var(4) = var(5)
trigger2 = (root, facing = 1 && root, command = "fwd") || (root, facing = -1 && root, command = "back")
var(5) = ifelse(var(15)>0,5,ifelse(var(16)>0,6,ifelse(var(17)>0,7,ifelse(var(18)>0,8,ifelse(var(19)>0,9,ifelse(var(10)>0,0,ifelse(var(11)>0,1,ifelse(var(12)>0,2,ifelse(var(13)>0,3,4)))))))))
[State 8980, Movelist 04 - Jumpin' into the next visible movelist-section!]
type = varset
triggerall = var(5)=4
trigger1 = root, command = "holdup"&& var(6)<=0
trigger1 = var(3)=0
trigger2 = var(4) = var(5)
trigger2 = (root, facing = -1 && root, command = "fwd") || (root, facing = 1 && root, command = "back")
var(5) = ifelse(var(13)>0,3,ifelse(var(12)>0,2,ifelse(var(11)>0,1,ifelse(var(10)>0,0,ifelse(var(19)>0,9,ifelse(var(18)>0,8,ifelse(var(17)>0,7,ifelse(var(16)>0,6,ifelse(var(15)>0,5,4)))))))))+(0*(var(6):=6))
[State 8980, Movelist 04 - Pos Y]
type = varset
trigger1 = var(5)=4
var(8) = var(24) + (((13)*var(7))-13)
;----------------------------------------------------------------------------------------
[State 8980, Movelist 05 - Moving up]
type = varadd
triggerall = var(5)=5
trigger1 = root, command = "holdup" && var(6)<=0
trigger1 = var(7)>0
var(7) = -1
[State 8980, Movelist 05 - Moving down]
type = varadd
triggerall = var(5)=5
trigger1 = root, command = "holddown"&& (var(6)<=0||var(7)=0)
trigger1 = var(7)<=var(15)
var(7) = 1
[State 8980, Movelist 05 - Jumpin' into the next visible movelist-section!]
type = varset
triggerall = var(5)=5
trigger1 = root, command = "holddown"&& var(6)<=0
trigger1 = var(7)>var(15)
var(3) = var(7)
[State 8980, Movelist 05 - Jumpin' into the next visible movelist-section!]
type = varset
triggerall = var(5)=5
trigger1 = root, command = "holddown"&& var(6)<=0
trigger1 = var(7)>var(15)
var(7) = 0
[State 8980, Movelist 05 - Jumpin' into the next visible movelist-section!]
type = varset
triggerall = var(5)=5
trigger1 = var(6)<=0
trigger1 = root, command = "back" || root, command = "fwd"
var(7) = 1
[State 8980, Movelist 05 - Jumpin' into the next visible movelist-section!]
type = varset
triggerall = var(5)=5
trigger1 = root, command = "holdup"&& var(6)<=0
trigger1 = var(7)=0
trigger2 = var(7)=1
var(3) = var(7)
[State 8980, Movelist 05 - Jumpin' into the next visible movelist-section!]
type = varset
triggerall = var(5)=5
trigger1 = root, command = "holdup"&& var(6)<=0
trigger1 = var(7)=0
var(7) = ifelse(var(14)>0,var(14),ifelse(var(13)>0,var(13),ifelse(var(12)>0,var(12),ifelse(var(11)>0,var(11),ifelse(var(10)>0,var(10),ifelse(var(19)>0,var(19),ifelse(var(18)>0,var(18),ifelse(var(17)>0,var(17),ifelse(var(16)>0,var(16),var(15))))))))))
[State 8980, Movelist 05 - Jumpin' into the next visible movelist-section!]
type = varset
triggerall = var(5)=5
trigger1 = root, command = "holddown"&& var(6)<=0
trigger1 = var(3)>var(15)
trigger2 = var(4) = var(5)
trigger2 = (root, facing = 1 && root, command = "fwd") || (root, facing = -1 && root, command = "back")
var(5) = ifelse(var(16)>0,6,ifelse(var(17)>0,7,ifelse(var(18)>0,8,ifelse(var(19)>0,9,ifelse(var(10)>0,0,ifelse(var(11)>0,1,ifelse(var(12)>0,2,ifelse(var(13)>0,3,ifelse(var(14)>0,4,5)))))))))
[State 8980, Movelist 05 - Jumpin' into the next visible movelist-section!]
type = varset
triggerall = var(5)=5
trigger1 = root, command = "holdup"&& var(6)<=0
trigger1 = var(3)=0
trigger2 = var(4) = var(5)
trigger2 = (root, facing = -1 && root, command = "fwd") || (root, facing = 1 && root, command = "back")
var(5) = ifelse(var(14)>0,4,ifelse(var(13)>0,3,ifelse(var(12)>0,2,ifelse(var(11)>0,1,ifelse(var(10)>0,0,ifelse(var(19)>0,9,ifelse(var(18)>0,8,ifelse(var(17)>0,7,ifelse(var(16)>0,6,5)))))))))+(0*(var(6):=6))
[State 8980, Movelist 05 - Pos Y]
type = varset
trigger1 = var(5)=5
var(8) = var(25) + (((13)*var(7))-13)
;----------------------------------------------------------------------------------------
[State 8980, Movelist 06 - Moving up]
type = varadd
triggerall = var(5)=6
trigger1 = root, command = "holdup" && var(6)<=0
trigger1 = var(7)>0
var(7) = -1
[State 8980, Movelist 06 - Moving down]
type = varadd
triggerall = var(5)=6
trigger1 = root, command = "holddown"&& (var(6)<=0||var(7)=0)
trigger1 = var(7)<=var(16)
var(7) = 1
[State 8980, Movelist 06 - Jumpin' into the next visible movelist-section!]
type = varset
triggerall = var(5)=6
trigger1 = root, command = "holddown"&& var(6)<=0
trigger1 = var(7)>var(16)
var(3) = var(7)
[State 8980, Movelist 06 - Jumpin' into the next visible movelist-section!]
type = varset
triggerall = var(5)=6
trigger1 = root, command = "holddown"&& var(6)<=0
trigger1 = var(7)>var(16)
var(7) = 0
[State 8980, Movelist 06 - Jumpin' into the next visible movelist-section!]
type = varset
triggerall = var(5)=6
trigger1 = var(6)<=0
trigger1 = root, command = "back" || root, command = "fwd"
var(7) = 1
[State 8980, Movelist 06 - Jumpin' into the next visible movelist-section!]
type = varset
triggerall = var(5)=6
trigger1 = root, command = "holdup"&& var(6)<=0
trigger1 = var(7)=0
trigger2 = var(7)=1
var(3) = var(7)
[State 8980, Movelist 06 - Jumpin' into the next visible movelist-section!]
type = varset
triggerall = var(5)=6
trigger1 = root, command = "holdup"&& var(6)<=0
trigger1 = var(7)=0
var(7) = ifelse(var(15)>0,var(15),ifelse(var(14)>0,var(14),ifelse(var(13)>0,var(13),ifelse(var(12)>0,var(12),ifelse(var(11)>0,var(11),ifelse(var(10)>0,var(10),ifelse(var(19)>0,var(19),ifelse(var(18)>0,var(18),ifelse(var(17)>0,var(17),var(16))))))))))
[State 8980, Movelist 06 - Jumpin' into the next visible movelist-section!]
type = varset
triggerall = var(5)=6
trigger1 = root, command = "holddown"&& var(6)<=0
trigger1 = var(3)>var(16)
trigger2 = var(4) = var(5)
trigger2 = (root, facing = 1 && root, command = "fwd") || (root, facing = -1 && root, command = "back")
var(5) = ifelse(var(17)>0,7,ifelse(var(18)>0,8,ifelse(var(19)>0,9,ifelse(var(10)>0,0,ifelse(var(11)>0,1,ifelse(var(12)>0,2,ifelse(var(13)>0,3,ifelse(var(14)>0,4,ifelse(var(15)>0,5,6)))))))))
[State 8980, Movelist 06 - Jumpin' into the next visible movelist-section!]
type = varset
triggerall = var(5)=6
trigger1 = root, command = "holdup"&& var(6)<=0
trigger1 = var(3)=0
trigger2 = var(4) = var(5)
trigger2 = (root, facing = -1 && root, command = "fwd") || (root, facing = 1 && root, command = "back")
var(5) = ifelse(var(15)>0,5,ifelse(var(14)>0,4,ifelse(var(13)>0,3,ifelse(var(12)>0,2,ifelse(var(11)>0,1,ifelse(var(10)>0,0,ifelse(var(19)>0,9,ifelse(var(18)>0,8,ifelse(var(17)>0,7,6)))))))))+(0*(var(6):=6))
[State 8980, Movelist 06 - Pos Y]
type = varset
trigger1 = var(5)=6
var(8) = var(26) + (((13)*var(7))-13)
;----------------------------------------------------------------------------------------
[State 8980, Movelist 07 - Moving up]
type = varadd
triggerall = var(5)=7
trigger1 = root, command = "holdup" && var(6)<=0
trigger1 = var(7)>0
var(7) = -1
[State 8980, Movelist 07 - Moving down]
type = varadd
triggerall = var(5)=7
trigger1 = root, command = "holddown"&& (var(6)<=0||var(7)=0)
trigger1 = var(7)<=var(17)
var(7) = 1
[State 8980, Movelist 07 - Jumpin' into the next visible movelist-section!]
type = varset
triggerall = var(5)=7
trigger1 = root, command = "holddown"&& var(6)<=0
trigger1 = var(7)>var(17)
var(3) = var(7)
[State 8980, Movelist 07 - Jumpin' into the next visible movelist-section!]
type = varset
triggerall = var(5)=7
trigger1 = root, command = "holddown"&& var(6)<=0
trigger1 = var(7)>var(17)
var(7) = 0
[State 8980, Movelist 07 - Jumpin' into the next visible movelist-section!]
type = varset
triggerall = var(5)=7
trigger1 = var(6)<=0
trigger1 = root, command = "back" || root, command = "fwd"
var(7) = 1
[State 8980, Movelist 07 - Jumpin' into the next visible movelist-section!]
type = varset
triggerall = var(5)=7
trigger1 = root, command = "holdup"&& var(6)<=0
trigger1 = var(7)=0
trigger2 = var(7)=1
var(3) = var(7)
[State 8980, Movelist 07 - Jumpin' into the next visible movelist-section!]
type = varset
triggerall = var(5)=7
trigger1 = root, command = "holdup"&& var(6)<=0
trigger1 = var(7)=0
var(7) = ifelse(var(16)>0,var(16),ifelse(var(15)>0,var(15),ifelse(var(14)>0,var(14),ifelse(var(13)>0,var(13),ifelse(var(12)>0,var(12),ifelse(var(11)>0,var(11),ifelse(var(10)>0,var(10),ifelse(var(19)>0,var(19),ifelse(var(18)>0,var(18),var(17))))))))))
[State 8980, Movelist 07 - Jumpin' into the next visible movelist-section!]
type = varset
triggerall = var(5)=7
trigger1 = root, command = "holddown"&& var(6)<=0
trigger1 = var(3)>var(17)
trigger2 = var(4) = var(5)
trigger2 = (root, facing = 1 && root, command = "fwd") || (root, facing = -1 && root, command = "back")
var(5) = ifelse(var(18)>0,8,ifelse(var(19)>0,9,ifelse(var(10)>0,0,ifelse(var(11)>0,1,ifelse(var(12)>0,2,ifelse(var(13)>0,3,ifelse(var(14)>0,4,ifelse(var(15)>0,5,ifelse(var(16)>0,6,7)))))))))
[State 8980, Movelist 07 - Jumpin' into the next visible movelist-section!]
type = varset
triggerall = var(5)=7
trigger1 = root, command = "holdup"&& var(6)<=0
trigger1 = var(3)=0
trigger2 = var(4) = var(5)
trigger2 = (root, facing = -1 && root, command = "fwd") || (root, facing = 1 && root, command = "back")
var(5) = ifelse(var(16)>0,6,ifelse(var(15)>0,5,ifelse(var(14)>0,4,ifelse(var(13)>0,3,ifelse(var(12)>0,2,ifelse(var(11)>0,1,ifelse(var(10)>0,0,ifelse(var(19)>0,9,ifelse(var(18)>0,8,7)))))))))+(0*(var(6):=6))
[State 8980, Movelist 07 - Pos Y]
type = varset
trigger1 = var(5)=7
var(8) = var(27) + (((13)*var(7))-13)
;----------------------------------------------------------------------------------------
[State 8980, Movelist 08 - Moving up]
type = varadd
triggerall = var(5)=8
trigger1 = root, command = "holdup" && var(6)<=0
trigger1 = var(7)>0
var(7) = -1
[State 8980, Movelist 08 - Moving down]
type = varadd
triggerall = var(5)=8
trigger1 = root, command = "holddown"&& (var(6)<=0||var(7)=0)
trigger1 = var(7)<=var(18)
var(7) = 1
[State 8980, Movelist 08 - Jumpin' into the next visible movelist-section!]
type = varset
triggerall = var(5)=8
trigger1 = root, command = "holddown"&& var(6)<=0
trigger1 = var(7)>var(18)
var(3) = var(7)
[State 8980, Movelist 08 - Jumpin' into the next visible movelist-section!]
type = varset
triggerall = var(5)=8
trigger1 = root, command = "holddown"&& var(6)<=0
trigger1 = var(7)>var(18)
var(7) = 0
[State 8980, Movelist 08 - Jumpin' into the next visible movelist-section!]
type = varset
triggerall = var(5)=8
trigger1 = var(6)<=0
trigger1 = root, command = "back" || root, command = "fwd"
var(7) = 1
[State 8980, Movelist 08 - Jumpin' into the next visible movelist-section!]
type = varset
triggerall = var(5)=8
trigger1 = root, command = "holdup"&& var(6)<=0
trigger1 = var(7)=0
trigger2 = var(7)=1
var(3) = var(7)
[State 8980, Movelist 08 - Jumpin' into the next visible movelist-section!]
type = varset
triggerall = var(5)=8
trigger1 = root, command = "holdup"&& var(6)<=0
trigger1 = var(7)=0
var(7) = ifelse(var(17)>0,var(17),ifelse(var(16)>0,var(16),ifelse(var(15)>0,var(15),ifelse(var(14)>0,var(14),ifelse(var(13)>0,var(13),ifelse(var(12)>0,var(12),ifelse(var(11)>0,var(11),ifelse(var(10)>0,var(10),ifelse(var(19)>0,var(19),var(18))))))))))
[State 8980, Movelist 08 - Jumpin' into the next visible movelist-section!]
type = varset
triggerall = var(5)=8
trigger1 = root, command = "holddown"&& var(6)<=0
trigger1 = var(3)>var(18)
trigger2 = var(4) = var(5)
trigger2 = (root, facing = 1 && root, command = "fwd") || (root, facing = -1 && root, command = "back")
var(5) = ifelse(var(19)>0,9,ifelse(var(10)>0,0,ifelse(var(11)>0,1,ifelse(var(12)>0,2,ifelse(var(13)>0,3,ifelse(var(14)>0,4,ifelse(var(15)>0,5,ifelse(var(16)>0,6,ifelse(var(17)>0,7,8)))))))))
[State 8980, Movelist 08 - Jumpin' into the next visible movelist-section!]
type = varset
triggerall = var(5)=8
trigger1 = root, command = "holdup"&& var(6)<=0
trigger1 = var(3)=0
trigger2 = var(4) = var(5)
trigger2 = (root, facing = -1 && root, command = "fwd") || (root, facing = 1 && root, command = "back")
var(5) = ifelse(var(17)>0,7,ifelse(var(16)>0,6,ifelse(var(15)>0,5,ifelse(var(14)>0,4,ifelse(var(13)>0,3,ifelse(var(12)>0,2,ifelse(var(11)>0,1,ifelse(var(10)>0,0,ifelse(var(19)>0,9,8)))))))))+(0*(var(6):=6))
[State 8980, Movelist 08 - Pos Y]
type = varset
trigger1 = var(5)=8
var(8) = var(28) + (((13)*var(7))-13)
;----------------------------------------------------------------------------------------
[State 8980, Movelist 09 - Moving up]
type = varadd
triggerall = var(5)=9
trigger1 = root, command = "holdup" && var(6)<=0
trigger1 = var(7)>0
var(7) = -1
[State 8980, Movelist 09 - Moving down]
type = varadd
triggerall = var(5)=9
trigger1 = root, command = "holddown"&& (var(6)<=0||var(7)=0)
trigger1 = var(7)<=var(19)
var(7) = 1
[State 8980, Movelist 09 - Jumpin' into the next visible movelist-section!]
type = varset
triggerall = var(5)=9
trigger1 = root, command = "holddown"&& var(6)<=0
trigger1 = var(7)>var(19)
var(3) = var(7)
[State 8980, Movelist 09 - Jumpin' into the next visible movelist-section!]
type = varset
triggerall = var(5)=9
trigger1 = root, command = "holddown"&& var(6)<=0
trigger1 = var(7)>var(19)
var(7) = 0
[State 8980, Movelist 09 - Jumpin' into the next visible movelist-section!]
type = varset
triggerall = var(5)=9
trigger1 = var(6)<=0
trigger1 = root, command = "back" || root, command = "fwd"
var(7) = 1
[State 8980, Movelist 09 - Jumpin' into the next visible movelist-section!]
type = varset
triggerall = var(5)=9
trigger1 = root, command = "holdup"&& var(6)<=0
trigger1 = var(7)=0
trigger2 = var(7)=1
var(3) = var(7)
[State 8980, Movelist 09 - Jumpin' into the next visible movelist-section!]
type = varset
triggerall = var(5)=9
trigger1 = root, command = "holdup"&& var(6)<=0
trigger1 = var(7)=0
var(7) = ifelse(var(18)>0,var(18),ifelse(var(17)>0,var(17),ifelse(var(16)>0,var(16),ifelse(var(15)>0,var(15),ifelse(var(14)>0,var(14),ifelse(var(13)>0,var(13),ifelse(var(12)>0,var(12),ifelse(var(11)>0,var(11),ifelse(var(10)>0,var(10),var(19))))))))))
[State 8980, Movelist 09 - Jumpin' into the next visible movelist-section!]
type = varset
triggerall = var(5)=9
trigger1 = root, command = "holddown"&& var(6)<=0
trigger1 = var(3)>var(19)
trigger2 = var(4) = var(5)
trigger2 = (root, facing = 1 && root, command = "fwd") || (root, facing = -1 && root, command = "back")
var(5) = ifelse(var(10)>0,0,ifelse(var(11)>0,1,ifelse(var(12)>0,2,ifelse(var(13)>0,3,ifelse(var(14)>0,4,ifelse(var(15)>0,5,ifelse(var(16)>0,6,ifelse(var(17)>0,7,ifelse(var(18)>0,8,9)))))))))
[State 8980, Movelist 09 - Jumpin' into the next visible movelist-section!]
type = varset
triggerall = var(5)=9
trigger1 = root, command = "holdup"&& var(6)<=0
trigger1 = var(3)=0
trigger2 = var(4) = var(5)
trigger2 = (root, facing = -1 && root, command = "fwd") || (root, facing = 1 && root, command = "back")
var(5) = ifelse(var(18)>0,8,ifelse(var(17)>0,7,ifelse(var(16)>0,6,ifelse(var(15)>0,5,ifelse(var(14)>0,4,ifelse(var(13)>0,3,ifelse(var(12)>0,2,ifelse(var(11)>0,1,ifelse(var(10)>0,0,9)))))))))+(0*(var(6):=6))
[State 8980, Movelist 09 - Pos Y]
type = varset
trigger1 = var(5)=9
var(8) = var(29) + (((13)*var(7))-13)
;----------------------------------------------------------------------------------------

[State 8980, Movelist 00 - Movements-per-second limiter]
type = varadd
triggerall = var(6)<=0
trigger1 = root, command = "holdup" || root, command = "holddown" 
trigger2 = root, command = "back" || root, command = "fwd"
var(6) = 6
;----------------------------------------------------------------------------------------

[State 8980, Pos Y]
type = varadd
trigger1 = root, facing = 1 && root, command = "back"
trigger2 = root, facing = -1 && root, command = "fwd"
var(1) = var(30)
[State 8980, Pos Y]
type = varadd
trigger1 = root, facing = 1 && root, command = "fwd"
trigger2 = root, facing = -1 && root, command = "back"
var(1) = -var(30)

[State 8980, Pos Y];-Half of image height
type = varset
trigger1 = var(1) < (-var(30) + ifelse((gamewidth / gameheight) > 1.67, 142, 204))
var(1) = ceil(-var(30) + ifelse((gamewidth / gameheight) > 1.67, 142, 204))

[State 8980, Pos Y]
type = varset
trigger1 = 1
var(1) = -ifelse(var(8)<((13)*9),0,ifelse(var(8)>((var(30)-(13*9))),((var(30)-(13*18))),(var(8)-((13)*9))))

[State 8980, Pos Y]
type = varset
trigger1 = var(1) > 0
var(1) = 0


[State 8980, SFIV scroll sound]
type = playsnd
triggerall = var(6)=6
trigger1 = root, command = "holdup" || root, command = "holddown"
trigger2 = root, command = "back" || root, command = "fwd"
value = 8980,1
channel = 1


[State 8980, Pos Y]
type = varset
trigger1 = 1
var(4) = var(5)

[State 8980, Pos Y]
type = varset
trigger1 = 1
fvar(14) = (var(5)*100) + var(7)
[State 8980, Pos Y]
type = parentvarset
trigger1 = 1
fvar(14) = fvar(14)

[State 8980, Pause]
type = pause
trigger1 = 1
time = 2
movetime = 2

[State 8980, End]
type = changestate
trigger1 = !playerIDexist(sysvar(0))
trigger2 = root, AIlevel
trigger3 = time
trigger3 = root, command = "start"
value = 8981



;--- Remove ---
[Statedef 8981]
type = A
physics = N
movetype = I
anim = 9741

[State 8980, Pause]
type = pause
trigger1 = time <= 27 && prevstateno = 8980
time = 2
movetime = 2
[State 0, VarAdd]
type = VarAdd
trigger1 = time <10
var(55)=-1*time*(root,facing)
[State 0, VarAdd]
type = VarAdd
trigger1 = time >=10
var(55)=2*(time-9)*(root,facing)

[State 8980, Assert]
type = assertspecial
trigger1 = time <= 15 && prevstateno = 8980
flag = nobardisplay

[State 6200, Fade]
type = palfx
trigger1 = !time
time = 30
;sinadd = -255, -255, -255, 120
sinadd = -255, -255, -255, 240

[State 8980, SFIV Un-Pause sound]
type = playsnd
trigger1 = !time && prevstateno = 8980
value = 8980,2
[State 8981, End]
type = removeexplod
trigger1 = time >= 30
trigger2 = prevstateno = 8982

[State 8981, End]
type = destroyself
trigger1 = time >= 30
trigger2 = prevstateno = 8982



;========================<MOVELIST>=============================
; PAUSE / MOVE LIST!
[Statedef 8982]
type = A
physics = N
movetype = I
anim = 9741

[State 8980, Turn]
type = turn
trigger1 = !time
trigger1 = facing = -1

[State 0, BindToParent]
type = BindToParent
trigger1 = 1
time = 2
pos = 0,0
ignorehitpause = 1
persistent = 1

[State 0, VarSet]
type = VarSet
trigger1 = 1
var(1) = parent, var(1)
[State 0, VarSet]
type = VarSet
trigger1 = 1
var(7) = parent, var(7)
[State 0, VarSet]
type = VarSet
trigger1 = 1
var(5) = parent, var(5)
[State 0, VarSet]
type = VarSet
trigger1 = 1
var(6) = parent, var(6)
[State 0, VarSet]
type = VarSet
trigger1 = 1
var(8) = parent, var(8)
[State 0, VarSet]
type = VarSet
trigger1 = 1
var(10) = parent, var(10)
[State 0, VarSet]
type = VarSet
trigger1 = 1
var(11) = parent, var(11)
[State 0, VarSet]
type = VarSet
trigger1 = 1
var(12) = parent, var(12)
[State 0, VarSet]
type = VarSet
trigger1 = 1
var(13) = parent, var(13)
[State 0, VarSet]
type = VarSet
trigger1 = 1
var(14) = parent, var(14)
[State 0, VarSet]
type = VarSet
trigger1 = 1
var(15) = parent, var(15)
[State 0, VarSet]
type = VarSet
trigger1 = 1
var(16) = parent, var(16)
[State 0, VarSet]
type = VarSet
trigger1 = 1
var(17) = parent, var(17)
[State 0, VarSet]
type = VarSet
trigger1 = 1
var(18) = parent, var(18)
[State 0, VarSet]
type = VarSet
trigger1 = 1
var(19) = parent, var(19)
[State 0, VarSet]
type = VarSet
trigger1 = 1
var(20) = parent, var(20)
[State 0, VarSet]
type = VarSet
trigger1 = 1
var(21) = parent, var(21)
[State 0, VarSet]
type = VarSet
trigger1 = 1
var(22) = parent, var(22)
[State 0, VarSet]
type = VarSet
trigger1 = 1
var(23) = parent, var(23)
[State 0, VarSet]
type = VarSet
trigger1 = 1
var(24) = parent, var(24)
[State 0, VarSet]
type = VarSet
trigger1 = 1
var(25) = parent, var(25)
[State 0, VarSet]
type = VarSet
trigger1 = 1
var(26) = parent, var(26)
[State 0, VarSet]
type = VarSet
trigger1 = 1
var(27) = parent, var(27)
[State 0, VarSet]
type = VarSet
trigger1 = 1
var(28) = parent, var(28)
[State 0, VarSet]
type = VarSet
trigger1 = 1
var(29) = parent, var(29)
[State 0, VarSet]
type = VarSet
trigger1 = 1
var(40) = parent, var(40)
[State 0, VarSet]
type = VarSet
trigger1 = 1
var(41) = parent, var(41)
[State 0, VarSet]
type = VarSet
trigger1 = 1
var(42) = parent, var(42)
[State 0, VarSet]
type = VarSet
trigger1 = 1
var(43) = parent, var(43)
[State 0, VarSet]
type = VarSet
trigger1 = 1
var(44) = parent, var(44)
[State 0, VarSet]
type = VarSet
trigger1 = 1
var(45) = parent, var(45)
[State 0, VarSet]
type = VarSet
trigger1 = 1
var(46) = parent, var(46)
[State 0, VarSet]
type = VarSet
trigger1 = 1
var(47) = parent, var(47)
[State 0, VarSet]
type = VarSet
trigger1 = 1
var(48) = parent, var(48)
[State 0, VarSet]
type = VarSet
trigger1 = 1
var(49) = parent, var(49)
[State 0, VarSet]
type = VarSet
trigger1 = 1
var(50) = parent, var(50)
[State 0, VarSet]
type = VarSet
trigger1 = 1
var(55) = parent, var(55)
[State 0, VarSet]
type = VarSet
trigger1 = 1
var(56) = ifelse(var(5)=0,var(40),ifelse(var(5)=1,var(41),ifelse(var(5)=2,var(42),ifelse(var(5)=3,var(43),ifelse(var(5)=4,var(44),ifelse(var(5)=5,var(45),ifelse(var(5)=6,var(46),ifelse(var(5)=7,var(47),ifelse(var(5)=8,var(48),var(49))))))))))

[State 8981, End]
type = removeexplod
trigger1 = var(6)=6


[State 8990, Movelist - Preview animation]
type = explod
trigger1 = var(7)>0 && !numexplod(407001)
anim = 707000 + (var(5)*10000) + (var(7)*10) +var(56)
ID = 407001
postype = left
pausemovetime = -1
[State 8990, Movelist - Preview animation]
type = modifyexplod
trigger1 = numexplod(407001)
anim = 707000 + (var(5)*10000) + (var(7)*10) +var(56)
ID = 407001
postype = left
pos = 160+(var(55)), var(50)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.33*root,const(size.xscale), 0.33*root,const(size.yscale)
sprpriority = 5
ontop = 1
ownpal = 0
[State 8990, Movelist - Preview BG]
type = explod
trigger1 = !numexplod(507000) && numexplod(407001) ;&& numexplod(407001)
anim = 507000
ID = 507000
postype = left
pausemovetime = -1
[State 8990, Movelist - Preview BG]
type = modifyexplod
trigger1 = numexplod(507000)
anim = 507000
ID = 507000
postype = left
pos = 160+(var(55)), var(50)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
sprpriority = 5
ontop = 1
ownpal = 0
;------------------------------------------------------------------------------
[State 8990, Show Movelist 0 - Normal Throws]
type = explod
trigger1 = !numexplod(8990) && var(10) > 0
anim = 707000+var(40)
ID = 8990
postype = left
pausemovetime = -1
[State 8990, Show Movelist 0 - Normal Throws]
type = modifyexplod
trigger1 = numexplod(8990)
anim = 707000+var(40)
ID = 8990
postype = left
pos = 160+(var(55)), var(20) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
sprpriority = 5
ontop = 1
ownpal = 0

[State 8990, Show Movelist 1 - Unique Attacks]
type = explod
trigger1 = !numexplod(8991) && var(11) > 0
anim = 717000+var(41)
ID = 8991
postype = left
pausemovetime = -1
[State 8990, Show Movelist 1 - Unique Attacks]
type = modifyexplod
trigger1 = numexplod(8991)
anim = 717000+var(41)
ID = 8991
postype = left
pos = 160+(var(55)), var(21) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8990, Show Movelist 2 - Target Combos]
type = explod
trigger1 = !numexplod(8992) && var(12) > 0
anim = 727000+var(42)
ID = 8992
postype = left
pausemovetime = -1
[State 8990, Show Movelist 2 - Target Combos]
type = modifyexplod
trigger1 = numexplod(8992)
anim = 727000+var(42)
ID = 8992
postype = left
pos = 160+(var(55)), var(22) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8990, Show Movelist 3 - Special Moves]
type = explod
trigger1 = !numexplod(8993) && var(13) > 0
anim = 737000+var(43)
ID = 8993
postype = left
pausemovetime = -1
[State 8990, Show Movelist 3 - Special Moves]
type = modifyexplod
trigger1 = numexplod(8993)
anim = 737000+var(43)
ID = 8993
postype = left
pos = 160+(var(55)), var(23) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0
[State 8990, Show Movelist 4 - Lv1 Super Moves]
type = explod
trigger1 = !numexplod(8994) && var(14) > 0
anim = 747000+var(44)
ID = 8994
postype = left
pausemovetime = -1
[State 8990, Show Movelist 4 - Lv1 Super Moves]
type = modifyexplod
trigger1 = numexplod(8994)
anim = 747000+var(44)
ID = 8994
postype = left
pos = 160+(var(55)), var(24) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8990, Show Movelist 5 - Lv2 Super Moves]
type = explod
trigger1 = !numexplod(8995) && var(15) > 0
anim = 757000+var(45)
ID = 8995
postype = left
pausemovetime = -1
[State 8990, Show Movelist 5 - Lv2 Super Moves]
type = modifyexplod
trigger1 = numexplod(8995)
anim = 757000+var(45)
ID = 8995
postype = left
pos = 160+(var(55)), var(25) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8990, Show Movelist 6 - Lv3 Super Moves]
type = explod
trigger1 = !numexplod(8996) && var(16) > 0
anim = 767000+var(46)
ID = 8996
postype = left
pausemovetime = -1
[State 8990, Show Movelist 6 - Lv3 Super Moves]
type = modifyexplod
trigger1 = numexplod(8996)
anim = 767000+var(46)
ID = 8996
postype = left
pos = 160+(var(55)), var(26) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8990, Show Movelist 7 - Lv5 Super Moves]
type = explod
trigger1 = !numexplod(8997) && var(17) > 0
anim = 777000+var(47)
ID = 8997
postype = left
pausemovetime = -1
[State 8990, Show Movelist 7 - Lv5 Super Moves]
type = modifyexplod
trigger1 = numexplod(8997)
anim = 777000+var(47)
ID = 8997
postype = left
pos = 160+(var(55)), var(27) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8990, Show Movelist 8 - System Moves]
type = explod
trigger1 = !numexplod(8998) && var(18) > 0
anim = 787000+var(48)
ID = 8998
postype = left
pausemovetime = -1
[State 8990, Show Movelist 8 - System Moves]
type = modifyexplod
trigger1 = numexplod(8998)
anim = 787000+var(48)
ID = 8998
postype = left
pos = 160+(var(55)), var(28) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8990, Show Movelist 9 - Basic Commands]
type = explod
trigger1 = !numexplod(8999) && var(19) > 0
anim = 797000+var(49)
ID = 8999
postype = left
pausemovetime = -1
[State 8990, Show Movelist 9 - Basic Commands]
type = modifyexplod
trigger1 = numexplod(8999)
anim = 797000+var(49)
ID = 8999
postype = left
pos = 160+(var(55)), var(29) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0


[State 8980, (BLUE BG SELECTOR BAR)]; PST1
type = explod
trigger1 = !numexplod(607006) ;&& var(10) >= 1
anim = 607001
ID = 607006
postype = left
pausemovetime = -1
[State 8980, (BLUE BG SELECTOR BAR)];
type = modifyexplod
trigger1 = numexplod(607006)
anim = 607001
ID = 607006
postype = left
pos = 160+(var(55)), var(8) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
sprpriority = 3
ontop = 1
ownpal = 0


;---------------------------NORMAL THROWS START HERE---------------------------
[State 8980, (WHITE BG 01) - Movelist 0 - Normal Throws]
type = explod
trigger1 = !numexplod(708901) && var(10) >= 1
anim = 607000
ID = 708901
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 01) - Movelist 0 - Normal Throws]
type = modifyexplod
trigger1 = numexplod(708901)
anim = 607000
ID = 708901
postype = left
pos = 160+(var(55)), var(20) + (((13)*1)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
sprpriority = 3
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 02) - Movelist 0 - Normal Throws]
type = explod
trigger1 = !numexplod(708902) && var(10) >= 2
anim = 607000
ID = 708902
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 02) - Movelist 0 - Normal Throws]
type = modifyexplod
trigger1 = numexplod(708902)
anim = 607000
ID = 708902
postype = left
pos = 160+(var(55)), var(20) + (((13)*2)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 03) - Movelist 0 - Normal Throws]
type = explod
trigger1 = !numexplod(708903) && var(10) >= 3
anim = 607000
ID = 708903
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 03) - Movelist 0 - Normal Throws]
type = modifyexplod
trigger1 = numexplod(708903)
anim = 607000
ID = 708903
postype = left
pos = 160+(var(55)), var(20) + (((13)*3)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 04) - Movelist 0 - Normal Throws]
type = explod
trigger1 = !numexplod(708904) && var(10) >= 4
anim = 607000
ID = 708904
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 04) - Movelist 0 - Normal Throws]
type = modifyexplod
trigger1 = numexplod(708904)
anim = 607000
ID = 708904
postype = left
pos = 160+(var(55)), var(20) + (((13)*4)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 05) - Movelist 0 - Normal Throws]
type = explod
trigger1 = !numexplod(708905) && var(10) >= 5
anim = 607000
ID = 708905
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 05) - Movelist 0 - Normal Throws]
type = modifyexplod
trigger1 = numexplod(708905)
anim = 607000
ID = 708905
postype = left
pos = 160+(var(55)), var(20) + (((13)*5)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 06) - Movelist 0 - Normal Throws]
type = explod
trigger1 = !numexplod(708906) && var(10) >= 6
anim = 607000
ID = 708906
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 06) - Movelist 0 - Normal Throws]
type = modifyexplod
trigger1 = numexplod(708906)
anim = 607000
ID = 708906
postype = left
pos = 160+(var(55)), var(20) + (((13)*6)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 07) - Movelist 0 - Normal Throws]
type = explod
trigger1 = !numexplod(708907) && var(10) >= 7
anim = 607000
ID = 708907
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 07) - Movelist 0 - Normal Throws]
type = modifyexplod
trigger1 = numexplod(708907)
anim = 607000
ID = 708907
postype = left
pos = 160+(var(55)), var(20) + (((13)*7)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 08) - Movelist 0 - Normal Throws]
type = explod
trigger1 = !numexplod(708908) && var(10) >= 8
anim = 607000
ID = 708908
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 08) - Movelist 0 - Normal Throws]
type = modifyexplod
trigger1 = numexplod(708908)
anim = 607000
ID = 708908
postype = left
pos = 160+(var(55)), var(20) + (((13)*8)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 09) - Movelist 0 - Normal Throws]
type = explod
trigger1 = !numexplod(708909) && var(10) >= 9
anim = 607000
ID = 708909
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 09) - Movelist 0 - Normal Throws]
type = modifyexplod
trigger1 = numexplod(708909)
anim = 607000
ID = 708909
postype = left
pos = 160+(var(55)), var(20) + (((13)*9)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 10) - Movelist 0 - Normal Throws]
type = explod
trigger1 = !numexplod(708910) && var(10) >= 10
anim = 607000
ID = 708910
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 10) - Movelist 0 - Normal Throws]
type = modifyexplod
trigger1 = numexplod(708910)
anim = 607000
ID = 708910
postype = left
pos = 160+(var(55)), var(20) + (((13)*10)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0
;----------------------------NORMAL THROWS END HERE---------------------------
;-----------------------------------------------------------------------------
;--------------------------UNIQUE ATTACKS START HERE--------------------------
[State 8980, (WHITE BG 01) - Movelist 1 - Unique Attacks]
type = explod
trigger1 = !numexplod(718901) && var(11) >= 1
anim = 607000
ID = 718901
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 01) - Movelist 1 - Unique Attacks]
type = modifyexplod
trigger1 = numexplod(718901)
anim = 607000
ID = 718901
postype = left
pos = 160+(var(55)), var(21) + (((13)*1)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 02) - Movelist 1 - Unique Attacks]
type = explod
trigger1 = !numexplod(718902) && var(11) >= 2
anim = 607000
ID = 718902
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 02) - Movelist 1 - Unique Attacks]
type = modifyexplod
trigger1 = numexplod(718902)
anim = 607000
ID = 718902
postype = left
pos = 160+(var(55)), var(21) + (((13)*2)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 03) - Movelist 1 - Unique Attacks]
type = explod
trigger1 = !numexplod(718903) && var(11) >= 3
anim = 607000
ID = 718903
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 03) - Movelist 1 - Unique Attacks]
type = modifyexplod
trigger1 = numexplod(718903)
anim = 607000
ID = 718903
postype = left
pos = 160+(var(55)), var(21) + (((13)*3)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 04) - Movelist 1 - Unique Attacks]
type = explod
trigger1 = !numexplod(718904) && var(11) >= 4
anim = 607000
ID = 718904
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 04) - Movelist 1 - Unique Attacks]
type = modifyexplod
trigger1 = numexplod(718904)
anim = 607000
ID = 718904
postype = left
pos = 160+(var(55)), var(21) + (((13)*4)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 05) - Movelist 1 - Unique Attacks]
type = explod
trigger1 = !numexplod(718905) && var(11) >= 5
anim = 607000
ID = 718905
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 05) - Movelist 1 - Unique Attacks]
type = modifyexplod
trigger1 = numexplod(718905)
anim = 607000
ID = 718905
postype = left
pos = 160+(var(55)), var(21) + (((13)*5)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 06) - Movelist 1 - Unique Attacks]
type = explod
trigger1 = !numexplod(718906) && var(11) >= 6
anim = 607000
ID = 718906
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 06) - Movelist 1 - Unique Attacks]
type = modifyexplod
trigger1 = numexplod(718906)
anim = 607000
ID = 718906
postype = left
pos = 160+(var(55)), var(21) + (((13)*6)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 07) - Movelist 1 - Unique Attacks]
type = explod
trigger1 = !numexplod(718907) && var(11) >= 7
anim = 607000
ID = 718907
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 07) - Movelist 1 - Unique Attacks]
type = modifyexplod
trigger1 = numexplod(718907)
anim = 607000
ID = 718907
postype = left
pos = 160+(var(55)), var(21) + (((13)*7)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 08) - Movelist 1 - Unique Attacks]
type = explod
trigger1 = !numexplod(718908) && var(11) >= 8
anim = 607000
ID = 718908
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 08) - Movelist 1 - Unique Attacks]
type = modifyexplod
trigger1 = numexplod(718908)
anim = 607000
ID = 718908
postype = left
pos = 160+(var(55)), var(21) + (((13)*8)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 09) - Movelist 1 - Unique Attacks]
type = explod
trigger1 = !numexplod(718909) && var(11) >= 9
anim = 607000
ID = 718909
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 09) - Movelist 1 - Unique Attacks]
type = modifyexplod
trigger1 = numexplod(718909)
anim = 607000
ID = 718909
postype = left
pos = 160+(var(55)), var(21) + (((13)*9)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 10) - Movelist 1 - Unique Attacks]
type = explod
trigger1 = !numexplod(718910) && var(11) >= 10
anim = 607000
ID = 718910
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 10) - Movelist 1 - Unique Attacks]
type = modifyexplod
trigger1 = numexplod(718910)
anim = 607000
ID = 718910
postype = left
pos = 160+(var(55)), var(21) + (((13)*10)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 11) - Movelist 1 - Unique Attacks]
type = explod
trigger1 = !numexplod(718911) && var(11) >= 11
anim = 607000
ID = 718911
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 11) - Movelist 1 - Unique Attacks]
type = modifyexplod
trigger1 = numexplod(718911)
anim = 607000
ID = 718911
postype = left
pos = 160+(var(55)), var(21) + (((13)*11)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 12) - Movelist 1 - Unique Attacks]
type = explod
trigger1 = !numexplod(718912) && var(11) >= 12
anim = 607000
ID = 718912
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 12) - Movelist 1 - Unique Attacks]
type = modifyexplod
trigger1 = numexplod(718912)
anim = 607000
ID = 718912
postype = left
pos = 160+(var(55)), var(21) + (((13)*12)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 13) - Movelist 1 - Unique Attacks]
type = explod
trigger1 = !numexplod(718913) && var(11) >= 13
anim = 607000
ID = 718913
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 13) - Movelist 1 - Unique Attacks]
type = modifyexplod
trigger1 = numexplod(718913)
anim = 607000
ID = 718913
postype = left
pos = 160+(var(55)), var(21) + (((13)*13)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 14) - Movelist 1 - Unique Attacks]
type = explod
trigger1 = !numexplod(718914) && var(11) >= 14
anim = 607000
ID = 718914
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 14) - Movelist 1 - Unique Attacks]
type = modifyexplod
trigger1 = numexplod(718914)
anim = 607000
ID = 718914
postype = left
pos = 160+(var(55)), var(21) + (((13)*14)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 15) - Movelist 1 - Unique Attacks]
type = explod
trigger1 = !numexplod(718915) && var(11) >= 15
anim = 607000
ID = 718915
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 15) - Movelist 1 - Unique Attacks]
type = modifyexplod
trigger1 = numexplod(718915)
anim = 607000
ID = 718915
postype = left
pos = 160+(var(55)), var(21) + (((13)*15)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 16) - Movelist 1 - Unique Attacks]
type = explod
trigger1 = !numexplod(718916) && var(11) >= 16
anim = 607000
ID = 718916
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 16) - Movelist 1 - Unique Attacks]
type = modifyexplod
trigger1 = numexplod(718916)
anim = 607000
ID = 718916
postype = left
pos = 160+(var(55)), var(21) + (((13)*16)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 17) - Movelist 1 - Unique Attacks]
type = explod
trigger1 = !numexplod(718917) && var(11) >= 17
anim = 607000
ID = 718917
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 17) - Movelist 1 - Unique Attacks]
type = modifyexplod
trigger1 = numexplod(718917)
anim = 607000
ID = 718917
postype = left
pos = 160+(var(55)), var(21) + (((13)*17)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 18) - Movelist 1 - Unique Attacks]
type = explod
trigger1 = !numexplod(718918) && var(11) >= 18
anim = 607000
ID = 718918
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 18) - Movelist 1 - Unique Attacks]
type = modifyexplod
trigger1 = numexplod(718918)
anim = 607000
ID = 718918
postype = left
pos = 160+(var(55)), var(21) + (((13)*18)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 19) - Movelist 1 - Unique Attacks]
type = explod
trigger1 = !numexplod(718919) && var(11) >= 19
anim = 607000
ID = 718919
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 19) - Movelist 1 - Unique Attacks]
type = modifyexplod
trigger1 = numexplod(718919)
anim = 607000
ID = 718919
postype = left
pos = 160+(var(55)), var(21) + (((13)*19)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 20) - Movelist 1 - Unique Attacks]
type = explod
trigger1 = !numexplod(718920) && var(11) >= 20
anim = 607000
ID = 718920
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 20) - Movelist 1 - Unique Attacks]
type = modifyexplod
trigger1 = numexplod(718920)
anim = 607000
ID = 718920
postype = left
pos = 160+(var(55)), var(21) + (((13)*20)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0
;----------------------------UNIQUE ATTACKS END HERE--------------------------
;-----------------------------------------------------------------------------
;---------------------------TARGET COMBOS START HERE--------------------------
[State 8980, (WHITE BG 01) - Movelist 2 - Target Combos]
type = explod
trigger1 = !numexplod(728901) && var(12) >= 1
anim = 607000
ID = 728901
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 01) - Movelist 2 - Target Combos]
type = modifyexplod
trigger1 = numexplod(728901)
anim = 607000
ID = 728901
postype = left
pos = 160+(var(55)), var(22) + (((13)*1)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 02) - Movelist 2 - Target Combos]
type = explod
trigger1 = !numexplod(728902) && var(12) >= 2
anim = 607000
ID = 728902
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 02) - Movelist 2 - Target Combos]
type = modifyexplod
trigger1 = numexplod(728902)
anim = 607000
ID = 728902
postype = left
pos = 160+(var(55)), var(22) + (((13)*2)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 03) - Movelist 2 - Target Combos]
type = explod
trigger1 = !numexplod(728903) && var(12) >= 3
anim = 607000
ID = 728903
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 03) - Movelist 2 - Target Combos]
type = modifyexplod
trigger1 = numexplod(728903)
anim = 607000
ID = 728903
postype = left
pos = 160+(var(55)), var(22) + (((13)*3)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 04) - Movelist 2 - Target Combos]
type = explod
trigger1 = !numexplod(728904) && var(12) >= 4
anim = 607000
ID = 728904
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 04) - Movelist 2 - Target Combos]
type = modifyexplod
trigger1 = numexplod(728904)
anim = 607000
ID = 728904
postype = left
pos = 160+(var(55)), var(22) + (((13)*4)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 05) - Movelist 2 - Target Combos]
type = explod
trigger1 = !numexplod(728905) && var(12) >= 5
anim = 607000
ID = 728905
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 05) - Movelist 2 - Target Combos]
type = modifyexplod
trigger1 = numexplod(728905)
anim = 607000
ID = 728905
postype = left
pos = 160+(var(55)), var(22) + (((13)*5)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 06) - Movelist 2 - Target Combos]
type = explod
trigger1 = !numexplod(728906) && var(12) >= 6
anim = 607000
ID = 728906
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 06) - Movelist 2 - Target Combos]
type = modifyexplod
trigger1 = numexplod(728906)
anim = 607000
ID = 728906
postype = left
pos = 160+(var(55)), var(22) + (((13)*6)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 07) - Movelist 2 - Target Combos]
type = explod
trigger1 = !numexplod(728907) && var(12) >= 7
anim = 607000
ID = 728907
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 07) - Movelist 2 - Target Combos]
type = modifyexplod
trigger1 = numexplod(728907)
anim = 607000
ID = 728907
postype = left
pos = 160+(var(55)), var(22) + (((13)*7)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 08) - Movelist 2 - Target Combos]
type = explod
trigger1 = !numexplod(728908) && var(12) >= 8
anim = 607000
ID = 728908
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 08) - Movelist 2 - Target Combos]
type = modifyexplod
trigger1 = numexplod(728908)
anim = 607000
ID = 728908
postype = left
pos = 160+(var(55)), var(22) + (((13)*8)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 09) - Movelist 2 - Target Combos]
type = explod
trigger1 = !numexplod(728909) && var(12) >= 9
anim = 607000
ID = 728909
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 09) - Movelist 2 - Target Combos]
type = modifyexplod
trigger1 = numexplod(728909)
anim = 607000
ID = 728909
postype = left
pos = 160+(var(55)), var(22) + (((13)*9)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 10) - Movelist 2 - Target Combos]
type = explod
trigger1 = !numexplod(728910) && var(12) >= 10
anim = 607000
ID = 728910
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 10) - Movelist 2 - Target Combos]
type = modifyexplod
trigger1 = numexplod(728910)
anim = 607000
ID = 728910
postype = left
pos = 160+(var(55)), var(22) + (((13)*10)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 11) - Movelist 2 - Target Combos]
type = explod
trigger1 = !numexplod(728911) && var(12) >= 11
anim = 607000
ID = 728911
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 11) - Movelist 2 - Target Combos]
type = modifyexplod
trigger1 = numexplod(728911)
anim = 607000
ID = 728911
postype = left
pos = 160+(var(55)), var(22) + (((13)*11)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 12) - Movelist 2 - Target Combos]
type = explod
trigger1 = !numexplod(728912) && var(12) >= 12
anim = 607000
ID = 728912
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 12) - Movelist 2 - Target Combos]
type = modifyexplod
trigger1 = numexplod(728912)
anim = 607000
ID = 728912
postype = left
pos = 160+(var(55)), var(22) + (((13)*12)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 13) - Movelist 2 - Target Combos]
type = explod
trigger1 = !numexplod(728913) && var(12) >= 13
anim = 607000
ID = 728913
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 13) - Movelist 2 - Target Combos]
type = modifyexplod
trigger1 = numexplod(728913)
anim = 607000
ID = 728913
postype = left
pos = 160+(var(55)), var(22) + (((13)*13)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 14) - Movelist 2 - Target Combos]
type = explod
trigger1 = !numexplod(728914) && var(12) >= 14
anim = 607000
ID = 728914
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 14) - Movelist 2 - Target Combos]
type = modifyexplod
trigger1 = numexplod(728914)
anim = 607000
ID = 728914
postype = left
pos = 160+(var(55)), var(22) + (((13)*14)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 15) - Movelist 2 - Target Combos]
type = explod
trigger1 = !numexplod(728915) && var(12) >= 15
anim = 607000
ID = 728915
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 15) - Movelist 2 - Target Combos]
type = modifyexplod
trigger1 = numexplod(728915)
anim = 607000
ID = 728915
postype = left
pos = 160+(var(55)), var(22) + (((13)*15)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 16) - Movelist 2 - Target Combos]
type = explod
trigger1 = !numexplod(728916) && var(12) >= 16
anim = 607000
ID = 728916
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 16) - Movelist 2 - Target Combos]
type = modifyexplod
trigger1 = numexplod(728916)
anim = 607000
ID = 728916
postype = left
pos = 160+(var(55)), var(22) + (((13)*16)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 17) - Movelist 2 - Target Combos]
type = explod
trigger1 = !numexplod(728917) && var(12) >= 17
anim = 607000
ID = 728917
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 17) - Movelist 2 - Target Combos]
type = modifyexplod
trigger1 = numexplod(728917)
anim = 607000
ID = 728917
postype = left
pos = 160+(var(55)), var(22) + (((13)*17)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 18) - Movelist 2 - Target Combos]
type = explod
trigger1 = !numexplod(728918) && var(12) >= 18
anim = 607000
ID = 728918
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 18) - Movelist 2 - Target Combos]
type = modifyexplod
trigger1 = numexplod(728918)
anim = 607000
ID = 728918
postype = left
pos = 160+(var(55)), var(22) + (((13)*18)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 19) - Movelist 2 - Target Combos]
type = explod
trigger1 = !numexplod(728919) && var(12) >= 19
anim = 607000
ID = 728919
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 19) - Movelist 2 - Target Combos]
type = modifyexplod
trigger1 = numexplod(728919)
anim = 607000
ID = 728919
postype = left
pos = 160+(var(55)), var(22) + (((13)*19)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 20) - Movelist 2 - Target Combos]
type = explod
trigger1 = !numexplod(728920) && var(12) >= 20
anim = 607000
ID = 728920
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 20) - Movelist 2 - Target Combos]
type = modifyexplod
trigger1 = numexplod(728920)
anim = 607000
ID = 728920
postype = left
pos = 160+(var(55)), var(22) + (((13)*20)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0
;----------------------------TARGET COMBOS END HERE---------------------------
;-----------------------------------------------------------------------------
;---------------------------SPECIAL MOVES START HERE--------------------------
[State 8980, (WHITE BG 01) - Movelist 3 - Special Moves]
type = explod
trigger1 = !numexplod(738901) && var(13) >= 1
anim = 607000
ID = 738901
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 01) - Movelist 3 - Special Moves]
type = modifyexplod
trigger1 = numexplod(738901)
anim = 607000
ID = 738901
postype = left
pos = 160+(var(55)), var(23) + (((13)*1)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 02) - Movelist 3 - Special Moves]
type = explod
trigger1 = !numexplod(738902) && var(13) >= 2
anim = 607000
ID = 738902
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 02) - Movelist 3 - Special Moves]
type = modifyexplod
trigger1 = numexplod(738902)
anim = 607000
ID = 738902
postype = left
pos = 160+(var(55)), var(23) + (((13)*2)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 03) - Movelist 3 - Special Moves]
type = explod
trigger1 = !numexplod(738903) && var(13) >= 3
anim = 607000
ID = 738903
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 03) - Movelist 3 - Special Moves]
type = modifyexplod
trigger1 = numexplod(738903)
anim = 607000
ID = 738903
postype = left
pos = 160+(var(55)), var(23) + (((13)*3)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 04) - Movelist 3 - Special Moves]
type = explod
trigger1 = !numexplod(738904) && var(13) >= 4
anim = 607000
ID = 738904
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 04) - Movelist 3 - Special Moves]
type = modifyexplod
trigger1 = numexplod(738904)
anim = 607000
ID = 738904
postype = left
pos = 160+(var(55)), var(23) + (((13)*4)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 05) - Movelist 3 - Special Moves]
type = explod
trigger1 = !numexplod(738905) && var(13) >= 5
anim = 607000
ID = 738905
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 05) - Movelist 3 - Special Moves]
type = modifyexplod
trigger1 = numexplod(738905)
anim = 607000
ID = 738905
postype = left
pos = 160+(var(55)), var(23) + (((13)*5)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 06) - Movelist 3 - Special Moves]
type = explod
trigger1 = !numexplod(738906) && var(13) >= 6
anim = 607000
ID = 738906
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 06) - Movelist 3 - Special Moves]
type = modifyexplod
trigger1 = numexplod(738906)
anim = 607000
ID = 738906
postype = left
pos = 160+(var(55)), var(23) + (((13)*6)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 07) - Movelist 3 - Special Moves]
type = explod
trigger1 = !numexplod(738907) && var(13) >= 7
anim = 607000
ID = 738907
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 07) - Movelist 3 - Special Moves]
type = modifyexplod
trigger1 = numexplod(738907)
anim = 607000
ID = 738907
postype = left
pos = 160+(var(55)), var(23) + (((13)*7)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 08) - Movelist 3 - Special Moves]
type = explod
trigger1 = !numexplod(738908) && var(13) >= 8
anim = 607000
ID = 738908
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 08) - Movelist 3 - Special Moves]
type = modifyexplod
trigger1 = numexplod(738908)
anim = 607000
ID = 738908
postype = left
pos = 160+(var(55)), var(23) + (((13)*8)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 09) - Movelist 3 - Special Moves]
type = explod
trigger1 = !numexplod(738909) && var(13) >= 9
anim = 607000
ID = 738909
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 09) - Movelist 3 - Special Moves]
type = modifyexplod
trigger1 = numexplod(738909)
anim = 607000
ID = 738909
postype = left
pos = 160+(var(55)), var(23) + (((13)*9)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 10) - Movelist 3 - Special Moves]
type = explod
trigger1 = !numexplod(738910) && var(13) >= 10
anim = 607000
ID = 738910
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 10) - Movelist 3 - Special Moves]
type = modifyexplod
trigger1 = numexplod(738910)
anim = 607000
ID = 738910
postype = left
pos = 160+(var(55)), var(23) + (((13)*10)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 11) - Movelist 3 - Special Moves]
type = explod
trigger1 = !numexplod(738911) && var(13) >= 11
anim = 607000
ID = 738911
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 11) - Movelist 3 - Special Moves]
type = modifyexplod
trigger1 = numexplod(738911)
anim = 607000
ID = 738911
postype = left
pos = 160+(var(55)), var(23) + (((13)*11)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 12) - Movelist 3 - Special Moves]
type = explod
trigger1 = !numexplod(738912) && var(13) >= 12
anim = 607000
ID = 738912
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 12) - Movelist 3 - Special Moves]
type = modifyexplod
trigger1 = numexplod(738912)
anim = 607000
ID = 738912
postype = left
pos = 160+(var(55)), var(23) + (((13)*12)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 13) - Movelist 3 - Special Moves]
type = explod
trigger1 = !numexplod(738913) && var(13) >= 13
anim = 607000
ID = 738913
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 13) - Movelist 3 - Special Moves]
type = modifyexplod
trigger1 = numexplod(738913)
anim = 607000
ID = 738913
postype = left
pos = 160+(var(55)), var(23) + (((13)*13)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 14) - Movelist 3 - Special Moves]
type = explod
trigger1 = !numexplod(738914) && var(13) >= 14
anim = 607000
ID = 738914
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 14) - Movelist 3 - Special Moves]
type = modifyexplod
trigger1 = numexplod(738914)
anim = 607000
ID = 738914
postype = left
pos = 160+(var(55)), var(23) + (((13)*14)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 15) - Movelist 3 - Special Moves]
type = explod
trigger1 = !numexplod(738915) && var(13) >= 15
anim = 607000
ID = 738915
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 15) - Movelist 3 - Special Moves]
type = modifyexplod
trigger1 = numexplod(738915)
anim = 607000
ID = 738915
postype = left
pos = 160+(var(55)), var(23) + (((13)*15)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 16) - Movelist 3 - Special Moves]
type = explod
trigger1 = !numexplod(738916) && var(13) >= 16
anim = 607000
ID = 738916
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 16) - Movelist 3 - Special Moves]
type = modifyexplod
trigger1 = numexplod(738916)
anim = 607000
ID = 738916
postype = left
pos = 160+(var(55)), var(23) + (((13)*16)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 17) - Movelist 3 - Special Moves]
type = explod
trigger1 = !numexplod(738917) && var(13) >= 17
anim = 607000
ID = 738917
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 17) - Movelist 3 - Special Moves]
type = modifyexplod
trigger1 = numexplod(738917)
anim = 607000
ID = 738917
postype = left
pos = 160+(var(55)), var(23) + (((13)*17)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 18) - Movelist 3 - Special Moves]
type = explod
trigger1 = !numexplod(738918) && var(13) >= 18
anim = 607000
ID = 738918
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 18) - Movelist 3 - Special Moves]
type = modifyexplod
trigger1 = numexplod(738918)
anim = 607000
ID = 738918
postype = left
pos = 160+(var(55)), var(23) + (((13)*18)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 19) - Movelist 3 - Special Moves]
type = explod
trigger1 = !numexplod(738919) && var(13) >= 19
anim = 607000
ID = 738919
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 19) - Movelist 3 - Special Moves]
type = modifyexplod
trigger1 = numexplod(738919)
anim = 607000
ID = 738919
postype = left
pos = 160+(var(55)), var(23) + (((13)*19)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 20) - Movelist 3 - Special Moves]
type = explod
trigger1 = !numexplod(738920) && var(13) >= 20
anim = 607000
ID = 738920
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 20) - Movelist 3 - Special Moves]
type = modifyexplod
trigger1 = numexplod(738920)
anim = 607000
ID = 738920
postype = left
pos = 160+(var(55)), var(23) + (((13)*20)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0
;----------------------------SPECIAL MOVES END HERE---------------------------
;-----------------------------------------------------------------------------
;--------------------------Lv1 SUPER MOVES START HERE-------------------------
[State 8980, (WHITE BG 01) - Movelist 4 - Lv1 Super Moves]
type = explod
trigger1 = !numexplod(748901) && var(14) >= 1
anim = 607000
ID = 748901
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 01) - Movelist 4 - Lv1 Super Moves]
type = modifyexplod
trigger1 = numexplod(748901)
anim = 607000
ID = 748901
postype = left
pos = 160+(var(55)), var(24) + (((13)*1)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 02) - Movelist 4 - Lv1 Super Moves]
type = explod
trigger1 = !numexplod(748902) && var(14) >= 2
anim = 607000
ID = 748902
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 02) - Movelist 4 - Lv1 Super Moves]
type = modifyexplod
trigger1 = numexplod(748902)
anim = 607000
ID = 748902
postype = left
pos = 160+(var(55)), var(24) + (((13)*2)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 03) - Movelist 4 - Lv1 Super Moves]
type = explod
trigger1 = !numexplod(748903) && var(14) >= 3
anim = 607000
ID = 748903
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 03) - Movelist 4 - Lv1 Super Moves]
type = modifyexplod
trigger1 = numexplod(748903)
anim = 607000
ID = 748903
postype = left
pos = 160+(var(55)), var(24) + (((13)*3)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 04) - Movelist 4 - Lv1 Super Moves]
type = explod
trigger1 = !numexplod(748904) && var(14) >= 4
anim = 607000
ID = 748904
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 04) - Movelist 4 - Lv1 Super Moves]
type = modifyexplod
trigger1 = numexplod(748904)
anim = 607000
ID = 748904
postype = left
pos = 160+(var(55)), var(24) + (((13)*4)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 05) - Movelist 4 - Lv1 Super Moves]
type = explod
trigger1 = !numexplod(748905) && var(14) >= 5
anim = 607000
ID = 748905
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 05) - Movelist 4 - Lv1 Super Moves]
type = modifyexplod
trigger1 = numexplod(748905)
anim = 607000
ID = 748905
postype = left
pos = 160+(var(55)), var(24) + (((13)*5)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 06) - Movelist 4 - Lv1 Super Moves]
type = explod
trigger1 = !numexplod(748906) && var(14) >= 6
anim = 607000
ID = 748906
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 06) - Movelist 4 - Lv1 Super Moves]
type = modifyexplod
trigger1 = numexplod(748906)
anim = 607000
ID = 748906
postype = left
pos = 160+(var(55)), var(24) + (((13)*6)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 07) - Movelist 4 - Lv1 Super Moves]
type = explod
trigger1 = !numexplod(748907) && var(14) >= 7
anim = 607000
ID = 748907
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 07) - Movelist 4 - Lv1 Super Moves]
type = modifyexplod
trigger1 = numexplod(748907)
anim = 607000
ID = 748907
postype = left
pos = 160+(var(55)), var(24) + (((13)*7)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 08) - Movelist 4 - Lv1 Super Moves]
type = explod
trigger1 = !numexplod(748908) && var(14) >= 8
anim = 607000
ID = 748908
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 08) - Movelist 4 - Lv1 Super Moves]
type = modifyexplod
trigger1 = numexplod(748908)
anim = 607000
ID = 748908
postype = left
pos = 160+(var(55)), var(24) + (((13)*8)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 09) - Movelist 4 - Lv1 Super Moves]
type = explod
trigger1 = !numexplod(748909) && var(14) >= 9
anim = 607000
ID = 748909
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 09) - Movelist 4 - Lv1 Super Moves]
type = modifyexplod
trigger1 = numexplod(748909)
anim = 607000
ID = 748909
postype = left
pos = 160+(var(55)), var(24) + (((13)*9)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 10) - Movelist 4 - Lv1 Super Moves]
type = explod
trigger1 = !numexplod(748910) && var(14) >= 10
anim = 607000
ID = 748910
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 10) - Movelist 4 - Lv1 Super Moves]
type = modifyexplod
trigger1 = numexplod(748910)
anim = 607000
ID = 748910
postype = left
pos = 160+(var(55)), var(24) + (((13)*10)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 11) - Movelist 4 - Lv1 Super Moves]
type = explod
trigger1 = !numexplod(748911) && var(14) >= 11
anim = 607000
ID = 748911
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 11) - Movelist 4 - Lv1 Super Moves]
type = modifyexplod
trigger1 = numexplod(748911)
anim = 607000
ID = 748911
postype = left
pos = 160+(var(55)), var(24) + (((13)*11)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 12) - Movelist 4 - Lv1 Super Moves]
type = explod
trigger1 = !numexplod(748912) && var(14) >= 12
anim = 607000
ID = 748912
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 12) - Movelist 4 - Lv1 Super Moves]
type = modifyexplod
trigger1 = numexplod(748912)
anim = 607000
ID = 748912
postype = left
pos = 160+(var(55)), var(24) + (((13)*12)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 13) - Movelist 4 - Lv1 Super Moves]
type = explod
trigger1 = !numexplod(748913) && var(14) >= 13
anim = 607000
ID = 748913
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 13) - Movelist 4 - Lv1 Super Moves]
type = modifyexplod
trigger1 = numexplod(748913)
anim = 607000
ID = 748913
postype = left
pos = 160+(var(55)), var(24) + (((13)*13)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 14) - Movelist 4 - Lv1 Super Moves]
type = explod
trigger1 = !numexplod(748914) && var(14) >= 14
anim = 607000
ID = 748914
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 14) - Movelist 4 - Lv1 Super Moves]
type = modifyexplod
trigger1 = numexplod(748914)
anim = 607000
ID = 748914
postype = left
pos = 160+(var(55)), var(24) + (((13)*14)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 15) - Movelist 4 - Lv1 Super Moves]
type = explod
trigger1 = !numexplod(748915) && var(14) >= 15
anim = 607000
ID = 748915
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 15) - Movelist 4 - Lv1 Super Moves]
type = modifyexplod
trigger1 = numexplod(748915)
anim = 607000
ID = 748915
postype = left
pos = 160+(var(55)), var(24) + (((13)*15)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 16) - Movelist 4 - Lv1 Super Moves]
type = explod
trigger1 = !numexplod(748916) && var(14) >= 16
anim = 607000
ID = 748916
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 16) - Movelist 4 - Lv1 Super Moves]
type = modifyexplod
trigger1 = numexplod(748916)
anim = 607000
ID = 748916
postype = left
pos = 160+(var(55)), var(24) + (((13)*16)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 17) - Movelist 4 - Lv1 Super Moves]
type = explod
trigger1 = !numexplod(748917) && var(14) >= 17
anim = 607000
ID = 748917
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 17) - Movelist 4 - Lv1 Super Moves]
type = modifyexplod
trigger1 = numexplod(748917)
anim = 607000
ID = 748917
postype = left
pos = 160+(var(55)), var(24) + (((13)*17)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 18) - Movelist 4 - Lv1 Super Moves]
type = explod
trigger1 = !numexplod(748918) && var(14) >= 18
anim = 607000
ID = 748918
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 18) - Movelist 4 - Lv1 Super Moves]
type = modifyexplod
trigger1 = numexplod(748918)
anim = 607000
ID = 748918
postype = left
pos = 160+(var(55)), var(24) + (((13)*18)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 19) - Movelist 4 - Lv1 Super Moves]
type = explod
trigger1 = !numexplod(748919) && var(14) >= 19
anim = 607000
ID = 748919
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 19) - Movelist 4 - Lv1 Super Moves]
type = modifyexplod
trigger1 = numexplod(748919)
anim = 607000
ID = 748919
postype = left
pos = 160+(var(55)), var(24) + (((13)*19)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 20) - Movelist 4 - Lv1 Super Moves]
type = explod
trigger1 = !numexplod(748920) && var(14) >= 20
anim = 607000
ID = 748920
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 20) - Movelist 4 - Lv1 Super Moves]
type = modifyexplod
trigger1 = numexplod(748920)
anim = 607000
ID = 748920
postype = left
pos = 160+(var(55)), var(24) + (((13)*20)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0
;---------------------------Lv1 SUPER MOVES END HERE--------------------------
;-----------------------------------------------------------------------------
;--------------------------Lv2 SUPER MOVES START HERE-------------------------
[State 8980, (WHITE BG 01) - Movelist 5 - Lv2 Super Moves]
type = explod
trigger1 = !numexplod(758901) && var(15) >= 1
anim = 607000
ID = 758901
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 01) - Movelist 5 - Lv2 Super Moves]
type = modifyexplod
trigger1 = numexplod(758901)
anim = 607000
ID = 758901
postype = left
pos = 160+(var(55)), var(25) + (((13)*1)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 02) - Movelist 5 - Lv2 Super Moves]
type = explod
trigger1 = !numexplod(758902) && var(15) >= 2
anim = 607000
ID = 758902
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 02) - Movelist 5 - Lv2 Super Moves]
type = modifyexplod
trigger1 = numexplod(758902)
anim = 607000
ID = 758902
postype = left
pos = 160+(var(55)), var(25) + (((13)*2)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 03) - Movelist 5 - Lv2 Super Moves]
type = explod
trigger1 = !numexplod(758903) && var(15) >= 3
anim = 607000
ID = 758903
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 03) - Movelist 5 - Lv2 Super Moves]
type = modifyexplod
trigger1 = numexplod(758903)
anim = 607000
ID = 758903
postype = left
pos = 160+(var(55)), var(25) + (((13)*3)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 04) - Movelist 5 - Lv2 Super Moves]
type = explod
trigger1 = !numexplod(758904) && var(15) >= 4
anim = 607000
ID = 758904
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 04) - Movelist 5 - Lv2 Super Moves]
type = modifyexplod
trigger1 = numexplod(758904)
anim = 607000
ID = 758904
postype = left
pos = 160+(var(55)), var(25) + (((13)*4)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 05) - Movelist 5 - Lv2 Super Moves]
type = explod
trigger1 = !numexplod(758905) && var(15) >= 5
anim = 607000
ID = 758905
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 05) - Movelist 5 - Lv2 Super Moves]
type = modifyexplod
trigger1 = numexplod(758905)
anim = 607000
ID = 758905
postype = left
pos = 160+(var(55)), var(25) + (((13)*5)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 06) - Movelist 5 - Lv2 Super Moves]
type = explod
trigger1 = !numexplod(758906) && var(15) >= 6
anim = 607000
ID = 758906
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 06) - Movelist 5 - Lv2 Super Moves]
type = modifyexplod
trigger1 = numexplod(758906)
anim = 607000
ID = 758906
postype = left
pos = 160+(var(55)), var(25) + (((13)*6)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 07) - Movelist 5 - Lv2 Super Moves]
type = explod
trigger1 = !numexplod(758907) && var(15) >= 7
anim = 607000
ID = 758907
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 07) - Movelist 5 - Lv2 Super Moves]
type = modifyexplod
trigger1 = numexplod(758907)
anim = 607000
ID = 758907
postype = left
pos = 160+(var(55)), var(25) + (((13)*7)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 08) - Movelist 5 - Lv2 Super Moves]
type = explod
trigger1 = !numexplod(758908) && var(15) >= 8
anim = 607000
ID = 758908
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 08) - Movelist 5 - Lv2 Super Moves]
type = modifyexplod
trigger1 = numexplod(758908)
anim = 607000
ID = 758908
postype = left
pos = 160+(var(55)), var(25) + (((13)*8)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 09) - Movelist 5 - Lv2 Super Moves]
type = explod
trigger1 = !numexplod(758909) && var(15) >= 9
anim = 607000
ID = 758909
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 09) - Movelist 5 - Lv2 Super Moves]
type = modifyexplod
trigger1 = numexplod(758909)
anim = 607000
ID = 758909
postype = left
pos = 160+(var(55)), var(25) + (((13)*9)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 10) - Movelist 5 - Lv2 Super Moves]
type = explod
trigger1 = !numexplod(758910) && var(15) >= 10
anim = 607000
ID = 758910
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 10) - Movelist 5 - Lv2 Super Moves]
type = modifyexplod
trigger1 = numexplod(758910)
anim = 607000
ID = 758910
postype = left
pos = 160+(var(55)), var(25) + (((13)*10)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 11) - Movelist 5 - Lv2 Super Moves]
type = explod
trigger1 = !numexplod(758911) && var(15) >= 11
anim = 607000
ID = 758911
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 11) - Movelist 5 - Lv2 Super Moves]
type = modifyexplod
trigger1 = numexplod(758911)
anim = 607000
ID = 758911
postype = left
pos = 160+(var(55)), var(25) + (((13)*11)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 12) - Movelist 5 - Lv2 Super Moves]
type = explod
trigger1 = !numexplod(758912) && var(15) >= 12
anim = 607000
ID = 758912
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 12) - Movelist 5 - Lv2 Super Moves]
type = modifyexplod
trigger1 = numexplod(758912)
anim = 607000
ID = 758912
postype = left
pos = 160+(var(55)), var(25) + (((13)*12)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 13) - Movelist 5 - Lv2 Super Moves]
type = explod
trigger1 = !numexplod(758913) && var(15) >= 13
anim = 607000
ID = 758913
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 13) - Movelist 5 - Lv2 Super Moves]
type = modifyexplod
trigger1 = numexplod(758913)
anim = 607000
ID = 758913
postype = left
pos = 160+(var(55)), var(25) + (((13)*13)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 14) - Movelist 5 - Lv2 Super Moves]
type = explod
trigger1 = !numexplod(758914) && var(15) >= 14
anim = 607000
ID = 758914
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 14) - Movelist 5 - Lv2 Super Moves]
type = modifyexplod
trigger1 = numexplod(758914)
anim = 607000
ID = 758914
postype = left
pos = 160+(var(55)), var(25) + (((13)*14)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 15) - Movelist 5 - Lv2 Super Moves]
type = explod
trigger1 = !numexplod(758915) && var(15) >= 15
anim = 607000
ID = 758915
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 15) - Movelist 5 - Lv2 Super Moves]
type = modifyexplod
trigger1 = numexplod(758915)
anim = 607000
ID = 758915
postype = left
pos = 160+(var(55)), var(25) + (((13)*15)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 16) - Movelist 5 - Lv2 Super Moves]
type = explod
trigger1 = !numexplod(758916) && var(15) >= 16
anim = 607000
ID = 758916
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 16) - Movelist 5 - Lv2 Super Moves]
type = modifyexplod
trigger1 = numexplod(758916)
anim = 607000
ID = 758916
postype = left
pos = 160+(var(55)), var(25) + (((13)*16)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 17) - Movelist 5 - Lv2 Super Moves]
type = explod
trigger1 = !numexplod(758917) && var(15) >= 17
anim = 607000
ID = 758917
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 17) - Movelist 5 - Lv2 Super Moves]
type = modifyexplod
trigger1 = numexplod(758917)
anim = 607000
ID = 758917
postype = left
pos = 160+(var(55)), var(25) + (((13)*17)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 18) - Movelist 5 - Lv2 Super Moves]
type = explod
trigger1 = !numexplod(758918) && var(15) >= 18
anim = 607000
ID = 758918
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 18) - Movelist 5 - Lv2 Super Moves]
type = modifyexplod
trigger1 = numexplod(758918)
anim = 607000
ID = 758918
postype = left
pos = 160+(var(55)), var(25) + (((13)*18)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 19) - Movelist 5 - Lv2 Super Moves]
type = explod
trigger1 = !numexplod(758919) && var(15) >= 19
anim = 607000
ID = 758919
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 19) - Movelist 5 - Lv2 Super Moves]
type = modifyexplod
trigger1 = numexplod(758919)
anim = 607000
ID = 758919
postype = left
pos = 160+(var(55)), var(25) + (((13)*19)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 20) - Movelist 5 - Lv2 Super Moves]
type = explod
trigger1 = !numexplod(758920) && var(15) >= 20
anim = 607000
ID = 758920
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 20) - Movelist 5 - Lv2 Super Moves]
type = modifyexplod
trigger1 = numexplod(758920)
anim = 607000
ID = 758920
postype = left
pos = 160+(var(55)), var(25) + (((13)*20)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0
;---------------------------Lv2 SUPER MOVES END HERE--------------------------
;-----------------------------------------------------------------------------
;--------------------------Lv3 SUPER MOVES START HERE-------------------------
[State 8980, (WHITE BG 01) - Movelist 6 - Lv3 Super Moves]
type = explod
trigger1 = !numexplod(768901) && var(16) >= 1
anim = 607000
ID = 768901
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 01) - Movelist 6 - Lv3 Super Moves]
type = modifyexplod
trigger1 = numexplod(768901)
anim = 607000
ID = 768901
postype = left
pos = 160+(var(55)), var(26) + (((13)*1)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 02) - Movelist 6 - Lv3 Super Moves]
type = explod
trigger1 = !numexplod(768902) && var(16) >= 2
anim = 607000
ID = 768902
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 02) - Movelist 6 - Lv3 Super Moves]
type = modifyexplod
trigger1 = numexplod(768902)
anim = 607000
ID = 768902
postype = left
pos = 160+(var(55)), var(26) + (((13)*2)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 03) - Movelist 6 - Lv3 Super Moves]
type = explod
trigger1 = !numexplod(768903) && var(16) >= 3
anim = 607000
ID = 768903
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 03) - Movelist 6 - Lv3 Super Moves]
type = modifyexplod
trigger1 = numexplod(768903)
anim = 607000
ID = 768903
postype = left
pos = 160+(var(55)), var(26) + (((13)*3)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 04) - Movelist 6 - Lv3 Super Moves]
type = explod
trigger1 = !numexplod(768904) && var(16) >= 4
anim = 607000
ID = 768904
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 04) - Movelist 6 - Lv3 Super Moves]
type = modifyexplod
trigger1 = numexplod(768904)
anim = 607000
ID = 768904
postype = left
pos = 160+(var(55)), var(26) + (((13)*4)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 05) - Movelist 6 - Lv3 Super Moves]
type = explod
trigger1 = !numexplod(768905) && var(16) >= 5
anim = 607000
ID = 768905
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 05) - Movelist 6 - Lv3 Super Moves]
type = modifyexplod
trigger1 = numexplod(768905)
anim = 607000
ID = 768905
postype = left
pos = 160+(var(55)), var(26) + (((13)*5)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 06) - Movelist 6 - Lv3 Super Moves]
type = explod
trigger1 = !numexplod(768906) && var(16) >= 6
anim = 607000
ID = 768906
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 06) - Movelist 6 - Lv3 Super Moves]
type = modifyexplod
trigger1 = numexplod(768906)
anim = 607000
ID = 768906
postype = left
pos = 160+(var(55)), var(26) + (((13)*6)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 07) - Movelist 6 - Lv3 Super Moves]
type = explod
trigger1 = !numexplod(768907) && var(16) >= 7
anim = 607000
ID = 768907
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 07) - Movelist 6 - Lv3 Super Moves]
type = modifyexplod
trigger1 = numexplod(768907)
anim = 607000
ID = 768907
postype = left
pos = 160+(var(55)), var(26) + (((13)*7)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 08) - Movelist 6 - Lv3 Super Moves]
type = explod
trigger1 = !numexplod(768908) && var(16) >= 8
anim = 607000
ID = 768908
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 08) - Movelist 6 - Lv3 Super Moves]
type = modifyexplod
trigger1 = numexplod(768908)
anim = 607000
ID = 768908
postype = left
pos = 160+(var(55)), var(26) + (((13)*8)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 09) - Movelist 6 - Lv3 Super Moves]
type = explod
trigger1 = !numexplod(768909) && var(16) >= 9
anim = 607000
ID = 768909
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 09) - Movelist 6 - Lv3 Super Moves]
type = modifyexplod
trigger1 = numexplod(768909)
anim = 607000
ID = 768909
postype = left
pos = 160+(var(55)), var(26) + (((13)*9)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 10) - Movelist 6 - Lv3 Super Moves]
type = explod
trigger1 = !numexplod(768910) && var(16) >= 10
anim = 607000
ID = 768910
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 10) - Movelist 6 - Lv3 Super Moves]
type = modifyexplod
trigger1 = numexplod(768910)
anim = 607000
ID = 768910
postype = left
pos = 160+(var(55)), var(26) + (((13)*10)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 11) - Movelist 6 - Lv3 Super Moves]
type = explod
trigger1 = !numexplod(768911) && var(16) >= 11
anim = 607000
ID = 768911
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 11) - Movelist 6 - Lv3 Super Moves]
type = modifyexplod
trigger1 = numexplod(768911)
anim = 607000
ID = 768911
postype = left
pos = 160+(var(55)), var(26) + (((13)*11)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 12) - Movelist 6 - Lv3 Super Moves]
type = explod
trigger1 = !numexplod(768912) && var(16) >= 12
anim = 607000
ID = 768912
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 12) - Movelist 6 - Lv3 Super Moves]
type = modifyexplod
trigger1 = numexplod(768912)
anim = 607000
ID = 768912
postype = left
pos = 160+(var(55)), var(26) + (((13)*12)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 13) - Movelist 6 - Lv3 Super Moves]
type = explod
trigger1 = !numexplod(768913) && var(16) >= 13
anim = 607000
ID = 768913
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 13) - Movelist 6 - Lv3 Super Moves]
type = modifyexplod
trigger1 = numexplod(768913)
anim = 607000
ID = 768913
postype = left
pos = 160+(var(55)), var(26) + (((13)*13)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 14) - Movelist 6 - Lv3 Super Moves]
type = explod
trigger1 = !numexplod(768914) && var(16) >= 14
anim = 607000
ID = 768914
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 14) - Movelist 6 - Lv3 Super Moves]
type = modifyexplod
trigger1 = numexplod(768914)
anim = 607000
ID = 768914
postype = left
pos = 160+(var(55)), var(26) + (((13)*14)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 15) - Movelist 6 - Lv3 Super Moves]
type = explod
trigger1 = !numexplod(768915) && var(16) >= 15
anim = 607000
ID = 768915
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 15) - Movelist 6 - Lv3 Super Moves]
type = modifyexplod
trigger1 = numexplod(768915)
anim = 607000
ID = 768915
postype = left
pos = 160+(var(55)), var(26) + (((13)*15)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 16) - Movelist 6 - Lv3 Super Moves]
type = explod
trigger1 = !numexplod(768916) && var(16) >= 16
anim = 607000
ID = 768916
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 16) - Movelist 6 - Lv3 Super Moves]
type = modifyexplod
trigger1 = numexplod(768916)
anim = 607000
ID = 768916
postype = left
pos = 160+(var(55)), var(26) + (((13)*16)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 17) - Movelist 6 - Lv3 Super Moves]
type = explod
trigger1 = !numexplod(768917) && var(16) >= 17
anim = 607000
ID = 768917
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 17) - Movelist 6 - Lv3 Super Moves]
type = modifyexplod
trigger1 = numexplod(768917)
anim = 607000
ID = 768917
postype = left
pos = 160+(var(55)), var(26) + (((13)*17)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 18) - Movelist 6 - Lv3 Super Moves]
type = explod
trigger1 = !numexplod(768918) && var(16) >= 18
anim = 607000
ID = 768918
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 18) - Movelist 6 - Lv3 Super Moves]
type = modifyexplod
trigger1 = numexplod(768918)
anim = 607000
ID = 768918
postype = left
pos = 160+(var(55)), var(26) + (((13)*18)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 19) - Movelist 6 - Lv3 Super Moves]
type = explod
trigger1 = !numexplod(768919) && var(16) >= 19
anim = 607000
ID = 768919
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 19) - Movelist 6 - Lv3 Super Moves]
type = modifyexplod
trigger1 = numexplod(768919)
anim = 607000
ID = 768919
postype = left
pos = 160+(var(55)), var(26) + (((13)*19)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 20) - Movelist 6 - Lv3 Super Moves]
type = explod
trigger1 = !numexplod(768920) && var(16) >= 20
anim = 607000
ID = 768920
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 20) - Movelist 6 - Lv3 Super Moves]
type = modifyexplod
trigger1 = numexplod(768920)
anim = 607000
ID = 768920
postype = left
pos = 160+(var(55)), var(26) + (((13)*20)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0
;---------------------------Lv3 SUPER MOVES END HERE--------------------------
;-----------------------------------------------------------------------------
;--------------------------Lv5 SUPER MOVES START HERE-------------------------
[State 8980, (WHITE BG 01) - Movelist 7 - Lv5 Super Moves]
type = explod
trigger1 = !numexplod(778901) && var(17) >= 1
anim = 607000
ID = 778901
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 01) - Movelist 7 - Lv5 Super Moves]
type = modifyexplod
trigger1 = numexplod(778901)
anim = 607000
ID = 778901
postype = left
pos = 160+(var(55)), var(27) + (((13)*1)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 02) - Movelist 7 - Lv5 Super Moves]
type = explod
trigger1 = !numexplod(778902) && var(17) >= 2
anim = 607000
ID = 778902
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 02) - Movelist 7 - Lv5 Super Moves]
type = modifyexplod
trigger1 = numexplod(778902)
anim = 607000
ID = 778902
postype = left
pos = 160+(var(55)), var(27) + (((13)*2)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 03) - Movelist 7 - Lv5 Super Moves]
type = explod
trigger1 = !numexplod(778903) && var(17) >= 3
anim = 607000
ID = 778903
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 03) - Movelist 7 - Lv5 Super Moves]
type = modifyexplod
trigger1 = numexplod(778903)
anim = 607000
ID = 778903
postype = left
pos = 160+(var(55)), var(27) + (((13)*3)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 04) - Movelist 7 - Lv5 Super Moves]
type = explod
trigger1 = !numexplod(778904) && var(17) >= 4
anim = 607000
ID = 778904
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 04) - Movelist 7 - Lv5 Super Moves]
type = modifyexplod
trigger1 = numexplod(778904)
anim = 607000
ID = 778904
postype = left
pos = 160+(var(55)), var(27) + (((13)*4)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 05) - Movelist 7 - Lv5 Super Moves]
type = explod
trigger1 = !numexplod(778905) && var(17) >= 5
anim = 607000
ID = 778905
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 05) - Movelist 7 - Lv5 Super Moves]
type = modifyexplod
trigger1 = numexplod(778905)
anim = 607000
ID = 778905
postype = left
pos = 160+(var(55)), var(27) + (((13)*5)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 06) - Movelist 7 - Lv5 Super Moves]
type = explod
trigger1 = !numexplod(778906) && var(17) >= 6
anim = 607000
ID = 778906
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 06) - Movelist 7 - Lv5 Super Moves]
type = modifyexplod
trigger1 = numexplod(778906)
anim = 607000
ID = 778906
postype = left
pos = 160+(var(55)), var(27) + (((13)*6)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 07) - Movelist 7 - Lv5 Super Moves]
type = explod
trigger1 = !numexplod(778907) && var(17) >= 7
anim = 607000
ID = 778907
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 07) - Movelist 7 - Lv5 Super Moves]
type = modifyexplod
trigger1 = numexplod(778907)
anim = 607000
ID = 778907
postype = left
pos = 160+(var(55)), var(27) + (((13)*7)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 08) - Movelist 7 - Lv5 Super Moves]
type = explod
trigger1 = !numexplod(778908) && var(17) >= 8
anim = 607000
ID = 778908
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 08) - Movelist 7 - Lv5 Super Moves]
type = modifyexplod
trigger1 = numexplod(778908)
anim = 607000
ID = 778908
postype = left
pos = 160+(var(55)), var(27) + (((13)*8)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 09) - Movelist 7 - Lv5 Super Moves]
type = explod
trigger1 = !numexplod(778909) && var(17) >= 9
anim = 607000
ID = 778909
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 09) - Movelist 7 - Lv5 Super Moves]
type = modifyexplod
trigger1 = numexplod(778909)
anim = 607000
ID = 778909
postype = left
pos = 160+(var(55)), var(27) + (((13)*9)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 10) - Movelist 7 - Lv5 Super Moves]
type = explod
trigger1 = !numexplod(778910) && var(17) >= 10
anim = 607000
ID = 778910
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 10) - Movelist 7 - Lv5 Super Moves]
type = modifyexplod
trigger1 = numexplod(778910)
anim = 607000
ID = 778910
postype = left
pos = 160+(var(55)), var(27) + (((13)*10)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 11) - Movelist 7 - Lv5 Super Moves]
type = explod
trigger1 = !numexplod(778911) && var(17) >= 11
anim = 607000
ID = 778911
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 11) - Movelist 7 - Lv5 Super Moves]
type = modifyexplod
trigger1 = numexplod(778911)
anim = 607000
ID = 778911
postype = left
pos = 160+(var(55)), var(27) + (((13)*11)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 12) - Movelist 7 - Lv5 Super Moves]
type = explod
trigger1 = !numexplod(778912) && var(17) >= 12
anim = 607000
ID = 778912
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 12) - Movelist 7 - Lv5 Super Moves]
type = modifyexplod
trigger1 = numexplod(778912)
anim = 607000
ID = 778912
postype = left
pos = 160+(var(55)), var(27) + (((13)*12)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 13) - Movelist 7 - Lv5 Super Moves]
type = explod
trigger1 = !numexplod(778913) && var(17) >= 13
anim = 607000
ID = 778913
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 13) - Movelist 7 - Lv5 Super Moves]
type = modifyexplod
trigger1 = numexplod(778913)
anim = 607000
ID = 778913
postype = left
pos = 160+(var(55)), var(27) + (((13)*13)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 14) - Movelist 7 - Lv5 Super Moves]
type = explod
trigger1 = !numexplod(778914) && var(17) >= 14
anim = 607000
ID = 778914
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 14) - Movelist 7 - Lv5 Super Moves]
type = modifyexplod
trigger1 = numexplod(778914)
anim = 607000
ID = 778914
postype = left
pos = 160+(var(55)), var(27) + (((13)*14)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 15) - Movelist 7 - Lv5 Super Moves]
type = explod
trigger1 = !numexplod(778915) && var(17) >= 15
anim = 607000
ID = 778915
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 15) - Movelist 7 - Lv5 Super Moves]
type = modifyexplod
trigger1 = numexplod(778915)
anim = 607000
ID = 778915
postype = left
pos = 160+(var(55)), var(27) + (((13)*15)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 16) - Movelist 7 - Lv5 Super Moves]
type = explod
trigger1 = !numexplod(778916) && var(17) >= 16
anim = 607000
ID = 778916
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 16) - Movelist 7 - Lv5 Super Moves]
type = modifyexplod
trigger1 = numexplod(778916)
anim = 607000
ID = 778916
postype = left
pos = 160+(var(55)), var(27) + (((13)*16)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 17) - Movelist 7 - Lv5 Super Moves]
type = explod
trigger1 = !numexplod(778917) && var(17) >= 17
anim = 607000
ID = 778917
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 17) - Movelist 7 - Lv5 Super Moves]
type = modifyexplod
trigger1 = numexplod(778917)
anim = 607000
ID = 778917
postype = left
pos = 160+(var(55)), var(27) + (((13)*17)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 18) - Movelist 7 - Lv5 Super Moves]
type = explod
trigger1 = !numexplod(778918) && var(17) >= 18
anim = 607000
ID = 778918
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 18) - Movelist 7 - Lv5 Super Moves]
type = modifyexplod
trigger1 = numexplod(778918)
anim = 607000
ID = 778918
postype = left
pos = 160+(var(55)), var(27) + (((13)*18)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 19) - Movelist 7 - Lv5 Super Moves]
type = explod
trigger1 = !numexplod(778919) && var(17) >= 19
anim = 607000
ID = 778919
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 19) - Movelist 7 - Lv5 Super Moves]
type = modifyexplod
trigger1 = numexplod(778919)
anim = 607000
ID = 778919
postype = left
pos = 160+(var(55)), var(27) + (((13)*19)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 20) - Movelist 7 - Lv5 Super Moves]
type = explod
trigger1 = !numexplod(778920) && var(17) >= 20
anim = 607000
ID = 778920
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 20) - Movelist 7 - Lv5 Super Moves]
type = modifyexplod
trigger1 = numexplod(778920)
anim = 607000
ID = 778920
postype = left
pos = 160+(var(55)), var(27) + (((13)*20)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0
;---------------------------Lv5 SUPER MOVES END HERE--------------------------
;-----------------------------------------------------------------------------
;---------------------------SYSTEM MOVES START HERE---------------------------
[State 8980, (WHITE BG 01) - Movelist 8 - System Moves]
type = explod
trigger1 = !numexplod(788901) && var(18) >= 1
anim = 607000
ID = 788901
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 01) - Movelist 8 - System Moves]
type = modifyexplod
trigger1 = numexplod(788901)
anim = 607000
ID = 788901
postype = left
pos = 160+(var(55)), var(28) + (((13)*1)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 02) - Movelist 8 - System Moves]
type = explod
trigger1 = !numexplod(788902) && var(18) >= 2
anim = 607000
ID = 788902
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 02) - Movelist 8 - System Moves]
type = modifyexplod
trigger1 = numexplod(788902)
anim = 607000
ID = 788902
postype = left
pos = 160+(var(55)), var(28) + (((13)*2)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 03) - Movelist 8 - System Moves]
type = explod
trigger1 = !numexplod(788903) && var(18) >= 3
anim = 607000
ID = 788903
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 03) - Movelist 8 - System Moves]
type = modifyexplod
trigger1 = numexplod(788903)
anim = 607000
ID = 788903
postype = left
pos = 160+(var(55)), var(28) + (((13)*3)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 04) - Movelist 8 - System Moves]
type = explod
trigger1 = !numexplod(788904) && var(18) >= 4
anim = 607000
ID = 788904
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 04) - Movelist 8 - System Moves]
type = modifyexplod
trigger1 = numexplod(788904)
anim = 607000
ID = 788904
postype = left
pos = 160+(var(55)), var(28) + (((13)*4)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 05) - Movelist 8 - System Moves]
type = explod
trigger1 = !numexplod(788905) && var(18) >= 5
anim = 607000
ID = 788905
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 05) - Movelist 8 - System Moves]
type = modifyexplod
trigger1 = numexplod(788905)
anim = 607000
ID = 788905
postype = left
pos = 160+(var(55)), var(28) + (((13)*5)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 06) - Movelist 8 - System Moves]
type = explod
trigger1 = !numexplod(788906) && var(18) >= 6
anim = 607000
ID = 788906
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 06) - Movelist 8 - System Moves]
type = modifyexplod
trigger1 = numexplod(788906)
anim = 607000
ID = 788906
postype = left
pos = 160+(var(55)), var(28) + (((13)*6)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 07) - Movelist 8 - System Moves]
type = explod
trigger1 = !numexplod(788907) && var(18) >= 7
anim = 607000
ID = 788907
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 07) - Movelist 8 - System Moves]
type = modifyexplod
trigger1 = numexplod(788907)
anim = 607000
ID = 788907
postype = left
pos = 160+(var(55)), var(28) + (((13)*7)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 08) - Movelist 8 - System Moves]
type = explod
trigger1 = !numexplod(788908) && var(18) >= 8
anim = 607000
ID = 788908
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 08) - Movelist 8 - System Moves]
type = modifyexplod
trigger1 = numexplod(788908)
anim = 607000
ID = 788908
postype = left
pos = 160+(var(55)), var(28) + (((13)*8)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 09) - Movelist 8 - System Moves]
type = explod
trigger1 = !numexplod(788909) && var(18) >= 9
anim = 607000
ID = 788909
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 09) - Movelist 8 - System Moves]
type = modifyexplod
trigger1 = numexplod(788909)
anim = 607000
ID = 788909
postype = left
pos = 160+(var(55)), var(28) + (((13)*9)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 10) - Movelist 8 - System Moves]
type = explod
trigger1 = !numexplod(788910) && var(18) >= 10
anim = 607000
ID = 788910
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 10) - Movelist 8 - System Moves]
type = modifyexplod
trigger1 = numexplod(788910)
anim = 607000
ID = 788910
postype = left
pos = 160+(var(55)), var(28) + (((13)*10)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 11) - Movelist 8 - System Moves]
type = explod
trigger1 = !numexplod(788911) && var(18) >= 11
anim = 607000
ID = 788911
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 11) - Movelist 8 - System Moves]
type = modifyexplod
trigger1 = numexplod(788911)
anim = 607000
ID = 788911
postype = left
pos = 160+(var(55)), var(28) + (((13)*11)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 12) - Movelist 8 - System Moves]
type = explod
trigger1 = !numexplod(788912) && var(18) >= 12
anim = 607000
ID = 788912
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 12) - Movelist 8 - System Moves]
type = modifyexplod
trigger1 = numexplod(788912)
anim = 607000
ID = 788912
postype = left
pos = 160+(var(55)), var(28) + (((13)*12)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 13) - Movelist 8 - System Moves]
type = explod
trigger1 = !numexplod(788913) && var(18) >= 13
anim = 607000
ID = 788913
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 13) - Movelist 8 - System Moves]
type = modifyexplod
trigger1 = numexplod(788913)
anim = 607000
ID = 788913
postype = left
pos = 160+(var(55)), var(28) + (((13)*13)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 14) - Movelist 8 - System Moves]
type = explod
trigger1 = !numexplod(788914) && var(18) >= 14
anim = 607000
ID = 788914
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 14) - Movelist 8 - System Moves]
type = modifyexplod
trigger1 = numexplod(788914)
anim = 607000
ID = 788914
postype = left
pos = 160+(var(55)), var(28) + (((13)*14)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 15) - Movelist 8 - System Moves]
type = explod
trigger1 = !numexplod(788915) && var(18) >= 15
anim = 607000
ID = 788915
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 15) - Movelist 8 - System Moves]
type = modifyexplod
trigger1 = numexplod(788915)
anim = 607000
ID = 788915
postype = left
pos = 160+(var(55)), var(28) + (((13)*15)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 16) - Movelist 8 - System Moves]
type = explod
trigger1 = !numexplod(788916) && var(18) >= 16
anim = 607000
ID = 788916
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 16) - Movelist 8 - System Moves]
type = modifyexplod
trigger1 = numexplod(788916)
anim = 607000
ID = 788916
postype = left
pos = 160+(var(55)), var(28) + (((13)*16)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 17) - Movelist 8 - System Moves]
type = explod
trigger1 = !numexplod(788917) && var(18) >= 17
anim = 607000
ID = 788917
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 17) - Movelist 8 - System Moves]
type = modifyexplod
trigger1 = numexplod(788917)
anim = 607000
ID = 788917
postype = left
pos = 160+(var(55)), var(28) + (((13)*17)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 18) - Movelist 8 - System Moves]
type = explod
trigger1 = !numexplod(788918) && var(18) >= 18
anim = 607000
ID = 788918
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 18) - Movelist 8 - System Moves]
type = modifyexplod
trigger1 = numexplod(788918)
anim = 607000
ID = 788918
postype = left
pos = 160+(var(55)), var(28) + (((13)*18)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 19) - Movelist 8 - System Moves]
type = explod
trigger1 = !numexplod(788919) && var(18) >= 19
anim = 607000
ID = 788919
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 19) - Movelist 8 - System Moves]
type = modifyexplod
trigger1 = numexplod(788919)
anim = 607000
ID = 788919
postype = left
pos = 160+(var(55)), var(28) + (((13)*19)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 20) - Movelist 8 - System Moves]
type = explod
trigger1 = !numexplod(788920) && var(18) >= 20
anim = 607000
ID = 788920
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 20) - Movelist 8 - System Moves]
type = modifyexplod
trigger1 = numexplod(788920)
anim = 607000
ID = 788920
postype = left
pos = 160+(var(55)), var(28) + (((13)*20)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0
;-----------------------------SYSTEM MOVES END HERE---------------------------
;-----------------------------------------------------------------------------
;---------------------------BASIC COMMANDS START HERE-------------------------
[State 8980, (WHITE BG 01) - Movelist 9 - Basic Commands]
type = explod
trigger1 = !numexplod(798901) && var(19) >= 1
anim = 607000
ID = 798901
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 01) - Movelist 9 - Basic Commands]
type = modifyexplod
trigger1 = numexplod(798901)
anim = 607000
ID = 798901
postype = left
pos = 160+(var(55)), var(29) + (((13)*1)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 02) - Movelist 9 - Basic Commands]
type = explod
trigger1 = !numexplod(798902) && var(19) >= 2
anim = 607000
ID = 798902
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 02) - Movelist 9 - Basic Commands]
type = modifyexplod
trigger1 = numexplod(798902)
anim = 607000
ID = 798902
postype = left
pos = 160+(var(55)), var(29) + (((13)*2)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 03) - Movelist 9 - Basic Commands]
type = explod
trigger1 = !numexplod(798903) && var(19) >= 3
anim = 607000
ID = 798903
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 03) - Movelist 9 - Basic Commands]
type = modifyexplod
trigger1 = numexplod(798903)
anim = 607000
ID = 798903
postype = left
pos = 160+(var(55)), var(29) + (((13)*3)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 04) - Movelist 9 - Basic Commands]
type = explod
trigger1 = !numexplod(798904) && var(19) >= 4
anim = 607000
ID = 798904
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 04) - Movelist 9 - Basic Commands]
type = modifyexplod
trigger1 = numexplod(798904)
anim = 607000
ID = 798904
postype = left
pos = 160+(var(55)), var(29) + (((13)*4)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 05) - Movelist 9 - Basic Commands]
type = explod
trigger1 = !numexplod(798905) && var(19) >= 5
anim = 607000
ID = 798905
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 05) - Movelist 9 - Basic Commands]
type = modifyexplod
trigger1 = numexplod(798905)
anim = 607000
ID = 798905
postype = left
pos = 160+(var(55)), var(29) + (((13)*5)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 06) - Movelist 9 - Basic Commands]
type = explod
trigger1 = !numexplod(798906) && var(19) >= 6
anim = 607000
ID = 798906
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 06) - Movelist 9 - Basic Commands]
type = modifyexplod
trigger1 = numexplod(798906)
anim = 607000
ID = 798906
postype = left
pos = 160+(var(55)), var(29) + (((13)*6)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 07) - Movelist 9 - Basic Commands]
type = explod
trigger1 = !numexplod(798907) && var(19) >= 7
anim = 607000
ID = 798907
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 07) - Movelist 9 - Basic Commands]
type = modifyexplod
trigger1 = numexplod(798907)
anim = 607000
ID = 798907
postype = left
pos = 160+(var(55)), var(29) + (((13)*7)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 08) - Movelist 9 - Basic Commands]
type = explod
trigger1 = !numexplod(798908) && var(19) >= 8
anim = 607000
ID = 798908
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 08) - Movelist 9 - Basic Commands]
type = modifyexplod
trigger1 = numexplod(798908)
anim = 607000
ID = 798908
postype = left
pos = 160+(var(55)), var(29) + (((13)*8)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 09) - Movelist 9 - Basic Commands]
type = explod
trigger1 = !numexplod(798909) && var(19) >= 9
anim = 607000
ID = 798909
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 09) - Movelist 9 - Basic Commands]
type = modifyexplod
trigger1 = numexplod(798909)
anim = 607000
ID = 798909
postype = left
pos = 160+(var(55)), var(29) + (((13)*9)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 10) - Movelist 9 - Basic Commands]
type = explod
trigger1 = !numexplod(798910) && var(19) >= 10
anim = 607000
ID = 798910
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 10) - Movelist 9 - Basic Commands]
type = modifyexplod
trigger1 = numexplod(798910)
anim = 607000
ID = 798910
postype = left
pos = 160+(var(55)), var(29) + (((13)*10)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 11) - Movelist 9 - Basic Commands]
type = explod
trigger1 = !numexplod(798911) && var(19) >= 11
anim = 607000
ID = 798911
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 11) - Movelist 9 - Basic Commands]
type = modifyexplod
trigger1 = numexplod(798911)
anim = 607000
ID = 798911
postype = left
pos = 160+(var(55)), var(29) + (((13)*11)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 12) - Movelist 9 - Basic Commands]
type = explod
trigger1 = !numexplod(798912) && var(19) >= 12
anim = 607000
ID = 798912
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 12) - Movelist 9 - Basic Commands]
type = modifyexplod
trigger1 = numexplod(798912)
anim = 607000
ID = 798912
postype = left
pos = 160+(var(55)), var(29) + (((13)*12)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 13) - Movelist 9 - Basic Commands]
type = explod
trigger1 = !numexplod(798913) && var(19) >= 13
anim = 607000
ID = 798913
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 13) - Movelist 9 - Basic Commands]
type = modifyexplod
trigger1 = numexplod(798913)
anim = 607000
ID = 798913
postype = left
pos = 160+(var(55)), var(29) + (((13)*13)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 14) - Movelist 9 - Basic Commands]
type = explod
trigger1 = !numexplod(798914) && var(19) >= 14
anim = 607000
ID = 798914
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 14) - Movelist 9 - Basic Commands]
type = modifyexplod
trigger1 = numexplod(798914)
anim = 607000
ID = 798914
postype = left
pos = 160+(var(55)), var(29) + (((13)*14)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 15) - Movelist 9 - Basic Commands]
type = explod
trigger1 = !numexplod(798915) && var(19) >= 15
anim = 607000
ID = 798915
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 15) - Movelist 9 - Basic Commands]
type = modifyexplod
trigger1 = numexplod(798915)
anim = 607000
ID = 798915
postype = left
pos = 160+(var(55)), var(29) + (((13)*15)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 16) - Movelist 9 - Basic Commands]
type = explod
trigger1 = !numexplod(798916) && var(19) >= 16
anim = 607000
ID = 798916
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 16) - Movelist 9 - Basic Commands]
type = modifyexplod
trigger1 = numexplod(798916)
anim = 607000
ID = 798916
postype = left
pos = 160+(var(55)), var(29) + (((13)*16)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 17) - Movelist 9 - Basic Commands]
type = explod
trigger1 = !numexplod(798917) && var(19) >= 17
anim = 607000
ID = 798917
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 17) - Movelist 9 - Basic Commands]
type = modifyexplod
trigger1 = numexplod(798917)
anim = 607000
ID = 798917
postype = left
pos = 160+(var(55)), var(29) + (((13)*17)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 18) - Movelist 9 - Basic Commands]
type = explod
trigger1 = !numexplod(798918) && var(19) >= 18
anim = 607000
ID = 798918
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 18) - Movelist 9 - Basic Commands]
type = modifyexplod
trigger1 = numexplod(798918)
anim = 607000
ID = 798918
postype = left
pos = 160+(var(55)), var(29) + (((13)*18)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 19) - Movelist 9 - Basic Commands]
type = explod
trigger1 = !numexplod(798919) && var(19) >= 19
anim = 607000
ID = 798919
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 19) - Movelist 9 - Basic Commands]
type = modifyexplod
trigger1 = numexplod(798919)
anim = 607000
ID = 798919
postype = left
pos = 160+(var(55)), var(29) + (((13)*19)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, (WHITE BG 20) - Movelist 9 - Basic Commands]
type = explod
trigger1 = !numexplod(798920) && var(19) >= 20
anim = 607000
ID = 798920
postype = left
pausemovetime = -1
[State 8980, (WHITE BG 20) - Movelist 9 - Basic Commands]
type = modifyexplod
trigger1 = numexplod(798920)
anim = 607000
ID = 798920
postype = left
pos = 160+(var(55)), var(29) + (((13)*20)-13) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

;------------------------------------------------------------------------


[State 8980, (BLUE BG SELECTOR BAR)]; PST1
type = explod
trigger1 = !numexplod(607001) ;&& var(10) >= 1
anim = 607001
ID = 607001
postype = left
pausemovetime = -1
[State 8980, (BLUE BG SELECTOR BAR)];
type = modifyexplod
trigger1 = numexplod(607001)
anim = 607001
ID = 607001
postype = left
pos = 160+(var(55)), var(8) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
sprpriority = 3
ontop = 1
ownpal = 0



;------------------------------------------------------------------------
[State 8980, Show Movelist 0 - Normal Throws]
type = explod
trigger1 = !numexplod(8980) && var(10) > 0
anim = 707000+var(40)
ID = 8980
postype = left
pausemovetime = -1
[State 8980, Show Movelist 0 - Normal Throws]
type = modifyexplod
trigger1 = numexplod(8980)
anim = 707000+var(40)
ID = 8980
postype = left
pos = 160+(var(55)), var(20) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
sprpriority = 5
ontop = 1
ownpal = 0

[State 8980, Show Movelist 1 - Unique Attacks]
type = explod
trigger1 = !numexplod(8981) && var(11) > 0
anim = 717000+var(41)
ID = 8981
postype = left
pausemovetime = -1
[State 8980, Show Movelist 1 - Unique Attacks]
type = modifyexplod
trigger1 = numexplod(8981)
anim = 717000+var(41)
ID = 8981
postype = left
pos = 160+(var(55)), var(21) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, Show Movelist 2 - Target Combos]
type = explod
trigger1 = !numexplod(8982) && var(12) > 0
anim = 727000+var(42)
ID = 8982
postype = left
pausemovetime = -1
[State 8980, Show Movelist 2 - Target Combos]
type = modifyexplod
trigger1 = numexplod(8982)
anim = 727000+var(42)
ID = 8982
postype = left
pos = 160+(var(55)), var(22) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, Show Movelist 3 - Special Moves]
type = explod
trigger1 = !numexplod(8983) && var(13) > 0
anim = 737000+var(43)
ID = 8983
postype = left
pausemovetime = -1
[State 8980, Show Movelist 3 - Special Moves]
type = modifyexplod
trigger1 = numexplod(8983)
anim = 737000+var(43)
ID = 8983
postype = left
pos = 160+(var(55)), var(23) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0
[State 8980, Show Movelist 4 - Lv1 Super Moves]
type = explod
trigger1 = !numexplod(8984) && var(14) > 0
anim = 747000+var(44)
ID = 8984
postype = left
pausemovetime = -1
[State 8980, Show Movelist 4 - Lv1 Super Moves]
type = modifyexplod
trigger1 = numexplod(8984)
anim = 747000+var(44)
ID = 8984
postype = left
pos = 160+(var(55)), var(24) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, Show Movelist 5 - Lv2 Super Moves]
type = explod
trigger1 = !numexplod(8985) && var(15) > 0
anim = 757000+var(45)
ID = 8985
postype = left
pausemovetime = -1
[State 8980, Show Movelist 5 - Lv2 Super Moves]
type = modifyexplod
trigger1 = numexplod(8985)
anim = 757000+var(45)
ID = 8985
postype = left
pos = 160+(var(55)), var(25) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, Show Movelist 6 - Lv3 Super Moves]
type = explod
trigger1 = !numexplod(8986) && var(16) > 0
anim = 767000+var(46)
ID = 8986
postype = left
pausemovetime = -1
[State 8980, Show Movelist 6 - Lv3 Super Moves]
type = modifyexplod
trigger1 = numexplod(8986)
anim = 767000+var(46)
ID = 8986
postype = left
pos = 160+(var(55)), var(26) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, Show Movelist 7 - Lv5 Super Moves]
type = explod
trigger1 = !numexplod(8987) && var(17) > 0
anim = 777000+var(47)
ID = 8987
postype = left
pausemovetime = -1
[State 8980, Show Movelist 7 - Lv5 Super Moves]
type = modifyexplod
trigger1 = numexplod(8987)
anim = 777000+var(47)
ID = 8987
postype = left
pos = 160+(var(55)), var(27) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, Show Movelist 8 - System Moves]
type = explod
trigger1 = !numexplod(8988) && var(18) > 0
anim = 787000+var(48)
ID = 8988
postype = left
pausemovetime = -1
[State 8980, Show Movelist 8 - System Moves]
type = modifyexplod
trigger1 = numexplod(8988)
anim = 787000+var(48)
ID = 8988
postype = left
pos = 160+(var(55)), var(28) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0

[State 8980, Show Movelist 9 - Basic Commands]
type = explod
trigger1 = !numexplod(8989) && var(19) > 0
anim = 797000+var(49)
ID = 8989
postype = left
pausemovetime = -1
[State 8980, Show Movelist 9 - Basic Commands]
type = modifyexplod
trigger1 = numexplod(8989)
anim = 797000+var(49)
ID = 8989
postype = left
pos = 160+(var(55)), var(29) + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
ontop = 1
ownpal = 0
;------------------------------------------------------------------------


[State 8990, Movelist - Preview BG]
type = explod
trigger1 = !numexplod(507001) && numexplod(407001)
anim = 507000
ID = 507001
postype = left
pausemovetime = -1
[State 8990, Movelist - Preview BG]
type = modifyexplod
trigger1 = numexplod(507001)
anim = 507000
ID = 507001
postype = left
pos = 160+(var(55)), var(50)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25, 0.25
sprpriority = 5
ontop = 1
ownpal = 0

[State 8990, Movelist - Preview animation]
type = explod
trigger1 = var(7)>0 && !numexplod(407004)
anim = 707000 + (var(5)*10000) + (var(7)*10) +var(56)
ID = 407004
postype = left
pausemovetime = -1
[State 8990, Movelist - Preview animation]
type = modifyexplod
trigger1 = numexplod(407004)
anim = 707000 + (var(5)*10000) + (var(7)*10) +var(56)
ID = 407004
postype = left
pos = 160+(var(55)), var(50)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.33*root,const(size.xscale), 0.33*root,const(size.yscale)
sprpriority = 5
ontop = 1
ownpal = 0

[State 8980, End]
type = changestate
trigger1 = parent,stateno=8981&&parent,time>=29
value = 8981
