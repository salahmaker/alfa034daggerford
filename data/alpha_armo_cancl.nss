
void main()
{
   object oPC =   GetPCSpeaker();

        object oBackup = GetLocalObject(oPC,"alpha_backup");
        object oItem  = GetLocalObject(oPC, "old_item");



        //Give Backup to Player
        object oNew = CopyItem(oBackup, oPC,TRUE);
        DestroyObject(oItem);
        DestroyObject(oBackup);

        AssignCommand(oPC,ClearAllActions(TRUE));

               AssignCommand(oPC, ActionEquipItem(oNew,INVENTORY_SLOT_CHEST));

       ClearAllActions();
       //I know I know theres a ton of them. Only real good way to do it
DeleteLocalObject(oPC, "MaterialToDye");
DeleteLocalObject(oPC, "leather1_dye");
DeleteLocalInt(oPC, "leather2_dye");
DeleteLocalInt(oPC, "cloth1_dye");
DeleteLocalInt(oPC, "cloth2_dye");
DeleteLocalInt(oPC, "metal1_dye");
DeleteLocalInt(oPC, "metal2_dye");
DeleteLocalInt(oPC, "price");
DeleteLocalInt(oPC, "belt_cost");
DeleteLocalInt(oPC, "lbicep_cost");
DeleteLocalInt(oPC, "lfoot_cost");
DeleteLocalInt(oPC, "lforearm_cost");
DeleteLocalInt(oPC, "lhand_cost");
DeleteLocalInt(oPC, "lshin_cost");
DeleteLocalInt(oPC, "lshoulder_cost");
DeleteLocalInt(oPC, "lthigh_cost");
DeleteLocalInt(oPC, "pelvis_cost");
DeleteLocalInt(oPC, "rbicep_cost");
DeleteLocalInt(oPC, "rfoot_cost");
DeleteLocalInt(oPC, "rforearm_cost");
DeleteLocalInt(oPC, "rhand_cost");
DeleteLocalInt(oPC, "robe_cost");
DeleteLocalInt(oPC, "rshin_cost");
DeleteLocalInt(oPC, "rshoulder_cost");
DeleteLocalInt(oPC, "rthigh_cost");
DeleteLocalInt(oPC, "torso_cost");
DeleteLocalInt(oPC, "ToModify");
DeleteLocalString(oPC, "2DAFile");
         }

