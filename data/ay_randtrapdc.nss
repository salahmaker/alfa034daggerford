int AddVariation(int nNumber, int nVarientRange=-1, int bFeedback=FALSE, string sReason ="")
{
int iFinalOutput;
int iAppliedVariation = (Random(nVarientRange)+1);
if(d100(1)>49)  {iFinalOutput = (nNumber) + (iAppliedVariation);}
else            {iFinalOutput = (nNumber) - (iAppliedVariation);}
   if (bFeedback)
    {SendMessageToAllDMs("Base: "+IntToString(nNumber)+" Varient: "
    +IntToString(nVarientRange)+" Final Output: "+IntToString(iFinalOutput)+". "+sReason+".");}
if(iFinalOutput>=251) {iFinalOutput = (d100(2) + d20(1) + d10(1));}//Safety for Traps.
return iFinalOutput;
}



void main()
{
if(GetLocalInt(OBJECT_SELF, "trapcheck")== 0){
  object oArea = OBJECT_SELF;
  SetLocalInt(OBJECT_SELF, "trapcheck", 1);
  int bFeedback = GetLocalInt(oArea, "MMT_BETA");
  int iPercent = GetLocalInt(oArea, "MMT_TRAP_PERC");
  int iAreaTrapCR = GetLocalInt(oArea, "MMT_ACR");

  int iTrapBase = GetLocalInt(oArea, "MMT_TRAP_BASE");
  int iTrapFlux = GetLocalInt(oArea, "MMT_TRAP_FLUX");

  int iDetectScore = GetTrapDetectDC(OBJECT_SELF);//GetLocalInt(oArea, "MMT_DE_B");
  int iDetectFlux = GetLocalInt(oArea, "MMT_DE_F");

  if( iDetectFlux == 0) iDetectFlux = 5;

  int iDisarmScore = GetTrapDisarmDC(OBJECT_SELF);//GetLocalInt(oArea, "MMT_DI_B");
  int iDisarmFlux = GetLocalInt(oArea, "MMT_DI_F");

  if(iDisarmFlux == 0) iDisarmFlux = 5;

  int iLockFlux =  GetLocalInt(oArea, "MMT_LK_F");


  string sTrapTag = GetLocalString(oArea, "MMT_TT");
  string sDisarmEvent = GetLocalString(oArea, "MMT_TDE");
  string sTriggeredEvent = GetLocalString(oArea, "MMT_TTE");
  int iMakeThisTrap = TRAP_BASE_TYPE_MINOR_TANGLE;

  //if(GetDistanceToObject(GetNearestTrapToObject(OBJECT_SELF, FALSE))<0.5 && GetDistanceToObject(GetNearestTrapToObject(OBJECT_SELF, FALSE))>0.0) return;

  //if(GetLocked(OBJECT_SELF) && iLockFlux)
  //  SetLockUnlockDC(OBJECT_SELF, AddVariation(GetLockUnlockDC(OBJECT_SELF), iLockFlux, FALSE, "UnlockDC"));

  /*if(d100() <= 100 - iPercent){
    SetLocalInt(OBJECT_SELF, "trapcheck", 1);
    return;
  }*/

  /*switch(iAreaTrapCR)
        {
        case 1:
            switch(Random(11))
                {
                case 0: iMakeThisTrap = TRAP_BASE_TYPE_MINOR_ACID; break;
                case 1: iMakeThisTrap = TRAP_BASE_TYPE_MINOR_ACID_SPLASH; break;
                case 2: iMakeThisTrap = TRAP_BASE_TYPE_MINOR_ELECTRICAL; break;
                case 3: iMakeThisTrap = TRAP_BASE_TYPE_MINOR_FIRE; break;
                case 4: iMakeThisTrap = TRAP_BASE_TYPE_MINOR_FROST; break;
                case 5: iMakeThisTrap = TRAP_BASE_TYPE_MINOR_GAS; break;
                case 6: iMakeThisTrap = TRAP_BASE_TYPE_MINOR_HOLY; break;
                case 7: iMakeThisTrap = TRAP_BASE_TYPE_MINOR_NEGATIVE; break;
                case 8: iMakeThisTrap = TRAP_BASE_TYPE_MINOR_SONIC; break;
                case 9: iMakeThisTrap = TRAP_BASE_TYPE_MINOR_SPIKE; break;
                case 10: iMakeThisTrap = TRAP_BASE_TYPE_MINOR_TANGLE; break;
                }
            break;
        case 2:
            switch(Random(11))
                {
                case 0: iMakeThisTrap = TRAP_BASE_TYPE_AVERAGE_ACID; break;
                case 1: iMakeThisTrap = TRAP_BASE_TYPE_AVERAGE_ACID_SPLASH; break;
                case 2: iMakeThisTrap = TRAP_BASE_TYPE_AVERAGE_ELECTRICAL; break;
                case 3: iMakeThisTrap = TRAP_BASE_TYPE_AVERAGE_FIRE; break;
                case 4: iMakeThisTrap = TRAP_BASE_TYPE_AVERAGE_FROST; break;
                case 5: iMakeThisTrap = TRAP_BASE_TYPE_AVERAGE_GAS; break;
                case 6: iMakeThisTrap = TRAP_BASE_TYPE_AVERAGE_HOLY; break;
                case 7: iMakeThisTrap = TRAP_BASE_TYPE_AVERAGE_NEGATIVE; break;
                case 8: iMakeThisTrap = TRAP_BASE_TYPE_AVERAGE_SONIC; break;
                case 9: iMakeThisTrap = TRAP_BASE_TYPE_AVERAGE_SPIKE; break;
                case 10: iMakeThisTrap = TRAP_BASE_TYPE_AVERAGE_TANGLE; break;
                }
            break;
        case 3:
            switch(Random(11))
                {
                case 0: iMakeThisTrap = TRAP_BASE_TYPE_STRONG_ACID; break;
                case 1: iMakeThisTrap = TRAP_BASE_TYPE_STRONG_ACID_SPLASH; break;
                case 2: iMakeThisTrap = TRAP_BASE_TYPE_STRONG_ELECTRICAL; break;
                case 3: iMakeThisTrap = TRAP_BASE_TYPE_STRONG_FIRE; break;
                case 4: iMakeThisTrap = TRAP_BASE_TYPE_STRONG_FROST; break;
                case 5: iMakeThisTrap = TRAP_BASE_TYPE_STRONG_GAS; break;
                case 6: iMakeThisTrap = TRAP_BASE_TYPE_STRONG_HOLY; break;
                case 7: iMakeThisTrap = TRAP_BASE_TYPE_STRONG_NEGATIVE; break;
                case 8: iMakeThisTrap = TRAP_BASE_TYPE_STRONG_SONIC; break;
                case 9: iMakeThisTrap = TRAP_BASE_TYPE_STRONG_SPIKE; break;
                case 10: iMakeThisTrap = TRAP_BASE_TYPE_STRONG_TANGLE; break;
                }
            break;
        case 4:
            iMakeThisTrap = TRAP_BASE_TYPE_MINOR_TANGLE;
            break;

        case 10://Spike
            switch(Random(2))
                {
                case 0: iMakeThisTrap = TRAP_BASE_TYPE_MINOR_SPIKE; break;
                case 1: iMakeThisTrap = TRAP_BASE_TYPE_AVERAGE_SPIKE; break;

                }
            break;
        case 11://Fire
            switch(Random(2))
                {
                case 0: iMakeThisTrap = TRAP_BASE_TYPE_MINOR_FIRE; break;
                case 1: iMakeThisTrap = TRAP_BASE_TYPE_AVERAGE_FIRE; break;

                }
            break;
        case 12:
            switch(Random(2))
                {
                case 0: iMakeThisTrap = TRAP_BASE_TYPE_MINOR_FROST; break;
                case 1: iMakeThisTrap = TRAP_BASE_TYPE_AVERAGE_FROST; break;

                }
            break;
        case 13:
            switch(Random(2))
                {
                case 0: iMakeThisTrap = TRAP_BASE_TYPE_MINOR_ELECTRICAL; break;
                case 1: iMakeThisTrap = TRAP_BASE_TYPE_AVERAGE_ELECTRICAL; break;

                }
             break;
        case 14:
            switch(Random(4))
                {
                case 0: iMakeThisTrap = TRAP_BASE_TYPE_MINOR_ACID; break;
                case 1: iMakeThisTrap = TRAP_BASE_TYPE_MINOR_ACID_SPLASH; break;
                case 2: iMakeThisTrap = TRAP_BASE_TYPE_AVERAGE_ACID; break;
                case 3: iMakeThisTrap = TRAP_BASE_TYPE_AVERAGE_ACID_SPLASH; break;

                }
            break;
        case 15:
            switch(Random(2))
                {
                case 0: iMakeThisTrap = TRAP_BASE_TYPE_MINOR_SONIC; break;
                case 1: iMakeThisTrap = TRAP_BASE_TYPE_AVERAGE_SONIC; break;

                }
            break;
        case 16:
            switch(Random(2))
                {
                case 0: iMakeThisTrap = TRAP_BASE_TYPE_MINOR_NEGATIVE; break;
                case 1: iMakeThisTrap = TRAP_BASE_TYPE_AVERAGE_NEGATIVE; break;

                }
            break;
        case 17:
            switch(Random(2))
                {
                case 0: iMakeThisTrap = TRAP_BASE_TYPE_MINOR_HOLY; break;
                case 1: iMakeThisTrap = TRAP_BASE_TYPE_AVERAGE_HOLY; break;

                }
            break;
        case 18:
            switch(Random(2))
                {
                case 0: iMakeThisTrap = TRAP_BASE_TYPE_MINOR_GAS; break;
                case 1: iMakeThisTrap = TRAP_BASE_TYPE_AVERAGE_GAS; break;

                }
            break;
        case 19:
            switch(Random(3))
                {
                case 0: iMakeThisTrap = TRAP_BASE_TYPE_MINOR_TANGLE; break;
                case 1: iMakeThisTrap = TRAP_BASE_TYPE_AVERAGE_TANGLE; break;
                case 2: iMakeThisTrap = TRAP_BASE_TYPE_STRONG_TANGLE; break;

                }
            break;
        }  */
















  object oMostRecentTrap = OBJECT_SELF;//CreateTrapAtLocation(iMakeThisTrap , GetLocation(OBJECT_SELF), 1.8, "placeable_trap", STANDARD_FACTION_HOSTILE, "aay_disarmxp", sTriggeredEvent);
  SetTrapDetectable(oMostRecentTrap,TRUE);
  SetTrapDisarmable(oMostRecentTrap,TRUE);

 //if((iDetectScore>=1)&&(iDetectFlux<=((iDetectScore/2)-1) ))
    //{
    SetTrapDetectDC(oMostRecentTrap, AddVariation(iDetectScore, iDetectFlux, FALSE, "Detect DC"));
    //}
  /*else //Safety, incase builders don't set/set incorrectly. Yeilds 20-40 var.
    {*/
   //SetTrapDetectDC(oMostRecentTrap, AddVariation(10, 5, FALSE, "Detect DC"));
    //}
  //if((iDisarmScore>=1)&&(iDisarmFlux<=((iDisarmScore/2)-1) ))
   // {
    SetTrapDisarmDC(oMostRecentTrap, AddVariation(iDisarmScore, iDisarmFlux, FALSE, "Disarm DC"));
    //}
  //else//Again a safety. Yeilds 20-40 var.
    //{SetTrapDisarmDC(oMostRecentTrap, AddVariation(24, 1, FALSE, "Disarm DC"));}




  SetTrapRecoverable(oMostRecentTrap, FALSE);
  SetEventScript(OBJECT_SELF, EVENT_SCRIPT_PLACEABLE_ON_HEARTBEAT,"");

}


}
