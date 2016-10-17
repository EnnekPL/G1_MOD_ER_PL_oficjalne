//poprawione i sprawdzone - Nocturn

// ***************************** 
//				EXIT 
// *****************************

instance DIA_TPL_1402_GorNaToth_Exit (C_INFO)
{
	npc			= TPL_1402_GorNaToth;
	nr			= 999;
	condition	= DIA_TPL_1402_GorNaToth_Exit_Condition;
	information	= DIA_TPL_1402_GorNaToth_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int DIA_TPL_1402_GorNaToth_Exit_Condition()
{
	return TRUE;
};

FUNC VOID DIA_TPL_1402_GorNaToth_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// ***************************** 
//			IdonDebt 
// *****************************
instance DIA_GorNaToth_IdonDebt (C_INFO)
{
	npc			= TPL_1402_GorNaToth;
	nr			= 1;
	condition	= DIA_GorNaToth_IdonDebt_Condition;
	information	= DIA_GorNaToth_IdonDebt_Info;
	permanent	= 0;
	description = "Przychodzê w sprawie d³ugów, które zaci¹gn¹³ jeden z twoich Stra¿ników. ";
};                       

FUNC int DIA_GorNaToth_IdonDebt_Condition()
{
	if	Npc_KnowsInfo(hero,DIA_GorNaIdon_LOAN)
	{
		return 1;
	};
};

FUNC VOID DIA_GorNaToth_IdonDebt_Info()
{
	AI_Output			(other, self,"DIA_GorNaToth_IdonDebt_15_00"); //Przychodzê w sprawie d³ugów, które zaci¹gn¹³ jeden z twoich Stra¿ników.
	AI_Output			(self, other,"DIA_GorNaToth_IdonDebt_11_01"); //Zwierzchnikiem Stra¿ników Œwi¹tynnych jest Cor Angar. A o co chodzi i czemu mielibyœmy ci pomóc? 
	AI_Output			(other, self,"DIA_GorNaToth_IdonDebt_15_02"); //Gor Na Idon ma d³ug za gorza³kê u handlarza Starkada. Dok³adnie 150 bry³ek rudy. Nie chce mi ich zwróciæ.
	AI_Output			(self, other,"DIA_GorNaToth_IdonDebt_11_03"); //Widzê, ¿e by³a tu niez³a popijawa podczas mojej nieobecnoœci. WeŸ tê rudê. Stra¿ników spotka zas³u¿ona kara podczas treningów. 
	CreateInvItems (self,itminugget, 150);
	B_GiveinvItems (self,other,itminugget,150);
	B_LogEntry (CH1_CheatedMerchant,"Gor Na Toth zwróci³ mi rudê i obieca³, ¿e ukarze Gor Na Idona. ");
	AI_StopProcessInfos	(self);
};

// ***************************** 
//			Abweisend 
// *****************************
instance DIA_GorNaToth_Abweisend (C_INFO)
{
	npc			= TPL_1402_GorNaToth;
	nr			= 1;
	condition	= DIA_GorNaToth_Abweisend_Condition;
	information	= DIA_GorNaToth_Abweisend_Info;
	permanent	= 1;
	description = "Mo¿esz mnie czegoœ nauczyæ?";
};                       

FUNC int DIA_GorNaToth_Abweisend_Condition()
{
	if	!Npc_KnowsInfo(hero,DIA_GorNaToth_AngarTalked)
	&&	!C_NpcBelongsToPsiCamp(hero)  
	{
		return 1;
	};
};

FUNC VOID DIA_GorNaToth_Abweisend_Info()
{
	AI_Output			(other, self,"DIA_GorNaToth_AngarTalked_15_00"); //Mo¿esz mnie czegoœ nauczyæ?
	AI_Output			(self, other,"DIA_GorNaToth_AngarTalked_11_01"); //ZejdŸ mi z oczu, niegodny robaku! Uczê wy³¹cznie Stra¿ników Œwi¹tyni Œni¹cego.
	AI_StopProcessInfos	(self);
	

};

// ***************************** 
//			AngarTalked 
// *****************************

instance DIA_GorNaToth_AngarTalked (C_INFO)
{
	npc			= TPL_1402_GorNaToth;
	nr			= 1;
	condition	= DIA_GorNaToth_AngarTalked_Condition;
	information	= DIA_GorNaToth_AngarTalked_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int DIA_GorNaToth_AngarTalked_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_CorAngar_LaterTrainer))
	{
		return 1;
	};
};

FUNC VOID DIA_GorNaToth_AngarTalked_Info()
{
	AI_Output (self, other,"DIA_GorNaToth_AngarTalked_11_00"); //Rozmawia³eœ z Cor Angarem? I co powiedzia³?
	Info_ClearChoices		(DIA_GorNaToth_AngarTalked);
	Info_AddChoice			(DIA_GorNaToth_AngarTalked,	"Powiedzia³, ¿e jesteœ niegodny, by nosiæ zbrojê Œwi¹tynnego Stra¿nika.",DIA_GorNaToth_AngarTalked_Unworthy);	
	Info_AddChoice			(DIA_GorNaToth_AngarTalked,	"Powiedzia³, ¿e nigdy nie lubi³ b³otnych wê¿y.",DIA_GorNaToth_AngarTalked_Shark);	
	Info_AddChoice			(DIA_GorNaToth_AngarTalked,	"Kaza³ mi zg³osiæ siê do niego, gdy ju¿ zostanê Œwi¹tynnym Stra¿nikiem.",DIA_GorNaToth_AngarTalked_Normal);	
};

func void DIA_GorNaToth_AngarTalked_Normal()
{
	AI_Output (other, self,"DIA_GorNaToth_AngarTalked_Normal_15_00"); //Kaza³ mi zg³osiæ siê do niego, gdy ju¿ zostanê Œwi¹tynnym Stra¿nikiem.
	AI_Output (self, other,"DIA_GorNaToth_AngarTalked_Normal_11_01"); //NajwyraŸniej ma o tobie wysokie mniemanie. Inaczej nie odezwa³by siê do ciebie.
	AI_Output (self, other,"DIA_GorNaToth_AngarTalked_Normal_11_02"); //To wielki zaszczyt zostaæ przez niego choæby zauwa¿onym. Do mnie odezwa³ siê po raz ostatni ca³e dwa miesi¹ce temu!
	Info_ClearChoices		(DIA_GorNaToth_AngarTalked);
};

func void DIA_GorNaToth_AngarTalked_Shark()
{
	AI_Output (other, self,"DIA_GorNaToth_AngarTalked_Shark_15_00"); //Powiedzia³, ¿e nigdy nie lubi³ b³otnych wê¿y.
	AI_Output (self, other,"DIA_GorNaToth_AngarTalked_Shark_11_01"); //Co...? (zdecydowanie) Czeka mnie œwiêta misja!
	AI_Output (self, other,"DIA_GorNaToth_AngarTalked_Shark_11_02"); //¯yczenie mojego mistrza jest dla mnie rozkazem.
	Info_ClearChoices		(DIA_GorNaToth_AngarTalked);
};

func void DIA_GorNaToth_AngarTalked_Unworthy()
{
	AI_Output (other, self,"DIA_GorNaToth_AngarTalked_Unworthy_15_00"); //Powiedzia³, ¿e jesteœ niegodny, by nosiæ zbrojê Œwi¹tynnego Stra¿nika.
	AI_Output (self, other,"DIA_GorNaToth_AngarTalked_Unworthy_11_01"); //Nigdy! Nie móg³ tak powiedzieæ! Nie o mnie!
	Info_ClearChoices		(DIA_GorNaToth_AngarTalked);
	AI_StopProcessInfos	( self );
	Npc_SetTarget(self,other);
	AI_StartState (self,ZS_ATTACK,1,"");
};

//-------------------------------------------------------
// AUFNAHME BEI DEN TEMPLERN
//-------------------------------------------------------
instance  TPL_1402_GorNaToth_GETSTUFF (C_INFO)
{
	npc				= TPL_1402_GorNaToth;
	condition		= TPL_1402_GorNaToth_GETSTUFF_Condition;
	information		= TPL_1402_GorNaToth_GETSTUFF_Info;
	important		= 0;
	permanent		= 0;
	description		= "Chcia³bym odebraæ moj¹ zbrojê Œwi¹tynnego Stra¿nika."; 
};

FUNC int  TPL_1402_GorNaToth_GETSTUFF_Condition()
{	
	if (Npc_GetTrueGuild (hero) == GIL_TPL)
	{
		return TRUE;
	};

};
FUNC void  TPL_1402_GorNaToth_GETSTUFF_Info()
{
	AI_Output			(other, self,"TPL_1402_GorNaToth_GETSTUFF_Info_15_01"); //Chcia³bym odebraæ moj¹ zbrojê Œwi¹tynnego Stra¿nika.
	AI_Output			(self, other,"TPL_1402_GorNaToth_GETSTUFF_Info_11_02"); //To prawdziwy zaszczyt wrêczyæ zbrojê cz³owiekowi, który zdoby³ dla nas jaja pe³zaczy.
	AI_Output			(self, other,"TPL_1402_GorNaToth_GETSTUFF_Info_11_03"); //Niech ta zbroja chroni ciê równie dobrze jak Œni¹cy chroni nasze Bractwo!
	
	B_LogEntry			(GE_BecomeTemplar,	"Gor Na Toth da³ mi moj¹ pierwsz¹ zbrojê Œwi¹tynnej Stra¿y. Teraz jestem pe³noprawnym cz³onkiem tej spo³ecznoœci!");

	Log_CreateTopic		(GE_TraderPSI,		LOG_NOTE);
	B_LogEntry			(GE_TraderPSI,		"Gor Na Toth ma na sk³adzie lepsze zbroje Œwi¹tynnej Stra¿y. Niestety, ¿eby je otrzymaæ, muszê najpierw z³o¿yæ pokaŸny datek na rzecz Bractwa. W ci¹gu dnia Toth przebywa zwykle na placu treningowym.");
	
	CreateInvItem		(hero, TPL_ARMOR_L);
	
	CreateInvItem		(self, ItAmArrow);
	B_GiveInvItems      (self, hero, ItAmArrow, 1);
	Npc_RemoveInvItem	(hero, ItAmArrow);
	
	AI_EquipBestArmor	(hero);
};  

/*------------------------------------------------------------------------
//							ARMOR
------------------------------------------------------------------------*/
instance  TPL_1402_GorNaToth_ARMOR (C_INFO)
{
	npc				= TPL_1402_GorNaToth;
	condition		= TPL_1402_GorNaToth_ARMOR_Condition;
	information		= TPL_1402_GorNaToth_ARMOR_Info;
	important		= 0;
	permanent		= 1;
	description		= "Potrzebujê lepszej zbroi."; 
};

FUNC int  TPL_1402_GorNaToth_ARMOR_Condition()
{	
	if	(Npc_KnowsInfo(hero,TPL_1402_GorNaToth_GETSTUFF))
	&& (Npc_GetTrueGuild (hero) == GIL_TPL)
	{
		return TRUE;
	};

};
FUNC void  TPL_1402_GorNaToth_ARMOR_Info()
{
	AI_Output				(other, self,"Info_GorNaToth_ARMOR_15_01"); //Potrzebujê lepszej zbroi.
	AI_Output				(self, other,"Info_GorNaToth_ARMOR_11_02"); //Có¿, móg³bym ci daæ lepsz¹ zbrojê, ale musia³byœ najpierw przekazaæ spory datek na rzecz Bractwa.

	Info_ClearChoices		(TPL_1402_GorNaToth_ARMOR);
	Info_AddChoice			(TPL_1402_GorNaToth_ARMOR,	DIALOG_BACK	,	TPL_1402_GorNaToth_ARMOR_BACK);	
	Info_AddChoice			(TPL_1402_GorNaToth_ARMOR,	B_BuildBuyArmorString(NAME_GorNaTothHeavyTpl,VALUE_TPL_ARMOR_H) ,TPL_1402_GorNaToth_ARMOR_H);	
	Info_AddChoice			(TPL_1402_GorNaToth_ARMOR,	B_BuildBuyArmorString(NAME_GorNaTothTpl,VALUE_TPL_ARMOR_M),	TPL_1402_GorNaToth_ARMOR_M);	


};

func void TPL_1402_GorNaToth_ARMOR_M ()
{
	AI_Output				(hero, self,"Info_GorNaToth_ARMOR_M_15_01"); //Potrzebujê wzmocnionej zbroi Stra¿ników Œwi¹tynnych.

	if (Kapitel < 3)
	{
		AI_Output			(self, hero,"Info_GorNaToth_ARMOR_M_11_02"); //Nie jesteœ wystarczaj¹co doœwiadczony. Udowodnij swoj¹ przydatnoœæ w Stra¿y, a zas³u¿ysz sobie na lepszy pancerz!
	}
	else if (Npc_HasItems(hero, ItMiNugget)<VALUE_TPL_ARMOR_M)
	{
		AI_Output			(self, hero,"Info_GorNaToth_ARMOR_M_11_03"); //Gdy tylko wesprzesz nasz¹ spo³ecznoœæ odpowiednim datkiem, zbroja bêdzie twoja!
	}
	else
	{
		AI_Output			(self, hero,"Info_GorNaToth_ARMOR_M_11_04"); //Teraz, gdy jesteœ gotów wesprzeæ nas swoim hojnym datkiem, mo¿esz odebraæ swoj¹ zbrojê.
		B_GiveInvItems	    (hero, self, ItMiNugget,	VALUE_TPL_ARMOR_M);
		
		CreateInvItem		(hero, TPL_ARMOR_M);
		
		CreateInvItem		(self, ItAmArrow);
		B_GiveInvItems      (self, hero, ItAmArrow, 1);
		Npc_RemoveInvItem	(hero, ItAmArrow);
		
		AI_EquipBestArmor	(hero);
	};

	Info_ClearChoices		(TPL_1402_GorNaToth_ARMOR);
};

func void TPL_1402_GorNaToth_ARMOR_H ()
{
	AI_Output				(hero, self,"Info_GorNaToth_ARMOR_H_15_01"); //Chcia³bym otrzymaæ ciê¿k¹ zbrojê Stra¿y Œwi¹tynnej.

	if (Kapitel < 4)
	{
		AI_Output			(self, hero,"Info_GorNaToth_ARMOR_H_11_02"); //Nie jesteœ jeszcze wystarczaj¹co doœwiadczony. Udowodnij swoj¹ przydatnoœæ dla naszej spo³ecznoœci, a dost¹pisz zaszczytu noszenia tak wspania³ego pancerza.
	}
	else if (Npc_HasItems(hero, ItMiNugget)>=VALUE_TPL_ARMOR_H)
	{
		AI_Output			(self, hero,"Info_GorNaToth_ARMOR_H_11_03"); //Widzê, ¿e jesteœ ju¿ gotów, by nosiæ tê wspania³¹ zbrojê. Gdybyœ tylko mia³ doœæ rudy, by wspomóc nasz¹ ma³¹ spo³ecznoœæ jakimœ hojnym datkiem...
	}
	else
	{
		AI_Output			(self, hero,"Info_GorNaToth_ARMOR_H_11_04"); //Od tej pory ten wspania³y pancerz bêdzie dawa³ œwiadectwo twego mêstwa i poœwiêcenia.

		B_GiveInvItems  	(hero, self, ItMiNugget,VALUE_TPL_ARMOR_H);

		CreateInvItem		(self, ItAmArrow);				//SN: Kronkelgegenstand, damit die Bildschrimausgabe "1 Gegenstand erhalten" stimmt (Rüstung geht nicht, da dann immer Gor Na Toth seine eigene erst auszieht, und eine Sekunde nackt dasteht)
		B_GiveInvItems  	(self, hero, ItAmArrow, 1);
		Npc_RemoveInvItem	(hero,	ItAmArrow);

		CreateInvItem		(hero, TPL_ARMOR_H);
		AI_EquipBestArmor	(hero);
	};

	Info_ClearChoices		(TPL_1402_GorNaToth_ARMOR);
};

func void TPL_1402_GorNaToth_ARMOR_BACK ()
{
	AI_Output				(hero, self,"Info_GorNaToth_ARMOR_BACK_15_01"); //Chyba siê jednak rozmyœlê.
	AI_Output				(self, hero,"Info_GorNaToth_ARMOR_BACK_11_02"); //Jak sobie ¿yczysz. Wiesz, gdzie mnie szukaæ.

	Info_ClearChoices		(TPL_1402_GorNaToth_ARMOR);
};


//---------------------------------------------------------------
//     						STR + DEX
//---------------------------------------------------------------
INSTANCE TPL_1402_GorNaToth_Teach(C_INFO)
{
	npc			= TPL_1402_GorNaToth;
	nr			= 10;
	condition	= TPL_1402_GorNaToth_Teach_Condition;
	information	= TPL_1402_GorNaToth_Teach_Info;
	permanent	= 1;
	description = "Mo¿esz mnie czegoœ nauczyæ?";
};                       

FUNC INT TPL_1402_GorNaToth_Teach_Condition()
{
	if (C_NpcBelongsToPsiCamp(hero))  
	{
		return TRUE;
	};
};

FUNC VOID TPL_1402_GorNaToth_Teach_Info()
{
	AI_Output			(other,self,"TPL_1402_GorNaToth_Teach_15_00"); //Mo¿esz mnie czegoœ nauczyæ?
	AI_Output			(self,other,"TPL_1402_GorNaToth_Teach_11_01"); //Si³a i zrêcznoœæ s¹ równie istotne jak potêga umys³u.
	
	if	(log_gornatothfight == FALSE) 
	{
		Log_CreateTopic   	(GE_TeacherPSI,LOG_NOTE);
		B_LogEntry			(GE_TeacherPSI,"Gor Na Toth mo¿e mnie nauczyæ walki jednorêcznym orê¿em, a tak¿e poka¿e mi jak zwiêkszyæ si³ê, zrêcznoœæ i manê, jeœli do³¹czê do Bractwa.");
		log_gornatothfight = TRUE;
	};
	
	Info_ClearChoices	(TPL_1402_GorNaToth_Teach);
	Info_AddChoice		(TPL_1402_GorNaToth_Teach,DIALOG_BACK									,TPL_1402_GorNaToth_Teach_BACK);
	Info_AddChoice		(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)			,TPL_1402_GorNaToth_Teach_STR_5);
	Info_AddChoice		(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)			,TPL_1402_GorNaToth_Teach_STR_1);
	Info_AddChoice		(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),TPL_1402_GorNaToth_Teach_DEX_5);
	Info_AddChoice		(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),TPL_1402_GorNaToth_Teach_DEX_1);
	Info_AddChoice		(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnMana_5,5*LPCOST_ATTRIBUTE_MANA,0)		,TPL_1402_GorNaToth_Teach_MAN_5);
	Info_AddChoice		(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnMana_1,LPCOST_ATTRIBUTE_MANA,0)			,TPL_1402_GorNaToth_Teach_MAN_1);

	if (log_gornatothtrain == FALSE)
	{
		Log_CreateTopic   	(GE_TeacherPSI,LOG_NOTE);
		B_LogEntry			(GE_TeacherPSI,"Gor Na Toth mo¿e mi pomóc zwiêkszyæ moj¹ si³ê, zrêcznoœæ i manê.");
		log_gornatothtrain = TRUE;
	};
};

func void TPL_1402_GorNaToth_Teach_BACK()
{
	Info_ClearChoices	(TPL_1402_GorNaToth_Teach);
};

func void TPL_1402_GorNaToth_Teach_STR_1()
{
	B_BuyAttributePoints(other, ATR_STRENGTH, LPCOST_ATTRIBUTE_STRENGTH);
	Info_ClearChoices	(TPL_1402_GorNaToth_Teach);
	Info_AddChoice		(TPL_1402_GorNaToth_Teach,DIALOG_BACK									,TPL_1402_GorNaToth_Teach_BACK);
	Info_AddChoice		(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)			,TPL_1402_GorNaToth_Teach_STR_5);
	Info_AddChoice		(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)			,TPL_1402_GorNaToth_Teach_STR_1);
	Info_AddChoice		(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),TPL_1402_GorNaToth_Teach_DEX_5);
	Info_AddChoice		(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),TPL_1402_GorNaToth_Teach_DEX_1);
	Info_AddChoice		(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnMana_5,5*LPCOST_ATTRIBUTE_MANA,0)			,TPL_1402_GorNaToth_Teach_MAN_5);
	Info_AddChoice		(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnMana_1,LPCOST_ATTRIBUTE_MANA,0)			,TPL_1402_GorNaToth_Teach_MAN_1);
};

func void TPL_1402_GorNaToth_Teach_STR_5()
{
	B_BuyAttributePoints(other, ATR_STRENGTH, 5*LPCOST_ATTRIBUTE_STRENGTH);
	Info_ClearChoices	(TPL_1402_GorNaToth_Teach);
	Info_AddChoice		(TPL_1402_GorNaToth_Teach,DIALOG_BACK									,TPL_1402_GorNaToth_Teach_BACK);
	Info_AddChoice		(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)			,TPL_1402_GorNaToth_Teach_STR_5);
	Info_AddChoice		(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)			,TPL_1402_GorNaToth_Teach_STR_1);
	Info_AddChoice		(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),TPL_1402_GorNaToth_Teach_DEX_5);
	Info_AddChoice		(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),TPL_1402_GorNaToth_Teach_DEX_1);
	Info_AddChoice		(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnMana_5,5*LPCOST_ATTRIBUTE_MANA,0)			,TPL_1402_GorNaToth_Teach_MAN_5);
	Info_AddChoice		(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnMana_1,LPCOST_ATTRIBUTE_MANA,0)			,TPL_1402_GorNaToth_Teach_MAN_1);
};

func void TPL_1402_GorNaToth_Teach_DEX_1()
{
	B_BuyAttributePoints(other, ATR_DEXTERITY, LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices	(TPL_1402_GorNaToth_Teach);
	Info_AddChoice		(TPL_1402_GorNaToth_Teach,DIALOG_BACK									,TPL_1402_GorNaToth_Teach_BACK);
	Info_AddChoice		(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)			,TPL_1402_GorNaToth_Teach_STR_5);
	Info_AddChoice		(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)			,TPL_1402_GorNaToth_Teach_STR_1);
	Info_AddChoice		(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),TPL_1402_GorNaToth_Teach_DEX_5);
	Info_AddChoice		(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),TPL_1402_GorNaToth_Teach_DEX_1);
	Info_AddChoice		(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnMana_5,5*LPCOST_ATTRIBUTE_MANA,0)			,TPL_1402_GorNaToth_Teach_MAN_5);
	Info_AddChoice		(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnMana_1,LPCOST_ATTRIBUTE_MANA,0)			,TPL_1402_GorNaToth_Teach_MAN_1);
};

func void TPL_1402_GorNaToth_Teach_DEX_5()
{
	B_BuyAttributePoints(other, ATR_DEXTERITY, 5*LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices	(TPL_1402_GorNaToth_Teach);
	Info_AddChoice		(TPL_1402_GorNaToth_Teach,DIALOG_BACK									,TPL_1402_GorNaToth_Teach_BACK);
	Info_AddChoice		(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)			,TPL_1402_GorNaToth_Teach_STR_5);
	Info_AddChoice		(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)			,TPL_1402_GorNaToth_Teach_STR_1);
	Info_AddChoice		(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),TPL_1402_GorNaToth_Teach_DEX_5);
	Info_AddChoice		(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),TPL_1402_GorNaToth_Teach_DEX_1);
	Info_AddChoice		(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnMana_5,5*LPCOST_ATTRIBUTE_MANA,0)			,TPL_1402_GorNaToth_Teach_MAN_5);
	Info_AddChoice		(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnMana_1,LPCOST_ATTRIBUTE_MANA,0)			,TPL_1402_GorNaToth_Teach_MAN_1);
};
func void TPL_1402_GorNaToth_Teach_MAN_1()
{
	Mod_KupAtrybut (hero, ATR_MANA_MAX, 1);
	Info_ClearChoices	(TPL_1402_GorNaToth_Teach);
	Info_AddChoice		(TPL_1402_GorNaToth_Teach,DIALOG_BACK									,TPL_1402_GorNaToth_Teach_BACK);
	Info_AddChoice		(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)			,TPL_1402_GorNaToth_Teach_STR_5);
	Info_AddChoice		(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)			,TPL_1402_GorNaToth_Teach_STR_1);
	Info_AddChoice		(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),TPL_1402_GorNaToth_Teach_DEX_5);
	Info_AddChoice		(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),TPL_1402_GorNaToth_Teach_DEX_1);
	Info_AddChoice		(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnMana_5,5*LPCOST_ATTRIBUTE_MANA,0)			,TPL_1402_GorNaToth_Teach_MAN_5);
	Info_AddChoice		(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnMana_1,LPCOST_ATTRIBUTE_MANA,0)			,TPL_1402_GorNaToth_Teach_MAN_1);
};

func void TPL_1402_GorNaToth_Teach_MAN_5()
{
	Mod_KupAtrybut (hero, ATR_MANA_MAX, 5);
	Info_ClearChoices	(TPL_1402_GorNaToth_Teach);
	Info_AddChoice		(TPL_1402_GorNaToth_Teach,DIALOG_BACK									,TPL_1402_GorNaToth_Teach_BACK);
	Info_AddChoice		(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)			,TPL_1402_GorNaToth_Teach_STR_5);
	Info_AddChoice		(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)			,TPL_1402_GorNaToth_Teach_STR_1);
	Info_AddChoice		(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),TPL_1402_GorNaToth_Teach_DEX_5);
	Info_AddChoice		(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),TPL_1402_GorNaToth_Teach_DEX_1);
	Info_AddChoice		(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnMana_5,5*LPCOST_ATTRIBUTE_MANA,0)			,TPL_1402_GorNaToth_Teach_MAN_5);
	Info_AddChoice		(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnMana_1,LPCOST_ATTRIBUTE_MANA,0)			,TPL_1402_GorNaToth_Teach_MAN_1);
};
/*
// **************************************************
// 					TRAIN
// **************************************************

INSTANCE DIA_GorNaToth_TRAIN (C_INFO)
{
	npc			= TPL_1402_GorNaToth;
	nr			= 10;
	condition	= DIA_GorNaToth_TRAIN_Condition;
	information	= DIA_GorNaToth_TRAIN_Info;
	permanent	= 0;
	description = "Mo¿esz nauczyæ mnie lepiej walczyæ?";
};                       

FUNC INT DIA_GorNaToth_TRAIN_Condition()
{
		return 1;
};

FUNC VOID DIA_GorNaToth_TRAIN_Info()
{

	AI_Output (other,self,"DIA_GorNaToth_TRAIN_15_00"); //Mo¿esz nauczyæ mnie lepiej walczyæ?
	AI_Output (self,other,"DIA_GorNaToth_TRAIN_01_01"); //Tak, szkolê cz³onków Bractwa w walce jednorêcznym orê¿em.
	};
*/
// **************************************************
// 					START_TRAIN
// **************************************************

INSTANCE DIA_GorNaToth_START_TRAIN (C_INFO)
{
	npc			= TPL_1402_GorNaToth;
	nr			= 10;
	condition	= DIA_GorNaToth_START_TRAIN_Condition;
	information	= DIA_GorNaToth_START_TRAIN_Info;
	permanent	= 1;
	description = "Zacznijmy trening.";
};                       

FUNC INT DIA_GorNaToth_START_TRAIN_Condition()
{
	if  ((Npc_GetTrueGuild(hero) == GIL_NOV) || (Npc_GetTrueGuild(hero) == GIL_TPL) || (Npc_GetTrueGuild(hero) == GIL_GUR) || (Npc_GetTrueGuild(hero) == GIL_DMB))
	{
		return 1;
	};
};

FUNC VOID DIA_GorNaToth_START_TRAIN_Info()
{
	AI_Output (other,self,"DIA_GorNaToth_START_TRAIN_15_00"); //Zacznijmy trening.
	AI_Output (self,other,"DIA_GorNaToth_START_TRAIN_01_01"); //Do roboty!
	
	Info_ClearChoices	(DIA_GorNaToth_START_TRAIN);
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,DIALOG_BACK,DIA_GorNaToth_START_TRAINBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 0) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Broñ jednorêczna, poziom 1, 100 bry³ek rudy, 10 PN",GorNaToth_nauka1h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 1) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Broñ jednorêczna, poziom 2, 200 bry³ek rudy, 10 PN",GorNaToth_nauka1h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 2) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Broñ jednorêczna, poziom 3, 300 bry³ek rudy, 10 PN",GorNaToth_nauka1h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 3) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Broñ jednorêczna, poziom 4, 400 bry³ek rudy, 10 PN",GorNaToth_nauka1h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 4) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Broñ jednorêczna, poziom 5, 500 bry³ek rudy, 10 PN",GorNaToth_nauka1h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 5) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Broñ jednorêczna, poziom 6, 600 bry³ek rudy, 10 PN",GorNaToth_nauka1h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 6) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Broñ jednorêczna, poziom 7, 1000 bry³ek rudy, 10 PN",GorNaToth_nauka1h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 7) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Broñ jednorêczna, poziom 8, 1500 bry³ek rudy, 10 PN",GorNaToth_nauka1h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 8) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Broñ jednorêczna, poziom 9, 2000 bry³ek rudy, 10 PN",GorNaToth_nauka1h9);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 9) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Broñ jednorêczna, poziom 10, 2500 bry³ek rudy, 10 PN",GorNaToth_nauka1h10);
	};
};

func void DIA_GorNaToth_START_TRAINBACK ()
{
	Info_ClearChoices	(DIA_GorNaToth_START_TRAIN);
};

FUNC VOID GorNaToth_nauka1h1 ()
{
	AI_Output (other,self,"DIA_GorNaToth_TRAIN_1h_15_00"); //Chcia³bym nauczyæ siê walki jednorêcznym orê¿em.
	if (Npc_HasItems(other,itminugget) >= 100)
	{
		if (B_GiveSkill(other, NPC_TALENT_1H, 1, 10))
		{
		AI_Output (self,other,"DIA_GorNaToth_TRAIN_1h_npc_01"); //M¹dra decyzja. Najbli¿sze trzy lekcje obejm¹ podstawy z którymi powinieneœ siê zapoznaæ.
		AI_Output (self,other,"DIA_GorNaToth_TRAIN_1h_npc_02"); //Bronie jednorêczne s¹ znacznie l¿ejsze ni¿ dwurêczne, a przez to równie¿ znacznie szybsze. 
		AI_Output (self,other,"DIA_GorNaToth_TRAIN_1h_npc_03"); //Istnieje podzia³ na lekkie bronie jednorêczne i te ciê¿sze. Ciê¿sze wymagaj¹ pewniejszego chwytu, ale te¿ wiêcej si³y.
		AI_Output (self,other,"DIA_GorNaToth_TRAIN_1h_npc_04"); //Jeœli chcesz p³ynnie walczyæ ciê¿k¹ jednorêczn¹, poza technik¹ bêdziesz te¿ musia³ poznaæ tajniki balansowania cia³em.
		AI_Output (self,other,"DIA_GorNaToth_TRAIN_1h_npc_05"); //O du¿ej sile w ³apie ju¿ nawet nie mówiê. To oczywiste, ¿e ¿eby szybko wymachiwaæ takim ciê¿arem bêdziesz musia³ posiadaæ wiêcej si³y ni¿ potrzeba do podniesienia dobrego dwurêcznego miecza.
		
		B_GiveInvItems(other,self,itminugget,100);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_GorNaToth_TRAIN_1h_NoOre_01_00"); //Nie masz wystarczaj¹cej iloœci rudy!
	};	
	Info_ClearChoices	(DIA_GorNaToth_START_TRAIN);
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,DIALOG_BACK,DIA_GorNaToth_START_TRAINBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 0) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Broñ jednorêczna, poziom 1, 100 bry³ek rudy, 10 PN",GorNaToth_nauka1h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 1) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Broñ jednorêczna, poziom 2, 200 bry³ek rudy, 10 PN",GorNaToth_nauka1h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 2) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Broñ jednorêczna, poziom 3, 300 bry³ek rudy, 10 PN",GorNaToth_nauka1h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 3) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Broñ jednorêczna, poziom 4, 400 bry³ek rudy, 10 PN",GorNaToth_nauka1h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 4) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Broñ jednorêczna, poziom 5, 500 bry³ek rudy, 10 PN",GorNaToth_nauka1h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 5) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Broñ jednorêczna, poziom 6, 600 bry³ek rudy, 10 PN",GorNaToth_nauka1h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 6) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Broñ jednorêczna, poziom 7, 1000 bry³ek rudy, 10 PN",GorNaToth_nauka1h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 7) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Broñ jednorêczna, poziom 8, 1500 bry³ek rudy, 10 PN",GorNaToth_nauka1h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 8) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Broñ jednorêczna, poziom 9, 2000 bry³ek rudy, 10 PN",GorNaToth_nauka1h9);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 9) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Broñ jednorêczna, poziom 10, 2500 bry³ek rudy, 10 PN",GorNaToth_nauka1h10);
	};
};

FUNC VOID GorNaToth_nauka1h2 ()
{
	AI_Output (other,self,"DIA_GorNaToth_TRAIN_2h_15_01"); //Naucz mnie sprawniej pos³ugiwaæ siê jednorêczn¹ broni¹.
	if (Npc_HasItems(other,itminugget) >= 200)
	{
		if (B_GiveSkill(other, NPC_TALENT_1H, 2, 10))
		{
		AI_Output (self,other,"DIA_GorNaToth_TRAIN_1h_npc_06"); //Poka¿ mi jak trzymasz miecz.
		AI_DrawWeapon (other);
		AI_Output (self,other,"DIA_GorNaToth_TRAIN_1h_npc_07"); //Tak jak myœla³em. Zadajesz mniejsze obra¿enia ni¿ faktycznie móg³byœ zadaæ przy obecnej sile i za³o¿onej broni. 
		AI_RemoveWeapon (other);
		AI_Output (self,other,"DIA_GorNaToth_TRAIN_1h_npc_08"); //Nie atakuj, gdy jesteœ zbyt daleko. Jeœli za bardzo siê wychylisz do oddalonego przeciwnika, mo¿esz straciæ równowagê i siê przewróciæ.
		AI_Output (self,other,"DIA_GorNaToth_TRAIN_1h_npc_09"); //Staraj siê atakowaæ z ró¿nych stron, aby zmyliæ przeciwnika. Pamiêtaj, aby blokowaæ uderzenia, jeœli nie bêdziesz w stanie zrobiæ uniku.
		B_GiveInvItems(other,self,itminugget,200);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_GorNaToth_TRAIN_1h_NoOre_01_00"); //Nie masz wystarczaj¹cej iloœci rudy!
	};	
	Info_ClearChoices	(DIA_GorNaToth_START_TRAIN);
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,DIALOG_BACK,DIA_GorNaToth_START_TRAINBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 0) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Broñ jednorêczna, poziom 1, 100 bry³ek rudy, 10 PN",GorNaToth_nauka1h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 1) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Broñ jednorêczna, poziom 2, 200 bry³ek rudy, 10 PN",GorNaToth_nauka1h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 2) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Broñ jednorêczna, poziom 3, 300 bry³ek rudy, 10 PN",GorNaToth_nauka1h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 3) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Broñ jednorêczna, poziom 4, 400 bry³ek rudy, 10 PN",GorNaToth_nauka1h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 4) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Broñ jednorêczna, poziom 5, 500 bry³ek rudy, 10 PN",GorNaToth_nauka1h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 5) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Broñ jednorêczna, poziom 6, 600 bry³ek rudy, 10 PN",GorNaToth_nauka1h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 6) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Broñ jednorêczna, poziom 7, 1000 bry³ek rudy, 10 PN",GorNaToth_nauka1h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 7) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Broñ jednorêczna, poziom 8, 1500 bry³ek rudy, 10 PN",GorNaToth_nauka1h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 8) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Broñ jednorêczna, poziom 9, 2000 bry³ek rudy, 10 PN",GorNaToth_nauka1h9);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 9) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Broñ jednorêczna, poziom 10, 2500 bry³ek rudy, 10 PN",GorNaToth_nauka1h10);
	};
};

FUNC VOID GorNaToth_nauka1h3 ()
{
	AI_Output (other,self,"DIA_GorNaToth_TRAIN_2h_15_01"); //Naucz mnie sprawniej pos³ugiwaæ siê jednorêczn¹ broni¹.
	if (Npc_HasItems(other,itminugget) >= 300)
	{
		if (B_GiveSkill(other, NPC_TALENT_1H, 3, 10))
		{
		AI_Output (self,other,"DIA_GorNaToth_TRAIN_1h_npc_10"); //Pamiêtasz o balansowaniu cia³em? A o odpowiedniej odleg³oœci od przeciwnika? 
		AI_Output (self,other,"DIA_GorNaToth_TRAIN_1h_npc_11"); //Spróbuj wyczuæ ile si³y musisz u¿yæ, aby broñ uderza³a mocno, a przy tym nie polecia³a bez³adnie przed siebie. 
		AI_Output (self,other,"DIA_GorNaToth_TRAIN_1h_npc_12"); //Gdy to opanujesz, bêdziemy mogli pomyœleæ nad ³¹czeniem po sobie uderzeñ. 
		AI_Output (self,other,"DIA_GorNaToth_TRAIN_1h_npc_13"); //Poka¿ mi jeszcze jak wyci¹gasz broñ. Robisz jakieœ postêpy?
		AI_DrawWeapon (other);
		AI_Output (self,other,"DIA_GorNaToth_TRAIN_1h_npc_14"); //Rêce opadaj¹... Nie dwiema, tylko jedn¹! Omówimy to na nastêpnej lekcji.
		AI_RemoveWeapon (other);
		B_GiveInvItems(other,self,itminugget,300);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_GorNaToth_TRAIN_1h_NoOre_01_00"); //Nie masz wystarczaj¹cej iloœci rudy!
	};	
	Info_ClearChoices	(DIA_GorNaToth_START_TRAIN);
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,DIALOG_BACK,DIA_GorNaToth_START_TRAINBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 0) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Broñ jednorêczna, poziom 1, 100 bry³ek rudy, 10 PN",GorNaToth_nauka1h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 1) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Broñ jednorêczna, poziom 2, 200 bry³ek rudy, 10 PN",GorNaToth_nauka1h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 2) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Broñ jednorêczna, poziom 3, 300 bry³ek rudy, 10 PN",GorNaToth_nauka1h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 3) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Broñ jednorêczna, poziom 4, 400 bry³ek rudy, 10 PN",GorNaToth_nauka1h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 4) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Broñ jednorêczna, poziom 5, 500 bry³ek rudy, 10 PN",GorNaToth_nauka1h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 5) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Broñ jednorêczna, poziom 6, 600 bry³ek rudy, 10 PN",GorNaToth_nauka1h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 6) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Broñ jednorêczna, poziom 7, 1000 bry³ek rudy, 10 PN",GorNaToth_nauka1h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 7) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Broñ jednorêczna, poziom 8, 1500 bry³ek rudy, 10 PN",GorNaToth_nauka1h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 8) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Broñ jednorêczna, poziom 9, 2000 bry³ek rudy, 10 PN",GorNaToth_nauka1h9);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 9) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Broñ jednorêczna, poziom 10, 2500 bry³ek rudy, 10 PN",GorNaToth_nauka1h10);
	};
};

FUNC VOID GorNaToth_nauka1h4 ()
{
	AI_Output (other,self,"DIA_GorNaToth_TRAIN_2h_15_01"); //Naucz mnie sprawniej pos³ugiwaæ siê jednorêczn¹ broni¹.
	if (Npc_HasItems(other,itminugget) >= 400)
	{
		if (B_GiveSkill(other, NPC_TALENT_1H, 4, 10))
		{
		AI_Output (self,other,"DIA_GorNaToth_TRAIN_1h_01_02"); //Pocz¹tkuj¹cy czêsto ³api¹ zwyk³y miecz obydwoma rêkami. Radzi³bym ci siê do tego nie przyzwyczajaæ, to fatalny nawyk.
		AI_Output (self,other,"DIA_GorNaToth_TRAIN_1h_01_03"); //Trzymaj broñ jedn¹ rêk¹, ostrzem do góry, i zacznij ni¹ machaæ.
		AI_Output (self,other,"DIA_GorNaToth_TRAIN_1h_01_04"); //Musisz siê nauczyæ, jak zgraæ twoje ruchy z bezw³adnoœci¹ orê¿a. Dziêki temu twoje ataki bêd¹ szybsze i bardziej zaskakuj¹ce.
		AI_Output (self,other,"DIA_GorNaToth_TRAIN_1h_01_05"); //Zapamiêtaj sobie dobrze, co ci powiedzia³em, a twój styl walki stanie siê o wiele bardziej elegancki i skuteczny.
		AI_Output (self,other,"DIA_GorNaToth_TRAIN_1h_01_06"); //A, i jeszcze coœ! Niektóre ciosy powoduj¹ wiêksze obra¿enia ni¿ zwykle. Oczywiœcie, jako pocz¹tkuj¹cy masz raczej niewielkie szanse na zadanie krytycznego uderzenia.
		AI_Output (self,other,"DIA_GorNaToth_TRAIN_1h_01_07"); //Ale to siê zmieni w miarê czynienia przez ciebie postêpów.
		B_GiveInvItems(other,self,itminugget,400);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_GorNaToth_TRAIN_1h_NoOre_01_00"); //Nie masz wystarczaj¹cej iloœci rudy!
	};	
Info_ClearChoices	(DIA_GorNaToth_START_TRAIN);
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,DIALOG_BACK,DIA_GorNaToth_START_TRAINBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 0) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Broñ jednorêczna, poziom 1, 100 bry³ek rudy, 10 PN",GorNaToth_nauka1h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 1) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Broñ jednorêczna, poziom 2, 200 bry³ek rudy, 10 PN",GorNaToth_nauka1h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 2) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Broñ jednorêczna, poziom 3, 300 bry³ek rudy, 10 PN",GorNaToth_nauka1h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 3) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Broñ jednorêczna, poziom 4, 400 bry³ek rudy, 10 PN",GorNaToth_nauka1h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 4) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Broñ jednorêczna, poziom 5, 500 bry³ek rudy, 10 PN",GorNaToth_nauka1h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 5) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Broñ jednorêczna, poziom 6, 600 bry³ek rudy, 10 PN",GorNaToth_nauka1h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 6) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Broñ jednorêczna, poziom 7, 1000 bry³ek rudy, 10 PN",GorNaToth_nauka1h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 7) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Broñ jednorêczna, poziom 8, 1500 bry³ek rudy, 10 PN",GorNaToth_nauka1h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 8) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Broñ jednorêczna, poziom 9, 2000 bry³ek rudy, 10 PN",GorNaToth_nauka1h9);
	};	
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 9) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Broñ jednorêczna, poziom 10, 2500 bry³ek rudy, 10 PN",GorNaToth_nauka1h10);
	};
};

FUNC VOID GorNaToth_nauka1h5 ()
{
	AI_Output (other,self,"DIA_GorNaToth_TRAIN_2h_15_01"); //Naucz mnie sprawniej pos³ugiwaæ siê jednorêczn¹ broni¹.
	if (Npc_HasItems(other,itminugget) >= 500)
	{
		if (B_GiveSkill(other, NPC_TALENT_1H, 5, 10))
		{
		AI_Output (self,other,"DIA_GorNaToth_TRAIN_1h_npc_15"); //¯eby zadaæ wiêksze obra¿enia musisz trafiaæ w newralgiczne punkty twojego przeciwnika. 
		AI_Output (self,other,"DIA_GorNaToth_TRAIN_1h_npc_16"); //Ciê¿ko siê tego nauczyæ. Wszystko zale¿y od postury i pancerza. Najlepiej atakowaæ koñczyny i g³owê.
		AI_Output (self,other,"DIA_GorNaToth_TRAIN_1h_npc_17"); //Naturalnie walka z cz³owiekiem ró¿ni siê od walki ze zwierzêciem.
			B_GiveInvItems(other,self,itminugget,500);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_GorNaToth_TRAIN_1h_NoOre_01_00"); //Nie masz wystarczaj¹cej iloœci rudy!
	};	
Info_ClearChoices	(DIA_GorNaToth_START_TRAIN);
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,DIALOG_BACK,DIA_GorNaToth_START_TRAINBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 0) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Broñ jednorêczna, poziom 1, 100 bry³ek rudy, 10 PN",GorNaToth_nauka1h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 1) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Broñ jednorêczna, poziom 2, 200 bry³ek rudy, 10 PN",GorNaToth_nauka1h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 2) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Broñ jednorêczna, poziom 3, 300 bry³ek rudy, 10 PN",GorNaToth_nauka1h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 3) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Broñ jednorêczna, poziom 4, 400 bry³ek rudy, 10 PN",GorNaToth_nauka1h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 4) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Broñ jednorêczna, poziom 5, 500 bry³ek rudy, 10 PN",GorNaToth_nauka1h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 5) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Broñ jednorêczna, poziom 6, 600 bry³ek rudy, 10 PN",GorNaToth_nauka1h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 6) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Broñ jednorêczna, poziom 7, 1000 bry³ek rudy, 10 PN",GorNaToth_nauka1h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 7) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Broñ jednorêczna, poziom 8, 1500 bry³ek rudy, 10 PN",GorNaToth_nauka1h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 8) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Broñ jednorêczna, poziom 9, 2000 bry³ek rudy, 10 PN",GorNaToth_nauka1h9);
	};	
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 9) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Broñ jednorêczna, poziom 10, 2500 bry³ek rudy, 10 PN",GorNaToth_nauka1h10);
	};
};

FUNC VOID GorNaToth_nauka1h6 ()
{
	AI_Output (other,self,"DIA_GorNaToth_TRAIN_2h_15_01"); //Naucz mnie sprawniej pos³ugiwaæ siê jednorêczn¹ broni¹.
	if (Npc_HasItems(other,itminugget) >= 600)
	{
		if (B_GiveSkill(other, NPC_TALENT_1H, 6, 10))
		{
		AI_Output (self,other,"DIA_GorNaToth_TRAIN_1h_npc_18"); //Pamiêtasz jak na pierwszej lekcji omawialiœmy podzia³ na bronie ciê¿kie i te l¿ejsze?
		AI_Output (self,other,"DIA_GorNaToth_TRAIN_1h_npc_19"); //Myœlê, ¿e jesteœ ju¿ wystarczaj¹co silny, aby walczyæ ciê¿kimi jednorêczniakami. 
		AI_Output (self,other,"DIA_GorNaToth_TRAIN_1h_npc_20"); //O czym musisz pamiêtaæ? O odpowiednim wyczuciu równowagi ostrza, a tak¿e o treningu si³owym, który jest tutaj kluczowy.
		B_GiveInvItems(other,self,itminugget,600);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_GorNaToth_TRAIN_1h_NoOre_01_00"); //Nie masz wystarczaj¹cej iloœci rudy!
	};
Info_ClearChoices	(DIA_GorNaToth_START_TRAIN);
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,DIALOG_BACK,DIA_GorNaToth_START_TRAINBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 0) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Broñ jednorêczna, poziom 1, 100 bry³ek rudy, 10 PN",GorNaToth_nauka1h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 1) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Broñ jednorêczna, poziom 2, 200 bry³ek rudy, 10 PN",GorNaToth_nauka1h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 2) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Broñ jednorêczna, poziom 3, 300 bry³ek rudy, 10 PN",GorNaToth_nauka1h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 3) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Broñ jednorêczna, poziom 4, 400 bry³ek rudy, 10 PN",GorNaToth_nauka1h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 4) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Broñ jednorêczna, poziom 5, 500 bry³ek rudy, 10 PN",GorNaToth_nauka1h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 5) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Broñ jednorêczna, poziom 6, 600 bry³ek rudy, 10 PN",GorNaToth_nauka1h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 6) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Broñ jednorêczna, poziom 7, 1000 bry³ek rudy, 10 PN",GorNaToth_nauka1h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 7) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Broñ jednorêczna, poziom 8, 1500 bry³ek rudy, 10 PN",GorNaToth_nauka1h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 8) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Broñ jednorêczna, poziom 9, 2000 bry³ek rudy, 10 PN",GorNaToth_nauka1h9);
	};	
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 9) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Broñ jednorêczna, poziom 10, 2500 bry³ek rudy, 10 PN",GorNaToth_nauka1h10);
	};
};

FUNC VOID GorNaToth_nauka1h7 ()
{
	AI_Output (other,self,"DIA_GorNaToth_TRAIN_2h_15_01"); //Naucz mnie sprawniej pos³ugiwaæ siê jednorêczn¹ broni¹.
	if (Npc_HasItems(other,itminugget) >= 1000)
	{
		if (B_GiveSkill(other, NPC_TALENT_1H, 7, 10))
		{
		AI_Output (self, other,"DIA_GorNaToth_TRAIN_2h_Info_01_03"); //Musisz wykorzystaæ si³ê bezw³adnoœci, pamiêtasz? Œwietnie. Teraz nauczysz siê lepiej balansowaæ cia³em. Po zadaniu dwóch ciosów wykonaj obrót. To powinno zmyliæ twojego przeciwnika i pozwoliæ ci wyjœæ na dobr¹ pozycjê do nastêpnego ataku.
		AI_Output (self, other,"DIA_GorNaToth_TRAIN_2h_Info_01_04"); //Wtedy wyprowadŸ nastêpne ciêcie z prawej strony...
		AI_Output (self, other,"DIA_GorNaToth_TRAIN_2h_Info_01_05"); //I znowu do przodu. Pamiêtaj - trening czyni mistrza, wiêc najlepiej weŸ siê od razu do roboty!
		B_GiveInvItems(other,self,itminugget,1000);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_GorNaToth_TRAIN_1h_NoOre_01_00"); //Nie masz wystarczaj¹cej iloœci rudy!
	};	
Info_ClearChoices	(DIA_GorNaToth_START_TRAIN);
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,DIALOG_BACK,DIA_GorNaToth_START_TRAINBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 0) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Broñ jednorêczna, poziom 1, 100 bry³ek rudy, 10 PN",GorNaToth_nauka1h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 1) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Broñ jednorêczna, poziom 2, 200 bry³ek rudy, 10 PN",GorNaToth_nauka1h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 2) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Broñ jednorêczna, poziom 3, 300 bry³ek rudy, 10 PN",GorNaToth_nauka1h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 3) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Broñ jednorêczna, poziom 4, 400 bry³ek rudy, 10 PN",GorNaToth_nauka1h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 4) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Broñ jednorêczna, poziom 5, 500 bry³ek rudy, 10 PN",GorNaToth_nauka1h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 5) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Broñ jednorêczna, poziom 6, 600 bry³ek rudy, 10 PN",GorNaToth_nauka1h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 6) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Broñ jednorêczna, poziom 7, 1000 bry³ek rudy, 10 PN",GorNaToth_nauka1h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 7) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Broñ jednorêczna, poziom 8, 1500 bry³ek rudy, 10 PN",GorNaToth_nauka1h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 8) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Broñ jednorêczna, poziom 9, 2000 bry³ek rudy, 10 PN",GorNaToth_nauka1h9);
	};	
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 9) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Broñ jednorêczna, poziom 10, 2500 bry³ek rudy, 10 PN",GorNaToth_nauka1h10);
	};
};

FUNC VOID GorNaToth_nauka1h8 ()
{
	AI_Output (other,self,"DIA_GorNaToth_TRAIN_2h_15_01"); //Naucz mnie sprawniej pos³ugiwaæ siê jednorêczn¹ broni¹.
	if (Npc_HasItems(other,itminugget) >= 1500)
	{
		if (B_GiveSkill(other, NPC_TALENT_1H, 8, 10))
		{
		AI_Output (self,other,"DIA_GorNaToth_TRAIN_1h_npc_21"); //Robisz postêpy. Skup siê na kolejnych ciosach. £¹cz je coraz szybciej i pewniej.
		B_GiveInvItems(other,self,itminugget,1500);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_GorNaToth_TRAIN_1h_NoOre_01_00"); //Nie masz wystarczaj¹cej iloœci rudy!
	};	
Info_ClearChoices	(DIA_GorNaToth_START_TRAIN);
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,DIALOG_BACK,DIA_GorNaToth_START_TRAINBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 0) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Broñ jednorêczna, poziom 1, 100 bry³ek rudy, 10 PN",GorNaToth_nauka1h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 1) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Broñ jednorêczna, poziom 2, 200 bry³ek rudy, 10 PN",GorNaToth_nauka1h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 2) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Broñ jednorêczna, poziom 3, 300 bry³ek rudy, 10 PN",GorNaToth_nauka1h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 3) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Broñ jednorêczna, poziom 4, 400 bry³ek rudy, 10 PN",GorNaToth_nauka1h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 4) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Broñ jednorêczna, poziom 5, 500 bry³ek rudy, 10 PN",GorNaToth_nauka1h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 5) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Broñ jednorêczna, poziom 6, 600 bry³ek rudy, 10 PN",GorNaToth_nauka1h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 6) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Broñ jednorêczna, poziom 7, 1000 bry³ek rudy, 10 PN",GorNaToth_nauka1h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 7) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Broñ jednorêczna, poziom 8, 1500 bry³ek rudy, 10 PN",GorNaToth_nauka1h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 8) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Broñ jednorêczna, poziom 9, 2000 bry³ek rudy, 10 PN",GorNaToth_nauka1h9);
	};	
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 9) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Broñ jednorêczna, poziom 10, 2500 bry³ek rudy, 10 PN",GorNaToth_nauka1h10);
	};
};

FUNC VOID GorNaToth_nauka1h9 ()
{
	AI_Output (other,self,"DIA_GorNaToth_TRAIN_2h_15_01"); //Naucz mnie sprawniej pos³ugiwaæ siê jednorêczn¹ broni¹.
	if (Npc_HasItems(other,itminugget) >= 2000)
	{
		if (B_GiveSkill(other, NPC_TALENT_1H, 9, 10))
		{
		AI_Output (self,other,"DIA_GorNaToth_TRAIN_1h_npc_22"); //Chc¹c najboleœniej zraniæ przeciwnika musisz dobrze wymierzyæ cios. Gdy masz szansê staraj siê trafiaæ w g³owê lub barki.
		AI_Output (self,other,"DIA_GorNaToth_TRAIN_1h_npc_23"); //S³abe punkty to tak¿e ³¹cznia zbroi. Jeœli przeciwnik ma na sobie skórzan¹ zbrojê to po prostu bij w brzuch. 
		AI_Output (self,other,"DIA_GorNaToth_TRAIN_1h_npc_24"); //Skórzane pancerze ³atwo siê rozcina. 
		AI_Output (self,other,"DIA_GorNaToth_TRAIN_1h_npc_25"); //Przypomnij sobie jeszcze raz to wszystko, czego ciê nauczy³em i stosuj siê do tego. 
		B_GiveInvItems(other,self,itminugget,2000);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_GorNaToth_TRAIN_1h_NoOre_01_00"); //Nie masz wystarczaj¹cej iloœci rudy!
	};	
Info_ClearChoices	(DIA_GorNaToth_START_TRAIN);
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,DIALOG_BACK,DIA_GorNaToth_START_TRAINBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 0) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Broñ jednorêczna, poziom 1, 100 bry³ek rudy, 10 PN",GorNaToth_nauka1h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 1) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Broñ jednorêczna, poziom 2, 200 bry³ek rudy, 10 PN",GorNaToth_nauka1h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 2) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Broñ jednorêczna, poziom 3, 300 bry³ek rudy, 10 PN",GorNaToth_nauka1h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 3) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Broñ jednorêczna, poziom 4, 400 bry³ek rudy, 10 PN",GorNaToth_nauka1h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 4) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Broñ jednorêczna, poziom 5, 500 bry³ek rudy, 10 PN",GorNaToth_nauka1h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 5) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Broñ jednorêczna, poziom 6, 600 bry³ek rudy, 10 PN",GorNaToth_nauka1h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 6) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Broñ jednorêczna, poziom 7, 1000 bry³ek rudy, 10 PN",GorNaToth_nauka1h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 7) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Broñ jednorêczna, poziom 8, 1500 bry³ek rudy, 10 PN",GorNaToth_nauka1h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 8) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Broñ jednorêczna, poziom 9, 2000 bry³ek rudy, 10 PN",GorNaToth_nauka1h9);
	};	
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 9) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Broñ jednorêczna, poziom 10, 2500 bry³ek rudy, 10 PN",GorNaToth_nauka1h10);
	};
};

FUNC VOID GorNaToth_nauka1h10 ()
{
	AI_Output (other,self,"DIA_GorNaToth_TRAIN_2h_15_01"); //Naucz mnie sprawniej pos³ugiwaæ siê jednorêczn¹ broni¹.
	if (Npc_HasItems(other,itminugget) >= 2500)
	{
		if (B_GiveSkill(other, NPC_TALENT_1H, 10, 10))
		{
		AI_Output (self,other,"DIA_GorNaToth_TRAIN_1h_npc_26"); //To ju¿ koniec naszego szkolenia. Szacunek dla ciebie, ¿e dobrn¹³eœ do koñca.
		AI_Output (self,other,"DIA_GorNaToth_TRAIN_1h_npc_27"); //Poka¿ê ci kilka ruchów, którymi trafisz we wra¿liwe punkty twojego wroga.
		AI_Output (self,other,"DIA_GorNaToth_TRAIN_1h_npc_28"); //Musisz potrafiæ je dostrzec zanim siê do niego zbli¿ysz.
		B_GiveInvItems(other,self,itminugget,2500);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_GorNaToth_TRAIN_1h_NoOre_01_00"); //Nie masz wystarczaj¹cej iloœci rudy!
	};	
Info_ClearChoices	(DIA_GorNaToth_START_TRAIN);
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,DIALOG_BACK,DIA_GorNaToth_START_TRAINBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 0) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Broñ jednorêczna, poziom 1, 100 bry³ek rudy, 10 PN",GorNaToth_nauka1h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 1) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Broñ jednorêczna, poziom 2, 200 bry³ek rudy, 10 PN",GorNaToth_nauka1h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 2) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Broñ jednorêczna, poziom 3, 300 bry³ek rudy, 10 PN",GorNaToth_nauka1h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 3) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Broñ jednorêczna, poziom 4, 400 bry³ek rudy, 10 PN",GorNaToth_nauka1h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 4) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Broñ jednorêczna, poziom 5, 500 bry³ek rudy, 10 PN",GorNaToth_nauka1h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 5) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Broñ jednorêczna, poziom 6, 600 bry³ek rudy, 10 PN",GorNaToth_nauka1h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 6) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Broñ jednorêczna, poziom 7, 1000 bry³ek rudy, 10 PN",GorNaToth_nauka1h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 7) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Broñ jednorêczna, poziom 8, 1500 bry³ek rudy, 10 PN",GorNaToth_nauka1h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 8) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Broñ jednorêczna, poziom 9, 2000 bry³ek rudy, 10 PN",GorNaToth_nauka1h9);
	};	
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 9) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Broñ jednorêczna, poziom 10, 2500 bry³ek rudy, 10 PN",GorNaToth_nauka1h10);
	};
};
/*------------------------------------------------------------------------
						EINHANDKAMPF	DIE ERSTE LEHRSTUNDE							
------------------------------------------------------------------------*/
/*
instance  TPL_1402_GorNaToth_TRAIN (C_INFO)
{
	npc				= TPL_1402_GorNaToth;
	condition		= TPL_1402_GorNaToth_TRAIN_Condition;
	information		= TPL_1402_GorNaToth_TRAIN_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildLearnString(NAME_Learn1h_1,LPCOST_TALENT_1H_1,0); 
};

FUNC int  TPL_1402_GorNaToth_TRAIN_Condition()
{	
	
	if (Npc_GetTalentSkill (hero,NPC_TALENT_1H) < 1)
	&& (C_NpcBelongsToPsiCamp(hero))  
	{
		return TRUE;
	};

};
FUNC void  TPL_1402_GorNaToth_TRAIN_Info()
{
	if	(log_gornatothfight == FALSE) 
	{
		Log_CreateTopic   	(GE_TeacherPSI,LOG_NOTE);
		B_LogEntry			(GE_TeacherPSI,"Gor Na Toth mo¿e mnie nauczyæ walki jednorêcznym orê¿em.");
		log_gornatothfight = TRUE;
	};
	AI_Output (other, self,"TPL_1402_GorNaToth_TRAIN_Info_15_00"); //Chcia³bym nauczyæ siê walki jednorêcznym orê¿em.
	 if (hero.attribute[ATR_STRENGTH] >= 30)
	 {
	if B_GiveSkill(hero,NPC_TALENT_1H,1,LPCOST_TALENT_1H_1)
	{
		AI_Output			(self,other,"TPL_1402_GorNaToth_TRAIN_11_01"); //M¹dra decyzja. Jednak zanim poznasz bardziej zaawansowane techniki, powinieneœ nauczyæ siê prawid³owo trzymaæ orê¿ w rêku.
		AI_Output			(self,other,"TPL_1402_GorNaToth_TRAIN_11_02"); //Pocz¹tkuj¹cy czêsto ³api¹ zwyk³y miecz obydwoma rêkami. Radzi³bym ci siê do tego nie przyzwyczajaæ, to fatalny nawyk.
		AI_Output			(self,other,"TPL_1402_GorNaToth_TRAIN_11_03"); //Trzymaj broñ jedn¹ rêk¹, ostrzem do góry, i zacznij ni¹ machaæ.
		AI_Output			(self,other,"TPL_1402_GorNaToth_TRAIN_11_04"); //Musisz siê nauczyæ, jak zgraæ twoje ruchy z bezw³adnoœci¹ orê¿a. Dziêki temu twoje ataki bêd¹ szybsze i bardziej zaskakuj¹ce.
		AI_Output			(self,other,"TPL_1402_GorNaToth_TRAIN_11_05"); //Zapamiêtaj sobie dobrze co ci powiedzia³em, a twój styl walki stanie siê o wiele bardziej elegancki i skuteczny.
		AI_Output			(self,other,"TPL_1402_GorNaToth_TRAIN_11_06"); //A, i jeszcze coœ! Niektóre ciosy powoduj¹ wiêksze obra¿enia ni¿ zwykle. Oczywiœcie, jako pocz¹tkuj¹cy masz raczej niewielkie szanse na zadanie krytycznego uderzenia.
		AI_Output			(self,other,"TPL_1402_GorNaToth_TRAIN_11_07"); //Ale to siê zmieni w miarê czynienia przez ciebie postêpów.
		TPL_1402_GorNaToth_TRAIN.permanent = 0;

		AI_StopProcessInfos	(self);
		B_PracticeCombat	("PSI_PATH_6_7");
	};
	}
	else
	{
	AI_Output			(self,other,"TPL_1402_GorNaToth_NO_ENOUGHT_STR_1"); //P³ynna walka jednorêcznym orê¿em wymaga sporo si³y. Nie jesteœ jeszcze na to gotowy!
	PrintScreen	("Warunek: Si³a 30", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
}; 
*/ 
/*------------------------------------------------------------------------
						EINHANDKAMPF	DIE ZWEITE LEHRSTUNDE							
------------------------------------------------------------------------*/
/*
instance  TPL_1402_GorNaToth_TRAINAGAIN (C_INFO)
{
	npc				= TPL_1402_GorNaToth;
	condition		= TPL_1402_GorNaToth_TRAINAGAIN_Condition;
	information		= TPL_1402_GorNaToth_TRAINAGAIN_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildLearnString(NAME_Learn1h_2,			LPCOST_TALENT_1H_2,0); 
};

FUNC int  TPL_1402_GorNaToth_TRAINAGAIN_Condition()
{	
	if (Npc_GetTalentSkill (hero,NPC_TALENT_1H) == 1)
	&& (C_NpcBelongsToPsiCamp(hero))  
	{
		return TRUE;
	};

};
FUNC void  TPL_1402_GorNaToth_TRAINAGAIN_Info()
{
	AI_Output (other, self,"TPL_1402_GorNaToth_TRAINAGAIN_Info_15_01"); //Naucz mnie, jak sprawniej pos³ugiwaæ siê jednorêczn¹ broni¹.
	if (hero.attribute[ATR_STRENGTH] >= 60)
	{
	if B_GiveSkill(hero,NPC_TALENT_1H,2,LPCOST_TALENT_1H_2)
	{
		AI_Output (self, other,"TPL_1402_GorNaToth_TRAINAGAIN_Info_11_02"); //Dobrze, podstawy ju¿ znasz. Nieznaczne opuszczenie broni zwiêkszy si³ê twojego pierwszego ciosu.
		AI_Output (self, other,"TPL_1402_GorNaToth_TRAINAGAIN_Info_11_03"); //Musisz wykorzystaæ si³ê bezw³adnoœci, pamiêtasz? Œwietnie. Teraz nauczysz siê lepiej balansowaæ cia³em. Po zadaniu dwóch ciosów wykonaj obrót. To powinno zmyliæ twojego przeciwnika i pozwoliæ ci wyjœæ na dobr¹ pozycjê do nastêpnego ataku.
		AI_Output (self, other,"TPL_1402_GorNaToth_TRAINAGAIN_Info_11_04"); //Wtedy wyprowadŸ nastêpne ciêcie z prawej strony...
		AI_Output (self, other,"TPL_1402_GorNaToth_TRAINAGAIN_Info_11_05"); //I znowu do przodu. Pamiêtaj - trening czyni mistrza, wiêc najlepiej weŸ siê od razu do roboty!
		TPL_1402_GorNaToth_TRAINAGAIN.permanent = 0;

		AI_StopProcessInfos	(self);
		B_PracticeCombat	("PSI_PATH_6_7");
	};
	}
	else
	{
	AI_Output			(self,other,"TPL_1402_GorNaToth_NO_ENOUGHT_STR_1"); //P³ynna walka jednorêcznym orê¿em wymaga sporo si³y. Nie jesteœ jeszcze na to gotowy!
	PrintScreen	("Warunek: Si³a 60", -1,-1,"FONT_OLD_20_WHITE.TGA",2);	
	};
}; 
*/
//*****************************************************
// ARENA W BRACTWIE !! POCZ¥TEK
//*****************************************************
/*
//========================================
//-----------------> Walki
//========================================

INSTANCE DIA_GorNaToth_Walki (C_INFO)
{
   npc          = TPL_1402_GorNaToth;
   nr           = 1;
   condition    = DIA_GorNaToth_Walki_Condition;
   information  = DIA_GorNaToth_Walki_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_GorNaToth_Walki_Condition()
{
if (Kapitel >= 10)
{
    return TRUE;
};
};
FUNC VOID DIA_GorNaToth_Walki_Info()
{//fixed g1210
    AI_Output (self, other ,"DIA_GorNaToth_Walki_03_01"); //Uwa¿aj, gdzie idziesz, nieznajomy!
    AI_Output (self, other ,"DIA_GorNaToth_Walki_03_02"); //Na tym placu trenuj¹ najlepsi Stra¿nicy Œwi¹tynni w Obozie.
    AI_Output (self, other ,"DIA_GorNaToth_Walki_03_03"); //Ju¿ wkrótce odbêd¹ tu siê walki. 
	AI_Output (other, self ,"DIA_GorNaToth_Walki_15_04"); //Jakie walki? 
	AI_Output (self, other ,"DIA_GorNaToth_Walki_03_05"); //Chcemy nieco uspokoiæ atmosferê w Obozie. Walki z pewnoœci¹ odci¹gn¹ uwagê od ostatnich wydarzeñ. 
	AI_Output (other, self ,"DIA_GorNaToth_Walki_15_06"); //No tak. W koñcu ca³y wasz œwiatopogl¹d leg³ w gruzach. 
	AI_Output (self, other ,"DIA_GorNaToth_Walki_03_07"); //Nie wyci¹gaj takich pochopnych wniosków. Jeszcze nic nie jest przes¹dzone.
};

//========================================
//-----------------> FightAsk
//========================================

INSTANCE DIA_GorNaToth_FightAsk (C_INFO)
{
   npc          = TPL_1402_GorNaToth;
   nr           = 2;
   condition    = DIA_GorNaToth_FightAsk_Condition;
   information  = DIA_GorNaToth_FightAsk_Info;
   permanent	= FALSE;
   description	= "Chcê walczyæ na arenie. (200 bry³ek rudy)";
};

FUNC INT DIA_GorNaToth_FightAsk_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_GorNaToth_Walki))
    {
    return TRUE;
    };
};


FUNC VOID DIA_GorNaToth_FightAsk_Info()
{
    AI_Output (other, self ,"DIA_GorNaToth_FightAsk_15_01"); //Chcê walczyæ na arenie.
    AI_Output (self, other ,"DIA_GorNaToth_FightAsk_03_02"); //Zd¹¿y³eœ w ostatniej chwili. W³aœnie mia³em zamykaæ listê gladiatorów.
    AI_Output (self, other ,"DIA_GorNaToth_FightAsk_03_02"); //Wpisowe kosztuje 200 bry³ek rudy. 
    AI_Output (self, other ,"DIA_GorNaToth_FightAsk_03_04"); //Zwyciêzca otrzymuje tytu³ najlepszego gladiatora i 1000 bry³ek rudy.
    AI_Output (self, other ,"DIA_GorNaToth_FightAsk_03_05"); //Je¿eli przegrasz jedn¹ walkê, nie bêdziesz móg³ wyzwaæ kolejnego przeciwnika.
	AI_Output (self, other ,"DIA_GorNaToth_FightAsk_03_06"); //Jeœli uda ci siê pokonaæ przeciwnika, poczekaj a¿ wstanie. Walczymy honorowo. Nie jak rabusie. 
    MIS_WalkiBractwo = LOG_RUNNING;

    Log_CreateTopic            (CH1_WalkiBractwo, LOG_MISSION);
    Log_SetTopicStatus       (CH1_WalkiBractwo, LOG_RUNNING);
    B_LogEntry                     (CH1_WalkiBractwo,"Zasady s¹ proste: zwyciêzca zostaje mistrzem areny i otrzymuje 1000 bry³ek rudy; je¿eli przegram, nie odzyskam rudy i nie bêdê móg³ walczyæ z kolejnym przeciwnikiem.");
};

//========================================
//-----------------> FirstFight
//========================================

INSTANCE DIA_GorNaToth_FirstFight (C_INFO)
{
   npc          = TPL_1402_GorNaToth;
   nr           = 1;
   condition    = DIA_GorNaToth_FirstFight_Condition;
   information  = DIA_GorNaToth_FirstFight_Info;
   permanent	= FALSE;
   description	= "Zaczynamy?";
};

FUNC INT DIA_GorNaToth_FirstFight_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_GorNaToth_FightAsk))
    //&& (Npc_HasItems (hero, ItMiNugget)>=100)
    {
    return TRUE;
    };
};


FUNC VOID DIA_GorNaToth_FirstFight_Info()
{
    AI_Output (other, self ,"DIA_GorNaToth_FirstFight_15_01"); //Zaczynamy?
    AI_Output (self, other ,"DIA_GorNaToth_FirstFight_03_02"); //Wszystko gotowe. 
	AI_Output (self, other ,"DIA_GorNaToth_FirstFight_03_03"); //Przygotuj siê i b¹dŸ tutaj wczesnym wieczorem.
    Npc_ExchangeRoutine (TPL_1414_Templer, "watch");
    Npc_ExchangeRoutine (TPL_1411_Templer, "watch");
    Npc_ExchangeRoutine (TPL_1412_Templer, "watch");
	Npc_ExchangeRoutine (TPL_1419_Templer, "watch");
};

//========================================
//-----------------> START_EVENT
//========================================

INSTANCE DIA_GorNaToth_START_EVENT (C_INFO)
{
   npc          = TPL_1402_GorNaToth;
   nr           = 1;
   condition    = DIA_GorNaToth_START_EVENT_Condition;
   information  = DIA_GorNaToth_START_EVENT_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_GorNaToth_START_EVENT_Condition()
{
    if (Wld_IsTime     (19,00,20,30))
    {
    return TRUE;
    };
};


FUNC VOID DIA_GorNaToth_START_EVENT_Info()
{
    AI_Output (self, other ,"DIA_GorNaToth_START_EVENT_03_01"); //S£UCHAJCIE, S£UCHAJCIE! PRZYBYLI JU¯ WSZYSCY WJOWNICY!
    AI_Output (self, other ,"DIA_GorNaToth_START_EVENT_03_02"); //MO¯EMY ZACZYNAÆ NASZ TURNIEJ! 
    AI_Output (self, other ,"DIA_GorNaToth_START_EVENT_03_03"); //PIERWSZA WALKA: BEZIMENNY WOJOWNIK KONTRA GOR KERESH!
    AI_Output (self, other ,"DIA_GorNaToth_START_EVENT_03_04"); //NIECH WYGRA NAJLEPSZY!
    AI_Output (self, other ,"DIA_GorNaToth_START_EVENT_03_05"); //No?! Co siê tak patrzysz? 
    AI_Output (self, other ,"DIA_GorNaToth_START_EVENT_03_06"); //Ruszaj do walki.
    AI_StopProcessInfos	(self);
	AI_GotoWP (TPL_1419_Templer, "PSI_PATH_6_7");
};



//========================================
//-----------------> WinFirstFight
//========================================

INSTANCE DIA_GorNaToth_WinFirstFight (C_INFO)
{
   npc          = TPL_1402_GorNaToth;
   nr           = 1;
   condition    = DIA_GorNaToth_WinFirstFight_Condition;
   information  = DIA_GorNaToth_WinFirstFight_Info;
   permanent	= FALSE;
   description	= "Wygra³em pierwsz¹ walkê!";
};

FUNC INT DIA_GorNaToth_WinFirstFight_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Templer_Win))
    {
    return TRUE;
    };
};


FUNC VOID DIA_GorNaToth_WinFirstFight_Info()
{
    AI_Output (other, self ,"DIA_GorNaToth_WinFirstFight_15_01"); //Wygra³em pierwsz¹ walkê!
    AI_Output (self, other ,"DIA_GorNaToth_WinFirstFight_03_02"); //Muszê przyznaæ, ¿e nieŸle.
	AI_Output (self, other ,"DIA_GorNaToth_WinFirstFight_03_03"); //PIERWSZ¥ WALKÊ WYGRYWA BEZIMIENNY WOJOWNIK. GOR KERESH ZOSTA£ POKONANY!
    B_GiveInvItems (self, other, ItMiNugget, 200);
    B_LogEntry                     (CH1_WalkiBractwo,"Wygra³em pierwsz¹ walkê! Pora na kolejn¹.");

    B_GiveXP (100);
};

//========================================
//-----------------> FirstFalse
//========================================

INSTANCE DIA_GorNaToth_FirstFalse (C_INFO)
{
   npc          = TPL_1402_GorNaToth;
   nr           = 2;
   condition    = DIA_GorNaToth_FirstFalse_Condition;
   information  = DIA_GorNaToth_FirstFalse_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_GorNaToth_FirstFalse_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Templer_Fail))
    {
    return TRUE;
    };
};


FUNC VOID DIA_GorNaToth_FirstFalse_Info()
{
    AI_Output (self, other ,"DIA_GorNaToth_FirstFalse_03_01"); //Przegra³eœ! Mo¿esz odejœæ! Nie masz tu czego szukaæ.
    AI_StopProcessInfos	(self);
    B_LogEntry                     (CH1_WalkiBractwo,"Przegra³em pierwsz¹ walkê! Mogê odejœæ.");
    Log_SetTopicStatus       (CH1_WalkiBractwo, LOG_FAILED);
    MIS_WalkiBractwo = LOG_FAILED;
};

//========================================
//-----------------> SecondFight
//========================================

INSTANCE DIA_GorNaToth_SecondFight (C_INFO)
{
   npc          = TPL_1402_GorNaToth;
   nr           = 3;
   condition    = DIA_GorNaToth_SecondFight_Condition;
   information  = DIA_GorNaToth_SecondFight_Info;
   permanent	= FALSE;
   description	= "Chcê zmierzyæ siê z drugim wojownikiem! (200 bry³ek rudy)";
};

FUNC INT DIA_GorNaToth_SecondFight_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_GorNaToth_WinFirstFight)) && (Npc_HasItems (hero, ItMiNugget)>=200)
    {
    return TRUE;
    };
};


FUNC VOID DIA_GorNaToth_SecondFight_Info()
{
    AI_Output (other, self ,"DIA_GorNaToth_SecondFight_15_01"); //Chcê zmierzyæ siê z drugim wojownikiem!
    AI_Output (self, other ,"DIA_GorNaToth_SecondFight_03_02"); //Dobrze. Tym razem nie bêdzie tak ³atwo.
	AI_RemoveWeapon (TPL_1414_Templer);
	AI_RemoveWeapon (TPL_1411_Templer);
    AI_RemoveWeapon (TPL_1412_Templer);
    AI_RemoveWeapon (TPL_1419_Templer);
	B_FullStop			(TPL_1414_Templer);
	B_FullStop			(TPL_1411_Templer);
	B_FullStop			(TPL_1412_Templer);
	B_FullStop			(TPL_1419_Templer);	
	B_ExchangeRoutine (TPL_1419_Templer, "watch");
    B_ExchangeRoutine (TPL_1411_Templer, "watch");
    B_ExchangeRoutine (TPL_1412_Templer, "watch");
    AI_GotoWP (TPL_1414_Templer, "PSI_PATH_6_7");
    B_GiveInvItems (other, self, ItMiNugget, 200);
};

//========================================
//-----------------> WinSecondFight
//========================================

INSTANCE DIA_GorNaToth_WinSecondFight (C_INFO)
{
   npc          = TPL_1402_GorNaToth;
   nr           = 1;
   condition    = DIA_GorNaToth_WinSecondFight_Condition;
   information  = DIA_GorNaToth_WinSecondFight_Info;
   permanent	= FALSE;
   description	= "Wygra³em drug¹ walkê!";
};

FUNC INT DIA_GorNaToth_WinSecondFight_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Templer_2Win))
    {
    return TRUE;
    };
};


FUNC VOID DIA_GorNaToth_WinSecondFight_Info()
{
    AI_Output (other, self ,"DIA_GorNaToth_WinSecondFight_15_01"); //Wygra³em drug¹ walkê!
    AI_Output (self, other ,"DIA_GorNaToth_WinSecondFight_03_02"); //Zaskoczy³eœ mnie. 
    CreateInvItems (self, ItMiNugget, 400);
    B_GiveInvItems (self, other, ItMiNugget, 400);

    B_LogEntry                     (CH1_WalkiBractwo,"Wygra³em drug¹ walkê! Dobrze mi idzie.");

    B_GiveXP (200);
};

//========================================
//-----------------> SecondFail
//========================================

INSTANCE DIA_GorNaToth_SecondFail (C_INFO)
{
   npc          = TPL_1402_GorNaToth;
   nr           = 3;
   condition    = DIA_GorNaToth_SecondFail_Condition;
   information  = DIA_GorNaToth_SecondFail_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_GorNaToth_SecondFail_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Templer_2Fail))
    {
    return TRUE;
    };
};


FUNC VOID DIA_GorNaToth_SecondFail_Info()
{
    AI_Output (self, other ,"DIA_GorNaToth_SecondFail_03_01"); //Przegra³eœ! Nie mo¿esz dalej walczyæ.
    B_LogEntry                     (CH1_WalkiBractwo,"Przegra³em drug¹ walkê. Muszê odejœæ.");
    Log_SetTopicStatus       (CH1_WalkiBractwo, LOG_FAILED);
    MIS_WalkiBractwo = LOG_FAILED;
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> ThirdFight
//========================================

INSTANCE DIA_GorNaToth_ThirdFight (C_INFO)
{
   npc          = TPL_1402_GorNaToth;
   nr           = 2;
   condition    = DIA_GorNaToth_ThirdFight_Condition;
   information  = DIA_GorNaToth_ThirdFight_Info;
   permanent	= FALSE;
   description	= "Chcia³bym stoczyæ walkê z trzecim wojownikiem! (300 bry³ek rudy)";
};

FUNC INT DIA_GorNaToth_ThirdFight_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_GorNaToth_WinSecondFight))
    && (Npc_HasItems (hero, ItMiNugget)>=300)
    {
    return TRUE;
    };
};


FUNC VOID DIA_GorNaToth_ThirdFight_Info()
{
    AI_Output (other, self ,"DIA_GorNaToth_ThirdFight_15_01"); //Chcia³bym stoczyæ walkê z trzecim wojownikiem!
    AI_Output (self, other ,"DIA_GorNaToth_ThirdFight_03_02"); //Widzê, ¿e jesteœ g³odny zwyciêstw!
    if (hero.guild == GIL_TPL) || (hero.guild == GIL_NOV) || (hero.guild == GIL_GUR)
    {
        AI_Output (self, other ,"DIA_GorNaToth_ThirdFight_03_03"); //Dobrze, ¿e walczysz ku chwale Œni¹cego!
    }
    else
    {
        AI_Output (self, other ,"DIA_GorNaToth_ThirdFight_03_04"); //Szkoda, ¿e nie nale¿ysz do Bractwa.
    };
    B_GiveInvItems (other, self, ItMiNugget, 300);
	AI_RemoveWeapon (TPL_1414_Templer);
	AI_RemoveWeapon (TPL_1411_Templer);
    AI_RemoveWeapon (TPL_1412_Templer);
    AI_RemoveWeapon (TPL_1419_Templer);
	B_FullStop			(TPL_1414_Templer);
	B_FullStop			(TPL_1411_Templer);
	B_FullStop			(TPL_1412_Templer);
	B_FullStop			(TPL_1419_Templer);	
	Npc_ExchangeRoutine (TPL_1419_Templer, "watch");
    Npc_ExchangeRoutine (TPL_1414_Templer, "watch");
    Npc_ExchangeRoutine (TPL_1412_Templer, "watch");
    AI_GotoWP (TPL_1411_Templer, "PSI_PATH_6_7");
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> ThirdFightWin
//========================================

INSTANCE DIA_GorNaToth_ThirdFightWin (C_INFO)
{
   npc          = TPL_1402_GorNaToth;
   nr           = 1;
   condition    = DIA_GorNaToth_ThirdFightWin_Condition;
   information  = DIA_GorNaToth_ThirdFightWin_Info;
   permanent	= FALSE;
   description	= "Wygra³em trzeci¹ walkê!";
};

FUNC INT DIA_GorNaToth_ThirdFightWin_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Templer_3Win))
    {
    return TRUE;
    };
};


FUNC VOID DIA_GorNaToth_ThirdFightWin_Info()
{
    AI_Output (other, self ,"DIA_GorNaToth_ThirdFightWin_15_01"); //Wygra³em trzeci¹ walkê!
    AI_Output (self, other ,"DIA_GorNaToth_ThirdFightWin_03_02"); //Albo jesteœ œwietnym wojownikiem, albo masz cholerne szczêœcie.
    AI_Output (other, self ,"DIA_GorNaToth_ThirdFightWin_15_03"); //Tak czy inaczej ruda mi siê nale¿y.
    CreateInvItems (self, ItMiNugget, 600);
    B_GiveInvItems (self, other, ItMiNugget, 600);
    B_LogEntry                     (CH1_WalkiBractwo,"Wygra³em trzeci¹ walkê! Ciekawe kiedy zrobi siê trudno...");

    B_GiveXP (300);
};
//========================================
//-----------------> ThirdFightFail
//========================================

INSTANCE DIA_GorNaToth_ThirdFightFail (C_INFO)
{
   npc          = TPL_1402_GorNaToth;
   nr           = 3;
   condition    = DIA_GorNaToth_ThirdFightFail_Condition;
   information  = DIA_GorNaToth_ThirdFightFail_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_GorNaToth_ThirdFightFail_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Templer_3Fail))
    {
    return TRUE;
    };
};


FUNC VOID DIA_GorNaToth_ThirdFightFail_Info()
{
    AI_Output (self, other ,"DIA_GorNaToth_ThirdFightFail_03_01"); //Przegra³eœ walkê. Mo¿esz odejœæ. I tak uda³o ci siê zajœæ daleko.
    B_LogEntry                     (CH1_WalkiBractwo,"Przegra³em trzeci¹ walkê. Nie mogê ju¿ walczyæ na arenie. ");
    Log_SetTopicStatus       (CH1_WalkiBractwo, LOG_FAILED);
    MIS_WalkiBractwo = LOG_FAILED;
    AI_StopProcessInfos	(self);
};
//========================================
//-----------------> LastFight
//========================================

INSTANCE DIA_GorNaToth_LastFight (C_INFO)
{
   npc          = TPL_1402_GorNaToth;
   nr           = 2;
   condition    = DIA_GorNaToth_LastFight_Condition;
   information  = DIA_GorNaToth_LastFight_Info;
   permanent	= FALSE;
   description	= "Chcê walczyæ z mistrzem areny! (400 bry³ek rudy)";
};

FUNC INT DIA_GorNaToth_LastFight_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_GorNaToth_ThirdFightWin))
    && (Npc_HasItems (hero, ItMiNugget)>=400)
    {
    return TRUE;
    };
};


FUNC VOID DIA_GorNaToth_LastFight_Info()
{
    AI_Output (other, self ,"DIA_GorNaToth_LastFight_15_01"); //Chcê walczyæ z mistrzem areny!
    AI_Output (self, other ,"DIA_GorNaToth_LastFight_03_02"); //Ta walka bêdzie ciê kosztowaæ 500 bry³ek rudy, ale jeœli wygrasz, nie otrzymasz tysi¹c bry³ek, a tysi¹c piêæset bry³ek rudy.
    AI_Output (other, self ,"DIA_GorNaToth_LastFight_15_03"); //Proponujesz bardzo wysok¹ nagrodê...
    AI_Output (self, other ,"DIA_GorNaToth_LastFight_03_04"); //Bo wiem, ¿e przegrasz.
	B_GiveInvItems (other, self, ItMiNugget, 400);
	AI_RemoveWeapon (TPL_1414_Templer);
	AI_RemoveWeapon (TPL_1411_Templer);
    AI_RemoveWeapon (TPL_1412_Templer);
    AI_RemoveWeapon (TPL_1419_Templer);
	Npc_ExchangeRoutine (TPL_1419_Templer, "watch");
    Npc_ExchangeRoutine (TPL_1414_Templer, "watch");
    Npc_ExchangeRoutine (TPL_1411_Templer, "watch");
    AI_GotoWP (TPL_1412_Templer, "PSI_PATH_6_7");
    AI_StopProcessInfos	(self);
};


//========================================
//-----------------> LastFightWin
//========================================

INSTANCE DIA_GorNaToth_LastFightWin (C_INFO)
{
   npc          = TPL_1402_GorNaToth;
   nr           = 1;
   condition    = DIA_GorNaToth_LastFightWin_Condition;
   information  = DIA_GorNaToth_LastFightWin_Info;
   permanent	= FALSE;
   description	= "Wygra³em ostatni¹ walkê! Jestem mistrzem areny.";
};

FUNC INT DIA_GorNaToth_LastFightWin_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Templer_4LastFightWin))
    {
    return TRUE;
    };
};


FUNC VOID DIA_GorNaToth_LastFightWin_Info()
{
    AI_Output (other, self ,"DIA_GorNaToth_LastFightWin_15_01"); //Wygra³em ostatni¹ walkê! Jestem mistrzem areny.
    AI_Output (self, other ,"DIA_GorNaToth_LastFightWin_03_02"); //To niemo¿liwe! Pokona³eœ najlepszego wojownika w ca³ej Górniczej Dolinie.
    AI_Output (other, self ,"DIA_GorNaToth_LastFightWin_15_03"); //Jestem pewien, ¿e s¹ w okolicy lepsi. 
    AI_Output (other, self ,"DIA_GorNaToth_LastFightWin_15_04"); //Za bardzo uwierzy³eœ w swojego wojownika. A teraz dawaj obiecan¹ nagrodê!
    AI_Output (self, other ,"DIA_GorNaToth_LastFightWin_03_05"); //WeŸ je i odejdŸ!
    CreateInvItems (self, ItMiNugget, 1500);
    B_GiveInvItems (self, other, ItMiNugget, 1500);
    B_LogEntry                     (CH1_WalkiBractwo,"Wygra³em ostatni¹ walkê. Jestem mistrzem areny w Bractwie.");
    Log_SetTopicStatus       (CH1_WalkiBractwo, LOG_SUCCESS);
    MIS_WalkiBractwo = LOG_SUCCESS;
	Npc_ExchangeRoutine (TPL_1419_Templer, "start");
    Npc_ExchangeRoutine (TPL_1414_Templer, "start");
    Npc_ExchangeRoutine (TPL_1411_Templer, "start");
    Npc_ExchangeRoutine (TPL_1412_Templer, "start");
    B_GiveXP (500);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> LastFightFali
//========================================

INSTANCE DIA_GorNaToth_LastFightFali (C_INFO)
{
   npc          = TPL_1402_GorNaToth;
   nr           = 2;
   condition    = DIA_GorNaToth_LastFightFali_Condition;
   information  = DIA_GorNaToth_LastFightFali_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_GorNaToth_LastFightFali_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Templer_4LastFightFail))
    {
    return TRUE;
    };
};


FUNC VOID DIA_GorNaToth_LastFightFali_Info()
{
    AI_Output (self, other ,"DIA_GorNaToth_LastFightFali_03_01"); //Tego siê spodziewa³em. Przegra³eœ, ale zaszed³eœ bardzo daleko.
    AI_Output (self, other ,"DIA_GorNaToth_LastFightFali_03_02"); //Dobra robota. Zas³ugujesz na szacunek tutejszych wojowników.
    AI_Output (self, other ,"DIA_GorNaToth_LastFightFali_03_03"); //Wiesz co... Oddam ci wp³acon¹ rudê. Zas³u¿y³eœ, mimo przegranej.
    CreateInvItems (self, ItMiNugget, 500);
    B_GiveInvItems (self, other, ItMiNugget, 500);
    B_LogEntry                     (CH1_WalkiBractwo,"Przegra³em ostatni¹ walkê. Gor Na Toth by³ wyraŸnie zadowolony. Przynajmniej uda³o mi siê odzyskaæ 500 bry³ek rudy.");
    Log_SetTopicStatus       (CH1_WalkiBractwo, LOG_FAILED);
    MIS_WalkiBractwo = LOG_FAILED;

    B_GiveXP (200);
    AI_StopProcessInfos	(self);
};
//*****************************************************
// ARENA W BRACTWIE !! KONIEC
//*****************************************************
*/