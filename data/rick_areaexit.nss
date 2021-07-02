void main()
{
   object oPC = GetEnteringObject();

   if(GetIsPC(oPC))
   {
      SetLocalInt(oPC,"rick_no_sleep_flag",FALSE);
   }

}
