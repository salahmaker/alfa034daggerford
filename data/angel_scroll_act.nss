//::///////////////////////////////////////////////
//:: FileName angel_scroll_act
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 3/1/2006 9:47:01 PM
//:://////////////////////////////////////////////
void main()
{

    // Either open the store with that tag or let the user know that no store exists.
    object oStore = GetNearestObjectByTag("angel_scrollstr");
    if(GetObjectType(oStore) == OBJECT_TYPE_STORE)
        OpenStore(oStore, GetLastUsedBy());
    else
        ActionSpeakStringByStrRef(53090, TALKVOLUME_TALK);
}
