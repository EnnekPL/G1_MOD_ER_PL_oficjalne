// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_Jarvis_EXIT (C_INFO)
{
	npc			= Sld_728_Jarvis;
	nr			= 999;
	condition	= DIA_Jarvis_EXIT_Condition;
	information	= DIA_Jarvis_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Jarvis_EXIT_Condition()
{
	return 1;
};

FUNC VOID DIA_Jarvis_EXIT_Info()
{	
	AI_Output (self, other,"DIA_Jarvis_EXIT_08_00"); //Uwa�aj na siebie!
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 						First
// ************************************************************

INSTANCE DIA_Jarvis_First (C_INFO)
{
	npc			= Sld_728_Jarvis;
	nr			= 1;
	condition	= DIA_Jarvis_First_Condition;
	information	= DIA_Jarvis_First_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC INT DIA_Jarvis_First_Condition()
{
	return 1;
};

FUNC VOID DIA_Jarvis_First_Info()
{	
	AI_Output (self, other,"DIA_Jarvis_First_08_00"); //Chcesz przej�� przez t� bram�?
	AI_Output (other, self,"DIA_Jarvis_First_15_01"); //A spr�bujesz mnie powstrzyma�?
	AI_Output (self, other,"DIA_Jarvis_First_08_02"); //Nie, ale powiniene� wiedzie�, co ci� tam czeka. Nie jeste� w Starym Obozie, ani w�r�d tych nawiedzonych �wir�w!
	AI_Output (other, self,"DIA_Jarvis_First_15_03"); //No i co mnie tam czeka?
	AI_Output (self, other,"DIA_Jarvis_First_08_04"); //Tutaj nie ma Cieni ani �wi�tynnych Stra�nik�w, kt�rzy wyci�gn� ci� z k�opot�w. W Nowym Obozie ka�dy musi radzi� sobie sam. Tylko my - Najemnicy - trzymamy si� razem.
};

// ************************************************************
// 						S�ldner
// ************************************************************

INSTANCE DIA_Jarvis_SldInfo (C_INFO)
{
	npc			= Sld_728_Jarvis;
	nr			= 1;
	condition	= DIA_Jarvis_SldInfo_Condition;
	information	= DIA_Jarvis_SldInfo_Info;
	permanent	= 0;
	description	= "Czym zajmuj� si� Najemnicy?";
};                       

FUNC INT DIA_Jarvis_SldInfo_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Jarvis_First))
	{
		return 1;
	};
};

FUNC VOID DIA_Jarvis_SldInfo_Info()
{	
	AI_Output (other, self,"DIA_Jarvis_SldInfo_15_00"); //Czym zajmuj� si� Najemnicy?
	AI_Output (self, other,"DIA_Jarvis_SldInfo_08_01"); //Jeste�my �o�nierzami w s�u�bie Mag�w Wody.
	AI_Output (self, other,"DIA_Jarvis_SldInfo_08_02"); //Naszym celem jest wyrwanie si� z tej przekl�tej Kolonii. Musimy ci�ko pracowa�, bo nie chcieli�my i�� na �atwizn�, jak Magnaci ze Starego Obozu, kt�rzy �eruj� na niewolniczej pracy Kopaczy.
	AI_Output (self, other,"DIA_Jarvis_SldInfo_08_03"); //I wszyscy jeste�my pos�uszni Lee. To wspania�y cz�owiek. Tylko dzi�ki niemu ten cholerny ob�z jeszcze si� nie rozpad�.
};

// ************************************************************
// 						Magier
// ************************************************************

INSTANCE DIA_Jarvis_Magier (C_INFO)
{
	npc			= Sld_728_Jarvis;
	nr			= 2;
	condition	= DIA_Jarvis_Magier_Condition;
	information	= DIA_Jarvis_Magier_Info;
	permanent	= 0;
	description	= "Co robi� magowie?";
};                       

FUNC INT DIA_Jarvis_Magier_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Jarvis_SldInfo))
	{
		return 1;
	};
};

FUNC VOID DIA_Jarvis_Magier_Info()
{	
	AI_Output (other, self,"DIA_Jarvis_Magier_15_00"); //Co robi� magowie?
	AI_Output (self, other,"DIA_Jarvis_Magier_08_01"); //Badaj� magiczne w�a�ciwo�ci wydobywanej przez Krety rudy.
	AI_Output (self, other,"DIA_Jarvis_Magier_08_02"); //O ile si� orientuj�, zamierzaj� wysadzi� w powietrze ca�y ten piekielny kopiec i zniszczy� Barier�.
	AI_Output (other, self,"DIA_Jarvis_Magier_15_03"); //To chyba niebezpiecznie.
	AI_Output (self, other,"DIA_Jarvis_Magier_08_04"); //Magowie twierdz�, �e nie mamy si� czego obawia�.
};

// ************************************************************
// 						Erzhaufen
// ************************************************************

INSTANCE DIA_Jarvis_Erzhaufen (C_INFO)
{
	npc			= Sld_728_Jarvis;
	nr			= 2;
	condition	= DIA_Jarvis_Erzhaufen_Condition;
	information	= DIA_Jarvis_Erzhaufen_Info;
	permanent	= 0;
	description	= "Macie tutaj wielk� ha�d� rudy?";
};                       

FUNC INT DIA_Jarvis_Erzhaufen_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Jarvis_Magier))
	{
		return 1;
	};
};

FUNC VOID DIA_Jarvis_Erzhaufen_Info()
{	
	AI_Output (other, self,"DIA_Jarvis_Erzhaufen_15_00"); //Macie tutaj wielk� ha�d� rudy?
	AI_Output (self, other,"DIA_Jarvis_Erzhaufen_08_01"); //Aha, mo�na tak powiedzie�. Za tak� ilo�� rudy Rhobar sprzeda�by w�asn� �on�.
	AI_Output (self, other,"DIA_Jarvis_Erzhaufen_08_02"); //Ale my mamy gdzie� tego starego pierdziela. Chcemy si� st�d wydosta�!
};

// ************************************************************
// 						Wo Haufen
// ************************************************************

INSTANCE DIA_Jarvis_WoHaufen (C_INFO)
{
	npc			= Sld_728_Jarvis;
	nr			= 2;
	condition	= DIA_Jarvis_WoHaufen_Condition;
	information	= DIA_Jarvis_WoHaufen_Info;
	permanent	= 0;
	description	= "Gdzie jest ten kopiec?";
};                       

FUNC INT DIA_Jarvis_WoHaufen_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Jarvis_Erzhaufen))
	{
		return 1;
	};
};

FUNC VOID DIA_Jarvis_WoHaufen_Info()
{	
	AI_Output (other, self,"DIA_Jarvis_WoHaufen_15_00"); //Gdzie jest ten kopiec?
	AI_Output (self, other,"DIA_Jarvis_WoHaufen_08_01"); //Chcesz zobaczy� wielk� g�r� rudy, co? Na �rodku jaskini jest dziura. Tam wszystko zrzucaj�.
	AI_Output (self, other,"DIA_Jarvis_WoHaufen_08_02"); //Ale nie pozwol� ci si� do niej zbli�y�, m�wi� ci. Magowie i nasi ludzie pilnuj� rudy dniem i noc�.
	AI_Output (other, self,"DIA_Jarvis_WoHaufen_15_03"); //Pyta�em z ciekawo�ci.
};

// ************************************************************
// 						Rest
// ************************************************************

INSTANCE DIA_Jarvis_Rest (C_INFO)
{
	npc			= Sld_728_Jarvis;
	nr			= 3;
	condition	= DIA_Jarvis_Rest_Condition;
	information	= DIA_Jarvis_Rest_Info;
	permanent	= 0;
	description	= "A co z innymi lud�mi?";
};                       

FUNC INT DIA_Jarvis_Rest_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Jarvis_First))
	{
		return 1;
	};
};

FUNC VOID DIA_Jarvis_Rest_Info()
{	
	AI_Output (other, self,"DIA_Jarvis_Rest_15_00"); //A co z innymi lud�mi?
	AI_Output (self, other,"DIA_Jarvis_Rest_08_01"); //Szumowiny, bez wyj�tku. Maj� gdzie� ten Ob�z. Ju� wola�bym, �eby byle zbieracze ry�u pilnowali bramy.
};

// ************************************************************
// 						PERM
// ************************************************************

INSTANCE DIA_Jarvis_PERM (C_INFO)
{
	npc			= Sld_728_Jarvis;
	nr			= 10;
	condition	= DIA_Jarvis_PERM_Condition;
	information	= DIA_Jarvis_PERM_Info;
	permanent	= 1;
	description	= "Co s�ycha� w Obozie?";
};                       

FUNC INT DIA_Jarvis_PERM_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Jarvis_Magier))
	{
		return 1;
	};
};

FUNC VOID DIA_Jarvis_PERM_Info()
{	
AI_Output (other, self,"DIA_Jarvis_PERM_15_00"); //Co s�ycha� w Obozie?
if (kapitel <= 2)
{
	AI_Output (self, other,"DIA_Jarvis_PERM_08_01"); //Krety nadal pracuj�. Kiedy uzbieraj� do�� rudy, wysadzimy j� w powietrze.
	} 
	else if (kapitel == 3)
	{
	AI_Output (self, other,"DIA_Jarvis_PERM_08_02"); //Ostatnio dobiegaj� nas pog�oski o dziwnych wydarzeniach maj�cych miejsce w Bractwie. Mam nadzieje, �e nie odbije si� to na mieszka�cach Kolonii.
	}
	else if (kapitel == 4)
	{
	AI_Output (self, other,"DIA_Jarvis_PERM_08_03"); //Te sukinsyny ze Starego Obozu zaatakowa�y Woln� Kopalnie. Jeszcze tego po�a�uj�!
	}
	else if (kapitel >= 5)
	{
	AI_Output (self, other,"DIA_Jarvis_PERM_08_04"); //Wolna Kopalnia znowu jest w naszych r�kach. Jednak niech Gomez nie my�li, �e ujdzie mu to p�azem. Wkr�tce Stary Ob�z sp�ynie krwi� Magnat�w.
	};
};

/*------------------------------------------------------------------------
//							S�LDNERAUFNAHME									//
------------------------------------------------------------------------*/
instance Sld_728_Jarvis_AUFNAHMESOLDIER (C_INFO)
{
	npc				= Sld_728_Jarvis;
	condition		= Sld_728_Jarvis_AUFNAHMESOLDIER_Condition;
	information		= Sld_728_Jarvis_AUFNAHMESOLDIER_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  Sld_728_Jarvis_AUFNAHMESOLDIER_Condition()
{	
	if ( Npc_GetTrueGuild  (hero) == GIL_ORG) 
	&& ( (Npc_HasItems (hero, ItAt_Crawlerqueen) >= 1) || (CorKalom_BringMCQBalls == LOG_SUCCESS) )
	&& (Npc_GetDistToNpc (hero,self) < 1000)
	{
		return TRUE;
	};
};
func void  Sld_728_Jarvis_AUFNAHMESOLDIER_Info()
{
	AI_GotoNpc (hero,self); 
	AI_Output (self, other,"Sld_728_Jarvis_AUFNAHMESOLDIER_Info_08_01"); //Hej, s�ysza�em, �e nie�le da�e� popali� pe�zaczom z kopalni!
	AI_Output (self, other,"Sld_728_Jarvis_AUFNAHMESOLDIER_Info_08_02"); //Lee pewnie zgodzi si� przyj�� ci� do Najemnik�w. Powiniene� z nim pogada�.

	self.flags = 0;		// Immortal-Flag l�schen

	Log_CreateTopic (GE_BecomeMercenary,LOG_NOTE);
	B_LogEntry (GE_BecomeMercenary,"Powinienem porozmawia� z Lee. Mo�e pozwoli mi do��czy� do Najemnik�w.");
};

///////////////////////////////////////////////////////////////////////////////////////////
// __MOD DIALOGS
//	////////  ////////
//  //        //    //
//  //////    //////
//  //        //   //
//  ///////// //    //
///////////////////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////
// �CIE�KA KRETA 
///////////////////////////////////////////////

//========================================
//-----------------> JointCamp
//========================================

INSTANCE DIA_Jarvis_JointCamp (C_INFO)
{
   npc          = Sld_728_Jarvis;
   nr           = 1;
   condition    = DIA_Jarvis_JointCamp_Condition;
   information  = DIA_Jarvis_JointCamp_Info;
   permanent	= FALSE;
   description	= "Mo�esz mi pom�c do��czy� do Obozu?";
};

FUNC INT DIA_Jarvis_JointCamp_Condition()
{
    if (Npc_GetTrueGuild(hero) == GIL_SFB) && (Npc_KnowsInfo(hero,DIA_Lares_OkylQuestOk))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Jarvis_JointCamp_Info()
{
    AI_Output (other, self ,"DIA_Jarvis_JointCamp_15_01"); //Mo�esz mi pom�c do��czy� do Obozu?
    AI_Output (self, other ,"DIA_Jarvis_JointCamp_03_02"); //Ty? Chcia�by� by� cz�onkiem Obozu?
    AI_Output (self, other ,"DIA_Jarvis_JointCamp_03_03"); //Mo�e id� lepiej do kopalni?
    AI_Output (other, self ,"DIA_Jarvis_JointCamp_15_04"); //Nie. Lares powiedzia�, �e mo�esz mi pom�c.
    AI_Output (self, other ,"DIA_Jarvis_JointCamp_03_05"); //Je�li tak stawiasz spraw�...
    AI_Output (self, other ,"DIA_Jarvis_JointCamp_03_06"); //W Obozie obowi�zuje zasada: je�eli poprze ci� przynajmniej czterech Najemnik�w, to jeste� przyj�ty.
    AI_Output (self, other ,"DIA_Jarvis_JointCamp_03_07"); //Czeka ci� troch� pracy. Idziesz na to?
	B_LogEntry     (CH1_AwansJakoKret,"Jarvis faktycznie mo�e mi pom�c. B�d� musia� wykona� zadania dla czterech Najemnik�w.");
};

//========================================
//-----------------> Poparcie
//========================================

INSTANCE DIA_Jarvis_Poparcie (C_INFO)
{
   npc          = Sld_728_Jarvis;
   nr           = 2;
   condition    = DIA_Jarvis_Poparcie_Condition;
   information  = DIA_Jarvis_Poparcie_Info;
   permanent	= FALSE;
   description	= "Dobra. Mog� liczy� na twoje poparcie?";
};

FUNC INT DIA_Jarvis_Poparcie_Condition()
{
    if (Npc_GetTrueGuild(hero) == GIL_SFB)
    && (Npc_KnowsInfo (hero, DIA_Jarvis_JointCamp))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Jarvis_Poparcie_Info()
{
    AI_Output (other, self ,"DIA_Jarvis_Poparcie_15_01"); //Dobra. Mog� liczy� na twoje poparcie?
    AI_Output (self, other ,"DIA_Jarvis_Poparcie_03_02"); //Nie tak pr�dko. Nie wszystko jest za darmo. Moje poparcie kosztuje 200 bry�ek rudy.
    AI_Output (self, other ,"DIA_Jarvis_Poparcie_03_03"); //Akurat mam problemy finansowe. Tym drobnym datkiem pomo�esz mi je rozwi�za�.
    MIS_PoparcieNC = LOG_RUNNING;

    //Log_CreateTopic            (CH1_PoparcieNC, LOG_MISSION);
    //Log_SetTopicStatus       (CH1_PoparcieNC, LOG_RUNNING);
    //B_LogEntry                     (CH1_PoparcieNC,"Jarvis powiedzia�, �e pomo�e mi do��czy� do Obozu, je�li przynios� mu 200 bry�ek rudy. Poza tym musz� sobie zjedna� jeszcze trzech innych.");
	B_LogEntry     (CH1_AwansJakoKret,"�eby uzyska� poparcie Jarvisa musz� mu po prostu zap�aci� 200 bry�ek rudy.");
};

//========================================
//-----------------> Ore200Give
//========================================

INSTANCE DIA_Jarvis_Ore200Give (C_INFO)
{
   npc          = Sld_728_Jarvis;
   nr           = 3;
   condition    = DIA_Jarvis_Ore200Give_Condition;
   information  = DIA_Jarvis_Ore200Give_Info;
   permanent	= FALSE;
   description	= "Mam 200 bry�ek rudy.";
};

FUNC INT DIA_Jarvis_Ore200Give_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Jarvis_Poparcie))
    && (MIS_PoparcieNC == LOG_RUNNING)
    && (Npc_GetTrueGuild(hero) == GIL_SFB)
	&& (Npc_HasItems(other,itminugget) >= 200)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Jarvis_Ore200Give_Info()
{
    AI_Output (other, self ,"DIA_Jarvis_Ore200Give_15_01"); //Mam 200 bry�ek rudy.
    AI_Output (self, other ,"DIA_Jarvis_Ore200Give_03_02"); //To �wietnie. Masz ju� moje poparcie.
    B_GiveInvItems (other, self, itminugget, 200);
    //B_LogEntry                     (CH1_PoparcieNC,"Zjedna�em sobie Jarvisa.");
	B_LogEntry     (CH1_AwansJakoKret,"Wp�aci�em Jarvisowi um�wiona ilo�� rudy zdobywaj�c tym samym jego szacunek.");
};

//========================================
//-----------------> KtoInny
//========================================

INSTANCE DIA_Jarvis_KtoInny (C_INFO)
{
   npc          = Sld_728_Jarvis;
   nr           = 4;
   condition    = DIA_Jarvis_KtoInny_Condition;
   information  = DIA_Jarvis_KtoInny_Info;
   permanent	= FALSE;
   description	= "Kto jeszcze mo�e mnie poprze�?";
};

FUNC INT DIA_Jarvis_KtoInny_Condition()
{
    if (Npc_GetTrueGuild(hero) == GIL_SFB)
    && (MIS_PoparcieNC == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Jarvis_KtoInny_Info()
{
    AI_Output (other, self ,"DIA_Jarvis_KtoInny_15_01"); //Kto jeszcze mo�e mnie poprze�?
    AI_Output (self, other ,"DIA_Jarvis_KtoInny_03_02"); //Powiniene� jeszcze pogada� z Gornem. Ma tu du�o do powiedzenia.
    AI_Output (self, other ,"DIA_Jarvis_KtoInny_03_03"); //Poza tym jest jeszcze Wilk i Torlof. Reszta raczej ci nie pomo�e.
    //B_LogEntry                     (CH1_PoparcieNC,"Pomoc mog� zyska� u Gorna, Torlofa i Wilka.");
	B_LogEntry     (CH1_AwansJakoKret,"Pozostali Najemnicy z kt�rymi powinienem pogada� to: Gorn, Torlof i Wilk.");
};

//========================================
//-----------------> WilkPoparl
//========================================

INSTANCE DIA_Jarvis_WilkPoparl (C_INFO)
{
   npc          = Sld_728_Jarvis;
   nr           = 2;
   condition    = DIA_Jarvis_WilkPoparl_Condition;
   information  = DIA_Jarvis_WilkPoparl_Info;
   permanent	= FALSE;
   description	= "Mam poparcie Wilka.";
};

FUNC INT DIA_Jarvis_WilkPoparl_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Wolf_FindSword))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Jarvis_WilkPoparl_Info()
{
    AI_Output (other, self ,"DIA_Jarvis_WilkPoparl_15_01"); //Mam poparcie Wilka.
    AI_Output (self, other ,"DIA_Jarvis_WilkPoparl_03_02"); //S�ysza�em, �e znalaz�e� jego w�asno��. Bardzo ci� zachwala�.
};


//========================================
//-----------------> TorlofPoprze
//========================================

INSTANCE DIA_Jarvis_TorlofPoprze (C_INFO)
{
   npc          = Sld_728_Jarvis;
   nr           = 2;
   condition    = DIA_Jarvis_TorlofPoprze_Condition;
   information  = DIA_Jarvis_TorlofPoprze_Info;
   permanent	= FALSE;
   description	= "Torlof mnie poprze!";
};

FUNC INT DIA_Jarvis_TorlofPoprze_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Torlof_WiemOBuncie))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Jarvis_TorlofPoprze_Info()
{
    AI_Output (other, self ,"DIA_Jarvis_TorlofPoprze_15_01"); //Torlof mnie poprze!
    AI_Output (self, other ,"DIA_Jarvis_TorlofPoprze_03_02"); //Zabi�e� Lewusa i Ry�owego Ksi�cia. Wiele os�b si� teraz ciebie boi!
    AI_Output (other, self ,"DIA_Jarvis_TorlofPoprze_15_03"); //Po trupach do celu.
};

//========================================
//-----------------> GornPoprze
//========================================

INSTANCE DIA_Jarvis_GornPoprze (C_INFO)
{
   npc          = Sld_728_Jarvis;
   nr           = 3;
   condition    = DIA_Jarvis_GornPoprze_Condition;
   information  = DIA_Jarvis_GornPoprze_Info;
   permanent	= FALSE;
   description	= "Gorn jest za mn�.";
};

FUNC INT DIA_Jarvis_GornPoprze_Condition()
{
    if (przypakuj_Gorn == false)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Jarvis_GornPoprze_Info()
{
    AI_Output (other, self ,"DIA_Jarvis_GornPoprze_15_01"); //Gorn jest za mn�.
    AI_Output (self, other ,"DIA_Jarvis_GornPoprze_03_02"); //To �wietnie. 
};

//========================================
//-----------------> LikeIt
//========================================

INSTANCE DIA_Jarvis_LikeIt (C_INFO)
{
   npc          = Sld_728_Jarvis;
   nr           = 4;
   condition    = DIA_Jarvis_LikeIt_Condition;
   information  = DIA_Jarvis_LikeIt_Info;
   permanent	= FALSE;
   description	= "Chyba jestem ju� dosy� lubiany.";
};

FUNC INT DIA_Jarvis_LikeIt_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Jarvis_GornPoprze))
    && (Npc_KnowsInfo (hero, DIA_Jarvis_TorlofPoprze))
    && (Npc_KnowsInfo (hero, DIA_Jarvis_WilkPoparl))
	&& (Npc_KnowsInfo (hero, DIA_Jarvis_Ore200Give))
    && (MIS_PoparcieNC == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Jarvis_LikeIt_Info()
{
    AI_Output (other, self ,"DIA_Jarvis_LikeIt_15_01"); //Chyba jestem ju� dosy� lubiany.
    AI_Output (self, other ,"DIA_Jarvis_LikeIt_03_02"); //Masz racj�. Id� do Laresa. Powinien ci� przyj��.


	var C_NPC lares; lares = Hlp_GetNpc(Org_801_Lares);
	Lares.aivar [AIV_FINDABLE]=TRUE;
	
	MordragKO_StayAtNC = TRUE;
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(Org_826_Mordrag,"START");
	
    //B_LogEntry                     (CH1_PoparcieNC,"Mog� ju� porozmawia� z Laresem. To przyw�dca Szkodnik�w. Mam nadziej�, �e wszystko si� uda.");
	B_LogEntry     (CH1_AwansJakoKret,"Zdoby�em poparcie Najemnik�w. Mog� �mia�o wr�ci� do Laresa.");
    B_GiveXP (300);
};

// ***
////////////////////////////////////////////////////////

//========================================
//-----------------> PoBuncie
//========================================

INSTANCE DIA_Jarvis_PoBuncie (C_INFO)
{
   npc          = Sld_728_Jarvis;
   nr           = 1;
   condition    = DIA_Jarvis_PoBuncie_Condition;
   information  = DIA_Jarvis_PoBuncie_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Jarvis_PoBuncie_Condition()
{
	if (Npc_IsDead(Bau_900_Ricelord))
    && (Npc_IsDead(ORG_844_Lefty))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Jarvis_PoBuncie_Info()
{
    AI_Output (self, other ,"DIA_Jarvis_PoBuncie_03_01"); //No nie�le, ch�opcze. Rozjeba�e� nam p� Obozu.
    AI_Output (other, self ,"DIA_Jarvis_PoBuncie_15_02"); //Tak ju� mam.
    AI_Output (self, other ,"DIA_Jarvis_PoBuncie_03_03"); //Id� to wszystko ogarn��, bo ci zbieracze zaraz p�jd� na Lee, albo Gomeza.
    AI_Output (other, self ,"DIA_Jarvis_PoBuncie_15_04"); //Miejmy nadziej�, �e nie.
	//exp
    B_GiveXP (100);
	//jarvis
	Npc_ExchangeRoutine (Sld_728_Jarvis,"boss");
	AI_StopProcessInfos	(Sld_728_Jarvis);
	//zbieracze
	Npc_ExchangeRoutine (BAU_928_Bauer,"start");
	Npc_ExchangeRoutine (BAU_916_Bauer,"start");
	Npc_ExchangeRoutine (BAU_923_Bauer,"start");
	Npc_ExchangeRoutine (BAU_907_Bauer,"start");
	Npc_ExchangeRoutine (BAU_904_Bauer,"start");
	Npc_ExchangeRoutine (BAU_903_Rufus,"start");
    
};

////////////////////////////////////////////
// ROZDZIA� 4 OPUSZCZONA Kopalnia
// DIALOG POBOCZNY nieistotny
///////////////////////////////////////////

//========================================
//-----------------> Wiateryyyyy
//========================================

INSTANCE DIA_Jarvis_Wiateryyyyy (C_INFO)
{
   npc          = Sld_728_Jarvis;
   nr           = 1;
   condition    = DIA_Jarvis_Wiateryyyyy_Condition;
   information  = DIA_Jarvis_Wiateryyyyy_Info;
   permanent	= FALSE;
   description	= "Jakie wiatry was tu przywia�y?";
};

FUNC INT DIA_Jarvis_Wiateryyyyy_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Cord_SpottedNearMine))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Jarvis_Wiateryyyyy_Info()
{
    AI_Output (other, self ,"DIA_Jarvis_Wiateryyyyy_15_01"); //Jakie wiatry was tu przywia�y?
    AI_Output (self, other ,"DIA_Jarvis_Wiateryyyyy_03_02"); //Przys�a� nas Lee. Obawia� si� o twoje �ycie.
    AI_Output (self, other ,"DIA_Jarvis_Wiateryyyyy_03_03"); //Gdy tu przyszli�my, roi�o si� tu od zombie i szkielet�w!
    AI_Output (self, other ,"DIA_Jarvis_Wiateryyyyy_03_04"); //Szybko si� z nimi uporali�my, jednak skazali�my ci� na straty. 
    AI_Output (self, other ,"DIA_Jarvis_Wiateryyyyy_03_05"); //Postanowili�my, �e zastawimy wej�cie do kopalni, by ju� nikt wi�cej tam nie poleg�.
    AI_Output (other, self ,"DIA_Jarvis_Wiateryyyyy_15_06"); //No nie�le by�cie mnie udupili! 
    AI_Output (self, other ,"DIA_Jarvis_Wiateryyyyy_03_07"); //Na szcz�cie masz �wietne wyczucie czasu.
};