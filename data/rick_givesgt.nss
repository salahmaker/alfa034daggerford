//::///////////////////////////////////////////////
//:: FileName rick_givepatrolman
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 2/5/2003 10:10:53 PM
//:://////////////////////////////////////////////

#include "nw_i0_tool"
#include "sos_include"
#include "subraces"

void main()
{
    // tunic
    CreateItemOnObject("dagmilserarm001", GetPCSpeaker(), 1);
    // helmet
    CreateItemOnObject("daggerfordmil002", GetPCSpeaker(), 1);
    // badge
    CreateItemOnObject("daggerfordmil019", GetPCSpeaker(), 1);

    SOS_SetPersistentInt(GetPCSpeaker(),"rick_new_member",1);


}
