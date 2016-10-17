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
	description = "Przychodz� w sprawie d�ug�w, kt�re zaci�gn�� jeden z twoich Stra�nik�w. ";
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
	AI_Output			(other, self,"DIA_GorNaToth_IdonDebt_15_00"); //Przychodz� w sprawie d�ug�w, kt�re zaci�gn�� jeden z twoich Stra�nik�w.
	AI_Output			(self, other,"DIA_GorNaToth_IdonDebt_11_01"); //Zwierzchnikiem Stra�nik�w �wi�tynnych jest Cor Angar. A o co chodzi i czemu mieliby�my ci pom�c? 
	AI_Output			(other, self,"DIA_GorNaToth_IdonDebt_15_02"); //Gor Na Idon ma d�ug za gorza�k� u handlarza Starkada. Dok�adnie 150 bry�ek rudy. Nie chce mi ich zwr�ci�.
	AI_Output			(self, other,"DIA_GorNaToth_IdonDebt_11_03"); //Widz�, �e by�a tu niez�a popijawa podczas mojej nieobecno�ci. We� t� rud�. Stra�nik�w spotka zas�u�ona kara podczas trening�w. 
	CreateInvItems (self,itminugget, 150);
	B_GiveinvItems (self,other,itminugget,150);
	B_LogEntry (CH1_CheatedMerchant,"Gor Na Toth zwr�ci� mi rud� i obieca�, �e ukarze Gor Na Idona. ");
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
	description = "Mo�esz mnie czego� nauczy�?";
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
	AI_Output			(other, self,"DIA_GorNaToth_AngarTalked_15_00"); //Mo�esz mnie czego� nauczy�?
	AI_Output			(self, other,"DIA_GorNaToth_AngarTalked_11_01"); //Zejd� mi z oczu, niegodny robaku! Ucz� wy��cznie Stra�nik�w �wi�tyni �ni�cego.
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
	AI_Output (self, other,"DIA_GorNaToth_AngarTalked_11_00"); //Rozmawia�e� z Cor Angarem? I co powiedzia�?
	Info_ClearChoices		(DIA_GorNaToth_AngarTalked);
	Info_AddChoice			(DIA_GorNaToth_AngarTalked,	"Powiedzia�, �e jeste� niegodny, by nosi� zbroj� �wi�tynnego Stra�nika.",DIA_GorNaToth_AngarTalked_Unworthy);	
	Info_AddChoice			(DIA_GorNaToth_AngarTalked,	"Powiedzia�, �e nigdy nie lubi� b�otnych w�y.",DIA_GorNaToth_AngarTalked_Shark);	
	Info_AddChoice			(DIA_GorNaToth_AngarTalked,	"Kaza� mi zg�osi� si� do niego, gdy ju� zostan� �wi�tynnym Stra�nikiem.",DIA_GorNaToth_AngarTalked_Normal);	
};

func void DIA_GorNaToth_AngarTalked_Normal()
{
	AI_Output (other, self,"DIA_GorNaToth_AngarTalked_Normal_15_00"); //Kaza� mi zg�osi� si� do niego, gdy ju� zostan� �wi�tynnym Stra�nikiem.
	AI_Output (self, other,"DIA_GorNaToth_AngarTalked_Normal_11_01"); //Najwyra�niej ma o tobie wysokie mniemanie. Inaczej nie odezwa�by si� do ciebie.
	AI_Output (self, other,"DIA_GorNaToth_AngarTalked_Normal_11_02"); //To wielki zaszczyt zosta� przez niego cho�by zauwa�onym. Do mnie odezwa� si� po raz ostatni ca�e dwa miesi�ce temu!
	Info_ClearChoices		(DIA_GorNaToth_AngarTalked);
};

func void DIA_GorNaToth_AngarTalked_Shark()
{
	AI_Output (other, self,"DIA_GorNaToth_AngarTalked_Shark_15_00"); //Powiedzia�, �e nigdy nie lubi� b�otnych w�y.
	AI_Output (self, other,"DIA_GorNaToth_AngarTalked_Shark_11_01"); //Co...? (zdecydowanie) Czeka mnie �wi�ta misja!
	AI_Output (self, other,"DIA_GorNaToth_AngarTalked_Shark_11_02"); //�yczenie mojego mistrza jest dla mnie rozkazem.
	Info_ClearChoices		(DIA_GorNaToth_AngarTalked);
};

func void DIA_GorNaToth_AngarTalked_Unworthy()
{
	AI_Output (other, self,"DIA_GorNaToth_AngarTalked_Unworthy_15_00"); //Powiedzia�, �e jeste� niegodny, by nosi� zbroj� �wi�tynnego Stra�nika.
	AI_Output (self, other,"DIA_GorNaToth_AngarTalked_Unworthy_11_01"); //Nigdy! Nie m�g� tak powiedzie�! Nie o mnie!
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
	description		= "Chcia�bym odebra� moj� zbroj� �wi�tynnego Stra�nika."; 
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
	AI_Output			(other, self,"TPL_1402_GorNaToth_GETSTUFF_Info_15_01"); //Chcia�bym odebra� moj� zbroj� �wi�tynnego Stra�nika.
	AI_Output			(self, other,"TPL_1402_GorNaToth_GETSTUFF_Info_11_02"); //To prawdziwy zaszczyt wr�czy� zbroj� cz�owiekowi, kt�ry zdoby� dla nas jaja pe�zaczy.
	AI_Output			(self, other,"TPL_1402_GorNaToth_GETSTUFF_Info_11_03"); //Niech ta zbroja chroni ci� r�wnie dobrze jak �ni�cy chroni nasze Bractwo!
	
	B_LogEntry			(GE_BecomeTemplar,	"Gor Na Toth da� mi moj� pierwsz� zbroj� �wi�tynnej Stra�y. Teraz jestem pe�noprawnym cz�onkiem tej spo�eczno�ci!");

	Log_CreateTopic		(GE_TraderPSI,		LOG_NOTE);
	B_LogEntry			(GE_TraderPSI,		"Gor Na Toth ma na sk�adzie lepsze zbroje �wi�tynnej Stra�y. Niestety, �eby je otrzyma�, musz� najpierw z�o�y� poka�ny datek na rzecz Bractwa. W ci�gu dnia Toth przebywa zwykle na placu treningowym.");
	
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
	description		= "Potrzebuj� lepszej zbroi."; 
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
	AI_Output				(other, self,"Info_GorNaToth_ARMOR_15_01"); //Potrzebuj� lepszej zbroi.
	AI_Output				(self, other,"Info_GorNaToth_ARMOR_11_02"); //C�, m�g�bym ci da� lepsz� zbroj�, ale musia�by� najpierw przekaza� spory datek na rzecz Bractwa.

	Info_ClearChoices		(TPL_1402_GorNaToth_ARMOR);
	Info_AddChoice			(TPL_1402_GorNaToth_ARMOR,	DIALOG_BACK	,	TPL_1402_GorNaToth_ARMOR_BACK);	
	Info_AddChoice			(TPL_1402_GorNaToth_ARMOR,	B_BuildBuyArmorString(NAME_GorNaTothHeavyTpl,VALUE_TPL_ARMOR_H) ,TPL_1402_GorNaToth_ARMOR_H);	
	Info_AddChoice			(TPL_1402_GorNaToth_ARMOR,	B_BuildBuyArmorString(NAME_GorNaTothTpl,VALUE_TPL_ARMOR_M),	TPL_1402_GorNaToth_ARMOR_M);	


};

func void TPL_1402_GorNaToth_ARMOR_M ()
{
	AI_Output				(hero, self,"Info_GorNaToth_ARMOR_M_15_01"); //Potrzebuj� wzmocnionej zbroi Stra�nik�w �wi�tynnych.

	if (Kapitel < 3)
	{
		AI_Output			(self, hero,"Info_GorNaToth_ARMOR_M_11_02"); //Nie jeste� wystarczaj�co do�wiadczony. Udowodnij swoj� przydatno�� w Stra�y, a zas�u�ysz sobie na lepszy pancerz!
	}
	else if (Npc_HasItems(hero, ItMiNugget)<VALUE_TPL_ARMOR_M)
	{
		AI_Output			(self, hero,"Info_GorNaToth_ARMOR_M_11_03"); //Gdy tylko wesprzesz nasz� spo�eczno�� odpowiednim datkiem, zbroja b�dzie twoja!
	}
	else
	{
		AI_Output			(self, hero,"Info_GorNaToth_ARMOR_M_11_04"); //Teraz, gdy jeste� got�w wesprze� nas swoim hojnym datkiem, mo�esz odebra� swoj� zbroj�.
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
	AI_Output				(hero, self,"Info_GorNaToth_ARMOR_H_15_01"); //Chcia�bym otrzyma� ci�k� zbroj� Stra�y �wi�tynnej.

	if (Kapitel < 4)
	{
		AI_Output			(self, hero,"Info_GorNaToth_ARMOR_H_11_02"); //Nie jeste� jeszcze wystarczaj�co do�wiadczony. Udowodnij swoj� przydatno�� dla naszej spo�eczno�ci, a dost�pisz zaszczytu noszenia tak wspania�ego pancerza.
	}
	else if (Npc_HasItems(hero, ItMiNugget)>=VALUE_TPL_ARMOR_H)
	{
		AI_Output			(self, hero,"Info_GorNaToth_ARMOR_H_11_03"); //Widz�, �e jeste� ju� got�w, by nosi� t� wspania�� zbroj�. Gdyby� tylko mia� do�� rudy, by wspom�c nasz� ma�� spo�eczno�� jakim� hojnym datkiem...
	}
	else
	{
		AI_Output			(self, hero,"Info_GorNaToth_ARMOR_H_11_04"); //Od tej pory ten wspania�y pancerz b�dzie dawa� �wiadectwo twego m�stwa i po�wi�cenia.

		B_GiveInvItems  	(hero, self, ItMiNugget,VALUE_TPL_ARMOR_H);

		CreateInvItem		(self, ItAmArrow);				//SN: Kronkelgegenstand, damit die Bildschrimausgabe "1 Gegenstand erhalten" stimmt (R�stung geht nicht, da dann immer Gor Na Toth seine eigene erst auszieht, und eine Sekunde nackt dasteht)
		B_GiveInvItems  	(self, hero, ItAmArrow, 1);
		Npc_RemoveInvItem	(hero,	ItAmArrow);

		CreateInvItem		(hero, TPL_ARMOR_H);
		AI_EquipBestArmor	(hero);
	};

	Info_ClearChoices		(TPL_1402_GorNaToth_ARMOR);
};

func void TPL_1402_GorNaToth_ARMOR_BACK ()
{
	AI_Output				(hero, self,"Info_GorNaToth_ARMOR_BACK_15_01"); //Chyba si� jednak rozmy�l�.
	AI_Output				(self, hero,"Info_GorNaToth_ARMOR_BACK_11_02"); //Jak sobie �yczysz. Wiesz, gdzie mnie szuka�.

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
	description = "Mo�esz mnie czego� nauczy�?";
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
	AI_Output			(other,self,"TPL_1402_GorNaToth_Teach_15_00"); //Mo�esz mnie czego� nauczy�?
	AI_Output			(self,other,"TPL_1402_GorNaToth_Teach_11_01"); //Si�a i zr�czno�� s� r�wnie istotne jak pot�ga umys�u.
	
	if	(log_gornatothfight == FALSE) 
	{
		Log_CreateTopic   	(GE_TeacherPSI,LOG_NOTE);
		B_LogEntry			(GE_TeacherPSI,"Gor Na Toth mo�e mnie nauczy� walki jednor�cznym or�em, a tak�e poka�e mi jak zwi�kszy� si��, zr�czno�� i man�, je�li do��cz� do Bractwa.");
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
		B_LogEntry			(GE_TeacherPSI,"Gor Na Toth mo�e mi pom�c zwi�kszy� moj� si��, zr�czno�� i man�.");
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
	description = "Mo�esz nauczy� mnie lepiej walczy�?";
};                       

FUNC INT DIA_GorNaToth_TRAIN_Condition()
{
		return 1;
};

FUNC VOID DIA_GorNaToth_TRAIN_Info()
{

	AI_Output (other,self,"DIA_GorNaToth_TRAIN_15_00"); //Mo�esz nauczy� mnie lepiej walczy�?
	AI_Output (self,other,"DIA_GorNaToth_TRAIN_01_01"); //Tak, szkol� cz�onk�w Bractwa w walce jednor�cznym or�em.
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
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Bro� jednor�czna, poziom 1, 100 bry�ek rudy, 10 PN",GorNaToth_nauka1h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 1) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Bro� jednor�czna, poziom 2, 200 bry�ek rudy, 10 PN",GorNaToth_nauka1h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 2) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Bro� jednor�czna, poziom 3, 300 bry�ek rudy, 10 PN",GorNaToth_nauka1h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 3) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Bro� jednor�czna, poziom 4, 400 bry�ek rudy, 10 PN",GorNaToth_nauka1h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 4) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Bro� jednor�czna, poziom 5, 500 bry�ek rudy, 10 PN",GorNaToth_nauka1h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 5) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Bro� jednor�czna, poziom 6, 600 bry�ek rudy, 10 PN",GorNaToth_nauka1h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 6) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Bro� jednor�czna, poziom 7, 1000 bry�ek rudy, 10 PN",GorNaToth_nauka1h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 7) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Bro� jednor�czna, poziom 8, 1500 bry�ek rudy, 10 PN",GorNaToth_nauka1h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 8) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Bro� jednor�czna, poziom 9, 2000 bry�ek rudy, 10 PN",GorNaToth_nauka1h9);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 9) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Bro� jednor�czna, poziom 10, 2500 bry�ek rudy, 10 PN",GorNaToth_nauka1h10);
	};
};

func void DIA_GorNaToth_START_TRAINBACK ()
{
	Info_ClearChoices	(DIA_GorNaToth_START_TRAIN);
};

FUNC VOID GorNaToth_nauka1h1 ()
{
	AI_Output (other,self,"DIA_GorNaToth_TRAIN_1h_15_00"); //Chcia�bym nauczy� si� walki jednor�cznym or�em.
	if (Npc_HasItems(other,itminugget) >= 100)
	{
		if (B_GiveSkill(other, NPC_TALENT_1H, 1, 10))
		{
		AI_Output (self,other,"DIA_GorNaToth_TRAIN_1h_npc_01"); //M�dra decyzja. Najbli�sze trzy lekcje obejm� podstawy z kt�rymi powiniene� si� zapozna�.
		AI_Output (self,other,"DIA_GorNaToth_TRAIN_1h_npc_02"); //Bronie jednor�czne s� znacznie l�ejsze ni� dwur�czne, a przez to r�wnie� znacznie szybsze. 
		AI_Output (self,other,"DIA_GorNaToth_TRAIN_1h_npc_03"); //Istnieje podzia� na lekkie bronie jednor�czne i te ci�sze. Ci�sze wymagaj� pewniejszego chwytu, ale te� wi�cej si�y.
		AI_Output (self,other,"DIA_GorNaToth_TRAIN_1h_npc_04"); //Je�li chcesz p�ynnie walczy� ci�k� jednor�czn�, poza technik� b�dziesz te� musia� pozna� tajniki balansowania cia�em.
		AI_Output (self,other,"DIA_GorNaToth_TRAIN_1h_npc_05"); //O du�ej sile w �apie ju� nawet nie m�wi�. To oczywiste, �e �eby szybko wymachiwa� takim ci�arem b�dziesz musia� posiada� wi�cej si�y ni� potrzeba do podniesienia dobrego dwur�cznego miecza.
		
		B_GiveInvItems(other,self,itminugget,100);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_GorNaToth_TRAIN_1h_NoOre_01_00"); //Nie masz wystarczaj�cej ilo�ci rudy!
	};	
	Info_ClearChoices	(DIA_GorNaToth_START_TRAIN);
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,DIALOG_BACK,DIA_GorNaToth_START_TRAINBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 0) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Bro� jednor�czna, poziom 1, 100 bry�ek rudy, 10 PN",GorNaToth_nauka1h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 1) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Bro� jednor�czna, poziom 2, 200 bry�ek rudy, 10 PN",GorNaToth_nauka1h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 2) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Bro� jednor�czna, poziom 3, 300 bry�ek rudy, 10 PN",GorNaToth_nauka1h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 3) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Bro� jednor�czna, poziom 4, 400 bry�ek rudy, 10 PN",GorNaToth_nauka1h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 4) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Bro� jednor�czna, poziom 5, 500 bry�ek rudy, 10 PN",GorNaToth_nauka1h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 5) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Bro� jednor�czna, poziom 6, 600 bry�ek rudy, 10 PN",GorNaToth_nauka1h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 6) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Bro� jednor�czna, poziom 7, 1000 bry�ek rudy, 10 PN",GorNaToth_nauka1h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 7) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Bro� jednor�czna, poziom 8, 1500 bry�ek rudy, 10 PN",GorNaToth_nauka1h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 8) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Bro� jednor�czna, poziom 9, 2000 bry�ek rudy, 10 PN",GorNaToth_nauka1h9);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 9) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Bro� jednor�czna, poziom 10, 2500 bry�ek rudy, 10 PN",GorNaToth_nauka1h10);
	};
};

FUNC VOID GorNaToth_nauka1h2 ()
{
	AI_Output (other,self,"DIA_GorNaToth_TRAIN_2h_15_01"); //Naucz mnie sprawniej pos�ugiwa� si� jednor�czn� broni�.
	if (Npc_HasItems(other,itminugget) >= 200)
	{
		if (B_GiveSkill(other, NPC_TALENT_1H, 2, 10))
		{
		AI_Output (self,other,"DIA_GorNaToth_TRAIN_1h_npc_06"); //Poka� mi jak trzymasz miecz.
		AI_DrawWeapon (other);
		AI_Output (self,other,"DIA_GorNaToth_TRAIN_1h_npc_07"); //Tak jak my�la�em. Zadajesz mniejsze obra�enia ni� faktycznie m�g�by� zada� przy obecnej sile i za�o�onej broni. 
		AI_RemoveWeapon (other);
		AI_Output (self,other,"DIA_GorNaToth_TRAIN_1h_npc_08"); //Nie atakuj, gdy jeste� zbyt daleko. Je�li za bardzo si� wychylisz do oddalonego przeciwnika, mo�esz straci� r�wnowag� i si� przewr�ci�.
		AI_Output (self,other,"DIA_GorNaToth_TRAIN_1h_npc_09"); //Staraj si� atakowa� z r�nych stron, aby zmyli� przeciwnika. Pami�taj, aby blokowa� uderzenia, je�li nie b�dziesz w stanie zrobi� uniku.
		B_GiveInvItems(other,self,itminugget,200);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_GorNaToth_TRAIN_1h_NoOre_01_00"); //Nie masz wystarczaj�cej ilo�ci rudy!
	};	
	Info_ClearChoices	(DIA_GorNaToth_START_TRAIN);
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,DIALOG_BACK,DIA_GorNaToth_START_TRAINBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 0) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Bro� jednor�czna, poziom 1, 100 bry�ek rudy, 10 PN",GorNaToth_nauka1h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 1) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Bro� jednor�czna, poziom 2, 200 bry�ek rudy, 10 PN",GorNaToth_nauka1h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 2) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Bro� jednor�czna, poziom 3, 300 bry�ek rudy, 10 PN",GorNaToth_nauka1h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 3) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Bro� jednor�czna, poziom 4, 400 bry�ek rudy, 10 PN",GorNaToth_nauka1h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 4) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Bro� jednor�czna, poziom 5, 500 bry�ek rudy, 10 PN",GorNaToth_nauka1h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 5) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Bro� jednor�czna, poziom 6, 600 bry�ek rudy, 10 PN",GorNaToth_nauka1h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 6) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Bro� jednor�czna, poziom 7, 1000 bry�ek rudy, 10 PN",GorNaToth_nauka1h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 7) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Bro� jednor�czna, poziom 8, 1500 bry�ek rudy, 10 PN",GorNaToth_nauka1h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 8) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Bro� jednor�czna, poziom 9, 2000 bry�ek rudy, 10 PN",GorNaToth_nauka1h9);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 9) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Bro� jednor�czna, poziom 10, 2500 bry�ek rudy, 10 PN",GorNaToth_nauka1h10);
	};
};

FUNC VOID GorNaToth_nauka1h3 ()
{
	AI_Output (other,self,"DIA_GorNaToth_TRAIN_2h_15_01"); //Naucz mnie sprawniej pos�ugiwa� si� jednor�czn� broni�.
	if (Npc_HasItems(other,itminugget) >= 300)
	{
		if (B_GiveSkill(other, NPC_TALENT_1H, 3, 10))
		{
		AI_Output (self,other,"DIA_GorNaToth_TRAIN_1h_npc_10"); //Pami�tasz o balansowaniu cia�em? A o odpowiedniej odleg�o�ci od przeciwnika? 
		AI_Output (self,other,"DIA_GorNaToth_TRAIN_1h_npc_11"); //Spr�buj wyczu� ile si�y musisz u�y�, aby bro� uderza�a mocno, a przy tym nie polecia�a bez�adnie przed siebie. 
		AI_Output (self,other,"DIA_GorNaToth_TRAIN_1h_npc_12"); //Gdy to opanujesz, b�dziemy mogli pomy�le� nad ��czeniem po sobie uderze�. 
		AI_Output (self,other,"DIA_GorNaToth_TRAIN_1h_npc_13"); //Poka� mi jeszcze jak wyci�gasz bro�. Robisz jakie� post�py?
		AI_DrawWeapon (other);
		AI_Output (self,other,"DIA_GorNaToth_TRAIN_1h_npc_14"); //R�ce opadaj�... Nie dwiema, tylko jedn�! Om�wimy to na nast�pnej lekcji.
		AI_RemoveWeapon (other);
		B_GiveInvItems(other,self,itminugget,300);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_GorNaToth_TRAIN_1h_NoOre_01_00"); //Nie masz wystarczaj�cej ilo�ci rudy!
	};	
	Info_ClearChoices	(DIA_GorNaToth_START_TRAIN);
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,DIALOG_BACK,DIA_GorNaToth_START_TRAINBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 0) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Bro� jednor�czna, poziom 1, 100 bry�ek rudy, 10 PN",GorNaToth_nauka1h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 1) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Bro� jednor�czna, poziom 2, 200 bry�ek rudy, 10 PN",GorNaToth_nauka1h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 2) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Bro� jednor�czna, poziom 3, 300 bry�ek rudy, 10 PN",GorNaToth_nauka1h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 3) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Bro� jednor�czna, poziom 4, 400 bry�ek rudy, 10 PN",GorNaToth_nauka1h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 4) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Bro� jednor�czna, poziom 5, 500 bry�ek rudy, 10 PN",GorNaToth_nauka1h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 5) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Bro� jednor�czna, poziom 6, 600 bry�ek rudy, 10 PN",GorNaToth_nauka1h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 6) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Bro� jednor�czna, poziom 7, 1000 bry�ek rudy, 10 PN",GorNaToth_nauka1h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 7) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Bro� jednor�czna, poziom 8, 1500 bry�ek rudy, 10 PN",GorNaToth_nauka1h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 8) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Bro� jednor�czna, poziom 9, 2000 bry�ek rudy, 10 PN",GorNaToth_nauka1h9);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 9) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Bro� jednor�czna, poziom 10, 2500 bry�ek rudy, 10 PN",GorNaToth_nauka1h10);
	};
};

FUNC VOID GorNaToth_nauka1h4 ()
{
	AI_Output (other,self,"DIA_GorNaToth_TRAIN_2h_15_01"); //Naucz mnie sprawniej pos�ugiwa� si� jednor�czn� broni�.
	if (Npc_HasItems(other,itminugget) >= 400)
	{
		if (B_GiveSkill(other, NPC_TALENT_1H, 4, 10))
		{
		AI_Output (self,other,"DIA_GorNaToth_TRAIN_1h_01_02"); //Pocz�tkuj�cy cz�sto �api� zwyk�y miecz obydwoma r�kami. Radzi�bym ci si� do tego nie przyzwyczaja�, to fatalny nawyk.
		AI_Output (self,other,"DIA_GorNaToth_TRAIN_1h_01_03"); //Trzymaj bro� jedn� r�k�, ostrzem do g�ry, i zacznij ni� macha�.
		AI_Output (self,other,"DIA_GorNaToth_TRAIN_1h_01_04"); //Musisz si� nauczy�, jak zgra� twoje ruchy z bezw�adno�ci� or�a. Dzi�ki temu twoje ataki b�d� szybsze i bardziej zaskakuj�ce.
		AI_Output (self,other,"DIA_GorNaToth_TRAIN_1h_01_05"); //Zapami�taj sobie dobrze, co ci powiedzia�em, a tw�j styl walki stanie si� o wiele bardziej elegancki i skuteczny.
		AI_Output (self,other,"DIA_GorNaToth_TRAIN_1h_01_06"); //A, i jeszcze co�! Niekt�re ciosy powoduj� wi�ksze obra�enia ni� zwykle. Oczywi�cie, jako pocz�tkuj�cy masz raczej niewielkie szanse na zadanie krytycznego uderzenia.
		AI_Output (self,other,"DIA_GorNaToth_TRAIN_1h_01_07"); //Ale to si� zmieni w miar� czynienia przez ciebie post�p�w.
		B_GiveInvItems(other,self,itminugget,400);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_GorNaToth_TRAIN_1h_NoOre_01_00"); //Nie masz wystarczaj�cej ilo�ci rudy!
	};	
Info_ClearChoices	(DIA_GorNaToth_START_TRAIN);
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,DIALOG_BACK,DIA_GorNaToth_START_TRAINBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 0) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Bro� jednor�czna, poziom 1, 100 bry�ek rudy, 10 PN",GorNaToth_nauka1h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 1) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Bro� jednor�czna, poziom 2, 200 bry�ek rudy, 10 PN",GorNaToth_nauka1h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 2) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Bro� jednor�czna, poziom 3, 300 bry�ek rudy, 10 PN",GorNaToth_nauka1h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 3) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Bro� jednor�czna, poziom 4, 400 bry�ek rudy, 10 PN",GorNaToth_nauka1h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 4) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Bro� jednor�czna, poziom 5, 500 bry�ek rudy, 10 PN",GorNaToth_nauka1h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 5) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Bro� jednor�czna, poziom 6, 600 bry�ek rudy, 10 PN",GorNaToth_nauka1h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 6) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Bro� jednor�czna, poziom 7, 1000 bry�ek rudy, 10 PN",GorNaToth_nauka1h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 7) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Bro� jednor�czna, poziom 8, 1500 bry�ek rudy, 10 PN",GorNaToth_nauka1h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 8) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Bro� jednor�czna, poziom 9, 2000 bry�ek rudy, 10 PN",GorNaToth_nauka1h9);
	};	
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 9) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Bro� jednor�czna, poziom 10, 2500 bry�ek rudy, 10 PN",GorNaToth_nauka1h10);
	};
};

FUNC VOID GorNaToth_nauka1h5 ()
{
	AI_Output (other,self,"DIA_GorNaToth_TRAIN_2h_15_01"); //Naucz mnie sprawniej pos�ugiwa� si� jednor�czn� broni�.
	if (Npc_HasItems(other,itminugget) >= 500)
	{
		if (B_GiveSkill(other, NPC_TALENT_1H, 5, 10))
		{
		AI_Output (self,other,"DIA_GorNaToth_TRAIN_1h_npc_15"); //�eby zada� wi�ksze obra�enia musisz trafia� w newralgiczne punkty twojego przeciwnika. 
		AI_Output (self,other,"DIA_GorNaToth_TRAIN_1h_npc_16"); //Ci�ko si� tego nauczy�. Wszystko zale�y od postury i pancerza. Najlepiej atakowa� ko�czyny i g�ow�.
		AI_Output (self,other,"DIA_GorNaToth_TRAIN_1h_npc_17"); //Naturalnie walka z cz�owiekiem r�ni si� od walki ze zwierz�ciem.
			B_GiveInvItems(other,self,itminugget,500);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_GorNaToth_TRAIN_1h_NoOre_01_00"); //Nie masz wystarczaj�cej ilo�ci rudy!
	};	
Info_ClearChoices	(DIA_GorNaToth_START_TRAIN);
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,DIALOG_BACK,DIA_GorNaToth_START_TRAINBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 0) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Bro� jednor�czna, poziom 1, 100 bry�ek rudy, 10 PN",GorNaToth_nauka1h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 1) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Bro� jednor�czna, poziom 2, 200 bry�ek rudy, 10 PN",GorNaToth_nauka1h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 2) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Bro� jednor�czna, poziom 3, 300 bry�ek rudy, 10 PN",GorNaToth_nauka1h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 3) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Bro� jednor�czna, poziom 4, 400 bry�ek rudy, 10 PN",GorNaToth_nauka1h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 4) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Bro� jednor�czna, poziom 5, 500 bry�ek rudy, 10 PN",GorNaToth_nauka1h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 5) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Bro� jednor�czna, poziom 6, 600 bry�ek rudy, 10 PN",GorNaToth_nauka1h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 6) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Bro� jednor�czna, poziom 7, 1000 bry�ek rudy, 10 PN",GorNaToth_nauka1h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 7) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Bro� jednor�czna, poziom 8, 1500 bry�ek rudy, 10 PN",GorNaToth_nauka1h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 8) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Bro� jednor�czna, poziom 9, 2000 bry�ek rudy, 10 PN",GorNaToth_nauka1h9);
	};	
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 9) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Bro� jednor�czna, poziom 10, 2500 bry�ek rudy, 10 PN",GorNaToth_nauka1h10);
	};
};

FUNC VOID GorNaToth_nauka1h6 ()
{
	AI_Output (other,self,"DIA_GorNaToth_TRAIN_2h_15_01"); //Naucz mnie sprawniej pos�ugiwa� si� jednor�czn� broni�.
	if (Npc_HasItems(other,itminugget) >= 600)
	{
		if (B_GiveSkill(other, NPC_TALENT_1H, 6, 10))
		{
		AI_Output (self,other,"DIA_GorNaToth_TRAIN_1h_npc_18"); //Pami�tasz jak na pierwszej lekcji omawiali�my podzia� na bronie ci�kie i te l�ejsze?
		AI_Output (self,other,"DIA_GorNaToth_TRAIN_1h_npc_19"); //My�l�, �e jeste� ju� wystarczaj�co silny, aby walczy� ci�kimi jednor�czniakami. 
		AI_Output (self,other,"DIA_GorNaToth_TRAIN_1h_npc_20"); //O czym musisz pami�ta�? O odpowiednim wyczuciu r�wnowagi ostrza, a tak�e o treningu si�owym, kt�ry jest tutaj kluczowy.
		B_GiveInvItems(other,self,itminugget,600);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_GorNaToth_TRAIN_1h_NoOre_01_00"); //Nie masz wystarczaj�cej ilo�ci rudy!
	};
Info_ClearChoices	(DIA_GorNaToth_START_TRAIN);
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,DIALOG_BACK,DIA_GorNaToth_START_TRAINBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 0) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Bro� jednor�czna, poziom 1, 100 bry�ek rudy, 10 PN",GorNaToth_nauka1h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 1) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Bro� jednor�czna, poziom 2, 200 bry�ek rudy, 10 PN",GorNaToth_nauka1h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 2) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Bro� jednor�czna, poziom 3, 300 bry�ek rudy, 10 PN",GorNaToth_nauka1h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 3) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Bro� jednor�czna, poziom 4, 400 bry�ek rudy, 10 PN",GorNaToth_nauka1h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 4) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Bro� jednor�czna, poziom 5, 500 bry�ek rudy, 10 PN",GorNaToth_nauka1h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 5) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Bro� jednor�czna, poziom 6, 600 bry�ek rudy, 10 PN",GorNaToth_nauka1h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 6) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Bro� jednor�czna, poziom 7, 1000 bry�ek rudy, 10 PN",GorNaToth_nauka1h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 7) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Bro� jednor�czna, poziom 8, 1500 bry�ek rudy, 10 PN",GorNaToth_nauka1h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 8) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Bro� jednor�czna, poziom 9, 2000 bry�ek rudy, 10 PN",GorNaToth_nauka1h9);
	};	
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 9) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Bro� jednor�czna, poziom 10, 2500 bry�ek rudy, 10 PN",GorNaToth_nauka1h10);
	};
};

FUNC VOID GorNaToth_nauka1h7 ()
{
	AI_Output (other,self,"DIA_GorNaToth_TRAIN_2h_15_01"); //Naucz mnie sprawniej pos�ugiwa� si� jednor�czn� broni�.
	if (Npc_HasItems(other,itminugget) >= 1000)
	{
		if (B_GiveSkill(other, NPC_TALENT_1H, 7, 10))
		{
		AI_Output (self, other,"DIA_GorNaToth_TRAIN_2h_Info_01_03"); //Musisz wykorzysta� si�� bezw�adno�ci, pami�tasz? �wietnie. Teraz nauczysz si� lepiej balansowa� cia�em. Po zadaniu dw�ch cios�w wykonaj obr�t. To powinno zmyli� twojego przeciwnika i pozwoli� ci wyj�� na dobr� pozycj� do nast�pnego ataku.
		AI_Output (self, other,"DIA_GorNaToth_TRAIN_2h_Info_01_04"); //Wtedy wyprowad� nast�pne ci�cie z prawej strony...
		AI_Output (self, other,"DIA_GorNaToth_TRAIN_2h_Info_01_05"); //I znowu do przodu. Pami�taj - trening czyni mistrza, wi�c najlepiej we� si� od razu do roboty!
		B_GiveInvItems(other,self,itminugget,1000);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_GorNaToth_TRAIN_1h_NoOre_01_00"); //Nie masz wystarczaj�cej ilo�ci rudy!
	};	
Info_ClearChoices	(DIA_GorNaToth_START_TRAIN);
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,DIALOG_BACK,DIA_GorNaToth_START_TRAINBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 0) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Bro� jednor�czna, poziom 1, 100 bry�ek rudy, 10 PN",GorNaToth_nauka1h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 1) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Bro� jednor�czna, poziom 2, 200 bry�ek rudy, 10 PN",GorNaToth_nauka1h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 2) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Bro� jednor�czna, poziom 3, 300 bry�ek rudy, 10 PN",GorNaToth_nauka1h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 3) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Bro� jednor�czna, poziom 4, 400 bry�ek rudy, 10 PN",GorNaToth_nauka1h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 4) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Bro� jednor�czna, poziom 5, 500 bry�ek rudy, 10 PN",GorNaToth_nauka1h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 5) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Bro� jednor�czna, poziom 6, 600 bry�ek rudy, 10 PN",GorNaToth_nauka1h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 6) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Bro� jednor�czna, poziom 7, 1000 bry�ek rudy, 10 PN",GorNaToth_nauka1h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 7) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Bro� jednor�czna, poziom 8, 1500 bry�ek rudy, 10 PN",GorNaToth_nauka1h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 8) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Bro� jednor�czna, poziom 9, 2000 bry�ek rudy, 10 PN",GorNaToth_nauka1h9);
	};	
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 9) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Bro� jednor�czna, poziom 10, 2500 bry�ek rudy, 10 PN",GorNaToth_nauka1h10);
	};
};

FUNC VOID GorNaToth_nauka1h8 ()
{
	AI_Output (other,self,"DIA_GorNaToth_TRAIN_2h_15_01"); //Naucz mnie sprawniej pos�ugiwa� si� jednor�czn� broni�.
	if (Npc_HasItems(other,itminugget) >= 1500)
	{
		if (B_GiveSkill(other, NPC_TALENT_1H, 8, 10))
		{
		AI_Output (self,other,"DIA_GorNaToth_TRAIN_1h_npc_21"); //Robisz post�py. Skup si� na kolejnych ciosach. ��cz je coraz szybciej i pewniej.
		B_GiveInvItems(other,self,itminugget,1500);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_GorNaToth_TRAIN_1h_NoOre_01_00"); //Nie masz wystarczaj�cej ilo�ci rudy!
	};	
Info_ClearChoices	(DIA_GorNaToth_START_TRAIN);
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,DIALOG_BACK,DIA_GorNaToth_START_TRAINBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 0) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Bro� jednor�czna, poziom 1, 100 bry�ek rudy, 10 PN",GorNaToth_nauka1h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 1) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Bro� jednor�czna, poziom 2, 200 bry�ek rudy, 10 PN",GorNaToth_nauka1h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 2) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Bro� jednor�czna, poziom 3, 300 bry�ek rudy, 10 PN",GorNaToth_nauka1h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 3) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Bro� jednor�czna, poziom 4, 400 bry�ek rudy, 10 PN",GorNaToth_nauka1h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 4) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Bro� jednor�czna, poziom 5, 500 bry�ek rudy, 10 PN",GorNaToth_nauka1h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 5) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Bro� jednor�czna, poziom 6, 600 bry�ek rudy, 10 PN",GorNaToth_nauka1h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 6) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Bro� jednor�czna, poziom 7, 1000 bry�ek rudy, 10 PN",GorNaToth_nauka1h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 7) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Bro� jednor�czna, poziom 8, 1500 bry�ek rudy, 10 PN",GorNaToth_nauka1h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 8) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Bro� jednor�czna, poziom 9, 2000 bry�ek rudy, 10 PN",GorNaToth_nauka1h9);
	};	
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 9) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Bro� jednor�czna, poziom 10, 2500 bry�ek rudy, 10 PN",GorNaToth_nauka1h10);
	};
};

FUNC VOID GorNaToth_nauka1h9 ()
{
	AI_Output (other,self,"DIA_GorNaToth_TRAIN_2h_15_01"); //Naucz mnie sprawniej pos�ugiwa� si� jednor�czn� broni�.
	if (Npc_HasItems(other,itminugget) >= 2000)
	{
		if (B_GiveSkill(other, NPC_TALENT_1H, 9, 10))
		{
		AI_Output (self,other,"DIA_GorNaToth_TRAIN_1h_npc_22"); //Chc�c najbole�niej zrani� przeciwnika musisz dobrze wymierzy� cios. Gdy masz szans� staraj si� trafia� w g�ow� lub barki.
		AI_Output (self,other,"DIA_GorNaToth_TRAIN_1h_npc_23"); //S�abe punkty to tak�e ��cznia zbroi. Je�li przeciwnik ma na sobie sk�rzan� zbroj� to po prostu bij w brzuch. 
		AI_Output (self,other,"DIA_GorNaToth_TRAIN_1h_npc_24"); //Sk�rzane pancerze �atwo si� rozcina. 
		AI_Output (self,other,"DIA_GorNaToth_TRAIN_1h_npc_25"); //Przypomnij sobie jeszcze raz to wszystko, czego ci� nauczy�em i stosuj si� do tego. 
		B_GiveInvItems(other,self,itminugget,2000);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_GorNaToth_TRAIN_1h_NoOre_01_00"); //Nie masz wystarczaj�cej ilo�ci rudy!
	};	
Info_ClearChoices	(DIA_GorNaToth_START_TRAIN);
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,DIALOG_BACK,DIA_GorNaToth_START_TRAINBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 0) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Bro� jednor�czna, poziom 1, 100 bry�ek rudy, 10 PN",GorNaToth_nauka1h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 1) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Bro� jednor�czna, poziom 2, 200 bry�ek rudy, 10 PN",GorNaToth_nauka1h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 2) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Bro� jednor�czna, poziom 3, 300 bry�ek rudy, 10 PN",GorNaToth_nauka1h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 3) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Bro� jednor�czna, poziom 4, 400 bry�ek rudy, 10 PN",GorNaToth_nauka1h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 4) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Bro� jednor�czna, poziom 5, 500 bry�ek rudy, 10 PN",GorNaToth_nauka1h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 5) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Bro� jednor�czna, poziom 6, 600 bry�ek rudy, 10 PN",GorNaToth_nauka1h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 6) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Bro� jednor�czna, poziom 7, 1000 bry�ek rudy, 10 PN",GorNaToth_nauka1h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 7) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Bro� jednor�czna, poziom 8, 1500 bry�ek rudy, 10 PN",GorNaToth_nauka1h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 8) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Bro� jednor�czna, poziom 9, 2000 bry�ek rudy, 10 PN",GorNaToth_nauka1h9);
	};	
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 9) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Bro� jednor�czna, poziom 10, 2500 bry�ek rudy, 10 PN",GorNaToth_nauka1h10);
	};
};

FUNC VOID GorNaToth_nauka1h10 ()
{
	AI_Output (other,self,"DIA_GorNaToth_TRAIN_2h_15_01"); //Naucz mnie sprawniej pos�ugiwa� si� jednor�czn� broni�.
	if (Npc_HasItems(other,itminugget) >= 2500)
	{
		if (B_GiveSkill(other, NPC_TALENT_1H, 10, 10))
		{
		AI_Output (self,other,"DIA_GorNaToth_TRAIN_1h_npc_26"); //To ju� koniec naszego szkolenia. Szacunek dla ciebie, �e dobrn��e� do ko�ca.
		AI_Output (self,other,"DIA_GorNaToth_TRAIN_1h_npc_27"); //Poka�� ci kilka ruch�w, kt�rymi trafisz we wra�liwe punkty twojego wroga.
		AI_Output (self,other,"DIA_GorNaToth_TRAIN_1h_npc_28"); //Musisz potrafi� je dostrzec zanim si� do niego zbli�ysz.
		B_GiveInvItems(other,self,itminugget,2500);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_GorNaToth_TRAIN_1h_NoOre_01_00"); //Nie masz wystarczaj�cej ilo�ci rudy!
	};	
Info_ClearChoices	(DIA_GorNaToth_START_TRAIN);
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,DIALOG_BACK,DIA_GorNaToth_START_TRAINBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 0) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Bro� jednor�czna, poziom 1, 100 bry�ek rudy, 10 PN",GorNaToth_nauka1h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 1) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Bro� jednor�czna, poziom 2, 200 bry�ek rudy, 10 PN",GorNaToth_nauka1h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 2) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Bro� jednor�czna, poziom 3, 300 bry�ek rudy, 10 PN",GorNaToth_nauka1h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 3) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Bro� jednor�czna, poziom 4, 400 bry�ek rudy, 10 PN",GorNaToth_nauka1h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 4) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Bro� jednor�czna, poziom 5, 500 bry�ek rudy, 10 PN",GorNaToth_nauka1h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 5) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Bro� jednor�czna, poziom 6, 600 bry�ek rudy, 10 PN",GorNaToth_nauka1h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 6) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Bro� jednor�czna, poziom 7, 1000 bry�ek rudy, 10 PN",GorNaToth_nauka1h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 7) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Bro� jednor�czna, poziom 8, 1500 bry�ek rudy, 10 PN",GorNaToth_nauka1h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 8) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Bro� jednor�czna, poziom 9, 2000 bry�ek rudy, 10 PN",GorNaToth_nauka1h9);
	};	
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 9) 
	{
	Info_AddChoice		(DIA_GorNaToth_START_TRAIN,"Bro� jednor�czna, poziom 10, 2500 bry�ek rudy, 10 PN",GorNaToth_nauka1h10);
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
		B_LogEntry			(GE_TeacherPSI,"Gor Na Toth mo�e mnie nauczy� walki jednor�cznym or�em.");
		log_gornatothfight = TRUE;
	};
	AI_Output (other, self,"TPL_1402_GorNaToth_TRAIN_Info_15_00"); //Chcia�bym nauczy� si� walki jednor�cznym or�em.
	 if (hero.attribute[ATR_STRENGTH] >= 30)
	 {
	if B_GiveSkill(hero,NPC_TALENT_1H,1,LPCOST_TALENT_1H_1)
	{
		AI_Output			(self,other,"TPL_1402_GorNaToth_TRAIN_11_01"); //M�dra decyzja. Jednak zanim poznasz bardziej zaawansowane techniki, powiniene� nauczy� si� prawid�owo trzyma� or� w r�ku.
		AI_Output			(self,other,"TPL_1402_GorNaToth_TRAIN_11_02"); //Pocz�tkuj�cy cz�sto �api� zwyk�y miecz obydwoma r�kami. Radzi�bym ci si� do tego nie przyzwyczaja�, to fatalny nawyk.
		AI_Output			(self,other,"TPL_1402_GorNaToth_TRAIN_11_03"); //Trzymaj bro� jedn� r�k�, ostrzem do g�ry, i zacznij ni� macha�.
		AI_Output			(self,other,"TPL_1402_GorNaToth_TRAIN_11_04"); //Musisz si� nauczy�, jak zgra� twoje ruchy z bezw�adno�ci� or�a. Dzi�ki temu twoje ataki b�d� szybsze i bardziej zaskakuj�ce.
		AI_Output			(self,other,"TPL_1402_GorNaToth_TRAIN_11_05"); //Zapami�taj sobie dobrze co ci powiedzia�em, a tw�j styl walki stanie si� o wiele bardziej elegancki i skuteczny.
		AI_Output			(self,other,"TPL_1402_GorNaToth_TRAIN_11_06"); //A, i jeszcze co�! Niekt�re ciosy powoduj� wi�ksze obra�enia ni� zwykle. Oczywi�cie, jako pocz�tkuj�cy masz raczej niewielkie szanse na zadanie krytycznego uderzenia.
		AI_Output			(self,other,"TPL_1402_GorNaToth_TRAIN_11_07"); //Ale to si� zmieni w miar� czynienia przez ciebie post�p�w.
		TPL_1402_GorNaToth_TRAIN.permanent = 0;

		AI_StopProcessInfos	(self);
		B_PracticeCombat	("PSI_PATH_6_7");
	};
	}
	else
	{
	AI_Output			(self,other,"TPL_1402_GorNaToth_NO_ENOUGHT_STR_1"); //P�ynna walka jednor�cznym or�em wymaga sporo si�y. Nie jeste� jeszcze na to gotowy!
	PrintScreen	("Warunek: Si�a 30", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
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
	AI_Output (other, self,"TPL_1402_GorNaToth_TRAINAGAIN_Info_15_01"); //Naucz mnie, jak sprawniej pos�ugiwa� si� jednor�czn� broni�.
	if (hero.attribute[ATR_STRENGTH] >= 60)
	{
	if B_GiveSkill(hero,NPC_TALENT_1H,2,LPCOST_TALENT_1H_2)
	{
		AI_Output (self, other,"TPL_1402_GorNaToth_TRAINAGAIN_Info_11_02"); //Dobrze, podstawy ju� znasz. Nieznaczne opuszczenie broni zwi�kszy si�� twojego pierwszego ciosu.
		AI_Output (self, other,"TPL_1402_GorNaToth_TRAINAGAIN_Info_11_03"); //Musisz wykorzysta� si�� bezw�adno�ci, pami�tasz? �wietnie. Teraz nauczysz si� lepiej balansowa� cia�em. Po zadaniu dw�ch cios�w wykonaj obr�t. To powinno zmyli� twojego przeciwnika i pozwoli� ci wyj�� na dobr� pozycj� do nast�pnego ataku.
		AI_Output (self, other,"TPL_1402_GorNaToth_TRAINAGAIN_Info_11_04"); //Wtedy wyprowad� nast�pne ci�cie z prawej strony...
		AI_Output (self, other,"TPL_1402_GorNaToth_TRAINAGAIN_Info_11_05"); //I znowu do przodu. Pami�taj - trening czyni mistrza, wi�c najlepiej we� si� od razu do roboty!
		TPL_1402_GorNaToth_TRAINAGAIN.permanent = 0;

		AI_StopProcessInfos	(self);
		B_PracticeCombat	("PSI_PATH_6_7");
	};
	}
	else
	{
	AI_Output			(self,other,"TPL_1402_GorNaToth_NO_ENOUGHT_STR_1"); //P�ynna walka jednor�cznym or�em wymaga sporo si�y. Nie jeste� jeszcze na to gotowy!
	PrintScreen	("Warunek: Si�a 60", -1,-1,"FONT_OLD_20_WHITE.TGA",2);	
	};
}; 
*/
//*****************************************************
// ARENA W BRACTWIE !! POCZ�TEK
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
    AI_Output (self, other ,"DIA_GorNaToth_Walki_03_01"); //Uwa�aj, gdzie idziesz, nieznajomy!
    AI_Output (self, other ,"DIA_GorNaToth_Walki_03_02"); //Na tym placu trenuj� najlepsi Stra�nicy �wi�tynni w Obozie.
    AI_Output (self, other ,"DIA_GorNaToth_Walki_03_03"); //Ju� wkr�tce odb�d� tu si� walki. 
	AI_Output (other, self ,"DIA_GorNaToth_Walki_15_04"); //Jakie walki? 
	AI_Output (self, other ,"DIA_GorNaToth_Walki_03_05"); //Chcemy nieco uspokoi� atmosfer� w Obozie. Walki z pewno�ci� odci�gn� uwag� od ostatnich wydarze�. 
	AI_Output (other, self ,"DIA_GorNaToth_Walki_15_06"); //No tak. W ko�cu ca�y wasz �wiatopogl�d leg� w gruzach. 
	AI_Output (self, other ,"DIA_GorNaToth_Walki_03_07"); //Nie wyci�gaj takich pochopnych wniosk�w. Jeszcze nic nie jest przes�dzone.
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
   description	= "Chc� walczy� na arenie. (200 bry�ek rudy)";
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
    AI_Output (other, self ,"DIA_GorNaToth_FightAsk_15_01"); //Chc� walczy� na arenie.
    AI_Output (self, other ,"DIA_GorNaToth_FightAsk_03_02"); //Zd��y�e� w ostatniej chwili. W�a�nie mia�em zamyka� list� gladiator�w.
    AI_Output (self, other ,"DIA_GorNaToth_FightAsk_03_02"); //Wpisowe kosztuje 200 bry�ek rudy. 
    AI_Output (self, other ,"DIA_GorNaToth_FightAsk_03_04"); //Zwyci�zca otrzymuje tytu� najlepszego gladiatora i 1000 bry�ek rudy.
    AI_Output (self, other ,"DIA_GorNaToth_FightAsk_03_05"); //Je�eli przegrasz jedn� walk�, nie b�dziesz m�g� wyzwa� kolejnego przeciwnika.
	AI_Output (self, other ,"DIA_GorNaToth_FightAsk_03_06"); //Je�li uda ci si� pokona� przeciwnika, poczekaj a� wstanie. Walczymy honorowo. Nie jak rabusie. 
    MIS_WalkiBractwo = LOG_RUNNING;

    Log_CreateTopic            (CH1_WalkiBractwo, LOG_MISSION);
    Log_SetTopicStatus       (CH1_WalkiBractwo, LOG_RUNNING);
    B_LogEntry                     (CH1_WalkiBractwo,"Zasady s� proste: zwyci�zca zostaje mistrzem areny i otrzymuje 1000 bry�ek rudy; je�eli przegram, nie odzyskam rudy i nie b�d� m�g� walczy� z kolejnym przeciwnikiem.");
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
	AI_Output (self, other ,"DIA_GorNaToth_FirstFight_03_03"); //Przygotuj si� i b�d� tutaj wczesnym wieczorem.
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
    AI_Output (self, other ,"DIA_GorNaToth_START_EVENT_03_01"); //S�UCHAJCIE, S�UCHAJCIE! PRZYBYLI JU� WSZYSCY WJOWNICY!
    AI_Output (self, other ,"DIA_GorNaToth_START_EVENT_03_02"); //MO�EMY ZACZYNA� NASZ TURNIEJ! 
    AI_Output (self, other ,"DIA_GorNaToth_START_EVENT_03_03"); //PIERWSZA WALKA: BEZIMENNY WOJOWNIK KONTRA GOR KERESH!
    AI_Output (self, other ,"DIA_GorNaToth_START_EVENT_03_04"); //NIECH WYGRA NAJLEPSZY!
    AI_Output (self, other ,"DIA_GorNaToth_START_EVENT_03_05"); //No?! Co si� tak patrzysz? 
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
   description	= "Wygra�em pierwsz� walk�!";
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
    AI_Output (other, self ,"DIA_GorNaToth_WinFirstFight_15_01"); //Wygra�em pierwsz� walk�!
    AI_Output (self, other ,"DIA_GorNaToth_WinFirstFight_03_02"); //Musz� przyzna�, �e nie�le.
	AI_Output (self, other ,"DIA_GorNaToth_WinFirstFight_03_03"); //PIERWSZ� WALK� WYGRYWA BEZIMIENNY WOJOWNIK. GOR KERESH ZOSTA� POKONANY!
    B_GiveInvItems (self, other, ItMiNugget, 200);
    B_LogEntry                     (CH1_WalkiBractwo,"Wygra�em pierwsz� walk�! Pora na kolejn�.");

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
    AI_Output (self, other ,"DIA_GorNaToth_FirstFalse_03_01"); //Przegra�e�! Mo�esz odej��! Nie masz tu czego szuka�.
    AI_StopProcessInfos	(self);
    B_LogEntry                     (CH1_WalkiBractwo,"Przegra�em pierwsz� walk�! Mog� odej��.");
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
   description	= "Chc� zmierzy� si� z drugim wojownikiem! (200 bry�ek rudy)";
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
    AI_Output (other, self ,"DIA_GorNaToth_SecondFight_15_01"); //Chc� zmierzy� si� z drugim wojownikiem!
    AI_Output (self, other ,"DIA_GorNaToth_SecondFight_03_02"); //Dobrze. Tym razem nie b�dzie tak �atwo.
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
   description	= "Wygra�em drug� walk�!";
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
    AI_Output (other, self ,"DIA_GorNaToth_WinSecondFight_15_01"); //Wygra�em drug� walk�!
    AI_Output (self, other ,"DIA_GorNaToth_WinSecondFight_03_02"); //Zaskoczy�e� mnie. 
    CreateInvItems (self, ItMiNugget, 400);
    B_GiveInvItems (self, other, ItMiNugget, 400);

    B_LogEntry                     (CH1_WalkiBractwo,"Wygra�em drug� walk�! Dobrze mi idzie.");

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
    AI_Output (self, other ,"DIA_GorNaToth_SecondFail_03_01"); //Przegra�e�! Nie mo�esz dalej walczy�.
    B_LogEntry                     (CH1_WalkiBractwo,"Przegra�em drug� walk�. Musz� odej��.");
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
   description	= "Chcia�bym stoczy� walk� z trzecim wojownikiem! (300 bry�ek rudy)";
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
    AI_Output (other, self ,"DIA_GorNaToth_ThirdFight_15_01"); //Chcia�bym stoczy� walk� z trzecim wojownikiem!
    AI_Output (self, other ,"DIA_GorNaToth_ThirdFight_03_02"); //Widz�, �e jeste� g�odny zwyci�stw!
    if (hero.guild == GIL_TPL) || (hero.guild == GIL_NOV) || (hero.guild == GIL_GUR)
    {
        AI_Output (self, other ,"DIA_GorNaToth_ThirdFight_03_03"); //Dobrze, �e walczysz ku chwale �ni�cego!
    }
    else
    {
        AI_Output (self, other ,"DIA_GorNaToth_ThirdFight_03_04"); //Szkoda, �e nie nale�ysz do Bractwa.
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
   description	= "Wygra�em trzeci� walk�!";
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
    AI_Output (other, self ,"DIA_GorNaToth_ThirdFightWin_15_01"); //Wygra�em trzeci� walk�!
    AI_Output (self, other ,"DIA_GorNaToth_ThirdFightWin_03_02"); //Albo jeste� �wietnym wojownikiem, albo masz cholerne szcz�cie.
    AI_Output (other, self ,"DIA_GorNaToth_ThirdFightWin_15_03"); //Tak czy inaczej ruda mi si� nale�y.
    CreateInvItems (self, ItMiNugget, 600);
    B_GiveInvItems (self, other, ItMiNugget, 600);
    B_LogEntry                     (CH1_WalkiBractwo,"Wygra�em trzeci� walk�! Ciekawe kiedy zrobi si� trudno...");

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
    AI_Output (self, other ,"DIA_GorNaToth_ThirdFightFail_03_01"); //Przegra�e� walk�. Mo�esz odej��. I tak uda�o ci si� zaj�� daleko.
    B_LogEntry                     (CH1_WalkiBractwo,"Przegra�em trzeci� walk�. Nie mog� ju� walczy� na arenie. ");
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
   description	= "Chc� walczy� z mistrzem areny! (400 bry�ek rudy)";
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
    AI_Output (other, self ,"DIA_GorNaToth_LastFight_15_01"); //Chc� walczy� z mistrzem areny!
    AI_Output (self, other ,"DIA_GorNaToth_LastFight_03_02"); //Ta walka b�dzie ci� kosztowa� 500 bry�ek rudy, ale je�li wygrasz, nie otrzymasz tysi�c bry�ek, a tysi�c pi��set bry�ek rudy.
    AI_Output (other, self ,"DIA_GorNaToth_LastFight_15_03"); //Proponujesz bardzo wysok� nagrod�...
    AI_Output (self, other ,"DIA_GorNaToth_LastFight_03_04"); //Bo wiem, �e przegrasz.
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
   description	= "Wygra�em ostatni� walk�! Jestem mistrzem areny.";
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
    AI_Output (other, self ,"DIA_GorNaToth_LastFightWin_15_01"); //Wygra�em ostatni� walk�! Jestem mistrzem areny.
    AI_Output (self, other ,"DIA_GorNaToth_LastFightWin_03_02"); //To niemo�liwe! Pokona�e� najlepszego wojownika w ca�ej G�rniczej Dolinie.
    AI_Output (other, self ,"DIA_GorNaToth_LastFightWin_15_03"); //Jestem pewien, �e s� w okolicy lepsi. 
    AI_Output (other, self ,"DIA_GorNaToth_LastFightWin_15_04"); //Za bardzo uwierzy�e� w swojego wojownika. A teraz dawaj obiecan� nagrod�!
    AI_Output (self, other ,"DIA_GorNaToth_LastFightWin_03_05"); //We� je i odejd�!
    CreateInvItems (self, ItMiNugget, 1500);
    B_GiveInvItems (self, other, ItMiNugget, 1500);
    B_LogEntry                     (CH1_WalkiBractwo,"Wygra�em ostatni� walk�. Jestem mistrzem areny w Bractwie.");
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
    AI_Output (self, other ,"DIA_GorNaToth_LastFightFali_03_01"); //Tego si� spodziewa�em. Przegra�e�, ale zaszed�e� bardzo daleko.
    AI_Output (self, other ,"DIA_GorNaToth_LastFightFali_03_02"); //Dobra robota. Zas�ugujesz na szacunek tutejszych wojownik�w.
    AI_Output (self, other ,"DIA_GorNaToth_LastFightFali_03_03"); //Wiesz co... Oddam ci wp�acon� rud�. Zas�u�y�e�, mimo przegranej.
    CreateInvItems (self, ItMiNugget, 500);
    B_GiveInvItems (self, other, ItMiNugget, 500);
    B_LogEntry                     (CH1_WalkiBractwo,"Przegra�em ostatni� walk�. Gor Na Toth by� wyra�nie zadowolony. Przynajmniej uda�o mi si� odzyska� 500 bry�ek rudy.");
    Log_SetTopicStatus       (CH1_WalkiBractwo, LOG_FAILED);
    MIS_WalkiBractwo = LOG_FAILED;

    B_GiveXP (200);
    AI_StopProcessInfos	(self);
};
//*****************************************************
// ARENA W BRACTWIE !! KONIEC
//*****************************************************
*/