//::///////////////////////////////////////////////
//:: FileName angel_ptharl_str
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Angel_Caller
//:://////////////////////////////////////////////
//:  This is the real merchandise being sold to the Thieves' Brotherhood Apprentices.
void main()
{

    // Either open the store with that tag or let the user know that no store exists.
    object oStore = GetNearestObjectByTag("PathanoRealMerchandise");
    if(GetObjectType(oStore) == OBJECT_TYPE_STORE)
        OpenStore(oStore, GetPCSpeaker());
    else
        ActionSpeakStringByStrRef(53090, TALKVOLUME_TALK);
}
