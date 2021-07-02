// Collection Purse: OnDisturbed
// Signal the performers if something is taken. (Except it doesn't work for
// gold - see OnHeartbeat.)

#include "lmpperfmisc"

void main()
{
    int nDistubance = GetInventoryDisturbType();
    object oThief = GetLastDisturbed();
    //lmpDebugMsg("OnDisturbed: Distubance type", nDistubance);
    //lmpDebugMsg("OnDisturbed: Distuber: " + GetName(oThief));
    if (nDistubance == INVENTORY_DISTURB_TYPE_REMOVED
            || nDistubance == INVENTORY_DISTURB_TYPE_STOLEN)
    {
        SignalPurseStolenBoth(oThief);
    }
}
