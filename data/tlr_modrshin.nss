void main()
{
    object oPC = GetPCSpeaker();
    SetLocalInt(oPC, "ToModify", ITEM_APPR_ARMOR_MODEL_RSHIN);
    SetLocalString(oPC, "2DAFile", "parts_shin");
}
