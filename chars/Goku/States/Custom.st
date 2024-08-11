; __________________
;| Goku by DJMouF |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯

;========================< KICKED by EX JOUDAN S.G. >=============================
;--- Hit Pause ---
[Statedef 1111300]
type = A
movetype = H
physics = N
velset = 0, 0
[State 1111300, Anim]
type = changeanim
trigger1 = 1
value = 5002
[State 1111300, Anim]
type = changeanim
triggerall = var(1) = 1
trigger1 = 1
value = 135002
[State 1111300, End]
type = changestate
trigger1 = hitshakeover
value = 1111301


;--- Falling ---
[Statedef 1111301]
type = A
movetype = H
physics = N

[State 1111301, Vel]
type = hitvelset
trigger1 = !time
x = 1
y = 1
[State 1111301, Accel]
type = veladd
trigger1 = 1
y = gethitvar(yaccel)

[State 1111301, screen]
type = screenbound
trigger1 = 1
value = 1
movecamera = 0, 1
[State 1111301, Push]
type = playerpush
trigger1 = 1
value = 0

[State 1111301, Anim]
type = changeanim
trigger1 = !time
value = 5030
[State 1111300, Anim]
type = changeanim
triggerall = var(1) = 1
trigger1 = 1
value = 135030

[State 1111301, bounce]
type = changestate
trigger1 = backedgebodydist <= 10 || frontedgebodydist <= 10
value = 1111302
[State 1111301, End]
type = selfstate
trigger1 = vel y > 0 && pos y >= 0
value = 5100


;--- Hitting Wall ---
[Statedef 1111302]
type = A
movetype = H
physics = N

[State 1111302, turn]
type = turn
trigger1 = !time
trigger1 = frontedgedist < backedgedist

[State 1111302, Pos]
type = posset
trigger1 = 1
x = -160 * facing
[State 1111302, Pos]
type = posfreeze
trigger1 = 1
x = 1
y = 1

[State 1111302, screen]
type = screenbound
trigger1 = 1
value = 1
movecamera = 0, 1
[State 1111302, Push]
type = playerpush
trigger1 = 1
value = 1

[State 1111302, Anim]
type = changeanim
trigger1 = 1
value = 5000
[State 1111300, Anim]
type = changeanim
triggerall = var(1) = 1
trigger1 = 1
value = 135000

[State 1111302, snd]
type = playsnd
trigger1 = !time
value = f7, 0
[State 1111302, FX]
type = explod
trigger1 = !time
anim = f72
pos = 0, floor(screenpos y) -50
postype = back
sprpriority = 3

[State 1111302, End]
type = changestate
trigger1 = time >= 4
value = 1111303


;--- Falling ---
[Statedef 1111303]
type = A
movetype = H
physics = N

[State 1111303, turn]
type = turn
trigger1 = !time

[State 1111303, Accel]
type = veladd
trigger1 = 1
y = 0.5
[State 1111303, Vel]
type = velset
trigger1 = !time
x = -2.5
y = -9

[State 1111303, Anim]
type = changeanim
trigger1 = !time
value = ifelse(selfanimexist(5051), 5051, 5030)
[State 1111303, Anim]
type = changeanim
triggerall = var(1) = 1
trigger1 = !time
value = ifelse(selfanimexist(135051), 135051, 135030)
[State 1111303, Anim]
type = changeanim
trigger1 = anim = 5030 && !animtime
value = 5050
[State 1111303, Anim]
type = changeanim
triggerall = var(1) = 1
trigger1 = anim = 135030 && !animtime
value = 135050
[State 1111303, Anim]
type = changeanim
trigger1 = vel y > -3 && anim = 5051
value = 5061
[State 1111303, Anim]
type = changeanim
triggerall = var(1) = 1
trigger1 = vel y > -3 && anim = 135051
value = 135061

[State 1111303, screen]
type = screenbound
trigger1 = 1
value = 1
movecamera = 0, 0
[State 1111303, Push]
type = playerpush
trigger1 = 1
value = 0

[State 1111303, Recover]
type = selfstate
trigger1 = alive
trigger1 = command = "recovery"
trigger1 = vel y > 0 && pos y >= const(movement.air.gethit.groundrecover.ground.threshold)
value = 5200

[State 1111303, End]
type = selfstate
trigger1 = vel y > 0 && pos y >= 0
value = 5100

;---- P2 Disappear ----
[Statedef 1111600]
type    = S
movetype= H
physics = N
velset = 0,0
sprpriority = -1

[State 3052, p2] ;The animation for p2 from your character's AIR file
type = ChangeAnim2
Trigger1 = Time = 0
value =5941

[State 0, PosSet]
type = PosSet
trigger1 = !alive;A function that triggers state if p2 has been K.O'd
y = 0

[State 3000, 5]
type = ChangeState
trigger1 = !alive ;A function that triggers state if p2 has been K.O'd
value = 5150

[State 3000, 5]
type = SelfState
trigger1 = alive = 1 ;A function that triggers state if p2 still has life
value = 5050

;------------------------------
;================================================
;KO by Super Spirit Bomb (Fatality)
[Statedef 5941]
type    = S
movetype= I
physics = N
ctrl = 0
sprpriority = 7
facep2 = 1

[State 182, 1]
type = screenbound
trigger1 = 1
movecamera = 0,0
value = 1

[State 3000, invisibleanim]
type = ChangeAnim
trigger1 = !time
Value = 15999
ignorehitpause = 1


[State 3000, moving back]
type = Velset
trigger1 = 1
X = -0.2
ignorehitpause = 1

[State 1315, Goku]
type = explod
trigger1 = !time
anim = 5941
ID = 5941
sprpriority=7
postype = p1
pos = 0,-15
removetime=-2
ownpal=0
ignorehitpause=1
bindtime = -1
ontop = 1

[State 3000, nhb]
type = nothitby
trigger1 = 1
time = 1
value = SCA
ignorehitpause = 1

;This prevent freeze game
[State 49999, 5]
type = ChangeState
trigger1 = time >130
value = 5942

;---------------------------------------------------------------------------------------
;Prevent Freezing from Super Spirit Bomb
[Statedef 5942]
type = S
movetype= H
physics = N
velset = 0,0

[State 182, 1]
type = screenbound
trigger1 = 1
movecamera = 0,0
value = 1

[State 49999, 1]
type = LifeSet
trigger1 = 1
value = 0

[State 49999, 1]
type = PosSet
trigger1 = 1
y = 0

[State 49999, 5]
type = ChangeAnim2
trigger1 = !time
value = 15999

[State 444, 0]
type = Changestate
trigger1 = time >=60
value = 5150

;---------------------------------------------
;Gut Punch Knock Out For Meteor Break Kame
[Statedef 5960]
type = U
physics = U
movetype = U
anim = 5960
velset = 0, 0

[State 5950, NHB]
type = nothitby
trigger1 = 1
value = SCA

[State 5950, Pos]
type = posset
trigger1 = 1
y = 0

[State 5950, End]
type = changestate
trigger1 = !animtime
value = 5110




