#include "SOS_include"

int StartingConditional()
{
    // Inspect local variables
    if(SOS_GetPersistentInt(GetPCSpeaker(), "felix_level_1") == 2)
        return TRUE;

    return FALSE;
}
