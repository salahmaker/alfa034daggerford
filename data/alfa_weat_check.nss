#include "alfa_weather_inc"

void main()
{
    if (iTimeElapsed < 0)
        iTimeElapsed = (24 - abs(iTimeElapsed));

    if (iTimeElapsed >= iWeatherDuration)
        {
        int iPatternShift = GetLocalInt(oModule, "WeatherPatternChange");
        int iCurrentWeather = GetLocalInt(oModule, "CurrentWeather");
        if (Random(100)+1 > iPatternShift)
            {
            /* The weather had a chance to change, but didn't. */
            SetLocalInt (oModule, "WeatherDuration", Random(7) + 4);
            SetLocalInt (oModule, "LastWeatherChange", iCurrentTime);
            }
        else
            {
            /* The weather has changed, but could end up as the same weather. */
            int iCurrentWeather = Random(100) + 1;
            SetLocalInt (oModule, "CurrentWeather", iCurrentWeather);
            SetLocalInt (oModule, "WeatherDuration", Random(7) + 4);
            SetLocalInt (oModule, "LastWeatherChange", iCurrentTime);
            object oPC = GetFirstPC();
            while (oPC != OBJECT_INVALID)
                {
                object oWeather = GetLocalObject(oPC, "Weather");
                RemoveOldWeather(oPC);
                PlasserNytt(oPC);
                oPC = GetNextPC();
                }
            }
        }
    else
        {
        /* This section makes sure at dawn
        and dusk the sky changes to the proper
        effects. */
        if (iCurrentTime == 6 || iCurrentTime == 7 || iCurrentTime == 18 || iCurrentTime == 19)
            {
            object oPC = GetFirstPC();
            while (oPC != OBJECT_INVALID)
                {
                object oWeather = GetLocalObject(oPC, "Weather");
                RemoveOldWeather(oPC);
                PlasserNytt(oPC);
                oPC = GetNextPC();
                }
            }
        }
      DelayCommand(fGameHourLength, ExecuteScript("alfa_weat_check", oModule));
}
