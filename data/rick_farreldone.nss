#include "SOS_include"

int StartingConditional()
{
    // Inspect local variables
    if(SOS_GetPersistentInt(GetPCSpeaker(), "farrel_quest_level_1") == 2)
        return TRUE;

    return FALSE;
}

