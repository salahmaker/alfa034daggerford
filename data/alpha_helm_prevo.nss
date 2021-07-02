void main()
{
object oPC = GetPCSpeaker();
object oItem = GetLocalObject(oPC, "old_item");
int nCurrApp, nSlot;
        nCurrApp = GetItemAppearance(oItem, ITEM_APPR_TYPE_ARMOR_MODEL, 0);

 if  ((nCurrApp <= 32)  && (nCurrApp != 1))
  {


 object   oNew = CopyItemAndModify(oItem, ITEM_APPR_TYPE_ARMOR_MODEL, 0, nCurrApp - 1, TRUE);
        nSlot = INVENTORY_SLOT_HEAD;
        DestroyObject(oItem);
         oItem = oNew;
          SetLocalObject(oPC, "part_helm",oNew );
        AssignCommand(oPC, ClearAllActions(TRUE));
       AssignCommand(oPC, ActionEquipItem(oItem, nSlot));
       SetLocalInt(oPC, "Alpha_NewModcheck", nCurrApp);
}

else if  (nCurrApp == 34)
{


 object   oNew = CopyItemAndModify(oItem, ITEM_APPR_TYPE_ARMOR_MODEL, 0, nCurrApp - 2, TRUE);
        nSlot = INVENTORY_SLOT_HEAD;
        DestroyObject(oItem);
         oItem = oNew;
          SetLocalObject(oPC, "part_helm",oNew );
        AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oPC, ActionEquipItem(oItem, nSlot));
        SetLocalInt(oPC, "Alpha_NewModcheck", nCurrApp);
        }
       else if (nCurrApp == 101)
       {


        object   oNew = CopyItemAndModify(oItem, ITEM_APPR_TYPE_ARMOR_MODEL, 0, nCurrApp - 67, TRUE);
        nSlot = INVENTORY_SLOT_HEAD;
        DestroyObject(oItem);
         oItem = oNew;
          SetLocalObject(oPC, "part_helm",oNew );
        AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oPC, ActionEquipItem(oItem, nSlot));
        SetLocalInt(oPC, "Alpha_NewModcheck", nCurrApp);
        }
       else if (nCurrApp == 102)
       {


        object   oNew = CopyItemAndModify(oItem, ITEM_APPR_TYPE_ARMOR_MODEL, 0, nCurrApp - 1, TRUE);
        nSlot = INVENTORY_SLOT_HEAD;
        DestroyObject(oItem);
         oItem = oNew;
        SetLocalObject(oPC, "part_helm",oNew );
        AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oPC, ActionEquipItem(oItem, nSlot));
        SetLocalInt(oPC, "Alpha_NewModcheck", nCurrApp);
        }
         else if (nCurrApp == 103)
       {


        object   oNew = CopyItemAndModify(oItem, ITEM_APPR_TYPE_ARMOR_MODEL, 0, nCurrApp - 1, TRUE);
        nSlot = INVENTORY_SLOT_HEAD;
        DestroyObject(oItem);
         oItem = oNew;
 SetLocalObject(oPC, "part_helm",oNew );
        AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oPC, ActionEquipItem(oItem, nSlot));
        SetLocalInt(oPC, "Alpha_NewModcheck", nCurrApp);
        }
          else if (nCurrApp == 104)
       {


        object   oNew = CopyItemAndModify(oItem, ITEM_APPR_TYPE_ARMOR_MODEL, 0, nCurrApp - 1, TRUE);
        nSlot = INVENTORY_SLOT_HEAD;
        DestroyObject(oItem);
         oItem = oNew;
         SetLocalObject(oPC, "part_helm",oNew );
        AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oPC, ActionEquipItem(oItem, nSlot));
        SetLocalInt(oPC, "Alpha_NewModcheck", nCurrApp);
        }
        else
{
FloatingTextStringOnCreature("You have reached the end of the list", oPC);
}
}
