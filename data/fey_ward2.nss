void main()
{
   object oEnter = GetEnteringObject();
    SpeakString("This keep has been warded against all elves and fey intruders!");

if(GetItemPossessedBy(oEnter, "CarolinasChain") == OBJECT_INVALID){
    if ((GetRacialType(oEnter) == RACIAL_TYPE_ELF) ||
        (GetRacialType(oEnter) == RACIAL_TYPE_DWARF) ||
        (GetRacialType(oEnter) == RACIAL_TYPE_GNOME) ||
        (GetRacialType(oEnter) == RACIAL_TYPE_HALFELF) ||
        (GetRacialType(oEnter) == RACIAL_TYPE_HALFLING) ||
        (GetRacialType(oEnter) == RACIAL_TYPE_HALFORC) ||
        (GetRacialType(oEnter) == RACIAL_TYPE_HUMAN)){
       int nDamageAmmount = d20(4);
       effect eEffectDamage = EffectDamage(nDamageAmmount, DAMAGE_TYPE_NEGATIVE, DAMAGE_POWER_NORMAL);
       ApplyEffectToObject(DURATION_TYPE_INSTANT, eEffectDamage, oEnter, 1.0f);

    }
    if ((GetRacialType(oEnter) == RACIAL_TYPE_ELF) ||
        (GetRacialType(oEnter) == RACIAL_TYPE_HALFELF)){
       object oTarget = GetWaypointByTag( "fey_wp2" );
       location lTargLoc =  GetLocation(oTarget);
       int nNumMons = d4(1);
       int i;
       string creaturetype = "willowisp004";
       for (i=0;i<nNumMons;i++) {
          object oCreated = CreateObject( OBJECT_TYPE_CREATURE, creaturetype, lTargLoc, FALSE);
       }
    }
   }

}
