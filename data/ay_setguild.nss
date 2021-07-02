#include "sos_include"


void main()
{

object oTarget = GetItemActivatedTarget();

if(oTarget == OBJECT_INVALID){
  SendMessageToAllDMs("Object is not valid.  Use a player.");
  return;
}

SendMessageToAllDMs("Setting shadowthief quest status to complete for:" + GetName(oTarget) );

SOS_SetPersistentInt(oTarget, "cmk_shadowmis", 10);




}
