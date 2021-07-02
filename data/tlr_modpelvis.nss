void main()
{
 object oPC = GetPCSpeaker();
    SetLocalInt(oPC, "ToModify", ITEM_APPR_ARMOR_MODEL_PELVIS);
    SetLocalString(oPC, "2DAFile", "parts_pelvis");
}
