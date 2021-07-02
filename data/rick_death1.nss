//::///////////////////////////////////////////////
//:: Name x2_def_ondeath
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Default OnDeath script
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: June 11/03
//:://////////////////////////////////////////////

void main()
{


      int nStack = Random(20) + 1;
      CreateItemOnObject("nw_it_gold001", OBJECT_SELF, nStack);



        int nItemChance = Random(100) + 1;

        if (nItemChance > 98 )
        {
             CreateItemOnObject("duergaraxe003", OBJECT_SELF);

        }

        if (nItemChance > 96 && nItemChance < 99  )
        {
             CreateItemOnObject("duergarshield002", OBJECT_SELF);
        }

        if (nItemChance > 94 && nItemChance < 97  )
        {
             CreateItemOnObject("duergarhelm002", OBJECT_SELF);
        }
        if (nItemChance > 91 && nItemChance < 95  )
        {
             CreateItemOnObject("duergaraxe002", OBJECT_SELF);
        }

         if (nItemChance > 80 && nItemChance < 92  )
        {
             CreateItemOnObject("duergaraxe01", OBJECT_SELF);
        }

        if (nItemChance > 70 && nItemChance < 81  )
        {
             CreateItemOnObject("duergarhelm01", OBJECT_SELF);
        }

        if (nItemChance > 60 && nItemChance < 71  )
        {
             CreateItemOnObject("duergarshield01", OBJECT_SELF);
        }

        // ore
        if (nItemChance > 50 && nItemChance < 61  )
        {
             CreateItemOnObject("duergarshield01", OBJECT_SELF);
        }
        if (nItemChance > 40 && nItemChance < 51  )
        {
             CreateItemOnObject("ironoresmall002", OBJECT_SELF);
        }
        if (nItemChance > 30 && nItemChance < 41  )
        {
             CreateItemOnObject("ironoresmall001", OBJECT_SELF);
        }

        if (nItemChance < 29  )
        {
             CreateItemOnObject("ironoresmall", OBJECT_SELF);
        }


    ExecuteScript("nw_c2_default7", OBJECT_SELF);
}
