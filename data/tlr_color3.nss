#include "alpha_dye_price"
void main()
{
    object oPC = GetPCSpeaker();
    SetLocalInt(oPC, "ColorToDye", 3);

    ExecuteScript("tlr_dyeitem", oPC);
    HELM_DYE_PRICE(oPC);
}
