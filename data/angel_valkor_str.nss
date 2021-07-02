//::///////////////////////////////////////////////
//:: FileName angel_valkor_str
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Angel_Caller
//:://////////////////////////////////////////////
//:  This is the store for the Diamond Knight Tavern
void main()
{

    // Either open the store with that tag or let the user know that no store exists.
    object oStore = GetNearestObjectByTag("DiamondKnightTavern");
    if(GetObjectType(oStore) == OBJECT_TYPE_STORE)
        OpenStore(oStore, GetPCSpeaker());
    else
        ActionSpeakStringByStrRef(53090, TALKVOLUME_TALK);
}
