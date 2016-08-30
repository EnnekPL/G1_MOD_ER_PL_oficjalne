//poprawione i sprawdzone - Nocturn

func void changeRtnBartholo ()
{
	AI_StopProcessInfos	(self);
	B_ExchangeRoutine (EBR_106_Bartholo, "START");  
};

func void changeRtnBartholo2 ()
{
	B_ExchangeRoutine (STT_309_Whistler,"lochy");
	B_ExchangeRoutine (EBR_106_Bartholo,"start");
};

// **************************************
//					EXIT 
// **************************************

instance DIA_Bartholo_Exit (C_INFO)
{
	npc			= EBR_106_Bartholo;
	nr			= 999;
	condition	= DIA_Bartholo_Exit_Condition;
	information	= DIA_Bartholo_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int DIA_Bartholo_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Bartholo_Exit_Info()
{
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 					HAllo
// ************************************************************

INSTANCE Info_Bartholo_HAllo (C_INFO)
{
	npc			= EBR_106_Bartholo;
	nr			= 4;
	condition	= Info_Bartholo_HAllo_Condition;
	information	= Info_Bartholo_HAllo_Info;
	permanent	= 0;
	description = "Kim jeste�?";
};                       

FUNC INT Info_Bartholo_HAllo_Condition()
{	
	return 1;
};

FUNC VOID Info_Bartholo_HAllo_Info()
{
	AI_Output (other, self,"Info_Bartholo_HAllo_15_00"); //Kim jeste�?
	AI_Output (self, other,"Info_Bartholo_HAllo_12_01"); //Nazywam si� Bartholo. Zajmuj� si� zaopatrywaniem Magnat�w. 
	AI_Output (self, other,"Info_Bartholo_HAllo_12_02"); //Dostarczam im wszystkiego - od ziela, przez �ywno��, a� po kobiety.
	AI_Output (self, other,"Info_Bartholo_HAllo_12_03"); //Opr�cz tego pilnuj� tych imbecyli z kuchni.
	AI_Output (self, other,"Info_Bartholo_HAllo_12_04"); //Te b�azny powinny mi by� wdzi�czne. Gomez nie toleruje partactwa, nawet w kuchni. Poprzednich dw�ch kucharzy skarmi� topielcom w rzece.
};

// ************************************************************
// 					PERM TRADE
// ************************************************************

INSTANCE Info_Bartholo_PERM (C_INFO)
{
	npc			= EBR_106_Bartholo;
	nr			= 4;
	condition	= Info_Bartholo_PERM_Condition;
	information	= Info_Bartholo_PERM_Info;
	permanent	= 0;
	description = "Chc� dobi� z tob� targu.";
	Trade		= 1;
};                       

FUNC INT Info_Bartholo_PERM_Condition()
{	
//SN: Problematisch, da Bartholo auch einen wichtigen Schl�ssel hat!
//	if (Npc_KnowsInfo(hero, Info_Bartholo_Hallo))
//	{
//		return 1;
//	};
};

FUNC VOID Info_Bartholo_PERM_Info()
{
	AI_Output (other, self,"Info_Bartholo_PERM_15_00"); //Chc� dobi� z tob� targu.
	AI_Output (self, other,"Info_Bartholo_PERM_12_01"); //Mam sporo ciekawych rzeczy - je�li masz wystarczaj�co du�o rudy.
};


// ************************************************************
// 					KRAUTBOTE von Kalom
// ************************************************************

INSTANCE Info_Bartholo_Krautbote (C_INFO)
{
	npc			= EBR_106_Bartholo;
	nr			= 4;
	condition	= Info_Bartholo_Krautbote_Condition;
	information	= Info_Bartholo_Krautbote_Info;
	permanent	= 1;
	description = "Mam tu troch� ziela dla Gomeza. Przysy�a je Cor Kalom.";
};                       

FUNC INT Info_Bartholo_Krautbote_Condition()
{	
	if (Kalom_Krautbote == LOG_RUNNING) && (Kalom_DeliveredWeed == false)
	{
		return 1;
	};
};

FUNC VOID Info_Bartholo_Krautbote_Info()
{
	AI_Output				(other, self,"Info_Bartholo_Krautbote_15_00"); //Mam tu troch� ziela dla Gomeza. Przysy�a je Cor Kalom.
	AI_Output				(self, other,"Info_Bartholo_Krautbote_12_01"); //Poka�!
	
	if (Npc_HasItems(other, itmijoint_3) >= 30)
	{
		AI_Output			(self, other,"Info_Bartholo_Krautbote_12_02"); //Hmmmmmmm ...
		AI_Output			(self, other,"Info_Bartholo_Krautbote_12_03"); //�wietnie! Gomez zacz�� si� ju� niecierpliwi�. Masz szcz�cie, �e przynios�e� je jeszcze dzisiaj!
		AI_Output			(other, self,"Info_Bartholo_Krautbote_15_04"); //A co z moj� zap�at�?
		AI_Output			(self, other,"Info_Bartholo_Krautbote_12_05"); //Spokojnie... Masz tu 500 bry�ek rudy. Taka by�a umowa.
		
		B_GiveInvItems  	(other,self,itmijoint_3,30);
		CreateInvItems  	(self,itminugget, 500);
		B_GiveInvItems		(self,other, itminugget, 500);

		Kalom_DeliveredWeed	= TRUE;
		B_LogEntry			(CH1_KrautBote,	"Bartholo da� mi 500 bry�ek rudy za dostarczenie ziela.");
		B_GiveXP			(XP_WeedShipmentDelivered);

		Info_Bartholo_Krautbote.permanent = 0;
	}
	else
	{
		AI_Output			(self, other,"Info_Bartholo_Krautbote_NoKraut_12_00"); //Jak na pos�a�ca masz przy sobie troch� za ma�o ziela! Mam nadziej�, �e nie sprzeda�e� go komu� innemu! Wr��, jak b�dziesz mia� ca�� parti�.
	};
};

// **************************************************************************
// 				Wartet auf den SC
// **************************************************************************

instance  DIA_EBR_106_Bartholo_Wait4SC (C_INFO)
{
	npc				= EBR_106_Bartholo;
	condition		= DIA_EBR_106_Bartholo_Wait4SC_Condition;
	information		= DIA_EBR_106_Bartholo_Wait4SC_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  DIA_EBR_106_Bartholo_Wait4SC_Condition()
{	
	if	ExploreSunkenTower
	{
		return TRUE;
	};
};
FUNC void  DIA_EBR_106_Bartholo_Wait4SC_Info()
{
	AI_SetWalkmode		(self, NPC_WALK);
	AI_GotoNpc			(self, other);
	AI_Output			(self, other,"Info_Bartholo_12_01");	//Podejrzewa�em, �e pr�dzej czy p�niej kto� spr�buje u�y� pentagramu.
	AI_Output			(self, other,"Info_Bartholo_12_02");	//Ale w odr�nieniu od tego zdradzieckiego kowala, Stone'a, CIEBIE ju� nie potrzebujemy!
	AI_Output			(other, self,"Info_Bartholo_15_03");	//Gdzie jest Stone?
	AI_Output			(self, other,"Info_Bartholo_12_04");	//Za kratkami! Ale ciebie czeka mi�y, przytulny GR�B!
	AI_Output			(self, other,"Info_Bartholo_12_05");	//Bra� go, ch�opcy! Posieka� go!

	AI_StopProcessInfos	(self);
	
	self.guild 	= GIL_EBR;
	Npc_SetTrueGuild	(self, GIL_EBR);	
};

var int szukam_dowodow;
var int ruszajBartholo;
//========================================
//-----------------> WTF2
//========================================

INSTANCE DIA_Bartholo_WTF2 (C_INFO)
{
   npc          = EBR_106_Bartholo;
   nr           = 5;
   condition    = DIA_Bartholo_WTF2_Condition;
   information  = DIA_Bartholo_WTF2_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Bartholo_WTF2_Condition()
{
    if (MordragProblemOC == LOG_RUNNING)
    && (gadaninaBartholo==true)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Bartholo_WTF2_Info()
{
    AI_Output (self, other ,"DIA_Bartholo_WTF2_03_01"); //Gravo m�wi�, �e czego� ode mnie chcesz? Co� ty za jeden?
	AI_Output (self, other ,"DIA_Bartholo_WTF2_03_01_WARN"); //Ostrzegam, �e u g�ry stoi dw�ch najlepszych Garotnik�w jakich mamy. Je�li spr�bujesz mnie zaatakowa�, gorzko tego po�a�ujesz. 
    Info_ClearChoices		(DIA_Bartholo_WTF2);
    Info_AddChoice		(DIA_Bartholo_WTF2, "Niewa�ne.", DIA_Bartholo_WTF2_NIC);
    Info_AddChoice		(DIA_Bartholo_WTF2, "Co wiesz o kradzie�y d�br Magnat�w?", DIA_Bartholo_WTF2_HELP);
};

FUNC VOID DIA_Bartholo_WTF2_NIC()
{
    AI_Output (other, self ,"DIA_Bartholo_WTF2_NIC_15_01"); //Niewa�ne.
	AI_Output (self, other ,"DIA_Bartholo_WTF2_NIC_03_02"); //To nie zawracaj mi g�owy, durniu! Nie nale�� do os�b z poczuciem humoru. Zr�b tak jeszcze raz, a nakarmi� tob� kretoszczury. 
    Info_ClearChoices		(DIA_Bartholo_WTF2);
	Npc_ExchangeRoutine (self,"start");
	AI_StopProcessInfos	(self);
};

FUNC VOID DIA_Bartholo_WTF2_HELP()
{
    AI_Output (other, self ,"DIA_Bartholo_WTF2_HELP_15_01"); //Potrzebuj� informacji o kradzie�y d�br Magnat�w. S�ysza�em, �e jeste� odpowiedzialny za ca�y inwentarz...
    AI_Output (self, other ,"DIA_Bartholo_WTF2_HELP_03_02"); //A w og�le po co ci ta informacja? Dlaczego dla jakiego� brudasa mia�aby by� u�yteczna?
    AI_Output (other, self ,"DIA_Bartholo_WTF2_HELP_15_03"); //Prawdopodobnie jestem na tropie winowajcy. Powiedz mi, co wiesz.
    AI_Output (self, other ,"DIA_Bartholo_WTF2_HELP_03_04"); //To jakie� ��danie wobec mnie? Czy�by do Kolonii trafi� jaki� szlachetny paladyn chc�cy nagle zaprowadzi� sprawiedliwo��?
	AI_Output (self, other ,"DIA_Bartholo_WTF2_HELP_03_05"); //Chwy� lepiej za kilof, m�okosie.
    AI_Output (other, self ,"DIA_Bartholo_WTF2_HELP_15_06"); //Ponowi� moje pytanie. Czy w�r�d �up�w by�o co� szczeg�lnego?
    AI_Output (self, other ,"DIA_Bartholo_WTF2_HELP_03_07"); //Uparty jeste�... bo tam kilka puchar�w, amulet, ruda i pewien cenny pier�cie�. Zale�y mi g��wnie na pier�cieniu. 
    AI_Output (other, self ,"DIA_Bartholo_WTF2_HELP_15_08"); //To bardzo wa�na rzecz. Tyle powinno mi wystarczy�. No, nie b�d� ci ju� zawraca� g�owy. Do zobaczenia.
	
    B_LogEntry              (CH1_MordragProblemOC,"Bartholo wyjawi� mi, �e poza rud� i kosztowno�ciami, �upem by�y tak�e niezwykle cenny pier�cie� i mniej wa�ny amulet.");
	Info_ClearChoices		(DIA_Bartholo_WTF2);
	szukam_dowodow=true;
	Npc_ExchangeRoutine (self,"start");
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> DOWODY
//========================================

INSTANCE DIA_Bartholo_DOWODY (C_INFO)
{
   npc          = EBR_106_Bartholo;
   nr           = 6;
   condition    = DIA_Bartholo_DOWODY_Condition;
   information  = DIA_Bartholo_DOWODY_Info;
   permanent	= FALSE;
   description	= "Mam dowody obci��aj�ce �wistaka.";
};

FUNC INT DIA_Bartholo_DOWODY_Condition()
{
    if (szukam_dowodow == true)
    && (MordragProblemOC == LOG_RUNNING)
    && (Npc_HasItems (other, EBR_Ring1) >=1)
    && (Npc_HasItems (other, ItWr_PamietnikSwistaka) >=1)  
	{
    return TRUE;
    };
};


FUNC VOID DIA_Bartholo_DOWODY_Info()
{
    AI_Output (other, self ,"DIA_Bartholo_DOWODY_15_01"); //Mam dowody obci��aj�ce �wistaka. To on ukrad� lata temu pier�cie� i amulet.
    AI_Output (self, other ,"DIA_Bartholo_DOWODY_03_02"); //Co? A jednak nie rzuca�e� s��w na wiatr. 
    AI_Output (other, self ,"DIA_Bartholo_DOWODY_15_03"); //Oto jego pami�tnik, oraz pier�cie�, kt�ry zosta� skradziony. 
    AI_Output (self, other ,"DIA_Bartholo_DOWODY_03_04"); //Poka� mi go!
    B_UseFakeScroll ();
    AI_Output (self, other ,"DIA_Bartholo_DOWODY_03_05"); //Co za sukinsyn! Ju� ja go dorw� i zrobi� z nim porz�dek!
    AI_Output (self, other ,"DIA_Bartholo_DOWODY_03_06"); //A teraz dawaj mi ten pier�cie�. Reszt� �mieci mo�esz sobie zatrzyma� jako nagrod�. Znaj moj� szczodro��, m�okosie. 
    B_LogEntry                     (CH1_MordragProblemOC,"Bartholo wydawa� si� by� zadowolony z odzyskania �up�w. Zabra� mi pier�cie� i notatki �wistaka.");
    B_GiveXP (300);
    Npc_ExchangeRoutine (self,"start");
	B_GiveInvItems (hero, EBR_106_Bartholo, EBR_Ring1, 1);
	Npc_RemoveInvItems (EBR_106_Bartholo, EBR_Ring1, 1);
	B_GiveInvItems (hero,EBR_106_Bartholo, ItWr_PamietnikSwistaka, 1);
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HANDEL_ZEW
//========================================

INSTANCE DIA_Bartholo_HANDEL_ZEW (C_INFO)
{
   npc          = EBR_106_Bartholo;
   nr           = 1;
   condition    = DIA_Bartholo_HANDEL_ZEW_Condition;
   information  = DIA_Bartholo_HANDEL_ZEW_Info;
   permanent	= FALSE;
   description	= "Rzekomo odpowiadasz za handel ze �wiatem Zewn�trznym.";
};

FUNC INT DIA_Bartholo_HANDEL_ZEW_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Gerard_TROFEUM))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Bartholo_HANDEL_ZEW_Info()
{
    AI_Output (other, self ,"DIA_Bartholo_HANDEL_ZEW_15_01"); //Rzekomo odpowiadasz za handel ze �wiatem Zewn�trznym.
    AI_Output (self, other ,"DIA_Bartholo_HANDEL_ZEW_03_02"); //To prawda, potrzebujesz czego�?
    AI_Output (other, self ,"DIA_Bartholo_HANDEL_ZEW_15_03"); //Mam pewne pazury topielca, kt�rych kupnem m�g�by by� zainteresowany kupiec Lutero z Khorinis...
    AI_Output (self, other ,"DIA_Bartholo_HANDEL_ZEW_03_04"); //Przynie� mi butelk� jakiego� porz�dnego trunku, wtedy zajm� si� twoj� spraw�.
    AI_Output (other, self ,"DIA_Bartholo_HANDEL_ZEW_15_05"); //Postaram si� co� za�atwi�. 
    B_LogEntry                     (CH1_SzponyTopielca,"Bartholo przeka�e informacje kupcowi Lutero, je�li przynios� mu jaki� wyj�tkowy trunek.");
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> GIVE_ALCO
//========================================
//edit by Nocturn
INSTANCE DIA_Bartholo_GIVE_ALCO (C_INFO)
{
   npc          = EBR_106_Bartholo;
   nr           = 1;
   condition    = DIA_Bartholo_GIVE_ALCO_Condition;
   information  = DIA_Bartholo_GIVE_ALCO_Info;
   permanent	= FALSE;
   description	= "Spr�buj tego.";
};

FUNC INT DIA_Bartholo_GIVE_ALCO_Condition()
{
    if (Npc_HasItems (other, JeremiahMoonshine) >=1)
    && (Npc_KnowsInfo (hero, DIA_Bartholo_HANDEL_ZEW))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Bartholo_GIVE_ALCO_Info()
{
    AI_Output (other, self ,"DIA_Bartholo_GIVE_ALCO_15_01"); //Spr�buj tego.
    B_GiveInvItems (other, self, JeremiahMoonshine, 1);
	AI_UseItem (self, JeremiahMoonshine);
    AI_Output (self, other ,"DIA_Bartholo_GIVE_ALCO_03_02"); //Ten smak... Nieprawdopodobne, �e cz�owiek jest w stanie przyrz�dzi� co� tak wykwintnego. Przeka�� wiadomo�� kupcowi. Co to mia�o by�?
    AI_Output (other, self ,"DIA_Bartholo_GIVE_ALCO_15_03"); //Mam pewne pazury topielca, ale nie takie zwyczajne. Posiadacz tych szpon�w by� znacznie wi�kszy i silniejszy od pozosta�ych topielc�w. Kupiec Lutero z Khorinis poszukuje pazur�w wyj�tkowej bestii.
    AI_Output (self, other ,"DIA_Bartholo_GIVE_ALCO_03_04"); //Rozumiem, przy najbli�szej wymianie przeka�� wiadomo��.
    AI_Output (other, self ,"DIA_Bartholo_GIVE_ALCO_15_05"); //Kiedy mog� spodziewa� si� odpowiedzi?
    AI_Output (self, other ,"DIA_Bartholo_GIVE_ALCO_03_06"); //My�l�, �e za trzy dni.
    B_LogEntry                     (CH1_SzponyTopielca,"Bartholo przeka�e wiadomo�� kupcowi Lutero. Odpowiedzi mog� spodziewa� si� za trzy dni.");
	dzien_Bartholo_1 = Wld_GetDay();
    B_GiveXP (200);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> ODP_OD_LUTERO
//========================================

INSTANCE DIA_Bartholo_ODP_OD_LUTERO (C_INFO)
{
   npc          = EBR_106_Bartholo;
   nr           = 2;
   condition    = DIA_Bartholo_ODP_OD_LUTERO_Condition;
   information  = DIA_Bartholo_ODP_OD_LUTERO_Info;
   permanent	= FALSE;
   description	= "Czy kupiec przys�a� odpowied�?";
};

FUNC INT DIA_Bartholo_ODP_OD_LUTERO_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Bartholo_GIVE_ALCO))
	&& (dzien_Bartholo_1 <= Wld_GetDay() -3)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Bartholo_ODP_OD_LUTERO_Info()
{
    AI_Output (other, self ,"DIA_Bartholo_ODP_OD_LUTERO_15_01"); //Czy kupiec przys�a� odpowied�?
    AI_Output (self, other ,"DIA_Bartholo_ODP_OD_LUTERO_15_02"); //Tak, oto pismo.

    CreateInvItems (self, ItWr_LetterFromLutero, 1);
    B_GiveInvItems (self, other, ItWr_LetterFromLutero, 1);
    B_LogEntry                     (CH1_SzponyTopielca,"Otrzyma�em wiadomo�� od Lutero. Musz� przeczyta� list.");
};
var int dzien_Bartholo_Pazury;
//========================================
//-----------------> GIVE_ITEMS_LUTERO
//========================================

INSTANCE DIA_Bartholo_GIVE_ITEMS_LUTERO (C_INFO)
{
   npc          = EBR_106_Bartholo;
   nr           = 3;
   condition    = DIA_Bartholo_GIVE_ITEMS_LUTERO_Condition;
   information  = DIA_Bartholo_GIVE_ITEMS_LUTERO_Info;
   permanent	= FALSE;
   description	= "Czy mo�esz przekaza� co� jeszcze?";
};

FUNC INT DIA_Bartholo_GIVE_ITEMS_LUTERO_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Bartholo_ODP_OD_LUTERO))
    && (Npc_HasItems (other, ItAt_DamLurker_01) >=1)
	&& (!Npc_KnowsInfo (hero, DIA_Bartholo_NOGIVE_ITEMS_LUTERO))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Bartholo_GIVE_ITEMS_LUTERO_Info()
{
    AI_Output (other, self ,"DIA_Bartholo_GIVE_ITEMS_LUTERO_15_01"); //Czy mo�esz przekaza� co� jeszcze?
    AI_Output (self, other ,"DIA_Bartholo_GIVE_ITEMS_LUTERO_03_02"); //Jasne, nie ma sprawy.
    AI_Output (other, self ,"DIA_Bartholo_GIVE_ITEMS_LUTERO_15_03"); //Przeka� mu te pazury i wiadomo��, �e przyjmuj� jego propozycj�.
    B_GiveInvItems (other, self, ItAt_DamLurker_01, 1);
    B_LogEntry                     (CH1_SzponyTopielca,"Przyj��em ofert� Lutero. Powinienem codziennie odwiedza� Bartholo i czeka� na nagrod�.");
	dzien_Bartholo_Pazury = Wld_GetDay();
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> NAGRODA_LUTERO
//========================================
//edit by Nocturn

INSTANCE DIA_Bartholo_NAGRODA_LUTERO (C_INFO)
{
   npc          = EBR_106_Bartholo;
   nr           = 4;
   condition    = DIA_Bartholo_NAGRODA_LUTERO_Condition;
   information  = DIA_Bartholo_NAGRODA_LUTERO_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Bartholo_NAGRODA_LUTERO_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Bartholo_GIVE_ITEMS_LUTERO))
   && (dzien_Bartholo_Pazury <= Wld_GetDay() -1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Bartholo_NAGRODA_LUTERO_Info()
{
    AI_Output (self, other ,"DIA_Bartholo_NAGRODA_LUTERO_03_01"); //Zaczekaj, to od tego handlarza. Kaptur kolczy w Kolonii to naprawd� rzadko��.
    AI_Output (other, self ,"DIA_Bartholo_NAGRODA_LUTERO_03_02"); //Dzi�ki za pomoc.
    B_LogEntry                     (CH1_SzponyTopielca,"Otrzyma�em nagrod� od kupca. Ten kaptur mo�e okaza� si� nieocenion� ochron� w tej przekl�tej Kolonii.");
    Log_SetTopicStatus       (CH1_SzponyTopielca, LOG_SUCCESS);
    MIS_SzponyTopielca = LOG_SUCCESS;

    B_GiveXP (200);
    CreateInvItems (self, KETPAL, 1);
    B_GiveInvItems (self, other, KETPAL, 1);
};

//========================================
//-----------------> NOGIVE_ITEMS_LUTERO
//========================================

INSTANCE DIA_Bartholo_NOGIVE_ITEMS_LUTERO (C_INFO)
{
   npc          = EBR_106_Bartholo;
   nr           = 3;
   condition    = DIA_Bartholo_NOGIVE_ITEMS_LUTERO_Condition;
   information  = DIA_Bartholo_NOGIVE_ITEMS_LUTERO_Info;
   permanent	= FALSE;
   description	= "Postanowi�em zachowa� trofeum dla siebie.";
};

FUNC INT DIA_Bartholo_NOGIVE_ITEMS_LUTERO_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Bartholo_ODP_OD_LUTERO))
    && (Npc_HasItems (other, ItAt_DamLurker_01) >=1)
	&& (!Npc_KnowsInfo (hero, DIA_Bartholo_GIVE_ITEMS_LUTERO))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Bartholo_NOGIVE_ITEMS_LUTERO_Info()
{
    AI_Output (other, self ,"DIA_Bartholo_NOGIVE_ITEMS_LUTERO_15_01"); //Postanowi�em zachowa� trofeum dla siebie.
       B_LogEntry                     (CH1_SzponyTopielca,"Postanowi�em zachowa� trofeum dla siebie. By� mo�e kiedy� b�d� tego �a�owa�, ale taki by� m�j wyb�r.");
    Log_SetTopicStatus       (CH1_SzponyTopielca, LOG_FAILED);
    MIS_SzponyTopielca = LOG_FAILED;
};

//========================================
//-----------------> GOLDSWORD
//========================================

INSTANCE DIA_Bartholo_GOLDSWORD (C_INFO)
{
   npc          = EBR_106_Bartholo;
   nr           = 1;
   condition    = DIA_Bartholo_GOLDSWORD_Condition;
   information  = DIA_Bartholo_GOLDSWORD_Info;
   permanent	= FALSE;
   description	= "Wygl�dasz na zamy�lonego. Co jest?";
};

FUNC INT DIA_Bartholo_GOLDSWORD_Condition()
{
	if (kapitel >= 2)
	{
    return TRUE;
	};
};

FUNC VOID DIA_Bartholo_GOLDSWORD_Info()
{
    AI_Output (other, self ,"DIA_Bartholo_GOLDSWORD_15_01"); //Wygl�dasz na zamy�lonego. Co jest?
    AI_Output (self, other ,"DIA_Bartholo_GOLDSWORD_03_02"); //Mo�e nabra�by� wreszcie troch� szacunku i og�ady?! Zreszt� niewa�ne. Zastanawiam si� nad pewn� rzecz�.
    AI_Output (other, self ,"DIA_Bartholo_GOLDSWORD_15_03"); //Powiesz mi co� wi�cej?
    AI_Output (self, other ,"DIA_Bartholo_GOLDSWORD_03_04"); //Kiedy� w Obozie by� pewien wojownik, kt�ry posiada� wspania�y miecz w po�owie wykonany ze z�ota. Nie by�o to jakie� pot�ne ostrze.
    AI_Output (self, other ,"DIA_Bartholo_GOLDSWORD_03_05"); //Wiadomo, �e z�oto jest kruche. To raczej bro� reprezentacyjna. 
    AI_Output (self, other ,"DIA_Bartholo_GOLDSWORD_03_06"); //Ten g�upiec my�la� jednak inaczej. Pewnego dnia znikn�� razem ze swoj� broni�. Wcze�niej przechwala� si� w karczmie, �e zabije tym ostrzem stado z�baczy. Co za g�upiec...
    AI_Output (self, other ,"DIA_Bartholo_GOLDSWORD_03_07"); //Oferowa�em mu za ten miecz 500 bry�ek rudy i cz�onkostwo w�r�d Cieni, jednak nie by� zainteresowany. Chcia�bym odnale�� ten miecz.
    AI_Output (other, self ,"DIA_Bartholo_GOLDSWORD_15_08"); //Rozejrz� si� po okolicy w poszukiwaniu z�baczy. Zbieraj rud�, bo je�li odnajd� or�, to za darmo ci go nie oddam. 
    AI_Output (self, other ,"DIA_Bartholo_GOLDSWORD_03_09"); //Ha ha! Trzymam ci� za s�owo.
    MIS_GoldSword_Bartholo = LOG_RUNNING;

    Log_CreateTopic            (CH1_GoldSword_Bartholo, LOG_MISSION);
    Log_SetTopicStatus       (CH1_GoldSword_Bartholo, LOG_RUNNING);
    B_LogEntry                     (CH1_GoldSword_Bartholo,"Bartholo opowiedzia� mi o wojowniku, kt�ry posiada� z�oty miecz. Podobno w�a�ciciel przez swoj� bezmy�lno�� zosta� zabity przez z�bacze. Musz� poszuka� tych bestii w okolicy Starego Obozu. Mo�e miecz wci�� gdzie� le�y.");
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> GIVE_GOLD_SWORD
//========================================

INSTANCE DIA_Bartholo_GIVE_GOLD_SWORD (C_INFO)
{
   npc          = EBR_106_Bartholo;
   nr           = 2;
   condition    = DIA_Bartholo_GIVE_GOLD_SWORD_Condition;
   information  = DIA_Bartholo_GIVE_GOLD_SWORD_Info;
   permanent	= FALSE;
   description	= "Mam tu pewien miecz.";
};

FUNC INT DIA_Bartholo_GIVE_GOLD_SWORD_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Bartholo_GOLDSWORD))
	&& (Npc_HasItems(other, GoldenSword) >= 1)
	
    {
    return TRUE;
    };
};

//SPAWN_OW_SNAPPER_OCWOOD1_05_02
FUNC VOID DIA_Bartholo_GIVE_GOLD_SWORD_Info()
{
    AI_Output (other, self ,"DIA_Bartholo_GIVE_GOLD_SWORD_15_01"); //Mam tu pewien miecz.
    AI_Output (self, other ,"DIA_Bartholo_GIVE_GOLD_SWORD_03_02"); //Co?! Naprawd� ci si� uda�o?
    AI_Output (other, self ,"DIA_Bartholo_GIVE_GOLD_SWORD_15_03"); //Jak wida�. Mam tutaj miecz w ca�ej okaza�o�ci. Nie znam si� na kowalstwie, ale ostrze chyba nie jest zbyt zniszczone.
    AI_Output (other, self ,"DIA_Bartholo_GIVE_GOLD_SWORD_15_04"); //Jak� cen� proponujesz?
    AI_Output (self, other ,"DIA_Bartholo_GIVE_GOLD_SWORD_03_05"); //Dam ci 500 bry�ek rudy i kilka mikstur.
    AI_Output (other, self ,"DIA_Bartholo_GIVE_GOLD_SWORD_15_06"); //Umowa stoi!
    CreateInvItems (self, ItMiNugget, 500);
    B_GiveInvItems (self, other, ItMiNugget, 500);
    CreateInvItems (self, ItFo_Potion_Mana_01, 3);
    B_GiveInvItems (self, other, ItFo_Potion_Mana_01, 3);
    CreateInvItems (self, ItFo_Potion_Health_02, 2);
    B_GiveInvItems (self, other, ItFo_Potion_Health_02, 2);
	B_GiveInvItems (other, self, GoldenSword, 1);
    B_LogEntry                     (CH1_GoldSword_Bartholo,"Znalaz�em miecz i odda�em go Bartholo. Po co mi co� takiego w ekwipunku...");
    Log_SetTopicStatus       (CH1_GoldSword_Bartholo, LOG_SUCCESS);
    MIS_GoldSword_Bartholo = LOG_SUCCESS;

    B_GiveXP (350);
    AI_StopProcessInfos	(self);
};

