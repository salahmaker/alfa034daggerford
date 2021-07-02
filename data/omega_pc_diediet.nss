#include "omega_include"
void main()
{
string sDiety = GetLocalString(oDM, "dietyvar");
SetDeity(oMyTarget,sDiety);
//Preforming clean up
AssignCommand(GetObjectByTag("omega_dietyghost"), ActionSpeakString("Fare thee well"));
DelayCommand(0.5, DestroyObject(GetObjectByTag("omega_dietyghost"), 0.0));
}
