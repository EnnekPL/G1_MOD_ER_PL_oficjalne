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
// 					NICHT ansprechbar (Ungläubiger) 
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
	Info_Addchoice 		(DIA_BaalCadar_NoTalk,"Wszystko w porz¹dku, kolego?"			,DIA_BaalCadar_NoTalk_Imp);
	Info_Addchoice 		(DIA_BaalCadar_NoTalk,"Niech Œni¹cy bêdzie z tob¹!"	,DIA_BaalCadar_NoTalk_Sleeper);
	Info_Addchoice 		(DIA_BaalCadar_NoTalk,"Czeœæ! Jestem tu nowy!"		,DIA_BaalCadar_NoTalk_Hi);
};

func void DIA_BaalCadar_NoTalk_Hi()
{
	AI_Output (other, self,"DIA_BaalCadar_NoTalk_Hi_15_00"); //Czeœæ! Jestem tu nowy!
	AI_Output (self, other,"DIA_BaalCadar_NoTalk_Hi_02_01"); //(Wzdycha)
	BaalCadar_Sakrileg = TRUE;
};

func void DIA_BaalCadar_NoTalk_Sleeper()
{
	AI_Output (other, self,"DIA_BaalCadar_NoTalk_Sleeper_15_00"); //Niech Œni¹cy bêdzie z tob¹!
	AI_Output (self, other,"DIA_BaalCadar_NoTalk_Sleeper_02_01"); //(Wzdycha)
	BaalCadar_Sakrileg = TRUE;
};

func void DIA_BaalCadar_NoTalk_Imp()
{
	AI_Output (other, self,"DIA_BaalCadar_NoTalk_Imp_15_00"); //Wszystko w porz¹dku, kolego? 
	AI_Output (self, other,"DIA_BaalCadar_NoTalk_Imp_02_01"); //(Wzdycha)
	BaalCadar_Sakrileg = TRUE;
};

func void DIA_BaalCadar_NoTalk_ENDE()
{
	AI_StopProcessInfos	(self);
};

/*


	AI_Output (self, other,"Sit_1_PSI_BaalCadar_HypnoticTeacher_2FuncNo_02_01"); //Du solltest deinen Weg mit Bedacht wählen und nach reiflicher Überlegung. 
	AI_Output (self, other,"Sit_1_PSI_BaalCadar_HypnoticTeacher_2FuncNo_02_02"); //Bedenke wie du entscheidest. In den anderen Lagern bekommst zwar Schutz und Nahrung, aber ist es das, was du willst?
	AI_Output (self, other,"Sit_1_PSI_BaalCadar_HypnoticTeacher_2FuncNo_15_03"); //Was erwartet mich, was es wert wäre, zu euch zu kommen?
	AI_Output (self, other,"Sit_1_PSI_BaalCadar_HypnoticTeacher_2FuncNo_02_04"); //Ich könnte dir jetzt erzählen, das die Templer einen unbezwinglichen Willen haben,das die magische Macht der Gurus, die Vorstellungskraft von Feuer- und Wassermagiern bei weitem übersteigt.
	AI_Output (self, other,"Sit_1_PSI_BaalCadar_HypnoticTeacher_2FuncNo_02_05"); //Das unsere Nahrung auch satt macht. Aber das ist es nicht, was diese Gemeinschaft ausmacht.
	AI_Output (self, other,"Sit_1_PSI_BaalCadar_HypnoticTeacher_2FuncNo_02_06"); //Was dich hier erwartet, ist die Gabe. Du wirst einen Weg beschreiten, der dir sehr viel abverlangt.
	AI_Output (self, other,"Sit_1_PSI_BaalCadar_HypnoticTeacher_2FuncNo_02_07"); //Aber das was du erreichen wirst ist eine Größe, eine Macht die dir Erleuchtung schenkt. Eine Macht, die dich zur Freiheit führt.
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
	AI_Output (self, other,"DIA_BaalCadar_SleepSpell_02_00"); //Co ty wyprawiasz? Próbujê medytowaæ z moimi uczniami.
	AI_Output (self, other,"DIA_BaalCadar_SleepSpell_02_01"); //Kto ciê nauczy³ wykorzystywaæ magiczne moce Œni¹cego?
	AI_Output (other, self,"DIA_BaalCadar_SleepSpell_15_02"); //Nikt. To by³o ca³kiem proste!
	AI_Output (self, other,"DIA_BaalCadar_SleepSpell_02_03"); //Wygl¹dasz mi na pojêtnego ucznia. Bêdê twoim mistrzem.

	BaalCadar_Ansprechbar = TRUE;
	if	(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		Log_CreateTopic		(CH1_JoinPsi,	LOG_MISSION);
		Log_SetTopicStatus	(CH1_JoinPsi,	LOG_RUNNING);
	};
	B_LogEntry		(CH1_JoinPsi,	"Baal Cadar ma mnie za pojêtnego ucznia!");
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
	description		= "Chcia³bym zwiêkszyæ potêgê moich zaklêæ."; 
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
	AI_Output (other, self,"Gur_1208_BaalCadar_Teach_Info_15_01"); //Chcia³bym zwiêkszyæ potêgê moich zaklêæ!
	AI_Output (self, other,"Gur_1208_BaalCadar_Teach_Info_02_02"); //Kluczem do tego jest si³a twego ducha.
	
	if (log_baalcadartrain == FALSE) 
	{
		Log_CreateTopic   	(GE_TeacherPSI,LOG_NOTE);
		B_LogEntry			(GE_TeacherPSI,"Guru Baal Cadar pomo¿e mi zwiêkszyæ moj¹ mane.");
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
	description		= "Naucz mnie wykorzystywaæ magiê runiczn¹."; 
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
	AI_Output (other, self,"Gur_1208_BaalCadar_FIRSTTEST_Info_15_01"); //Naucz mnie wykorzystywaæ magiê runiczn¹.
	AI_Output (self, other,"Gur_1208_BaalCadar_FIRSTTEST_Info_02_02"); //Wielu pozna³o jêzyk runiczny, ale tylko kilku rozumie naturê ich magii.
	AI_Output (self, other,"Gur_1208_BaalCadar_FIRSTTEST_Info_02_03"); //Spróbujê ci j¹ wyjaœniæ.
	
	Log_CreateTopic (GE_TeacherPSI,LOG_NOTE);
	B_LogEntry    	(GE_TeacherPSI,	"Baal Cadar wprowadzi mnie w krêgi magii runicznej.");
		
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
	description		= "Jestem gotów, by przyst¹piæ do Pierwszego Krêgu."; 
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
	AI_Output (other, self,"Gur_1208_BaalCadar_KREIS1_Info_15_01"); //Jestem gotów, by przyst¹piæ do Pierwszego Krêgu.
	if (B_GiveSkill(other,NPC_TALENT_MAGE , 1, LPCOST_TALENT_MAGE_1))
	{
		AI_Output (self, other,"Gur_1208_BaalCadar_KREIS1_Info_02_02"); //S³uchaj mnie uwa¿nie:
		AI_Output (self, other,"Gur_1208_BaalCadar_KREIS1_Info_02_03"); //Dawno temu Œni¹cy przyby³ tutaj i zes³a³ ludziom prorocz¹ wizjê.
		AI_Output (self, other,"Gur_1208_BaalCadar_KREIS1_Info_02_04"); //Jednak wielu z nich nie chcia³o zobaczyæ jego potêgi. Nie chcia³o uwierzyæ. Zaœlepia³a ich chciwoœæ rudy.
		AI_Output (self, other,"Gur_1208_BaalCadar_KREIS1_Info_02_05"); //Tylko Y'Berion, wraz z garstk¹ towarzyszy us³ucha³ g³osu Œni¹cego. Tak powsta³o Bractwo.
		AI_Output (self, other,"Gur_1208_BaalCadar_KREIS1_Info_02_06"); //W chwili, w której po raz pierwszy wst¹pili na œcie¿kê zbawienia, powsta³ równie¿ Pierwszy Kr¹g. Magia runiczna staje siê zrozumia³a dla ka¿dego, kto pod¹¿a œladem Œni¹cego.
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
	description		= "Jestem gotów, by przyst¹piæ do Drugiego Krêgu."; 
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
	AI_Output (other, self,"Gur_1208_BaalCadar_KREIS2_Info_15_01"); //Jestem gotów, by przyst¹piæ do Drugiego Krêgu.
	if (B_GiveSkill(other,NPC_TALENT_MAGE , 2,LPCOST_TALENT_MAGE_2))
	{
		AI_Output (self, other,"Gur_1208_BaalCadar_KREIS2_Info_02_02"); //Zatem s³uchaj uwa¿nie:
		AI_Output (self, other,"Gur_1208_BaalCadar_KREIS2_Info_02_03"); //Œni¹cy wskaza³ Y'Berionowi i jego uczniom miejsce, w którym mieli siê osiedliæ.
		AI_Output (self, other,"Gur_1208_BaalCadar_KREIS2_Info_02_04"); //Wybrani pracowali bez przerwy, dniem i noc¹, niebaczni na niebezpieczeñstwa i zmêczenie. Co chwila przybywali do nich nowi ludzie, gotowi wys³uchaæ nauk Œni¹cego.
		AI_Output (self, other,"Gur_1208_BaalCadar_KREIS2_Info_02_05"); //Wspólnie spróbowali przez modlitwê zjednoczyæ siê duchowo ze Œni¹cym.
		AI_Output (self, other,"Gur_1208_BaalCadar_KREIS2_Info_02_06"); //Narodzi³ siê Drugi Kr¹g.
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
	description		= "Jestem gotów, by przyst¹piæ do Trzeciego Krêgu."; 
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
	AI_Output (other, self,"Gur_1208_BaalCadar_KREIS3_Info_15_01"); //Jestem gotów, by przyst¹piæ do Trzeciego Krêgu.
	if (B_GiveSkill(other,NPC_TALENT_MAGE , 3, LPCOST_TALENT_MAGE_3))
	{
		AI_Output (self, other,"Gur_1208_BaalCadar_KREIS3_Info_02_02"); //Zapamiêtaj sobie:
		AI_Output (self, other,"Gur_1208_BaalCadar_KREIS3_Info_02_03"); //Zsy³ane przez Œni¹cego wizje by³y co raz wyraŸniejsze, ale Bractwo nie dysponowa³o si³¹ wystarczaj¹c¹ by nawi¹zaæ kontakt.
		AI_Output (self, other,"Gur_1208_BaalCadar_KREIS3_Info_02_04"); //Jeden z Guru, alchemik, znalaz³ rozwi¹zanie. Przygotowa³ napój sporz¹dzony z wydzieliny z wnêtrznoœci pe³zaczy. Bracia wypili go przed rozpoczêciem mod³ów i ich duchowe si³y zjednoczy³y siê po raz pierwszy.
		AI_Output (self, other,"Gur_1208_BaalCadar_KREIS3_Info_02_05"); //W tym samym czasie nasi Nowicjusze wyruszyli do innych obozów, by g³osiæ tam nauki Œni¹cego i wyprowadziæ niewiernych z b³êdów pogañstwa.
		AI_Output (self, other,"Gur_1208_BaalCadar_KREIS3_Info_02_06"); //W ten sposób zamkn¹³ siê Trzeci Kr¹g.
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
	description		= "Jestem gotów, by przyst¹piæ do Czwartego Krêgu."; 
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
	AI_Output (other, self,"Gur_1208_BaalCadar_KREIS4_Info_15_01"); //Jestem gotów, by przyst¹piæ do Czwartego Krêgu.
	if (B_GiveSkill(other,NPC_TALENT_MAGE , 4, LPCOST_TALENT_MAGE_4))
	{
		AI_Output (self, other,"Gur_1208_BaalCadar_KREIS4_Info_02_02"); //D³ugi czas up³yn¹³ od chwili za³o¿enia Obozu. Wiele siê tutaj zmieni³o.
		AI_Output (self, other,"Gur_1208_BaalCadar_KREIS4_Info_02_03"); //Nasza wiara umocni³a siê i rozprzestrzeni³a.
		AI_Output (self, other,"Gur_1208_BaalCadar_KREIS4_Info_02_04"); //I nie zapomnieliœmy o naszym celu. Nie ustaliœmy w naszych wysi³kach, by przyzwaæ Œni¹cego do tego œwiata.
		AI_Output (self, other,"Gur_1208_BaalCadar_KREIS4_Info_02_05"); //Trwa³oœæ i niezmiennoœæ naszej wiary symbolizuje Czwarty Kr¹g.
		AI_Output (self, other,"Gur_1208_BaalCadar_KREIS4_Info_02_06"); //Teraz wiesz ju¿ wszystko, co cz³onek Bractwa powinien wiedzieæ o magii. By³eœ pojêtnym uczniem.
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
   description	= "Jestem gotów, by przyst¹piæ do Pi¹tego Krêgu.";
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

    AI_Output (other, self ,"DIA_BaalCadar_KREIS5_ER_15_01"); //Skoro jestem teraz Guru, to czy nastêpne Krêgi Magii stoj¹ przede mn¹ otworem?
    AI_Output (self, other ,"DIA_BaalCadar_KREIS5_ER_03_02"); //Tak, bracie. Po tym jak poznaliœmy prawdê o Œni¹cym, narodzi³ siê Pi¹ty Kr¹g.
    AI_Output (self, other ,"DIA_BaalCadar_KREIS5_ER_03_03"); //Nowicjusze nie s¹ w najlepszej kondycji psychicznej, dlatego mo¿e go zg³êbiæ tylko Guru.
	if (B_GiveSkill(other,NPC_TALENT_MAGE , 5, LPCOST_TALENT_MAGE_4))
	{
    AI_Output (other, self ,"DIA_BaalCadar_KREIS5_ER_15_04"); //Jestem gotów, by przyst¹piæ do Pi¹tego Krêgu.
    AI_Output (self, other ,"DIA_BaalCadar_KREIS5_ER_03_05"); //Po d³ugim czasie od wielkich odkryæ Cor Kaloma, nasz dawny alchemik odkry³ w koñcu sposób na przyzwanie Œni¹cego.
    AI_Output (self, other ,"DIA_BaalCadar_KREIS5_ER_03_06"); //Pos³u¿y³ siê do tego kamieniem ogniskuj¹cym i almanachem Magów Ognia.
    AI_Output (self, other ,"DIA_BaalCadar_KREIS5_ER_03_07"); //Przywo³anie Œni¹cego odby³o siê. Uczestniczyli w nim wszyscy Nowicjusze, których moc zjednoczy³a siê po u¿yciu kamienia i wypiciu mikstury z jaj pe³zacza.
    AI_Output (self, other ,"DIA_BaalCadar_KREIS5_ER_03_08"); //To jednak nic nie da³o. Wizja okaza³a siê bardzo mglista, a wielki Y'Berion przyp³aci³ za ni¹ ¿yciem.
    AI_Output (self, other ,"DIA_BaalCadar_KREIS5_ER_03_09"); //Przed œmierci¹ odkry³, ¿e Œni¹cy jest wybrañcem Beliara i potê¿nym Arcydemonem.
    AI_Output (self, other ,"DIA_BaalCadar_KREIS5_ER_03_10"); //Kilku fanatycznych wyznawców uda³o siê na poszukiwanie Œni¹cego. Ich losy pozostan¹ dla nas zagadk¹.
    AI_Output (self, other ,"DIA_BaalCadar_KREIS5_ER_03_11"); //Tak oto narodzi³ siê Pi¹ty Kr¹g, obrazuj¹cy poznanie prawdy oraz nieostro¿noœæ.
    AI_Output (self, other ,"DIA_BaalCadar_KREIS5_ER_03_12"); //Pi¹ty Kr¹g nie pozwala na u¿ywanie magii Œni¹cego.
    AI_Output (self, other ,"DIA_BaalCadar_KREIS5_ER_03_13"); //Odk¹d go poznali, Guru zaczêli w³adaæ magi¹ nadan¹ im przez trzech bogów, wyrzekaj¹c siê Œni¹cego.
    AI_Output (self, other ,"DIA_BaalCadar_KREIS5_ER_03_14"); //Oto ca³a wiedza magiczna, któr¹ mo¿esz posi¹œæ w Bractwie. Pozosta³ jeszcze Szósty Kr¹g, ale jego tajniki poznali tylko nieliczni.
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
		B_LogEntry			(GE_TraderPSI,"Guru Baal Cadar sprzedaje runy, magiczne zwoje, napoje, amulety i pierœcienie.");
		log_baalcadarsell = TRUE;
	};	
	AI_Output (other, self,"Gur_1208_BaalCadar_SELLSTUFF_Info_15_01"); //Chcia³bym zdobyæ ksiêgi traktuj¹ce o magii.

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
   description	= "Cor Kalom odszed³. W Bractwie nie ma kto zajmowaæ siê alchemi¹.";
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
    AI_Output (other, self ,"DIA_BaalCadar_AlchemyWHO_15_01"); //Cor Kalom odszed³. W Bractwie nie ma siê kto zajmowaæ siê alchemi¹.
    AI_Output (self, other ,"DIA_BaalCadar_AlchemyWHO_03_02"); //Masz racjê. Bêdziemy potrzebowali kogoœ, kto by³by w stanie zast¹piæ Cor Kaloma. 
    AI_Output (other, self ,"DIA_BaalCadar_AlchemyWHO_15_03"); //Mistrzu, zale¿y mi na kontynuowaniu nauki alchemii. Czy ktoœ poza Kalomem jest w stanie mi pomóc?
    AI_Output (self, other ,"DIA_BaalCadar_AlchemyWHO_03_04"); //Lata temu ja równie¿ para³em siê tym zajêciem, jednak porzuci³em je na rzecz nauczania.
    AI_Output (other, self ,"DIA_BaalCadar_AlchemyWHO_15_05"); //Pamiêtasz coœ?
    AI_Output (self, other ,"DIA_BaalCadar_AlchemyWHO_03_06"); //Od d³u¿szego czasu nie mia³em fiolki alchemicznej w rêkach...
    AI_Output (other, self ,"DIA_BaalCadar_AlchemyWHO_15_07"); //To dla mnie bardzo wa¿ne.
    AI_Output (self, other ,"DIA_BaalCadar_AlchemyWHO_03_08"); //Rozumiem to, dlatego... bêdê ciê uczy³.
    AI_Output (other, self ,"DIA_BaalCadar_AlchemyWHO_15_09"); //Dziêkujê, Mistrzu.
	
	Log_CreateTopic   	(GE_TeacherPSI,LOG_NOTE);
	B_LogEntry			(GE_TeacherPSI,"Cor Kalom odszed³ z Bractwa, jednak Baal Cadar zgodzi³ siê uczyæ mnie alchemii. Zróbi³ bardzo wielki wyj¹tek specjalnie dla mnie. Muszê to doceniæ.");
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
        AI_Output (self, other ,"DIA_CADAR_KnowsAlchemy2_03_02"); //No dobrze. Nauczê ciê warzyæ proste mikstury i alkohole, oraz przygotowywaæ tytoñ.
        AI_Output (self, other ,"DIA_CADAR_KnowsAlchemy2_03_03"); //To wcale nie jest takie trudne.
        AI_Output (self, other ,"DIA_CADAR_KnowsAlchemy2_03_04"); //Przede wszystkim potrzebujesz przepisu.
        AI_Output (self, other ,"DIA_CADAR_KnowsAlchemy2_03_05"); //Szczególnie dla trudniejszych mikstur.
        AI_Output (self, other ,"DIA_CADAR_KnowsAlchemy2_03_06"); //Podstawowe mo¿esz próbowaæ uwarzyæ sam.
        AI_Output (self, other ,"DIA_CADAR_KnowsAlchemy2_03_07"); //Kieruj siê zdrowym rozs¹dkiem i b¹dŸ spokojny.
        AI_Output (self, other ,"DIA_CADAR_KnowsAlchemy2_03_08"); //Ostro¿nie dawkuj sk³adniki. 
		Npc_SetTalentSkill(hero, NPC_TALENT_FIREMASTER, 1);
		PrintScreen	("Nowa umiejêtnoœæ: Alchemia", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		B_GiveInvItems (other, self, ItMiNugget, 150);
		hero.lp = hero.lp - 10;
		DIA_CADAR_KnowsAlchemy2.permanent = false;
    }
    else
    {
    AI_Output (self, other ,"DIA_CADAR_KnowsAlchemy2_03_09"); //Nie mogê ciê tego nauczyæ.
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
    AI_Output (other, self ,"DIA_CADAR_KnowsAlchemy2_L2_15_01"); //Naucz mnie z³o¿onej alchemii.
    if  (hero.lp >= 20) && (Npc_HasItems (hero, ItMiNugget) >=360)
    {
        AI_Output (self, other ,"DIA_CADAR_KnowsAlchemy2_l2_03_02"); //Aby przyrz¹dziæ trudniejsze mikstury, bêdziesz potrzebowa³ przepisu.
        AI_Output (self, other ,"DIA_CADAR_KnowsAlchemy2_l2_03_03"); //Nigdy nie próbuj sam wytwarzaæ silnych mikstur. Wielu alchemików przyp³aci³o to ¿yciem.
        AI_Output (self, other ,"DIA_CADAR_KnowsAlchemy2_l2_03_04"); //Wa¿ne s¹ tutaj sk³adniki. To, z czym bêdziesz mia³ do czynienia, to nie byle ziele - to swoiste pok³ady magicznej energii drzemi¹cej w liœciach i ³odygach.
        AI_Output (self, other ,"DIA_CADAR_KnowsAlchemy2_l2_03_05"); //Bogowie obdarzyli nas umiejêtnoœci¹ syntezy tej energii.
        AI_Output (self, other ,"DIA_CADAR_KnowsAlchemy2_l2_03_06"); //Gotowe mikstury bêdziesz móg³ ulepszyæ.
        AI_Output (self, other ,"DIA_CADAR_KnowsAlchemy2_l2_03_07"); //Podstawowym czynnikiem wzmacniaj¹cym jest czysty alkohol. 
        AI_Output (self, other ,"DIA_CADAR_KnowsAlchemy2_l2_03_08"); //To tyle. B¹dŸ ostro¿ny.
		Npc_SetTalentSkill(hero, NPC_TALENT_FIREMASTER, 2);
		PrintScreen	("Postêp w umiejêtnoœci: Alchemia", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		B_GiveInvItems (other, self, ItMiNugget, 360);
		hero.lp = hero.lp - 20;
		DIA_CADAR_KnowsAlchemy2_l2.permanent = false;
    }
    else
    {
    AI_Output (self, other ,"DIA_CADAR_KnowsAlchemy2_l2_03_09"); //Nie mogê ciê tego nauczyæ.
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
		AI_Output (self, other,"Gur_1208_BaalCadar_BOOK_Info_02_01"); //Zaczekaj. Mam dla ciebie pewn¹ ciekaw¹ ksi¹¿kê. 
		AI_Output (other, self,"Gur_1208_BaalCadar_BOOK_Info_15_02"); //W³aœnie przychodzê w jej sprawie. Ile bêdzie mnie ona kosztowaæ, mistrzu Baal Cadarze? 
		AI_Output (self, other,"Gur_1208_BaalCadar_BOOK_Info_02_03"); //Odkupi³em j¹ od Maga Wody Merdariona. Powiedzia³, ¿e przyniós³ mu j¹ jakiœ Najemnik. 
		AI_Output (self, other,"Gur_1208_BaalCadar_BOOK_Info_02_04"); //Myœlê, ¿e 400 bry³ek rudy to uczciwa cena w zamian za jej niezwykle interesuj¹c¹ zawartoœæ. 
		B_LogEntry               (CH3_TestGuru,"Baal Cadar chce za ksi¹¿kê 400 bry³ek rudy. Chyba bêdê zmuszony zap³aciæ, jeœli naprawdê chcê poznaæ jej tajemnicê.");
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
	description		= "Kupiê tê ksi¹¿kê."; 
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
		AI_Output (other, self,"Gur_1208_BaalCadar_BUY_Info_15_01"); //Kupiê tê ksi¹¿kê.
		AI_Output (self, other,"Gur_1208_BaalCadar_BUY_Info_02_02"); //Wiedzia³em, ¿e nie bêdziesz siê d³ugo zastanawia³.
		AI_Output (other, self,"Gur_1208_BaalCadar_BUY_Info_15_03"); //Czyta³eœ j¹, mistrzu?
		AI_Output (self, other,"Gur_1208_BaalCadar_BUY_Info_02_04"); //Owszem. Nawet kilkakrotnie. Stworzenie mikstury wymaga niezwyk³ej precyzji i znajomoœci alchemii. Ale nie to jest w tym wszystkim najtrudniejsze.
		AI_Output (other, self,"Gur_1208_BaalCadar_BUY_Info_15_05"); //A wiêc co?
		AI_Output (self, other,"Gur_1208_BaalCadar_BUY_Info_02_06"); //Zdobycie sk³adników... Wiêkszoœæ z nich to po prostu unikaty, które niezwykle ciê¿ko znaleŸæ w Kolonii. 
		AI_Output (self, other,"Gur_1208_BaalCadar_BUY_Info_02_07"); //Mimo to ustali³em ju¿ miejsca w których te roœliny mog¹ wystêpowaæ. Wys³a³em nawet kilku Nowicjuszy na poszukiwania. 
		AI_Output (self, other,"Gur_1208_BaalCadar_BUY_Info_02_08"); //Ale mo¿emy o tym porozmawiaæ, gdy przeczytasz ju¿ notatki.
		
		B_GiveInvItems	(hero, self, ItMiNugget, 400);
		CreateInvItems (self, ItWr_Mod_ReceptClarityMixture, 1);
		B_GiveInvItems (self, other, ItWr_Mod_ReceptClarityMixture, 1);
		
		B_LogEntry               (CH3_TestGuru,"Odkupi³em ksiêgê od Guru. Co ciekawe Baal Cadar opowiedzia³ mi co nieco o miksturze. Okazuje siê, ¿e wiêkszoœæ jej sk³adników to niezwykle rzadkie unikaty, których znalezienie w Kolonii graniczy z cudem. Na szczêœcie zaoferowa³ mi swoj¹ pomoc. Muszê przeczytaæ notatki i z nim porozmawiaæ.");
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
   description	= "Przeczyta³em notatki.";
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
    AI_Output (other, self ,"DIA_BaalCadar_ReadAboutClarity_15_01"); //Przeczyta³em notatki.
    AI_Output (self, other ,"DIA_BaalCadar_ReadAboutClarity_03_02"); //A ja byæ mo¿e ustali³em po³o¿enie wszystkich sk³adników. To znaczy nie mam pewnoœci, ¿e uda ci siê wszystko znaleŸæ w wyznaczonych miejscach...
    AI_Output (other, self ,"DIA_BaalCadar_ReadAboutClarity_15_03"); //Na pewno warto spróbowaæ.

    Info_ClearChoices		(DIA_BaalCadar_ReadAboutClarity);
	Info_AddChoice		(DIA_BaalCadar_ReadAboutClarity, "Co ze œwietlistym grzybem? ", DIA_BaalCadar_ReadAboutClarity_LightMushroom);
    Info_AddChoice		(DIA_BaalCadar_ReadAboutClarity, "Gdzie powinienem szukaæ liœci sza³wii? ", DIA_BaalCadar_ReadAboutClarity_Sage);
	Info_AddChoice		(DIA_BaalCadar_ReadAboutClarity, "Gdzie znajdê wilcze jagody?", DIA_BaalCadar_ReadAboutClarity_WolfBerrys);
    
};

FUNC VOID DIA_BaalCadar_ReadAboutClarity_WolfBerrys()
{
    AI_Output (other, self ,"DIA_BaalCadar_ReadAboutClarity_WolfBerrys_15_01"); //Gdzie znajdê wilcze jagody?
    AI_Output (self, other ,"DIA_BaalCadar_ReadAboutClarity_WolfBerrys_03_02"); //Powinny byæ doœæ blisko. Pamiêtasz jak Y'Berion wys³a³ ciê na poszukiwania pierwszego kamienia ogniskuj¹cego?
    AI_Output (other, self ,"DIA_BaalCadar_ReadAboutClarity_WolfBerrys_15_03"); //Tak.
    AI_Output (self, other ,"DIA_BaalCadar_ReadAboutClarity_WolfBerrys_03_04"); //A wiêc idŸ w to samo miejsce po czym udaj siê dalej wzd³u¿ klifu. IdŸ po prostu obok lasu.
    AI_Output (self, other ,"DIA_BaalCadar_ReadAboutClarity_WolfBerrys_03_05"); //Gdy ju¿ przejdziesz na drug¹ stronê, powinieneœ spotkaæ Nowicjusza, którego wys³a³em wczeœniej na poszukiwania. 
    AI_Output (self, other ,"DIA_BaalCadar_ReadAboutClarity_WolfBerrys_03_06"); //Skorzystaj z jego pomocy. Razem na pewno coœ znajdziecie. 
    B_LogEntry                     (CH3_TestGuru,"Wilczych jagód powinienem szukaæ na wy¿ynie nad Bractwem, po drugiej stronie klifu. Baal Cadar wys³a³ w tamte strony Nowicjusza, który mi pomo¿e. ");
	
	Npc_ExchangeRoutine	(NOV_1322_Novize,"wolfberrys");
	Wld_InsertNpc		(Beast_Cliff,"OW_MIS_CREATURE_WOLFBERRYS");
};

FUNC VOID DIA_BaalCadar_ReadAboutClarity_Sage()
{
    AI_Output (other, self ,"DIA_BaalCadar_ReadAboutClarity_Sage_15_01"); //Gdzie powinienem szukaæ liœci sza³wii? 
    AI_Output (self, other ,"DIA_BaalCadar_ReadAboutClarity_Sage_03_02"); //Sza³wia to niezwykle stara roœlina maj¹ca silne w³aœciwoœci lecznicze i oczyszczaj¹ce.
    AI_Output (self, other ,"DIA_BaalCadar_ReadAboutClarity_Sage_03_03"); //Nic wiêc dziwnego, ¿e jest ju¿ prawie niespotykana. Wczeœniej by³a czêsto wykorzystywana do leczenia.
    AI_Output (self, other ,"DIA_BaalCadar_ReadAboutClarity_Sage_03_04"); //Dlatego jest ju¿ jej niezwykle ma³o...
    AI_Output (other, self ,"DIA_BaalCadar_ReadAboutClarity_Sage_15_05"); //A wiêc powinienem szukaæ w jakimœ odludnym miejscu? Tam gdzie od lat nie krêcili siê ¿adni zbieracze ani alchemicy?
    AI_Output (self, other ,"DIA_BaalCadar_ReadAboutClarity_Sage_03_06"); //Jedynym takim miejscem s¹ Ziemie Orków. Od czasów wojny ludzie siê tam nie zapuszczaj¹. 
    AI_Output (self, other ,"DIA_BaalCadar_ReadAboutClarity_Sage_03_07"); //Orkowie raczej nie korzystaj¹ z tych zió³, wiêc w³aœnie tam powinieneœ szukaæ.
    B_LogEntry                     (CH3_TestGuru,"Sza³wii mam szukaæ na Ziemiach Orków. Nie doœæ, ¿e jest tam niebezpiecznie to nie wiem od jakiego miejsca zacz¹æ. Chyba bêdê musia³ przeczesaæ ka¿d¹ polankê. ");
	
	Wld_InsertNpc		(Beast_OrcTower,"OW_ORC_LOOKOUT_2_02");
};

FUNC VOID DIA_BaalCadar_ReadAboutClarity_LightMushroom()
{
    AI_Output (other, self ,"DIA_BaalCadar_ReadAboutClarity_LightMushroom_15_01"); //Co ze œwietlistym grzybem?
    AI_Output (self, other ,"DIA_BaalCadar_ReadAboutClarity_LightMushroom_03_02"); //Jeœli gdzieœ jakiegoœ znajdziesz w tym przeklêtym miejscu to tylko na najwy¿szym szczycie w Kolonii. 
    AI_Output (self, other ,"DIA_BaalCadar_ReadAboutClarity_LightMushroom_03_03"); //Mówiê o okolicach starej Cytadeli. Wys³a³em tam jednego ze Stra¿ników Œwi¹tynnych. Skorzystaj z jego pomocy.
	//AI_Output (self, other ,"DIA_BaalCadar_ReadAboutClarity_LightMushroom_03_04"); //Stra¿nik nazywa siê Gor Na Ran. Na pewno ju¿ go znasz.
	
    B_LogEntry                     (CH3_TestGuru,"Przy starej Cytadeli mam szukaæ œwietlistego grzyba. Guru wys³a³ tam na poszukiwania Stra¿nika Œwi¹tynnego, który mo¿e mi pomóc."); 
	
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
   description	= "Zdoby³em wszystkie sk³adniki.";
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
    AI_Output (other, self ,"DIA_BaalCadar_AllIngredients_15_01"); //Zdoby³em wszystkie sk³adniki.
    AI_Output (self, other ,"DIA_BaalCadar_AllIngredients_03_02"); //Niewiarygodne! Znalaz³eœ je w miejscach o których ci mówi³em?
    AI_Output (other, self ,"DIA_BaalCadar_AllIngredients_15_03"); //Tak. Najwiêcej czasu zajê³y poszukiwania sza³wii, ale uda³o mi siê znaleŸæ jedn¹ tak¹ roœlinê na Ziemiach Orków.
    AI_Output (self, other ,"DIA_BaalCadar_AllIngredients_03_04"); //Czy Stra¿nik i Nowicjusz, których wys³a³em ci pomogli?
    AI_Output (other, self ,"DIA_BaalCadar_AllIngredients_15_05"); //Có¿, Nowicjusz nie ¿yje. W wyznaczonych przez ciebie miejscach spotka³em dziwne istoty. 
    AI_Output (other, self ,"DIA_BaalCadar_AllIngredients_15_06"); //Nigdy nie wiedzia³em takich stworzeñ. Wygl¹da³y jakby zosta³y przywo³ane z otch³ani Beliara.
    AI_Output (other, self ,"DIA_BaalCadar_AllIngredients_15_07"); //Wiesz kto mo¿e za tym staæ?
    AI_Output (self, other ,"DIA_BaalCadar_AllIngredients_03_08"); //Obawiam siê, ¿e to sam Œni¹cy. Wie, ¿e jego byt nie jest ju¿ zagadk¹ i chce siê broniæ.
    AI_Output (self, other ,"DIA_BaalCadar_AllIngredients_03_09"); //Zostaj¹c Guru bêdziesz korzysta³ z jego mocy. Byæ mo¿e obawia siê, ¿e obrócisz ni¹ przeciwko niemu?
    AI_Output (other, self ,"DIA_BaalCadar_AllIngredients_15_10"); //Jeœli tylko bêdê mia³ okazjê to tak zrobiê. 
    AI_Output (self, other ,"DIA_BaalCadar_AllIngredients_03_11"); //Uwa¿aj na siebie. Œni¹cy nie jest zwyczajnym demonem. To potê¿na istota. Pamiêtaj o tym. 
    AI_Output (self, other ,"DIA_BaalCadar_AllIngredients_03_12"); //Lepiej idŸ ju¿ przygotowywaæ miksturê. Najlepiej skorzystaj ze sto³u alchemicznego w chacie Kaloma.
	
	B_LogEntry                     (CH3_TestGuru,"Baal Cadar twierdzi, ¿e magiczne bestie, które spotka³em zosta³y zes³ane przez samego Œni¹cego. Demon nie chce dopuœciæ, abym posiad³ czêœæ jego mocy. ");
	 
    AI_StopProcessInfos	(self);
	
	TPL_1408_Templer.flags = 0;
};

