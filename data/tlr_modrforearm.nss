
void main()
{
    object oPC = GetPCSpeaker();
    SetLocalInt(oPC, "ToModify", ITEM_APPR_ARMOR_MODEL_RFOREARM);
    SetLocalString(oPC, "2DAFile", "parts_forearm");
}
