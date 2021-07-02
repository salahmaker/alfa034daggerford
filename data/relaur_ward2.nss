void main()
{
   object oEnter = GetEnteringObject();
  //SpeakString("This keep has been warded against all elves and fey intruders!");

   int nDamageAmmount = d4(3);
   effect eEffectDamage = EffectDamage(nDamageAmmount, DAMAGE_TYPE_NEGATIVE, DAMAGE_POWER_NORMAL);
   ApplyEffectToObject(DURATION_TYPE_INSTANT, eEffectDamage, oEnter, 1.0f);
   object oTarget = GetWaypointByTag( "rel_wp2" );
   location lTargLoc =  GetLocation(oTarget);
   int nNumMons = d4(1);
   int i;
   string creaturetype = "beholder006";
   string creaturetype2 = "beholder007";

   if ((GetRacialType(oEnter) == RACIAL_TYPE_ELF) ||
         (GetRacialType(oEnter) == RACIAL_TYPE_DWARF) ||
         (GetRacialType(oEnter) == RACIAL_TYPE_GNOME) ||
         (GetRacialType(oEnter) == RACIAL_TYPE_HALFELF) ||
         (GetRacialType(oEnter) == RACIAL_TYPE_HALFLING) ||
         (GetRacialType(oEnter) == RACIAL_TYPE_HALFORC) ||
         (GetRacialType(oEnter) == RACIAL_TYPE_HUMAN) ||
         (GetIsDM(oEnter))){

      for (i=0;i<nNumMons;i++) {
         object oCreated = CreateObject( OBJECT_TYPE_CREATURE, creaturetype, lTargLoc, FALSE);
         object oCreated2 = CreateObject( OBJECT_TYPE_CREATURE, creaturetype2, lTargLoc, FALSE);
      }
   }
}
