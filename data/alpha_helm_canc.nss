#include "x0_i0_petrify"
void main()
{
   object oPC =   GetPCSpeaker();

        object oBackup = GetLocalObject(oPC,"alpha_backup");
        object oItem = GetLocalObject(oPC, "old_item");




        //Give Backup to Player
        object oNew = CopyItem(oBackup, oPC,TRUE);
        DestroyObject(oItem);
        DestroyObject(oBackup);

        AssignCommand(oPC,ClearAllActions(TRUE));

               AssignCommand(oPC, ActionEquipItem(oNew,INVENTORY_SLOT_HEAD));

       ClearAllActions();

DeleteLocalObject(oPC, "alpha_backup");
DeleteLocalObject(oPC,"old_item");
DeleteLocalInt(oPC,"MaterialToDye");
DeleteLocalInt(oPC,"leather1_dye");
DeleteLocalInt(oPC,"leather2_dye");
DeleteLocalInt(oPC,"cloth1_dye");
DeleteLocalInt(oPC,"cloth2_dye");
DeleteLocalInt(oPC,"metal1_dye");
DeleteLocalInt(oPC,"metal2_dye");
DeleteLocalInt(oPC,"price");
}


