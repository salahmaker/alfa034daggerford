//Put this OnEnter
//Sets a variable used in adjacent area
void main()
{

object oMod = GetModule();

SetLocalInt(oMod, "nSpawn", 1);

DestroyObject(OBJECT_SELF, 0.5);
}

