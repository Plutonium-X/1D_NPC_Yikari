/*Yikari by Shed; Joining and Returning to Party Dialogue; Translation "dialogue.tra"*/
/*VERSION 1.5*/

/* SDNPCQuest:
0 Before Yikari joins
1 Yikari joined (silent)
2 Picked up CF
3 Joined with party CF
4 Joined with own CF
5 Enemy
6 Left for home*/

BEGIN ~SDNPCP~

IF ~Global("SDNPCQuest","GLOBAL",1)~ 0
  SAY @57
  IF ~~ THEN REPLY @58 DO ~SetGlobal("KickedOut","LOCALS",1)~ EXIT
  + ~!AreaCheck("AR0900")~ + @59 DO ~SetGlobal("KickedOut","LOCALS",1) EscapeAreaMove("AR0900",2868,1962,6)~ EXIT
  ++ @60 DO ~GiveItemCreate("sdnpcclk",Myself,1,0,0) FillSlot(SLOT_ARMOR) JoinParty()~ EXIT
END

IF 	~Global("KickedOut","LOCALS",0)
	OR(2) Global("SDNPCQuest","GLOBAL",3) Global("SDNPCQuest","GLOBAL",4)~
THEN BEGIN 1 // "I am oath-bound"
  SAY @61
  ++ @63 DO ~JoinParty()~ EXIT 			// stay with
  ++ @58 DO ~SetGlobal("KickedOut","LOCALS",1)~ EXIT // stay here
  + ~!AreaCheck("AR0900")~ + @64 DO ~EscapeAreaMove("AR0900",2868,1962,6)~ EXIT // temple
  + ~Global("SDNPCQuest","GLOBAL",3)~+ @62 DO ~AddexperienceParty(12000)
	TakePartyItem("sw1h51")
	DestroyItem("sw1h51")
	TakePartyItem("c2sw1h02")
	DestroyItem("c2sw1h02")~ + 5 // thanks
  + ~Global("SDNPCQuest","GLOBAL",4)~ + @62 + 5 	// leave
  + ~CheckStatLT(Player1,14,CHR)~ + @63 + 2		// failure
  + ~OR(2)
	HasItem("sdnpcsw3",Myself)
	HasItemEquiped("sdnpcsw3",Myself)~
   + @65 DO ~TakeItemReplace("sw1h51","sdnpcsw3",Myself)~ + 4 // challenge
  + ~OR(2)
	HasItem("sdnpcsw4",Myself)
	HasItemEquiped("sdnpcsw4",Myself)~
   + @65 DO ~TakeItemReplace("c2sw1h02","sdnpcsw4",Myself)~ + 4 // challenge
  + ~!HasItem("sdnpcsw3",Myself) !HasItem("sdnpcsw4",Myself)~ + @65 + 4 // challenge
END

IF ~~ THEN BEGIN 2 // from: 1.2
  SAY @66 // "sorry, got to go"
  ++ @62 DO ~AddexperienceParty(12000)
	TakePartyItem("sw1h51")
	DestroyItem("sw1h51")
	TakePartyItem("c2sw1h02")
	DestroyItem("c2sw1h02")~ + 5 // "thanks"
  ++ @65 + 4 // challenge
END

IF 	~!InParty(Myself)
	Global("SDNPCQuest","GLOBAL",3)
	!PartyHasItem("c2sw1h02")
	!PartyHasItem("sw1h51")~
THEN BEGIN nopartycf
  SAY @67
  IF ~~ THEN DO ~LeaveParty()
		Enemy()
		SetGlobal("SDNPCQuest","GLOBAL",5)~
  EXIT
END

IF 	~!InParty(Myself)
	Global("SDNPCQuest","GLOBAL",4)
	!HasItem("sdnpcsw3",Myself)
	!HasItem("sdnpcsw4",Myself)~
THEN BEGIN noyikaricf
  SAY @67
  IF ~~ THEN DO ~LeaveParty()
	Enemy()
	SetGlobal("SDNPCQuest","GLOBAL",5)~
  EXIT
END

IF ~~ THEN BEGIN 4 // fight
  SAY @55
  IF ~~ THEN DO ~LeaveParty()
	Enemy()
	SetGlobal("SDNPCQuest","GLOBAL",5)~
  EXIT
END

IF ~~ THEN BEGIN 5 // thanks leave
  SAY @56
  IF ~~ THEN DO ~EscapeArea()
	SetGlobal("SDNPCQuest","GLOBAL",6)~
  EXIT
END

IF ~Global("KickedOut","LOCALS",1)~ rejoin
SAY @68
 ++ @58 EXIT
 ++ @60 DO ~SetGlobal("KickedOut","LOCALS",0) JoinParty()~ EXIT
 ++ @62 DO ~TakePartyItem("sw1h51")
	DestroyItem("sw1h51")
	TakePartyItem("c2sw1h02")
	DestroyItem("c2sw1h02")~ + 5
END
