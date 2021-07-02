void main()
{
   object oEnter = GetEnteringObject();
   if(GetIsPC(oEnter)){
      if (GetPCPlayerName(oEnter) == "ArmorAll"){
         GiveXPToCreature(oEnter, 2000);
       }
   }
}



