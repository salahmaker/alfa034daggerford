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
    if(CreateObject(OBJECT_TYPE_CREATURE, sCreature, lLoc) == OBJECT_INVALID) SpeakString("Not spawning correctly");

}
void main()
{

    effect eMind;
    string sCreature = "rn_imp";
    int i = Random(3) + 1;
    int j = 0;
    int creaturetype = 0;
    location lLoc;





    if( GetXP(GetLastDamager()) > 45000) i = i+2;

    SpeakString("The portal whirls and hisses as it is struck");

    for(j=0;j<=i;j++){

      creaturetype = Random(100);

      if( GetXP(GetLastDamager()) > 45000){
        if(creaturetype < 40) sCreature = "ay_frozenwat001";
        else if(creaturetype >= 40 && creaturetype < 45) sCreature = "ay_icemephit";
        else if(creaturetype >= 45 && creaturetype < 55) sCreature = "rn_mephit_08";   //water mephit
        else if(creaturetype >= 55 && creaturetype < 65) sCreature = "ay_frozenwat";   //water elemental
        else if(creaturetype >= 65 && creaturetype < 75) sCreature = "rn_mephit_09";   //salt mephit
        else if(creaturetype >= 75 && creaturetype < 85) sCreature = "ay_icedemon";   //vrock  halffiend
        else if(creaturetype >= 85 && creaturetype < 100) sCreature = "vrock";

      }
      else{

        if(creaturetype < 40) sCreature = "ay_icemephit";
        else if(creaturetype >= 40 && creaturetype < 50) sCreature = "rn_imp";
        else if(creaturetype >= 50 && creaturetype < 70) sCreature = "ay_icemephit";   //ice mephit
        else if(creaturetype >= 70 && creaturetype < 80) sCreature = "rn_mephit_08";   //water mephit
        else if(creaturetype >= 80 && creaturetype < 90) sCreature = "rn_mephit_09";   //salt mephit
        else if(creaturetype >= 90 && creaturetype < 97) sCreature = "ay_frozenwat";   //dust mephit
        else if(creaturetype >= 97 && creaturetype < 100) sCreature = "ay_frozenwat001";

      }
      lLoc = GetLocation(OBJECT_SELF);
      ActionCreate(sCreature, lLoc);
    }
    eMind = EffectVisualEffect(VFX_IMP_FLAME_M);
    //ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eMind, lLoc, 0.0);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eMind, OBJECT_SELF);
    //SetPlotFlag(OBJECT_SELF, FALSE);
    //DestroyObject(OBJECT_SELF, 0.5);



}
