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
	description	= "Co s³ychaæ?";
};                       

FUNC INT Info_ORG_829_Hello_Condition()
{
	return 1;
};

FUNC VOID Info_ORG_829_Hello_Info()
{	
	AI_Output (other, self,"Info_ORG_829_Hello_15_00"); //Co s³ychaæ?
	AI_Output (self, other,"Info_ORG_829_Hello_06_01"); //Nie najgorzej, ale nie mam ju¿ nic do palenia.
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
	description	= "Mam przy sobie trochê ziela - chcesz?";
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
	AI_Output (other, self,"Info_ORG_829_OfferJoint_15_00"); //Mam przy sobie trochê ziela - chcesz?
	
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
		AI_Output (self, other,"Info_ORG_829_OfferJoint_No_Joint_06_00"); //Hej, koleœ! Nie próbuj mnie wykiwaæ! Bardzo tego nie lubiê!
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
	description	= "Jestem tu nowy. Masz mo¿e dla mnie jakieœ wskazówki?";
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
	AI_Output (other, self,"Info_ORG_829_SpecialInfo_15_00"); //Jestem tu nowy. Masz mo¿e dla mnie jakieœ wskazówki?
	AI_Output (self, other,"Info_ORG_829_SpecialInfo_06_01"); //Jasne! Po dotarciu do Obozu idŸ do Gorna. Wprawdzie to jeden z Najemników w s³u¿bie Magów, ale jest w porz¹dku. Kiedyœ by³ jednym z nas.
	AI_Output (other, self,"Info_ORG_829_SpecialInfo_15_02"); //Co masz na myœli mówi¹c "jednym z nas"?
	AI_Output (self, other,"Info_ORG_829_SpecialInfo_06_03"); //No, Szkodnikiem, rzecz jasna. Postrachem Magnatów, ot co!
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
	description	= "Czego mogê siê spodziewaæ w Obozie?";
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
	AI_Output (other, self,"Info_ORG_829_PERM_15_00"); //Czego mogê siê spodziewaæ w Obozie?
	AI_Output (self, other,"Info_ORG_829_PERM_06_01"); //Najlepiej idŸ i sam siê przekonaj.
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
    AI_Output (self, other ,"DIA_Organisator_MAGE_QUEST_03_01"); //Podobno szukasz tych wkurwiaj¹cych magików. Dobrze, bardzo dobrze. Mam doœæ tego ca³ego zamieszania. Widzia³em jednego jak bieg³ w kierunku rzeki.
    AI_Output (other, self ,"DIA_Organisator_MAGE_QUEST_15_02"); //Dziêki. Ka¿da informacja siê przyda.
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
    AI_Output (self, other ,"DIA_Organisator_WELCOME_IN_CAMP_03_02"); //My nie zajmujemy siê wojnami, nie oddajemy czci dziwnym bóstwom oraz nie pertraktujemy z Królem.
    AI_Output (self, other ,"DIA_Organisator_WELCOME_IN_CAMP_03_03"); //Robimy co chcemy i jak chcemy, przy okazji wspó³pracuj¹c z Magami Wody.
    AI_Output (self, other ,"DIA_Organisator_WELCOME_IN_CAMP_03_04"); //Je¿eli bêdziesz szuka³ pracy, lub po prostu nie mia³ z kim pogadaæ, to wal œmia³o.
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
   description	= "Jakieœ wieœci?";
};

FUNC INT DIA_Organisator_NEWSY_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Organisator_NEWSY_Info()
{
    AI_Output (other, self ,"DIA_Organisator_NEWSY_15_01"); //Jakieœ wieœci?
    if (!MIS_CronosArtifacts == LOG_SUCCESS)
    {
        AI_Output (self, other ,"DIA_Organisator_NEWSY_03_02"); //Cronos wci¹¿ poszukuje skradzionych artefaktów. Podobno pomaga mu Orik. 
        AI_Output (self, other ,"DIA_Organisator_NEWSY_03_03"); //Szczerze, to mam ju¿ dosyæ tego ca³ego zamieszania. Po okolicy biega kilku œwirów uzbrojonych w magiczne zwoje.
        AI_Output (self, other ,"DIA_Organisator_NEWSY_03_04"); //Jedni siê boj¹, inni ich szukaj¹. 
    }
    else if (MIS_CronosArtifacts == LOG_SUCCESS)
    {
        AI_Output (self, other ,"DIA_Organisator_NEWSY_03_05"); //Uda³o ci siê rozwi¹zaæ problemy ze Szkodnikami. Wreszcie jest trochê spokoju.
   
    AI_Output (other, self ,"DIA_Organisator_NEWSY_15_06"); //Coœ jeszcze?
	} 
	else if 
    if (Npc_KnowsInfo (hero, DIA_Rufus_ActionGoWhat)) && (!MIS_BuntZbieraczy == LOG_SUCCESS)
    {
        AI_Output (self, other ,"DIA_Organisator_NEWSY_03_07"); //Zbieracze s¹ dziœ bardzo niespokojni. Nie planuj¹ zejœæ z pól ry¿owych.
        AI_Output (self, other ,"DIA_Organisator_NEWSY_03_08"); //Mówiê ci. Coœ wisi w powietrzu, Je¿eli maczasz w tym palce to dam ci radê.
        AI_Output (other, self ,"DIA_Organisator_NEWSY_15_09"); //S³ucham.
        AI_Output (self, other ,"DIA_Organisator_NEWSY_03_10"); //Tych dwóch goœci, którzy stoj¹ za mn¹... to pupilki Lewusa. Uwa¿aj na nich.
    }
    else if (MIS_BuntZbieraczy == LOG_SUCCESS)
    {
        AI_Output (self, other ,"DIA_Organisator_NEWSY_03_11"); //No nieŸle. Podobno bra³eœ udzia³ w buncie zbieraczy. Muszê ci pogratulowaæ. Nigdy nie lubi³em Lewusa i jego kolegi.
    AI_Output (other, self ,"DIA_Organisator_NEWSY_15_12"); //Co jeszcze wiesz?
	};
    if (Kapitel >= 4)
    {
        AI_Output (self, other ,"DIA_Organisator_NEWSY_03_13"); //S³ysza³eœ o wydarzeniach w Starym Obozie. Podobno zawali³a siê kopalnia! Gomez jest wœciek³y.
        AI_Output (self, other ,"DIA_Organisator_NEWSY_03_14"); //Jeden ze Szkodników, który by³ na zwiadach powiedzia³ mi, ¿e widzia³ dwóch goœci, którzy walczyli ze Stra¿nikami.
        AI_Output (self, other ,"DIA_Organisator_NEWSY_03_15"); //By³ wœród nich jeden Mag Ognia i jakiœ Cieñ.
    };
    AI_Output (self, other ,"DIA_Organisator_NEWSY_03_16"); //Jeszcze jedno. Je¿eli szukasz pracy, to pogadaj z myœliwymi ze wzgórza. Podobno maj¹ jakieœ problemy. 
};
*/

