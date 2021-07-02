//::///////////////////////////////////////////////
//:: JH_SIT_ONDEATH
//:: JH_SIT_ONDEATH
//:: Copyright (c) 2003 Jacob Holcomb
//:://////////////////////////////////////////////
/*
This function assists JH_SIT_USE.  It destroys any invisible sitting surfaces
that may have been created.
*/
//:://////////////////////////////////////////////
//:: Created By: Jacob Holcomb
//:: Created On: January 25, 2003
//:://////////////////////////////////////////////

void main()
{

    // Get this object.
    object oChair = OBJECT_SELF;

    // If this object is valid.
    if( GetIsObjectValid( oChair ) )
    {
        // Get attached object variable named "sittingsurface".
        object oSurf = GetLocalObject( oChair, "SIT_SURF");
        // if attached sitting surface is valid
        if( GetIsObjectValid( oSurf ) )
        {
            // destroy it.
            DestroyObject( oSurf );
        }
    }
}
