
//*******
// TA FUNKCJA MA BY� WYWO�YWANA, GDY ZAINICJUJ� SI� ZADANIA Z P�J�CIEM
// DO KOPALNI U WSZYSTKICH GILDII !!!
//*******

func void B_Story_FocusCorristoQuest ()
{
B_ExchangeRoutine (Kdf_402_Corristo,"back");
initialization_AbMine_Guilds = true;
Wld_SendTrigger("KOPALNIAEXIT"); //wej�cie do kopalni
};
