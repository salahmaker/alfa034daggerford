/*
     Check if the priest will refuse to help with spells
*/

#include "PRIEST"

int StartingConditional()
{
    object oSpeaker = GetPCSpeaker();
    return Priest_IsEnemy( oSpeaker );
}
