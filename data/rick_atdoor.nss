/* Use a placeable wall door. This allows for locks and traps to be
 * placed on the door and plays an animation of the user opening
 * the door.
 *
 * Works for both standard and secret doors. For standard, the tag
 * of the waypoint destination must be set to LOC_<tag of door>.
 * For secret, the waypoint should be set to LOC_<tag of detect trigger>.
 *
 * This goes in the OnUsed event handler of the actual
 * placeable door object.
 */

#include "x0_i0_secret"

void main()
{
    object oUser = GetLastUsedBy();
    // Handle opening/closing
    if (!GetIsSecretItemOpen(OBJECT_SELF)) {
        // play animation of user opening it
        AssignCommand(oUser, ActionPlayAnimation(ANIMATION_LOOPING_GET_MID));
        DelayCommand(1.0, ActionPlayAnimation(ANIMATION_PLACEABLE_OPEN));
        SetIsSecretItemOpen(OBJECT_SELF, TRUE);
    } else {
        // it's open -- go through and then close
        UseSecretTransport(GetLastUsedBy());
        ActionPlayAnimation(ANIMATION_PLACEABLE_CLOSE);
        SetIsSecretItemOpen(OBJECT_SELF, FALSE);
        AssignCommand(GetLastUsedBy(),ActionJumpToLocation(GetLocation(GetWaypointByTag("WP_AncientTunnelEnter"))));
    }
}
