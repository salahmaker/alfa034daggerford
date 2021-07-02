#include "alfa_weather_inc"

void main()
{
    object oPC = OBJECT_SELF;
    RemoveOldWeather(oPC);
    PlasserNytt(oPC);
}
