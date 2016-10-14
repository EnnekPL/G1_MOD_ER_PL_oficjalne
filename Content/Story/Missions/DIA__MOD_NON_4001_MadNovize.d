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
    AI_Output (self, other ,"DIA_MadNovize_HATE_03_01"); //Czego tu szukasz, ¿a³osny cz³owieku?! Przerywasz nasze mod³y do Œni¹cego.

    Info_ClearChoices		(DIA_MadNovize_HATE);
    Info_AddChoice		(DIA_MadNovize_HATE, "Doœæ tego. Zginiecie, zdrajcy!", DIA_MadNovize_HATE_DIE);
    Info_AddChoice		(DIA_MadNovize_HATE, "Dlaczego tu jesteœcie?", DIA_MadNovize_HATE_WHY);
};

FUNC VOID DIA_MadNovize_HATE_DIE()
{
    AI_Output (other, self ,"DIA_MadNovize_HATE_DIE_15_01"); //Doœæ tego. Zginiecie, zdrajcy!
    AI_Output (self, other ,"DIA_MadNovize_HATE_DIE_03_02"); //Braæ go!
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
	
	B_LogEntry               (CH4_MagicalCrystals,"Postanowi³em zabiæ Nowicjuszy uciekinierów. Im mniej takich œwirów jak oni tym lepiej. Nie mia³em zamiaru z nimi negocjowaæ.");
};

FUNC VOID DIA_MadNovize_HATE_WHY()
{
    AI_Output (other, self ,"DIA_MadNovize_HATE_WHY_15_01"); //Dlaczego tu jesteœcie?
    AI_Output (self, other ,"DIA_MadNovize_HATE_WHY_03_02"); //Wznosimy tu mod³y do Œni¹cego! Chcemy, aby nam siê objawi³ podobnie jak Nyrasowi!
    AI_Output (other, self ,"DIA_MadNovize_HATE_WHY_15_03"); //Dla niego niezbyt dobrze siê to skoñczy³o...
    AI_Output (self, other ,"DIA_MadNovize_HATE_WHY_03_04"); //Ale my w przeciwieñstwie do niego jesteœmy ju¿ przygotowani! ŒNI¥CY PRZYBYWAJ!
    Info_ClearChoices		(DIA_MadNovize_HATE);
	Info_AddChoice		(DIA_MadNovize_HATE, "Wracajcie do obozu. Powinniœcie byæ czêœci¹ spo³ecznoœci.", DIA_MadNovize_HATE_SOCIAL);
    Info_AddChoice		(DIA_MadNovize_HATE, "Wcale nie jesteœcie przygotowani!", DIA_MadNovize_HATE_LOSERS);
};

FUNC VOID DIA_MadNovize_HATE_SOCIAL ()
{
	AI_Output (other, self ,"DIA_MadNovize_HATE_SOCIAL_15_01"); //Wracajcie do obozu. Powinniœcie byæ czêœci¹ spo³ecznoœci. Tak jak nakazuj¹ nauki Guru.
    AI_Output (self, other ,"DIA_MadNovize_HATE_SOCIAL_03_02"); //Nauki Guru? Dobre sobie! Oni ca³¹ ³askê Œni¹cego œci¹gaj¹ na siebie. Oszukuj¹ nas od lat.
	AI_Output (self, other ,"DIA_MadNovize_HATE_SOCIAL_03_03"); //Gdy Œni¹cy da nam znak, uwolnimy siê od nich i za³o¿ymy kolejny obóz! Powo³amy nowych Guru, którzy bêd¹ sprawiedliwe dzieliæ ziele.
	AI_Output (self, other ,"DIA_MadNovize_HATE_SOCIAL_03_04"); //Takich, którzy zakoñcz¹ wyzysk, a ich nauki nie bêd¹ tylko bez³adn¹ paplanin¹. Œni¹cy da nam WOLNOŒÆ!
	AI_Output (self, other ,"DIA_MadNovize_HATE_SOCIAL_03_05"); //I ty nam w tym NIE PRZESZKODZISZ! Braæ go! 

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
	
	B_LogEntry               (CH4_MagicalCrystals,"Próbowa³em nak³oniæ Nowicjuszy do powrotu do Obozu. Ci jednak byli zbyt ambitni i postanowili za³o¿yæ w³asny obóz po czym siê na mnie rzucili. Musia³em dobyæ broni...");
};

FUNC VOID DIA_MadNovize_HATE_LOSERS ()
{
	AI_Output (other, self ,"DIA_MadNovize_HATE_LOSERS_15_01"); //Wcale nie jesteœcie przygotowani!
    AI_Output (self, other ,"DIA_MadNovize_HATE_LOSERS_03_02"); //A niby co ty mo¿esz o tym wiedzieæ? Chcesz nas odci¹gn¹æ od naszych zamiarów!
	AI_Output (other, self ,"DIA_MadNovize_HATE_LOSERS_15_03"); //Co mogê o tym wiedzieæ? Widzia³em wielu podobnych wam. Szaleni Nowicjusze, upadli Baalowie... 
	AI_Output (other, self ,"DIA_MadNovize_HATE_LOSERS_15_04"); //Ka¿dy z nich myœla³, ¿e Œni¹cy da mu potêgê. Ka¿dy z nich gryzie teraz piach. 
	AI_Output (self, other ,"DIA_MadNovize_HATE_LOSERS_03_05"); //A... ale jak to?
	Info_ClearChoices	(DIA_MadNovize_HATE);
	Info_AddChoice		(DIA_MadNovize_HATE, "Ten wasz Œni¹cy to bzdura.", DIA_MadNovize_HATE_BZDURA);
    Info_AddChoice		(DIA_MadNovize_HATE, "Próbujê ci to przet³umaczyæ.", DIA_MadNovize_HATE_SMART);
};

FUNC VOID DIA_MadNovize_HATE_BZDURA ()
{
	AI_Output (other, self ,"DIA_MadNovize_HATE_BZDURA_15_01"); //Ten wasz Œni¹cy to bzdura. On wcale nie jest bogiem równym Innosowi, czy Adanosowi. To inna potê¿na istota.
    AI_Output (self, other ,"DIA_MadNovize_HATE_BZDURA_03_02"); //Co wiêc dalej z Bractwem?
	AI_Output (other, self ,"DIA_MadNovize_HATE_BZDURA_15_03"); //Nic. Wracajcie do obozu i nie naprzykrzajcie siê ju¿ nikomu. 
	AI_Output (self, other ,"DIA_MadNovize_HATE_BZDURA_03_04"); //ALE CO MAMY ROBIÆ BEZ ŒNI¥CEGO? 
	AI_Output (other, self ,"DIA_MadNovize_HATE_BZDURA_15_05"); //Postarajcie siê prze¿yæ kolejny dzieñ w Kolonii. Powodzenia. 
	AI_Output (self, other ,"DIA_MadNovize_HATE_BZDURA_03_06"); //Wkrótce wrócimy do Obozu.
	
	B_LogEntry               (CH4_MagicalCrystals,"Uda³o mi siê namówiæ Nowicjuszy do powrotu do obozu i zrezygnowaniu ze swoich ambitnych planów. Mogê wróciæ do Baal Tondrala i zabraæ kostur.");
	
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
	AI_Output (other, self ,"DIA_MadNovize_HATE_SMART_15_01"); //Próbujê ci to przet³umaczyæ. Wasze plany maj¹ nik³e szanse na spe³nienie.
    AI_Output (self, other ,"DIA_MadNovize_HATE_SMART_03_02"); //A wiêc co mamy czyniæ dalej?
	AI_Output (other, self ,"DIA_MadNovize_HATE_SMART_15_03"); //Rozmawia³em z Baal Tondralem. Pozwoli wam wróciæ do Obozu, jeœli nie bêdziecie sprawiaæ k³opotów. 
	AI_Output (self, other ,"DIA_MadNovize_HATE_SMART_03_04"); //Nie wiem jaki masz w tym zysk, ale jesteœmy ci naprawdê wdziêczni. WeŸ moj¹ sakiewkê z rud¹. Wkrótce wrócimy do Obozu.
	CreateInvItems (self, Itminugget,50);
	B_GiveInvItems (self,hero,Itminugget,50);
	
	B_LogEntry               (CH4_MagicalCrystals,"Uda³o mi siê namówiæ Nowicjuszy do powrotu do obozu i zrezygnowaniu ze swoich ambitnych planów. Mogê wróciæ do Baal Tondrala i zabraæ kostur.");
	
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