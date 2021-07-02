//::///////////////////////////////////////////////
//:: JH_SIT_ONUSED
//:: JH_SIT_ONUSED
//:: Copyright (c) 2003 Jacob Holcomb
//:://////////////////////////////////////////////
/*
  Version 1.2
  Changes
  Version 1.1 to 1.2 : Found a bug that prevented a player from logging off and
  immediately sitting in the same chair.  Added some checks to make sure that
  if the same player tries to sit in the same chair they used to be sitting in
  it will let them. I suspect that developers messed with the sitting action
  in the 1.28 patch to NWN because I'm sure I would have noticed this bug
  in testing before.  *sigh*

  Version 1.0 to 1.1 : Added a check for creatures sitting directly on object.
  Now if an NPC uses ActionSit() to sit in the chair, this script will be
  smart enough to not sit on top of them.

  This script makes sittables that don't break when players log off while
  sitting, or when NPCs are sent to limbo while sitting.
  It requires an invisible item to exist with Blueprint ResRef "sittingsurface".
  If you imported this script from an erf file, it should already be in your
  custom palette, otherwise, you will need to create it in the toolset.
  Just create a new placeable item, call it "sitting surface", set it's
  appearance to invisible object, and make it a plot item.

  Attach this script to the OnUsed event for any usable placeable.
  Players or NPCs can sit on it by using it.  They must USE the item.
  NPC scripts must use the DoPlaceableObjectAction(object, PLACEABLE_ACTION_USE)
  function in order for this script to work.
  If NPC's use the ActionSit(object) function, this script will not run and the
  seat may break.
  If someone is already sitting on the object, it will not allow another
  person or creature to sit there.

  However, they only *appear* to be sitting on this item.
  Actually this script creates an invisible item (I call it a sitting surface).
  The creature is actually sitting on the invisible sitting surface.

  The surface is created at z vector zero.
  This works around the bug that makes creatures face east when they sit.

  A local object variable (SIT_SURF) is used (attached to the object) to
  keep track of the sitting surface.
  If the player should be able to sit in the chair, and a sitting surface
  already exists, it is destroyed and replaced.
  This works around the bug that breaks sittable objects when the sitter
  logs off or is limboed.  It does this by checking to see if any existing
  creatures are sitting in the chair and whether they are in the current area.
  If they exist but are not in the current area, it assumes that the sittable
  surface is broken. and replaces it.

  NOTE: companion script JH_SIT_ONDEATH should be used in any sittable
  item's OnDeath event to prevent invisible sitting surfaces from sticking
  around after the sittable is destroyed.
*/

//:://////////////////////////////////////////////
//:: Created By: Jacob Holcomb
//:: Created On: January 25, 2003
//:: Update Version 1.2: March 1, 2003
//:: Update Version 1.1: January 26, 2003
//:://////////////////////////////////////////////

void main()
{
    // Get the creature/player using the object
    object oUser = GetLastUsedBy();

    // If the creature/player is valid
    if ( GetIsObjectValid( oUser ) )
    {

        // Get the object being sat on.
        object oChair = OBJECT_SELF;

        // If the object is valid
        if( GetIsObjectValid( oChair ) )
        {
            // Create a variable to tell us if user should be able to sit
            // 0 = no , 1 = yes
            // Initialize to no. Assume we can't sit until proven otherwise.
            int nSit = 0;

            // If nobody is sitting directly on the object
            if ( !GetIsObjectValid( GetSittingCreature( oChair ) ) )
            {
                // Get sittable surface
                object oSurf = GetLocalObject( oChair, "SIT_SURF");

                // If sittable surface exists (someone has been sitting in my chair!)
                if( GetIsObjectValid( oSurf ) )
                {
                    // Get the previous sitter to see if they are still here
                    object oSitter = GetSittingCreature( oSurf );

                    // If nobody is sitting on the invisible object
                    if ( !GetIsObjectValid( oSitter )
                        // Or game thinks someone is sitting there but they aren't sitting any more
                        || GetCurrentAction( oSitter ) != ACTION_SIT
                        // or game thinks someone is sitting there but they aren't in the same area (limbo?)
                        || GetArea( oSitter ) != GetArea( oSurf )
                        // or game thinks someone is sitting there but actually they are trying to sit there now
                        || oSitter == GetLastUsedBy() )
                    {
                        // fix the sittable surface (destroy it)
                        DestroyObject( oSurf );
                        // Set attached sitting surface variable to invalid.
                        SetLocalObject( oChair, "SIT_SURF", OBJECT_INVALID );
                        // Let the player sit on the object.
                        nSit = 1;
                    } // end if nobody is sitting or sitter is somewhere else
                } // end if sittable surface exists
                // else (no sitting surface = nobody sitting here) let us sit
                else
                {
                    nSit = 1;
                }
            } // end if nobody is sitting directly on the object

            // If user should be able to sit
            if( nSit )
            {
                // Set the location for the sitting surface to the same as this object
                vector vSurf = GetPosition( oChair );
                // Set the z vector to zero (put it flat on the ground)
                vSurf.z = 0.0;
                location lSurf = Location( GetArea( oChair), vSurf ,
                    GetFacing( oChair ) );

                // Create a new sitting surface for this object.
                object oNewSurf = CreateObject( OBJECT_TYPE_PLACEABLE,
                    "sittingsurface", lSurf, FALSE);

                // Attach new sitting surface to this object.
                SetLocalObject( oChair, "SIT_SURF", oNewSurf );

                // Tell user to sit on new sitting surface.
                AssignCommand( oUser, ActionSit( oNewSurf ) );

            } // end if user should be able to sit

            // Else give a message to the user telling them why they can't sit.
            else
            {
                ActionSpeakString("Someone else is sitting here!");
            } // end else give message to user

        }  // End if object is valid

    } // End if player/creature is valid

} // End main

