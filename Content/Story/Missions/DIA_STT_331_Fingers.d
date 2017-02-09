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
	description		= "Chc� zosta� Cieniem."; 
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
	AI_Output (other, self,"DIA_Fingers_BecomeShadow_15_00"); //Chc� zosta� Cieniem.
	AI_Output (self, other,"DIA_Fingers_BecomeShadow_05_01"); //I co z tego?
	Info_ClearChoices	(DIA_Fingers_BecomeShadow );
	Info_AddChoice		(DIA_Fingers_BecomeShadow,DIALOG_BACK										,DIA_Fingers_BecomeShadow_BACK);
	if (Npc_KnowsInfo(hero,Info_Diego_Teachers))
	{
		Info_AddChoice		(DIA_Fingers_BecomeShadow,"Szukam kogo�, kto m�g�by mnie czego� nauczy�."	,DIA_Fingers_BecomeShadow_TeachMe);
	};
	Info_AddChoice		(DIA_Fingers_BecomeShadow,"Mo�esz mi pom�c?"					,DIA_Fingers_BecomeShadow_AnyTips);
};

func void DIA_Fingers_BecomeShadow_BACK()
{
	Info_ClearChoices	(DIA_Fingers_BecomeShadow );
};

func void DIA_Fingers_BecomeShadow_AnyTips()
{
	AI_Output (other, self,"DIA_Fingers_BecomeShadow_AnyTips_15_00"); //Mo�esz mi pom�c?
	AI_Output (self, other,"DIA_Fingers_BecomeShadow_AnyTips_05_01"); //Nie mam poj�cia jak to zrobi�...
};

func void DIA_Fingers_BecomeShadow_TeachMe()
{
	AI_Output (other, self,"DIA_Fingers_BecomeShadow_TeachMe_15_00"); //Szukam kogo�, kto m�g�by mnie czego� nauczy�.
	AI_Output (self, other,"DIA_Fingers_BecomeShadow_TeachMe_05_01"); //To dlaczego przyszed�e� do mnie?
	AI_Output (other, self,"DIA_Fingers_BecomeShadow_TeachMe_15_02"); //Przys�a� mnie Diego.
	AI_Output (self, other,"DIA_Fingers_BecomeShadow_TeachMe_05_03"); //Trzeba by�o m�wi� tak od razu.
	AI_Output (self, other,"DIA_Fingers_BecomeShadow_TeachMe_05_04"); //Je�li chcesz do��czy� do naszego obozu, powiniene� by� dobrym wojownikiem albo zr�cznym z�odziejem.
	AI_Output (self, other,"DIA_Fingers_BecomeShadow_TeachMe_05_05"); //Wp�ywowi ludzie z Obozu b�d� mieli dla ciebie r�ne zlecenia, podczas wykonywania kt�rych lepiej nie da� si� z�apa�.
	AI_Output (self, other,"DIA_Fingers_BecomeShadow_TeachMe_05_06"); //Dlatego na pocz�tek proponowa�bym ci szkolenie si� w fachu z�odziejskim.
	AI_Output (self, other,"DIA_Fingers_BecomeShadow_TeachMe_05_07"); //Zupe�nym przypadkiem, tak si� sk�ada, �e jestem najlepszym z�odziejem w ca�ym Starym Obozie.
	Fingers_CanTeach = TRUE;
	Log_CreateTopic   	(GE_TeacherOC,LOG_NOTE);
	B_LogEntry			(GE_TeacherOC,"R�czka mo�e mnie nauczy� otwierania zamk�w i kradzie�y kieszonkowej.");
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
	description		= "Czego mo�esz mnie nauczy�?"; 
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
	AI_Output (other, self,"DIA_Fingers_Lehrer_15_00"); //Czego mo�esz mnie nauczy�?
	AI_Output (self, other,"DIA_Fingers_Lehrer_05_02"); //To zale�y tylko od tego, co chcia�by� wiedzie�.



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
	Info_AddChoice		(DIA_Fingers_Lehrer,"Chcia�bym umie� porusza� si� niepostrze�enie." 								,DIA_Fingers_Lehrer_Schleichen);
	};
};


func void DIA_Fingers_Lehrer_Schleichen()
{
	AI_Output (other, self,"DIA_Fingers_Lehrer_Schleichen_15_00"); //Chcia�bym umie� porusza� si� niepostrze�enie.
	AI_Output (self, other,"DIA_Fingers_Lehrer_Schleichen_05_01"); //My�l� - bez �adnej fa�szywej skromno�ci - �e jestem jednym z najlepszych z�odziei zrzuconych do tej przekl�tej Kolonii.
	AI_Output (self, other,"DIA_Fingers_Lehrer_Schleichen_05_02"); //Ale je�li chodzi o skradanie si�, powiniene� porozmawia� z Cavalornem.
	Fingers_Wherecavalorn = TRUE;
};

func void DIA_Fingers_Lehrer_Lockpick()
{
	AI_Output (other, self,"DIA_Fingers_Lehrer_Lockpick_15_00"); //Chcia�bym nauczy� si� otwiera� zamki.
	if (Npc_HasItems (hero, itminugget) >=300)
	{
	if (B_GiveSkill(other, NPC_TALENT_PICKLOCK, 1, LPCOST_TALENT_PICKLOCK_1))
	{
		AI_Output (self, other,"DIA_Fingers_Lehrer_Lockpick_05_01"); //Nie w�tpi�! C�... Pocz�tki nie s� zbyt trudne.
		AI_Output (self, other,"DIA_Fingers_Lehrer_Lockpick_05_02"); //Przede wszystkim musisz uwa�a�, �eby nie z�ama� wytrycha.
		AI_Output (self, other,"DIA_Fingers_Lehrer_Lockpick_05_03"); //Musisz by� bardzo cierpliwy. Wtedy nie b�dziesz potrzebowa� tylu wytrych�w, he he!
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
	AI_Output (other, self,"DIA_Fingers_Lehrer_Lockpick2_15_00"); //Chcia�bym zosta� ekspertem w otwieraniu zamk�w.
	if (Npc_HasItems (hero, itminugget) >=600)
	{
	if (B_GiveSkill(other, NPC_TALENT_PICKLOCK, 2, LPCOST_TALENT_PICKLOCK_2))
	{
		AI_Output (self, other,"DIA_Fingers_Lehrer_Lockpick2_05_01"); //Gdy nabierzesz ju� troch� do�wiadczenia, nauczysz si� rozpoznawa� d�wi�k, jaki wydaje wytrych zanim p�knie.
		AI_Output (self, other,"DIA_Fingers_Lehrer_Lockpick2_05_02"); //My�l�, �e powiniene� sobie z tym poradzi�. Ws�uchaj si� uwa�nie w d�wi�ki jakie wydaje otwierany zamek, a nie b�dziesz potrzebowa� tylu wytrych�w, he, he!
		AI_Output (self, other,"DIA_Fingers_Lehrer_Lockpick2_05_03"); //Prawdziwy mistrz w tym fachu potrafi otworzy� ka�d� skrzyni� nie �ami�c ani jednego wytrycha.
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
	AI_Output (other, self,"DIA_Fingers_Lehrer_PICKPOCKET_15_00"); //Chcia�bym zosta� zr�cznym kieszonkowcem!
	if (Npc_GetTalentSkill(other, NPC_TALENT_SNEAK) == 1)
	{
		if (Npc_HasItems (hero, itminugget) >=250)
		{
		if (B_GiveSkill(other, NPC_TALENT_PICKPOCKET, 1, LPCOST_TALENT_PICKPOCKET_1))
		{
			AI_Output (self, other,"DIA_Fingers_Lehrer_PICKPOCKET_05_01"); //Chcia�by� odci��y� par� os�b z ich dobytku, co? No dobra.
			AI_Output (self, other,"DIA_Fingers_Lehrer_PICKPOCKET_05_02"); //Poka�� ci na czym powiniene� si� skoncentrowa�, ale szanse, �e zostaniesz z�apany b�d� nadal znaczne.
			AI_Output (self, other,"DIA_Fingers_Lehrer_PICKPOCKET_05_03"); //Podejmuj ryzyko wy��cznie je�li w pobli�u ofiary nie ma os�b trzecich.
			AI_Output (self, other,"DIA_Fingers_Lehrer_PICKPOCKET_05_04"); //Tylko prawdziwy mistrz potrafi ukra�� co� pozostaj�c ca�kowicie niezauwa�onym!
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
		AI_Output (self, other,"DIA_Fingers_lehrer_Pickpocket_05_05"); //Nie ma o czym m�wi�! Nie b�dzie z ciebie z�odzieja, dop�ki nie nauczysz si� skrada�!
	};
};

func void DIA_Fingers_Lehrer_Pickpocket2()
{
	AI_Output (other, self,"DIA_Fingers_Lehrer_Pickpocket2_15_00"); //Chcia�bym zosta� mistrzem kieszonkowc�w!
	if (Npc_HasItems (hero, itminugget) >=500)
	{
	if (B_GiveSkill(other, NPC_TALENT_PICKPOCKET, 2, LPCOST_TALENT_PICKPOCKET_2))
	{		
		AI_Output (self, other,"DIA_Fingers_Lehrer_Pickpocket2_05_01"); //C�, chyba rzeczywi�cie potrafisz ju� wystarczaj�co du�o, �eby opanowa� zaawansowane sztuczki.
		AI_Output (self, other,"DIA_Fingers_Lehrer_Pickpocket2_05_02"); //Ale musisz pami�ta�, �e nawet mistrzowie z�odziejscy od czasu do czasu zostaj� z�apani.
		AI_Output (self, other,"DIA_Fingers_Lehrer_Pickpocket2_05_03"); //Uwa�aj na siebie.
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
	description		= "Gdzie znajd� Cavalorna?"; 
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
	AI_Output (other, self,"DIA_Fingers_WhereCavalorn_15_00"); //Gdzie znajd� Cavalorna?
	AI_Output (self, other,"DIA_Fingers_WhereCavalorn_05_01"); //Poluje gdzie� poza Obozem. Pewnie znajdziesz go na drodze do Nowego Obozu. Na zach�d st�d jest taki kanion.
	AI_Output (self, other,"DIA_Fingers_WhereCavalorn_05_02"); //Tam znajdziesz opuszczon� chat� drwala. Cavalorn powinien kr�ci� si� w jej pobli�u.
	var int log_cava_fing;
	if log_cava_fing == false
	{
	Log_CreateTopic (GE_TeacherOW,	LOG_NOTE);
	B_LogEntry(GE_TeacherOW, "Cavalorn mo�e mi pokaza�, jak nale�y si� skrada�. Jego chata znajduje si� w kanionie, na zach�d od Starego Obozu.");
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
	description		= "Nie m�g�by� wstawi� si� za mn� u Diego?"; 
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
	AI_Output (other, self,"DIA_Fingers_Learnt_15_00"); //Nie m�g�by� wstawi� si� za mn� u Diego?

	if (MIS_ChestAndPlate != LOG_SUCCESS)
	{
	if ( Npc_GetTalentSkill(other, NPC_TALENT_PICKLOCK)+Npc_GetTalentSkill(other, NPC_TALENT_PICKPOCKET)+Npc_GetTalentSkill(other, NPC_TALENT_SNEAK)	> 0)
	{
		AI_Output (self, other,"DIA_Fingers_Learnt_05_01"); //Czemu nie. Nauczy�e� si� czego�, co czyni ci� przydatnym dla Starego Obozu.
		AI_Output (self, other,"DIA_Fingers_Learnt_05_02"); //Zr�cznych z�odziei nigdy nie za wiele. Mo�esz na mnie liczy�.
		Fingers_Learnt = LOG_SUCCESS;
		
		B_GiveXP (XP_Fingerstrain);
		B_LogEntry( CH1_JoinOC, "R�czka jest bardzo zadowolony z post�p�w, kt�re poczyni�em.");
	}
	else
	{
		AI_Output (self, other,"DIA_Fingers_Learnt_05_03"); //To zale�y...
		AI_Output (self, other,"DIA_Fingers_Learnt_05_04"); //Je�li udowodnisz, �e nauczy�e� si� czego� w z�odziejskim fachu, uznam, �e b�dzie z ciebie jaki� po�ytek.
		AI_Output (other, self,"DIA_Fingers_Learnt_15_05"); //Jak mam to niby zrobi�?
		AI_Output (self, other,"DIA_Fingers_Learnt_05_06"); //Wyucz si� kt�rej� ze z�odziejskich umiej�tno�ci. Naucz si� skrada� niepostrze�enie, okrada� ludzi albo otwiera� zamki. Wtedy b�dziesz m�g� liczy� na m�j g�os.
		Fingers_Learnt = LOG_RUNNING;
		
		B_LogEntry( CH1_JoinOC, "R�czka wstawi si� za mn�, je�li wyucz� si� jakiej� z�odziejskiej umiej�tno�ci.");
	};
	}
	else
	{
	AI_Output (self, other,"DIA_Fingers_Learnt_05_07"); //Nie! Wybra�e� sobie z�e towarzystwo. Wracaj do Rono i Relghara!
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
// R�czka
// Rozdzia� 1
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
	AI_Output (self, other,"DIA_Fingers_LorenzoCourier_05_01"); //Czy ja ci wygl�dam na kogo�, kto ma takie rzeczy? Zreszt� nie jeste� upowa�niony...
	AI_Output (self, other,"DIA_Fingers_LorenzoCourier_05_02"); //(chwila ciszy) A, ju� rozumiem. Mog� ci� nauczy� tego i owego. 
	AI_Output (other, self,"DIA_Fingers_LorenzoCourier_15_03"); //B�d� w stanie nauczy� si� tego tak szybko? W ko�cu Lorenzo to nie byle kto, a ja nie jestem jeszcze zbyt zr�czny. 
	AI_Output (self, other,"DIA_Fingers_LorenzoCourier_05_04"); //My�l�, �e nie b�dziesz musia� nawet rozmawia� z Lorenzo.
	AI_Output (other, self,"DIA_Fingers_LorenzoCourier_15_05"); //Hmm? Niby dlaczego?
	AI_Output (self, other,"DIA_Fingers_LorenzoCourier_05_06"); //A powiedz mi czemu mia�bym ci to powiedzie�? Nie jeste� jednym z nas, a ten raport jest bardzo wa�ny. Pracujesz dla kogo� z Nowego Obozu?
	AI_Output (other, self,"DIA_Fingers_LorenzoCourier_15_07"); //Naprawd� s�dzisz, �e przyszed�bym wtedy do ciebie? Nie chc� sobie przyw�aszczy� tego dokumentu. 
	AI_Output (other, self,"DIA_Fingers_LorenzoCourier_15_08"); //Chc� go przeczyta� i je�li b�dzie zawiera� to, co mnie interesuje pokaza� go jednemu Kopaczowi. P�niej go zwr�c�.
	AI_Output (self, other,"DIA_Fingers_LorenzoCourier_05_09"); //Naprawd� s�dzisz, �e si� na to nabior�?
	AI_Output (other, self,"DIA_Fingers_LorenzoCourier_15_10"); //M�wi� powa�nie! Ten Kopacz musi si� do��czy� do nast�pnej zmiany ludzi do Kopalni. Snaf doradzi� mi jak go przekona�. Chc� do was do��czy�?
	AI_Output (self, other,"DIA_Fingers_LorenzoCourier_05_11"); //C�, s�ysza�em o tym. Zaufam ci, ale je�li mnie ok�amujesz to i tak ci� znajd� i zabij�. Uwierz mi, �e Kolonia jest ma�a.
	AI_Output (other, self,"DIA_Fingers_LorenzoCourier_15_11"); //Nie ma problemu. Jestem pewny tego co m�wi�.
	AI_Output (self, other,"DIA_Fingers_LorenzoCourier_05_12"); //Dobra, Lorenzo nie zanosi raport�w osobi�cie. Robi to pewien m�odzieniec, mieszkaj�cy w pobli�u. Nazywa si� Ecker.
	AI_Output (self, other,"DIA_Fingers_LorenzoCourier_05_13"); //�eby go okra�� wystarcz� ci podstawowe umiej�tno�ci. No chyba, �e masz drewniane r�ce.
	AI_Output (other, self,"DIA_Fingers_LorenzoCourier_15_14"); //Sk�d b�d� wiedzia� kiedy b�dzie mia� raport?
	AI_Output (self, other,"DIA_Fingers_LorenzoCourier_05_15"); //Mo�e zapytaj o to Lorenzo. Zaoferuj mu si�. Z pewno�ci� si� nie zgodzi, aby� to ty zani�s� raport, ale by� mo�e czego� si� dowiesz.
	B_LogEntry(CH1_ZmianaLorenza, "Uda�o mi si� przekona� R�czk� do pomocy. Powiedzia�, �e raport kt�ry m�g�bym pokaza� Togardowi najpewniej b�dzie przenosi� Cie� Ecker. Musz� delikatnie wypyta� Lorenzo kiedy odda raport, a potem okra�� tego Cienia.");
};

///////////////////////////////////////////////////////////////////////////////////////////
// R�czka
// Rozdzia� 2
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
    AI_Output (other, self ,"DIA_Fingers_InTavern_15_02"); //Silas bardzo nie lubi takich go�ci!
    AI_DrawWeapon (other);
    AI_Output (self, other ,"DIA_Fingers_InTavern_03_03"); //Zaczekaj, pracujesz dla niego?
	AI_Output (other, self ,"DIA_Fingers_InTavern_15_04"); //By� mo�e...
    AI_Output (self, other ,"DIA_Fingers_InTavern_03_05"); //S�uchaj, nie chc� z tob� walczy�. Nie potrzebuj� mie� dodatkowych porachunk�w ze Szkodnikami.
    AI_Output (self, other ,"DIA_Fingers_InTavern_03_06"); //Dogadajmy si�. Oferuj� ci 200 bry�ek rudy i gwarancj�, �e nigdy si� tutaj nie zjawi�.
    AI_Output (self, other ,"DIA_Fingers_InTavern_03_07"); //Obydwoje na tym zyskamy. Co ty na to?

    Info_ClearChoices		(DIA_Fingers_InTavern);
    Info_AddChoice		(DIA_Fingers_InTavern, "Zginiesz. Zap�dzi�e� si� za daleko!", DIA_Fingers_InTavern_Dedaj);
    Info_AddChoice		(DIA_Fingers_InTavern, "Dawaj rud� i wyno� si� st�d.", DIA_Fingers_InTavern_Dobra);
};

FUNC VOID DIA_Fingers_InTavern_Dedaj()
{
    AI_Output (other, self ,"DIA_Fingers_InTavern_Dedaj_15_01"); //Zginiesz. Zap�dzi�e� si� za daleko!
	Info_ClearChoices		(DIA_Fingers_InTavern);
    AI_StopProcessInfos	(self);
    Npc_SetPermAttitude (self, ATT_HOSTILE);
    Npc_SetTarget (self,other);
    AI_StartState (self,ZS_ATTACK,1,"");
    B_LogEntry                     (CH1_KillFingers,"Spotka�em R�czk� w karczmie Silasa i postanowi�em natychmiast si� z nim rozprawi�.");

    //B_GiveXP (100);
   
};

FUNC VOID DIA_Fingers_InTavern_Dobra()
{
    AI_Output (other, self ,"DIA_Fingers_InTavern_Dobra_15_01"); //Dawaj rud� i wyno� si� st�d.
    AI_Output (self, other ,"DIA_Fingers_InTavern_Dobra_03_02"); //Wielkie dzi�ki.
	
    B_LogEntry                     (CH1_KillFingers,"Noc� w karczmie spotka�em R�czk�. Z�o�y� mi propozycj�: nie�le mi zap�aci, je�li puszcz� go wolno. G�upot� by�oby nie przyj�� takiej propozycji. ");

    //B_GiveXP (50);
    CreateInvItems (self, ItMiNugget, 200);
    B_GiveInvItems (self, other, ItMiNugget, 200);
    Npc_ExchangeRoutine (self,"start");
    Info_ClearChoices		(DIA_Fingers_InTavern);
    AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////////////////////////
// R�czka
// Rozdzia� 2
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
    AI_Output (self, other ,"DIA_Fingers_FingersStayAlive_03_01"); //Dobrze, �e poharata�e� tego gnojka. Nie wiedzia� co m�wi. 
	AI_Output (other, self ,"DIA_Fingers_FingersStayAlive_15_02"); //Powiedz mi, to naprawd� by� przypadek?
	AI_Output (self, other ,"DIA_Fingers_FingersStayAlive_03_03"); //Jasne, �e tak. Id� do Starej Kopalni i zapytaj o to chocia�by Brandicka, albo Asghana. Ten go�� trafi� do Kopalni. Jestem tego pewien.
	AI_Output (self, other ,"DIA_Fingers_FingersStayAlive_03_04"); //Cho� zapewne ju� nie �yje, ale mniejsza z tym. Stra�nicy na pewno b�d� pami�ta� kogo� takiego. 
	AI_Output (other, self ,"DIA_Fingers_FingersStayAlive_15_05"); //By� mo�e to sprawdz�.
	AI_Output (self, other ,"DIA_Fingers_FingersStayAlive_03_06"); //Dziwi mnie, �e tak ci zale�y na nie twoich sprawach. Lepiej wracajmy do Starego Obozu. Jeszcze raz dzi�ki.
	
	CreateInvItems (self, ItMiNugget, 50);
    B_GiveInvItems (self, other, ItMiNugget, 50);
	
    B_LogEntry               (CH2_FingersSeeking,"R�czka by� wdzi�czny za moj� pomoc. Powiedzia�, �e je�li nie wierz� w to co m�wi� do Klina to mog� to sprawdzi� rozmawiaj�c z Brandickiem lub Asghanem. By� mo�e p�niej to zrobi�. Teraz najlepiej wr�ci� do Diego.");
	
	B_GiveXP (100);
	
	Npc_ExchangeRoutine (self,"start");
};

///////////////////////////////////////////////////////////////////////////////////////////
// R�czka
// Rozdzia� 2
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
    AI_Output (self, other ,"DIA_Fingers_ORG_QUEST_03_01"); //Widz� �e do��czy�e� do Nowego Obozu. �wietnie, zdaj� si�, �e mam pewne dyskretne zadanie dla kogo� takiego jak ty.
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
    AI_Output (self, other ,"DIA_Fingers_ORG_QUEST_ASK_03_02"); //Jestem szanowan� osob� w Starym Obozie, wi�c nie mog� sobie pozwoli� na �adne spory ze Stra�nikami ani Magnatami. Dlatego powiem ci o co chodzi, je�eli nie pi�niesz nikomu s��wka.
    AI_Output (other, self ,"DIA_Fingers_ORG_QUEST_ASK_15_03"); //Niech b�dzie, obiecuje.
    AI_Output (self, other ,"DIA_Fingers_ORG_QUEST_ASK_03_04"); //I to mi si� podoba. Przejd�my jednak do rzeczy. W zamku jest piwnica. Z tego co wiem mo�e znajdowa� si� tam sporo warto�ciowych przedmiot�w. 
	 AI_Output (self, other ,"DIA_Fingers_ORG_QUEST_ASK_03_05"); //Nie masz jednak szans dostania si� tam od strony zamku, klucz jest w posiadaniu Magnat�w, i bez walki z nimi by si� nie oby�o.
    AI_Output (self, other ,"DIA_Fingers_ORG_QUEST_ASK_03_06"); //Istnieje jednak druga opcja. Od strony targowiska znajduje si� ukryte przej�cie, kt�re mo�na odnale�� poprzez zbadanie zamkowego muru na dachach chat. 
	AI_Output (self, other ,"DIA_Fingers_ORG_QUEST_ASK_03_07"); //Je�li uda ci si� przynie�� skarby z piwnicy Magnat�w, wynagrodz� ci�. Jednak nie mo�esz nikomu powiedzie� o tym, dla kogo pracujesz.
    AI_Output (other, self ,"DIA_Fingers_ORG_QUEST_ASK_15_08"); //Postaram si� przynie�� te rzeczy.
    AI_Output (self, other ,"DIA_Fingers_ORG_QUEST_ASK_03_09"); //Powodzenia, ch�opcze.
    MIS_OldCampCellar = LOG_RUNNING;

    Log_CreateTopic          (CH2_OldCampCellar, LOG_MISSION);
    Log_SetTopicStatus       (CH2_OldCampCellar, LOG_RUNNING);
    B_LogEntry               (CH2_OldCampCellar,"R�czka zleci� mi, aby w jaki� spos�b dosta� si� do piwnic pod zamkiem i obrabowa� znajduj�ce si� tam kufry. Wej�cie znajduje si� nad placem targowym.");
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
   description	= "Uda�o mi si� okra�� piwnice.";
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
    AI_Output (other, self ,"DIA_Fingers_HELLO1_15_01"); //Uda�o mi si� okra�� piwnice.
    AI_Output (self, other ,"DIA_Fingers_HELLO1_03_02"); //�wietnie, dzi�ki za dyskrecje, poka� mi co przynios�e�.
    AI_Output (other, self ,"DIA_Fingers_HELLO1_15_03"); //Sp�jrz sam.
    AI_Output (self, other ,"DIA_Fingers_HELLO1_03_04"); //Hmm, wezm� ten miecz, pier�cienie oraz kielich. Za�o�e si�, �e nie�le na nich zarobi�. Ty mo�esz zachowa� rud� i reszt� tego co znalaz�e�.
    B_LogEntry                     (CH2_OldCampCellar,"Zanios�em R�czce b�yskotki, kt�re znalaz�em. Zabra� wszystkie najciekawsze przedmioty, ale i tak wyszed�em na swoje, bo zosta�o mi sporo rudy i ca�kiem niez�y miecz. ");
    Log_SetTopicStatus       (CH2_OldCampCellar, LOG_SUCCESS);
    MIS_OldCampCellar = LOG_SUCCESS;
	B_GiveInvItems	(other, self,Skarb_ring1,1);
	B_GiveInvItems	(other, self,Skarb_ring2,1);
	B_GiveInvItems	(other, self,Skarb_cup1,1);
	B_GiveInvItems	(other, self,Skarb_SwordGold,1);
    B_GiveXP (450);
    AI_StopProcessInfos	(self);
};

