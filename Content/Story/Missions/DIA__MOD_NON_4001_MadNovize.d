// *Script was make in Easy Dialog Maker (EDM)

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_MadNovize_EXIT(C_INFO)
{
	npc             = NON_4001_MadNovize;
	nr              = 999;
	condition	= DIA_MadNovize_EXIT_Condition;
	information	= DIA_MadNovize_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_MadNovize_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_MadNovize_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HATE
//========================================

INSTANCE DIA_MadNovize_HATE (C_INFO)
{
   npc          = NON_4001_MadNovize;
   nr           = 1;
   condition    = DIA_MadNovize_HATE_Condition;
   information  = DIA_MadNovize_HATE_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_MadNovize_HATE_Condition()
{
    if (MIS_MagicalCrystals == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_MadNovize_HATE_Info()
{
    AI_Output (self, other ,"DIA_MadNovize_HATE_03_01"); //Czego tu szukasz, �a�osny cz�owieku?! Przerywasz nasze mod�y do �ni�cego.

    Info_ClearChoices		(DIA_MadNovize_HATE);
    Info_AddChoice		(DIA_MadNovize_HATE, "Do�� tego. Zginiecie, zdrajcy!", DIA_MadNovize_HATE_DIE);
    Info_AddChoice		(DIA_MadNovize_HATE, "Dlaczego tu jeste�cie?", DIA_MadNovize_HATE_WHY);
};

FUNC VOID DIA_MadNovize_HATE_DIE()
{
    AI_Output (other, self ,"DIA_MadNovize_HATE_DIE_15_01"); //Do�� tego. Zginiecie, zdrajcy!
    AI_Output (self, other ,"DIA_MadNovize_HATE_DIE_03_02"); //Bra� go!
    AI_StopProcessInfos	(self);
    Info_ClearChoices		(DIA_MadNovize_HATE);
	
	Npc_SetPermAttitude (NON_4001_MadNovize, ATT_HOSTILE);
    Npc_SetTarget (NON_4001_MadNovize, other);
    AI_StartState (NON_4001_MadNovize, ZS_ATTACK, 1, "");
	
	Npc_SetPermAttitude (NON_4002_MadNovize, ATT_HOSTILE);
    Npc_SetTarget (NON_4002_MadNovize, other);
    AI_StartState (NON_4002_MadNovize, ZS_ATTACK, 1, "");
	
	Npc_SetPermAttitude (NON_4003_MadNovize, ATT_HOSTILE);
    Npc_SetTarget (NON_4003_MadNovize, other);
    AI_StartState (NON_4003_MadNovize, ZS_ATTACK, 1, "");
	
	Npc_SetPermAttitude (NON_4004_MadNovize, ATT_HOSTILE);
    Npc_SetTarget (NON_4004_MadNovize, other);
    AI_StartState (NON_4004_MadNovize, ZS_ATTACK, 1, "");
	
	B_LogEntry               (CH1_MagicalCrystals,"Postanowi�em zabi� Nowicjuszy uciekinier�w. Im mniej takich �wir�w jak oni tym lepiej. Nie mia�em zamiaru z nimi negocjowa�.");
};

FUNC VOID DIA_MadNovize_HATE_WHY()
{
    AI_Output (other, self ,"DIA_MadNovize_HATE_WHY_15_01"); //Dlaczego tu jeste�cie?
    AI_Output (self, other ,"DIA_MadNovize_HATE_WHY_03_02"); //Wznosimy tu mod�y do �ni�cego! Chcemy, aby nam si� objawi� podobnie jak Nyrasowi!
    AI_Output (other, self ,"DIA_MadNovize_HATE_WHY_15_03"); //Dla niego niezbyt dobrze si� to sko�czy�o...
    AI_Output (self, other ,"DIA_MadNovize_HATE_WHY_03_04"); //Ale my w przeciwie�stwie do niego jeste�my ju� przygotowani! �NI�CY PRZYBYWAJ!
    Info_ClearChoices		(DIA_MadNovize_HATE);
	Info_AddChoice		(DIA_MadNovize_HATE, "Wracajcie do obozu. Powinni�cie by� cz�ci� spo�eczno�ci.", DIA_MadNovize_HATE_SOCIAL);
    Info_AddChoice		(DIA_MadNovize_HATE, "Wcale nie jeste�cie przygotowani!", DIA_MadNovize_HATE_LOSERS);
};

FUNC VOID DIA_MadNovize_HATE_SOCIAL ()
{
	AI_Output (other, self ,"DIA_MadNovize_HATE_SOCIAL_15_01"); //Wracajcie do obozu. Powinni�cie by� cz�ci� spo�eczno�ci. Tak jak nakazuj� nauki Guru.
    AI_Output (self, other ,"DIA_MadNovize_HATE_SOCIAL_03_02"); //Nauki Guru? Dobre sobie! Oni ca�� �ask� �ni�cego �ci�gaj� na siebie. Oszukuj� nas od lat.
	AI_Output (self, other ,"DIA_MadNovize_HATE_SOCIAL_03_03"); //Gdy �ni�cy da nam znak, uwolnimy si� od nich i za�o�ymy kolejny ob�z! Powo�amy nowych Guru, kt�rzy b�d� sprawiedliwe dzieli� ziele.
	AI_Output (self, other ,"DIA_MadNovize_HATE_SOCIAL_03_04"); //Takich, kt�rzy zako�cz� wyzysk, a ich nauki nie b�d� tylko bez�adn� paplanin�. �ni�cy da nam WOLNO��!
	AI_Output (self, other ,"DIA_MadNovize_HATE_SOCIAL_03_05"); //I ty nam w tym NIE PRZESZKODZISZ! Bra� go! 

    AI_StopProcessInfos	(self);
    Info_ClearChoices		(DIA_MadNovize_HATE);
	
	Npc_SetPermAttitude (NON_4001_MadNovize, ATT_HOSTILE);
    Npc_SetTarget (NON_4001_MadNovize, other);
    AI_StartState (NON_4001_MadNovize, ZS_ATTACK, 1, "");
	
	Npc_SetPermAttitude (NON_4002_MadNovize, ATT_HOSTILE);
    Npc_SetTarget (NON_4002_MadNovize, other);
    AI_StartState (NON_4002_MadNovize, ZS_ATTACK, 1, "");
	
	Npc_SetPermAttitude (NON_4003_MadNovize, ATT_HOSTILE);
    Npc_SetTarget (NON_4003_MadNovize, other);
    AI_StartState (NON_4003_MadNovize, ZS_ATTACK, 1, "");
	
	Npc_SetPermAttitude (NON_4004_MadNovize, ATT_HOSTILE);
    Npc_SetTarget (NON_4004_MadNovize, other);
    AI_StartState (NON_4004_MadNovize, ZS_ATTACK, 1, "");
	
	B_LogEntry               (CH1_MagicalCrystals,"Pr�bowa�em nak�oni� Nowicjuszy do powrotu do Obozu. Ci jednak byli zbyt ambitni i postanowili za�o�y� w�asny ob�z po czym si� na mnie rzucili. Musia�em doby� broni...");
};

FUNC VOID DIA_MadNovize_HATE_LOSERS ()
{
	AI_Output (other, self ,"DIA_MadNovize_HATE_LOSERS_15_01"); //Wcale nie jeste�cie przygotowani!
    AI_Output (self, other ,"DIA_MadNovize_HATE_LOSERS_03_02"); //A niby co ty mo�esz o tym wiedzie�? Chcesz nas odci�gn�� od naszych zamiar�w!
	AI_Output (other, self ,"DIA_MadNovize_HATE_LOSERS_15_03"); //Co mog� o tym wiedzie�? Widzia�em wielu podobnych wam. Szaleni Nowicjusze, upadli Baalowie... 
	AI_Output (other, self ,"DIA_MadNovize_HATE_LOSERS_15_04"); //Ka�dy z nich my�la�, �e �ni�cy da mu pot�g�. Ka�dy z nich gryzie teraz piach. 
	AI_Output (self, other ,"DIA_MadNovize_HATE_LOSERS_03_05"); //A... ale jak to?
	Info_ClearChoices	(DIA_MadNovize_HATE);
	Info_AddChoice		(DIA_MadNovize_HATE, "Ten wasz �ni�cy to bzdura.", DIA_MadNovize_HATE_BZDURA);
    Info_AddChoice		(DIA_MadNovize_HATE, "Pr�buj� ci to przet�umaczy�.", DIA_MadNovize_HATE_SMART);
};

FUNC VOID DIA_MadNovize_HATE_BZDURA ()
{
	AI_Output (other, self ,"DIA_MadNovize_HATE_BZDURA_15_01"); //Ten wasz �ni�cy to bzdura. On wcale nie jest bogiem r�wnym Innosowi, czy Adanosowi. To inna pot�na istota.
    AI_Output (self, other ,"DIA_MadNovize_HATE_BZDURA_03_02"); //Co wi�c dalej z Bractwem?
	AI_Output (other, self ,"DIA_MadNovize_HATE_BZDURA_15_03"); //Nic. Wracajcie do obozu i nie naprzykrzajcie si� ju� nikomu. 
	AI_Output (self, other ,"DIA_MadNovize_HATE_BZDURA_03_04"); //ALE CO MAMY ROBI� BEZ �NI�CEGO? 
	AI_Output (other, self ,"DIA_MadNovize_HATE_BZDURA_15_05"); //Postarajcie si� prze�y� kolejny dzie� w Kolonii. Powodzenia. 
	AI_Output (self, other ,"DIA_MadNovize_HATE_BZDURA_03_06"); //Wkr�tce wr�cimy do Obozu.
	
	B_LogEntry               (CH1_MagicalCrystals,"Uda�o mi si� nam�wi� Nowicjuszy do powrotu do obozu i zrezygnowaniu ze swoich ambitnych plan�w. Mog� wr�ci� do Baal Tondrala i zabra� kostur.");
	
	NON_4001_MadNovize.name = "Nowicjusz";
	NON_4002_MadNovize.name = "Nowicjusz";
	NON_4003_MadNovize.name = "Nowicjusz";
	NON_4004_MadNovize.name = "Nowicjusz";
	
	Npc_ExchangeRoutine (NON_4001_MadNovize,"camp");
	Npc_ExchangeRoutine (NON_4002_MadNovize,"camp");
	Npc_ExchangeRoutine (NON_4003_MadNovize,"camp");
	Npc_ExchangeRoutine (NON_4004_MadNovize,"camp");
	
	TondralNovizesBack = true;
	Info_ClearChoices	(DIA_MadNovize_HATE);
};

FUNC VOID DIA_MadNovize_HATE_SMART ()
{
	AI_Output (other, self ,"DIA_MadNovize_HATE_SMART_15_01"); //Pr�buj� ci to przet�umaczy�. Wasze plany maj� nik�e szanse na spe�nienie.
    AI_Output (self, other ,"DIA_MadNovize_HATE_SMART_03_02"); //A wi�c co mamy czyni� dalej?
	AI_Output (other, self ,"DIA_MadNovize_HATE_SMART_15_03"); //Rozmawia�em z Baal Tondralem. Pozwoli wam wr�ci� do Obozu, je�li nie b�dziecie sprawia� k�opot�w. 
	AI_Output (self, other ,"DIA_MadNovize_HATE_SMART_03_04"); //Nie wiem jaki masz w tym zysk, ale jeste�my ci naprawd� wdzi�czni. We� moj� sakiewk� z rud�. Wkr�tce wr�cimy do Obozu.
	CreateInvItems (self, Itminugget,50);
	B_GiveInvItems (self,hero,Itminugget,50);
	
	B_LogEntry               (CH1_MagicalCrystals,"Uda�o mi si� nam�wi� Nowicjuszy do powrotu do obozu i zrezygnowaniu ze swoich ambitnych plan�w. Mog� wr�ci� do Baal Tondrala i zabra� kostur.");
	
	NON_4001_MadNovize.name = "Nowicjusz";
	NON_4002_MadNovize.name = "Nowicjusz";
	NON_4003_MadNovize.name = "Nowicjusz";
	NON_4004_MadNovize.name = "Nowicjusz";
	
	Npc_ExchangeRoutine (NON_4001_MadNovize,"camp");
	Npc_ExchangeRoutine (NON_4002_MadNovize,"camp");
	Npc_ExchangeRoutine (NON_4003_MadNovize,"camp");
	Npc_ExchangeRoutine (NON_4004_MadNovize,"camp");
	
	TondralNovizesBack = true;
	
	Info_ClearChoices	(DIA_MadNovize_HATE);
};