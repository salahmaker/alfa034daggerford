void main()
{
object oTarget = GetItemActivatedTarget();
object oDM = GetItemActivator();

if(!GetIsDM(oDM)){
  SendMessageToPC(oDM, "Only a DM can use this");
  return;
}


if (oTarget == OBJECT_INVALID){
  SendMessageToPC(oDM, "No valid target, trying to find nearest placeable object");
  oTarget = GetNearestObjectToLocation(OBJECT_TYPE_PLACEABLE, GetItemActivatedTargetLocation());
  if(oTarget == OBJECT_INVALID){
    SendMessageToPC(oDM, "No valid target found.  Quitting.");
    return;
  }
}



int iBonus = GetLocalInt(OBJECT_SELF, "lock");
int iDoor = FALSE;
int iContainer = FALSE;
int iDC = 0;



if(GetObjectType(oTarget) == OBJECT_TYPE_DOOR){
  SendMessageToPC(oDM, "Object type door.");
  iDoor = TRUE;
}
else if(GetObjectType(oTarget) == OBJECT_TYPE_PLACEABLE){
  SendMessageToPC(oDM, "Object type placeable.");
  iContainer = TRUE;
}
else{
  SendMessageToPC(oDM, "Neither a door nor placeable.  Quitting.");
  return;

}


SendMessageToPC(oDM, "Modifying: "+GetName(oTarget));

SetUseableFlag(oTarget, TRUE);
SetPlotFlag(oTarget, FALSE);
SetImmortal(oTarget, FALSE);

SetLockKeyRequired(oTarget, FALSE);
SetLockLockable(oTarget, TRUE);

SetLockLockDC(oTarget, GetLockLockDC(oTarget) + iBonus);
SetLockUnlockDC(oTarget, GetLockLockDC(oTarget) + iBonus);

SetLocked(oTarget, TRUE);

iDC = GetLockLockDC(oTarget);
SendMessageToPC(oDM, "Current DC: "+ IntToString(iDC) );


//Set aay_bashdestroy



if(iContainer){

  int iXP = GetLocalInt(oTarget, "iXPCutOff");
  if( iXP == 0 && iDC > 28){
    iXP = (iDC - 24) * 1000 + 5000;
    SetLocalInt(oTarget, "iXPCutOff", iXP);
  }

  if(GetEventScript(oTarget, EVENT_SCRIPT_PLACEABLE_ON_DEATH) != "aay_bashdestroy"){
    SetEventScript(oTarget, EVENT_SCRIPT_PLACEABLE_ON_DEATH, "aay_bashdestroy");
    SendMessageToPC(oDM, "Added Bash Script");
  }

}

//if(iDoor){

SetHardness(iDC - 24, oTarget);
SendMessageToPC(oDM, "Hardness set to: " + IntToString(iDC - 24));



//}

}
