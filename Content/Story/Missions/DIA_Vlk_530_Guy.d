//poprawione i sprawdzone - Nocturn

// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Guy_Exit (C_INFO)
{
	npc			= Vlk_530_Guy;
	nr			= 999;
	condition	= DIA_Guy_Exit_Condition;
	information	= DIA_Guy_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Guy_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Guy_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 				Erstes Mal aufkreuzen
// **************************************************

INSTANCE DIA_Guy_Hello (C_INFO)
{
	npc				= Vlk_530_Guy;
	nr				= 2;
	condition		= DIA_Guy_Hello_Condition;
	information		= DIA_Guy_Hello_Info;
	permanent		= 0;
	description 	= "Witam!";
};

FUNC INT DIA_Guy_Hello_Condition()
{	
	if  (Kapitel < 4) 
	{
		return 1;
	};
};

FUNC VOID DIA_Guy_Hello_Info()
{
	AI_Output (other, self,"DIA_Guy_Hello_15_00"); //Witam!
	AI_Output (self, other,"DIA_Guy_Hello_03_01"); //Mhm? Nie widzia�em ci� jeszcze tutaj. Jeste� nowy, prawda?
	AI_Output (other, self,"DIA_Guy_Hello_15_02"); //Tak, trafi�em tu niedawno...
	if (Npc_GetTrueGuild(other) == GIL_NONE)
	{
	AI_Output (self, other,"DIA_Guy_Hello_03_03"); //Zdecydowa�e� ju�, do kt�rego obozu do��czysz?
	AI_Output (other, self,"DIA_Guy_Hello_15_04"); //Nie. Masz dla mnie jakie� sugestie?
	AI_Output (self, other,"DIA_Guy_Hello_03_05"); //C�, to zale�y. Ka�dy ob�z ma swoje wady i zalety.
	AI_Output (self, other,"DIA_Guy_Hello_03_06"); //Dop�ki nie podejmiesz decyzji, mo�esz zosta� tutaj. W�a�nie zwolni�a si� jedna chata.
	};
};

// **************************************************
// 				Advantages OC
// **************************************************

INSTANCE DIA_Guy_AdOC (C_INFO)
{
	npc				= Vlk_530_Guy;
	nr				= 2;
	condition		= DIA_Guy_AdOC_Condition;
	information		= DIA_Guy_AdOC_Info;
	permanent		= 0;
	description 	= "Jakie s� zalety Starego Obozu?";
};

FUNC INT DIA_Guy_AdOC_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Guy_Hello))
	&& (Kapitel < 4) && ((Npc_GetTrueGuild (other)==GIL_NONE) || (Npc_GetTrueGuild (other)==GIL_VLK) || (Npc_GetTrueGuild (other)==GIL_SFB))
	{
		return 1;
	};
};

FUNC VOID DIA_Guy_AdOC_Info()
{
	AI_Output (other, self,"DIA_Guy_AdOC_15_00"); //Jakie s� zalety Starego Obozu?
	AI_Output (self, other,"DIA_Guy_AdOC_03_01"); //Je�li zap�acisz Stra�nikom za ochron�, b�dziesz m�g� �y� we wzgl�dnym spokoju. Stra�nicy pilnuj�, �eby ich ludziom nie dzia�a si� krzywda.
	AI_Output (self, other,"DIA_Guy_AdOC_03_02"); //Poza tym, tylko tutaj dostaniesz towary z Zewn�trznego �wiata po przyzwoitych cenach. W innych obozach zap�acisz za nie fortun�!

	Info_ClearChoices(DIA_Guy_AdOC);
	Info_AddChoice	 (DIA_Guy_AdOC, "Chyba do�� ju� us�ysza�em o Starym Obozie." ,DIA_Guy_AdOC_BACK);
	Info_AddChoice	 (DIA_Guy_AdOC, "Jakie towary s� tu szczeg�lnie cenne?"			,DIA_Guy_AdOC_Warez);
	Info_AddChoice	 (DIA_Guy_AdOC, "A co, gdy walczy dw�ch ludzi, kt�rzy zap�acili za ochron�?"			,DIA_Guy_AdOC_Protection);
};	

func void DIA_Guy_AdOC_BACK()
{
	AI_Output (other, self,"DIA_Guy_AdOC_BACK_15_00"); //Chyba do�� ju� us�ysza�em o Starym Obozie.
	AI_Output (self, other,"DIA_Guy_AdOC_BACK_03_01"); //Podoba mi si� tutaj.
	Info_ClearChoices(DIA_Guy_AdOC);
};

func void DIA_Guy_AdOC_Warez()
{
	AI_Output (other, self,"DIA_Guy_AdOC_Warez_15_00"); //Jakie towary s� tu szczeg�lnie cenne?
	AI_Output (self, other,"DIA_Guy_AdOC_Warez_03_01"); //Wszystko, co pochodzi z Zewn�trznego �wiata: chleb, ser, boczek, ale przede wszystkim piwo i wino. W Kolonii wytwarza si� tylko t� paskudn� ry��wk�!
	AI_Output (self, other,"DIA_Guy_AdOC_Warez_03_02"); //Zawsze mo�na zarobi� na broni, a zbroje s� NIEZWYKLE kosztowne.
	AI_Output (self, other,"DIA_Guy_AdOC_Warez_03_03"); //Stra�nicy zdj�li zbroje z zabitych kr�lewskich rycerzy.
	AI_Output (self, other,"DIA_Guy_AdOC_Warez_03_04"); //Zreszt� �atwo ich rozpozna� w�a�nie po ich zbroi - tylko Stra�nicy mog� takie nosi�.
};

func void DIA_Guy_AdOC_Protection()
{
	AI_Output (other, self,"DIA_Guy_AdOC_Protection_15_00"); //A co si� dzieje, gdy walczy dw�ch ludzi, kt�rzy zap�acili za ochron�?
	AI_Output (self, other,"DIA_Guy_AdOC_Protection_03_01"); //W takiej sytuacji Stra�nicy po prostu si� przygl�daj�, czekaj�c a� jeden z walcz�cych zginie. Wtedy zabijaj� drugiego!
};

// **************************************************
// 				Advantages NewCamp
// **************************************************

INSTANCE DIA_Guy_AdNC (C_INFO)
{
	npc				= Vlk_530_Guy;
	nr				= 3;
	condition		= DIA_Guy_AdNC_Condition;
	information		= DIA_Guy_AdNC_Info;
	permanent		= 0;
	description 		= "Jakie s� zalety Nowego Obozu?";
};

FUNC INT DIA_Guy_AdNC_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Guy_Hello))
	&& (Kapitel < 4) && ((Npc_GetTrueGuild (other)==GIL_NONE) || (Npc_GetTrueGuild (other)==GIL_VLK) || (Npc_GetTrueGuild (other)==GIL_SFB))
	{
		return 1;
	};
};

FUNC VOID DIA_Guy_AdNC_Info()
{
	AI_Output (other, self,"DIA_Guy_AdNC_15_00"); //Jakie s� zalety Nowego Obozu?
	AI_Output (self, other,"DIA_Guy_AdNC_03_01"); //Je�li nie masz nic przeciwko poder�ni�temu gard�u, mo�esz tam �mia�o i��.
	AI_Output (self, other,"DIA_Guy_AdNC_03_02"); //Nie, nie jest tam a� tak �le, ale to zupe�nie inne osiedle.
	AI_Output (self, other,"DIA_Guy_AdNC_03_03"); //Tutaj o wzgl�dny porz�dek troszczy si� Gomez. W Nowym Obozie natomiast poj�cie porz�dku nie istnieje.
	AI_Output (self, other,"DIA_Guy_AdNC_03_04"); //Jedyni ludzie, kt�rzy maj� tam co� do powiedzenia to Magowie Wody. Ale oni sp�dzaj� ca�e dnie na badaniu Bariery.
};	

// **************************************************
// 				Advantages ST
// **************************************************

INSTANCE DIA_Guy_AdST (C_INFO)
{
	npc				= Vlk_530_Guy;
	nr				= 4;
	condition		= DIA_Guy_AdST_Condition;
	information		= DIA_Guy_AdST_Info;
	permanent		= 0;
	description 	= "A co przemawia za przy��czeniem si� do Sekty?";
};

FUNC INT DIA_Guy_AdST_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Guy_Hello))
	&& (Kapitel < 4) && ((Npc_GetTrueGuild (other)==GIL_NONE) || (Npc_GetTrueGuild (other)==GIL_VLK) || (Npc_GetTrueGuild (other)==GIL_SFB))
	{
		return 1;
	};
};

FUNC VOID DIA_Guy_AdST_Info()
{
	AI_Output (other, self,"DIA_Guy_AdST_15_00"); //A co przemawia za przy��czeniem si� do Sekty?
	AI_Output (self, other,"DIA_Guy_AdST_03_01"); //O to zapytaj ju� kogo� z Obozu Bractwa.
	AI_Output (self, other,"DIA_Guy_AdST_03_02"); //Kilku ich Nowicjuszy zawsze kr�ci si� po obozie. Jestem pewien, �e udziel� ci wyczerpuj�cych informacji.
	AI_Output (self, other,"DIA_Guy_AdST_03_03"); //Osobi�cie nigdy tam nie by�em, ale je�li wierzy� we wszystko, co o nich m�wi�, musz� by� bardzo hojni.
	AI_Output (self, other,"DIA_Guy_AdST_03_04"); //Ze wszystkich trzech osiedli chyba naj�atwiej zosta� cz�onkiem obozu na bagnie.
};

//========================================
//-- Advantages BD
//========================================

INSTANCE DIA_Guy_AdBD (C_INFO)
{
   npc          = Vlk_530_Guy;
   nr           = 1;
   condition    = DIA_Guy_AdBD_Condition;
   information  = DIA_Guy_AdBD_Info;
   permanent	= FALSE;
   description	= "A co mo�esz mi powiedzie� o Bandytach?";
};

FUNC INT DIA_Guy_AdBD_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Guy_Hello))
    && (kapitel < 4) && ((Npc_GetTrueGuild (other)==GIL_NONE) || (Npc_GetTrueGuild (other)==GIL_VLK) || (Npc_GetTrueGuild (other)==GIL_SFB))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Guy_AdBD_Info()
{
    AI_Output (other, self ,"DIA_Guy_AdBD_15_01"); //A co mo�esz mi powiedzie� o Bandytach?
    AI_Output (self, other ,"DIA_Guy_AdBD_03_02"); //W�a�ciwie niezbyt wiele. Wiem tylko tyle, �e mieszkaj� w g�rach i prowadz� ma�� wojn� ze Starym Obozem.
    AI_Output (self, other ,"DIA_Guy_AdBD_03_03"); //Nie mam poj�cia, kto do nich nale�y, ani gdzie mo�esz spotka� kt�rego� z nich. Wiem jednak, �e s� to twarde skurczybyki, kt�re nie l�kaj� si� niczego.
    AI_Output (self, other ,"DIA_Guy_AdBD_03_04"); //Je�li chcesz do nich do��czy�, to nie m�w o tym nikomu w Starym Obozie. Za co� takiego sko�czysz w lochu. 
    AI_Output (other, self ,"DIA_Guy_AdBD_15_05"); //Lepiej uwa�a�. Dzi�ki. 
};

//========================================
//-----------------> OtherCamps
//========================================

INSTANCE DIA_Guy_OtherCamps (C_INFO)
{
   npc          = Vlk_530_Guy;
   nr           = 2;
   condition    = DIA_Guy_OtherCamps_Condition;
   information  = DIA_Guy_OtherCamps_Info;
   permanent	= FALSE;
   description	= "Czy w Kolonii s� jeszcze inne obozy?";
};

FUNC INT DIA_Guy_OtherCamps_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Guy_Hello))
    && (kapitel < 4) && ((Npc_GetTrueGuild (other)==GIL_NONE) || (Npc_GetTrueGuild (other)==GIL_VLK) || (Npc_GetTrueGuild (other)==GIL_SFB))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Guy_OtherCamps_Info()
{
    AI_Output (other, self ,"DIA_Guy_OtherCamps_15_01"); //Czy w Kolonii s� jeszcze inne obozy?
    AI_Output (self, other ,"DIA_Guy_OtherCamps_03_02"); //W rzeczy samej s�. Jednak nie tak pot�ne, i je�li do nich do��czysz, nie b�dziesz mia� w�a�ciwie �adnych przywilej�w. 
    AI_Output (self, other ,"DIA_Guy_OtherCamps_03_03"); //Najbli�ej od Starego Obozu znajduje si� ob�z my�liwych. Jego cz�onkowie zajmuj� si� polowaniem oraz handlem z innymi obozami. 
    AI_Output (self, other ,"DIA_Guy_OtherCamps_03_04"); //Ich ob�z znajdziesz pomi�dzy dwoma wa�nymi szlakami - obok szlaku ze Starego Obozu do Starej Kopalni, oraz drogi do Nowego Obozu.
    AI_Output (self, other ,"DIA_Guy_OtherCamps_03_05"); //Ka�dy obcy mo�e u nich pracowa�. Pono� dobrze p�ac� i oferuj� niez�e pancerze na sprzeda�.
    AI_Output (other, self ,"DIA_Guy_OtherCamps_15_06"); //A to ciekawe. Przyda�by mi si� porz�dny pancerz.
    AI_Output (self, other ,"DIA_Guy_OtherCamps_03_07"); //Innym obozem o kt�rym mi wiadomo jest ob�z �owc�w ork�w.
    AI_Output (self, other ,"DIA_Guy_OtherCamps_03_08"); //Zdaje si�, �e mieszkaj� gdzie� na terenach ork�w i trudni� si� polowaniem na nich. Jak chcesz obraca� si� w towarzystwie twardzieli, powiniene� do nich zajrze�. 
    AI_Output (self, other ,"DIA_Guy_OtherCamps_03_09"); //Poza tym w Kolonii s� jeszcze dwa obozy nale��ce do Starego i Nowego Obozu.
    AI_Output (self, other ,"DIA_Guy_OtherCamps_03_10"); //Ob�z my�liwych-najemnik�w gdzie� w okolicach Wolnej Kopalni oraz ob�z przed Star� Kopalni�.
    AI_Output (self, other ,"DIA_Guy_OtherCamps_03_11"); //Nie wiem o nich zbyt wiele, ale je�li chcesz z nimi trzyma�, musisz by� albo cz�onkiem Starego, albo Nowego Obozu. 
    AI_Output (other, self ,"DIA_Guy_OtherCamps_15_12"); //Dzi�ki za informacje.
};



// **************************************************
// 				Welche H�tte ist meine
// **************************************************

INSTANCE DIA_Guy_MyOwnHut (C_INFO)
{
	npc				= Vlk_530_Guy;
	nr				= 10;
	condition		= DIA_Guy_MyOwnHut_Condition;
	information		= DIA_Guy_MyOwnHut_Info;
	permanent		= 1;
	description 		= "Kt�r� chat� mog� zaj��?";
};

FUNC INT DIA_Guy_MyOwnHut_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Guy_Hello))
	&& (Kapitel < 4)
	{
		return 1;
	};
};

FUNC VOID DIA_Guy_MyOwnHut_Info()
{
	AI_Output (other, self,"DIA_Guy_MyOwnHut_15_00"); //Kt�r� chat� mog� zaj��?
	AI_PointAt(self, "OCR_HUT_26");
	AI_Output (self, other,"DIA_Guy_MyOwnHut_03_01"); //Tamt�, z niewielkim baldachimem.
	guysay_about_hut = true;
	AI_StopPointAt(self);
};	

//========================================
//-----------------> Ucieczka
//========================================

INSTANCE DIA_Guy_Ucieczka (C_INFO)
{
   npc          = VLK_530_Guy;
   nr           = 1;
   condition    = DIA_Guy_Ucieczka_Condition;
   information  = DIA_Guy_Ucieczka_Info;
   permanent	= FALSE;
   description	= "Co tu robisz?";
};

FUNC INT DIA_Guy_Ucieczka_Condition()
{
    if (Kapitel >= 4)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Guy_Ucieczka_Info()
{
    AI_Output (other, self ,"DIA_Guy_Ucieczka_15_01"); //Co tu robisz?
    AI_Output (self, other ,"DIA_Guy_Ucieczka_03_02"); //Uciek�em ze Starego Obozu. 
    AI_Output (self, other ,"DIA_Guy_Ucieczka_03_03"); //Gomez traci poparcie. Tyle ci powiem.
    AI_Output (self, other ,"DIA_Guy_Ucieczka_03_04"); //Zosta�o przy nim tylko kilku Stra�nik�w, kt�rych wys�a� na �mier�.
    AI_Output (self, other ,"DIA_Guy_Ucieczka_03_05"); //Powiem wi�cej.
    AI_Output (self, other ,"DIA_Guy_Ucieczka_03_06"); //Nawet Kruk uciek�. Wzi�� ze sob� Thorusa, Bloodwyna i kilku Kopaczy.
    AI_Output (other, self ,"DIA_Guy_Ucieczka_15_07"); //Gdzie mogli uciec?
    AI_Output (self, other ,"DIA_Guy_Ucieczka_03_08"); //Nie wiem. Pewnie ukryli si� gdzie� i czekaj�, a� to wszystko si� sko�czy.
    AI_Output (other, self ,"DIA_Guy_Ucieczka_15_09"); //Co masz na my�li?
    AI_Output (self, other ,"DIA_Guy_Ucieczka_03_10"); //Ostatnimi czasy wszystko tak si� skomplikowa�o, �e w ko�cu co� b�dzie musia�o p�kn��.
    AI_Output (other, self ,"DIA_Guy_Ucieczka_15_11"); //W�tpi�, �eby Bariera opad�a.
    AI_Output (self, other ,"DIA_Guy_Ucieczka_03_12"); //Ja te�. No, ale przecie� nie skocz� z klifu z tego powodu.
    AI_Output (self, other ,"DIA_Guy_Ucieczka_03_13"); //Ch�tnie wr�ci�bym do kopalni i do mojego spokojnego �ycia.
};

//========================================
//-----------------> backToMine
//========================================

INSTANCE DIA_Guy_backToMine (C_INFO)
{
   npc          = VLK_530_Guy;
   nr           = 2;
   condition    = DIA_Guy_backToMine_Condition;
   information  = DIA_Guy_backToMine_Info;
   permanent	= FALSE;
   description	= "Chcesz wr�ci� do kopalni?";
};

FUNC INT DIA_Guy_backToMine_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Guy_Ucieczka))
    && (MIS_NewEnginer == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Guy_backToMine_Info()
{
    AI_Output (other, self ,"DIA_Guy_backToMine_15_01"); //Chcesz wr�ci� do kopalni?
    AI_Output (self, other ,"DIA_Guy_backToMine_03_02"); //Oczywi�cie.
    AI_Output (other, self ,"DIA_Guy_backToMine_15_03"); //Mo�e w takim razie przy��czysz si� do Bandyt�w?
    AI_Output (other, self ,"DIA_Guy_backToMine_15_04"); //Przej�li�my Opuszczon� Kopalni� i wznowili�my wydobycie. 
    AI_Output (self, other ,"DIA_Guy_backToMine_03_05"); //Nie ma mowy! Nie chc� zosta� rozszarpany przez jakie� �cierwo!
    AI_Output (other, self ,"DIA_Guy_backToMine_15_06"); //Kopalnia jest ju� czysta.
    AI_Output (other, self ,"DIA_Guy_backToMine_15_07"); //Zaj��em si� tym.
    AI_Output (self, other ,"DIA_Guy_backToMine_03_08"); //Doprawdy?
    AI_Output (self, other ,"DIA_Guy_backToMine_03_09"); //W takim razie wyrusz� w najbli�szym czasie.
    B_LogEntry                     (CH4_NewEnginer,"Guy z ch�ci� wr�ci do pracy. Mog� powiedzie� Quentinowi, �e ma nowego robotnika.");
    B_GiveXP (100);
    AI_StopProcessInfos	(self);
};
