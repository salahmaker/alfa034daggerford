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
    string sCreature = "mg_necrovine";
    int i = d4( );
    int j = 0;
    int creaturetype = 0;
    location lLoc;

    for(j=0;j<=i;j++){

      creaturetype = Random(100);

      if (creaturetype < 70) sCreature = "mg_necrovine";

    // * 10% chance of a dire rat
      if (creaturetype > 95)
      {
        sCreature = "mg_deathshriek";
      }
      lLoc = GetLocation(OBJECT_SELF);
      ActionCreate(sCreature, lLoc);
    }
    eMind = EffectVisualEffect(VFX_DUR_ENTANGLE);
    ApplyEffectAtLocation(DURATION_TYPE_TEMPORARY, eMind, lLoc, 2.0);
    //SetPlotFlag(OBJECT_SELF, FALSE);
    //DestroyObject(OBJECT_SELF, 0.5);



}
