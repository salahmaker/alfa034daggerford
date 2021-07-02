//::///////////////////////////////////////////////
//:: Custom OnEnter
//:: FileName angel_sidi_ck
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
// Verfifies that PC is set to Sidicious bounty hunter quest
*/
#include "SOS_include"
#include "spawn_main"

void main()
{
     object oEntering = GetEnteringObject();

     // make sure its a PC
     if (GetIsPC(GetEnteringObject()))
     {
          // Spawn Sidicious if PC is on the Bounty Hunter quest
           if(SOS_GetPersistentInt(GetEnteringObject(), "sidicious_level_1") == 1)
           {
               Spawn();
           }
     }
}


