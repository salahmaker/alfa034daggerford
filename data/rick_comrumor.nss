void main()
{
      object oPC = GetLastSpeaker();
      string sRumor;

      switch ( Random ( 12 ) )
      {
         case 0: sRumor = "rick_rumor_1"; break;
         case 1: sRumor = "rick_rumor_2"; break;
         case 2: sRumor = "rick_rumor_3"; break;
         case 3: sRumor = "rick_rumor_4"; break;
         case 4: sRumor = "rick_rumor_5"; break;
         case 5: sRumor = "rick_rumor_6"; break;
         case 6: sRumor = "rick_rumor_7"; break;
         case 7: sRumor = "rick_rumor_8"; break;
         case 8: sRumor = "rick_rumor_9"; break;
         case 9: sRumor = "rick_rumor_10"; break;
         case 10: sRumor = "rick_rumor_11"; break;
         case 11: sRumor = "rick_rumor_12"; break;
      }
      ActionStartConversation(oPC, sRumor);
}
