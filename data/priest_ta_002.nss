/*
    Determine what church the speaker works for
    to use in a custom token.
    Check if speaker is of the same church
*/
int StartingConditional()
{
    SetCustomToken( 11001, GetDeity( OBJECT_SELF ) );
    return GetStringLowerCase(GetDeity( OBJECT_SELF )) == GetStringLowerCase(GetDeity( GetPCSpeaker() ));
}

