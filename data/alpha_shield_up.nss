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
  /*---------------------------------------------------------
  over Ride code for falty 2da files that don't like working now there suposed to
     --------------------------------------------------------*/
   if ((nCurrApp == 85) && (iBase == BASE_ITEM_TOWERSHIELD))
    {
     SpeakString("You have come to the end of the List");
  /*-------------------------------------------------------
    Over Ride done, lets  move on
    -------------------------------------------------------*/
    }
          //Small shield
      else if ((nCurrApp <= 12) &&  (nCurrApp >= 11) && (iBase == BASE_ITEM_SMALLSHIELD))
    {
       oNew = CopyItemAndModify(oItem, ITEM_APPR_TYPE_SIMPLE_MODEL, 0, nCurrApp + 1, TRUE);
       nSlot = INVENTORY_SLOT_LEFTHAND;
       DestroyObject(oItem);
       oItem = oNew;
       SetLocalObject(oPC, "old_item",oNew );
       AssignCommand(oPC, ClearAllActions(TRUE));
       AssignCommand(oPC, ActionEquipItem(oItem, nSlot));

    }
         else if ((nCurrApp == 14)&& (iBase == BASE_ITEM_SMALLSHIELD))
    {
      SpeakString("You have come to the end of the List");

    }
         else if ((nCurrApp <= 16) &&  (nCurrApp >= 15)&& (iBase == BASE_ITEM_SMALLSHIELD))
    {
       oNew = CopyItemAndModify(oItem, ITEM_APPR_TYPE_SIMPLE_MODEL, 0, nCurrApp + 1, TRUE);
       nSlot = INVENTORY_SLOT_LEFTHAND;
        DestroyObject(oItem);
        oItem = oNew;
SetLocalObject(oPC, "old_item",oNew );
        AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oPC, ActionEquipItem(oItem, nSlot));

    }

          else if ((nCurrApp <= 22) &&  (nCurrApp >= 21) && (iBase == BASE_ITEM_SMALLSHIELD))
    {
       oNew = CopyItemAndModify(oItem, ITEM_APPR_TYPE_SIMPLE_MODEL, 0, nCurrApp + 1, TRUE);
       nSlot = INVENTORY_SLOT_LEFTHAND;
        DestroyObject(oItem);
        oItem = oNew;
        SetLocalObject(oPC, "old_item",oNew );
       AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oPC, ActionEquipItem(oItem, nSlot));

    }
          else if ((nCurrApp <= 32) &&  (nCurrApp >= 31) && (iBase == BASE_ITEM_SMALLSHIELD))
    {
       oNew = CopyItemAndModify(oItem, ITEM_APPR_TYPE_SIMPLE_MODEL, 0, nCurrApp + 1, TRUE);
       nSlot = INVENTORY_SLOT_LEFTHAND;
        DestroyObject(oItem);
        oItem = oNew;
        SetLocalObject(oPC, "old_item",oNew );
       AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oPC, ActionEquipItem(oItem, nSlot));
           }
          else if ((nCurrApp <= 42) &&  (nCurrApp >= 41) && (iBase == BASE_ITEM_SMALLSHIELD))
    {
      oNew = CopyItemAndModify(oItem, ITEM_APPR_TYPE_SIMPLE_MODEL, 0, nCurrApp + 1, TRUE);
nSlot = INVENTORY_SLOT_LEFTHAND;
        DestroyObject(oItem);
        oItem = oNew;
        SetLocalObject(oPC, "old_item",oNew );
       AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oPC, ActionEquipItem(oItem, nSlot));

    }
          else if ((nCurrApp <= 52) &&  (nCurrApp >= 51) && (iBase == BASE_ITEM_SMALLSHIELD))
    {
       oNew = CopyItemAndModify(oItem, ITEM_APPR_TYPE_SIMPLE_MODEL, 0, nCurrApp + 1, TRUE);
       nSlot = INVENTORY_SLOT_LEFTHAND;
        DestroyObject(oItem);
        oItem = oNew;
        SetLocalObject(oPC, "old_item",oNew );
        AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oPC, ActionEquipItem(oItem, nSlot));

    }
          else if ((nCurrApp <= 59) &&  (nCurrApp >= 54) && (iBase == BASE_ITEM_SMALLSHIELD))
    {
      oNew = CopyItemAndModify(oItem, ITEM_APPR_TYPE_SIMPLE_MODEL, 0, nCurrApp + 1, TRUE);
       nSlot = INVENTORY_SLOT_LEFTHAND;
        DestroyObject(oItem);
        oItem = oNew;
        SetLocalObject(oPC, "old_item",oNew );
        AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oPC, ActionEquipItem(oItem, nSlot));


    }
          else if ((nCurrApp == 81)  && (iBase == BASE_ITEM_SMALLSHIELD))
    {
 oNew = CopyItemAndModify(oItem, ITEM_APPR_TYPE_SIMPLE_MODEL, 0, nCurrApp + 1, TRUE);
       nSlot = INVENTORY_SLOT_LEFTHAND;
        DestroyObject(oItem);
        oItem = oNew;
        SetLocalObject(oPC, "old_item",oNew );
        AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oPC, ActionEquipItem(oItem, nSlot));


    }
          else if ((nCurrApp == 91) && (iBase == BASE_ITEM_SMALLSHIELD))
    {
     oNew = CopyItemAndModify(oItem, ITEM_APPR_TYPE_SIMPLE_MODEL, 0, nCurrApp + 1, TRUE);
       nSlot = INVENTORY_SLOT_LEFTHAND;
        DestroyObject(oItem);
        oItem = oNew;
        SetLocalObject(oPC, "old_item",oNew );
        AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oPC, ActionEquipItem(oItem, nSlot));



    }
      //Large Shields
    else if ((nCurrApp <= 12) &&  (nCurrApp >= 11) && (iBase == BASE_ITEM_LARGESHIELD))
    {
     oNew = CopyItemAndModify(oItem, ITEM_APPR_TYPE_SIMPLE_MODEL, 0, nCurrApp + 1, TRUE);
       nSlot = INVENTORY_SLOT_LEFTHAND;
        DestroyObject(oItem);
        oItem = oNew;
        SetLocalObject(oPC, "old_item",oNew );
        AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oPC, ActionEquipItem(oItem, nSlot));
      }
     else if ((nCurrApp == 13) && (iBase == BASE_ITEM_LARGESHIELD))
    {
     oNew = CopyItemAndModify(oItem, ITEM_APPR_TYPE_SIMPLE_MODEL, 0, 44, TRUE);
       nSlot = INVENTORY_SLOT_LEFTHAND;
        DestroyObject(oItem);
        oItem = oNew;
        SetLocalObject(oPC, "old_item",oNew );
        AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oPC, ActionEquipItem(oItem, nSlot));
 }
     else if ((nCurrApp <= 18) &&  (nCurrApp >= 14) && (iBase == BASE_ITEM_LARGESHIELD))
    {
     oNew = CopyItemAndModify(oItem, ITEM_APPR_TYPE_SIMPLE_MODEL, 0, nCurrApp + 1, TRUE);
       nSlot = INVENTORY_SLOT_LEFTHAND;
        DestroyObject(oItem);
        oItem = oNew;
        SetLocalObject(oPC, "old_item",oNew );
        AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oPC, ActionEquipItem(oItem, nSlot));

 }
       else if ((nCurrApp <= 22) &&  (nCurrApp >= 21) && (iBase == BASE_ITEM_LARGESHIELD))
    {
     oNew = CopyItemAndModify(oItem, ITEM_APPR_TYPE_SIMPLE_MODEL, 0, nCurrApp + 1, TRUE);
       nSlot = INVENTORY_SLOT_LEFTHAND;
        DestroyObject(oItem);
        oItem = oNew;
        SetLocalObject(oPC, "old_item",oNew );
        AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oPC, ActionEquipItem(oItem, nSlot));

 }
         else if ((nCurrApp <= 32) &&  (nCurrApp >= 31) && (iBase == BASE_ITEM_LARGESHIELD))
    {
     oNew = CopyItemAndModify(oItem, ITEM_APPR_TYPE_SIMPLE_MODEL, 0, nCurrApp + 1, TRUE);
       nSlot = INVENTORY_SLOT_LEFTHAND;
        DestroyObject(oItem);
        oItem = oNew;
        SetLocalObject(oPC, "old_item",oNew );
        AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oPC, ActionEquipItem(oItem, nSlot));

 }
        else if ((nCurrApp <= 42) &&  (nCurrApp >= 41) && (iBase == BASE_ITEM_LARGESHIELD))
    {
     oNew = CopyItemAndModify(oItem, ITEM_APPR_TYPE_SIMPLE_MODEL, 0, nCurrApp + 1, TRUE);
       nSlot = INVENTORY_SLOT_LEFTHAND;
        DestroyObject(oItem);
        oItem = oNew;
        SetLocalObject(oPC, "old_item",oNew );
        AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oPC, ActionEquipItem(oItem, nSlot));

 }
        else if ((nCurrApp <= 52) &&  (nCurrApp >= 51) && (iBase == BASE_ITEM_LARGESHIELD))
    {
     oNew = CopyItemAndModify(oItem, ITEM_APPR_TYPE_SIMPLE_MODEL, 0, nCurrApp + 1, TRUE);
       nSlot = INVENTORY_SLOT_LEFTHAND;
        DestroyObject(oItem);
        oItem = oNew;
        SetLocalObject(oPC, "old_item",oNew );
        AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oPC, ActionEquipItem(oItem, nSlot));

 }
        else if ((nCurrApp <= 55) &&  (nCurrApp >= 54) && (iBase == BASE_ITEM_LARGESHIELD))
    {
     oNew = CopyItemAndModify(oItem, ITEM_APPR_TYPE_SIMPLE_MODEL, 0, nCurrApp + 1, TRUE);
       nSlot = INVENTORY_SLOT_LEFTHAND;
        DestroyObject(oItem);
        oItem = oNew;
SetLocalObject(oPC, "old_item",oNew );
        AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oPC, ActionEquipItem(oItem, nSlot));

 }
    else if ((nCurrApp <= 58) &&  (nCurrApp >= 57) && (iBase == BASE_ITEM_LARGESHIELD))
    {
     oNew = CopyItemAndModify(oItem, ITEM_APPR_TYPE_SIMPLE_MODEL, 0, nCurrApp + 1, TRUE);
       nSlot = INVENTORY_SLOT_LEFTHAND;
        DestroyObject(oItem);
        oItem = oNew;
        SetLocalObject(oPC, "old_item",oNew );
        AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oPC, ActionEquipItem(oItem, nSlot));


 }
    else if ((nCurrApp <= 62) &&  (nCurrApp >= 60) && (iBase == BASE_ITEM_LARGESHIELD))
    {
     oNew = CopyItemAndModify(oItem, ITEM_APPR_TYPE_SIMPLE_MODEL, 0, nCurrApp + 1, TRUE);
       nSlot = INVENTORY_SLOT_LEFTHAND;
        DestroyObject(oItem);
        oItem = oNew;
       SetLocalObject(oPC, "old_item",oNew );
        AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oPC, ActionEquipItem(oItem, nSlot));
      }
    else if ((nCurrApp == 63) && (iBase == BASE_ITEM_LARGESHIELD))
    {
     oNew = CopyItemAndModify(oItem, ITEM_APPR_TYPE_SIMPLE_MODEL, 0, 86, TRUE);
       nSlot = INVENTORY_SLOT_LEFTHAND;
        DestroyObject(oItem);
        oItem = oNew;
        SetLocalObject(oPC, "old_item",oNew );
        AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oPC, ActionEquipItem(oItem, nSlot));


 }
     else if ((nCurrApp <= 96) &&  (nCurrApp >= 86) && (iBase == BASE_ITEM_LARGESHIELD))
    {
     oNew = CopyItemAndModify(oItem, ITEM_APPR_TYPE_SIMPLE_MODEL, 0, nCurrApp + 1, TRUE);
       nSlot = INVENTORY_SLOT_LEFTHAND;
        DestroyObject(oItem);
        oItem = oNew;
        SetLocalObject(oPC, "old_item",oNew );
        AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oPC, ActionEquipItem(oItem, nSlot));

 }
      else if ((nCurrApp <= 84) &&  (nCurrApp >= 64) && (iBase == BASE_ITEM_LARGESHIELD))
    {
     oNew = CopyItemAndModify(oItem, ITEM_APPR_TYPE_SIMPLE_MODEL, 0, nCurrApp + 1, TRUE);
       nSlot = INVENTORY_SLOT_LEFTHAND;
        DestroyObject(oItem);
        oItem = oNew;
        SetLocalObject(oPC, "old_item",oNew );
       AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oPC, ActionEquipItem(oItem, nSlot));

 }
   else if ((nCurrApp <= 118) &&  (nCurrApp >= 111) && (iBase == BASE_ITEM_LARGESHIELD))
    {
     oNew = CopyItemAndModify(oItem, ITEM_APPR_TYPE_SIMPLE_MODEL, 0, nCurrApp + 1, TRUE);
       nSlot = INVENTORY_SLOT_LEFTHAND;
        DestroyObject(oItem);
        oItem = oNew;
        SetLocalObject(oPC, "old_item",oNew );
        AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oPC, ActionEquipItem(oItem, nSlot));

 }
    else if ((nCurrApp <= 128) &&  (nCurrApp >= 121) && (iBase == BASE_ITEM_LARGESHIELD))
    {
     oNew = CopyItemAndModify(oItem, ITEM_APPR_TYPE_SIMPLE_MODEL, 0, nCurrApp + 1, TRUE);
       nSlot = INVENTORY_SLOT_LEFTHAND;
        DestroyObject(oItem);
        oItem = oNew;
        SetLocalObject(oPC, "old_item",oNew );
        AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oPC, ActionEquipItem(oItem, nSlot));

 }
    else if ((nCurrApp <= 138) &&  (nCurrApp >= 131) && (iBase == BASE_ITEM_LARGESHIELD))
    {
     oNew = CopyItemAndModify(oItem, ITEM_APPR_TYPE_SIMPLE_MODEL, 0, nCurrApp + 1, TRUE);
       nSlot = INVENTORY_SLOT_LEFTHAND;
        DestroyObject(oItem);
        oItem = oNew;
        SetLocalObject(oPC, "old_item",oNew );
        AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oPC, ActionEquipItem(oItem, nSlot));

 }
   else if ((nCurrApp <= 142) &&  (nCurrApp >= 141) && (iBase == BASE_ITEM_LARGESHIELD))
    {
     oNew = CopyItemAndModify(oItem, ITEM_APPR_TYPE_SIMPLE_MODEL, 0, nCurrApp + 1, TRUE);
       nSlot = INVENTORY_SLOT_LEFTHAND;
        DestroyObject(oItem);
        oItem = oNew;
        SetLocalObject(oPC, "old_item",oNew );
        AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oPC, ActionEquipItem(oItem, nSlot));

 }
 else if ((nCurrApp <= 148) &&  (nCurrApp >= 144) && (iBase == BASE_ITEM_LARGESHIELD))
    {
     oNew = CopyItemAndModify(oItem, ITEM_APPR_TYPE_SIMPLE_MODEL, 0, nCurrApp + 1, TRUE);
       nSlot = INVENTORY_SLOT_LEFTHAND;
        DestroyObject(oItem);
        oItem = oNew;
        SetLocalObject(oPC, "old_item",oNew );
        AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oPC, ActionEquipItem(oItem, nSlot));

 }
     else if ((nCurrApp <= 154) &&  (nCurrApp >= 151) && (iBase == BASE_ITEM_LARGESHIELD))
    {
         oNew = CopyItemAndModify(oItem, ITEM_APPR_TYPE_SIMPLE_MODEL, 0, nCurrApp + 1, TRUE);
       nSlot = INVENTORY_SLOT_LEFTHAND;
        DestroyObject(oItem);
        oItem = oNew;
        SetLocalObject(oPC, "old_item",oNew );
        AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oPC, ActionEquipItem(oItem, nSlot));

         }

/* TOWER SHIELDS BABY! */
   else if ((nCurrApp <= 12) &&  (nCurrApp >= 11) && (iBase == BASE_ITEM_TOWERSHIELD))
    {
     oNew = CopyItemAndModify(oItem, ITEM_APPR_TYPE_SIMPLE_MODEL, 0, nCurrApp + 1, TRUE);
       nSlot = INVENTORY_SLOT_LEFTHAND;
        DestroyObject(oItem);
        oItem = oNew;
         SetLocalObject(oPC, "old_item",oNew );
        AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oPC, ActionEquipItem(oItem, nSlot));

     SendMessageToPC(oPC,  IntToString(nCurrApp));
 }
    else if ((nCurrApp <= 22) &&  (nCurrApp >= 21) && (iBase == BASE_ITEM_TOWERSHIELD))
    {
     oNew = CopyItemAndModify(oItem, ITEM_APPR_TYPE_SIMPLE_MODEL, 0, nCurrApp + 1, TRUE);
       nSlot = INVENTORY_SLOT_LEFTHAND;
        DestroyObject(oItem);
        oItem = oNew;
        SetLocalObject(oPC, "old_item",oNew );
        AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oPC, ActionEquipItem(oItem, nSlot));

         SendMessageToPC(oPC,  IntToString(nCurrApp));
     }
      else if ((nCurrApp <= 32) &&  (nCurrApp >= 31) && (iBase == BASE_ITEM_TOWERSHIELD))
    {
     oNew = CopyItemAndModify(oItem, ITEM_APPR_TYPE_SIMPLE_MODEL, 0, nCurrApp + 1, TRUE);
       nSlot = INVENTORY_SLOT_LEFTHAND;
        DestroyObject(oItem);
        oItem = oNew;
        SetLocalObject(oPC, "old_item",oNew );
        AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oPC, ActionEquipItem(oItem, nSlot));

 SendMessageToPC(oPC,  IntToString(nCurrApp));
 }


      else if ((nCurrApp <= 42) &&  (nCurrApp >= 41) && (iBase == BASE_ITEM_TOWERSHIELD))
    {
     oNew = CopyItemAndModify(oItem, ITEM_APPR_TYPE_SIMPLE_MODEL, 0, nCurrApp + 1, TRUE);
      SendMessageToPC(oPC,  IntToString(nCurrApp));
       nSlot = INVENTORY_SLOT_LEFTHAND;

       DestroyObject(oItem);
        oItem = oNew;
        SetLocalObject(oPC, "old_item",oNew );
        AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oPC, ActionEquipItem(oItem, nSlot));

     SendMessageToPC(oPC,  IntToString(nCurrApp));
 }
    else if ((nCurrApp <= 45) &&  (nCurrApp >= 44) && (iBase == BASE_ITEM_TOWERSHIELD))
    {
        oNew = CopyItemAndModify(oItem, ITEM_APPR_TYPE_SIMPLE_MODEL, 0, nCurrApp + 1, TRUE);
       nSlot = INVENTORY_SLOT_LEFTHAND;
        DestroyObject(oItem);
        oItem = oNew;
        SetLocalObject(oPC, "old_item",oNew );
        AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oPC, ActionEquipItem(oItem, nSlot));

       SendMessageToPC(oPC,  IntToString(nCurrApp));
 }
   else if ((nCurrApp == 48) && (iBase == BASE_ITEM_TOWERSHIELD))
    {
     oNew = CopyItemAndModify(oItem, ITEM_APPR_TYPE_SIMPLE_MODEL, 0, nCurrApp + 1, TRUE);
       nSlot = INVENTORY_SLOT_LEFTHAND;
        DestroyObject(oItem);
        oItem = oNew;
        SetLocalObject(oPC, "old_item",oNew );
        AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oPC, ActionEquipItem(oItem, nSlot));

         SendMessageToPC(oPC,  IntToString(nCurrApp));
 }
    else if ((nCurrApp <= 59) &&  (nCurrApp >= 51) && (iBase == BASE_ITEM_TOWERSHIELD))
    {
     oNew = CopyItemAndModify(oItem, ITEM_APPR_TYPE_SIMPLE_MODEL, 0, nCurrApp + 1, TRUE);
       nSlot = INVENTORY_SLOT_LEFTHAND;
        DestroyObject(oItem);
        oItem = oNew;
        SetLocalObject(oPC, "old_item",oNew );
        AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oPC, ActionEquipItem(oItem, nSlot));

        SendMessageToPC(oPC,  IntToString(nCurrApp));
 }
   else if ((nCurrApp <= 62) &&  (nCurrApp >= 61) && (iBase == BASE_ITEM_TOWERSHIELD))
    {
     oNew = CopyItemAndModify(oItem, ITEM_APPR_TYPE_SIMPLE_MODEL, 0, nCurrApp + 1, TRUE);
       nSlot = INVENTORY_SLOT_LEFTHAND;
        DestroyObject(oItem);
        oItem = oNew;
SetLocalObject(oPC, "old_item",oNew );
        AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oPC, ActionEquipItem(oItem, nSlot));

        SendMessageToPC(oPC,  IntToString(nCurrApp));
 }
   else if ((nCurrApp <= 65) &&  (nCurrApp >= 64) && (iBase == BASE_ITEM_TOWERSHIELD))
    {
     oNew = CopyItemAndModify(oItem, ITEM_APPR_TYPE_SIMPLE_MODEL, 0, nCurrApp + 1, TRUE);
       nSlot = INVENTORY_SLOT_LEFTHAND;
        DestroyObject(oItem);
        oItem = oNew;
        SetLocalObject(oPC, "old_item",oNew );
        AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oPC, ActionEquipItem(oItem, nSlot));

 SendMessageToPC(oPC,  IntToString(nCurrApp));
 }
    else if (((nCurrApp <= 69) &&  (nCurrApp >= 67) && (iBase == BASE_ITEM_TOWERSHIELD))  || ((nCurrApp <= 104) &&  (nCurrApp >= 74) && (iBase == BASE_ITEM_TOWERSHIELD)))
    {
     oNew = CopyItemAndModify(oItem, ITEM_APPR_TYPE_SIMPLE_MODEL, 0, nCurrApp + 1, TRUE);
       nSlot = INVENTORY_SLOT_LEFTHAND;
        DestroyObject(oItem);
        oItem = oNew;
        SetLocalObject(oPC, "old_item",oNew );
        AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oPC, ActionEquipItem(oItem, nSlot));

       SendMessageToPC(oPC,  IntToString(nCurrApp));
 }
    else if ((nCurrApp == 70) && (iBase == BASE_ITEM_TOWERSHIELD))
    {
     oNew = CopyItemAndModify(oItem, ITEM_APPR_TYPE_SIMPLE_MODEL, 0, nCurrApp + 4, TRUE);
       nSlot = INVENTORY_SLOT_LEFTHAND;
        DestroyObject(oItem);
        oItem = oNew;
        SetLocalObject(oPC, "old_item",oNew );
        AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oPC, ActionEquipItem(oItem, nSlot));

       SendMessageToPC(oPC,  IntToString(nCurrApp));
 }
  else if ((nCurrApp <= 083) &&  (nCurrApp >= 074) && (iBase == BASE_ITEM_TOWERSHIELD))
    {
     oNew = CopyItemAndModify(oItem, ITEM_APPR_TYPE_SIMPLE_MODEL, 0, nCurrApp + 1, TRUE);
       nSlot = INVENTORY_SLOT_LEFTHAND;
        DestroyObject(oItem);
        oItem = oNew;
        SetLocalObject(oPC, "old_item",oNew );
        AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oPC, ActionEquipItem(oItem, nSlot));

       SendMessageToPC(oPC,  IntToString(nCurrApp));


 }
     else if ((nCurrApp <= 72) &&  (nCurrApp >= 71) && (iBase == BASE_ITEM_TOWERSHIELD))
    {
     oNew = CopyItemAndModify(oItem, ITEM_APPR_TYPE_SIMPLE_MODEL, 0, nCurrApp + 1, TRUE);
       nSlot = INVENTORY_SLOT_LEFTHAND;
        DestroyObject(oItem);
        oItem = oNew;
        SetLocalObject(oPC, "old_item",oNew );
        AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oPC, ActionEquipItem(oItem, nSlot));

         SendMessageToPC(oPC,  IntToString(nCurrApp));
 }
      else if ((nCurrApp <= 109) &&  (nCurrApp >= 105) && (iBase == BASE_ITEM_TOWERSHIELD))
    {
     oNew = CopyItemAndModify(oItem, ITEM_APPR_TYPE_SIMPLE_MODEL, 0, nCurrApp + 1, TRUE);
       nSlot = INVENTORY_SLOT_LEFTHAND;
        DestroyObject(oItem);
        oItem = oNew;
        SetLocalObject(oPC, "old_item",oNew );
        AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oPC, ActionEquipItem(oItem, nSlot));

       SendMessageToPC(oPC,  IntToString(nCurrApp));
 }
       else if ((nCurrApp <= 118) &&  (nCurrApp >= 111) && (iBase == BASE_ITEM_TOWERSHIELD))
    {
     oNew = CopyItemAndModify(oItem, ITEM_APPR_TYPE_SIMPLE_MODEL, 0, nCurrApp + 1, TRUE);
       nSlot = INVENTORY_SLOT_LEFTHAND;
        DestroyObject(oItem);
        oItem = oNew;
        SetLocalObject(oPC, "old_item",oNew );
        AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oPC, ActionEquipItem(oItem, nSlot));


 }
       else if ((nCurrApp <= 122) &&  (nCurrApp >= 121) && (iBase == BASE_ITEM_TOWERSHIELD))
    {
     oNew = CopyItemAndModify(oItem, ITEM_APPR_TYPE_SIMPLE_MODEL, 0, nCurrApp + 1, TRUE);
       nSlot = INVENTORY_SLOT_LEFTHAND;
        DestroyObject(oItem);
        oItem = oNew;
SetLocalObject(oPC, "old_item",oNew );
        AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oPC, ActionEquipItem(oItem, nSlot));

         SendMessageToPC(oPC,  IntToString(nCurrApp));
 }
        else if ((nCurrApp <= 128) &&  (nCurrApp >= 124) && (iBase == BASE_ITEM_TOWERSHIELD))
    {
     oNew = CopyItemAndModify(oItem, ITEM_APPR_TYPE_SIMPLE_MODEL, 0, nCurrApp + 1, TRUE);
       nSlot = INVENTORY_SLOT_LEFTHAND;
        DestroyObject(oItem);
        oItem = oNew;
        SetLocalObject(oPC, "old_item",oNew );
        AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oPC, ActionEquipItem(oItem, nSlot));

         SendMessageToPC(oPC,  IntToString(nCurrApp));
 }     else if ((nCurrApp <= 138) &&  (nCurrApp >= 131) && (iBase == BASE_ITEM_TOWERSHIELD))
    {
   oNew = CopyItemAndModify(oItem, ITEM_APPR_TYPE_SIMPLE_MODEL, 0, nCurrApp + 1, TRUE);
       nSlot = INVENTORY_SLOT_LEFTHAND;
        DestroyObject(oItem);
        oItem = oNew;
        SetLocalObject(oPC, "old_item",oNew );
        AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oPC, ActionEquipItem(oItem, nSlot));

         SendMessageToPC(oPC,  IntToString(nCurrApp));
 }
 else if ((nCurrApp == 139) && (iBase == BASE_ITEM_TOWERSHIELD))
    {
   oNew = CopyItemAndModify(oItem, ITEM_APPR_TYPE_SIMPLE_MODEL, 0, nCurrApp + 2, TRUE);
       nSlot = INVENTORY_SLOT_LEFTHAND;
        DestroyObject(oItem);
        oItem = oNew;
        SetLocalObject(oPC, "old_item",oNew );
        AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oPC, ActionEquipItem(oItem, nSlot));

         SendMessageToPC(oPC,  IntToString(nCurrApp));
 }
  else if ((nCurrApp <= 148) &&  (nCurrApp >= 141) && (iBase == BASE_ITEM_TOWERSHIELD))
    {
   oNew = CopyItemAndModify(oItem, ITEM_APPR_TYPE_SIMPLE_MODEL, 0, nCurrApp + 1, TRUE);
       nSlot = INVENTORY_SLOT_LEFTHAND;
        DestroyObject(oItem);
        oItem = oNew;
        SetLocalObject(oPC, "old_item",oNew );
        AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oPC, ActionEquipItem(oItem, nSlot));

         SendMessageToPC(oPC,  IntToString(nCurrApp));
 }
 else
 {
  SpeakString("You have come to the end of the List");
   }
  }
