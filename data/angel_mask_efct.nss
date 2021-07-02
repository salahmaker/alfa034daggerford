//::///////////////////////////////////////////////
//::
//:: FileName angel_mask_efct
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
Create an visual effect to simulate commune with Mask
*/
void main()
{
    // This is the Object to apply the effect to.
    object oTarget = OBJECT_SELF;

    // Create the visual portion of the effect.
    effect eVis = EffectVisualEffect(VFX_FNF_FIREBALL);

    // Apply the visual effect to the target.
    // - We apply VFX_IMP_ constants instantly, to a target.
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget);
}


