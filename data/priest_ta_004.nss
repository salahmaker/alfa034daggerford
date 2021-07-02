/*
    No aide for pagans
*/

int StartingConditional()
{
    if ( GetDeity( GetPCSpeaker() ) == "" ) return TRUE;
    return FALSE;
}
