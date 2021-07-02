//::///////////////////////////////////////////////
//:: FileName cmk_gohostile
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 2/12/2003 1:52:00 AM
//:://////////////////////////////////////////////
#include "nw_i0_generic"

void main()
{

    // Set the faction to hate the player, then attack the player
    //ChangeFaction(OBJECT_SELF,GetObjectByTag("faction_enemyofthestate"));
    // Instead, change the faction to hostile so guards can assist victim
    ChangeToStandardFaction (OBJECT_SELF, STANDARD_FACTION_HOSTILE);
    //SetIsTemporaryEnemy(OBJECT_SELF,GetPCSpeaker());
    //SetIsTemporaryEnemy(GetPCSpeaker(),OBJECT_SELF);
    ActionAttack(GetPCSpeaker());
    DetermineCombatRound(GetPCSpeaker());

}
