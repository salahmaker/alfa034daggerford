void DestroyItems(object oMonster){
  object oItem = GetFirstItemInInventory(oMonster);
  while(oItem != OBJECT_INVALID){
    DestroyObject(oItem);
    oItem = GetNextItemInInventory(oMonster);
  }

}


void main()
{
  object oItem = GetItemActivated();
  object oTarget = GetItemActivatedTarget();
  string sItem = GetTag(oItem);
  string sName = GetName(oItem);
  location lLoc = GetItemActivatedTargetLocation();
  string sRef = GetResRef(oItem);
  object oOwner = GetItemPossessor(oItem);
  object oPC = GetItemActivator();

  if(GetLocalString(oItem, "henchname") != ""){
    object oMonster = CreateObject(OBJECT_TYPE_CREATURE, GetLocalString(oItem, "henchname"), lLoc,TRUE);
    AddHenchman(oPC, oMonster);
    SetCommandable(TRUE,oMonster);
    SetLocalObject(oMonster, "CommandStone", oItem);
    SetEventScript(oMonster, EVENT_SCRIPT_CREATURE_ON_DEATH, "ay_animaldeath");
    SetEventScript(oMonster, EVENT_SCRIPT_CREATURE_ON_DIALOGUE, "ay_ch_hen_conv");
    SetEventScript(oMonster, EVENT_SCRIPT_CREATURE_ON_HEARTBEAT, "ay_heartbeat");
    DestroyItems(oMonster);

   }
   else SendMessageToAllDMs("No creature set for this stone, or it was just created.");
}
