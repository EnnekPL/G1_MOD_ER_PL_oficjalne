//poprawione i sprawdzone - Nocturn

// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_BaalCadar_Exit (C_INFO)
{
	npc			= Gur_1208_BaalCadar;
	nr			= 999;
	condition	= DIA_BaalCadar_Exit_Condition;
	information	= DIA_BaalCadar_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_BaalCadar_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_BaalCadar_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// ************************************************************
// 					NICHT ansprechbar (Ungl�ubiger) 
// ************************************************************
	var int BaalCadar_Ansprechbar;
	var int BaalCadar_Sakrileg;
// ************************************************************

INSTANCE DIA_BaalCadar_NoTalk(C_INFO)
{
	npc				= GUR_1208_BaalCadar;
	nr				= 2;
	condition		= DIA_BaalCadar_NoTalk_Condition;
	information		= DIA_BaalCadar_NoTalk_Info;
	permanent		= 1;
	important 		= 1;
};                       

FUNC INT DIA_BaalCadar_NoTalk_Condition()
{
	if	Npc_IsInState(self,ZS_TALK)
	&&	(BaalCadar_Ansprechbar==FALSE)
	&&	(Npc_GetPermAttitude(self,other)!=ATT_FRIENDLY)
	&&	(Npc_GetTrueGuild(other) == GIL_NONE)
	{
		return 1;
	};
};

FUNC VOID DIA_BaalCadar_NoTalk_Info()
{	
	Info_ClearChoices 	(DIA_BaalCadar_NoTalk);
	Info_Addchoice 		(DIA_BaalCadar_NoTalk,DIALOG_ENDE					,DIA_BaalCadar_NoTalk_ENDE);
	Info_Addchoice 		(DIA_BaalCadar_NoTalk,"Wszystko w porz�dku, kolego?"			,DIA_BaalCadar_NoTalk_Imp);
	Info_Addchoice 		(DIA_BaalCadar_NoTalk,"Niech �ni�cy b�dzie z tob�!"	,DIA_BaalCadar_NoTalk_Sleeper);
	Info_Addchoice 		(DIA_BaalCadar_NoTalk,"Cze��! Jestem tu nowy!"		,DIA_BaalCadar_NoTalk_Hi);
};

func void DIA_BaalCadar_NoTalk_Hi()
{
	AI_Output (other, self,"DIA_BaalCadar_NoTalk_Hi_15_00"); //Cze��! Jestem tu nowy!
	AI_Output (self, other,"DIA_BaalCadar_NoTalk_Hi_02_01"); //(Wzdycha)
	BaalCadar_Sakrileg = TRUE;
};

func void DIA_BaalCadar_NoTalk_Sleeper()
{
	AI_Output (other, self,"DIA_BaalCadar_NoTalk_Sleeper_15_00"); //Niech �ni�cy b�dzie z tob�!
	AI_Output (self, other,"DIA_BaalCadar_NoTalk_Sleeper_02_01"); //(Wzdycha)
	BaalCadar_Sakrileg = TRUE;
};

func void DIA_BaalCadar_NoTalk_Imp()
{
	AI_Output (other, self,"DIA_BaalCadar_NoTalk_Imp_15_00"); //Wszystko w porz�dku, kolego? 
	AI_Output (self, other,"DIA_BaalCadar_NoTalk_Imp_02_01"); //(Wzdycha)
	BaalCadar_Sakrileg = TRUE;
};

func void DIA_BaalCadar_NoTalk_ENDE()
{
	AI_StopProcessInfos	(self);
};

/*


	AI_Output (self, other,"Sit_1_PSI_BaalCadar_HypnoticTeacher_2FuncNo_02_01"); //Du solltest deinen Weg mit Bedacht w�hlen und nach reiflicher �berlegung. 
	AI_Output (self, other,"Sit_1_PSI_BaalCadar_HypnoticTeacher_2FuncNo_02_02"); //Bedenke wie du entscheidest. In den anderen Lagern bekommst zwar Schutz und Nahrung, aber ist es das, was du willst?
	AI_Output (self, other,"Sit_1_PSI_BaalCadar_HypnoticTeacher_2FuncNo_15_03"); //Was erwartet mich, was es wert w�re, zu euch zu kommen?
	AI_Output (self, other,"Sit_1_PSI_BaalCadar_HypnoticTeacher_2FuncNo_02_04"); //Ich k�nnte dir jetzt erz�hlen, das die Templer einen unbezwinglichen Willen haben,das die magische Macht der Gurus, die Vorstellungskraft von Feuer- und Wassermagiern bei weitem �bersteigt.
	AI_Output (self, other,"Sit_1_PSI_BaalCadar_HypnoticTeacher_2FuncNo_02_05"); //Das unsere Nahrung auch satt macht. Aber das ist es nicht, was diese Gemeinschaft ausmacht.
	AI_Output (self, other,"Sit_1_PSI_BaalCadar_HypnoticTeacher_2FuncNo_02_06"); //Was dich hier erwartet, ist die Gabe. Du wirst einen Weg beschreiten, der dir sehr viel abverlangt.
	AI_Output (self, other,"Sit_1_PSI_BaalCadar_HypnoticTeacher_2FuncNo_02_07"); //Aber das was du erreichen wirst ist eine Gr��e, eine Macht die dir Erleuchtung schenkt. Eine Macht, die dich zur Freiheit f�hrt.
	AI_Output (self, other,"Sit_1_PSI_BaalCadar_HypnoticTeacher_2FuncNo_02_08"); //Ist es nicht das, was du willst?... Freiheit?
	AI_Output (self, other,"Sit_1_PSI_BaalCadar_HypnoticTeacher_2FuncNo_02_09"); //Also solltest du nicht die Frage stellen, warum du her kommen solltest, die Frage ist viel mehr, warum solltest du nicht?
	Log_CreateTopic (GE_TeacherPSI,LOG_NOTE);
	B_LogEntry    (GE_TeacherPSI,"Baal Cadar kann mir zeigen, wie ich meine geistige Kraft verbessern kann.");
*/

// **************************************************
// 						 Sleep Spell
// **************************************************

INSTANCE DIA_BaalCadar_SleepSpell (C_INFO)
{
	npc			= Gur_1208_BaalCadar;
	nr			= 1;
	condition	= DIA_BaalCadar_SleepSpell_Condition;
	information	= DIA_BaalCadar_SleepSpell_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC INT DIA_BaalCadar_SleepSpell_Condition()
{
	var C_NPC Nov1336; Nov1336=Hlp_GetNpc(Nov_1336_Novize);
	var C_NPC Nov1340; Nov1340=Hlp_GetNpc(Nov_1340_Novize);
	var C_NPC Nov1345; Nov1345=Hlp_GetNpc(Nov_1345_Novize);
	
	if ( Npc_IsInState(Nov1336,ZS_MagicSleep) || Npc_IsInState(Nov1340,ZS_MagicSleep) || Npc_IsInState(Nov1345,ZS_MagicSleep) )
	{
		return 1;
	};
};

FUNC VOID DIA_BaalCadar_SleepSpell_Info()
{
	AI_GotoNpc(other, self);
	AI_Output (self, other,"DIA_BaalCadar_SleepSpell_02_00"); //Co ty wyprawiasz? Pr�buj� medytowa� z moimi uczniami.
	AI_Output (self, other,"DIA_BaalCadar_SleepSpell_02_01"); //Kto ci� nauczy� wykorzystywa� magiczne moce �ni�cego?
	AI_Output (other, self,"DIA_BaalCadar_SleepSpell_15_02"); //Nikt. To by�o ca�kiem proste!
	AI_Output (self, other,"DIA_BaalCadar_SleepSpell_02_03"); //Wygl�dasz mi na poj�tnego ucznia. B�d� twoim mistrzem.

	BaalCadar_Ansprechbar = TRUE;
	if	(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		Log_CreateTopic		(CH1_JoinPsi,	LOG_MISSION);
		Log_SetTopicStatus	(CH1_JoinPsi,	LOG_RUNNING);
	};
	B_LogEntry		(CH1_JoinPsi,	"Baal Cadar ma mnie za poj�tnego ucznia!");
	B_GiveXP		(XP_ImpressBaalCadar);
};

/*------------------------------------------------------------------------
						MANA								
------------------------------------------------------------------------*/

instance  Gur_1208_BaalCadar_Teach (C_INFO)
{
	npc				= Gur_1208_BaalCadar;
	condition		= Gur_1208_BaalCadar_Teach_Condition;
	information		= Gur_1208_BaalCadar_Teach_Info;
	permanent		= 1;
	description		= "Chcia�bym zwi�kszy� pot�g� moich zakl��."; 
};

FUNC int  Gur_1208_BaalCadar_Teach_Condition()
{	
	if	(BaalCadar_Ansprechbar == TRUE)
	||	(Npc_GetTrueGuild(other) != GIL_NONE)
	{
		return TRUE;
	};
};
FUNC void  Gur_1208_BaalCadar_Teach_Info()
{
	AI_Output (other, self,"Gur_1208_BaalCadar_Teach_Info_15_01"); //Chcia�bym zwi�kszy� pot�g� moich zakl��!
	AI_Output (self, other,"Gur_1208_BaalCadar_Teach_Info_02_02"); //Kluczem do tego jest si�a twego ducha.
	
	if (log_baalcadartrain == FALSE) 
	{
		Log_CreateTopic   	(GE_TeacherPSI,LOG_NOTE);
		B_LogEntry			(GE_TeacherPSI,"Guru Baal Cadar pomo�e mi zwi�kszy� moj� mane.");
		log_baalcadartrain = TRUE;
	};
	Info_ClearChoices	(Gur_1208_BaalCadar_Teach);
	Info_AddChoice		(Gur_1208_BaalCadar_Teach,DIALOG_BACK									,Gur_1208_BaalCadar_Teach_BACK);
	Info_AddChoice		(Gur_1208_BaalCadar_Teach, B_BuildLearnString(NAME_LearnMana_5,5*LPCOST_ATTRIBUTE_MANA,0)		,Gur_1208_BaalCadar_Teach_MAN_5);
	Info_AddChoice		(Gur_1208_BaalCadar_Teach,B_BuildLearnString(NAME_LearnMana_1,LPCOST_ATTRIBUTE_MANA,0)	,Gur_1208_BaalCadar_Teach_MAN_1);
};

func void Gur_1208_BaalCadar_Teach_BACK()
{
	
	Info_ClearChoices	(Gur_1208_BaalCadar_Teach);
};
func void Gur_1208_BaalCadar_Teach_MAN_1()
{
	Mod_KupAtrybut (hero, ATR_MANA_MAX, 1);
	Info_ClearChoices	(Gur_1208_BaalCadar_Teach);
	Info_AddChoice		(Gur_1208_BaalCadar_Teach,DIALOG_BACK									,Gur_1208_BaalCadar_Teach_BACK);
	Info_AddChoice		(Gur_1208_BaalCadar_Teach, B_BuildLearnString(NAME_LearnMana_5,5*LPCOST_ATTRIBUTE_MANA,0)		,Gur_1208_BaalCadar_Teach_MAN_5);
	Info_AddChoice		(Gur_1208_BaalCadar_Teach,B_BuildLearnString(NAME_LearnMana_1,LPCOST_ATTRIBUTE_MANA,0)	,Gur_1208_BaalCadar_Teach_MAN_1);
};

func void Gur_1208_BaalCadar_Teach_MAN_5()
{
	Mod_KupAtrybut (hero, ATR_MANA_MAX, 5);
	Info_ClearChoices	(Gur_1208_BaalCadar_Teach);
	Info_AddChoice		(Gur_1208_BaalCadar_Teach,DIALOG_BACK									,Gur_1208_BaalCadar_Teach_BACK);
	Info_AddChoice		(Gur_1208_BaalCadar_Teach, B_BuildLearnString(NAME_LearnMana_5,5*LPCOST_ATTRIBUTE_MANA,0)		,Gur_1208_BaalCadar_Teach_MAN_5);
	Info_AddChoice		(Gur_1208_BaalCadar_Teach,B_BuildLearnString(NAME_LearnMana_1,LPCOST_ATTRIBUTE_MANA,0)	,Gur_1208_BaalCadar_Teach_MAN_1);

};
/*------------------------------------------------------------------------
							DIE KREISE DER BRUDERSCHAFT									
------------------------------------------------------------------------*/

instance  Gur_1208_BaalCadar_FIRSTTEST (C_INFO)
{
	npc				= Gur_1208_BaalCadar;
	condition		= Gur_1208_BaalCadar_FIRSTTEST_Condition;
	information		= Gur_1208_BaalCadar_FIRSTTEST_Info;
	important		= 0;
	permanent		= 0;
	description		= "Naucz mnie wykorzystywa� magi� runiczn�."; 
};

FUNC int  Gur_1208_BaalCadar_FIRSTTEST_Condition()
{	
	if	C_NpcBelongsToPsiCamp(hero)
	{
		return TRUE;
	};

};
FUNC void  Gur_1208_BaalCadar_FIRSTTEST_Info()
{
	AI_Output (other, self,"Gur_1208_BaalCadar_FIRSTTEST_Info_15_01"); //Naucz mnie wykorzystywa� magi� runiczn�.
	AI_Output (self, other,"Gur_1208_BaalCadar_FIRSTTEST_Info_02_02"); //Wielu pozna�o j�zyk runiczny, ale tylko kilku rozumie natur� ich magii.
	AI_Output (self, other,"Gur_1208_BaalCadar_FIRSTTEST_Info_02_03"); //Spr�buj� ci j� wyja�ni�.
	
	Log_CreateTopic (GE_TeacherPSI,LOG_NOTE);
	B_LogEntry    	(GE_TeacherPSI,	"Baal Cadar wprowadzi mnie w kr�gi magii runicznej.");
		
};

/*------------------------------------------------------------------------
							DER ERSTE KREIS								
------------------------------------------------------------------------*/

instance  Gur_1208_BaalCadar_KREIS1 (C_INFO)
{
	npc				= Gur_1208_BaalCadar;
	condition		= Gur_1208_BaalCadar_KREIS1_Condition;
	information		= Gur_1208_BaalCadar_KREIS1_Info;
	important		= 0;
	permanent		= 1;
	description		= "Jestem got�w, by przyst�pi� do Pierwszego Kr�gu."; 
};

FUNC int  Gur_1208_BaalCadar_KREIS1_Condition()
{	
	if	(Npc_GetTalentSkill (hero,NPC_TALENT_MAGE) == 0)
	&&	(Npc_KnowsInfo (hero,Gur_1208_BaalCadar_FIRSTTEST))
	&&	C_NpcBelongsToPsiCamp(hero)
	{
		return TRUE;
	};

};
FUNC void  Gur_1208_BaalCadar_KREIS1_Info()
{
	AI_Output (other, self,"Gur_1208_BaalCadar_KREIS1_Info_15_01"); //Jestem got�w, by przyst�pi� do Pierwszego Kr�gu.
	if (B_GiveSkill(other,NPC_TALENT_MAGE , 1, LPCOST_TALENT_MAGE_1))
	{
		AI_Output (self, other,"Gur_1208_BaalCadar_KREIS1_Info_02_02"); //S�uchaj mnie uwa�nie:
		AI_Output (self, other,"Gur_1208_BaalCadar_KREIS1_Info_02_03"); //Dawno temu �ni�cy przyby� tutaj i zes�a� ludziom prorocz� wizj�.
		AI_Output (self, other,"Gur_1208_BaalCadar_KREIS1_Info_02_04"); //Jednak wielu z nich nie chcia�o zobaczy� jego pot�gi. Nie chcia�o uwierzy�. Za�lepia�a ich chciwo�� rudy.
		AI_Output (self, other,"Gur_1208_BaalCadar_KREIS1_Info_02_05"); //Tylko Y'Berion, wraz z garstk� towarzyszy us�ucha� g�osu �ni�cego. Tak powsta�o Bractwo.
		AI_Output (self, other,"Gur_1208_BaalCadar_KREIS1_Info_02_06"); //W chwili, w kt�rej po raz pierwszy wst�pili na �cie�k� zbawienia, powsta� r�wnie� Pierwszy Kr�g. Magia runiczna staje si� zrozumia�a dla ka�dego, kto pod��a �ladem �ni�cego.
		Gur_1208_BaalCadar_KREIS1.permanent = 0;
	};
	AI_StopProcessInfos	( self );

};
/*------------------------------------------------------------------------
							DER ZWEITE KREIS									
------------------------------------------------------------------------*/

instance  Gur_1208_BaalCadar_KREIS2 (C_INFO)
{
	npc				= Gur_1208_BaalCadar;
	condition		= Gur_1208_BaalCadar_KREIS2_Condition;
	information		= Gur_1208_BaalCadar_KREIS2_Info;
	important		= 0;
	permanent		= 1;
	description		= "Jestem got�w, by przyst�pi� do Drugiego Kr�gu."; 
};

FUNC int  Gur_1208_BaalCadar_KREIS2_Condition()
{	
	if	(Npc_GetTalentSkill (hero,NPC_TALENT_MAGE) == 1)
	&&	C_NpcBelongsToPsiCamp(hero)
	{
		return TRUE;
	};

};
FUNC void  Gur_1208_BaalCadar_KREIS2_Info()
{
	AI_Output (other, self,"Gur_1208_BaalCadar_KREIS2_Info_15_01"); //Jestem got�w, by przyst�pi� do Drugiego Kr�gu.
	if (B_GiveSkill(other,NPC_TALENT_MAGE , 2,LPCOST_TALENT_MAGE_2))
	{
		AI_Output (self, other,"Gur_1208_BaalCadar_KREIS2_Info_02_02"); //Zatem s�uchaj uwa�nie:
		AI_Output (self, other,"Gur_1208_BaalCadar_KREIS2_Info_02_03"); //�ni�cy wskaza� Y'Berionowi i jego uczniom miejsce, w kt�rym mieli si� osiedli�.
		AI_Output (self, other,"Gur_1208_BaalCadar_KREIS2_Info_02_04"); //Wybrani pracowali bez przerwy, dniem i noc�, niebaczni na niebezpiecze�stwa i zm�czenie. Co chwila przybywali do nich nowi ludzie, gotowi wys�ucha� nauk �ni�cego.
		AI_Output (self, other,"Gur_1208_BaalCadar_KREIS2_Info_02_05"); //Wsp�lnie spr�bowali przez modlitw� zjednoczy� si� duchowo ze �ni�cym.
		AI_Output (self, other,"Gur_1208_BaalCadar_KREIS2_Info_02_06"); //Narodzi� si� Drugi Kr�g.
		Gur_1208_BaalCadar_KREIS2.permanent = 0;
	};
	AI_StopProcessInfos	( self );
};
/*------------------------------------------------------------------------
							DER DRITTE KREIS								
------------------------------------------------------------------------*/

instance  Gur_1208_BaalCadar_KREIS3 (C_INFO)
{
	npc				= Gur_1208_BaalCadar;
	condition		= Gur_1208_BaalCadar_KREIS3_Condition;
	information		= Gur_1208_BaalCadar_KREIS3_Info;
	important		= 0;
	permanent		= 1;
	description		= "Jestem got�w, by przyst�pi� do Trzeciego Kr�gu."; 
};

FUNC int  Gur_1208_BaalCadar_KREIS3_Condition()
{	
	if (Npc_GetTalentSkill (hero,NPC_TALENT_MAGE) == 2)
	&&	C_NpcBelongsToPsiCamp(hero)
	{
		return TRUE;
	};

};
FUNC void  Gur_1208_BaalCadar_KREIS3_Info()
{
	AI_Output (other, self,"Gur_1208_BaalCadar_KREIS3_Info_15_01"); //Jestem got�w, by przyst�pi� do Trzeciego Kr�gu.
	if (B_GiveSkill(other,NPC_TALENT_MAGE , 3, LPCOST_TALENT_MAGE_3))
	{
		AI_Output (self, other,"Gur_1208_BaalCadar_KREIS3_Info_02_02"); //Zapami�taj sobie:
		AI_Output (self, other,"Gur_1208_BaalCadar_KREIS3_Info_02_03"); //Zsy�ane przez �ni�cego wizje by�y co raz wyra�niejsze, ale Bractwo nie dysponowa�o si�� wystarczaj�c� by nawi�za� kontakt.
		AI_Output (self, other,"Gur_1208_BaalCadar_KREIS3_Info_02_04"); //Jeden z Guru, alchemik, znalaz� rozwi�zanie. Przygotowa� nap�j sporz�dzony z wydzieliny z wn�trzno�ci pe�zaczy. Bracia wypili go przed rozpocz�ciem mod��w i ich duchowe si�y zjednoczy�y si� po raz pierwszy.
		AI_Output (self, other,"Gur_1208_BaalCadar_KREIS3_Info_02_05"); //W tym samym czasie nasi Nowicjusze wyruszyli do innych oboz�w, by g�osi� tam nauki �ni�cego i wyprowadzi� niewiernych z b��d�w poga�stwa.
		AI_Output (self, other,"Gur_1208_BaalCadar_KREIS3_Info_02_06"); //W ten spos�b zamkn�� si� Trzeci Kr�g.
	};
	AI_StopProcessInfos	( self );
};
/*------------------------------------------------------------------------
						DER VIERTE KREIS								
------------------------------------------------------------------------*/

instance  Gur_1208_BaalCadar_KREIS4 (C_INFO)
{
	npc				= Gur_1208_BaalCadar;
	condition		= Gur_1208_BaalCadar_KREIS4_Condition;
	information		= Gur_1208_BaalCadar_KREIS4_Info;
	important		= 0;
	permanent		= 1;
	description		= "Jestem got�w, by przyst�pi� do Czwartego Kr�gu."; 
};

FUNC int  Gur_1208_BaalCadar_KREIS4_Condition()
{	
	if (Npc_GetTalentSkill (hero,NPC_TALENT_MAGE) == 3)
	&&	C_NpcBelongsToPsiCamp(hero)
	{
		return TRUE;
	};

};
FUNC void  Gur_1208_BaalCadar_KREIS4_Info()
{
	AI_Output (other, self,"Gur_1208_BaalCadar_KREIS4_Info_15_01"); //Jestem got�w, by przyst�pi� do Czwartego Kr�gu.
	if (B_GiveSkill(other,NPC_TALENT_MAGE , 4, LPCOST_TALENT_MAGE_4))
	{
		AI_Output (self, other,"Gur_1208_BaalCadar_KREIS4_Info_02_02"); //D�ugi czas up�yn�� od chwili za�o�enia Obozu. Wiele si� tutaj zmieni�o.
		AI_Output (self, other,"Gur_1208_BaalCadar_KREIS4_Info_02_03"); //Nasza wiara umocni�a si� i rozprzestrzeni�a.
		AI_Output (self, other,"Gur_1208_BaalCadar_KREIS4_Info_02_04"); //I nie zapomnieli�my o naszym celu. Nie ustali�my w naszych wysi�kach, by przyzwa� �ni�cego do tego �wiata.
		AI_Output (self, other,"Gur_1208_BaalCadar_KREIS4_Info_02_05"); //Trwa�o�� i niezmienno�� naszej wiary symbolizuje Czwarty Kr�g.
		AI_Output (self, other,"Gur_1208_BaalCadar_KREIS4_Info_02_06"); //Teraz wiesz ju� wszystko, co cz�onek Bractwa powinien wiedzie� o magii. By�e� poj�tnym uczniem.
		Gur_1208_BaalCadar_KREIS4.permanent = 0;
	};

};

//========================================
//-----------------> KREIS5_ER
//========================================

INSTANCE DIA_BaalCadar_KREIS5_ER (C_INFO)
{
   npc          = Gur_1208_BaalCadar;
   nr           = 1;
   condition    = DIA_BaalCadar_KREIS5_ER_Condition;
   information  = DIA_BaalCadar_KREIS5_ER_Info;
   permanent	= true;
   description	= "Jestem got�w, by przyst�pi� do Pi�tego Kr�gu.";
};

FUNC INT DIA_BaalCadar_KREIS5_ER_Condition()
{
    if (Npc_GetTrueGuild(hero) == GIL_GUR)
    && (Npc_GetTalentSkill (hero,NPC_TALENT_MAGE) == 4)
    {
    return TRUE;
    };
};


FUNC VOID DIA_BaalCadar_KREIS5_ER_Info()
{

    AI_Output (other, self ,"DIA_BaalCadar_KREIS5_ER_15_01"); //Skoro jestem teraz Guru, to czy nast�pne Kr�gi Magii stoj� przede mn� otworem?
    AI_Output (self, other ,"DIA_BaalCadar_KREIS5_ER_03_02"); //Tak, bracie. Po tym jak poznali�my prawd� o �ni�cym, narodzi� si� Pi�ty Kr�g.
    AI_Output (self, other ,"DIA_BaalCadar_KREIS5_ER_03_03"); //Nowicjusze nie s� w najlepszej kondycji psychicznej, dlatego mo�e go zg��bi� tylko Guru.
	if (B_GiveSkill(other,NPC_TALENT_MAGE , 5, LPCOST_TALENT_MAGE_4))
	{
    AI_Output (other, self ,"DIA_BaalCadar_KREIS5_ER_15_04"); //Jestem got�w, by przyst�pi� do Pi�tego Kr�gu.
    AI_Output (self, other ,"DIA_BaalCadar_KREIS5_ER_03_05"); //Po d�ugim czasie od wielkich odkry� Cor Kaloma, nasz dawny alchemik odkry� w ko�cu spos�b na przyzwanie �ni�cego.
    AI_Output (self, other ,"DIA_BaalCadar_KREIS5_ER_03_06"); //Pos�u�y� si� do tego kamieniem ogniskuj�cym i almanachem Mag�w Ognia.
    AI_Output (self, other ,"DIA_BaalCadar_KREIS5_ER_03_07"); //Przywo�anie �ni�cego odby�o si�. Uczestniczyli w nim wszyscy Nowicjusze, kt�rych moc zjednoczy�a si� po u�yciu kamienia i wypiciu mikstury z jaj pe�zacza.
    AI_Output (self, other ,"DIA_BaalCadar_KREIS5_ER_03_08"); //To jednak nic nie da�o. Wizja okaza�a si� bardzo mglista, a wielki Y'Berion przyp�aci� za ni� �yciem.
    AI_Output (self, other ,"DIA_BaalCadar_KREIS5_ER_03_09"); //Przed �mierci� odkry�, �e �ni�cy jest wybra�cem Beliara i pot�nym Arcydemonem.
    AI_Output (self, other ,"DIA_BaalCadar_KREIS5_ER_03_10"); //Kilku fanatycznych wyznawc�w uda�o si� na poszukiwanie �ni�cego. Ich losy pozostan� dla nas zagadk�.
    AI_Output (self, other ,"DIA_BaalCadar_KREIS5_ER_03_11"); //Tak oto narodzi� si� Pi�ty Kr�g, obrazuj�cy poznanie prawdy oraz nieostro�no��.
    AI_Output (self, other ,"DIA_BaalCadar_KREIS5_ER_03_12"); //Pi�ty Kr�g nie pozwala na u�ywanie magii �ni�cego.
    AI_Output (self, other ,"DIA_BaalCadar_KREIS5_ER_03_13"); //Odk�d go poznali, Guru zacz�li w�ada� magi� nadan� im przez trzech bog�w, wyrzekaj�c si� �ni�cego.
    AI_Output (self, other ,"DIA_BaalCadar_KREIS5_ER_03_14"); //Oto ca�a wiedza magiczna, kt�r� mo�esz posi��� w Bractwie. Pozosta� jeszcze Sz�sty Kr�g, ale jego tajniki poznali tylko nieliczni.
	DIA_BaalCadar_KREIS5_ER.permanent = false;
	};
};


//---------------------------------------------------------
//					MAGISCHEN KRAM KAUFEN
//---------------------------------------------------------
instance  Gur_1208_BaalCadar_SELLSTUFF (C_INFO)
{
	npc				= Gur_1208_BaalCadar;
	condition		= Gur_1208_BaalCadar_SELLSTUFF_Condition;
	information		= Gur_1208_BaalCadar_SELLSTUFF_Info;
	important		= 0;
	permanent		= 1;
	description		= DIALOG_TRADE; 
	trade 			= 1;
};

FUNC int  Gur_1208_BaalCadar_SELLSTUFF_Condition()
{	
	if	(BaalCadar_Ansprechbar == TRUE)
	||	(Npc_GetTrueGuild(other) != GIL_NONE)
	{
		return TRUE;
	};
};
FUNC void  Gur_1208_BaalCadar_SELLSTUFF_Info()
{
	if  (log_baalcadarsell == FALSE)
	{
		Log_CreateTopic   	(GE_TraderPSI,LOG_NOTE);
		B_LogEntry			(GE_TraderPSI,"Guru Baal Cadar sprzedaje runy, magiczne zwoje, napoje, amulety i pier�cienie.");
		log_baalcadarsell = TRUE;
	};	
	AI_Output (other, self,"Gur_1208_BaalCadar_SELLSTUFF_Info_15_01"); //Chcia�bym zdoby� ksi�gi traktuj�ce o magii.

};  

//========================================
//-----------------> AlchemyWHO
//========================================

INSTANCE DIA_BaalCadar_AlchemyWHO (C_INFO)
{
   npc          = Gur_1208_BaalCadar;
   nr           = 1;
   condition    = DIA_BaalCadar_AlchemyWHO_Condition;
   information  = DIA_BaalCadar_AlchemyWHO_Info;
   permanent	= FALSE;
   description	= "Cor Kalom odszed�. W Bractwie nie ma kto zajmowa� si� alchemi�.";
};

FUNC INT DIA_BaalCadar_AlchemyWHO_Condition()
{
    if (CorAngar_FindHerb == LOG_SUCCESS)
    && (Npc_GetTalentSkill(other, NPC_TALENT_PICKLOCK) == 2)
	&& ((Npc_GetTrueGuild (hero) == GIL_TPL) || (Npc_GetTrueGuild (hero) == GIL_NOV))
    {
    return TRUE;
    };
};


FUNC VOID DIA_BaalCadar_AlchemyWHO_Info()
{
    AI_Output (other, self ,"DIA_BaalCadar_AlchemyWHO_15_01"); //Cor Kalom odszed�. W Bractwie nie ma si� kto zajmowa� si� alchemi�.
    AI_Output (self, other ,"DIA_BaalCadar_AlchemyWHO_03_02"); //Masz racj�. B�dziemy potrzebowali kogo�, kto by�by w stanie zast�pi� Cor Kaloma. 
    AI_Output (other, self ,"DIA_BaalCadar_AlchemyWHO_15_03"); //Mistrzu, zale�y mi na kontynuowaniu nauki alchemii. Czy kto� poza Kalomem jest w stanie mi pom�c?
    AI_Output (self, other ,"DIA_BaalCadar_AlchemyWHO_03_04"); //Lata temu ja r�wnie� para�em si� tym zaj�ciem, jednak porzuci�em je na rzecz nauczania.
    AI_Output (other, self ,"DIA_BaalCadar_AlchemyWHO_15_05"); //Pami�tasz co�?
    AI_Output (self, other ,"DIA_BaalCadar_AlchemyWHO_03_06"); //Od d�u�szego czasu nie mia�em fiolki alchemicznej w r�kach...
    AI_Output (other, self ,"DIA_BaalCadar_AlchemyWHO_15_07"); //To dla mnie bardzo wa�ne.
    AI_Output (self, other ,"DIA_BaalCadar_AlchemyWHO_03_08"); //Rozumiem to, dlatego... b�d� ci� uczy�.
    AI_Output (other, self ,"DIA_BaalCadar_AlchemyWHO_15_09"); //Dzi�kuj�, Mistrzu.
	
	Log_CreateTopic   	(GE_TeacherPSI,LOG_NOTE);
	B_LogEntry			(GE_TeacherPSI,"Cor Kalom odszed� z Bractwa, jednak Baal Cadar zgodzi� si� uczy� mnie alchemii. Zr�bi� bardzo wielki wyj�tek specjalnie dla mnie. Musz� to doceni�.");
};

//========================================
//-----------------> KnowsAlchemy
//========================================

INSTANCE DIA_CADAR_KnowsAlchemy2 (C_INFO)
{
   npc          = Gur_1208_BaalCadar;
   nr           = 4;
   condition    = DIA_CADAR_KnowsAlchemy2_Condition;
   information  = DIA_CADAR_KnowsAlchemy2_Info;
   permanent	= true;
   description	=  B_BuildLearnString(NAME_LearnAlchemy_1, LPCOST_TALENT_ALCHEMY_1,150);
};

FUNC INT DIA_CADAR_KnowsAlchemy2_Condition()
{
    if (Npc_GetTalentSkill(other, NPC_TALENT_FIREMASTER) == 0) && (Npc_KnowsInfo (hero, DIA_BaalCadar_AlchemyWHO))
    {
    return TRUE;
    };
};


FUNC VOID DIA_CADAR_KnowsAlchemy2_Info()
{
    AI_Output (other, self ,"DIA_CADAR_KnowsAlchemy2_15_01"); //Naucz mnie podstaw alchemii.
    if  (hero.lp >= 10) && (Npc_HasItems (hero, ItMiNugget)>=150)
    {
        AI_Output (self, other ,"DIA_CADAR_KnowsAlchemy2_03_02"); //No dobrze. Naucz� ci� warzy� proste mikstury i alkohole, oraz przygotowywa� tyto�.
        AI_Output (self, other ,"DIA_CADAR_KnowsAlchemy2_03_03"); //To wcale nie jest takie trudne.
        AI_Output (self, other ,"DIA_CADAR_KnowsAlchemy2_03_04"); //Przede wszystkim potrzebujesz przepisu.
        AI_Output (self, other ,"DIA_CADAR_KnowsAlchemy2_03_05"); //Szczeg�lnie dla trudniejszych mikstur.
        AI_Output (self, other ,"DIA_CADAR_KnowsAlchemy2_03_06"); //Podstawowe mo�esz pr�bowa� uwarzy� sam.
        AI_Output (self, other ,"DIA_CADAR_KnowsAlchemy2_03_07"); //Kieruj si� zdrowym rozs�dkiem i b�d� spokojny.
        AI_Output (self, other ,"DIA_CADAR_KnowsAlchemy2_03_08"); //Ostro�nie dawkuj sk�adniki. 
		Npc_SetTalentSkill(hero, NPC_TALENT_FIREMASTER, 1);
		PrintScreen	("Nowa umiej�tno��: Alchemia", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		B_GiveInvItems (other, self, ItMiNugget, 150);
		hero.lp = hero.lp - 10;
		DIA_CADAR_KnowsAlchemy2.permanent = false;
    }
    else
    {
    AI_Output (self, other ,"DIA_CADAR_KnowsAlchemy2_03_09"); //Nie mog� ci� tego nauczy�.
	DIA_CADAR_KnowsAlchemy2.permanent = true;
	if (!hero.lp >= 10)
	{
	PrintScreen (HAVENT_LP,-1, 18, "Font_New_10_Red.TGA", 2);
	};
	if (!Npc_HasItems (other, ItMiNugget) >=150)
	{
	PrintScreen (HAVENT_ORE,-1, 21, "Font_New_10_Red.TGA", 2);
	};
    AI_StopProcessInfos	(self);
    };

};



//========================================
//-----------------> KnowsAlchemy
//========================================

INSTANCE DIA_CADAR_KnowsAlchemy2_L2 (C_INFO)
{
   npc          = Gur_1208_BaalCadar;
   nr           = 4;
   condition    = DIA_CADAR_KnowsAlchemy2_L2_Condition;
   information  = DIA_CADAR_KnowsAlchemy2_L2_Info;
   permanent	= true;
   description	=  B_BuildLearnString(NAME_LearnAlchemy_2, LPCOST_TALENT_ALCHEMY_2,360);
};

FUNC INT DIA_CADAR_KnowsAlchemy2_L2_Condition()
{
    if (Npc_GetTalentSkill(other, NPC_TALENT_FIREMASTER) == 1) && (Npc_KnowsInfo (hero, DIA_BaalCadar_AlchemyWHO))
    {
    return TRUE;
    };
};


FUNC VOID DIA_CADAR_KnowsAlchemy2_L2_Info()
{
    AI_Output (other, self ,"DIA_CADAR_KnowsAlchemy2_L2_15_01"); //Naucz mnie z�o�onej alchemii.
    if  (hero.lp >= 20) && (Npc_HasItems (hero, ItMiNugget) >=360)
    {
        AI_Output (self, other ,"DIA_CADAR_KnowsAlchemy2_l2_03_02"); //Aby przyrz�dzi� trudniejsze mikstury, b�dziesz potrzebowa� przepisu.
        AI_Output (self, other ,"DIA_CADAR_KnowsAlchemy2_l2_03_03"); //Nigdy nie pr�buj sam wytwarza� silnych mikstur. Wielu alchemik�w przyp�aci�o to �yciem.
        AI_Output (self, other ,"DIA_CADAR_KnowsAlchemy2_l2_03_04"); //Wa�ne s� tutaj sk�adniki. To, z czym b�dziesz mia� do czynienia, to nie byle ziele - to swoiste pok�ady magicznej energii drzemi�cej w li�ciach i �odygach.
        AI_Output (self, other ,"DIA_CADAR_KnowsAlchemy2_l2_03_05"); //Bogowie obdarzyli nas umiej�tno�ci� syntezy tej energii.
        AI_Output (self, other ,"DIA_CADAR_KnowsAlchemy2_l2_03_06"); //Gotowe mikstury b�dziesz m�g� ulepszy�.
        AI_Output (self, other ,"DIA_CADAR_KnowsAlchemy2_l2_03_07"); //Podstawowym czynnikiem wzmacniaj�cym jest czysty alkohol. 
        AI_Output (self, other ,"DIA_CADAR_KnowsAlchemy2_l2_03_08"); //To tyle. B�d� ostro�ny.
		Npc_SetTalentSkill(hero, NPC_TALENT_FIREMASTER, 2);
		PrintScreen	("Post�p w umiej�tno�ci: Alchemia", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		B_GiveInvItems (other, self, ItMiNugget, 360);
		hero.lp = hero.lp - 20;
		DIA_CADAR_KnowsAlchemy2_l2.permanent = false;
    }
    else
    {
    AI_Output (self, other ,"DIA_CADAR_KnowsAlchemy2_l2_03_09"); //Nie mog� ci� tego nauczy�.
	DIA_CADAR_KnowsAlchemy2_l2.permanent = true;
	if (!hero.lp >= 20)
	{
	PrintScreen (HAVENT_LP,-1, 18, "Font_New_10_Red.TGA", 2);
	};
	if (!Npc_HasItems (other, ItMiNugget) >=360)
	{
	PrintScreen (HAVENT_ORE,-1, 21, "Font_New_10_Red.TGA", 2);
	};
    AI_StopProcessInfos	(self);
    };

};


/*------------------------------------------------------------------------
						IMPORTANT GURU TEST!						
------------------------------------------------------------------------*/

instance  Gur_1208_BaalCadar_BOOK (C_INFO)
{
	npc				= Gur_1208_BaalCadar;
	condition		= Gur_1208_BaalCadar_BOOK_Condition;
	information		= Gur_1208_BaalCadar_BOOK_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  Gur_1208_BaalCadar_BOOK_Condition()
{	
	if (Npc_KnowsInfo(hero, DIA_CorAngar_GuruMomPlese))
	{
		return TRUE;
	};

};
FUNC void  Gur_1208_BaalCadar_BOOK_Info()
{
		AI_Output (self, other,"Gur_1208_BaalCadar_BOOK_Info_02_01"); //Zaczekaj. Mam dla ciebie pewn� ciekaw� ksi��k�. 
		AI_Output (other, self,"Gur_1208_BaalCadar_BOOK_Info_15_02"); //W�a�nie przychodz� w jej sprawie. Ile b�dzie mnie ona kosztowa�, mistrzu Baal Cadarze? 
		AI_Output (self, other,"Gur_1208_BaalCadar_BOOK_Info_02_03"); //Odkupi�em j� od Maga Wody Merdariona. Powiedzia�, �e przyni�s� mu j� jaki� Najemnik. 
		AI_Output (self, other,"Gur_1208_BaalCadar_BOOK_Info_02_04"); //My�l�, �e 400 bry�ek rudy to uczciwa cena w zamian za jej niezwykle interesuj�c� zawarto��. 
		B_LogEntry               (CH3_TestGuru,"Baal Cadar chce za ksi��k� 400 bry�ek rudy. Chyba b�d� zmuszony zap�aci�, je�li naprawd� chc� pozna� jej tajemnic�.");
};

/*------------------------------------------------------------------------
						GIVE BOOK				
------------------------------------------------------------------------*/

instance  Gur_1208_BaalCadar_BUY (C_INFO)
{
	npc				= Gur_1208_BaalCadar;
	condition		= Gur_1208_BaalCadar_BUY_Condition;
	information		= Gur_1208_BaalCadar_BUY_Info;
	important		= 0;
	permanent		= 0;
	description		= "Kupi� t� ksi��k�."; 
};

FUNC int  Gur_1208_BaalCadar_BUY_Condition()
{	
	if (Npc_KnowsInfo(hero, Gur_1208_BaalCadar_BOOK)) && (Npc_HasItems(other,ItMiNugget)>400)
	{
		return TRUE;
	};

};
FUNC void  Gur_1208_BaalCadar_BUY_Info()
{
		AI_Output (other, self,"Gur_1208_BaalCadar_BUY_Info_15_01"); //Kupi� t� ksi��k�.
		AI_Output (self, other,"Gur_1208_BaalCadar_BUY_Info_02_02"); //Wiedzia�em, �e nie b�dziesz si� d�ugo zastanawia�.
		AI_Output (other, self,"Gur_1208_BaalCadar_BUY_Info_15_03"); //Czyta�e� j�, mistrzu?
		AI_Output (self, other,"Gur_1208_BaalCadar_BUY_Info_02_04"); //Owszem. Nawet kilkakrotnie. Stworzenie mikstury wymaga niezwyk�ej precyzji i znajomo�ci alchemii. Ale nie to jest w tym wszystkim najtrudniejsze.
		AI_Output (other, self,"Gur_1208_BaalCadar_BUY_Info_15_05"); //A wi�c co?
		AI_Output (self, other,"Gur_1208_BaalCadar_BUY_Info_02_06"); //Zdobycie sk�adnik�w... Wi�kszo�� z nich to po prostu unikaty, kt�re niezwykle ci�ko znale�� w Kolonii. 
		AI_Output (self, other,"Gur_1208_BaalCadar_BUY_Info_02_07"); //Mimo to ustali�em ju� miejsca w kt�rych te ro�liny mog� wyst�powa�. Wys�a�em nawet kilku Nowicjuszy na poszukiwania. 
		AI_Output (self, other,"Gur_1208_BaalCadar_BUY_Info_02_08"); //Ale mo�emy o tym porozmawia�, gdy przeczytasz ju� notatki.
		
		B_GiveInvItems	(hero, self, ItMiNugget, 400);
		CreateInvItems (self, ItWr_Mod_ReceptClarityMixture, 1);
		B_GiveInvItems (self, other, ItWr_Mod_ReceptClarityMixture, 1);
		
		B_LogEntry               (CH3_TestGuru,"Odkupi�em ksi�g� od Guru. Co ciekawe Baal Cadar opowiedzia� mi co nieco o miksturze. Okazuje si�, �e wi�kszo�� jej sk�adnik�w to niezwykle rzadkie unikaty, kt�rych znalezienie w Kolonii graniczy z cudem. Na szcz�cie zaoferowa� mi swoj� pomoc. Musz� przeczyta� notatki i z nim porozmawia�.");
};

//========================================
//-----------------> ReadAboutClarity
//========================================

INSTANCE DIA_BaalCadar_ReadAboutClarity (C_INFO)
{
   npc          = Gur_1208_BaalCadar;
   nr           = 1;
   condition    = DIA_BaalCadar_ReadAboutClarity_Condition;
   information  = DIA_BaalCadar_ReadAboutClarity_Info;
   permanent	= FALSE;
   description	= "Przeczyta�em notatki.";
};

FUNC INT DIA_BaalCadar_ReadAboutClarity_Condition()
{
    if (MIS_TestGuru == LOG_RUNNING)
    && (HeroKnows_AlchemyClarityMixture == true)
    {
    return TRUE;
    };
};


FUNC VOID DIA_BaalCadar_ReadAboutClarity_Info()
{
    AI_Output (other, self ,"DIA_BaalCadar_ReadAboutClarity_15_01"); //Przeczyta�em notatki.
    AI_Output (self, other ,"DIA_BaalCadar_ReadAboutClarity_03_02"); //A ja by� mo�e ustali�em po�o�enie wszystkich sk�adnik�w. To znaczy nie mam pewno�ci, �e uda ci si� wszystko znale�� w wyznaczonych miejscach...
    AI_Output (other, self ,"DIA_BaalCadar_ReadAboutClarity_15_03"); //Na pewno warto spr�bowa�.

    Info_ClearChoices		(DIA_BaalCadar_ReadAboutClarity);
	Info_AddChoice		(DIA_BaalCadar_ReadAboutClarity, "Co ze �wietlistym grzybem? ", DIA_BaalCadar_ReadAboutClarity_LightMushroom);
    Info_AddChoice		(DIA_BaalCadar_ReadAboutClarity, "Gdzie powinienem szuka� li�ci sza�wii? ", DIA_BaalCadar_ReadAboutClarity_Sage);
	Info_AddChoice		(DIA_BaalCadar_ReadAboutClarity, "Gdzie znajd� wilcze jagody?", DIA_BaalCadar_ReadAboutClarity_WolfBerrys);
    
};

FUNC VOID DIA_BaalCadar_ReadAboutClarity_WolfBerrys()
{
    AI_Output (other, self ,"DIA_BaalCadar_ReadAboutClarity_WolfBerrys_15_01"); //Gdzie znajd� wilcze jagody?
    AI_Output (self, other ,"DIA_BaalCadar_ReadAboutClarity_WolfBerrys_03_02"); //Powinny by� do�� blisko. Pami�tasz jak Y'Berion wys�a� ci� na poszukiwania pierwszego kamienia ogniskuj�cego?
    AI_Output (other, self ,"DIA_BaalCadar_ReadAboutClarity_WolfBerrys_15_03"); //Tak.
    AI_Output (self, other ,"DIA_BaalCadar_ReadAboutClarity_WolfBerrys_03_04"); //A wi�c id� w to samo miejsce po czym udaj si� dalej wzd�u� klifu. Id� po prostu obok lasu.
    AI_Output (self, other ,"DIA_BaalCadar_ReadAboutClarity_WolfBerrys_03_05"); //Gdy ju� przejdziesz na drug� stron�, powiniene� spotka� Nowicjusza, kt�rego wys�a�em wcze�niej na poszukiwania. 
    AI_Output (self, other ,"DIA_BaalCadar_ReadAboutClarity_WolfBerrys_03_06"); //Skorzystaj z jego pomocy. Razem na pewno co� znajdziecie. 
    B_LogEntry                     (CH3_TestGuru,"Wilczych jag�d powinienem szuka� na wy�ynie nad Bractwem, po drugiej stronie klifu. Baal Cadar wys�a� w tamte strony Nowicjusza, kt�ry mi pomo�e. ");
	
	Npc_ExchangeRoutine	(NOV_1322_Novize,"wolfberrys");
	Wld_InsertNpc		(Beast_Cliff,"OW_MIS_CREATURE_WOLFBERRYS");
};

FUNC VOID DIA_BaalCadar_ReadAboutClarity_Sage()
{
    AI_Output (other, self ,"DIA_BaalCadar_ReadAboutClarity_Sage_15_01"); //Gdzie powinienem szuka� li�ci sza�wii? 
    AI_Output (self, other ,"DIA_BaalCadar_ReadAboutClarity_Sage_03_02"); //Sza�wia to niezwykle stara ro�lina maj�ca silne w�a�ciwo�ci lecznicze i oczyszczaj�ce.
    AI_Output (self, other ,"DIA_BaalCadar_ReadAboutClarity_Sage_03_03"); //Nic wi�c dziwnego, �e jest ju� prawie niespotykana. Wcze�niej by�a cz�sto wykorzystywana do leczenia.
    AI_Output (self, other ,"DIA_BaalCadar_ReadAboutClarity_Sage_03_04"); //Dlatego jest ju� jej niezwykle ma�o...
    AI_Output (other, self ,"DIA_BaalCadar_ReadAboutClarity_Sage_15_05"); //A wi�c powinienem szuka� w jakim� odludnym miejscu? Tam gdzie od lat nie kr�cili si� �adni zbieracze ani alchemicy?
    AI_Output (self, other ,"DIA_BaalCadar_ReadAboutClarity_Sage_03_06"); //Jedynym takim miejscem s� Ziemie Ork�w. Od czas�w wojny ludzie si� tam nie zapuszczaj�. 
    AI_Output (self, other ,"DIA_BaalCadar_ReadAboutClarity_Sage_03_07"); //Orkowie raczej nie korzystaj� z tych zi�, wi�c w�a�nie tam powiniene� szuka�.
    B_LogEntry                     (CH3_TestGuru,"Sza�wii mam szuka� na Ziemiach Ork�w. Nie do��, �e jest tam niebezpiecznie to nie wiem od jakiego miejsca zacz��. Chyba b�d� musia� przeczesa� ka�d� polank�. ");
	
	Wld_InsertNpc		(Beast_OrcTower,"OW_ORC_LOOKOUT_2_02");
};

FUNC VOID DIA_BaalCadar_ReadAboutClarity_LightMushroom()
{
    AI_Output (other, self ,"DIA_BaalCadar_ReadAboutClarity_LightMushroom_15_01"); //Co ze �wietlistym grzybem?
    AI_Output (self, other ,"DIA_BaalCadar_ReadAboutClarity_LightMushroom_03_02"); //Je�li gdzie� jakiego� znajdziesz w tym przekl�tym miejscu to tylko na najwy�szym szczycie w Kolonii. 
    AI_Output (self, other ,"DIA_BaalCadar_ReadAboutClarity_LightMushroom_03_03"); //M�wi� o okolicach starej Cytadeli. Wys�a�em tam jednego ze Stra�nik�w �wi�tynnych. Skorzystaj z jego pomocy.
	//AI_Output (self, other ,"DIA_BaalCadar_ReadAboutClarity_LightMushroom_03_04"); //Stra�nik nazywa si� Gor Na Ran. Na pewno ju� go znasz.
	
    B_LogEntry                     (CH3_TestGuru,"Przy starej Cytadeli mam szuka� �wietlistego grzyba. Guru wys�a� tam na poszukiwania Stra�nika �wi�tynnego, kt�ry mo�e mi pom�c."); 
	
	Npc_ExchangeRoutine	(TPL_1408_Templer,"ligthmushroom");
	TPL_1408_Templer.flags = 2;
	Wld_InsertNpc		(Beast_Citadel,"OW_MIS_CREATURE_LIGHTMUSHROOM");
};

//========================================
//-----------------> AllIngredients
//========================================

INSTANCE DIA_BaalCadar_AllIngredients (C_INFO)
{
   npc          = Gur_1208_BaalCadar;
   nr           = 1;
   condition    = DIA_BaalCadar_AllIngredients_Condition;
   information  = DIA_BaalCadar_AllIngredients_Info;
   permanent	= FALSE;
   description	= "Zdoby�em wszystkie sk�adniki.";
};

FUNC INT DIA_BaalCadar_AllIngredients_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_BaalCadar_ReadAboutClarity))
    && (Npc_HasItems (other, ItFo_Mod_WolfBerrys) >=1)
    && (Npc_HasItems (other, ItFo_Mod_Sage) >=1)
    && (Npc_HasItems (other, itFo_Mod_LightMushroom) >=1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_BaalCadar_AllIngredients_Info()
{
    AI_Output (other, self ,"DIA_BaalCadar_AllIngredients_15_01"); //Zdoby�em wszystkie sk�adniki.
    AI_Output (self, other ,"DIA_BaalCadar_AllIngredients_03_02"); //Niewiarygodne! Znalaz�e� je w miejscach o kt�rych ci m�wi�em?
    AI_Output (other, self ,"DIA_BaalCadar_AllIngredients_15_03"); //Tak. Najwi�cej czasu zaj�y poszukiwania sza�wii, ale uda�o mi si� znale�� jedn� tak� ro�lin� na Ziemiach Ork�w.
    AI_Output (self, other ,"DIA_BaalCadar_AllIngredients_03_04"); //Czy Stra�nik i Nowicjusz, kt�rych wys�a�em ci pomogli?
    AI_Output (other, self ,"DIA_BaalCadar_AllIngredients_15_05"); //C�, Nowicjusz nie �yje. W wyznaczonych przez ciebie miejscach spotka�em dziwne istoty. 
    AI_Output (other, self ,"DIA_BaalCadar_AllIngredients_15_06"); //Nigdy nie wiedzia�em takich stworze�. Wygl�da�y jakby zosta�y przywo�ane z otch�ani Beliara.
    AI_Output (other, self ,"DIA_BaalCadar_AllIngredients_15_07"); //Wiesz kto mo�e za tym sta�?
    AI_Output (self, other ,"DIA_BaalCadar_AllIngredients_03_08"); //Obawiam si�, �e to sam �ni�cy. Wie, �e jego byt nie jest ju� zagadk� i chce si� broni�.
    AI_Output (self, other ,"DIA_BaalCadar_AllIngredients_03_09"); //Zostaj�c Guru b�dziesz korzysta� z jego mocy. By� mo�e obawia si�, �e obr�cisz ni� przeciwko niemu?
    AI_Output (other, self ,"DIA_BaalCadar_AllIngredients_15_10"); //Je�li tylko b�d� mia� okazj� to tak zrobi�. 
    AI_Output (self, other ,"DIA_BaalCadar_AllIngredients_03_11"); //Uwa�aj na siebie. �ni�cy nie jest zwyczajnym demonem. To pot�na istota. Pami�taj o tym. 
    AI_Output (self, other ,"DIA_BaalCadar_AllIngredients_03_12"); //Lepiej id� ju� przygotowywa� mikstur�. Najlepiej skorzystaj ze sto�u alchemicznego w chacie Kaloma.
	
	B_LogEntry                     (CH3_TestGuru,"Baal Cadar twierdzi, �e magiczne bestie, kt�re spotka�em zosta�y zes�ane przez samego �ni�cego. Demon nie chce dopu�ci�, abym posiad� cz�� jego mocy. ");
	 
    AI_StopProcessInfos	(self);
	
	TPL_1408_Templer.flags = 0;
};

