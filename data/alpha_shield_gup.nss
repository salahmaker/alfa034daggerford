void main()
{
object oNew;
int nMode, nSlot;
object oNPC = OBJECT_SELF;
object oPC = GetPCSpeaker();
SetLocalObject(oPC, "PC_target", oNPC);
object oItem = GetLocalObject(oPC, "old_item");
int iBase  =  GetBaseItemType(oItem);
int nCurrApp = GetItemAppearance(oItem, ITEM_APPR_TYPE_SIMPLE_MODEL, 0);


          //Small shield
         if ((nCurrApp <= 13) &&  (nCurrApp >= 11) && (iBase == BASE_ITEM_SMALLSHIELD))
    {
       oNew = CopyItemAndModify(oItem, ITEM_APPR_TYPE_SIMPLE_MODEL, 0, 14, TRUE);
       nSlot = INVENTORY_SLOT_LEFTHAND;
       DestroyObject(oItem);
       oItem = oNew;
       SetLocalObject(oPC, "old_item",oNew );
       AssignCommand(oPC, ClearAllActions(TRUE));
       AssignCommand(oPC, ActionEquipItem(oItem, nSlot));
       SetCustomToken(90404, "current Groop: Interesting");
    }
         else if ((nCurrApp == 14)&& (iBase == BASE_ITEM_SMALLSHIELD))
    {
      oNew = CopyItemAndModify(oItem, ITEM_APPR_TYPE_SIMPLE_MODEL, 0, 15, TRUE);
       nSlot = INVENTORY_SLOT_LEFTHAND;
        DestroyObject(oItem);
        oItem = oNew;
        SetLocalObject(oPC, "old_item",oNew );
        AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oPC, ActionEquipItem(oItem, nSlot));
        SetCustomToken(90404, "current Groop: Silver Round");
    }
         else if ((nCurrApp <= 17) &&  (nCurrApp >= 15)&& (iBase == BASE_ITEM_SMALLSHIELD))
    {
       oNew = CopyItemAndModify(oItem, ITEM_APPR_TYPE_SIMPLE_MODEL, 0, 21, TRUE);
       nSlot = INVENTORY_SLOT_LEFTHAND;
        DestroyObject(oItem);
        oItem = oNew;
        SetLocalObject(oPC, "old_item",oNew );
        AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oPC, ActionEquipItem(oItem, nSlot));
        SetCustomToken(90404, "current Groop: Wooden Square");
    }

          else if ((nCurrApp <= 23) &&  (nCurrApp >= 21) && (iBase == BASE_ITEM_SMALLSHIELD))
    {
       oNew = CopyItemAndModify(oItem, ITEM_APPR_TYPE_SIMPLE_MODEL, 0, 31, TRUE);
       nSlot = INVENTORY_SLOT_LEFTHAND;
        DestroyObject(oItem);
        oItem = oNew;
        SetLocalObject(oPC, "old_item",oNew );
        AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oPC, ActionEquipItem(oItem, nSlot));
        SetCustomToken(90404, "current Groop: Wooden Star");
    }
          else if ((nCurrApp <= 33) &&  (nCurrApp >= 31) && (iBase == BASE_ITEM_SMALLSHIELD))
    {
       oNew = CopyItemAndModify(oItem, ITEM_APPR_TYPE_SIMPLE_MODEL, 0, 41, TRUE);
       nSlot = INVENTORY_SLOT_LEFTHAND;
        DestroyObject(oItem);
        oItem = oNew;
        SetLocalObject(oPC, "old_item",oNew );
        AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oPC, ActionEquipItem(oItem, nSlot));
        SetCustomToken(90404, "current Groop: Wooden box with bolts");
    }
          else if ((nCurrApp <= 43) &&  (nCurrApp >= 41) && (iBase == BASE_ITEM_SMALLSHIELD))
    {
      oNew = CopyItemAndModify(oItem, ITEM_APPR_TYPE_SIMPLE_MODEL, 0, 51, TRUE);
nSlot = INVENTORY_SLOT_LEFTHAND;
        DestroyObject(oItem);
        oItem = oNew;
        SetLocalObject(oPC, "old_item",oNew );
        AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oPC, ActionEquipItem(oItem, nSlot));
        SetCustomToken(90404, "current Groop: metal octagon");
    }
          else if ((nCurrApp <= 53) &&  (nCurrApp >= 51) && (iBase == BASE_ITEM_SMALLSHIELD))
    {
       oNew = CopyItemAndModify(oItem, ITEM_APPR_TYPE_SIMPLE_MODEL, 0, 54, TRUE);
       nSlot = INVENTORY_SLOT_LEFTHAND;
        DestroyObject(oItem);
        oItem = oNew;
        SetLocalObject(oPC, "old_item",oNew );
        AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oPC, ActionEquipItem(oItem, nSlot));
        SetCustomToken(90404, "current Groop: metal Round and colorfull");
    }
          else if ((nCurrApp <= 60) &&  (nCurrApp >= 54) && (iBase == BASE_ITEM_SMALLSHIELD))
    {
      oNew = CopyItemAndModify(oItem, ITEM_APPR_TYPE_SIMPLE_MODEL, 0, 81, TRUE);
       nSlot = INVENTORY_SLOT_LEFTHAND;
        DestroyObject(oItem);
        oItem = oNew;
        SetLocalObject(oPC, "old_item",oNew );
        AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oPC, ActionEquipItem(oItem, nSlot));
        SetCustomToken(90404, "current Groop: Wood Round and realistic");

    }
          else if ((nCurrApp <= 82) &&  (nCurrApp >= 81) && (iBase == BASE_ITEM_SMALLSHIELD))
    {
 oNew = CopyItemAndModify(oItem, ITEM_APPR_TYPE_SIMPLE_MODEL, 0, 91, TRUE);
       nSlot = INVENTORY_SLOT_LEFTHAND;
        DestroyObject(oItem);
        oItem = oNew;
        SetLocalObject(oPC, "old_item",oNew );
        AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oPC, ActionEquipItem(oItem, nSlot));
        SetCustomToken(90404, "current Groop: Wood Round and evil");

    }
          else if ((nCurrApp <= 92) &&  (nCurrApp >= 91) && (iBase == BASE_ITEM_SMALLSHIELD))
    {
     SpeakString("You have come to the end of the List");
    }


     //Large Shields
    else if (((nCurrApp <= 13) &&  (nCurrApp >= 11) && (iBase == BASE_ITEM_LARGESHIELD)) || (nCurrApp == 44))
    {
     oNew = CopyItemAndModify(oItem, ITEM_APPR_TYPE_SIMPLE_MODEL, 0, 14, TRUE);
       nSlot = INVENTORY_SLOT_LEFTHAND;
        DestroyObject(oItem);
        oItem = oNew;
        SetLocalObject(oPC, "old_item",oNew );
        AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oPC, ActionEquipItem(oItem, nSlot));
        SetCustomToken(90404, "current Groop: Stylish");
 }
     else if ((nCurrApp <= 19) &&  (nCurrApp >= 14) && (iBase == BASE_ITEM_LARGESHIELD))
    {
     oNew = CopyItemAndModify(oItem, ITEM_APPR_TYPE_SIMPLE_MODEL, 0, 21, TRUE);
       nSlot = INVENTORY_SLOT_LEFTHAND;
        DestroyObject(oItem);
        oItem = oNew;
        SetLocalObject(oPC, "old_item",oNew );
        AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oPC, ActionEquipItem(oItem, nSlot));
        SetCustomToken(90404, "current Groop: Cutout");
 }
       else if ((nCurrApp <= 23) &&  (nCurrApp >= 21) && (iBase == BASE_ITEM_LARGESHIELD))
    {
     oNew = CopyItemAndModify(oItem, ITEM_APPR_TYPE_SIMPLE_MODEL, 0, 31, TRUE);
       nSlot = INVENTORY_SLOT_LEFTHAND;
        DestroyObject(oItem);
        oItem = oNew;
       SetLocalObject(oPC, "old_item",oNew );
        AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oPC, ActionEquipItem(oItem, nSlot));
        SetCustomToken(90404, "current Groop: 'hex'");
 }
         else if ((nCurrApp <= 33) &&  (nCurrApp >= 31) && (iBase == BASE_ITEM_LARGESHIELD))
    {
     oNew = CopyItemAndModify(oItem, ITEM_APPR_TYPE_SIMPLE_MODEL, 0, 41, TRUE);
       nSlot = INVENTORY_SLOT_LEFTHAND;
        DestroyObject(oItem);
        oItem = oNew;
        SetLocalObject(oPC, "old_item",oNew );
        AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oPC, ActionEquipItem(oItem, nSlot));
        SetCustomToken(90404, "current Groop: Wood and metal");
 }
        else if ((nCurrApp <= 43) &&  (nCurrApp >= 41) && (iBase == BASE_ITEM_LARGESHIELD))
    {
     oNew = CopyItemAndModify(oItem, ITEM_APPR_TYPE_SIMPLE_MODEL, 0, 51, TRUE);
       nSlot = INVENTORY_SLOT_LEFTHAND;
        DestroyObject(oItem);
        oItem = oNew;
        SetLocalObject(oPC, "old_item",oNew );
        AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oPC, ActionEquipItem(oItem, nSlot));
        SetCustomToken(90404, "current Groop: Royal");
 }
        else if ((nCurrApp <= 53) &&  (nCurrApp >= 51) && (iBase == BASE_ITEM_LARGESHIELD))
    {
     oNew = CopyItemAndModify(oItem, ITEM_APPR_TYPE_SIMPLE_MODEL, 0, 54, TRUE);
       nSlot = INVENTORY_SLOT_LEFTHAND;
        DestroyObject(oItem);
        oItem = oNew;
        SetLocalObject(oPC, "old_item",oNew );
        AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oPC, ActionEquipItem(oItem, nSlot));
        SetCustomToken(90404, "current Groop: Wierd");
 }
        else if ((nCurrApp <= 56) &&  (nCurrApp >= 54) && (iBase == BASE_ITEM_LARGESHIELD))
    {
     oNew = CopyItemAndModify(oItem, ITEM_APPR_TYPE_SIMPLE_MODEL, 0, 57, TRUE);
       nSlot = INVENTORY_SLOT_LEFTHAND;
        DestroyObject(oItem);
        oItem = oNew;
        SetLocalObject(oPC, "old_item",oNew );
        AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oPC, ActionEquipItem(oItem, nSlot));
        SetCustomToken(90404, "Wooden round old");
 }
    else if ((nCurrApp <= 59) &&  (nCurrApp >= 57) && (iBase == BASE_ITEM_LARGESHIELD))
    {
     oNew = CopyItemAndModify(oItem, ITEM_APPR_TYPE_SIMPLE_MODEL, 0, 60, TRUE);
       nSlot = INVENTORY_SLOT_LEFTHAND;
        DestroyObject(oItem);
        oItem = oNew;
        SetLocalObject(oPC, "old_item",oNew );
        AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oPC, ActionEquipItem(oItem, nSlot));
        SetCustomToken(90404, "Wooden round tribal");
 }
    else if ((nCurrApp <= 63) &&  (nCurrApp >= 60) && (iBase == BASE_ITEM_LARGESHIELD))
    {
     oNew = CopyItemAndModify(oItem, ITEM_APPR_TYPE_SIMPLE_MODEL, 0, 64, TRUE);
       nSlot = INVENTORY_SLOT_LEFTHAND;
        DestroyObject(oItem);
        oItem = oNew;
        SetLocalObject(oPC, "old_item",oNew );
        AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oPC, ActionEquipItem(oItem, nSlot));
        SetCustomToken(90404, "Metal Patern Round");
 }
     else if ((nCurrApp <= 97) &&  (nCurrApp >= 86) && (iBase == BASE_ITEM_LARGESHIELD))
    {
     oNew = CopyItemAndModify(oItem, ITEM_APPR_TYPE_SIMPLE_MODEL, 0, 64, TRUE);
       nSlot = INVENTORY_SLOT_LEFTHAND;
        DestroyObject(oItem);
        oItem = oNew;
        SetLocalObject(oPC, "old_item",oNew );
        AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oPC, ActionEquipItem(oItem, nSlot));
        SetCustomToken(90404, "Metal Patern Round");
 }
      else if ((nCurrApp <= 85) &&  (nCurrApp >= 64) && (iBase == BASE_ITEM_LARGESHIELD))
    {
     oNew = CopyItemAndModify(oItem, ITEM_APPR_TYPE_SIMPLE_MODEL, 0, 111, TRUE);
       nSlot = INVENTORY_SLOT_LEFTHAND;
        DestroyObject(oItem);
        oItem = oNew;
        SetLocalObject(oPC, "old_item",oNew );
        AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oPC, ActionEquipItem(oItem, nSlot));
        SetCustomToken(90404, "Plain V");
 }
   else if ((nCurrApp <= 119) &&  (nCurrApp >= 111) && (iBase == BASE_ITEM_LARGESHIELD))
    {
     oNew = CopyItemAndModify(oItem, ITEM_APPR_TYPE_SIMPLE_MODEL, 0, 121, TRUE);
       nSlot = INVENTORY_SLOT_LEFTHAND;
        DestroyObject(oItem);
        oItem = oNew;
        SetLocalObject(oPC, "old_item",oNew );
       AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oPC, ActionEquipItem(oItem, nSlot));
        SetCustomToken(90404, "current Groop: Patern V");
 }
    else if ((nCurrApp <= 129) &&  (nCurrApp >= 121) && (iBase == BASE_ITEM_LARGESHIELD))
    {
     oNew = CopyItemAndModify(oItem, ITEM_APPR_TYPE_SIMPLE_MODEL, 0, 131, TRUE);
       nSlot = INVENTORY_SLOT_LEFTHAND;
        DestroyObject(oItem);
        oItem = oNew;
       SetLocalObject(oPC, "old_item",oNew );
        AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oPC, ActionEquipItem(oItem, nSlot));
        SetCustomToken(90404, "current Groop: Striped V");
 }
    else if ((nCurrApp <= 139) &&  (nCurrApp >= 131) && (iBase == BASE_ITEM_LARGESHIELD))
    {
     oNew = CopyItemAndModify(oItem, ITEM_APPR_TYPE_SIMPLE_MODEL, 0, 141, TRUE);
       nSlot = INVENTORY_SLOT_LEFTHAND;
        DestroyObject(oItem);
        oItem = oNew;
        SetLocalObject(oPC, "old_item",oNew );
        AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oPC, ActionEquipItem(oItem, nSlot));
        SetCustomToken(90404, "Wooden Round Realistic");
 }
   else if ((nCurrApp <= 143) &&  (nCurrApp >= 141) && (iBase == BASE_ITEM_LARGESHIELD))
    {
     oNew = CopyItemAndModify(oItem, ITEM_APPR_TYPE_SIMPLE_MODEL, 0, 144, TRUE);
       nSlot = INVENTORY_SLOT_LEFTHAND;
        DestroyObject(oItem);
        oItem = oNew;
        SetLocalObject(oPC, "old_item",oNew );
        AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oPC, ActionEquipItem(oItem, nSlot));
        SetCustomToken(90404, "Metal Round Celtic");
 }
 else if ((nCurrApp <= 149) &&  (nCurrApp >= 144) && (iBase == BASE_ITEM_LARGESHIELD))
    {
     oNew = CopyItemAndModify(oItem, ITEM_APPR_TYPE_SIMPLE_MODEL, 0, 151, TRUE);
       nSlot = INVENTORY_SLOT_LEFTHAND;
        DestroyObject(oItem);
        oItem = oNew;
        SetLocalObject(oPC, "old_item",oNew );
        AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oPC, ActionEquipItem(oItem, nSlot));
        SetCustomToken(90404, "Metal Round Cool");
 }
     else if ((nCurrApp <= 155) &&  (nCurrApp >= 151) && (iBase == BASE_ITEM_LARGESHIELD))
    {
         SpeakString("You have come to the end of the List");
         }

/* TOWER SHIELDS BABY! */
   else if ((nCurrApp <= 13) &&  (nCurrApp >= 11) && (iBase == BASE_ITEM_TOWERSHIELD))
    {
     oNew = CopyItemAndModify(oItem, ITEM_APPR_TYPE_SIMPLE_MODEL, 0, 21, TRUE);
       nSlot = INVENTORY_SLOT_LEFTHAND;
        DestroyObject(oItem);
        oItem = oNew;
        SetLocalObject(oPC, "old_item",oNew );
        AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oPC, ActionEquipItem(oItem, nSlot));
      SetCustomToken(90404, "Rectangle with Ball");
     SendMessageToPC(oPC,  IntToString(nCurrApp));
 }
    else if ((nCurrApp <= 23) &&  (nCurrApp >= 21) && (iBase == BASE_ITEM_TOWERSHIELD))
    {
     oNew = CopyItemAndModify(oItem, ITEM_APPR_TYPE_SIMPLE_MODEL, 0, 31, TRUE);
       nSlot = INVENTORY_SLOT_LEFTHAND;
        DestroyObject(oItem);
        oItem = oNew;
        SetLocalObject(oPC, "old_item",oNew );
        AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oPC, ActionEquipItem(oItem, nSlot));
        SetCustomToken(90404, "Carved V Shape");
         SendMessageToPC(oPC,  IntToString(nCurrApp));
     }
      else if ((nCurrApp <= 33) &&  (nCurrApp >= 31) && (iBase == BASE_ITEM_TOWERSHIELD))
    {
     oNew = CopyItemAndModify(oItem, ITEM_APPR_TYPE_SIMPLE_MODEL, 0, 34, TRUE);
       nSlot = INVENTORY_SLOT_LEFTHAND;
        DestroyObject(oItem);
        oItem = oNew;
        SetLocalObject(oPC, "old_item",oNew );
        AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oPC, ActionEquipItem(oItem, nSlot));
        SetCustomToken(90404, "Curved Purple Arm Shield");
 SendMessageToPC(oPC,  IntToString(nCurrApp));
 }
  else if ((nCurrApp == 34) && (iBase == BASE_ITEM_TOWERSHIELD))
    {
     oNew = CopyItemAndModify(oItem, ITEM_APPR_TYPE_SIMPLE_MODEL, 0, 41, TRUE);
         SendMessageToPC(oPC,  IntToString(nCurrApp));
       nSlot = INVENTORY_SLOT_LEFTHAND;
        DestroyObject(oItem);
        oItem = oNew;
       SetLocalObject(oPC, "old_item",oNew );
        AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oPC, ActionEquipItem(oItem, nSlot));
        SetCustomToken(90404, "Indented V Shape");

 }
      else if ((nCurrApp <= 43) &&  (nCurrApp >= 41) && (iBase == BASE_ITEM_TOWERSHIELD))
    {
     oNew = CopyItemAndModify(oItem, ITEM_APPR_TYPE_SIMPLE_MODEL, 0, 45, TRUE);
      SendMessageToPC(oPC,  IntToString(nCurrApp));
       nSlot = INVENTORY_SLOT_LEFTHAND;

       DestroyObject(oItem);
        oItem = oNew;
       SetLocalObject(oPC, "old_item",oNew );
        AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oPC, ActionEquipItem(oItem, nSlot));
        SetCustomToken(90404, "Fancy Royal");
     SendMessageToPC(oPC,  IntToString(nCurrApp));
 }
    else if ((nCurrApp <= 46) &&  (nCurrApp >= 44) && (iBase == BASE_ITEM_TOWERSHIELD))
    {
        oNew = CopyItemAndModify(oItem, ITEM_APPR_TYPE_SIMPLE_MODEL, 0, 048, TRUE);
       nSlot = INVENTORY_SLOT_LEFTHAND;
        DestroyObject(oItem);
        oItem = oNew;
        SetLocalObject(oPC, "old_item",oNew );
        AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oPC, ActionEquipItem(oItem, nSlot));
        SetCustomToken(90404, "Fancy Round");
       SendMessageToPC(oPC,  IntToString(nCurrApp));
 }
   else if ((nCurrApp <= 49) &&  (nCurrApp >= 48) && (iBase == BASE_ITEM_TOWERSHIELD))
    {
     oNew = CopyItemAndModify(oItem, ITEM_APPR_TYPE_SIMPLE_MODEL, 0, 51, TRUE);
       nSlot = INVENTORY_SLOT_LEFTHAND;
        DestroyObject(oItem);
        oItem = oNew;
        SetLocalObject(oPC, "old_item",oNew );
        AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oPC, ActionEquipItem(oItem, nSlot));
        SetCustomToken(90404, "Pictured");
         SendMessageToPC(oPC,  IntToString(nCurrApp));
 }
    else if ((nCurrApp <= 60) &&  (nCurrApp >= 51) && (iBase == BASE_ITEM_TOWERSHIELD))
    {
     oNew = CopyItemAndModify(oItem, ITEM_APPR_TYPE_SIMPLE_MODEL, 0, 61, TRUE);
       nSlot = INVENTORY_SLOT_LEFTHAND;
        DestroyObject(oItem);
        oItem = oNew;
        SetLocalObject(oPC, "old_item",oNew );
        AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oPC, ActionEquipItem(oItem, nSlot));
        SetCustomToken(90404, "Intricate Oval");
        SendMessageToPC(oPC,  IntToString(nCurrApp));
 }
   else if ((nCurrApp <= 63) &&  (nCurrApp >= 61) && (iBase == BASE_ITEM_TOWERSHIELD))
    {
     oNew = CopyItemAndModify(oItem, ITEM_APPR_TYPE_SIMPLE_MODEL, 0, 64, TRUE);
       nSlot = INVENTORY_SLOT_LEFTHAND;
        DestroyObject(oItem);
        oItem = oNew;
        SetLocalObject(oPC, "old_item",oNew );
        AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oPC, ActionEquipItem(oItem, nSlot));
        SetCustomToken(90404, "Beaten Metal");
        SendMessageToPC(oPC,  IntToString(nCurrApp));
 }
   else if ((nCurrApp <= 66) &&  (nCurrApp >= 64) && (iBase == BASE_ITEM_TOWERSHIELD))
    {
     oNew = CopyItemAndModify(oItem, ITEM_APPR_TYPE_SIMPLE_MODEL, 0, 67, TRUE);
       nSlot = INVENTORY_SLOT_LEFTHAND;
        DestroyObject(oItem);
        oItem = oNew;
        SetLocalObject(oPC, "old_item",oNew );
       AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oPC, ActionEquipItem(oItem, nSlot));
        SetCustomToken(90404, "Wooden Patterns");
 SendMessageToPC(oPC,  IntToString(nCurrApp));
 }
    else if (((nCurrApp <= 70) &&  (nCurrApp >= 67) && (iBase == BASE_ITEM_TOWERSHIELD))  || ((nCurrApp <= 104) &&  (nCurrApp >= 74) && (iBase == BASE_ITEM_TOWERSHIELD)))
    {
     oNew = CopyItemAndModify(oItem, ITEM_APPR_TYPE_SIMPLE_MODEL, 0, 71, TRUE);
       nSlot = INVENTORY_SLOT_LEFTHAND;
        DestroyObject(oItem);
        oItem = oNew;
        SetLocalObject(oPC, "old_item",oNew );
        AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oPC, ActionEquipItem(oItem, nSlot));
        SetCustomToken(90404, "Dragon V Shape");
       SendMessageToPC(oPC,  IntToString(nCurrApp));
 }
     else if ((nCurrApp <= 73) &&  (nCurrApp >= 71) && (iBase == BASE_ITEM_TOWERSHIELD))
    {
     oNew = CopyItemAndModify(oItem, ITEM_APPR_TYPE_SIMPLE_MODEL, 0, 105, TRUE);
       nSlot = INVENTORY_SLOT_LEFTHAND;
        DestroyObject(oItem);
        oItem = oNew;
        SetLocalObject(oPC, "old_item",oNew );
        AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oPC, ActionEquipItem(oItem, nSlot));
        SetCustomToken(90404, "Royal V Shape");
         SendMessageToPC(oPC,  IntToString(nCurrApp));
 }
      else if ((nCurrApp <= 110) &&  (nCurrApp >= 105) && (iBase == BASE_ITEM_TOWERSHIELD))
    {
     oNew = CopyItemAndModify(oItem, ITEM_APPR_TYPE_SIMPLE_MODEL, 0, 111, TRUE);
       nSlot = INVENTORY_SLOT_LEFTHAND;
        DestroyObject(oItem);
        oItem = oNew;
         SetLocalObject(oPC, "old_item",oNew );
        AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oPC, ActionEquipItem(oItem, nSlot));
        SetCustomToken(90404, "Colorful Stripe ");
       SendMessageToPC(oPC,  IntToString(nCurrApp));
 }
       else if ((nCurrApp <= 119) &&  (nCurrApp >= 111) && (iBase == BASE_ITEM_TOWERSHIELD))
    {
     oNew = CopyItemAndModify(oItem, ITEM_APPR_TYPE_SIMPLE_MODEL, 0, 121, TRUE);
       nSlot = INVENTORY_SLOT_LEFTHAND;
        DestroyObject(oItem);
        oItem = oNew;
        SetLocalObject(oPC, "old_item",oNew );
        AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oPC, ActionEquipItem(oItem, nSlot));
        SetCustomToken(90404, "Plan Wood V Shape");

 }
       else if ((nCurrApp <= 123) &&  (nCurrApp >= 121) && (iBase == BASE_ITEM_TOWERSHIELD))
    {
     oNew = CopyItemAndModify(oItem, ITEM_APPR_TYPE_SIMPLE_MODEL, 0, 124, TRUE);
       nSlot = INVENTORY_SLOT_LEFTHAND;
        DestroyObject(oItem);
        oItem = oNew;
        SetLocalObject(oPC, "old_item",oNew );
        AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oPC, ActionEquipItem(oItem, nSlot));
        SetCustomToken(90404, "Royal U Shape");
         SendMessageToPC(oPC,  IntToString(nCurrApp));
 }
        else if ((nCurrApp <= 129) &&  (nCurrApp >= 124) && (iBase == BASE_ITEM_TOWERSHIELD))
    {
     oNew = CopyItemAndModify(oItem, ITEM_APPR_TYPE_SIMPLE_MODEL, 0, 131, TRUE);
       nSlot = INVENTORY_SLOT_LEFTHAND;
        DestroyObject(oItem);
        oItem = oNew;
        SetLocalObject(oPC, "old_item",oNew );
        AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oPC, ActionEquipItem(oItem, nSlot));
        SetCustomToken(90404, "Colorful V Shape");
         SendMessageToPC(oPC,  IntToString(nCurrApp));
 }     else if ((nCurrApp <= 149) &&  (nCurrApp >= 131) && (iBase == BASE_ITEM_TOWERSHIELD))
    {
 SpeakString("You have come to the end of the List");
 }
   }
