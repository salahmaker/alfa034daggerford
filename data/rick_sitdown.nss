void main()
{
    object oSeat = GetNearestObjectByTag("FancySittingChair");
    float fDist = GetDistanceBetween(OBJECT_SELF,oSeat);
    if(fDist <= 2.5)
    {
        if(!GetIsObjectValid(GetSittingCreature(oSeat)))
        {
            AssignCommand(OBJECT_SELF,ActionSit(oSeat));
        }
    }
}
