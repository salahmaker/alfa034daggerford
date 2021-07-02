//::///////////////////////////////////////////////
//:: Custom OnEnter
//:: FileName angel_felix_ck
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
// Verfifies that PC is set to Felix bounty hunter quest
*/
#include "SOS_include"
#include "spawn_main"

void main()
{

     // make sure its a PC
     if (GetIsPC(GetEnteringObject()))
     {
          // Spawn Felix if PC is on the Bounty Hunter quest
           if(SOS_GetPersistentInt(GetEnteringObject(), "felix_level_1") == 1)
           {
               Spawn();
           }
     }
}


