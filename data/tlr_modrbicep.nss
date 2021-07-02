void main()
{
    object oPC = GetPCSpeaker();
    SetLocalInt(oPC, "ToModify", ITEM_APPR_ARMOR_MODEL_RBICEP);
    SetLocalString(oPC, "2DAFile", "parts_bicep");
}
