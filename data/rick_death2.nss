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
        int nItemChance = Random(100) + 1;

        if (nItemChance > 95 && nItemChance < 99 )
        {
             CreateItemOnObject("silverweddingban", OBJECT_SELF);

        }

        if (nItemChance > 50 && nItemChance < 71  )
        {
             CreateItemOnObject("oldnoblefamil001", OBJECT_SELF);
        }

        if (nItemChance > 20 && nItemChance < 41  )
        {
             CreateItemOnObject("oldnoblefamilysi", OBJECT_SELF);
        }
        if (nItemChance > 98 )
        {
             CreateItemOnObject("goldweddingba001", OBJECT_SELF);
        }



    ExecuteScript("nw_c2_default7", OBJECT_SELF);
}
