void main()
{
   if (GetIsDay())
   {
      SetLocked(OBJECT_SELF, FALSE);
      ActionOpenDoor(OBJECT_SELF);
   }
}
