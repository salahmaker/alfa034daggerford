int GetStoreValue(object oStore){
  object oItem = GetFirstItemInInventory(oStore);
  int iTotal = 0;
  while(oItem != OBJECT_INVALID){
    iTotal = iTotal + GetGoldPieceValue(oItem);
    oItem = GetNextItemInInventory(oStore);

  }

 return iTotal;

}


void main()
{
    object oStore = GetNearestObject(OBJECT_TYPE_STORE);
    int iTotal = 0;
    int iAvailable = 0;
    int iStoreDC = 0;
    int iMaxBuy = 0;

    int iMonth = GetCalendarMonth();
    int iYear = GetCalendarYear();

    object oPC = GetPCSpeaker();
    int iCHA = GetAbilityModifier(ABILITY_CHARISMA, oPC);
    int iAppraise = GetSkillRank(SKILL_APPRAISE, oPC);
    int iPersuade = GetSkillRank(SKILL_PERSUADE, oPC);

    iStoreDC = iStoreDC - iCHA;

    int iRollA = d20();
    int iRollP = d20();

    int iMarkUp = 0;
    int iMarkDown = 0;


    if (GetIsObjectValid(oStore) == TRUE)
    {
       if(GetLocalInt(oStore, "iInitialized") == 0){
         iTotal = GetStoreValue(oStore);
         SetLocalInt(oStore, "iTotal", iTotal);

         iAvailable = iTotal / 4;
         SetStoreGold(oStore, iAvailable);
         SetLocalInt(oStore, "iAvailable", iAvailable);

         iStoreDC = 14 + (iTotal/2000);
         if(iStoreDC > 45) iStoreDC = 45;
         SetLocalInt(oStore, "iStoreDC", iStoreDC);

         iMaxBuy = iAvailable / 5;
         SetStoreMaxBuyPrice(oStore, iMaxBuy);
         SetLocalInt(oStore, "iMaxBuy", iMaxBuy);

         SetLocalInt(oStore, "iMonth", iMonth);
         SetLocalInt(oStore, "iYear", iYear);

         SetLocalInt(oStore, "iInitialized", 1);
       }
       else{
         //SetLocalInt(oStore, "iTotal", GetStoreGold(oStore));
         iTotal = GetLocalInt(oStore, "iTotal");
         iStoreDC = GetLocalInt(oStore, "iStoreDC");
         iMaxBuy = GetLocalInt(oStore, "iMaxBuy");
         SetStoreMaxBuyPrice(oStore, iMaxBuy);

         iAvailable = GetStoreGold(oStore);
         if(iAvailable < (iTotal / 5)){
           //regenerate money
           if(iYear > GetLocalInt(oStore, "iYear")){
             iAvailable = iAvailable + (iYear - GetLocalInt(oStore, "iYear")) * iStoreDC * 10;
             iAvailable = iAvailable + (iMonth * iStoreDC);
           }
           else
             iAvailable = iAvailable + (iMonth - GetLocalInt(oStore, "iMonth")) * iStoreDC;

           if(iAvailable > (iTotal / 5)) iAvailable = iTotal / 5;

         }



       }
    //Check if Appraised within last Day, recheck if needed.
    if(GetLocalInt(oStore, GetName(oPC)) != GetCalendarDay()){
      SendMessageToPC(oPC, "Appraise: " + IntToString(iAppraise) + "+ " + IntToString(iRollA) + "= " + IntToString(iAppraise + iRollA) + "vs. DC " + IntToString(iStoreDC - iCHA));
      if( iAppraise + iRollA >= iStoreDC - iCHA ){
        SendMessageToPC(oPC, "Success!");
        iMarkUp = 0 - iAppraise + (2 *(iRollA - iStoreDC)) - 5;
        iMarkDown = iAppraise + (2 *(iRollA - iStoreDC)) + 5;



      }
      else{
        SendMessageToPC(oPC, "Failure!");
        SendMessageToPC(oPC, "Persuade: " + IntToString(iPersuade) + "+ " + IntToString(iRollP) + "= " + IntToString(iPersuade + iRollP) + "vs. DC " + IntToString(iStoreDC - 5 ));
        //Persuade check to prevent negative effects
        if( iPersuade + iRollP >= iStoreDC - 5 ){
          SendMessageToPC(oPC, "Success to avoid negative effects!");
          iMarkUp = -1;
          iMarkDown = -1;

        }
        else{
          SendMessageToPC(oPC, "Failure to avoid negative effects!");
          iMarkUp = 5;
          iMarkDown = -2;

        }

      }


     SendMessageToPC(oPC, "Persuade to up Max Buy Price: " + IntToString(iPersuade) + "+ " + IntToString(iRollP) + "= " + IntToString(iPersuade + iRollP) + "vs. DC " + IntToString(iStoreDC));
     if( iPersuade + iRollP >= iStoreDC ){
          SendMessageToPC(oPC, "Success for higher ceiling to max buy price!");
          SetStoreMaxBuyPrice(oStore, GetStoreMaxBuyPrice(oStore) * 2);

     }
     else
        SendMessageToPC(oPC, "Failure to up max buy price.");



      SetLocalInt(oStore, GetName(oPC), GetCalendarDay());
      SetLocalInt(oStore, GetName(oPC)+"up", iMarkUp);
      SetLocalInt(oStore, GetName(oPC)+"down", iMarkDown);
    }
    else{
      iMarkUp = GetLocalInt(oStore, GetName(oPC)+"up");
      iMarkDown = GetLocalInt(oStore, GetName(oPC)+"down");



    }
    if(iMarkUp < -20) iMarkUp = -30;
    if(iMarkDown > 20) iMarkDown = 30;




    SendMessageToPC(oPC, "MarkUp: " + IntToString(iMarkUp));
    SendMessageToPC(oPC, "MarkDown: " + IntToString(iMarkDown));
    SendMessageToPC(oPC, "MaxBuy: " + IntToString(GetStoreMaxBuyPrice(oStore)));
    SendMessageToPC(oPC, "Gold: " + IntToString(GetStoreGold(oStore)));



    OpenStore(oStore, oPC, iMarkUp, iMarkDown + 15);
    }
    else
        SendMessageToPC(oPC, "No store found.");
}


