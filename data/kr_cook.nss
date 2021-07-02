void main()
{
  string sText;
  int nRandom = d4(1);
  if (nRandom == 1){
    sText = "Hey, you're not supposed to be in here!";}
  else if (nRandom == 2){
    sText = "These meals don't cook themselves, you know!";}
  else if (nRandom == 3){
    sText = "Stay out of the way, and don't make a mess in my kitchen!";}
  else if (nRandom == 4){
    sText = "If you're going to intrude on my kitchen, pick up a broom and make yourself useful!";}

ActionSpeakString (sText, TALKVOLUME_TALK);
}

