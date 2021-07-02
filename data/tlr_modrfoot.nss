
void main()
{
    object oPC = GetPCSpeaker();
    SetLocalInt(oPC, "ToModify", ITEM_APPR_ARMOR_MODEL_RFOOT);
    SetLocalString(oPC, "2DAFile", "parts_foot");
}
