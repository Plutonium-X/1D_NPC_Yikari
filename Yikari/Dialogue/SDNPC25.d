/*Yikari by Shed; Pocket Plane Dialogue; Translation "dialogue25.tra"*/
/*VERSION 1.5*/


//---------------------------------------SDNPC25


BEGIN SDNPC25

IF ~Global("SDNPCSummoned","GLOBAL",1)~ summoned
SAY @1 = @2
 IF ~~ THEN REPLY @3 DO ~SetGlobal("SDNPCSummoned","GLOBAL",2)~ + join
 IF ~~ THEN REPLY @4 DO ~SetGlobal("SDNPCSummoned","GLOBAL",2)~ + wait
END

IF ~~ join
SAY @5
 IF ~~ THEN DO ~JoinParty() SetGlobal("SDNPCJoined","LOCALS",1)~ EXIT
END

IF ~~ wait
SAY @6 = @7
 IF ~~ THEN DO ~MoveToPointNoInterrupt([2408.1240])~ EXIT
END

IF ~Global("SDNPCSummoned","GLOBAL",2) !InParty(Myself)~ return
SAY @8
 ++ @3 + join
 ++ @4 + wait
END


//---------------------------------------SDNPC25P

BEGIN SDNPC25P

IF ~Global("KickedOut","LOCALS",0)~ kick
SAY @8
 IF ~~ THEN REPLY @9 DO ~JoinParty()~ EXIT
 IF ~AreaCheck("AR4500")~ THEN REPLY @4 + leave
 IF ~!AreaCheck("AR4500") !AreaCheck("AR4000") !AreaCheck("AR6200")~
  THEN  REPLY @4
  	DO ~CreateVisualEffectObject("SPDIMNDR",Myself) Wait(2) MoveBetweenAreas("AR4500",[2408.1240],0)
  	SetGlobal("KickedOut","LOCALS",1)~
  EXIT
 IF ~!AreaCheck("AR4500") !AreaCheck("AR4000") !AreaCheck("AR6200")~
  THEN REPLY @10 DO ~SetGlobal("KickedOut","LOCALS",1)~ EXIT
END

IF ~~ leave
SAY @6 = @7
 IF ~~ THEN DO ~MoveToPointNoInterrupt([2408.1240]) SetGlobal("KickedOut","LOCALS",1)~ EXIT
END

IF ~Global("KickedOut","LOCALS",1)~ rejoin
SAY @8
 ++ @3 + join
 ++ @4 + leave
END

IF ~~ join
SAY @5
 IF ~~ THEN DO ~JoinParty() SetGlobal("KickedOut","LOCALS",0)~ EXIT
END

//---------------------------------------FATESP

EXTEND_TOP FATESP 6 #15
  IF ~!Dead("SDNPC")
     !InMyArea("SDNPC")
     Global("SDNPCSummoned","GLOBAL",0)
     !Global("SDNPCQuest","GLOBAL",5)~
  THEN
    REPLY @11
      DO ~CreateVisualEffect("SPPORTAL",[1999.1218])
         Wait(2)
         CreateCreature("SDNPC25",[1999.1218],0)
         SetGlobal("SDNPCSummoned","GLOBAL",1)~
         GOTO 8
END
