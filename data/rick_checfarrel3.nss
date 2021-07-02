#include "SOS_include"

int StartingConditional()
{
    // Inspect local variables
    if((SOS_GetPersistentInt(GetPCSpeaker(), "farrel_quest_level_1") == 1)
    && (GetItemPossessedBy(GetPCSpeaker(), "golddye") != OBJECT_INVALID))
       return TRUE;

    return FALSE;
}

