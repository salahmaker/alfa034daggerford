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

  /*-------------------------------------------------------
    Over Ride done, lets  move on
    -------------------------------------------------------*/

          //Small shield
     if ((nCurrApp <= 13) &&  (nCurrApp >= 12) && (iBase == BASE_ITEM_SMALLSHIELD))
    {
       oNew = CopyItemAndModify(oItem, ITEM_APPR_TYPE_SIMPLE_MODEL, 0, nCurrApp - 1, TRUE);
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
         else if ((nCurrApp <= 17) &&  (nCurrApp >= 16)&& (iBase == BASE_ITEM_SMALLSHIELD))
    {
       oNew = CopyItemAndModify(oItem, ITEM_APPR_TYPE_SIMPLE_MODEL, 0, nCurrApp - 1, TRUE);
       nSlot = INVENTORY_SLOT_LEFTHAND;
        DestroyObject(oItem);
        oItem = oNew;
         SetLocalObject(oPC, "old_item",oNew );
        AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oPC, ActionEquipItem(oItem, nSlot));

    }

          else if ((nCurrApp <= 23) &&  (nCurrApp >= 22) && (iBase == BASE_ITEM_SMALLSHIELD))
    {
       oNew = CopyItemAndModify(oItem, ITEM_APPR_TYPE_SIMPLE_MODEL, 0, nCurrApp - 1, TRUE);
       nSlot = INVENTORY_SLOT_LEFTHAND;
        DestroyObject(oItem);
        oItem = oNew;
        SetLocalObject(oPC, "old_item",oNew );
        AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oPC, ActionEquipItem(oItem, nSlot));

    }
          else if ((nCurrApp <= 33) &&  (nCurrApp >= 32) && (iBase == BASE_ITEM_SMALLSHIELD))
    {
       oNew = CopyItemAndModify(oItem, ITEM_APPR_TYPE_SIMPLE_MODEL, 0, nCurrApp - 1, TRUE);
       nSlot = INVENTORY_SLOT_LEFTHAND;
        DestroyObject(oItem);
        oItem = oNew;
        SetLocalObject(oPC, "old_item",oNew );
        AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oPC, ActionEquipItem(oItem, nSlot));
           }
          else if ((nCurrApp <= 43) &&  (nCurrApp >= 42) && (iBase == BASE_ITEM_SMALLSHIELD))
    {
      oNew = CopyItemAndModify(oItem, ITEM_APPR_TYPE_SIMPLE_MODEL, 0, nCurrApp - 1, TRUE);
nSlot = INVENTORY_SLOT_LEFTHAND;
        DestroyObject(oItem);
        oItem = oNew;
        SetLocalObject(oPC, "old_item",oNew );
        AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oPC, ActionEquipItem(oItem, nSlot));

    }
          else if ((nCurrApp <= 53) &&  (nCurrApp >= 52) && (iBase == BASE_ITEM_SMALLSHIELD))
    {
       oNew = CopyItemAndModify(oItem, ITEM_APPR_TYPE_SIMPLE_MODEL, 0, nCurrApp - 1, TRUE);
       nSlot = INVENTORY_SLOT_LEFTHAND;
        DestroyObject(oItem);
        oItem = oNew;
        SetLocalObject(oPC, "old_item",oNew );
        AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oPC, ActionEquipItem(oItem, nSlot));

    }
          else if ((nCurrApp <= 60) &&  (nCurrApp >= 55) && (iBase == BASE_ITEM_SMALLSHIELD))
    {
      oNew = CopyItemAndModify(oItem, ITEM_APPR_TYPE_SIMPLE_MODEL, 0, nCurrApp - 1, TRUE);
       nSlot = INVENTORY_SLOT_LEFTHAND;
        DestroyObject(oItem);
        oItem = oNew;
        SetLocalObject(oPC, "old_item",oNew );
        AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oPC, ActionEquipItem(oItem, nSlot));


    }
          else if ((nCurrApp == 82)  && (iBase == BASE_ITEM_SMALLSHIELD))
    {
 oNew = CopyItemAndModify(oItem, ITEM_APPR_TYPE_SIMPLE_MODEL, 0, nCurrApp - 1, TRUE);
       nSlot = INVENTORY_SLOT_LEFTHAND;
        DestroyObject(oItem);
        oItem = oNew;
        SetLocalObject(oPC, "old_item",oNew );
        AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oPC, ActionEquipItem(oItem, nSlot));


    }
          else if ((nCurrApp == 92) && (iBase == BASE_ITEM_SMALLSHIELD))
    {
     oNew = CopyItemAndModify(oItem, ITEM_APPR_TYPE_SIMPLE_MODEL, 0, nCurrApp - 1, TRUE);
       nSlot = INVENTORY_SLOT_LEFTHAND;
        DestroyObject(oItem);
        oItem = oNew;
        SetLocalObject(oPC, "old_item",oNew );
        AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oPC, ActionEquipItem(oItem, nSlot));



    }
      //Large Shields
    else if ((nCurrApp <= 13) &&  (nCurrApp >= 12) && (iBase == BASE_ITEM_LARGESHIELD))
    {
     oNew = CopyItemAndModify(oItem, ITEM_APPR_TYPE_SIMPLE_MODEL, 0, nCurrApp - 1, TRUE);
       nSlot = INVENTORY_SLOT_LEFTHAND;
        DestroyObject(oItem);
        oItem = oNew;
        SetLocalObject(oPC, "old_item",oNew );
        AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oPC, ActionEquipItem(oItem, nSlot));
        }
          else if ((nCurrApp == 44) && (iBase == BASE_ITEM_LARGESHIELD))
    {
     oNew = CopyItemAndModify(oItem, ITEM_APPR_TYPE_SIMPLE_MODEL, 0,13, TRUE);
       nSlot = INVENTORY_SLOT_LEFTHAND;
        DestroyObject(oItem);
        oItem = oNew;
        SetLocalObject(oPC, "old_item",oNew );
        AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oPC, ActionEquipItem(oItem, nSlot));
 }
     else if ((nCurrApp <= 19) &&  (nCurrApp >= 15) && (iBase == BASE_ITEM_LARGESHIELD))
    {
     oNew = CopyItemAndModify(oItem, ITEM_APPR_TYPE_SIMPLE_MODEL, 0, nCurrApp - 1, TRUE);
       nSlot = INVENTORY_SLOT_LEFTHAND;
        DestroyObject(oItem);
        oItem = oNew;
SetLocalObject(oPC, "old_item",oNew );
        AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oPC, ActionEquipItem(oItem, nSlot));

 }
       else if ((nCurrApp <= 23) &&  (nCurrApp >= 22) && (iBase == BASE_ITEM_LARGESHIELD))
    {
     oNew = CopyItemAndModify(oItem, ITEM_APPR_TYPE_SIMPLE_MODEL, 0, nCurrApp - 1, TRUE);
       nSlot = INVENTORY_SLOT_LEFTHAND;
        DestroyObject(oItem);
        oItem = oNew;
SetLocalObject(oPC, "old_item",oNew );
        AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oPC, ActionEquipItem(oItem, nSlot));

 }
         else if ((nCurrApp <= 33) &&  (nCurrApp >= 32) && (iBase == BASE_ITEM_LARGESHIELD))
    {
     oNew = CopyItemAndModify(oItem, ITEM_APPR_TYPE_SIMPLE_MODEL, 0, nCurrApp - 1, TRUE);
       nSlot = INVENTORY_SLOT_LEFTHAND;
        DestroyObject(oItem);
        oItem = oNew;
       SetLocalObject(oPC, "old_item",oNew );
        AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oPC, ActionEquipItem(oItem, nSlot));

 }
        else if ((nCurrApp <= 43) &&  (nCurrApp >= 42) && (iBase == BASE_ITEM_LARGESHIELD))
    {
     oNew = CopyItemAndModify(oItem, ITEM_APPR_TYPE_SIMPLE_MODEL, 0, nCurrApp - 1, TRUE);
       nSlot = INVENTORY_SLOT_LEFTHAND;
        DestroyObject(oItem);
        oItem = oNew;
        SetLocalObject(oPC, "old_item",oNew );
        AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oPC, ActionEquipItem(oItem, nSlot));

 }
        else if ((nCurrApp <= 53) &&  (nCurrApp >= 52) && (iBase == BASE_ITEM_LARGESHIELD))
    {
     oNew = CopyItemAndModify(oItem, ITEM_APPR_TYPE_SIMPLE_MODEL, 0, nCurrApp - 1, TRUE);
       nSlot = INVENTORY_SLOT_LEFTHAND;
        DestroyObject(oItem);
        oItem = oNew;
       SetLocalObject(oPC, "old_item",oNew );
        AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oPC, ActionEquipItem(oItem, nSlot));

 }
        else if ((nCurrApp <= 56) &&  (nCurrApp >= 55) && (iBase == BASE_ITEM_LARGESHIELD))
    {
     oNew = CopyItemAndModify(oItem, ITEM_APPR_TYPE_SIMPLE_MODEL, 0, nCurrApp - 1, TRUE);
       nSlot = INVENTORY_SLOT_LEFTHAND;
        DestroyObject(oItem);
        oItem = oNew;
        SetLocalObject(oPC, "old_item",oNew );
        AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oPC, ActionEquipItem(oItem, nSlot));

 }
    else if ((nCurrApp <= 59) &&  (nCurrApp >= 58) && (iBase == BASE_ITEM_LARGESHIELD))
    {
     oNew = CopyItemAndModify(oItem, ITEM_APPR_TYPE_SIMPLE_MODEL, 0, nCurrApp - 1, TRUE);
       nSlot = INVENTORY_SLOT_LEFTHAND;
        DestroyObject(oItem);
        oItem = oNew;
        SetLocalObject(oPC, "old_item",oNew );
        AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oPC, ActionEquipItem(oItem, nSlot));


 }
    else if ((nCurrApp <= 63) &&  (nCurrApp >= 61) && (iBase == BASE_ITEM_LARGESHIELD))
    {
     oNew = CopyItemAndModify(oItem, ITEM_APPR_TYPE_SIMPLE_MODEL, 0, nCurrApp - 1, TRUE);
       nSlot = INVENTORY_SLOT_LEFTHAND;
        DestroyObject(oItem);
        oItem = oNew;
        SetLocalObject(oPC, "old_item",oNew );
        AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oPC, ActionEquipItem(oItem, nSlot));
      }
    else if ((nCurrApp == 86) && (iBase == BASE_ITEM_LARGESHIELD))
    {
     oNew = CopyItemAndModify(oItem, ITEM_APPR_TYPE_SIMPLE_MODEL, 0, 63, TRUE);
       nSlot = INVENTORY_SLOT_LEFTHAND;
        DestroyObject(oItem);
        oItem = oNew;
        SetLocalObject(oPC, "old_item",oNew );
        AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oPC, ActionEquipItem(oItem, nSlot));


 }
     else if ((nCurrApp <= 97) &&  (nCurrApp >= 87) && (iBase == BASE_ITEM_LARGESHIELD))
    {
     oNew = CopyItemAndModify(oItem, ITEM_APPR_TYPE_SIMPLE_MODEL, 0, nCurrApp - 1, TRUE);
       nSlot = INVENTORY_SLOT_LEFTHAND;
        DestroyObject(oItem);
        oItem = oNew;
        SetLocalObject(oPC, "old_item",oNew );
        AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oPC, ActionEquipItem(oItem, nSlot));

 }
      else if ((nCurrApp <= 85) &&  (nCurrApp >= 65) && (iBase == BASE_ITEM_LARGESHIELD))
    {
     oNew = CopyItemAndModify(oItem, ITEM_APPR_TYPE_SIMPLE_MODEL, 0, nCurrApp - 1, TRUE);
       nSlot = INVENTORY_SLOT_LEFTHAND;
        DestroyObject(oItem);
        oItem = oNew;
        SetLocalObject(oPC, "old_item",oNew );
        AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oPC, ActionEquipItem(oItem, nSlot));

 }
   else if ((nCurrApp <= 119) &&  (nCurrApp >= 112) && (iBase == BASE_ITEM_LARGESHIELD))
    {
     oNew = CopyItemAndModify(oItem, ITEM_APPR_TYPE_SIMPLE_MODEL, 0, nCurrApp - 1, TRUE);
       nSlot = INVENTORY_SLOT_LEFTHAND;
        DestroyObject(oItem);
        oItem = oNew;
        SetLocalObject(oPC, "old_item",oNew );
        AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oPC, ActionEquipItem(oItem, nSlot));

 }
    else if ((nCurrApp <= 129) &&  (nCurrApp >= 122) && (iBase == BASE_ITEM_LARGESHIELD))
    {
     oNew = CopyItemAndModify(oItem, ITEM_APPR_TYPE_SIMPLE_MODEL, 0, nCurrApp - 1, TRUE);
       nSlot = INVENTORY_SLOT_LEFTHAND;
        DestroyObject(oItem);
        oItem = oNew;
        SetLocalObject(oPC, "old_item",oNew );
        AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oPC, ActionEquipItem(oItem, nSlot));

 }
    else if ((nCurrApp <= 139) &&  (nCurrApp >= 132) && (iBase == BASE_ITEM_LARGESHIELD))
    {
     oNew = CopyItemAndModify(oItem, ITEM_APPR_TYPE_SIMPLE_MODEL, 0, nCurrApp - 1, TRUE);
       nSlot = INVENTORY_SLOT_LEFTHAND;
        DestroyObject(oItem);
        oItem = oNew;
        SetLocalObject(oPC, "old_item",oNew );
        AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oPC, ActionEquipItem(oItem, nSlot));

 }
   else if ((nCurrApp <= 143) &&  (nCurrApp >= 142) && (iBase == BASE_ITEM_LARGESHIELD))
    {
     oNew = CopyItemAndModify(oItem, ITEM_APPR_TYPE_SIMPLE_MODEL, 0, nCurrApp - 1, TRUE);
       nSlot = INVENTORY_SLOT_LEFTHAND;
        DestroyObject(oItem);
        oItem = oNew;
        SetLocalObject(oPC, "old_item",oNew );
        AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oPC, ActionEquipItem(oItem, nSlot));

 }
 else if ((nCurrApp <= 149) &&  (nCurrApp >= 145) && (iBase == BASE_ITEM_LARGESHIELD))
    {
     oNew = CopyItemAndModify(oItem, ITEM_APPR_TYPE_SIMPLE_MODEL, 0, nCurrApp - 1, TRUE);
       nSlot = INVENTORY_SLOT_LEFTHAND;
        DestroyObject(oItem);
        oItem = oNew;
        SetLocalObject(oPC, "old_item",oNew );
        AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oPC, ActionEquipItem(oItem, nSlot));

 }
     else if ((nCurrApp <= 155) &&  (nCurrApp >= 152) && (iBase == BASE_ITEM_LARGESHIELD))
    {
         oNew = CopyItemAndModify(oItem, ITEM_APPR_TYPE_SIMPLE_MODEL, 0, nCurrApp - 1, TRUE);
       nSlot = INVENTORY_SLOT_LEFTHAND;
        DestroyObject(oItem);
        oItem = oNew;
        SetLocalObject(oPC, "old_item",oNew );
        AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oPC, ActionEquipItem(oItem, nSlot));

         }

/* TOWER SHIELDS BABY! */
   else if ((nCurrApp <= 13) &&  (nCurrApp >= 12) && (iBase == BASE_ITEM_TOWERSHIELD))
    {
     oNew = CopyItemAndModify(oItem, ITEM_APPR_TYPE_SIMPLE_MODEL, 0, nCurrApp - 1, TRUE);
       nSlot = INVENTORY_SLOT_LEFTHAND;
        DestroyObject(oItem);
        oItem = oNew;
        SetLocalObject(oPC, "old_item",oNew );
       AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oPC, ActionEquipItem(oItem, nSlot));

     SendMessageToPC(oPC,  IntToString(nCurrApp));
 }
    else if ((nCurrApp <= 23) &&  (nCurrApp >= 22) && (iBase == BASE_ITEM_TOWERSHIELD))
    {
     oNew = CopyItemAndModify(oItem, ITEM_APPR_TYPE_SIMPLE_MODEL, 0, nCurrApp - 1, TRUE);
       nSlot = INVENTORY_SLOT_LEFTHAND;
        DestroyObject(oItem);
        oItem = oNew;
       SetLocalObject(oPC, "old_item",oNew );
        AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oPC, ActionEquipItem(oItem, nSlot));

         SendMessageToPC(oPC,  IntToString(nCurrApp));
     }
      else if ((nCurrApp <= 33) &&  (nCurrApp >= 32) && (iBase == BASE_ITEM_TOWERSHIELD))
    {
     oNew = CopyItemAndModify(oItem, ITEM_APPR_TYPE_SIMPLE_MODEL, 0, nCurrApp - 1, TRUE);
       nSlot = INVENTORY_SLOT_LEFTHAND;
        DestroyObject(oItem);
        oItem = oNew;
        SetLocalObject(oPC, "old_item",oNew );
        AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oPC, ActionEquipItem(oItem, nSlot));

 SendMessageToPC(oPC,  IntToString(nCurrApp));
 }


      else if ((nCurrApp <= 43) &&  (nCurrApp >= 42) && (iBase == BASE_ITEM_TOWERSHIELD))
    {
     oNew = CopyItemAndModify(oItem, ITEM_APPR_TYPE_SIMPLE_MODEL, 0, nCurrApp - 1, TRUE);
      SendMessageToPC(oPC,  IntToString(nCurrApp));
       nSlot = INVENTORY_SLOT_LEFTHAND;

       DestroyObject(oItem);
        oItem = oNew;
         SetLocalObject(oPC, "old_item",oNew );
        AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oPC, ActionEquipItem(oItem, nSlot));

     SendMessageToPC(oPC,  IntToString(nCurrApp));
 }
    else if ((nCurrApp <= 46) &&  (nCurrApp >= 45) && (iBase == BASE_ITEM_TOWERSHIELD))
    {
        oNew = CopyItemAndModify(oItem, ITEM_APPR_TYPE_SIMPLE_MODEL, 0, nCurrApp - 1, TRUE);
       nSlot = INVENTORY_SLOT_LEFTHAND;
        DestroyObject(oItem);
        oItem = oNew;
        SetLocalObject(oPC, "old_item",oNew );
        AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oPC, ActionEquipItem(oItem, nSlot));

       SendMessageToPC(oPC,  IntToString(nCurrApp));
 }
   else if ((nCurrApp == 49) && (iBase == BASE_ITEM_TOWERSHIELD))
    {
     oNew = CopyItemAndModify(oItem, ITEM_APPR_TYPE_SIMPLE_MODEL, 0, nCurrApp - 1, TRUE);
       nSlot = INVENTORY_SLOT_LEFTHAND;
        DestroyObject(oItem);
        oItem = oNew;
        SetLocalObject(oPC, "old_item",oNew );
        AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oPC, ActionEquipItem(oItem, nSlot));

         SendMessageToPC(oPC,  IntToString(nCurrApp));
 }
    else if ((nCurrApp <= 60) &&  (nCurrApp >= 52) && (iBase == BASE_ITEM_TOWERSHIELD))
    {
     oNew = CopyItemAndModify(oItem, ITEM_APPR_TYPE_SIMPLE_MODEL, 0, nCurrApp - 1, TRUE);
       nSlot = INVENTORY_SLOT_LEFTHAND;
        DestroyObject(oItem);
        oItem = oNew;
        SetLocalObject(oPC, "old_item",oNew );
        AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oPC, ActionEquipItem(oItem, nSlot));

        SendMessageToPC(oPC,  IntToString(nCurrApp));
 }
   else if ((nCurrApp <= 63) &&  (nCurrApp >= 62) && (iBase == BASE_ITEM_TOWERSHIELD))
    {
     oNew = CopyItemAndModify(oItem, ITEM_APPR_TYPE_SIMPLE_MODEL, 0, nCurrApp - 1, TRUE);
       nSlot = INVENTORY_SLOT_LEFTHAND;
        DestroyObject(oItem);
        oItem = oNew;
        SetLocalObject(oPC, "old_item",oNew );
        AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oPC, ActionEquipItem(oItem, nSlot));

        SendMessageToPC(oPC,  IntToString(nCurrApp));
 }
   else if ((nCurrApp <= 66) &&  (nCurrApp >= 65) && (iBase == BASE_ITEM_TOWERSHIELD))
    {
     oNew = CopyItemAndModify(oItem, ITEM_APPR_TYPE_SIMPLE_MODEL, 0, nCurrApp - 1, TRUE);
       nSlot = INVENTORY_SLOT_LEFTHAND;
        DestroyObject(oItem);
        oItem = oNew;
        SetLocalObject(oPC, "old_item",oNew );
       AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oPC, ActionEquipItem(oItem, nSlot));

 SendMessageToPC(oPC,  IntToString(nCurrApp));
 }
    else if (((nCurrApp <= 70) &&  (nCurrApp >= 68) && (iBase == BASE_ITEM_TOWERSHIELD))  || ((nCurrApp <= 104) &&  (nCurrApp >= 74) && (iBase == BASE_ITEM_TOWERSHIELD)))
    {
     oNew = CopyItemAndModify(oItem, ITEM_APPR_TYPE_SIMPLE_MODEL, 0, nCurrApp - 1, TRUE);
       nSlot = INVENTORY_SLOT_LEFTHAND;
        DestroyObject(oItem);
        oItem = oNew;
        SetLocalObject(oPC, "old_item",oNew );
        AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oPC, ActionEquipItem(oItem, nSlot));

       SendMessageToPC(oPC,  IntToString(nCurrApp));
 }
    else if ((nCurrApp == 74) && (iBase == BASE_ITEM_TOWERSHIELD))
    {
     oNew = CopyItemAndModify(oItem, ITEM_APPR_TYPE_SIMPLE_MODEL, 0, nCurrApp - 4, TRUE);
       nSlot = INVENTORY_SLOT_LEFTHAND;
        DestroyObject(oItem);
        oItem = oNew;
SetLocalObject(oPC, "old_item",oNew );
        AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oPC, ActionEquipItem(oItem, nSlot));

       SendMessageToPC(oPC,  IntToString(nCurrApp));
 }
  else if ((nCurrApp <= 085) &&  (nCurrApp >= 075) && (iBase == BASE_ITEM_TOWERSHIELD))
    {
     oNew = CopyItemAndModify(oItem, ITEM_APPR_TYPE_SIMPLE_MODEL, 0, nCurrApp - 1, TRUE);
       nSlot = INVENTORY_SLOT_LEFTHAND;
        DestroyObject(oItem);
        oItem = oNew;
        SetLocalObject(oPC, "old_item",oNew );
        AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oPC, ActionEquipItem(oItem, nSlot));

       SendMessageToPC(oPC,  IntToString(nCurrApp));


 }
     else if ((nCurrApp <= 73) &&  (nCurrApp >= 72) && (iBase == BASE_ITEM_TOWERSHIELD))
    {
     oNew = CopyItemAndModify(oItem, ITEM_APPR_TYPE_SIMPLE_MODEL, 0, nCurrApp - 1, TRUE);
       nSlot = INVENTORY_SLOT_LEFTHAND;
        DestroyObject(oItem);
        oItem = oNew;
SetLocalObject(oPC, "old_item",oNew );
        AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oPC, ActionEquipItem(oItem, nSlot));

         SendMessageToPC(oPC,  IntToString(nCurrApp));
 }
      else if ((nCurrApp <= 110) &&  (nCurrApp >= 106) && (iBase == BASE_ITEM_TOWERSHIELD))
    {
     oNew = CopyItemAndModify(oItem, ITEM_APPR_TYPE_SIMPLE_MODEL, 0, nCurrApp - 1, TRUE);
       nSlot = INVENTORY_SLOT_LEFTHAND;
        DestroyObject(oItem);
        oItem = oNew;
        SetLocalObject(oPC, "old_item",oNew );
        AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oPC, ActionEquipItem(oItem, nSlot));

       SendMessageToPC(oPC,  IntToString(nCurrApp));
 }
       else if ((nCurrApp <= 119) &&  (nCurrApp >= 112) && (iBase == BASE_ITEM_TOWERSHIELD))
    {
     oNew = CopyItemAndModify(oItem, ITEM_APPR_TYPE_SIMPLE_MODEL, 0, nCurrApp - 1, TRUE);
       nSlot = INVENTORY_SLOT_LEFTHAND;
        DestroyObject(oItem);
        oItem = oNew;
        SetLocalObject(oPC, "old_item",oNew );
        AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oPC, ActionEquipItem(oItem, nSlot));


 }
       else if ((nCurrApp <= 123) &&  (nCurrApp >= 122) && (iBase == BASE_ITEM_TOWERSHIELD))
    {
     oNew = CopyItemAndModify(oItem, ITEM_APPR_TYPE_SIMPLE_MODEL, 0, nCurrApp - 1, TRUE);
       nSlot = INVENTORY_SLOT_LEFTHAND;
        DestroyObject(oItem);
        oItem = oNew;
        SetLocalObject(oPC, "old_item",oNew );
        AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oPC, ActionEquipItem(oItem, nSlot));

         SendMessageToPC(oPC,  IntToString(nCurrApp));
 }
        else if ((nCurrApp <= 129) &&  (nCurrApp >= 125) && (iBase == BASE_ITEM_TOWERSHIELD))
    {
     oNew = CopyItemAndModify(oItem, ITEM_APPR_TYPE_SIMPLE_MODEL, 0, nCurrApp - 1, TRUE);
       nSlot = INVENTORY_SLOT_LEFTHAND;
        DestroyObject(oItem);
        oItem = oNew;
        SetLocalObject(oPC, "old_item",oNew );
        AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oPC, ActionEquipItem(oItem, nSlot));

         SendMessageToPC(oPC,  IntToString(nCurrApp));
 }     else if ((nCurrApp <= 139) &&  (nCurrApp >= 132) && (iBase == BASE_ITEM_TOWERSHIELD))
    {
   oNew = CopyItemAndModify(oItem, ITEM_APPR_TYPE_SIMPLE_MODEL, 0, nCurrApp - 1, TRUE);
       nSlot = INVENTORY_SLOT_LEFTHAND;
        DestroyObject(oItem);
        oItem = oNew;
        SetLocalObject(oPC, "old_item",oNew );
        AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oPC, ActionEquipItem(oItem, nSlot));

         SendMessageToPC(oPC,  IntToString(nCurrApp));
 }
 else if ((nCurrApp == 141) && (iBase == BASE_ITEM_TOWERSHIELD))
    {
   oNew = CopyItemAndModify(oItem, ITEM_APPR_TYPE_SIMPLE_MODEL, 0, nCurrApp - 2, TRUE);
       nSlot = INVENTORY_SLOT_LEFTHAND;
        DestroyObject(oItem);
        oItem = oNew;
        SetLocalObject(oPC, "old_item",oNew );
        AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oPC, ActionEquipItem(oItem, nSlot));

         SendMessageToPC(oPC,  IntToString(nCurrApp));
 }
  else if ((nCurrApp <= 149) &&  (nCurrApp >= 142) && (iBase == BASE_ITEM_TOWERSHIELD))
    {
   oNew = CopyItemAndModify(oItem, ITEM_APPR_TYPE_SIMPLE_MODEL, 0, nCurrApp - 1, TRUE);
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

