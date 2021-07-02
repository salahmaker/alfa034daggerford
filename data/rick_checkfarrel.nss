#include "SOS_include"

int StartingConditional()
{
    // Inspect local variables
    if(SOS_GetPersistentInt(GetPCSpeaker(), "farrel_quest_level_1") == 0)
        return TRUE;

    return FALSE;
}

