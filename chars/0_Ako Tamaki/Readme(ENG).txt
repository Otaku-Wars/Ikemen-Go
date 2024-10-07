__________________________________________________________________________________________

            Ako / Ako Tamaki
                                                                by Sennou-Room

										     Last Update: [10/30/2022]
__________________________________________________________________________________________

Contact:	sennouroom@gmail.com
Website:	-
Customized version of Shibai Kineko's Ako character, for MUGEN 1.1 OpenGL Mode


=====<Movelist>=====

 U - up          x - light attack        a - system move 1
 D - down        y - medium attack       b - system move 2
 F - forward     z - heavy attack        c - system move 3
 B - back        p - any attack          k - any system
 s - start       2p- two attacks         2k- two systems
 
 (Air) - Move must be performed in the air.
 (EX)  - Move has an EX version, performed by pressing two attack buttons.
 (MAX) - Use two attack buttons when performing a Super move to power it up.

-IF YOU DON'T WANT CHAIN COMBOS GO TO THE CONFIG AND CHANGE THE VALUE UNDER VAR 55
TO 0 AND SAVE.Turning off the chain combos will give the character more of a 
cvs-ish type damage for normal attacks. 


<NORMAL>

.Throw                              F/B + 2p                      (near opponent)


<SPECIAL>

.Magic Scroll
  .Thunder Spear                    D, DF, F, x                   (Air also)
  .Ice Bolt                         D, DF, F, y                   (Air also)
  .Flame Charge                     D, DF, F, z                   (Air also)
  .(EX) EX Magic                    D, DF, F, 2p                  (Air also)
.Lovely Shot (EX)                   F, D, DF, p
.Twinkle Star (EX)                  D, DB, B, p
.Rolling Star (EX)                  D, DB, B, p                   (Air)
.Support <Rusian / Hideki Nishimura>
  .Shield Counter                   D, D, p
  .(EX) Monster Train               D, D, 2p
.Heal for Rusian (EX)               D, D, hold p                  (Only when can't call support character)


<SUPERS>

 <Lv1 Super>

.Meteor Strike (MAX)                D, DF, F, D, DF, F, p         (Air also)
.Green Onion Sword (MAX)            D, DF, F, D, DB, B, p
.Heal for me (MAX)                  D, DB, B, D, DB, B, hold p    (Not LifeMax)

 <Lv3 Super>

.I Love You Rusian!                 D, DF, F, D, DF, F, pk / 3p   (Only when can call support character)
.Perfect Blizzard                   D, DB, B, D, DB, B, pk / 3p


<SYSTEM>

.Run                                F, F
.Backward Dash                      B, B
.Low Jump                           tap U
.High Jump                          tap D, U
.Long Low Jump                      tap D, tap U
.Sidestep                           a
  .Sidestep Attack                  p
.Forward Roll                       F + a
.Backward Roll                      B + a
.Parry High                         tap F
.Parry Low                          tap D
.Air Parry                          tap F                         (Air)
.Just Defense                       tap B                         (Air also)                          [RAGE EXPLOSION]
.Power Charge                       hold b
.Guard Cancel Roll                  F/B + a                       (during standing or crouching guard) (1 power bar)
.Zero Counter                       F + 2p                        (during standing or crouching guard) (1 power bar)
.Custom Combo                       c                             (Air also) (1 power bar)            [CUSTOM COMBO]
.MAX Mode                           c                             (1 power bar)                       [MAX MODE]
.Rage Explosion                     c                             (3 power bar)                       [RAGE EXPLOSION]
.Fall Recovery                      2p / 2k                       (while falling and allowed)



=====<Gameplay Notes>=====

COMBO SYSTEM:
 - Normal Attacks are able to chain into other normal attacks.
 - Normal attacks can be canceled into Command, Special and Super moves
 - Some Special moves can be canceled into Super moves
 - Some Lv1 Super moves can be canceled into MAX Super moves
 - Cancelling a Special, Super move or Custom Combo into a Super move resets the juggle points
   but also reduces its damage


CUSTOM COMBO:
 - Removes cancellable attack restrictions and gives you a lot of freedom to combo them
 - Juggle limit is lifted
 - You can only use EX Special or Super moves from the point the character starts flashing faster
   and brighter, and doing so ends Custom Combo
 - Gives you a short invulnerability window at the start


MAX MODE:
 - Your attack and defense is increased while in MAX Mode
 - EX moves can be performed at no power cost, though take away from time sustained in MAX mode
 - All Lv1 supers can be performed at no power cost, though immediately uses up all time in MAX mode
 - All Lv2 supers will cost 0.5 power bar, along with using up all time in MAX mode
 - All Lv3 supers will cost 1 power bar, along with using up all time in MAX mode
 - Even without a power bar, as long as you have time left in MAX mode, you can perform Lv1 supers/EX moves
 - You can not Power Charge/gain power while in MAX mode
 - You can not perform a Guard Cancel Roll / Zero Counter while in MAX Mode


RAGE EXPLOSION:
 - Rage Meter increases when you receive damage or Just Defense successfully, and it activates automatically when it is full
 - You can also activate Rage Explosion by costing 3 power bar.
 - Your attack and defense is increased while in Rage Explosion
 - All supers can be performed at no power bar, And save the Rage Meter according to the level of the supers
 - You cannot perform the following actions unless you are in Rage Explosion
   - All EX specials
   - Parry High
   - Parry Low
   - Air Parry
   - Power Charge
   - Guard Cancel Roll
   - Zero Counter



=====<Special Thanks>=====

[Shibai Kineko]
  For creating the original character.

[Elecbyte]
  For Making the MUGEN engine.

[Virtualtek]
  For creating Fighter Factory.

[Phantom.of.the.Server]
  For all your tutorials and open source coding. One of the best coders in mugen!

[Infinite]
  For all your tutorials and open source coding as with P.o.t.S's.

[R@CE AKIR@]
  I got the advice in the MFG and other various locations!

[DivineWolf]
  For MAX MODE and some codings.

[Memo]
  Your P.O.T.S/Jmorphman Style Template was a perfect base for character template that I used to make this character.

[Warusaki3]
  I referred to the description of Just Defense.

[puggsoy] & [Sosfiro]
  For character sprites.


THANKS FOR NEW CHARACTER PALETTES:
 - fenzi4224615
 - L.E.O.N
 - Maki Nishikino



=====<Disclaimer>=====

 - Ako / Ako Tamaki is property of Shibai Kineko.
 - "And you thought there is never a girl online?" is property of Shibai Kineko.
 - Dengeki Bunko Fighting Climax is property of Ecole, French-Bread and SEGA.
 - This MUGEN character is a non-profit fan work, it cannot be used for any commercial purposes