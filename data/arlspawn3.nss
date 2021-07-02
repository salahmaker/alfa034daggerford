#include "alfa_include"
#include "spawn_main"
#include "sos_include"

void main()
{


    object oEnteringObject = GetEnteringObject();
    object oArea = OBJECT_SELF;
//: Removed 'AREA_DARK from nString
    Subraces_OnEnterArea( GetEnteringObject(), AREA_ABOVEGROUND );
    ExecuteScript("wk_onareaenter",GetEnteringObject());

    if(CountPCsInArea(GetArea(GetEnteringObject()), TRUE) == 1)
    {
        Spawn();
    }
}




