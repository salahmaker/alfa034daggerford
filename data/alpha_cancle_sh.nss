
void main()
{
   object oPC =   GetPCSpeaker();

        object oBackup = GetLocalObject(oPC,"alpha_backup");
        object oItem  = GetLocalObject(oPC,"old_item");




        //Give Backup to Player
        object oNew = CopyItem(oBackup, oPC,TRUE);
        DestroyObject(oItem);
        DestroyObject(oBackup);

        AssignCommand(oPC,ClearAllActions(TRUE));

               AssignCommand(oPC, ActionEquipItem(oNew,INVENTORY_SLOT_LEFTHAND));

       ClearAllActions();
DeleteLocalObject(oPC, "alpha_backup");
DeleteLocalObject(oPC, "old_item");
DeleteLocalInt(oPC, "Alpha_OldModcheck");
DeleteLocalInt(oPC, "price");

         }

