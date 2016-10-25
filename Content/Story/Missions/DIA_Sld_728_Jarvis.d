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
	AI_Output (self, other,"DIA_Jarvis_EXIT_08_00"); //Uwa¿aj na siebie!
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
	AI_Output (self, other,"DIA_Jarvis_First_08_00"); //Chcesz przejœæ przez tê bramê?
	AI_Output (other, self,"DIA_Jarvis_First_15_01"); //A spróbujesz mnie powstrzymaæ?
	AI_Output (self, other,"DIA_Jarvis_First_08_02"); //Nie, ale powinieneœ wiedzieæ, co ciê tam czeka. Nie jesteœ w Starym Obozie, ani wœród tych nawiedzonych œwirów!
	AI_Output (other, self,"DIA_Jarvis_First_15_03"); //No i co mnie tam czeka?
	AI_Output (self, other,"DIA_Jarvis_First_08_04"); //Tutaj nie ma Cieni ani Œwi¹tynnych Stra¿ników, którzy wyci¹gn¹ ciê z k³opotów. W Nowym Obozie ka¿dy musi radziæ sobie sam. Tylko my - Najemnicy - trzymamy siê razem.
};

// ************************************************************
// 						Söldner
// ************************************************************

INSTANCE DIA_Jarvis_SldInfo (C_INFO)
{
	npc			= Sld_728_Jarvis;
	nr			= 1;
	condition	= DIA_Jarvis_SldInfo_Condition;
	information	= DIA_Jarvis_SldInfo_Info;
	permanent	= 0;
	description	= "Czym zajmuj¹ siê Najemnicy?";
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
	AI_Output (other, self,"DIA_Jarvis_SldInfo_15_00"); //Czym zajmuj¹ siê Najemnicy?
	AI_Output (self, other,"DIA_Jarvis_SldInfo_08_01"); //Jesteœmy ¿o³nierzami w s³u¿bie Magów Wody.
	AI_Output (self, other,"DIA_Jarvis_SldInfo_08_02"); //Naszym celem jest wyrwanie siê z tej przeklêtej Kolonii. Musimy ciê¿ko pracowaæ, bo nie chcieliœmy iœæ na ³atwiznê, jak Magnaci ze Starego Obozu, którzy ¿eruj¹ na niewolniczej pracy Kopaczy.
	AI_Output (self, other,"DIA_Jarvis_SldInfo_08_03"); //I wszyscy jesteœmy pos³uszni Lee. To wspania³y cz³owiek. Tylko dziêki niemu ten cholerny obóz jeszcze siê nie rozpad³.
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
	description	= "Co robi¹ magowie?";
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
	AI_Output (other, self,"DIA_Jarvis_Magier_15_00"); //Co robi¹ magowie?
	AI_Output (self, other,"DIA_Jarvis_Magier_08_01"); //Badaj¹ magiczne w³aœciwoœci wydobywanej przez Krety rudy.
	AI_Output (self, other,"DIA_Jarvis_Magier_08_02"); //O ile siê orientujê, zamierzaj¹ wysadziæ w powietrze ca³y ten piekielny kopiec i zniszczyæ Barierê.
	AI_Output (other, self,"DIA_Jarvis_Magier_15_03"); //To chyba niebezpiecznie.
	AI_Output (self, other,"DIA_Jarvis_Magier_08_04"); //Magowie twierdz¹, ¿e nie mamy siê czego obawiaæ.
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
	description	= "Macie tutaj wielk¹ ha³dê rudy?";
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
	AI_Output (other, self,"DIA_Jarvis_Erzhaufen_15_00"); //Macie tutaj wielk¹ ha³dê rudy?
	AI_Output (self, other,"DIA_Jarvis_Erzhaufen_08_01"); //Aha, mo¿na tak powiedzieæ. Za tak¹ iloœæ rudy Rhobar sprzeda³by w³asn¹ ¿onê.
	AI_Output (self, other,"DIA_Jarvis_Erzhaufen_08_02"); //Ale my mamy gdzieœ tego starego pierdziela. Chcemy siê st¹d wydostaæ!
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
	AI_Output (self, other,"DIA_Jarvis_WoHaufen_08_01"); //Chcesz zobaczyæ wielk¹ górê rudy, co? Na œrodku jaskini jest dziura. Tam wszystko zrzucaj¹.
	AI_Output (self, other,"DIA_Jarvis_WoHaufen_08_02"); //Ale nie pozwol¹ ci siê do niej zbli¿yæ, mówiê ci. Magowie i nasi ludzie pilnuj¹ rudy dniem i noc¹.
	AI_Output (other, self,"DIA_Jarvis_WoHaufen_15_03"); //Pyta³em z ciekawoœci.
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
	description	= "A co z innymi ludŸmi?";
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
	AI_Output (other, self,"DIA_Jarvis_Rest_15_00"); //A co z innymi ludŸmi?
	AI_Output (self, other,"DIA_Jarvis_Rest_08_01"); //Szumowiny, bez wyj¹tku. Maj¹ gdzieœ ten Obóz. Ju¿ wola³bym, ¿eby byle zbieracze ry¿u pilnowali bramy.
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
	description	= "Co s³ychaæ w Obozie?";
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
AI_Output (other, self,"DIA_Jarvis_PERM_15_00"); //Co s³ychaæ w Obozie?
if (kapitel <= 2)
{
	AI_Output (self, other,"DIA_Jarvis_PERM_08_01"); //Krety nadal pracuj¹. Kiedy uzbieraj¹ doœæ rudy, wysadzimy j¹ w powietrze.
	} 
	else if (kapitel == 3)
	{
	AI_Output (self, other,"DIA_Jarvis_PERM_08_02"); //Ostatnio dobiegaj¹ nas pog³oski o dziwnych wydarzeniach maj¹cych miejsce w Bractwie. Mam nadzieje, ¿e nie odbije siê to na mieszkañcach Kolonii.
	}
	else if (kapitel == 4)
	{
	AI_Output (self, other,"DIA_Jarvis_PERM_08_03"); //Te sukinsyny ze Starego Obozu zaatakowa³y Woln¹ Kopalnie. Jeszcze tego po¿a³uj¹!
	}
	else if (kapitel >= 5)
	{
	AI_Output (self, other,"DIA_Jarvis_PERM_08_04"); //Wolna Kopalnia znowu jest w naszych rêkach. Jednak niech Gomez nie myœli, ¿e ujdzie mu to p³azem. Wkrótce Stary Obóz sp³ynie krwi¹ Magnatów.
	};
};

/*------------------------------------------------------------------------
//							SÖLDNERAUFNAHME									//
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
	AI_Output (self, other,"Sld_728_Jarvis_AUFNAHMESOLDIER_Info_08_01"); //Hej, s³ysza³em, ¿e nieŸle da³eœ popaliæ pe³zaczom z kopalni!
	AI_Output (self, other,"Sld_728_Jarvis_AUFNAHMESOLDIER_Info_08_02"); //Lee pewnie zgodzi siê przyj¹æ ciê do Najemników. Powinieneœ z nim pogadaæ.

	self.flags = 0;		// Immortal-Flag löschen

	Log_CreateTopic (GE_BecomeMercenary,LOG_NOTE);
	B_LogEntry (GE_BecomeMercenary,"Powinienem porozmawiaæ z Lee. Mo¿e pozwoli mi do³¹czyæ do Najemników.");
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
// ŒCIE¯KA KRETA 
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
   description	= "Mo¿esz mi pomóc do³¹czyæ do Obozu?";
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
    AI_Output (other, self ,"DIA_Jarvis_JointCamp_15_01"); //Mo¿esz mi pomóc do³¹czyæ do Obozu?
    AI_Output (self, other ,"DIA_Jarvis_JointCamp_03_02"); //Ty? Chcia³byœ byæ cz³onkiem Obozu?
    AI_Output (self, other ,"DIA_Jarvis_JointCamp_03_03"); //Mo¿e idŸ lepiej do kopalni?
    AI_Output (other, self ,"DIA_Jarvis_JointCamp_15_04"); //Nie. Lares powiedzia³, ¿e mo¿esz mi pomóc.
    AI_Output (self, other ,"DIA_Jarvis_JointCamp_03_05"); //Jeœli tak stawiasz sprawê...
    AI_Output (self, other ,"DIA_Jarvis_JointCamp_03_06"); //W Obozie obowi¹zuje zasada: je¿eli poprze ciê przynajmniej czterech Najemników, to jesteœ przyjêty.
    AI_Output (self, other ,"DIA_Jarvis_JointCamp_03_07"); //Czeka ciê trochê pracy. Idziesz na to?
	B_LogEntry     (CH1_AwansJakoKret,"Jarvis faktycznie mo¿e mi pomóc. Bêdê musia³ wykonaæ zadania dla czterech Najemników.");
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
   description	= "Dobra. Mogê liczyæ na twoje poparcie?";
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
    AI_Output (other, self ,"DIA_Jarvis_Poparcie_15_01"); //Dobra. Mogê liczyæ na twoje poparcie?
    AI_Output (self, other ,"DIA_Jarvis_Poparcie_03_02"); //Nie tak prêdko. Nie wszystko jest za darmo. Moje poparcie kosztuje 200 bry³ek rudy.
    AI_Output (self, other ,"DIA_Jarvis_Poparcie_03_03"); //Akurat mam problemy finansowe. Tym drobnym datkiem pomo¿esz mi je rozwi¹zaæ.
    MIS_OpinionInNewCamp = LOG_RUNNING;

    //Log_CreateTopic            (CH1_OpinionInNewCamp, LOG_MISSION);
    //Log_SetTopicStatus       (CH1_OpinionInNewCamp, LOG_RUNNING);
    //B_LogEntry                     (CH1_OpinionInNewCamp,"Jarvis powiedzia³, ¿e pomo¿e mi do³¹czyæ do Obozu, jeœli przyniosê mu 200 bry³ek rudy. Poza tym muszê sobie zjednaæ jeszcze trzech innych.");
	B_LogEntry     (CH1_AwansJakoKret,"¯eby uzyskaæ poparcie Jarvisa muszê mu po prostu zap³aciæ 200 bry³ek rudy.");
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
   description	= "Mam 200 bry³ek rudy.";
};

FUNC INT DIA_Jarvis_Ore200Give_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Jarvis_Poparcie))
    && (MIS_OpinionInNewCamp == LOG_RUNNING)
    && (Npc_GetTrueGuild(hero) == GIL_SFB)
	&& (Npc_HasItems(other,itminugget) >= 200)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Jarvis_Ore200Give_Info()
{
    AI_Output (other, self ,"DIA_Jarvis_Ore200Give_15_01"); //Mam 200 bry³ek rudy.
    AI_Output (self, other ,"DIA_Jarvis_Ore200Give_03_02"); //To œwietnie. Masz ju¿ moje poparcie.
    B_GiveInvItems (other, self, itminugget, 200);
    //B_LogEntry                     (CH1_OpinionInNewCamp,"Zjedna³em sobie Jarvisa.");
	B_LogEntry     (CH1_AwansJakoKret,"Wp³aci³em Jarvisowi umówiona iloœæ rudy zdobywaj¹c tym samym jego szacunek.");
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
   description	= "Kto jeszcze mo¿e mnie poprzeæ?";
};

FUNC INT DIA_Jarvis_KtoInny_Condition()
{
    if (Npc_GetTrueGuild(hero) == GIL_SFB)
    && (MIS_OpinionInNewCamp == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Jarvis_KtoInny_Info()
{
    AI_Output (other, self ,"DIA_Jarvis_KtoInny_15_01"); //Kto jeszcze mo¿e mnie poprzeæ?
    AI_Output (self, other ,"DIA_Jarvis_KtoInny_03_02"); //Powinieneœ jeszcze pogadaæ z Gornem. Ma tu du¿o do powiedzenia.
    AI_Output (self, other ,"DIA_Jarvis_KtoInny_03_03"); //Poza tym jest jeszcze Wilk i Torlof. Reszta raczej ci nie pomo¿e.
    //B_LogEntry                     (CH1_OpinionInNewCamp,"Pomoc mogê zyskaæ u Gorna, Torlofa i Wilka.");
	B_LogEntry     (CH1_AwansJakoKret,"Pozostali Najemnicy z którymi powinienem pogadaæ to: Gorn, Torlof i Wilk.");
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
    AI_Output (self, other ,"DIA_Jarvis_WilkPoparl_03_02"); //S³ysza³em, ¿e znalaz³eœ jego w³asnoœæ. Bardzo ciê zachwala³.
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
    if (MIS_TorlofsAxe == LOG_SUCCESS)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Jarvis_TorlofPoprze_Info()
{
    AI_Output (other, self ,"DIA_Jarvis_TorlofPoprze_15_01"); //Torlof mnie poprze!
    AI_Output (self, other ,"DIA_Jarvis_TorlofPoprze_03_02"); //Zabi³eœ Lewusa i Ry¿owego Ksiêcia. Wiele osób siê teraz ciebie boi!
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
   description	= "Gorn jest za mn¹.";
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
    AI_Output (other, self ,"DIA_Jarvis_GornPoprze_15_01"); //Gorn jest za mn¹.
    AI_Output (self, other ,"DIA_Jarvis_GornPoprze_03_02"); //To œwietnie. 
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
   description	= "Chyba jestem ju¿ dosyæ lubiany.";
};

FUNC INT DIA_Jarvis_LikeIt_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Jarvis_GornPoprze))
    && (Npc_KnowsInfo (hero, DIA_Jarvis_TorlofPoprze))
    && (Npc_KnowsInfo (hero, DIA_Jarvis_WilkPoparl))
	&& (Npc_KnowsInfo (hero, DIA_Jarvis_Ore200Give))
    && (MIS_OpinionInNewCamp == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Jarvis_LikeIt_Info()
{
    AI_Output (other, self ,"DIA_Jarvis_LikeIt_15_01"); //Chyba jestem ju¿ dosyæ lubiany.
    AI_Output (self, other ,"DIA_Jarvis_LikeIt_03_02"); //Masz racjê. IdŸ do Laresa. Powinien ciê przyj¹æ.


	var C_NPC lares; lares = Hlp_GetNpc(Org_801_Lares);
	Lares.aivar [AIV_FINDABLE]=TRUE;
	
	MordragKO_StayAtNC = TRUE;
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(Org_826_Mordrag,"START");
	
    //B_LogEntry                     (CH1_OpinionInNewCamp,"Mogê ju¿ porozmawiaæ z Laresem. To przywódca Szkodników. Mam nadziejê, ¿e wszystko siê uda.");
	B_LogEntry     (CH1_AwansJakoKret,"Zdoby³em poparcie Najemników. Mogê œmia³o wróciæ do Laresa.");
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
    AI_Output (self, other ,"DIA_Jarvis_PoBuncie_03_01"); //No nieŸle, ch³opcze. Rozjeba³eœ nam pó³ Obozu.
    AI_Output (other, self ,"DIA_Jarvis_PoBuncie_15_02"); //Tak ju¿ mam.
    AI_Output (self, other ,"DIA_Jarvis_PoBuncie_03_03"); //Idê to wszystko ogarn¹æ, bo ci zbieracze zaraz pójd¹ na Lee, albo Gomeza.
    AI_Output (other, self ,"DIA_Jarvis_PoBuncie_15_04"); //Miejmy nadziejê, ¿e nie.
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
// ROZDZIA£ 4 OPUSZCZONA Kopalnia
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
   description	= "Jakie wiatry was tu przywia³y?";
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
    AI_Output (other, self ,"DIA_Jarvis_Wiateryyyyy_15_01"); //Jakie wiatry was tu przywia³y?
    AI_Output (self, other ,"DIA_Jarvis_Wiateryyyyy_03_02"); //Przys³a³ nas Lee. Obawia³ siê o twoje ¿ycie.
    AI_Output (self, other ,"DIA_Jarvis_Wiateryyyyy_03_03"); //Gdy tu przyszliœmy, roi³o siê tu od zombie i szkieletów!
    AI_Output (self, other ,"DIA_Jarvis_Wiateryyyyy_03_04"); //Szybko siê z nimi uporaliœmy, jednak skazaliœmy ciê na straty. 
    AI_Output (self, other ,"DIA_Jarvis_Wiateryyyyy_03_05"); //Postanowiliœmy, ¿e zastawimy wejœcie do kopalni, by ju¿ nikt wiêcej tam nie poleg³.
    AI_Output (other, self ,"DIA_Jarvis_Wiateryyyyy_15_06"); //No nieŸle byœcie mnie udupili! 
    AI_Output (self, other ,"DIA_Jarvis_Wiateryyyyy_03_07"); //Na szczêœcie masz œwietne wyczucie czasu.
};