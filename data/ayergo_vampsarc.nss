//::///////////////////////////////////////////////
//:: NW_O2_SKELETON.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
   Makes the trap summon monsters

*/
//:://////////////////////////////////////////////
//:: Created By:   Ayergo
//:: Created On:   October 9 2016
//:://////////////////////////////////////////////
void ActionCreate(string sCreature, location lLoc)
{
    CreateObject(OBJECT_TYPE_CREATURE, sCreature, lLoc);
}
void main()
{

    effect eMind;
    string sCreature = "fledgelingvampir";
    int i = d3( );
    int j = 0;
    int creaturetype = 0;
    location lLoc;

    if(d100() > 80) sCreature = "rn_mummy_01";


      lLoc = GetLocation(GetNearestObjectByTag("alfa_sarcophgus1"));
      ActionCreate(sCreature, lLoc);

    eMind = EffectVisualEffect(VFX_DUR_SMOKE);
    ApplyEffectAtLocation(DURATION_TYPE_TEMPORARY, eMind, lLoc, 2.0);




}
