/*
    Determine what church the speaker works for
    to use in a custom token.
*/
int StartingConditional()
{
    SetCustomToken( 11001, GetDeity( OBJECT_SELF ) );
    return TRUE;
}
