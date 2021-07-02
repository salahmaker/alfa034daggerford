#include "alfa_weather_inc"
void main()
{

    /* Initialize the Weather Patterns */
    int nPattern;
    object oSetup = GetObjectByTag("alfa_weat_setup");
    if (!GetIsObjectValid(oSetup))
        nPattern = 60;
    else
        {
           string sPattern = GetName(oSetup);
           nPattern = StringToInt(sPattern);
           if (nPattern > 100) nPattern = 100;
           if (nPattern <1) nPattern = 1;
        }

    if (GetLocalInt(oModule, "WeatherInitialized") == FALSE)
        {
        SetLocalInt (oModule, "WeatherPatternChange", nPattern);     // % change of weather change
        SetLocalInt (oModule, "WeatherDuration", Random(7) + 4);    // Weather lasts between 4 and 10 hours.
        SetLocalInt (oModule, "CurrentWeather", Random(100) + 1);   // Determines the current weather.
        SetLocalInt (oModule, "LastWeatherChange", GetTimeHour());  // Just sets the last time the weather changed.
        SetLocalInt (oModule, "WeatherInitialized", TRUE);
        }

DelayCommand(fGameHourLength, ExecuteScript("alfa_weat_check", oModule));
}
