void main()
{
   object oEnter = GetEnteringObject();
   //SpeakString("You breath in ");
   int nDamageAmmount = d4(3);
   effect eEffectDamage = EffectDamage(nDamageAmmount, DAMAGE_TYPE_ACID, DAMAGE_POWER_NORMAL);

   if(GetIsPC(oEnter)){
      ApplyEffectToObject(DURATION_TYPE_INSTANT, eEffectDamage, oEnter, 1.0f);
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
