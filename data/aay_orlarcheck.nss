//::///////////////////////////////////////////////
//:: FileName cmk_plumber_ci
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 6/9/2003 10:04:44 PM
//:://////////////////////////////////////////////
#include "nw_i0_tool"

int StartingConditional()
{

    // Make sure the PC speaker has these items in their inventory
    if(HasItem(GetPCSpeaker(), "sewernpoison"))
        return TRUE;
    if(HasItem(GetPCSpeaker(), "004_rn_btlshell"))
        return TRUE;
    if(HasItem(GetPCSpeaker(), "waspstinger"))
        return TRUE;
    if(HasItem(GetPCSpeaker(), "004antennae"))
        return TRUE;
    if(HasItem(GetPCSpeaker(), "004Spinarette"))
        return TRUE;
    if(HasItem(GetPCSpeaker(), "nw_it_msmlmisc25"))
        return TRUE;
    if(HasItem(GetPCSpeaker(), "scaladarstinger"))
        return TRUE;
    if(HasItem(GetPCSpeaker(), "004eyestalk"))
        return TRUE;
    if(HasItem(GetPCSpeaker(), "cu_reag212"))   //werewolf eye
        return TRUE;
    if(HasItem(GetPCSpeaker(), "necrovineroot"))   //necrovine root
        return TRUE;
    if(HasItem(GetPCSpeaker(), "vampdust"))   //vampire dust
        return TRUE;



    return FALSE;
}
