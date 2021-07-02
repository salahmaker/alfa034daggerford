//::///////////////////////////////////////////////
//:: FileName angel_pthafk_str
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Angel_Caller
//:://////////////////////////////////////////////
//:  This is the fake merchandise being sold to hide the merchants true purpose.
void main()
{

    // Either open the store with that tag or let the user know that no store exists.
    object oStore = GetNearestObjectByTag("PathanoFakeMerchandise");
    if(GetObjectType(oStore) == OBJECT_TYPE_STORE)
        OpenStore(oStore, GetPCSpeaker());
    else
        ActionSpeakStringByStrRef(53090, TALKVOLUME_TALK);
}
