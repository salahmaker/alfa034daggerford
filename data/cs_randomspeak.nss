void main()
{
  string sText;
  int nRandom = d12(1);
  if (nRandom == 1){
    sText = "My business is my own.";}
  else if (nRandom == 2){
    sText = "Stop bothering me.";}
  else if (nRandom == 3){
    sText = "Do go away!";}
  else if (nRandom == 4){
    sText = "I have no time for the likes of you!";}
  else if (nRandom == 5){
    sText = "I mind my own affairs, and suggest you do likewise.";}
  else if (nRandom == 6){
    sText = "So, you some kind of adventurer or something?";}
  else if (nRandom == 7){
    sText = "Please leave me be.";}
  else if (nRandom == 8) {
    sText = "I wish to be alone with my thoughts, thank you.";}
  else if (nRandom == 9){
    sText = "*Sigh* I must have a sign on my back that says, 'Bother me.'";}
  else if (nRandom == 10){
    sText = "Have you nothing better to do than bother me?";}
  else if (nRandom == 11){
    sText = "I appreciate my privacy, adventurer.";}
  else if (nRandom == 12){
    sText = "Can you not see that I am occupied at the moment?";}
ActionSpeakString (sText, TALKVOLUME_TALK);
}

