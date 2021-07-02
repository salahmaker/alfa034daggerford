void main()
{
   object oEnter = GetEnteringObject();
   //SpeakString("You breath in ");
  //int nDamageAmmount = d4(3);
  // effect eEffectDamage = EffectDamage(nDamageAmmount, DAMAGE_TYPE_NEGATIVE, DAMAGE_POWER_NORMAL);

   if(GetIsPC(oEnter)){
      //ApplyEffectToObject(DURATION_TYPE_INSTANT, eEffectDamage, oEnter, 1.0f);


       object oTarget = GetWaypointByTag( "ali_wp1" );
       location lTargLoc =  GetLocation(oTarget);

       object oTarget2 = GetWaypointByTag( "tur_wp1" );
       location lTargLoc2 =  GetLocation(oTarget2);

       int NumTur = d3() - 1;
       int NumAli = d3() - 1;

       SpeakString("Somethings crawls out of the water!");


       string ali = "gator01";
       string tur =  "snaptur";
       int i = 0;
       int i2 = 0;

       for (i=0;i<NumTur;i++) {
          object oCreated = CreateObject( OBJECT_TYPE_CREATURE, tur, lTargLoc, FALSE);

       }
        for (i2 = 0;i2<NumAli;i2++) {
          object oCreated2 = CreateObject( OBJECT_TYPE_CREATURE, ali, lTargLoc2, FALSE);
       }
   }
   /*
      }
      if ((GetRacialType(oEnter) == RACIAL_TYPE_ELF) ||
         (GetRacialType(oEnter) == RACIAL_TYPE_HALFELF)){
          object oTarget = GetWaypointByTag( "fey_wp1" );
          location lTargLoc =  GetLocation(oTarget);
          int nNumMons = d4(1);
          int i;
          string creaturetype = "willowisp003";
          for (i=0;i<nNumMons;i++) {
             object oCreated = CreateObject( OBJECT_TYPE_CREATURE, creaturetype, lTargLoc, FALSE);
          }
      }
   } */

}
