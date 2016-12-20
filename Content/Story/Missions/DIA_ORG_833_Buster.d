//poprawione i sprawdzone - Nocturn

instance DIA_ORG_833_Buster (C_INFO)
{
	npc				= ORG_833_Buster;
	condition		= DIA_ORG_833_Buster_Condition;
	information		= DIA_ORG_833_Buster_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int DIA_ORG_833_Buster_Condition()
{
	if (Npc_GetTalentSkill(hero, NPC_TALENT_ACROBAT) == 0)
	{
		return TRUE;
	};
};

func void DIA_ORG_833_Buster_Info()
{
	AI_Output (self, other,"DIA_ORG_833_Buster_02_01"); //Wiesz co, poruszasz siê tak jakoœ sztywno. Móg³bym ci pomóc.
};


// ************************ EXIT **************************

INSTANCE DIA_ORG_833_Buster_Exit (C_INFO)
{
	npc			= ORG_833_Buster;
	nr			= 999;
	condition	= DIA_ORG_833_Buster_Exit_Condition;
	information	= DIA_ORG_833_Buster_Exit_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_ORG_833_Buster_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_ORG_833_Buster_Exit_Info()
{
	
	AI_StopProcessInfos	( self );
};


// *********** Talent lernen *******************
INSTANCE DIA_ORG_833_Buster3 (C_INFO)
{
	npc				= ORG_833_Buster;
	condition		= DIA_ORG_833_Buster3_Condition;
	information		= DIA_ORG_833_Buster3_Info;
	important		= 0;
	permanent		= 1;
	description		= "Jak mo¿esz mi pomóc?"; 
};

FUNC INT DIA_ORG_833_Buster3_Condition()
{	
	if (Npc_GetTalentSkill(other, NPC_TALENT_ACROBAT) != 1) && Npc_KnowsInfo(hero,DIA_ORG_833_Buster)
	{
	return TRUE; 
	};
};

func VOID DIA_ORG_833_Buster3_Info()
{
	AI_Output (self, other,"DIA_ORG_833_Buster3_02_01"); //Mogê ci pokazaæ, jak nale¿y balansowaæ cia³em. Nauczê ciê AKROBATYKI.

	Info_ClearChoices	( DIA_ORG_833_Buster3 );
	Info_AddChoice		( DIA_ORG_833_Buster3, DIALOG_BACK													, DIA_ORG_833_Buster_Back );
	Info_AddChoice		( DIA_ORG_833_Buster3, B_BuildLearnString(NAME_LearnAcrobat, LPCOST_TALENT_ACROBAT,500)	, DIA_ORG_833_Buster_Train1 );
	var int wpis_akrobatyka;
	
	if (wpis_akrobatyka == false)
	{
	Log_CreateTopic   	(GE_TeacherNC,	LOG_NOTE);
	B_LogEntry			(GE_TeacherNC,	"Szkodnik imieniem Buster mo¿e mnie nauczyæ akrobatyki.");
	wpis_akrobatyka = true;
	};
};


// ************* Talent lernen **********************
FUNC void DIA_ORG_833_Buster_Train1()
{
	Info_ClearChoices	( DIA_ORG_833_Buster3 );
	if (Npc_HasItems (hero, itminugget) >=500)
	{
	
	if (B_GiveSkill(other,NPC_TALENT_ACROBAT , 1, LPCOST_TALENT_ACROBAT))
	{
	DIA_ORG_833_Buster3.permanent = 0;
		AI_Output (self, other,"DIA_ORG_833_Buster3_02_02"); //Po kilku lekcjach nauczysz siê skakaæ na wiêksze odleg³oœci.
		AI_Output (self, other,"DIA_ORG_833_Buster3_02_03"); //Poka¿ê ci w jaki sposób mo¿na z³agodziæ efekt upadku z du¿ej wysokoœci. Tylko nie myœl sobie, ¿e bêdziesz móg³ skakaæ bóg wie sk¹d!
		AI_Output (self, other,"DIA_ORG_833_Buster3_02_04"); //Akrobatyka przyda ci siê równie¿ w trakcie walki. Poka¿ê ci jak bardzo szybko zmniejszyæ lub zwiêkszyæ odleg³oœæ dziel¹c¹ ciê od przeciwnika. Powodzenia! 
	};		
	B_GiveInvItems (hero, self, itminugget, 500);
	Npc_RemoveInvItems (self, itminugget, 500);
	}
	else
	{
	AI_Output (self, other,"DIA_ORG_833_Buster3_02_NO_ORE"); //Musisz mi zap³aciæ. Inaczej niczego ciê nie nauczê!
	};
};  


// **************** Back ************************
FUNC VOID DIA_ORG_833_Buster_Back()
{
	Info_ClearChoices	( DIA_ORG_833_Buster3 );
};


//========================================
//-----------------> dexterity
//========================================

INSTANCE DIA_Buster_dexterity (C_INFO)
{
   npc          = ORG_833_Buster;
   nr           = 1;
   condition    = DIA_Buster_dexterity_Condition;
   information  = DIA_Buster_dexterity_Info;
   permanent	= FALSE;
   description	= "Widzê, ¿e jesteœ bardzo zrêczny. Jak siê nazywasz?";
};

FUNC INT DIA_Buster_dexterity_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_ORG_833_Buster))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Buster_dexterity_Info()
{
    AI_Output (other, self ,"DIA_Buster_dexterity_15_01"); //Widzê, ¿e jesteœ bardzo zrêczny. Jak siê nazywasz?
    AI_Output (self, other ,"DIA_Buster_dexterity_03_02"); //Jestem Buster, Szkodnik.
    AI_Output (self, other ,"DIA_Buster_dexterity_03_03"); //Moja zrêcznoœæ jest efektem wieloletniej pracy jako szpieg króla. 
    AI_Output (self, other ,"DIA_Buster_dexterity_03_04"); //Nie by³a to ³atwa praca. Prze¿y³em wiele przygód. Raz nawet by³em w niewoli, ale na szczêœcie uda³o mi siê wydostaæ...
    AI_Output (self, other ,"DIA_Buster_dexterity_03_05"); //To by³o lata temu w pewnym mieœcie na pustyni Varant.
    AI_Output (self, other ,"DIA_Buster_dexterity_03_07"); //PóŸniej ca³a ta sprawa polityczna bardzo siê zagmatwa³a, król odsun¹³ mnie od siebie i tak trafi³em tutaj. 
};

//========================================
//-----------------> WaterMages
//========================================

INSTANCE DIA_Buster_WaterMages (C_INFO)
{
   npc          = ORG_833_Buster;
   nr           = 2;
   condition    = DIA_Buster_WaterMages_Condition;
   information  = DIA_Buster_WaterMages_Info;
   permanent	= FALSE;
   description	= "Jak siê dogadujesz z Magami Wody?";
};

FUNC INT DIA_Buster_WaterMages_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_ORG_833_Buster))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Buster_WaterMages_Info()
{
    AI_Output (other, self ,"DIA_Buster_WaterMages_15_01"); //Jak siê dogadujesz z Magami Wody?
    AI_Output (self, other ,"DIA_Buster_WaterMages_03_02"); //A powiem ci, ¿e nawet nieŸle. Lee darzy mnie szacunkiem. Obaj zostaliœmy zdradzeni przez króla...
    AI_Output (self, other ,"DIA_Buster_WaterMages_03_03"); //Dziêki temu czasem biorê udzia³ w specjalnych zadaniach dla Najemników. S¹ o wiele ciekawsze ni¿ zanoszenie listów do Starego Obozu.
};

