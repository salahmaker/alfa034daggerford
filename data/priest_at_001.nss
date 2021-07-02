/*
    Set custom tokens for prices
*/

#include "PRIEST"

void main()
{
    int iToken = 11002;
    int iCount;
    int iPrice;
    int iCaster = GetLevelByClass( CLASS_TYPE_CLERIC );
    int iDiscount = ( Priest_IsAlly( GetPCSpeaker() ) );

    for ( iCount = 1; iCount <= 5; iCount++ )
    {
        iPrice = Priest_ComputeCost( iCount, iDiscount );

        SetCustomToken( iToken, IntToString ( iPrice ) );

        iToken++;
    }

    //Raise Cost
    iPrice = Priest_ComputeCost( 5, iDiscount );
    iPrice = FloatToInt((iPrice + 500) *1.5f); //material component addition
    SetCustomToken(11006, IntToString(iPrice));

    //Heal Cost
    iPrice = Priest_ComputeCost( 6, iDiscount );
    SetCustomToken(11007, IntToString(iPrice));

    //Resurrection Cost
    iPrice = Priest_ComputeCost( 7, iDiscount );
    iPrice = FloatToInt((iPrice + 500) *1.5f); //material component addition
    SetCustomToken(11008, IntToString(iPrice));

    //Restoration Cost
    iPrice = Priest_ComputeCost( 4, iDiscount );
    iPrice = iPrice + 100; //material component addition
    SetCustomToken(11009, IntToString(iPrice));
}


