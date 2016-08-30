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
	AI_Output (self, other,"DIA_ORG_833_Buster_02_01"); //Wiesz co, poruszasz si� tak jako� sztywno. M�g�bym ci pom�c.
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
	description		= "Jak mo�esz mi pom�c?"; 
};

FUNC INT DIA_ORG_833_Buster3_Condition()
{	
	return Npc_KnowsInfo(hero,DIA_ORG_833_Buster);
};

func VOID DIA_ORG_833_Buster3_Info()
{
	AI_Output (self, other,"DIA_ORG_833_Buster3_02_01"); //Mog� ci pokaza�, jak nale�y balansowa� cia�em. Naucz� ci� AKROBATYKI.

	Info_ClearChoices	( DIA_ORG_833_Buster3 );
	Info_AddChoice		( DIA_ORG_833_Buster3, DIALOG_BACK													, DIA_ORG_833_Buster_Back );
	Info_AddChoice		( DIA_ORG_833_Buster3, B_BuildLearnString(NAME_LearnAcrobat, LPCOST_TALENT_ACROBAT,0)	, DIA_ORG_833_Buster_Train1 );
	var int wpis_akrobatyka;
	
	if (wpis_akrobatyka == false)
	{
	Log_CreateTopic   	(GE_TeacherNC,	LOG_NOTE);
	B_LogEntry			(GE_TeacherNC,	"Szkodnik imieniem Buster mo�e mnie nauczy� akrobatyki.");
	wpis_akrobatyka = true;
	};
};


// ************* Talent lernen **********************
FUNC void DIA_ORG_833_Buster_Train1()
{
	Info_ClearChoices	( DIA_ORG_833_Buster3 );
	
	if (B_GiveSkill(other,NPC_TALENT_ACROBAT , 1, LPCOST_TALENT_ACROBAT))
	{
	DIA_ORG_833_Buster3.permanent = 0;
		AI_Output (self, other,"DIA_ORG_833_Buster3_02_02"); //Po kilku lekcjach nauczysz si� skaka� na wi�ksze odleg�o�ci.
		AI_Output (self, other,"DIA_ORG_833_Buster3_02_03"); //Poka�� ci w jaki spos�b mo�na z�agodzi� efekt upadku z du�ej wysoko�ci. Tylko nie my�l sobie, �e b�dziesz m�g� skaka� b�g wie sk�d!
		AI_Output (self, other,"DIA_ORG_833_Buster3_02_04"); //Akrobatyka przyda ci si� r�wnie� w trakcie walki. Poka�� ci jak bardzo szybko zmniejszy� lub zwi�kszy� odleg�o�� dziel�c� ci� od przeciwnika. Powodzenia! 
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
   description	= "Widz�, �e jeste� bardzo zr�czny. Jak si� nazywasz?";
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
    AI_Output (other, self ,"DIA_Buster_dexterity_15_01"); //Widz�, �e jeste� bardzo zr�czny. Jak si� nazywasz?
    AI_Output (self, other ,"DIA_Buster_dexterity_03_02"); //Jestem Buster, Szkodnik.
    AI_Output (self, other ,"DIA_Buster_dexterity_03_03"); //Moja zr�czno�� jest efektem wieloletniej pracy jako szpieg kr�la. 
    AI_Output (self, other ,"DIA_Buster_dexterity_03_04"); //Nie by�a to �atwa praca. Prze�y�em wiele przyg�d. Raz nawet by�em w niewoli, ale na szcz�cie uda�o mi si� wydosta�...
    AI_Output (self, other ,"DIA_Buster_dexterity_03_05"); //To by�o lata temu w pewnym mie�cie na pustyni Varant.
    AI_Output (self, other ,"DIA_Buster_dexterity_03_07"); //P�niej ca�a ta sprawa polityczna bardzo si� zagmatwa�a, kr�l odsun�� mnie od siebie i tak trafi�em tutaj. 
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
   description	= "Jak si� dogadujesz z Magami Wody?";
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
    AI_Output (other, self ,"DIA_Buster_WaterMages_15_01"); //Jak si� dogadujesz z Magami Wody?
    AI_Output (self, other ,"DIA_Buster_WaterMages_03_02"); //A powiem ci, �e nawet nie�le. Lee darzy mnie szacunkiem. Obaj zostali�my zdradzeni przez kr�la...
    AI_Output (self, other ,"DIA_Buster_WaterMages_03_03"); //Dzi�ki temu czasem bior� udzia� w specjalnych zadaniach dla Najemnik�w. S� o wiele ciekawsze ni� zanoszenie list�w do Starego Obozu.
};

