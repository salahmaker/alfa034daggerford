void main()
{
    object oExitingObject = GetExitingObject();
    object oArea = OBJECT_SELF;

    int nNumPCs = GetLocalInt(oArea, "nNumPCs");

    if (GetIsPC(oExitingObject))
    {
        SetLocalInt(oArea , "nNumPCs", nNumPCs - 1);
    }
    /*
    if (GetLocalInt(oArea, "nNumPCs") == 0)
    {
        string sTag;
        object oObject = GetFirstObjectInArea(OBJECT_SELF);

    while (oObject != OBJECT_INVALID)
        {
            sTag = GetStringLeft(GetTag(oObject),3);
            if (sTag == "Wat")
            {
                DestroyObject(oObject);
            }
        oObject = GetNextObjectInArea(OBJECT_SELF);
        }
    }
    */
}
