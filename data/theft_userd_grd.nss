//::///////////////////////////////////////////////
//:: Custom User Defined Event
//:: FileName
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*

*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////

#include "NW_I0_GENERIC"
#include "theft_functions"

void main()
{
    int nUser = GetUserDefinedEventNumber();

    if(nUser == 1001) //HEARTBEAT
    {

    }
    else if(nUser == 1003) // END OF COMBAT
    {

    }
    else if(nUser == 1004) // ON DIALOGUE
    {
         if(GetIsInCombat(OBJECT_SELF))
             return;

         object oSpeaker=GetLastSpeaker();

         if(GetListenPatternNumber() == 2000)
         {
            if(!GetIsInCombat(OBJECT_SELF) && !GetIsPC(oSpeaker))
            {
                SpeakString("HALT!");
                SetIsTemporaryEnemy(oSpeaker,OBJECT_SELF);
                SetIsTemporaryEnemy(OBJECT_SELF,oSpeaker);
                ActionAttack(oSpeaker);
            }
         }
         if(GetListenPatternNumber() == 1000)
         {
             if(!GetIsPC(oSpeaker))
             {
                object oThief;

                if((oThief = GetLocalObject(oSpeaker,"THIEF"))!= OBJECT_INVALID)
                {
                    SetLocalObject(OBJECT_SELF,"THIEF",oThief);
                    SetIsTemporaryEnemy(oThief);
                    ActionAttack(oThief);
                    DetermineCombatRound(oThief);
                }
             }
         }
    }
    else if(nUser == 1005) // ATTACKED
    {

    }
    else if(nUser == 1006) // DAMAGED
    {

    }
    else if(nUser == 1007) // DEATH
    {

    }
    else if(nUser == 1008) // DISTURBED
    {

    }
    else if(nUser == 5000)
    {
          SetListenPattern(OBJECT_SELF,GUARD_ALERT, 1000);
          SetListenPattern(OBJECT_SELF,"GUARDSKILLME",2000);
          SetListening(OBJECT_SELF,TRUE);
    }

}

