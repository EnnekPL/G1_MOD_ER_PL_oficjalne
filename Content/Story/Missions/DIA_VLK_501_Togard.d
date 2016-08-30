//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Togard_EXIT(C_INFO)
{
	npc             = VLK_501_Buddler;
	nr              = 999;
	condition		= DIA_Togard_EXIT_Condition;
	information		= DIA_Togard_EXIT_Info;
	permanent		= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Togard_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Togard_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

// **************************************************
//	Need Workers
// **************************************************
INSTANCE DIA_Togard_NeedWorkers (C_INFO)
{
	npc				= VLK_501_Buddler;
	nr				= 2;
	condition		= DIA_Togard_NeedWorkers_Condition;
	information		= DIA_Togard_NeedWorkers_Info;
	permanent		= 0;
	important		= 0;
	description		= "S�ysza�em, �e w Kopalni mo�na znale�� cenne minera�y!";
};

FUNC INT DIA_Togard_NeedWorkers_Condition()
{	
	if	Npc_KnowsInfo(hero, DIA_Snaf_LookingForWorkers) && MIS_ZmianaLorenza == LOG_RUNNING 
	{
		return TRUE;
	};
};

FUNC VOID DIA_Togard_NeedWorkers_Info()
{
	AI_Output (other,self,"DIA_Togard_NeedWorkers_15_00"); //S�ysza�em, �e w Kopalni mo�na znale�� cenne minera�y!
	AI_Output (self,other,"DIA_Togard_NeedWorkers_09_01"); //I dlaczego przychodzisz z tym do mnie?
	AI_Output (other,self,"DIA_Togard_NeedWorkers_15_02"); //Lorenzo kaza� mi zorganizowa� now� zmian�. Dowiedzia�em si�, �e interesuj� ci� takie rzeczy, wi�c postanowi�em zarezerwowa� dla ciebie miejsce.
	AI_Output (self,other,"DIA_Togard_NeedWorkers_09_03"); //(ironicznie) Cholera, pierwszy raz spotykam si� z kim�, kto si� tak troszczy o innych. 
	AI_Output (other,self,"DIA_Togard_NeedWorkers_15_04"); //Chcia�em pom�c. 
	AI_Output (self,other,"DIA_Togard_NeedWorkers_09_05"); //To przynie� mi jaki� dow�d. Nie mam zamiaru schodzi� na d� na marne. Zw�aszcza, �e mam jeszcze troch� rudy.
	B_LogEntry               (CH1_ZmianaLorenza,"Togard chce dowodu na to, �e w Kopalni jest co� co go zainteresuje. ");
};

// **************************************************
//	Give Fake Ore
// **************************************************
INSTANCE DIA_Togard_GiveFakeOre (C_INFO)
{
	npc				= VLK_501_Buddler;
	nr				= 2;
	condition		= DIA_Togard_GiveFakeOre_Condition;
	information		= DIA_Togard_GiveFakeOre_Info;
	permanent		= 0;
	important		= 0;
	description		= "Mam dla ciebie bry�k� czarnej rudy.";
};

FUNC INT DIA_Togard_GiveFakeOre_Condition()
{	
	if	Npc_KnowsInfo(hero, DIA_Togard_NeedWorkers) && MIS_ZmianaLorenza == LOG_RUNNING && Npc_HasItems (other,itmi_Fakeblackore) >=1 && !Npc_KnowsInfo(hero, DIA_Togard_GiveRaport)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Togard_GiveFakeOre_Info()
{
	AI_Output (other,self,"DIA_Togard_GiveFakeOre_15_00"); //Mam dla ciebie bry�k� czarnej rudy.
	AI_Output (self,other,"DIA_Togard_GiveFakeOre_09_01"); //Poka� mi to! Naprawd� niesamowite... Wygl�da inaczej ni� te, kt�re bada�em za Barier�.
	AI_Output (other,self,"DIA_Togard_GiveFakeOre_15_02"); //W takim razie wyruszasz do Kopalni?
	AI_Output (self,other,"DIA_Togard_GiveFakeOre_09_03"); //Oczywi�cie. Spotkamy si� pod chat� Lorenzo.  
	B_LogEntry               (CH1_ZmianaLorenza,"Togard przyj�� podrobion� bry�k� czarnej rudy. Mam nadziej�, �e szybko si� nie zorientuje o moim podst�pie.");
	B_GiveXP (50);
	Npc_ExchangeRoutine (self,"lorenzo");
	TogardPrzekonany = true;
	B_GiveInvItems (hero,self,itmi_Fakeblackore,1);
};

// **************************************************
//	Give Raport
// **************************************************
INSTANCE DIA_Togard_GiveRaport (C_INFO)
{
	npc				= VLK_501_Buddler;
	nr				= 2;
	condition		= DIA_Togard_GiveRaport_Condition;
	information		= DIA_Togard_GiveRaport_Info;
	permanent		= 0;
	important		= 0;
	description		= "Mam tu raport ze Starej Kopalni.";
};

FUNC INT DIA_Togard_GiveRaport_Condition()
{	
	if	Npc_KnowsInfo(hero, DIA_Togard_NeedWorkers) && MIS_ZmianaLorenza == LOG_RUNNING && Npc_HasItems (other,itmi_OM_LorenzoRaport) >=1 && !Npc_KnowsInfo(hero, DIA_Togard_GiveFakeOre)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Togard_GiveRaport_Info()
{
	AI_Output (other,self,"DIA_Togard_GiveRaport_15_00"); //Mam tu raport ze Starej Kopalni.
	AI_Output (self,other,"DIA_Togard_GiveRaport_09_01"); //Czemu mia�by mnie on interesowa�? I dlaczego ryzykowa�e� kradzie� tak wa�nego dokumentu?
	AI_Output (other,self,"DIA_Togard_GiveRaport_15_02"); //Sam zobacz.
	B_UseFakeScroll();
	AI_Output (self,other,"DIA_Togard_GiveRaport_09_03"); //M�wi�e�, �e zbierasz ludzi do kolejnej zmiany do Kopalni, tak? Dopisz mnie do listy.
	AI_Output (other,self,"DIA_Togard_GiveRaport_15_04"); //�wietnie. Spotykamy si� pod chat� Lorenzo.
	AI_Output (self,other,"DIA_Togard_GiveRaport_09_05"); //Dobra, a teraz zmykaj szybko odda� ten raport, bo b�dziesz mia� k�opoty.
	B_LogEntry               (CH1_ZmianaLorenza,"Togard przeczyta� raport i zgodzi� si� uda� do Kopalni.");
	B_GiveXP (100);
	Npc_ExchangeRoutine (self,"lorenzo");
	TogardPrzekonany = true;
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Togard_HELLO1 (C_INFO)
{
   npc          = VLK_501_Buddler;
   nr           = 1;
   condition    = DIA_Togard_HELLO1_Condition;
   information  = DIA_Togard_HELLO1_Info;
   permanent	= FALSE;
   description	= "Kim jeste�?";
};

FUNC INT DIA_Togard_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Togard_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Togard_HELLO1_15_01"); //Kim jeste�?
    AI_Output (self, other ,"DIA_Togard_HELLO1_03_02"); //Jestem Togard i pochodz� z... a zreszt� w Kolonii Karnej nie liczy si� sk�d pochodzisz, no chyba, �e wi��e si� to z jakimi� umiej�tno�ciami. 
    AI_Output (self, other ,"DIA_Togard_HELLO1_03_03"); //W sumie pochodzenie liczy si� jeszcze, gdy jeste� Varantczykiem � ich nikt tutaj nie lubi. 
};

//========================================
//-----------------> HELLO2
//========================================

INSTANCE DIA_Togard_HELLO2 (C_INFO)
{
   npc          = VLK_501_Buddler;
   nr           = 2;
   condition    = DIA_Togard_HELLO2_Condition;
   information  = DIA_Togard_HELLO2_Info;
   permanent	= FALSE;
   description	= "Czemu w Kolonii nie lubi� Varantczyk�w? ";
};

FUNC INT DIA_Togard_HELLO2_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Togard_HELLO1))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Togard_HELLO2_Info()
{
    AI_Output (other, self ,"DIA_Togard_HELLO2_15_01"); //Czemu w Kolonii nie lubi� Varantczyk�w? 
    AI_Output (self, other ,"DIA_Togard_HELLO2_03_02"); //Wida� nie widzia�e� zarazy, kt�r� ci nomadzi przywlekli z tej swojej pustyni. 
    AI_Output (self, other ,"DIA_Togard_HELLO2_03_03"); //Ludzie padali jak muchy i z powodu epidemii trzeba by�o na�o�y� kwarantann� na jedn� z dzielnic Starego Obozu. 
    AI_Output (self, other ,"DIA_Togard_HELLO2_03_04"); //Najwi�kszego jednak pecha mieli ci, kt�rych oddelegowano do pomocy przy zara�onych. Bukhart i Jesse si� pochorowali, ale uda�o im si� jako� wyliza�. 
    AI_Output (self, other ,"DIA_Togard_HELLO2_03_05"); //Mniej szcz�cia mieli Amirg i Kanno. Jak ja dzi�kuj�, �e to nie mnie pos�ano do tej roboty przy dotkni�tych zaraz�. 
    AI_Output (self, other ,"DIA_Togard_HELLO2_03_06"); //Nie dziw si� wi�c, �e ma�o kto lubi tu Varantczyk�w. W dodatku nie tak dawno Myrtana mia�a z nimi wojn�, wi�c� 
    AI_Output (other, self ,"DIA_Togard_HELLO2_15_07"); //Rozumiem.
};

//========================================
//-----------------> HELLO3
//========================================

INSTANCE DIA_Togard_HELLO3 (C_INFO)
{
   npc          = VLK_501_Buddler;
   nr           = 3;
   condition    = DIA_Togard_HELLO3_Condition;
   information  = DIA_Togard_HELLO3_Info;
   permanent	= FALSE;
   description	= "Jak leci? ";
};

FUNC INT DIA_Togard_HELLO3_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Togard_HELLO1))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Togard_HELLO3_Info()
{
    AI_Output (other, self ,"DIA_Togard_HELLO3_15_01"); //Jak leci? 
    AI_Output (self, other ,"DIA_Togard_HELLO3_03_02"); //Niczego sobie, cho� trudno wymaga� od �ycia w Kolonii zbyt wiele. 
};

//========================================
//-----------------> HELLO4
//========================================

INSTANCE DIA_Togard_HELLO4 (C_INFO)
{
   npc          = VLK_501_Buddler;
   nr           = 4;
   condition    = DIA_Togard_HELLO4_Condition;
   information  = DIA_Togard_HELLO4_Info;
   permanent	= FALSE;
   description	= "Kto tu rz�dzi?";
};

FUNC INT DIA_Togard_HELLO4_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Togard_HELLO1))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Togard_HELLO4_Info()
{
    AI_Output (other, self ,"DIA_Togard_HELLO4_15_01"); //Kto tu rz�dzi?
    AI_Output (self, other ,"DIA_Togard_HELLO4_03_02"); //Po co pytasz, jak dobrze wiesz? 
};

