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
    string sCreature = "vampire001";
    int i = d8( );
    int j = d8( );
    int creaturetype = 0;
    location lLoc;

    for(j=0;j<=i;j++){

      creaturetype = Random(100);

      if (creaturetype < 90) sCreature = "ragezombie1";

    // * 10% chance of a dire rat
      if (creaturetype > 90)
      {
        sCreature = "vampire001";
      }
      lLoc = GetLocation(GetNearestObjectByTag("sarcophagus2"));
      ActionCreate(sCreature, lLoc);
    }

      lLoc = GetLocation(GetNearestObjectByTag("sarcophagus2"));
      ActionCreate(sCreature, lLoc);

    eMind = EffectVisualEffect(VFX_DUR_SMOKE);
    ApplyEffectAtLocation(DURATION_TYPE_TEMPORARY, eMind, lLoc, 2.0);




}
