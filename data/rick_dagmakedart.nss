#include "sos_include"

void main()
{
    object oPC = GetLastAttacker(OBJECT_SELF);
    float fDistance = 0.2 * GetDistanceBetween(OBJECT_SELF,oPC);
    int iDistance = FloatToInt(fDistance);
    int iRandom = Random(49)+1;
    int iDex = GetAbilityModifier(ABILITY_DEXTERITY, oPC);
    int iScore = iDex + iRandom - iDistance;
    object oWeapon = GetLastWeaponUsed(oPC);
    string sWeapon = GetTag(oWeapon);

    int iHiscore = SOS_GetPersistentInt(oPC,"hiscore");
    int iTot = GetLocalInt(OBJECT_SELF,"iscore");
    int iThrows = GetLocalInt(OBJECT_SELF,"ithrows");
    string sScore;
    string sTot;

    iThrows = iThrows + 1;

    if(sWeapon == "BlueFeatherDarts")
    {
       SpeakString("The Blue Feather dart sails through the air spinning rapidly towards the target.");
       iScore = iScore + 6;
       if(iThrows >= 3)
          CreateItemOnObject("BlueFeatherDarts", oPC);
    }
    else if (sWeapon == "RedDragonDarts")
    {
       SpeakString("The Red Dragon Feather dart sails through the air spinning rapidly towards the target.");
       iScore = iScore + 4;
       if(iThrows >= 3)
          CreateItemOnObject("RedDragonDarts", oPC);
    }
    else if (sWeapon == "RufBlackFeatherdarts")
    {
       SpeakString("The Ruffled Black Feather dart flies through the air twisting and twirling uncontrollably towards the target.");
       iScore = iScore - 6;
       if(iThrows >= 3)
          CreateItemOnObject("RufBlackFeatherdarts", oPC);
    }
    else if (sWeapon == "RufGrayFeatherdarts")
    {
       SpeakString("The Ruffled Gray Feather dart flies through the air twisting and twirling uncontrollably towards the target.");
       iScore = iScore - 4;
       if(iThrows >= 3)
          CreateItemOnObject("RufGrayFeatherdarts", oPC);
    }
    else if (sWeapon == "BlackFeatherdarts")
    {
       SpeakString("The Black Feather dart flies through the air spinning towards the target.");
          iScore = iScore + 1;
       if(iThrows >= 3)
          CreateItemOnObject("BlackFeatherdarts", oPC);
    }
    else if (sWeapon == "GrayFeatherdarts")
    {
       SpeakString("The Gray Feather dart flies through the air towards the target.");
       if(iThrows >= 3)
          CreateItemOnObject("GrayFeatherdarts", oPC);
    }
    else
    {
       SpeakString("The White Feather dart sails through the air towards the target.");
       iScore = iScore + 2;
       if(iThrows >= 3)
          CreateItemOnObject("WhiteFeatherdarts", oPC);
    }

    if(iScore >= 50)
        iScore = 50;

    if(iScore <= 0)
        iScore = 0;

    if(iScore == 50)
       SpeakString("BullsEye! 50 points!");
    else if (iScore == 0)
       SpeakString("Missed the dart board completely!");
    else
    {
       sScore = IntToString(iScore);
       SpeakString(sScore + " points!");
    }

    iTot = iTot + iScore;
    sTot = IntToString(iTot);

    if(iThrows >= 3)
    {
       SpeakString("A total score of " + sTot + " points.");
       iThrows = 0;
       iTot = 0;
   }

   SetLocalInt(OBJECT_SELF,"iscore",iTot);
   SetLocalInt(OBJECT_SELF,"ithrows",iThrows);

}
