// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE Info_ORG_829_EXIT (C_INFO)
{
	npc			= ORG_829_Organisator;
	nr			= 999;
	condition	= Info_ORG_829_EXIT_Condition;
	information	= Info_ORG_829_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT Info_ORG_829_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_ORG_829_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 						Hallo
// ************************************************************

INSTANCE Info_ORG_829_Hello (C_INFO)
{
	npc			= ORG_829_Organisator;
	nr			= 1;
	condition	= Info_ORG_829_Hello_Condition;
	information	= Info_ORG_829_Hello_Info;
	permanent	= 0;
	description	= "Co s�ycha�?";
};                       

FUNC INT Info_ORG_829_Hello_Condition()
{
	return 1;
};

FUNC VOID Info_ORG_829_Hello_Info()
{	
	AI_Output (other, self,"Info_ORG_829_Hello_15_00"); //Co s�ycha�?
	AI_Output (self, other,"Info_ORG_829_Hello_06_01"); //Nie najgorzej, ale nie mam ju� nic do palenia.
};

// ************************************************************
// 						Offer Joint
// ************************************************************
	var int Org_829_GotJoint;
// ************************************************************

INSTANCE Info_ORG_829_OfferJoint (C_INFO)
{
	npc			= ORG_829_Organisator;
	nr			= 1;
	condition	= Info_ORG_829_OfferJoint_Condition;
	information	= Info_ORG_829_OfferJoint_Info;
	permanent	= 0;
	description	= "Mam przy sobie troch� ziela - chcesz?";
};                       

FUNC INT Info_ORG_829_OfferJoint_Condition()
{
	if (Npc_KnowsInfo(hero, Info_ORG_829_Hello))
	{
		return 1;
	};
};

FUNC VOID Info_ORG_829_OfferJoint_Info()
{	
	AI_Output (other, self,"Info_ORG_829_OfferJoint_15_00"); //Mam przy sobie troch� ziela - chcesz?
	
	if ( (Npc_HasItems(other,ItMiJoint_1)>0) || (Npc_HasItems(other,ItMiJoint_2)>0) || (Npc_HasItems(other,ItMiJoint_3)>0) )
	{
		if 		(Npc_HasItems(other,ItMiJoint_1))
		{	B_GiveInvItems (other,self,ItMiJoint_1,1);	 }
		else if (Npc_HasItems(other,ItMiJoint_2))
		{	B_GiveInvItems (other,self,ItMiJoint_2,1);	 }
		else if (Npc_HasItems(other,ItMiJoint_3))
		{	B_GiveInvItems (other,self,ItMiJoint_3,1);	 };
		
		AI_Output (self, other,"Info_ORG_829_OfferJoint_06_01"); //Jasne! A ty co - handlarz z obozu Sekty, czy jak?
		Org_829_GotJoint = true;
		NC_Joints_verteilt = NC_Joints_verteilt + 1;
	}
	else
	{
		AI_Output (self, other,"Info_ORG_829_OfferJoint_No_Joint_06_00"); //Hej, kole�! Nie pr�buj mnie wykiwa�! Bardzo tego nie lubi�!
	};
};

// ************************************************************
// 							Special Info
// ************************************************************

INSTANCE Info_ORG_829_SpecialInfo (C_INFO)
{
	npc			= ORG_829_Organisator;
	nr			= 1;
	condition	= Info_ORG_829_SpecialInfo_Condition;
	information	= Info_ORG_829_SpecialInfo_Info;
	permanent	= 0;
	description	= "Jestem tu nowy. Masz mo�e dla mnie jakie� wskaz�wki?";
};                       

FUNC INT Info_ORG_829_SpecialInfo_Condition()
{
	if (Org_829_GotJoint == TRUE)
	{
		return 1;
	};
};

FUNC VOID Info_ORG_829_SpecialInfo_Info()
{	
	AI_Output (other, self,"Info_ORG_829_SpecialInfo_15_00"); //Jestem tu nowy. Masz mo�e dla mnie jakie� wskaz�wki?
	AI_Output (self, other,"Info_ORG_829_SpecialInfo_06_01"); //Jasne! Po dotarciu do Obozu id� do Gorna. Wprawdzie to jeden z Najemnik�w w s�u�bie Mag�w, ale jest w porz�dku. Kiedy� by� jednym z nas.
	AI_Output (other, self,"Info_ORG_829_SpecialInfo_15_02"); //Co masz na my�li m�wi�c "jednym z nas"?
	AI_Output (self, other,"Info_ORG_829_SpecialInfo_06_03"); //No, Szkodnikiem, rzecz jasna. Postrachem Magnat�w, ot co!
};

// ************************************************************
// 							PERM
// ************************************************************

INSTANCE Info_ORG_829_PERM (C_INFO)
{
	npc			= ORG_829_Organisator;
	nr			= 1;
	condition	= Info_ORG_829_PERM_Condition;
	information	= Info_ORG_829_PERM_Info;
	permanent	= 1;
	description	= "Czego mog� si� spodziewa� w Obozie?";
};                       

FUNC INT Info_ORG_829_PERM_Condition()
{
	if (Org_829_GotJoint == TRUE)
	{
		return 1;
	};
};

FUNC VOID Info_ORG_829_PERM_Info()
{	
	AI_Output (other, self,"Info_ORG_829_PERM_15_00"); //Czego mog� si� spodziewa� w Obozie?
	AI_Output (self, other,"Info_ORG_829_PERM_06_01"); //Najlepiej id� i sam si� przekonaj.
};

//========================================
//-----------------> MAGE_QUEST
//========================================

INSTANCE DIA_Organisator_MAGE_QUEST (C_INFO)
{
   npc          = ORG_829_Organisator;
   nr           = 1;
   condition    = DIA_Organisator_MAGE_QUEST_Condition;
   information  = DIA_Organisator_MAGE_QUEST_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Organisator_MAGE_QUEST_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Cronos_KRADZIEZ))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Organisator_MAGE_QUEST_Info()
{
    AI_Output (self, other ,"DIA_Organisator_MAGE_QUEST_03_01"); //Podobno szukasz tych wkurwiaj�cych magik�w. Dobrze, bardzo dobrze. Mam do�� tego ca�ego zamieszania. Widzia�em jednego jak bieg� w kierunku rzeki.
    AI_Output (other, self ,"DIA_Organisator_MAGE_QUEST_15_02"); //Dzi�ki. Ka�da informacja si� przyda.
    AI_Output (self, other ,"DIA_Organisator_MAGE_QUEST_03_03"); //Heh, tylko go dorwij!
    B_GiveXP (60);
    AI_StopProcessInfos	(self);
};
//========================================
//-----------------> WELCOME_IN_CAMP
//========================================

INSTANCE DIA_Organisator_WELCOME_IN_CAMP (C_INFO)
{
   npc          = ORG_829_Organisator;
   nr           = 1;
   condition    = DIA_Organisator_WELCOME_IN_CAMP_Condition;
   information  = DIA_Organisator_WELCOME_IN_CAMP_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Organisator_WELCOME_IN_CAMP_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Organisator_WELCOME_IN_CAMP_Info()
{
    AI_Output (self, other ,"DIA_Organisator_WELCOME_IN_CAMP_03_01"); //Hej! Witaj w Nowym Obozie - jedynym spokojnym miejscu w Kolonii.
    AI_Output (self, other ,"DIA_Organisator_WELCOME_IN_CAMP_03_02"); //My nie zajmujemy si� wojnami, nie oddajemy czci dziwnym b�stwom oraz nie pertraktujemy z Kr�lem.
    AI_Output (self, other ,"DIA_Organisator_WELCOME_IN_CAMP_03_03"); //Robimy co chcemy i jak chcemy, przy okazji wsp�pracuj�c z Magami Wody.
    AI_Output (self, other ,"DIA_Organisator_WELCOME_IN_CAMP_03_04"); //Je�eli b�dziesz szuka� pracy, lub po prostu nie mia� z kim pogada�, to wal �mia�o.
};
/* CHUJNIA STRASZNA
//========================================
//-----------------> NEWSY
//========================================

INSTANCE DIA_Organisator_NEWSY (C_INFO)
{
   npc          = ORG_829_Organisator;
   nr           = 1;
   condition    = DIA_Organisator_NEWSY_Condition;
   information  = DIA_Organisator_NEWSY_Info;
   permanent	= TRUE;
   description	= "Jakie� wie�ci?";
};

FUNC INT DIA_Organisator_NEWSY_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Organisator_NEWSY_Info()
{
    AI_Output (other, self ,"DIA_Organisator_NEWSY_15_01"); //Jakie� wie�ci?
    if (!MIS_MAgicySzkodnicy == LOG_SUCCESS)
    {
        AI_Output (self, other ,"DIA_Organisator_NEWSY_03_02"); //Cronos wci�� poszukuje skradzionych artefakt�w. Podobno pomaga mu Orik. 
        AI_Output (self, other ,"DIA_Organisator_NEWSY_03_03"); //Szczerze, to mam ju� dosy� tego ca�ego zamieszania. Po okolicy biega kilku �wir�w uzbrojonych w magiczne zwoje.
        AI_Output (self, other ,"DIA_Organisator_NEWSY_03_04"); //Jedni si� boj�, inni ich szukaj�. 
    }
    else if (MIS_MagicySzkodnicy == LOG_SUCCESS)
    {
        AI_Output (self, other ,"DIA_Organisator_NEWSY_03_05"); //Uda�o ci si� rozwi�za� problemy ze Szkodnikami. Wreszcie jest troch� spokoju.
   
    AI_Output (other, self ,"DIA_Organisator_NEWSY_15_06"); //Co� jeszcze?
	} 
	else if 
    if (Npc_KnowsInfo (hero, DIA_Rufus_ActionGoWhat)) && (!MIS_BuntZbieraczy == LOG_SUCCESS)
    {
        AI_Output (self, other ,"DIA_Organisator_NEWSY_03_07"); //Zbieracze s� dzi� bardzo niespokojni. Nie planuj� zej�� z p�l ry�owych.
        AI_Output (self, other ,"DIA_Organisator_NEWSY_03_08"); //M�wi� ci. Co� wisi w powietrzu, Je�eli maczasz w tym palce to dam ci rad�.
        AI_Output (other, self ,"DIA_Organisator_NEWSY_15_09"); //S�ucham.
        AI_Output (self, other ,"DIA_Organisator_NEWSY_03_10"); //Tych dw�ch go�ci, kt�rzy stoj� za mn�... to pupilki Lewusa. Uwa�aj na nich.
    }
    else if (MIS_BuntZbieraczy == LOG_SUCCESS)
    {
        AI_Output (self, other ,"DIA_Organisator_NEWSY_03_11"); //No nie�le. Podobno bra�e� udzia� w buncie zbieraczy. Musz� ci pogratulowa�. Nigdy nie lubi�em Lewusa i jego kolegi.
    AI_Output (other, self ,"DIA_Organisator_NEWSY_15_12"); //Co jeszcze wiesz?
	};
    if (Kapitel >= 4)
    {
        AI_Output (self, other ,"DIA_Organisator_NEWSY_03_13"); //S�ysza�e� o wydarzeniach w Starym Obozie. Podobno zawali�a si� kopalnia! Gomez jest w�ciek�y.
        AI_Output (self, other ,"DIA_Organisator_NEWSY_03_14"); //Jeden ze Szkodnik�w, kt�ry by� na zwiadach powiedzia� mi, �e widzia� dw�ch go�ci, kt�rzy walczyli ze Stra�nikami.
        AI_Output (self, other ,"DIA_Organisator_NEWSY_03_15"); //By� w�r�d nich jeden Mag Ognia i jaki� Cie�.
    };
    AI_Output (self, other ,"DIA_Organisator_NEWSY_03_16"); //Jeszcze jedno. Je�eli szukasz pracy, to pogadaj z my�liwymi ze wzg�rza. Podobno maj� jakie� problemy. 
};
*/

