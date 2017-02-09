// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_STT_331_Fingers_Exit (C_INFO)
{
	npc			= STT_331_Fingers;
	nr			= 999;
	condition	= DIA_STT_331_Fingers_Exit_Condition;
	information	= DIA_STT_331_Fingers_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_STT_331_Fingers_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_STT_331_Fingers_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 				 Schatten werden
// **************************************************
	var int Fingers_CanTeach;
// **************************************************

INSTANCE DIA_Fingers_BecomeShadow (C_INFO)
{
	npc				= STT_331_Fingers;
	nr				= 2;
	condition		= DIA_Fingers_BecomeShadow_Condition;
	information		= DIA_Fingers_BecomeShadow_Info;
	permanent		= 1;
	description		= "Chcê zostaæ Cieniem."; 
};

FUNC INT DIA_Fingers_BecomeShadow_Condition()
{	
	if ( (Fingers_CanTeach == FALSE) )
	&& ((Npc_GetTrueGuild (hero) == GIL_NONE) || (Npc_GetTrueGuild (hero) == GIL_VLK))
	//&& ((MIS_DraxTest != LOG_RUNNING) || (MIS_DraxTest != LOG_SUCCESS) || (MIS_EasyJoinOC != LOG_RUNNING) || (MIS_EasyJoinOC != LOG_SUCCESS))
	{
		return 1;
	};
};

FUNC VOID DIA_Fingers_BecomeShadow_Info()
{
	AI_Output (other, self,"DIA_Fingers_BecomeShadow_15_00"); //Chcê zostaæ Cieniem.
	AI_Output (self, other,"DIA_Fingers_BecomeShadow_05_01"); //I co z tego?
	Info_ClearChoices	(DIA_Fingers_BecomeShadow );
	Info_AddChoice		(DIA_Fingers_BecomeShadow,DIALOG_BACK										,DIA_Fingers_BecomeShadow_BACK);
	if (Npc_KnowsInfo(hero,Info_Diego_Teachers))
	{
		Info_AddChoice		(DIA_Fingers_BecomeShadow,"Szukam kogoœ, kto móg³by mnie czegoœ nauczyæ."	,DIA_Fingers_BecomeShadow_TeachMe);
	};
	Info_AddChoice		(DIA_Fingers_BecomeShadow,"Mo¿esz mi pomóc?"					,DIA_Fingers_BecomeShadow_AnyTips);
};

func void DIA_Fingers_BecomeShadow_BACK()
{
	Info_ClearChoices	(DIA_Fingers_BecomeShadow );
};

func void DIA_Fingers_BecomeShadow_AnyTips()
{
	AI_Output (other, self,"DIA_Fingers_BecomeShadow_AnyTips_15_00"); //Mo¿esz mi pomóc?
	AI_Output (self, other,"DIA_Fingers_BecomeShadow_AnyTips_05_01"); //Nie mam pojêcia jak to zrobiæ...
};

func void DIA_Fingers_BecomeShadow_TeachMe()
{
	AI_Output (other, self,"DIA_Fingers_BecomeShadow_TeachMe_15_00"); //Szukam kogoœ, kto móg³by mnie czegoœ nauczyæ.
	AI_Output (self, other,"DIA_Fingers_BecomeShadow_TeachMe_05_01"); //To dlaczego przyszed³eœ do mnie?
	AI_Output (other, self,"DIA_Fingers_BecomeShadow_TeachMe_15_02"); //Przys³a³ mnie Diego.
	AI_Output (self, other,"DIA_Fingers_BecomeShadow_TeachMe_05_03"); //Trzeba by³o mówiæ tak od razu.
	AI_Output (self, other,"DIA_Fingers_BecomeShadow_TeachMe_05_04"); //Jeœli chcesz do³¹czyæ do naszego obozu, powinieneœ byæ dobrym wojownikiem albo zrêcznym z³odziejem.
	AI_Output (self, other,"DIA_Fingers_BecomeShadow_TeachMe_05_05"); //Wp³ywowi ludzie z Obozu bêd¹ mieli dla ciebie ró¿ne zlecenia, podczas wykonywania których lepiej nie daæ siê z³apaæ.
	AI_Output (self, other,"DIA_Fingers_BecomeShadow_TeachMe_05_06"); //Dlatego na pocz¹tek proponowa³bym ci szkolenie siê w fachu z³odziejskim.
	AI_Output (self, other,"DIA_Fingers_BecomeShadow_TeachMe_05_07"); //Zupe³nym przypadkiem, tak siê sk³ada, ¿e jestem najlepszym z³odziejem w ca³ym Starym Obozie.
	Fingers_CanTeach = TRUE;
	Log_CreateTopic   	(GE_TeacherOC,LOG_NOTE);
	B_LogEntry			(GE_TeacherOC,"R¹czka mo¿e mnie nauczyæ otwierania zamków i kradzie¿y kieszonkowej.");
	Info_ClearChoices	(DIA_Fingers_BecomeShadow );
};

// **************************************************
// 						 Lehrer
// **************************************************
	var int Fingers_Wherecavalorn;

INSTANCE DIA_Fingers_Lehrer (C_INFO)
{
	npc				= STT_331_Fingers;
	nr				= 2;
	condition		= DIA_Fingers_Lehrer_Condition;
	information		= DIA_Fingers_Lehrer_Info;
	permanent		= 1;
	description		= "Czego mo¿esz mnie nauczyæ?"; 
};

FUNC INT DIA_Fingers_Lehrer_Condition()
{	
	if (Fingers_CanTeach == TRUE)
	{
		return 1;	
	};
};

FUNC VOID DIA_Fingers_Lehrer_Info()
{
	AI_Output (other, self,"DIA_Fingers_Lehrer_15_00"); //Czego mo¿esz mnie nauczyæ?
	AI_Output (self, other,"DIA_Fingers_Lehrer_05_02"); //To zale¿y tylko od tego, co chcia³byœ wiedzieæ.



	Info_ClearChoices	(DIA_Fingers_Lehrer);
	Info_AddChoice		(DIA_Fingers_Lehrer,DIALOG_BACK																	,DIA_Fingers_Lehrer_BACK);
if	(Npc_GetTalentSkill(hero, NPC_TALENT_PICKPOCKET) == 1) 
	{
	Info_AddChoice		(DIA_Fingers_Lehrer,B_BuildLearnString(NAME_LearnPickpocket_2	,	LPCOST_TALENT_PICKPOCKET_2,500)	,DIA_Fingers_Lehrer_Pickpocket2);
	};
	if	(Npc_GetTalentSkill(hero, NPC_TALENT_PICKPOCKET) == 0) 
	{
	Info_AddChoice		(DIA_Fingers_Lehrer,B_BuildLearnString(NAME_LearnPickpocket_1	,	LPCOST_TALENT_PICKPOCKET_1,250)	,DIA_Fingers_Lehrer_Pickpocket);
	};
	if	(Npc_GetTalentSkill(hero, NPC_TALENT_PICKLOCK) == 1) 
	{
	Info_AddChoice		(DIA_Fingers_Lehrer,B_BuildLearnString(NAME_LearnPicklock_2		,	LPCOST_TALENT_PICKLOCK_2,600)	,DIA_Fingers_Lehrer_Lockpick2);
	};
	if	(Npc_GetTalentSkill(hero, NPC_TALENT_PICKLOCK) == 0) 
	{
	Info_AddChoice		(DIA_Fingers_Lehrer,B_BuildLearnString(NAME_LearnPicklock_1		,	LPCOST_TALENT_PICKLOCK_1,300)	,DIA_Fingers_Lehrer_Lockpick);
	}; 
	if (Npc_GetTalentSkill(hero, NPC_TALENT_SNEAK) == 0) && (Fingers_Wherecavalorn == FALSE)
	{
	Info_AddChoice		(DIA_Fingers_Lehrer,"Chcia³bym umieæ poruszaæ siê niepostrze¿enie." 								,DIA_Fingers_Lehrer_Schleichen);
	};
};


func void DIA_Fingers_Lehrer_Schleichen()
{
	AI_Output (other, self,"DIA_Fingers_Lehrer_Schleichen_15_00"); //Chcia³bym umieæ poruszaæ siê niepostrze¿enie.
	AI_Output (self, other,"DIA_Fingers_Lehrer_Schleichen_05_01"); //Myœlê - bez ¿adnej fa³szywej skromnoœci - ¿e jestem jednym z najlepszych z³odziei zrzuconych do tej przeklêtej Kolonii.
	AI_Output (self, other,"DIA_Fingers_Lehrer_Schleichen_05_02"); //Ale jeœli chodzi o skradanie siê, powinieneœ porozmawiaæ z Cavalornem.
	Fingers_Wherecavalorn = TRUE;
};

func void DIA_Fingers_Lehrer_Lockpick()
{
	AI_Output (other, self,"DIA_Fingers_Lehrer_Lockpick_15_00"); //Chcia³bym nauczyæ siê otwieraæ zamki.
	if (Npc_HasItems (hero, itminugget) >=300)
	{
	if (B_GiveSkill(other, NPC_TALENT_PICKLOCK, 1, LPCOST_TALENT_PICKLOCK_1))
	{
		AI_Output (self, other,"DIA_Fingers_Lehrer_Lockpick_05_01"); //Nie w¹tpiê! Có¿... Pocz¹tki nie s¹ zbyt trudne.
		AI_Output (self, other,"DIA_Fingers_Lehrer_Lockpick_05_02"); //Przede wszystkim musisz uwa¿aæ, ¿eby nie z³amaæ wytrycha.
		AI_Output (self, other,"DIA_Fingers_Lehrer_Lockpick_05_03"); //Musisz byæ bardzo cierpliwy. Wtedy nie bêdziesz potrzebowa³ tylu wytrychów, he he!
	};
	B_GiveInvItems (hero, self, itminugget, 300);
	Npc_RemoveInvItems (self, itminugget, 300);
	}
	else
	{
	AI_Output (self, other,"DIA_Fingers_Lehrer_NOORE"); //Nie ma nic za darmo!
	};
};

func void DIA_Fingers_Lehrer_Lockpick2()
{
	AI_Output (other, self,"DIA_Fingers_Lehrer_Lockpick2_15_00"); //Chcia³bym zostaæ ekspertem w otwieraniu zamków.
	if (Npc_HasItems (hero, itminugget) >=600)
	{
	if (B_GiveSkill(other, NPC_TALENT_PICKLOCK, 2, LPCOST_TALENT_PICKLOCK_2))
	{
		AI_Output (self, other,"DIA_Fingers_Lehrer_Lockpick2_05_01"); //Gdy nabierzesz ju¿ trochê doœwiadczenia, nauczysz siê rozpoznawaæ dŸwiêk, jaki wydaje wytrych zanim pêknie.
		AI_Output (self, other,"DIA_Fingers_Lehrer_Lockpick2_05_02"); //Myœlê, ¿e powinieneœ sobie z tym poradziæ. Ws³uchaj siê uwa¿nie w dŸwiêki jakie wydaje otwierany zamek, a nie bêdziesz potrzebowa³ tylu wytrychów, he, he!
		AI_Output (self, other,"DIA_Fingers_Lehrer_Lockpick2_05_03"); //Prawdziwy mistrz w tym fachu potrafi otworzyæ ka¿d¹ skrzyniê nie ³ami¹c ani jednego wytrycha.
	};
	
	B_GiveInvItems (hero, self, itminugget, 600);
	Npc_RemoveInvItems (self, itminugget, 600);
	}
	else
	{
	AI_Output (self, other,"DIA_Fingers_Lehrer_NOORE"); //Nie ma nic za darmo!
	};
};

func void DIA_Fingers_Lehrer_Pickpocket()
{
	AI_Output (other, self,"DIA_Fingers_Lehrer_PICKPOCKET_15_00"); //Chcia³bym zostaæ zrêcznym kieszonkowcem!
	if (Npc_GetTalentSkill(other, NPC_TALENT_SNEAK) == 1)
	{
		if (Npc_HasItems (hero, itminugget) >=250)
		{
		if (B_GiveSkill(other, NPC_TALENT_PICKPOCKET, 1, LPCOST_TALENT_PICKPOCKET_1))
		{
			AI_Output (self, other,"DIA_Fingers_Lehrer_PICKPOCKET_05_01"); //Chcia³byœ odci¹¿yæ parê osób z ich dobytku, co? No dobra.
			AI_Output (self, other,"DIA_Fingers_Lehrer_PICKPOCKET_05_02"); //Poka¿ê ci na czym powinieneœ siê skoncentrowaæ, ale szanse, ¿e zostaniesz z³apany bêd¹ nadal znaczne.
			AI_Output (self, other,"DIA_Fingers_Lehrer_PICKPOCKET_05_03"); //Podejmuj ryzyko wy³¹cznie jeœli w pobli¿u ofiary nie ma osób trzecich.
			AI_Output (self, other,"DIA_Fingers_Lehrer_PICKPOCKET_05_04"); //Tylko prawdziwy mistrz potrafi ukraœæ coœ pozostaj¹c ca³kowicie niezauwa¿onym!
		};
		B_GiveInvItems (hero, self, itminugget, 250);
		Npc_RemoveInvItems (self, itminugget, 250);
		}
		else
		{
		AI_Output (self, other,"DIA_Fingers_Lehrer_NOORE"); //Nie ma nic za darmo!
		};
	}
	else
	{
		AI_Output (self, other,"DIA_Fingers_lehrer_Pickpocket_05_05"); //Nie ma o czym mówiæ! Nie bêdzie z ciebie z³odzieja, dopóki nie nauczysz siê skradaæ!
	};
};

func void DIA_Fingers_Lehrer_Pickpocket2()
{
	AI_Output (other, self,"DIA_Fingers_Lehrer_Pickpocket2_15_00"); //Chcia³bym zostaæ mistrzem kieszonkowców!
	if (Npc_HasItems (hero, itminugget) >=500)
	{
	if (B_GiveSkill(other, NPC_TALENT_PICKPOCKET, 2, LPCOST_TALENT_PICKPOCKET_2))
	{		
		AI_Output (self, other,"DIA_Fingers_Lehrer_Pickpocket2_05_01"); //Có¿, chyba rzeczywiœcie potrafisz ju¿ wystarczaj¹co du¿o, ¿eby opanowaæ zaawansowane sztuczki.
		AI_Output (self, other,"DIA_Fingers_Lehrer_Pickpocket2_05_02"); //Ale musisz pamiêtaæ, ¿e nawet mistrzowie z³odziejscy od czasu do czasu zostaj¹ z³apani.
		AI_Output (self, other,"DIA_Fingers_Lehrer_Pickpocket2_05_03"); //Uwa¿aj na siebie.
	};
		B_GiveInvItems (hero, self, itminugget, 500);
		Npc_RemoveInvItems (self, itminugget, 500);
		}
		else
		{
		AI_Output (self, other,"DIA_Fingers_Lehrer_NOORE"); //Nie ma nic za darmo!
		};
};

func VOID DIA_Fingers_Lehrer_BACK()
{
	Info_ClearChoices	( DIA_Fingers_Lehrer );
};

// **************************************************
// 					Wo Cavalorn
// **************************************************

INSTANCE DIA_Fingers_WhereCavalorn (C_INFO)
{
	npc				= STT_331_Fingers;
	nr				= 2;
	condition		= DIA_Fingers_WhereCavalorn_Condition;
	information		= DIA_Fingers_WhereCavalorn_Info;
	permanent		= 1;
	description		= "Gdzie znajdê Cavalorna?"; 
};

FUNC INT DIA_Fingers_WhereCavalorn_Condition()
{	
	if (Fingers_Wherecavalorn == TRUE)
	{
		return 1;
	};
};

FUNC VOID DIA_Fingers_WhereCavalorn_Info()
{
	AI_Output (other, self,"DIA_Fingers_WhereCavalorn_15_00"); //Gdzie znajdê Cavalorna?
	AI_Output (self, other,"DIA_Fingers_WhereCavalorn_05_01"); //Poluje gdzieœ poza Obozem. Pewnie znajdziesz go na drodze do Nowego Obozu. Na zachód st¹d jest taki kanion.
	AI_Output (self, other,"DIA_Fingers_WhereCavalorn_05_02"); //Tam znajdziesz opuszczon¹ chatê drwala. Cavalorn powinien krêciæ siê w jej pobli¿u.
	var int log_cava_fing;
	if log_cava_fing == false
	{
	Log_CreateTopic (GE_TeacherOW,	LOG_NOTE);
	B_LogEntry(GE_TeacherOW, "Cavalorn mo¿e mi pokazaæ, jak nale¿y siê skradaæ. Jego chata znajduje siê w kanionie, na zachód od Starego Obozu.");
	log_cava_fing = true;
	};
};

// **************************************************
// 					Gutes Wort
// **************************************************
	var int Fingers_Learnt;
// **************************************************

INSTANCE DIA_Fingers_Learnt (C_INFO)
{
	npc				= STT_331_Fingers;
	nr				= 2;
	condition		= DIA_Fingers_Learnt_Condition;
	information		= DIA_Fingers_Learnt_Info;
	permanent		= 1;
	description		= "Nie móg³byœ wstawiæ siê za mn¹ u Diego?"; 
};

FUNC INT DIA_Fingers_Learnt_Condition()
{	
	if ( (Fingers_Learnt != LOG_SUCCESS) )
	&& (Npc_GetTrueGuild (hero) == GIL_NONE)
	&& ((MIS_DraxTest != LOG_RUNNING) || (MIS_DraxTest != LOG_SUCCESS) || (MIS_EasyJoinOC != LOG_RUNNING) || (MIS_EasyJoinOC != LOG_SUCCESS))
	{
		return 1;
	};
};

FUNC VOID DIA_Fingers_Learnt_Info()
{
	AI_Output (other, self,"DIA_Fingers_Learnt_15_00"); //Nie móg³byœ wstawiæ siê za mn¹ u Diego?

	if (MIS_ChestAndPlate != LOG_SUCCESS)
	{
	if ( Npc_GetTalentSkill(other, NPC_TALENT_PICKLOCK)+Npc_GetTalentSkill(other, NPC_TALENT_PICKPOCKET)+Npc_GetTalentSkill(other, NPC_TALENT_SNEAK)	> 0)
	{
		AI_Output (self, other,"DIA_Fingers_Learnt_05_01"); //Czemu nie. Nauczy³eœ siê czegoœ, co czyni ciê przydatnym dla Starego Obozu.
		AI_Output (self, other,"DIA_Fingers_Learnt_05_02"); //Zrêcznych z³odziei nigdy nie za wiele. Mo¿esz na mnie liczyæ.
		Fingers_Learnt = LOG_SUCCESS;
		
		B_GiveXP (XP_Fingerstrain);
		B_LogEntry( CH1_JoinOC, "R¹czka jest bardzo zadowolony z postêpów, które poczyni³em.");
	}
	else
	{
		AI_Output (self, other,"DIA_Fingers_Learnt_05_03"); //To zale¿y...
		AI_Output (self, other,"DIA_Fingers_Learnt_05_04"); //Jeœli udowodnisz, ¿e nauczy³eœ siê czegoœ w z³odziejskim fachu, uznam, ¿e bêdzie z ciebie jakiœ po¿ytek.
		AI_Output (other, self,"DIA_Fingers_Learnt_15_05"); //Jak mam to niby zrobiæ?
		AI_Output (self, other,"DIA_Fingers_Learnt_05_06"); //Wyucz siê którejœ ze z³odziejskich umiejêtnoœci. Naucz siê skradaæ niepostrze¿enie, okradaæ ludzi albo otwieraæ zamki. Wtedy bêdziesz móg³ liczyæ na mój g³os.
		Fingers_Learnt = LOG_RUNNING;
		
		B_LogEntry( CH1_JoinOC, "R¹czka wstawi siê za mn¹, jeœli wyuczê siê jakiejœ z³odziejskiej umiejêtnoœci.");
	};
	}
	else
	{
	AI_Output (self, other,"DIA_Fingers_Learnt_05_07"); //Nie! Wybra³eœ sobie z³e towarzystwo. Wracaj do Rono i Relghara!
	DIA_Fingers_Learnt.permanent = false;
	};
};

///////////////////////////////////////////////////////////////////////////////////////////
// __MOD DIALOGS
//	////////  ////////
//  //        //    //
//  //////    //////
//  //        //   //
//  ///////// //    //
///////////////////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////////////////
// R¹czka
// Rozdzia³ 1
// Okradzenie kuriera
///////////////////////////////////////////////////////////////////////////////////////////

// **************************************************
// 					Cheat Courier
// **************************************************

INSTANCE DIA_Fingers_LorenzoCourier (C_INFO)
{
	npc				= STT_331_Fingers;
	nr				= 2;
	condition		= DIA_Fingers_LorenzoCourier_Condition;
	information		= DIA_Fingers_LorenzoCourier_Info;
	permanent		= 0;
	description		= "Potrzebny mi ostatni raport ze Starej Kopalni."; 
};

FUNC INT DIA_Fingers_LorenzoCourier_Condition()
{	
	if Npc_KnowsInfo (hero, DIA_Snaf_LookingForWorkers) && MIS_ZmianaLorenza == LOG_RUNNING && !Npc_KnowsInfo (hero, DIA_Togard_GiveFakeOre)
	{
		return 1;
	};
};

FUNC VOID DIA_Fingers_LorenzoCourier_Info()
{
	AI_Output (other, self,"DIA_Fingers_LorenzoCourier_15_00"); //Potrzebny mi ostatni raport ze Starej Kopalni.
	AI_Output (self, other,"DIA_Fingers_LorenzoCourier_05_01"); //Czy ja ci wygl¹dam na kogoœ, kto ma takie rzeczy? Zreszt¹ nie jesteœ upowa¿niony...
	AI_Output (self, other,"DIA_Fingers_LorenzoCourier_05_02"); //(chwila ciszy) A, ju¿ rozumiem. Mogê ciê nauczyæ tego i owego. 
	AI_Output (other, self,"DIA_Fingers_LorenzoCourier_15_03"); //Bêdê w stanie nauczyæ siê tego tak szybko? W koñcu Lorenzo to nie byle kto, a ja nie jestem jeszcze zbyt zrêczny. 
	AI_Output (self, other,"DIA_Fingers_LorenzoCourier_05_04"); //Myœlê, ¿e nie bêdziesz musia³ nawet rozmawiaæ z Lorenzo.
	AI_Output (other, self,"DIA_Fingers_LorenzoCourier_15_05"); //Hmm? Niby dlaczego?
	AI_Output (self, other,"DIA_Fingers_LorenzoCourier_05_06"); //A powiedz mi czemu mia³bym ci to powiedzieæ? Nie jesteœ jednym z nas, a ten raport jest bardzo wa¿ny. Pracujesz dla kogoœ z Nowego Obozu?
	AI_Output (other, self,"DIA_Fingers_LorenzoCourier_15_07"); //Naprawdê s¹dzisz, ¿e przyszed³bym wtedy do ciebie? Nie chcê sobie przyw³aszczyæ tego dokumentu. 
	AI_Output (other, self,"DIA_Fingers_LorenzoCourier_15_08"); //Chcê go przeczytaæ i jeœli bêdzie zawiera³ to, co mnie interesuje pokazaæ go jednemu Kopaczowi. PóŸniej go zwrócê.
	AI_Output (self, other,"DIA_Fingers_LorenzoCourier_05_09"); //Naprawdê s¹dzisz, ¿e siê na to nabiorê?
	AI_Output (other, self,"DIA_Fingers_LorenzoCourier_15_10"); //Mówiê powa¿nie! Ten Kopacz musi siê do³¹czyæ do nastêpnej zmiany ludzi do Kopalni. Snaf doradzi³ mi jak go przekonaæ. Chcê do was do³¹czyæ?
	AI_Output (self, other,"DIA_Fingers_LorenzoCourier_05_11"); //Có¿, s³ysza³em o tym. Zaufam ci, ale jeœli mnie ok³amujesz to i tak ciê znajdê i zabijê. Uwierz mi, ¿e Kolonia jest ma³a.
	AI_Output (other, self,"DIA_Fingers_LorenzoCourier_15_11"); //Nie ma problemu. Jestem pewny tego co mówiê.
	AI_Output (self, other,"DIA_Fingers_LorenzoCourier_05_12"); //Dobra, Lorenzo nie zanosi raportów osobiœcie. Robi to pewien m³odzieniec, mieszkaj¹cy w pobli¿u. Nazywa siê Ecker.
	AI_Output (self, other,"DIA_Fingers_LorenzoCourier_05_13"); //¯eby go okraœæ wystarcz¹ ci podstawowe umiejêtnoœci. No chyba, ¿e masz drewniane rêce.
	AI_Output (other, self,"DIA_Fingers_LorenzoCourier_15_14"); //Sk¹d bêdê wiedzia³ kiedy bêdzie mia³ raport?
	AI_Output (self, other,"DIA_Fingers_LorenzoCourier_05_15"); //Mo¿e zapytaj o to Lorenzo. Zaoferuj mu siê. Z pewnoœci¹ siê nie zgodzi, abyœ to ty zaniós³ raport, ale byæ mo¿e czegoœ siê dowiesz.
	B_LogEntry(CH1_ZmianaLorenza, "Uda³o mi siê przekonaæ R¹czkê do pomocy. Powiedzia³, ¿e raport który móg³bym pokazaæ Togardowi najpewniej bêdzie przenosi³ Cieñ Ecker. Muszê delikatnie wypytaæ Lorenzo kiedy odda raport, a potem okraœæ tego Cienia.");
};

///////////////////////////////////////////////////////////////////////////////////////////
// R¹czka
// Rozdzia³ 2
// Karczma
///////////////////////////////////////////////////////////////////////////////////////////

//========================================
//-----------------> InTavern
//========================================

INSTANCE DIA_Fingers_InTavern (C_INFO)
{
   npc          = STT_331_Fingers;
   nr           = 1;
   condition    = DIA_Fingers_InTavern_Condition;
   information  = DIA_Fingers_InTavern_Info;
   permanent	= FALSE;
   description	= "Co ty tutaj robisz?";
};

FUNC INT DIA_Fingers_InTavern_Condition()
{
    if (MIS_KillFingers == LOG_RUNNING)
    && (Wld_IsTime     (23,50,02,35))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Fingers_InTavern_Info()
{
    AI_Output (other, self ,"DIA_Fingers_InTavern_15_01"); //Co ty tutaj robisz?
    AI_Output (other, self ,"DIA_Fingers_InTavern_15_02"); //Silas bardzo nie lubi takich goœci!
    AI_DrawWeapon (other);
    AI_Output (self, other ,"DIA_Fingers_InTavern_03_03"); //Zaczekaj, pracujesz dla niego?
	AI_Output (other, self ,"DIA_Fingers_InTavern_15_04"); //Byæ mo¿e...
    AI_Output (self, other ,"DIA_Fingers_InTavern_03_05"); //S³uchaj, nie chcê z tob¹ walczyæ. Nie potrzebujê mieæ dodatkowych porachunków ze Szkodnikami.
    AI_Output (self, other ,"DIA_Fingers_InTavern_03_06"); //Dogadajmy siê. Oferujê ci 200 bry³ek rudy i gwarancjê, ¿e nigdy siê tutaj nie zjawiê.
    AI_Output (self, other ,"DIA_Fingers_InTavern_03_07"); //Obydwoje na tym zyskamy. Co ty na to?

    Info_ClearChoices		(DIA_Fingers_InTavern);
    Info_AddChoice		(DIA_Fingers_InTavern, "Zginiesz. Zapêdzi³eœ siê za daleko!", DIA_Fingers_InTavern_Dedaj);
    Info_AddChoice		(DIA_Fingers_InTavern, "Dawaj rudê i wynoœ siê st¹d.", DIA_Fingers_InTavern_Dobra);
};

FUNC VOID DIA_Fingers_InTavern_Dedaj()
{
    AI_Output (other, self ,"DIA_Fingers_InTavern_Dedaj_15_01"); //Zginiesz. Zapêdzi³eœ siê za daleko!
	Info_ClearChoices		(DIA_Fingers_InTavern);
    AI_StopProcessInfos	(self);
    Npc_SetPermAttitude (self, ATT_HOSTILE);
    Npc_SetTarget (self,other);
    AI_StartState (self,ZS_ATTACK,1,"");
    B_LogEntry                     (CH1_KillFingers,"Spotka³em R¹czkê w karczmie Silasa i postanowi³em natychmiast siê z nim rozprawiæ.");

    //B_GiveXP (100);
   
};

FUNC VOID DIA_Fingers_InTavern_Dobra()
{
    AI_Output (other, self ,"DIA_Fingers_InTavern_Dobra_15_01"); //Dawaj rudê i wynoœ siê st¹d.
    AI_Output (self, other ,"DIA_Fingers_InTavern_Dobra_03_02"); //Wielkie dziêki.
	
    B_LogEntry                     (CH1_KillFingers,"Noc¹ w karczmie spotka³em R¹czkê. Z³o¿y³ mi propozycjê: nieŸle mi zap³aci, jeœli puszczê go wolno. G³upot¹ by³oby nie przyj¹æ takiej propozycji. ");

    //B_GiveXP (50);
    CreateInvItems (self, ItMiNugget, 200);
    B_GiveInvItems (self, other, ItMiNugget, 200);
    Npc_ExchangeRoutine (self,"start");
    Info_ClearChoices		(DIA_Fingers_InTavern);
    AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////////////////////////
// R¹czka
// Rozdzia³ 2
// Konflikt z Klinem
///////////////////////////////////////////////////////////////////////////////////////////

//========================================
//-----------------> FingersStayAlive
//========================================

INSTANCE DIA_Fingers_FingersStayAlive (C_INFO)
{
   npc          = STT_331_Fingers;
   nr           = 1;
   condition    = DIA_Fingers_FingersStayAlive_Condition;
   information  = DIA_Fingers_FingersStayAlive_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Fingers_FingersStayAlive_Condition()
{
    if (Npc_KnowsInfo (hero, TRIA_KillFingers)) && (HeroPermitToKillFingers == false)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Fingers_FingersStayAlive_Info()
{
    AI_Output (self, other ,"DIA_Fingers_FingersStayAlive_03_01"); //Dobrze, ¿e poharata³eœ tego gnojka. Nie wiedzia³ co mówi. 
	AI_Output (other, self ,"DIA_Fingers_FingersStayAlive_15_02"); //Powiedz mi, to naprawdê by³ przypadek?
	AI_Output (self, other ,"DIA_Fingers_FingersStayAlive_03_03"); //Jasne, ¿e tak. IdŸ do Starej Kopalni i zapytaj o to chocia¿by Brandicka, albo Asghana. Ten goœæ trafi³ do Kopalni. Jestem tego pewien.
	AI_Output (self, other ,"DIA_Fingers_FingersStayAlive_03_04"); //Choæ zapewne ju¿ nie ¿yje, ale mniejsza z tym. Stra¿nicy na pewno bêd¹ pamiêtaæ kogoœ takiego. 
	AI_Output (other, self ,"DIA_Fingers_FingersStayAlive_15_05"); //Byæ mo¿e to sprawdzê.
	AI_Output (self, other ,"DIA_Fingers_FingersStayAlive_03_06"); //Dziwi mnie, ¿e tak ci zale¿y na nie twoich sprawach. Lepiej wracajmy do Starego Obozu. Jeszcze raz dziêki.
	
	CreateInvItems (self, ItMiNugget, 50);
    B_GiveInvItems (self, other, ItMiNugget, 50);
	
    B_LogEntry               (CH2_FingersSeeking,"R¹czka by³ wdziêczny za moj¹ pomoc. Powiedzia³, ¿e jeœli nie wierzê w to co mówi³ do Klina to mogê to sprawdziæ rozmawiaj¹c z Brandickiem lub Asghanem. Byæ mo¿e póŸniej to zrobiê. Teraz najlepiej wróciæ do Diego.");
	
	B_GiveXP (100);
	
	Npc_ExchangeRoutine (self,"start");
};

///////////////////////////////////////////////////////////////////////////////////////////
// R¹czka
// Rozdzia³ 2
// Skok na magazyny
///////////////////////////////////////////////////////////////////////////////////////////

//========================================
//-----------------> ORG_QUEST
//========================================

INSTANCE DIA_Fingers_ORG_QUEST (C_INFO)
{
   npc          = STT_331_Fingers;
   nr           = 1;
   condition    = DIA_Fingers_ORG_QUEST_Condition;
   information  = DIA_Fingers_ORG_QUEST_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Fingers_ORG_QUEST_Condition()
{
    if (Npc_GetTrueGuild(hero) == GIL_ORG)
    {
    return FALSE;
    };
};


FUNC VOID DIA_Fingers_ORG_QUEST_Info()
{
    AI_Output (self, other ,"DIA_Fingers_ORG_QUEST_03_01"); //Widzê ¿e do³¹czy³eœ do Nowego Obozu. Œwietnie, zdajê siê, ¿e mam pewne dyskretne zadanie dla kogoœ takiego jak ty.
};

//========================================
//-----------------> ORG_QUEST_ASK
//========================================

INSTANCE DIA_Fingers_ORG_QUEST_ASK (C_INFO)
{
   npc          = STT_331_Fingers;
   nr           = 2;
   condition    = DIA_Fingers_ORG_QUEST_ASK_Condition;
   information  = DIA_Fingers_ORG_QUEST_ASK_Info;
   permanent	= FALSE;
   description	= "Co to za zadanie?";
};

FUNC INT DIA_Fingers_ORG_QUEST_ASK_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Fingers_ORG_QUEST))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Fingers_ORG_QUEST_ASK_Info()
{
    AI_Output (other, self ,"DIA_Fingers_ORG_QUEST_ASK_15_01"); //Co to za zadanie?
    AI_Output (self, other ,"DIA_Fingers_ORG_QUEST_ASK_03_02"); //Jestem szanowan¹ osob¹ w Starym Obozie, wiêc nie mogê sobie pozwoliæ na ¿adne spory ze Stra¿nikami ani Magnatami. Dlatego powiem ci o co chodzi, je¿eli nie piœniesz nikomu s³ówka.
    AI_Output (other, self ,"DIA_Fingers_ORG_QUEST_ASK_15_03"); //Niech bêdzie, obiecuje.
    AI_Output (self, other ,"DIA_Fingers_ORG_QUEST_ASK_03_04"); //I to mi siê podoba. PrzejdŸmy jednak do rzeczy. W zamku jest piwnica. Z tego co wiem mo¿e znajdowaæ siê tam sporo wartoœciowych przedmiotów. 
	 AI_Output (self, other ,"DIA_Fingers_ORG_QUEST_ASK_03_05"); //Nie masz jednak szans dostania siê tam od strony zamku, klucz jest w posiadaniu Magnatów, i bez walki z nimi by siê nie oby³o.
    AI_Output (self, other ,"DIA_Fingers_ORG_QUEST_ASK_03_06"); //Istnieje jednak druga opcja. Od strony targowiska znajduje siê ukryte przejœcie, które mo¿na odnaleŸæ poprzez zbadanie zamkowego muru na dachach chat. 
	AI_Output (self, other ,"DIA_Fingers_ORG_QUEST_ASK_03_07"); //Jeœli uda ci siê przynieœæ skarby z piwnicy Magnatów, wynagrodzê ciê. Jednak nie mo¿esz nikomu powiedzieæ o tym, dla kogo pracujesz.
    AI_Output (other, self ,"DIA_Fingers_ORG_QUEST_ASK_15_08"); //Postaram siê przynieœæ te rzeczy.
    AI_Output (self, other ,"DIA_Fingers_ORG_QUEST_ASK_03_09"); //Powodzenia, ch³opcze.
    MIS_OldCampCellar = LOG_RUNNING;

    Log_CreateTopic          (CH2_OldCampCellar, LOG_MISSION);
    Log_SetTopicStatus       (CH2_OldCampCellar, LOG_RUNNING);
    B_LogEntry               (CH2_OldCampCellar,"R¹czka zleci³ mi, aby w jakiœ sposób dosta³ siê do piwnic pod zamkiem i obrabowaæ znajduj¹ce siê tam kufry. Wejœcie znajduje siê nad placem targowym.");
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Fingers_HELLO1 (C_INFO)
{
   npc          = STT_331_Fingers;
   nr           = 1;
   condition    = DIA_Fingers_HELLO1_Condition;
   information  = DIA_Fingers_HELLO1_Info;
   permanent	= FALSE;
   description	= "Uda³o mi siê okraœæ piwnice.";
};

FUNC INT DIA_Fingers_HELLO1_Condition()
{
    if (MIS_OldCampCellar == LOG_RUNNING)
    && (Npc_HasItems (other, Skarb_ring1) >=1)
    && (Npc_HasItems (other, Skarb_ring2) >=1)
    && (Npc_HasItems (other, Skarb_cup1) >=1)
    && (Npc_HasItems (other, Skarb_SwordGold) >=1)
    {
    return TRUE;
    };
};
//Skarb_ring1,Skarb_ring2,Skarb_cup1,Skarb_SwordGold,Bergs_Ring,ItMiNugget:200,ItMi_Stuff_Cup_02:3,ItMw_1H_Sword_05

FUNC VOID DIA_Fingers_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Fingers_HELLO1_15_01"); //Uda³o mi siê okraœæ piwnice.
    AI_Output (self, other ,"DIA_Fingers_HELLO1_03_02"); //Œwietnie, dziêki za dyskrecje, poka¿ mi co przynios³eœ.
    AI_Output (other, self ,"DIA_Fingers_HELLO1_15_03"); //Spójrz sam.
    AI_Output (self, other ,"DIA_Fingers_HELLO1_03_04"); //Hmm, wezmê ten miecz, pierœcienie oraz kielich. Za³o¿e siê, ¿e nieŸle na nich zarobiê. Ty mo¿esz zachowaæ rudê i resztê tego co znalaz³eœ.
    B_LogEntry                     (CH2_OldCampCellar,"Zanios³em R¹czce b³yskotki, które znalaz³em. Zabra³ wszystkie najciekawsze przedmioty, ale i tak wyszed³em na swoje, bo zosta³o mi sporo rudy i ca³kiem niez³y miecz. ");
    Log_SetTopicStatus       (CH2_OldCampCellar, LOG_SUCCESS);
    MIS_OldCampCellar = LOG_SUCCESS;
	B_GiveInvItems	(other, self,Skarb_ring1,1);
	B_GiveInvItems	(other, self,Skarb_ring2,1);
	B_GiveInvItems	(other, self,Skarb_cup1,1);
	B_GiveInvItems	(other, self,Skarb_SwordGold,1);
    B_GiveXP (450);
    AI_StopProcessInfos	(self);
};

