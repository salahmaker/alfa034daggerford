/* Made by LP
Purpus: These scripts got so long and grew tired of retyping the
same things over and over... I came up with this idea.

Was origionaly only going to handle dyeing prices... and expanded
from there.

Its a very simple layout. handles just about everything to do with
prices */
void HELM_DYE_PRICE(object oPC)
{
int itype = GetLocalInt (oPC, "MaterialToDye");

if (itype == ITEM_APPR_ARMOR_COLOR_LEATHER1)
{
SetLocalInt(oPC, "leather1_dye", 10);
}
else if (itype == ITEM_APPR_ARMOR_COLOR_LEATHER2)
{
SetLocalInt(oPC, "leather2_dye", 10);
}
else if (itype == ITEM_APPR_ARMOR_COLOR_CLOTH1)
{
SetLocalInt(oPC, "cloth1_dye", 2);
}
else if (itype == ITEM_APPR_ARMOR_COLOR_CLOTH2)
{
SetLocalInt(oPC, "cloth2_dye", 2);
}
else if (itype == ITEM_APPR_ARMOR_COLOR_METAL1)
{
SetLocalInt(oPC, "metal1_dye", 20);
}
else if (itype == ITEM_APPR_ARMOR_COLOR_METAL2)
{
SetLocalInt(oPC, "metal2_dye", 20);
}
}



void FIND_HELM_TOTAL(object oPC, object oHelmet)
{
int iCloth1, iCloth2, iLeather1, iLeather2, iMetal1, iMetal2;
iCloth1 = GetLocalInt(oPC, "cloth1_dye");
iCloth2 = GetLocalInt(oPC, "cloth2_dye");
iLeather1 = GetLocalInt(oPC, "leather1_dye");
iLeather2 = GetLocalInt(oPC, "leather2_dye");
iMetal1 = GetLocalInt(oPC, "metal1_dye");
iMetal2 = GetLocalInt(oPC, "metal2_dye");


int nPrice = GetGoldPieceValue(oHelmet);
float fPriceeq = (nPrice * 0.5);
int nfindNprice = FloatToInt(fPriceeq);

int Helm_total = (iCloth1 + iCloth2 + iLeather1 + iLeather2+ iMetal1 + iMetal2 + nfindNprice);
SetLocalInt(oPC, "price", Helm_total);
SetCustomToken(69100, IntToString(Helm_total));
}

void FIND_SHIELD_TOTAL(object oPC, object oShield, int nBackApp, int nCurrApp)
{
int nPrice = GetGoldPieceValue(oShield);
float fPriceeq = (nPrice * 0.5);
int nfindNprice = FloatToInt(fPriceeq);
if (nBackApp != nCurrApp)
{
SetLocalInt(oPC, "price", nfindNprice);
SetCustomToken(69100, IntToString(nfindNprice));
}
else
{
SetLocalInt(oPC, "price", 0);
SetCustomToken(69100, IntToString(0));
}
}
// Will return the total cost of oPC's oArmor modification.
void FIND_ARMOR_PRICE(object oPC, object oArmor)
{
int iToModify = GetLocalInt(oPC, "ToModify");
object oBackup = GetLocalObject(oPC,"alpha_backup");
int iNewApp = GetItemAppearance(oArmor, ITEM_APPR_TYPE_ARMOR_MODEL, iToModify);
int iOldApp = GetItemAppearance(oBackup, ITEM_APPR_TYPE_ARMOR_MODEL, iToModify);

if ((iToModify == ITEM_APPR_ARMOR_MODEL_BELT) &&  (iNewApp != iOldApp))
{
    float fArmorModCost = (GetGoldPieceValue(oArmor) * 0.01);
    SetLocalInt(oPC, "belt_cost", FloatToInt(fArmorModCost) );

}
else if ((iToModify == ITEM_APPR_ARMOR_MODEL_LBICEP) &&  (iNewApp != iOldApp))
  {
    float fArmorModCost = (GetGoldPieceValue(oArmor) * 0.01);
    SetLocalInt(oPC, "lbicep_cost", FloatToInt(fArmorModCost) );

}
else if ((iToModify == ITEM_APPR_ARMOR_MODEL_LFOOT) &&  (iNewApp != iOldApp))
   {
    float fArmorModCost = (GetGoldPieceValue(oArmor) * 0.01);
    SetLocalInt(oPC, "lfoot_cost", FloatToInt(fArmorModCost) );

}
else if ((iToModify == ITEM_APPR_ARMOR_MODEL_LFOREARM) &&  (iNewApp != iOldApp))
    {
    float fArmorModCost = (GetGoldPieceValue(oArmor) * 0.01);
    SetLocalInt(oPC, "lforearm_cost", FloatToInt(fArmorModCost) );

}
else if ((iToModify == ITEM_APPR_ARMOR_MODEL_LHAND) &&  (iNewApp != iOldApp))
    {
    float fArmorModCost = (GetGoldPieceValue(oArmor) * 0.01);
    SetLocalInt(oPC, "lhand_cost", FloatToInt(fArmorModCost) );

}
else if ((iToModify == ITEM_APPR_ARMOR_MODEL_LSHIN) &&  (iNewApp != iOldApp))
    {
    float fArmorModCost = (GetGoldPieceValue(oArmor) * 0.01);
    SetLocalInt(oPC, "lshin_cost", FloatToInt(fArmorModCost) );

}
else if ((iToModify == ITEM_APPR_ARMOR_MODEL_LSHOULDER) &&  (iNewApp != iOldApp))
 {
    float fArmorModCost = (GetGoldPieceValue(oArmor) * 0.01);
    SetLocalInt(oPC, "lshoulder_cost", FloatToInt(fArmorModCost) );

}
else if ((iToModify == ITEM_APPR_ARMOR_MODEL_LTHIGH) &&  (iNewApp != iOldApp))
 {
    float fArmorModCost = (GetGoldPieceValue(oArmor) * 0.01);
    SetLocalInt(oPC, "lthigh_cost", FloatToInt(fArmorModCost) );

}
else if ((iToModify == ITEM_APPR_ARMOR_MODEL_NECK) &&  (iNewApp != iOldApp))
{
    float fArmorModCost = (GetGoldPieceValue(oArmor) * 0.01);
    SetLocalInt(oPC, "neck_cost", FloatToInt(fArmorModCost) );

}
else if ((iToModify == ITEM_APPR_ARMOR_MODEL_PELVIS) &&  (iNewApp != iOldApp))
   {
    float fArmorModCost = (GetGoldPieceValue(oArmor) * 0.01);
    SetLocalInt(oPC, "pelvis_cost", FloatToInt(fArmorModCost) );

}
else if ((iToModify == ITEM_APPR_ARMOR_MODEL_RBICEP) &&  (iNewApp != iOldApp))
  {
    float fArmorModCost = (GetGoldPieceValue(oArmor) * 0.01);
    SetLocalInt(oPC, "rbicep_cost", FloatToInt(fArmorModCost) );

}
else if ((iToModify == ITEM_APPR_ARMOR_MODEL_RFOOT) &&  (iNewApp != iOldApp))
   {
    float fArmorModCost = (GetGoldPieceValue(oArmor) * 0.01);
    SetLocalInt(oPC, "rfoot_cost", FloatToInt(fArmorModCost) );

}
else if ((iToModify == ITEM_APPR_ARMOR_MODEL_RFOREARM) &&  (iNewApp != iOldApp))
   {
    float fArmorModCost = (GetGoldPieceValue(oArmor) * 0.01);
    SetLocalInt(oPC, "rforearm_cost", FloatToInt(fArmorModCost) );

}
else if ((iToModify == ITEM_APPR_ARMOR_MODEL_RHAND) &&  (iNewApp != iOldApp))
  {
    float fArmorModCost = (GetGoldPieceValue(oArmor) * 0.01);
    SetLocalInt(oPC, "rhand_cost", FloatToInt(fArmorModCost) );

}
else if ((iToModify == ITEM_APPR_ARMOR_MODEL_ROBE) &&  (iNewApp != iOldApp))
    {
    float fArmorModCost = (GetGoldPieceValue(oArmor) * 0.05);
    SetLocalInt(oPC, "robe_cost", FloatToInt(fArmorModCost) );

}
else if ((iToModify == ITEM_APPR_ARMOR_MODEL_RSHIN) &&  (iNewApp != iOldApp))
    {
    float fArmorModCost = (GetGoldPieceValue(oArmor) * 0.01);
    SetLocalInt(oPC, "rshin_cost", FloatToInt(fArmorModCost) );

}
else if ((iToModify == ITEM_APPR_ARMOR_MODEL_RSHOULDER) &&  (iNewApp != iOldApp))
    {
    float fArmorModCost = (GetGoldPieceValue(oArmor) * 0.01);
    SetLocalInt(oPC, "rshoulder_cost", FloatToInt(fArmorModCost) );

}
else if ((iToModify == ITEM_APPR_ARMOR_MODEL_RTHIGH) &&  (iNewApp != iOldApp))
    {
    float fArmorModCost = (GetGoldPieceValue(oArmor) * 0.01);
    SetLocalInt(oPC, "rthigh_cost", FloatToInt(fArmorModCost) );

}
else if ((iToModify == ITEM_APPR_ARMOR_MODEL_TORSO) &&  (iNewApp != iOldApp))
    {
    float fArmorModCost = (GetGoldPieceValue(oArmor) * 0.09);
    SetLocalInt(oPC, "torso_cost", FloatToInt(fArmorModCost) );
}
}

void FIND_ARMOR_TOTAL(object oPC)
{
int iBelt,iLbicep,iLfoot,ihand, ilshin, ilshoulder, ilthigh,
ipelvis,irbiecep, irfoot,irforearm, irhand, irobe, irshin,
 irsholder,irthigh, itorso;
iBelt = GetLocalInt(oPC,"belt_cost");
iLbicep = GetLocalInt(oPC,"lbicep_cost");
iLfoot = GetLocalInt(oPC,"lfoot_cost");
iLfoot = GetLocalInt(oPC,"lforearm_cost");
ihand = GetLocalInt(oPC,"lhand_cost");
ilshin = GetLocalInt(oPC,"lshin_cost");
ilshoulder = GetLocalInt(oPC,"lshoulder_cost");
ilthigh = GetLocalInt(oPC,"lthigh_cost");
ipelvis = GetLocalInt(oPC,"pelvis_cost");
irbiecep = GetLocalInt(oPC,"rbicep_cost");
irfoot = GetLocalInt(oPC,"rfoot_cost");
irforearm = GetLocalInt(oPC,"rforearm_cost");
irhand = GetLocalInt(oPC,"rhand_cost");
irobe = GetLocalInt(oPC,"robe_cost");
irshin = GetLocalInt(oPC,"rshin_cost");
irsholder = GetLocalInt(oPC,"rshoulder_cost");
irthigh = GetLocalInt(oPC,"rthigh_cost");
itorso = GetLocalInt(oPC,"torso_cost");

int iCloth1, iCloth2, iLeather1, iLeather2, iMetal1, iMetal2;
iCloth1 = GetLocalInt(oPC, "cloth1_dye");
iCloth2 = GetLocalInt(oPC, "cloth2_dye");
iLeather1 = GetLocalInt(oPC, "leather1_dye");
iLeather2 = GetLocalInt(oPC, "leather2_dye");
iMetal1 = GetLocalInt(oPC, "metal1_dye");
iMetal2 = GetLocalInt(oPC, "metal2_dye");

int Armor_total =(itorso + irthigh + irsholder + irshin + irobe +
irhand + irforearm + irfoot + irbiecep + ipelvis + ilthigh +
ilshoulder + ilshin +  ihand + iLfoot + iLbicep + iBelt + iCloth1 +
iCloth2 + iLeather1 + iLeather2 + iMetal1 + iMetal2);

SetLocalInt(oPC, "price", Armor_total);
SetCustomToken(69100, IntToString(Armor_total));
}
/* This was going to be used in conjuction with 'conditonals'
to figure out what type of armor the PC had... so they couldn't
modify armor passed there current AC. Sort of gave up on this,
but left it in just incase I decide to use it in the future.

void FIND_ARMOR_TORSO(object oPC, object oArmor)
{
int nCurrApp = GetItemAppearance(oArmor, ITEM_APPR_TYPE_ARMOR_MODEL, ITEM_APPR_ARMOR_MODEL_TORSO);
if ((nCurrApp >= 1) && (nCurrApp <= 13))
{
    SetLocalInt(oPC, "TorsoFilter", 0);
}
else if ((nCurrApp >= 14) && (nCurrApp <= 16))
{
    SetLocalInt(oPC, "TorsoFilter", 1);
}
else if ((nCurrApp >= 17) && (nCurrApp <= 23))
{
    SetLocalInt(oPC, "TorsoFilter", 2);
}
else if ((nCurrApp >= 24) && (nCurrApp <= 27))
{
    SetLocalInt(oPC, "TorsoFilter", 3);
}
else if ((nCurrApp >= 28) && (nCurrApp <= 35))
{
    SetLocalInt(oPC, "TorsoFilter", 4);
}
else if ((nCurrApp >= 36) && (nCurrApp <= 40))
{
    SetLocalInt(oPC, "TorsoFilter", 5);
}
else if ((nCurrApp >= 41) && (nCurrApp <= 45))
{
    SetLocalInt(oPC, "TorsoFilter", 6);
}
else if ((nCurrApp >= 46) && (nCurrApp <= 50))
{
    SetLocalInt(oPC, "TorsoFilter", 7);
}
else if ((nCurrApp >= 51) && (nCurrApp <= 55))
{
    SetLocalInt(oPC, "TorsoFilter", 8);
}
}
*/
void WEAPON_COST(object oPC, object oItem, int nPart)
{
 if (nPart = ITEM_APPR_WEAPON_MODEL_TOP)
 {
int nPrice = GetGoldPieceValue(oItem);
float fPriceeq = (nPrice * 0.06);
int nfindNprice = FloatToInt(fPriceeq);
SetLocalInt(oPC, "wmodel_top", nfindNprice);
}
else if (nPart = ITEM_APPR_WEAPON_MODEL_MIDDLE)
 {
int nPrice = GetGoldPieceValue(oItem);
float fPriceeq = (nPrice * 0.06);
int nfindNprice = FloatToInt(fPriceeq);
SetLocalInt(oPC, "wmodel_middle", nfindNprice);
}
else if (nPart = ITEM_APPR_WEAPON_MODEL_BOTTOM)
 {
int nPrice = GetGoldPieceValue(oItem);
float fPriceeq = (nPrice * 0.06);
int nfindNprice = FloatToInt(fPriceeq);
SetLocalInt(oPC, "wmodel_bottom", nfindNprice);
}
else if (nPart = ITEM_APPR_WEAPON_COLOR_TOP)
 {
int nPrice = GetGoldPieceValue(oItem);
float fPriceeq = (nPrice * 0.06);
int nfindNprice = FloatToInt(fPriceeq);
SetLocalInt(oPC, "wcolor_top", nfindNprice);
}
else if (nPart = ITEM_APPR_WEAPON_COLOR_MIDDLE)
 {
int nPrice = GetGoldPieceValue(oItem);
float fPriceeq = (nPrice * 0.06);
int nfindNprice = FloatToInt(fPriceeq);
SetLocalInt(oPC, "wcolor_middle", nfindNprice);
}
else if (nPart = ITEM_APPR_WEAPON_COLOR_BOTTOM)
 {
int nPrice = GetGoldPieceValue(oItem);
float fPriceeq = (nPrice * 0.06);
int nfindNprice = FloatToInt(fPriceeq);
SetLocalInt(oPC, "wcolor_bottom", nfindNprice);
}
}

void FIND_WEAPON_TOTAL(object oPC)
{
int tmodel, mmodel,bmodel,tcolor,mcolor,bcolor,nTotal;

tmodel = GetLocalInt(oPC, "wmodel_top");
mmodel = GetLocalInt(oPC, "wmodel_middle");
bmodel = GetLocalInt(oPC, "wmodel_bottom");
tcolor = GetLocalInt(oPC, "wcolor_top");
mcolor = GetLocalInt(oPC, "wcolor_middle");
bcolor = GetLocalInt(oPC, "wcolor_bottom");

nTotal = (tmodel + mmodel + bmodel + tcolor + mcolor + bcolor);

SetLocalInt(oPC, "price", nTotal);
SetCustomToken(69100, IntToString(nTotal));
}
