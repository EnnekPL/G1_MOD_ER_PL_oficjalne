//****************************************
//					EXIT
//****************************************

INSTANCE DIA_ORG_855_Wolf_Exit (C_INFO)
{
	npc			= ORG_855_Wolf;
	nr			= 999;
	condition	= DIA_ORG_855_Wolf_Exit_Condition;
	information	= DIA_ORG_855_Wolf_Exit_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_ORG_855_Wolf_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_ORG_855_Wolf_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

//****************************************
//					Hallo
//****************************************

INSTANCE DIA_Wolf_Hello (C_INFO)
{
	npc			= ORG_855_Wolf;
	nr			= 1;
	condition	= DIA_Wolf_Hello_Condition;
	information	= DIA_Wolf_Hello_Info;
	permanent	= 0;
	description = "Kim jeste�?";
};                       

FUNC INT DIA_Wolf_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_Wolf_Hello_Info()
{
	AI_Output			(other, self,"DIA_Wolf_Hello_15_00"); //Kim jeste�?
	AI_Output			(self, other,"DIA_Wolf_Hello_09_01"); //Jestem p�atnerzem. M�wi� na mnie Wilk.

	B_LogEntry			(GE_TraderNC,	"Wilk zaopatruje Szkodniki w zbroje. Zwykle przesiaduje przed swoj� chat�, w wielkiej jaskini.");
};

//========================================
//-----------------> YourGuild
//========================================

INSTANCE DIA_Wolf_YourGuild (C_INFO)
{
   npc          = ORG_855_Wolf;
   nr           = 55;
   condition    = DIA_Wolf_YourGuild_Condition;
   information  = DIA_Wolf_YourGuild_Info;
   permanent	= FALSE;
   description	= "Jeste� Najemnikiem, czy Szkodnikiem?";
};

FUNC INT DIA_Wolf_YourGuild_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Wolf_Hello))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Wolf_YourGuild_Info()
{
    AI_Output (other, self ,"DIA_Wolf_YourGuild_15_01"); //Jeste� Najemnikiem, czy Szkodnikiem?
    AI_Output (self, other ,"DIA_Wolf_YourGuild_03_02"); //Najemnikiem, ale tak si� sk�ada, �e trzymam si� obydwu grup.
    AI_Output (self, other ,"DIA_Wolf_YourGuild_03_03"); //Wcze�niej by�em jednym z ludzi Laresa, ale mimo awansu nie porzuci�em starej bandy.
    AI_Output (self, other ,"DIA_Wolf_YourGuild_03_04"); //Zar�wno Lee, jak i Lares darz� mnie zaufaniem.
    AI_Output (self, other ,"DIA_Wolf_YourGuild_03_05"); //Rozporz�dzam zbrojowni�. Je�eli do��czysz do Nowego Obozu, b�dziesz m�g� kupi� u mnie pancerz.
    AI_Output (other, self ,"DIA_Wolf_YourGuild_15_06"); //Co s�dzisz o sporze Najemnik�w i Szkodnik�w?
    AI_Output (self, other ,"DIA_Wolf_YourGuild_03_07"); //Uwa�am, �e jest bezsensowny.
    AI_Output (self, other ,"DIA_Wolf_YourGuild_03_08"); //Powinni�my si� wszyscy trzyma� razem.
};



//****************************************
//				Bin ORG!
//****************************************

INSTANCE DIA_Wolf_GreetORG (C_INFO)
{
	npc			= ORG_855_Wolf;
	nr			= 1;
	condition	= DIA_Wolf_GreetORG_Condition;
	information	= DIA_Wolf_GreetORG_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC INT DIA_Wolf_GreetORG_Condition()
{
	if	(Npc_GetTrueGuild(hero) == GIL_ORG)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Wolf_GreetORG_Info()
{
	AI_Output (self, other,"DIA_Wolf_GreetORG_09_00"); //Hej, teraz jeste� jednym z nas!
};

//****************************************
//				TRADE
//****************************************

instance  Org_855_Wolf_TRADE (C_INFO)
{
	npc				= Org_855_Wolf;
	nr				= 800;
	condition		= Org_855_Wolf_TRADE_Condition;
	information		= Org_855_Wolf_TRADE_Info;
	permanent		= 1;
	description		= DIALOG_TRADE; 
	trade 			= 1;
};

FUNC int  Org_855_Wolf_TRADE_Condition()
{	
if (Npc_KnowsInfo (hero , DIA_Wolf_Hello)) {
	return 1; };
};

FUNC void  Org_855_Wolf_TRADE_Info()
{
	AI_Output (other, self,"Org_855_Wolf_TRADE_15_00"); //Zajmujesz si� czym� jeszcze?
	AI_Output (self, other,"Org_855_Wolf_TRADE_09_01"); //Skupuj� sk�ry i futra od my�liwych. Gdyby� mia� kiedy� taki towar na zbyciu - zg�o� si� do mnie.
	

};

//****************************************
//				Wo J�ger
//****************************************

instance  Org_855_Wolf_WhereHunter (C_INFO)
{
	npc				= Org_855_Wolf;
	nr				= 900;
	condition		= Org_855_Wolf_WhereHunter_Condition;
	information		= Org_855_Wolf_WhereHunter_Info;
	permanent		= 0;
	description		= "Jak mog� zdoby� futra albo sk�ry?"; 
};

FUNC int  Org_855_Wolf_WhereHunter_Condition()
{	
if (Npc_KnowsInfo (hero , DIA_Wolf_Hello)) {
	return 1; };
};

FUNC void  Org_855_Wolf_WhereHunter_Info()
{
	AI_Output (other, self,"Org_855_Wolf_WhereHunter_15_00"); //Jak mog� zdoby� futra albo sk�ry?
	AI_Output (self, other,"Org_855_Wolf_WhereHunter_09_01"); //Przy drodze do Nowego Obozu kr�ci si� Aidan. On mo�e ci� nauczy�, jak �ci�ga� sk�r� ze zwierz�t.
	AI_Output (self, other,"Org_855_Wolf_WhereHunter_09_02"); //Ratford i Drax poluj� zwykle na p�noc od Starego Obozu, na drodze do miejsca wymiany.
};

//****************************************
//				Sell Armor
//****************************************

INSTANCE DIA_Wolf_SellArmor (C_INFO)
{
	npc			= ORG_855_Wolf;
	nr			= 700;
	condition	= DIA_Wolf_SellArmor_Condition;
	information	= DIA_Wolf_SellArmor_Info;
	permanent	= 1;
	description = "Potrzebuj� lepszej zbroi.";
};                       

FUNC INT DIA_Wolf_SellArmor_Condition()
{
	if ( (Npc_KnowsInfo(hero,DIA_Wolf_Hello)) 
	&& (!Npc_KnowsInfo(hero, Info_Wolf_ARMORFINISHED)) )
	{
		return 1;
	};
};

FUNC VOID DIA_Wolf_SellArmor_Info()
{
	AI_Output (other, self,"DIA_Wolf_SellArmor_15_00"); //Potrzebuj� lepszej zbroi.
	
	if ( (Npc_GetTrueGuild(other)==GIL_ORG) || (Npc_GetTrueGuild(other)==GIL_SLD) )
	{
		AI_Output (self, other,"DIA_Wolf_SellArmor_09_01"); //Teraz, kiedy jeste� jednym z nas, mog� ci jak�� sprzeda�.

		Info_ClearChoices 	(DIA_Wolf_SellArmor);
		Info_Addchoice 		(DIA_Wolf_SellArmor,DIALOG_BACK														,DIA_Wolf_SellArmor_BACK);
		Info_Addchoice 		(DIA_Wolf_SellArmor,B_BuildBuyArmorString(NAME_WolfBandits,VALUE_ORG_ARMOR_M),DIA_Wolf_SellArmor_M);
		Info_Addchoice 		(DIA_Wolf_SellArmor,B_BuildBuyArmorString(NAME_WolfHeavyBandits,VALUE_ORG_ARMOR_H)		,DIA_Wolf_SellArmor_H);
	}
	else
	{
		AI_Output (self, other,"DIA_Wolf_SellArmor_WRONGGUILD_09_00"); //Nie mog� ci nic sprzeda�. Lares zabi�by mnie, gdyby dowiedzia� si�, �e sprzedaj� zbroje obcym.
	};
};

func void DIA_Wolf_SellArmor_BACK()
{
	Info_ClearChoices 	(DIA_Wolf_SellArmor);
};

func void DIA_Wolf_SellArmor_M()
{
	AI_Output (other, self,"DIA_Wolf_SellArmor_M_15_01"); //Potrzebuj� wzmocnionego pancerza.
	
	if (Npc_HasItems (hero,ItMinugget)< VALUE_ORG_ARMOR_M)
	{
		AI_Output (self, other,"DIA_Wolf_SellArmor_M_09_02"); //Nie ma rudy, nie ma zbroi.
	}
	else 
	{
		AI_Output			(self, other,"DIA_Wolf_SellArmor_M_09_03"); //To solidny pancerz. Oczywi�cie nie tak dobry jak ten, kt�ry mam na sobie, ale zapewnia niez�� ochron�.

		B_GiveInvItems		(hero, self,ItMinugget,VALUE_ORG_ARMOR_M);
		
		CreateInvItem		(hero,ORG_ARMOR_M);
		
		CreateInvItem		(self, ItAmArrow);
		B_GiveInvItems      (self, hero, ItAmArrow, 1);
		Npc_RemoveInvItem	(hero, ItAmArrow);
	};
};

func void DIA_Wolf_SellArmor_H()
{
	AI_Output (other,self,"DIA_Wolf_SellArmor_H_15_01"); //Mo�esz mi sprzeda� ci�ki pancerz?

	if (Npc_HasItems (hero,ItMinugget) < VALUE_ORG_ARMOR_H) 
	{
		AI_Output (self, other,"DIA_Wolf_SellArmor_H_09_02"); //Nie ma rudy, nie ma zbroi.
	}
	else 
	{
		AI_Output			(self, other,"DIA_Wolf_SellArmor_H_09_03"); //Ta zbroja uchroni ci� przed ka�dym zagro�eniem. Sam tak� nosi�em, i jak dot�d nie zosta�em nawet dra�ni�ty. To bardzo solidny pancerz.

		B_GiveInvItems		(hero, self, ItMinugget,VALUE_ORG_ARMOR_H);
		
		CreateInvItem 		(hero,ORG_ARMOR_H);
		
		CreateInvItem		(self, ItAmArrow);
		B_GiveInvItems      (self, hero, ItAmArrow, 1);
		Npc_RemoveInvItem	(hero, ItAmArrow);
	};
};

/*------------------------------------------------------------------------
							BOGENSCHIESSEN	DAS ANGEBOT							
------------------------------------------------------------------------*/

instance  ORG_855_Wolf_TRAINOFFER (C_INFO)
{
	npc				= ORG_855_Wolf;
	nr				= 100;
	condition		= ORG_855_Wolf_TRAINOFFER_Condition;
	information		= ORG_855_Wolf_TRAINOFFER_Info;
	important		= 0;
	permanent		= 0;
	description		= "Chcia�bym nauczy� si� strzela� z �uku."; 
};

FUNC int  ORG_855_Wolf_TRAINOFFER_Condition()
{	
	if( Npc_GetTalentSkill (hero,NPC_TALENT_BOW) != 2) && (Npc_KnowsInfo (hero , DIA_Wolf_Hello)) 
	{
		return TRUE;
	};
};

FUNC void  ORG_855_Wolf_TRAINOFFER_Info()
{
	AI_Output (other, self,"ORG_855_Wolf_TRAINOFFER_Info_15_01"); //Chcia�bym nauczy� si� strzela� z �uku.
	AI_Output (self, other,"ORG_855_Wolf_TRAINOFFER_Info_09_02"); //C�, m�g�bym ci� nauczy�, ale to b�dzie kosztowa�. Ja te� musz� je��, no nie?
	AI_Output (other, self,"ORG_855_Wolf_TRAINOFFER_Info_15_03"); //Ile?
	AI_Output (self, other,"ORG_855_Wolf_TRAINOFFER_Info_09_04"); //50 bry�ek, bez targowania.
	
	Log_CreateTopic   	(GE_TeacherNC,	LOG_NOTE);
	B_LogEntry			(GE_TeacherNC,	"Najemnik imieniem Wilk mo�e mnie nauczy� strzelania z �uku.");
	
};  
/*------------------------------------------------------------------------
						BOGENSCHIESSEN		DIE ERSTE LEHRSTUNDE							
------------------------------------------------------------------------*/

instance  ORG_855_Wolf_TRAIN (C_INFO)
{
	npc				= ORG_855_Wolf;
	nr				= 100;
	condition		= ORG_855_Wolf_TRAIN_Condition;
	information		= ORG_855_Wolf_TRAIN_Info;
	important		= 0;
	permanent		= 0;
	description		= B_BuildLearnString(NAME_LearnBow_1,LPCOST_TALENT_BOW_1,50); 
};

FUNC int  ORG_855_Wolf_TRAIN_Condition()
{	
	if (Npc_KnowsInfo (hero,ORG_855_Wolf_TRAINOFFER))
	&& (Npc_GetTalentSkill (hero,NPC_TALENT_BOW) == 0)
	{
		return TRUE;
	};

};
FUNC void  ORG_855_Wolf_TRAIN_Info()
{
	AI_Output (other, self,"ORG_855_Wolf_TRAIN_Info_15_01"); //Naucz mnie strzela� z �uku.
	if (hero.attribute[ATR_Dexterity] >= 30)
	{
	if (Npc_HasItems (hero,ItMiNugget) >= 50) 
	{
		if B_GiveSkill(hero,NPC_TALENT_BOW,1,LPCOST_TALENT_BOW_1)
		{
			AI_Output (self, other,"ORG_855_Wolf_TRAIN_Info_09_02"); //Twoja celno�� zale�y g��wnie od twojej zr�czno�ci. Im bardziej zwinnie b�d� twoje ruchy, tym pewniej twoje strza�y b�d� trafia�y w cel.
			AI_Output (self, other,"ORG_855_Wolf_TRAIN_Info_09_03"); //Twoje umiej�tno�ci wp�yn� na odleg�o�� z jakiej b�dziesz m�g� skutecznie razi� wrog�w. Je�li chcesz kiedy� zosta� strzelcem wyborowym, musisz systematycznie rozwija� zar�wno zr�czno�� jak i umiej�tno�ci.
			B_GiveInvItems (hero, self, ItMiNugget,50);
		};
	};
	if B_GiveSkill (hero,NPC_TALENT_BOW,1,LPCOST_TALENT_BOW_1)
	{
	ORG_855_Wolf_TRAIN.permanent = false;
	}
	else 
	{
	ORG_855_Wolf_TRAIN.permanent = true;
			};
			}
	else
	{
	AI_Output			(self,other,"DIA_Wolf_NO_ENOUGHT_STR_1"); //Popracuj jeszcze nad swoj� zr�czno�ci�.
	PrintScreen	("Warunek: Zr�czno�� 30", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
	
};  
/*------------------------------------------------------------------------
						BOGENSCHIESSEN		DIE ZWEITE LEHRSTUNDE							
------------------------------------------------------------------------*/

instance  ORG_855_Wolf_TRAINAGAIN (C_INFO)
{
	npc				= ORG_855_Wolf;
	nr				= 100;
	condition		= ORG_855_Wolf_TRAINAGAIN_Condition;
	information		= ORG_855_Wolf_TRAINAGAIN_Info;
	important		= 0;
	permanent		= 0;
	description		= B_BuildLearnString(NAME_LearnBow_2,	LPCOST_TALENT_BOW_2,50); 
};

FUNC int  ORG_855_Wolf_TRAINAGAIN_Condition()
{	
	if (Npc_KnowsInfo (hero,ORG_855_Wolf_TRAINOFFER))
	&& (Npc_GetTalentSkill (hero,NPC_TALENT_BOW) == 1)
	{
		return TRUE;
	};

};
FUNC void  ORG_855_Wolf_TRAINAGAIN_Info()
{
	AI_Output (other, self,"ORG_855_Wolf_TRAINAGAIN_Info_15_01"); //Chcia�bym sprawniej pos�ugiwa� si� �ukiem.
		if (hero.attribute[ATR_Dexterity] >= 60)
	{
	if (Npc_HasItems (hero,ItMiNugget) >= 50) 
	{
		if B_GiveSkill(hero,NPC_TALENT_BOW,2,LPCOST_TALENT_BOW_2)
		{
			AI_Output (self, other,"ORG_855_Wolf_TRAINAGAIN_Info_09_02"); //Jeste� ju� ca�kiem niez�ym my�liwym. Teraz pora aby� pozna� reszt� najwa�niejszych informacji.
			AI_Output (self, other,"ORG_855_Wolf_TRAINAGAIN_Info_09_03"); //Dobry �ucznik bierze pod uwag� wiele czynnik�w zewn�trznych, ale robi to odruchowo, nie�wiadomie.
			AI_Output (self, other,"ORG_855_Wolf_TRAINAGAIN_Info_09_04"); //Odkryj tajniki funkcjonowania twojego oka, pami�taj o sile naci�gu i wyobra�aj sobie trajektori� lotu strza�y, ale przede wszystkim - zawsze b�d� czujny!
			AI_Output (self, other,"ORG_855_Wolf_TRAINAGAIN_Info_09_05"); //Opanowa�e� ju� wi�kszo�� tajnik�w strzelania z �uku. Teraz pozosta�o ci tylko rozwija� twoje umiej�tno�ci podczas polowania i walki.
			
			B_GiveInvItems (hero, self, ItMiNugget,50);
		};
	};
	if B_GiveSkill(hero,NPC_TALENT_BOW,2,LPCOST_TALENT_BOW_2)
	{
	ORG_855_Wolf_TRAINAGAIN.permanent = false;
	}
	else 
	{
	ORG_855_Wolf_TRAINAGAIN.permanent = true;
	
	};
				}
	else
	{
	AI_Output			(self,other,"DIA_Wolf_NO_ENOUGHT_STR_1"); //Popracuj jeszcze nad swoj� zr�czno�ci�.
	PrintScreen	("Warunek: Zr�czno�� 60", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
}; 
//---------------------------------------------------------------
//     					 DEX
//---------------------------------------------------------------
INSTANCE ORG_855_Wolf_Teach(C_INFO)
{
	npc			= ORG_855_Wolf;
	nr			= 100;
	condition	= ORG_855_Wolf_Teach_Condition;
	information	= ORG_855_Wolf_Teach_Info;
	permanent	= 1;
	description = "Mo�esz mnie czego� nauczy�?";
};                       

FUNC INT ORG_855_Wolf_Teach_Condition()
{
//	if (Npc_GetTrueGuild (hero) == GIL_GRD)  //fix 1.24 //lol bug piranii?
//	{
		return TRUE;
//	};
};

FUNC VOID ORG_855_Wolf_Teach_Info()
{
	AI_Output(other,self,"ORG_855_Wolf_Teach_15_00"); //Mo�esz mnie czego� nauczy�?
	AI_Output(self,other,"ORG_855_Wolf_Teach_09_01"); //Powodzenie podczas polowania zale�y przede wszystkim od twojej zr�czno�ci.
	
	if (log_wolftrain == FALSE)
	{
	Log_CreateTopic   	(GE_TeacherNC,LOG_NOTE);
	B_LogEntry			(GE_TeacherNC,"Najemnik imieniem Wilk mo�e pom�c mi zwi�kszy� moj� zwinno��.");
	log_wolftrain = TRUE;
	};
	
	Info_ClearChoices	(ORG_855_Wolf_Teach);
	Info_AddChoice		(ORG_855_Wolf_Teach,DIALOG_BACK									,ORG_855_Wolf_Teach_BACK);
	Info_AddChoice		(ORG_855_Wolf_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,ORG_855_Wolf_Teach_DEX_5);
	Info_AddChoice		(ORG_855_Wolf_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),ORG_855_Wolf_Teach_DEX_1);
};

func void ORG_855_Wolf_Teach_BACK()
{
	
	Info_ClearChoices	(ORG_855_Wolf_Teach);
};
func void ORG_855_Wolf_Teach_DEX_1()
{
	B_BuyAttributePoints (other, ATR_DEXTERITY, LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices	(ORG_855_Wolf_Teach);
	Info_AddChoice		(ORG_855_Wolf_Teach,DIALOG_BACK									,ORG_855_Wolf_Teach_BACK);
	Info_AddChoice		(ORG_855_Wolf_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,ORG_855_Wolf_Teach_DEX_5);
	Info_AddChoice		(ORG_855_Wolf_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0) ,ORG_855_Wolf_Teach_DEX_1);
};

func void ORG_855_Wolf_Teach_DEX_5()
{
	Mod_KupAtrybut (hero, ATR_DEXTERITY, 5);
	Info_ClearChoices	(ORG_855_Wolf_Teach);
	Info_AddChoice		(ORG_855_Wolf_Teach,DIALOG_BACK									,ORG_855_Wolf_Teach_BACK);
	Info_AddChoice		(ORG_855_Wolf_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),ORG_855_Wolf_Teach_DEX_5);
	Info_AddChoice		(ORG_855_Wolf_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),ORG_855_Wolf_Teach_DEX_1);
};




//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################


//---------------------------------------------------------------------
//	Info GOOD
//---------------------------------------------------------------------
INSTANCE Info_Wolf_GOOD (C_INFO)
{
	npc			= Org_855_Wolf;
	condition	= Info_Wolf_GOOD_Condition;
	information	= Info_Wolf_GOOD_Info;
	important	= 0;	
	permanent	= 0;
	description = "Gorn powiedzia�, �e chcesz ze mn� pilnie porozmawia�?";
};                       

FUNC INT Info_Wolf_GOOD_Condition()
{
	if	Gorn_GotoWolf
	{
		return TRUE;
	};
};

func VOID Info_Wolf_GOOD_Info()
{
	AI_Output 			(hero,self,"Info_Wolf_GOOD_15_01"); //Gorn powiedzia�, �e chcesz ze mn� pilnie porozmawia�?
	AI_Output 			(self,hero,"Info_Wolf_GOOD_09_02"); //Dobrze, �e zd��y�e� zajrze� do mnie przed wymarszem!
	if (!Npc_KnowsInfo(hero,Info_Gorn_FMCENTRANCE))
	{
		AI_Output 			(hero,self,"Info_Wolf_GOOD_15_03"); //Przed jakim wymarszem?
		AI_Output 			(self,hero,"Info_Wolf_GOOD_09_04"); //Przed waszym wymarszem do Niezupe�nie-Wolnej-Kopalni.
	};
};

//---------------------------------------------------------------------
//	Info SPEAK
//---------------------------------------------------------------------
INSTANCE Info_Wolf_SPEAK (C_INFO)
{
	npc			= Org_855_Wolf;
	condition	= Info_Wolf_SPEAK_Condition;
	information	= Info_Wolf_SPEAK_Info;
	important	= 0;	
	permanent	= 0;
	description = "O co chodzi?";
};                       

FUNC INT Info_Wolf_SPEAK_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Wolf_GOOD)
	{
		return TRUE;
	};
};

func VOID Info_Wolf_SPEAK_Info()
{
	AI_Output 			(hero,self,"Info_Wolf_SPEAK_15_01"); //O co chodzi?
	AI_Output 			(self,hero,"Info_Wolf_SPEAK_09_02"); //Mam pomys� na zupe�nie nowy rodzaj pancerza.
	AI_Output 			(hero,self,"Info_Wolf_SPEAK_15_03"); //Czy�by? A c� to za pomys�?
	AI_Output 			(self,hero,"Info_Wolf_SPEAK_09_04"); //Pancerze pe�zaczy s� niezwykle twarde. Znacznie trwalsze ni� cho�by stal.
	AI_Output 			(self,hero,"Info_Wolf_SPEAK_09_05"); //Oczywi�cie nie mam tu na my�li tych wychudzonych osobnik�w, kt�re nawiedza�y zawalon� kopalni� Gomeza...
	AI_Output 			(self,hero,"Info_Wolf_SPEAK_09_06"); //... O nie, one nie wystarcz�. W NASZEJ kopalni �yj� PRAWDZIWE PE�ZACZE. Wi�ksze, silniejsze i jeszcze bardziej wredne.
	AI_Output 			(self,hero,"Info_Wolf_SPEAK_09_07"); //Pancerz tych bestii jest niemal nie do przebicia!
	AI_Output 			(self,hero,"Info_Wolf_SPEAK_09_08"); //Gdyby� m�g� mi przynie�� kilka p�ytek z ich pancerzy, m�g�bym z nich posk�ada� nie lada zbroj�!
};

//---------------------------------------------------------------------
//	Info SKIN
//---------------------------------------------------------------------
INSTANCE Info_Wolf_SKIN (C_INFO)
{
	npc			= Org_855_Wolf;
	condition	= Info_Wolf_SKIN_Condition;
	information	= Info_Wolf_SKIN_Info;
	important	= 0;	
	permanent	= 0;
	description = "W jaki spos�b mam oddzieli� te p�ytki od zw�ok pe�zaczy?";
};                       

FUNC INT Info_Wolf_SKIN_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Wolf_SPEAK)
	{
		return TRUE;
	};
};

func VOID Info_Wolf_SKIN_Info()
{
	AI_Output 			(hero,self,"Info_Wolf_SKIN_15_01"); //W jaki spos�b mam oddzieli� te p�ytki od zw�ok pe�zaczy?
	AI_Output 			(self,hero,"Info_Wolf_SKIN_09_02"); //To proste. P�ytki na grzbiecie przymocowane s� tylko przy kraw�dziach.
	AI_Output 			(self,hero,"Info_Wolf_SKIN_09_03"); //Wystarczy wzi�� ostry n� i "ci�� wzd�u� przerywanej linii".
	AI_Output 			(hero,self,"Info_Wolf_SKIN_15_04"); //W porz�dku. Postaram si� przynie�� ci kilka p�ytek z pancerzy pe�zaczy.

	Knows_GetMCPlates = TRUE;
	PrintScreen	("Nowa umiej�tno��: Wycinanie p�ytek pancerza", -1,-1,"FONT_OLD_20_WHITE.TGA",3);
	
	Log_CreateTopic		(CH4_MCPlateArmor,	LOG_MISSION);
	Log_SetTopicStatus	(CH4_MCPlateArmor,	LOG_RUNNING);
	B_LogEntry			(CH4_MCPlateArmor,	"Wilk, Najemnik z Nowego Obozu, zaproponowa� mi wykonanie zbroi z pancerzy pe�zaczy. Pokaza� mi jak nale�y je usuwa� z martwych potwor�w."); 
	
	Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
	B_LogEntry (GE_AnimalTrophies,"Umiej�tno�� usuwania pancerzy z martwych pe�zaczy-wojownik�w.");

	AI_StopProcessInfos	(self);
};

//---------------------------------------------------------------------
//	Info PROFIT
//---------------------------------------------------------------------
INSTANCE Info_Wolf_PROFIT (C_INFO)
{
	npc			= Org_855_Wolf;
	condition	= Info_Wolf_PROFIT_Condition;
	information	= Info_Wolf_PROFIT_Info;
	important	= 0;	
	permanent	= 0;
	description = "I m�wisz mi to wszystko nie ��daj�c niczego w zamian?";
};                       

FUNC INT Info_Wolf_PROFIT_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Wolf_SPEAK)
	{
		return TRUE;
	};
};

func VOID Info_Wolf_PROFIT_Info()
{
	AI_Output 			(hero,self,"Info_Wolf_PROFIT_15_01"); //I m�wisz mi to wszystko nie ��daj�c niczego w zamian?
	AI_Output 			(self,hero,"Info_Wolf_PROFIT_09_02"); //No niezupe�nie... Je�li uda mi si� skleci� z tych p�ytek porz�dn� zbroj�, b�d�... bardzo szybko... bardzo du�o... Ach, niewa�ne!
};

//---------------------------------------------------------------------
//	Info MCPLATESFEW
//---------------------------------------------------------------------
INSTANCE Info_Wolf_MCPLATESFEW (C_INFO)
{
	npc			= Org_855_Wolf;
	condition	= Info_Wolf_MCPLATESFEW_Condition;
	information	= Info_Wolf_MCPLATESFEW_Info;
	important	= 0;	
	permanent	= 0;
	description = "Przynios�em ci kilka tych p�ytek, o kt�re prosi�e�!";
};                       

FUNC INT Info_Wolf_MCPLATESFEW_Condition()
{
	if	(Knows_GetMCPlates)
	&&	(Npc_HasItems(hero, ItAt_Crawler_02) > 0)
	&&	(Npc_HasItems(hero, ItAt_Crawler_02) < 15)
	{
		return TRUE;
	};
};

func VOID Info_Wolf_MCPLATESFEW_Info()
{
	AI_Output 			(hero,self,"Info_Wolf_MCPLATESFEW_15_01"); //Przynios�em ci kilka tych p�ytek, o kt�re prosi�e�!
	AI_Output 			(self,hero,"Info_Wolf_MCPLATESFEW_09_02"); //To za ma�o! Nie starczy na ca�� zbroj�!
	AI_Output 			(self,hero,"Info_Wolf_MCPLATESFEW_09_03"); //Przynie� mi wi�cej p�ytek!
};

//---------------------------------------------------------------------
//	Info MCPLATESENOUGH
//---------------------------------------------------------------------
INSTANCE Info_Wolf_MCPLATESENOUGH (C_INFO)
{
	npc			= Org_855_Wolf;
	condition	= Info_Wolf_MCPLATESENOUGH_Condition;
	information	= Info_Wolf_MCPLATESENOUGH_Info;
	important	= 0;	
	permanent	= 0;
	description = "Zebra�em mn�stwo p�ytek z pancerzy pe�zaczy!";
};                       

FUNC INT Info_Wolf_MCPLATESENOUGH_Condition()
{
	if	(Knows_GetMCPlates)
	&&	(Npc_HasItems(hero, ItAt_Crawler_02) >= 15)
	{
		return TRUE;
	};
};

func VOID Info_Wolf_MCPLATESENOUGH_Info()
{
	AI_Output 			(hero,self,"Info_Wolf_MCPLATESENOUGH_15_01"); //Zebra�em mn�stwo p�ytek z pancerzy pe�zaczy!
	AI_Output 			(self,hero,"Info_Wolf_MCPLATESENOUGH_09_02"); //Fantastycznie! Natychmiast zabieram si� do roboty!
	AI_Output 			(hero,self,"Info_Wolf_MCPLATESENOUGH_15_03"); //Jak d�ugo to zajmie?
	AI_Output 			(self,hero,"Info_Wolf_MCPLATESENOUGH_09_04"); //Nie mam poj�cia. To co� zupe�nie nowego. Jeszcze nigdy czego� takiego nie robi�em!
	AI_Output 			(self,hero,"Info_Wolf_MCPLATESENOUGH_09_05"); //B�dziesz musia� zagl�da� do mnie od czasu do czasu.
/*
	//mod
	AI_Output 			(self,hero,"Info_Wolf_MCPLATESENOUGH_09_06"); //Oczekuj�c mo�esz te� zajrze� na pola ry�owe. Podobno dzieje si� tam co� niepokoj�cego.
	AI_Output 			(self,hero,"Info_Wolf_MCPLATESENOUGH_09_07"); //Lewus nie mo�e zapanowa� nad sytuacj�. Oczywi�cie nie musisz mu pomaga�.
	AI_Output 			(self,hero,"Info_Wolf_MCPLATESENOUGH_09_08"); //Tak tylko m�wi�, co si� dzieje w obozie...
	
	if (Mod_Story_RunRebelInNC == FALSE)
	{
	B_Story_BauRebellion ();
	};
*/
	MCPlatesDelivered = TRUE;

	B_LogEntry			(CH4_MCPlateArmor,	"Da�em Wilkowi 15 tych p�ytek z pancerzy. Teraz potrzebuje troch� czasu, �eby sporz�dzi� z nich dla mnie now� zbroj�.");
	B_GiveXP			(XP_DeliveredMCPlates);
	
	B_GiveInvItems	(hero, self, ItAt_Crawler_02,	15);
	AI_StopProcessInfos	(self);
};

//---------------------------------------------------------------------
//	Info ARMORINWORK
//---------------------------------------------------------------------
INSTANCE Info_Wolf_ARMORINWORK (C_INFO)
{
	npc			= Org_855_Wolf;
	condition	= Info_Wolf_ARMORINWORK_Condition;
	information	= Info_Wolf_ARMORINWORK_Info;
	important	= 0;	
	permanent	= 1;
	description = "Jak post�puj� prace nad nowym pancerzem?";
};                       

FUNC INT Info_Wolf_ARMORINWORK_Condition()
{
	if	(MCPlatesDelivered			== TRUE)
	&&	(FreemineOrc_LookingUlumulu	!= LOG_SUCCESS)
	{
		return TRUE;
	};
};

func VOID Info_Wolf_ARMORINWORK_Info()
{
	AI_Output 			(hero,self,"Info_Wolf_ARMORINWORK_15_01"); //Jak post�puj� prace nad nowym pancerzem?
	AI_Output 			(self,hero,"Info_Wolf_ARMORINWORK_09_02"); //To zajmie d�u�ej ni� my�la�em! Te p�ytki s� niezwykle twarde. Nie bardzo wiem jak mam je ze sob� po��czy�!
	AI_Output 			(self,hero,"Info_Wolf_ARMORINWORK_09_03"); //Daj mi jeszcze troch� czasu! Dam rad�, zaufaj mi!
	AI_StopProcessInfos	(self);
};

//---------------------------------------------------------------------
//	Info ARMORFINISHED
//---------------------------------------------------------------------
INSTANCE Info_Wolf_ARMORFINISHED (C_INFO)
{
	npc			= Org_855_Wolf;
	condition	= Info_Wolf_ARMORFINISHED_Condition;
	information	= Info_Wolf_ARMORFINISHED_Info;
	important	= 0;	
	permanent	= 0;
	description = "Jak post�puj� prace nad nowym pancerzem?";
};                       

FUNC INT Info_Wolf_ARMORFINISHED_Condition()
{
	if	(MCPlatesDelivered			== TRUE)
	&&	(FreemineOrc_LookingUlumulu	== LOG_SUCCESS)
	{
		return TRUE;
	};
};

func VOID Info_Wolf_ARMORFINISHED_Info()
{
	AI_Output 			(hero,self,"Info_Wolf_ARMORFINISHED_15_01"); //Jak post�puj� prace nad nowym pancerzem?
	AI_Output 			(self,hero,"Info_Wolf_ARMORFINISHED_09_02"); //Uda�o mi si� wreszcie znale�� spos�b na po��czenie p�ytek ze sob�!
	AI_Output 			(hero,self,"Info_Wolf_ARMORFINISHED_15_03"); //Czy to znaczy, �e zbroja jest ju� gotowa!
	AI_Output 			(self,hero,"Info_Wolf_ARMORFINISHED_09_04"); //Dok�adnie! Oto i ona! Jest twardsza ni� jakikolwiek pancerz jaki widzia�em na oczy!
	AI_Output 			(hero,self,"Info_Wolf_ARMORFINISHED_15_05"); //Dzi�ki, jestem twoim d�u�nikiem!
	AI_Output 			(self,hero,"Info_Wolf_ARMORFINISHED_09_06"); //Nie ma o czym m�wi�! Na pewno na tym nie strac�! Co to, to nie! Ha Ha!

	B_LogEntry			(CH4_MCPlateArmor,	"Wilk sko�czy� ju� moj� now� zbroj�. To najlepszy pancerz, jaki w �yciu widzia�em!");
	Log_SetTopicStatus	(CH4_MCPlateArmor,	LOG_SUCCESS);

	B_GiveXP			(XP_GorMCPlateArmor);

	CreateInvItem		(self, CRW_ARMOR_H);
	B_GiveInvItems      (self,hero,CRW_ARMOR_H,1);
};

/*------------------------------------------------------------------------
						BOGEN KAUFEN						
------------------------------------------------------------------------*/

instance  Org_855_Wolf_SELLBOW (C_INFO)
{
	npc				= Org_855_Wolf;
	condition		= Org_855_Wolf_SELLBOW_Condition;
	information		= Org_855_Wolf_SELLBOW_Info;
	important		= 0;
	permanent		= 0;
	description		= "Gdzie mog� kupi� jaki� �uk?"; 
};

FUNC int  Org_855_Wolf_SELLBOW_Condition()
{
	return TRUE;
};
FUNC void  Org_855_Wolf_SELLBOW_Info()
{
	AI_Output (other, self,"Org_855_Wolf_SELLBOW_Info_15_01"); //Gdzie mog� kupi� jaki� �uk?
	AI_Output (self, other,"Org_855_Wolf_SELLBOW_Info_09_02"); //Trafi�e� pod w�a�ciwy adres. Mam tu dobry towar za bardzo przyst�pne ceny.
	Log_CreateTopic   	(GE_TraderNC,LOG_NOTE);
	B_LogEntry			(GE_TraderNC,"Najemnik imieniem Wilk sprzedaje �uki.");

};  

//========================================
//-----------------> ZaparcieNajemnikow
//========================================

INSTANCE DIA_Wolf_ZaparcieNajemnikow (C_INFO)
{
   npc          = ORG_855_Wolf;
   nr           = 1;
   condition    = DIA_Wolf_ZaparcieNajemnikow_Condition;
   information  = DIA_Wolf_ZaparcieNajemnikow_Info;
   permanent	= FALSE;
   description	= "Szukam poparcia Najemnik�w.";
};

FUNC INT DIA_Wolf_ZaparcieNajemnikow_Condition()
{
	if (MIS_OpinionInNewCamp == LOG_RUNNING)
    && (Npc_GetTrueGuild(hero) == GIL_SFB) 
    {
    return TRUE;
    };
};


FUNC VOID DIA_Wolf_ZaparcieNajemnikow_Info()
{
    AI_Output (other, self ,"DIA_Wolf_ZaparcieNajemnikow_15_01"); //Szukam poparcia Najemnik�w.
    AI_Output (self, other ,"DIA_Wolf_ZaparcieNajemnikow_03_02"); //I dlatego przyszed�e� do mnie?
    AI_Output (other, self ,"DIA_Wolf_ZaparcieNajemnikow_15_03"); //Tak. Wspomnia� mi o tobie Jarvis.
    AI_Output (self, other ,"DIA_Wolf_ZaparcieNajemnikow_03_04"); //Ach, Jarvis powiadasz. No dobrze. Mam znale�� dla ciebie jakie� zadanie?
    AI_Output (other, self ,"DIA_Wolf_ZaparcieNajemnikow_15_05"); //By�oby mi�o.
    AI_Output (self, other ,"DIA_Wolf_ZaparcieNajemnikow_03_06"); //Dobrze wi�c. Akurat przypomnia�a mi si� pewna historia.
    AI_Output (self, other ,"DIA_Wolf_ZaparcieNajemnikow_15_07"); //Trzy lata temu zgubi�em gdzie� w okolicy moj� ozdobn� kling�.
    AI_Output (self, other ,"DIA_Wolf_ZaparcieNajemnikow_03_08"); //M�g�by� jej poszuka�. By�a srebrna.
    AI_Output (other, self ,"DIA_Wolf_ZaparcieNajemnikow_15_09"); //Postaram si� j� znale��.
    MIS_KilnagaWolfa = LOG_RUNNING;

    Log_CreateTopic            (CH1_KilnagaWolfa, LOG_MISSION);
    Log_SetTopicStatus       (CH1_KilnagaWolfa, LOG_RUNNING);
    B_LogEntry                     (CH1_KilnagaWolfa,"Wilk poleci� mi odnale�� swoj� ozdobn� kling�. Zgubi� j� w okolicach Nowego Obozu. Poznam j� po srebrnym kolorze.");
};

//========================================
//-----------------> FindSword
//========================================

INSTANCE DIA_Wolf_FindSword (C_INFO)
{
   npc          = ORG_855_Wolf;
   nr           = 92;
   condition    = DIA_Wolf_FindSword_Condition;
   information  = DIA_Wolf_FindSword_Info;
   permanent	= FALSE;
   description	= "Mam twoj� zgub�.";
};

FUNC INT DIA_Wolf_FindSword_Condition()
{
    if (MIS_KilnagaWolfa == LOG_RUNNING)
    && (Npc_HasItems (other, ItMi_OzdobnaKlinga) >=1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Wolf_FindSword_Info()
{
    AI_Output (other, self ,"DIA_Wolf_FindSword_15_01"); //Mam twoj� zgub�.
    AI_Output (self, other ,"DIA_Wolf_FindSword_03_02"); //Naprawd� j� znalaz�e�?
    AI_Output (other, self ,"DIA_Wolf_FindSword_15_03"); //Tak. Prosz�, oto ona.
    AI_Output (other, self ,"DIA_Wolf_FindSword_15_04"); //Le�a�a w pobli�u jakich� szcz�tek.
    AI_Output (self, other ,"DIA_Wolf_FindSword_03_05"); //Domy�lam si� kto to by�...
    AI_Output (self, other ,"DIA_Wolf_FindSword_03_06"); //Chciwo�� potrafi zniszczy� nawet z pozoru siln� przyja��. Zapami�taj to, ch�opcze.
    AI_Output (self, other ,"DIA_Wolf_FindSword_03_07"); //Mo�esz liczy� na moje poparcie. Potrzebujemy takich ludzi. We� tak�e ten �uk.
    B_LogEntry                     (CH1_KilnagaWolfa,"Znalaz�em zgub� Wilka. Zosta�a mu dawno skradziona przez przyjaciela. Uda�o mi si� zyska� poparcie kolejnego Najemnika.");
    Log_SetTopicStatus       (CH1_KilnagaWolfa, LOG_SUCCESS);
    MIS_KilnagaWolfa = LOG_SUCCESS;
	CreateInvItems (self, ItRw_Bow_Long_03, 1);
    B_GiveInvItems (self, other, ItRw_Bow_Long_03, 1);
	B_GiveInvItems (hero, self, ItMi_OzdobnaKlinga, 1);
	Npc_RemoveInvItems (self, ItMi_OzdobnaKlinga,1);
    B_GiveXP (175);
};


//========================================
//-----------------> DOSTAWA_LOWCOW
//========================================

INSTANCE DIA_Wolf_DOSTAWA_LOWCOW (C_INFO)
{
   npc          = ORG_855_Wolf;
   nr           = 1;
   condition    = DIA_Wolf_DOSTAWA_LOWCOW_Condition;
   information  = DIA_Wolf_DOSTAWA_LOWCOW_Info;
   permanent	= FALSE;
   description	= "Przychodz� po dostaw� dla �owc�w ork�w.";
};

FUNC INT DIA_Wolf_DOSTAWA_LOWCOW_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Rakus_QUEST1_RAKUS))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Wolf_DOSTAWA_LOWCOW_Info()
{
    AI_Output (other, self ,"DIA_Wolf_DOSTAWA_LOWCOW_15_01"); //Przychodz� po dostaw� dla �owc�w ork�w.
    AI_Output (self, other ,"DIA_Wolf_DOSTAWA_LOWCOW_03_02"); //Zaszed�e� a� tak daleko? Jestem w szoku. Chyba �le ci� oceni�em.
    AI_Output (other, self ,"DIA_Wolf_DOSTAWA_LOWCOW_15_03"); //Ostatnio coraz cz�ciej to s�ysz�, ale do rzeczy.
    AI_Output (self, other ,"DIA_Wolf_DOSTAWA_LOWCOW_03_04"); //Ano tak. Dostawa... Hmm... Nale�y si� 400 bry�ek rudy.

    Info_ClearChoices		(DIA_Wolf_DOSTAWA_LOWCOW);
    Info_AddChoice		(DIA_Wolf_DOSTAWA_LOWCOW, "Ojej. Chyba gdzie� mi zgin�o kilka bry�ek... Wr�c� p�niej. ", DIA_Wolf_DOSTAWA_LOWCOW_UPS_ZAGINELO);
    Info_AddChoice		(DIA_Wolf_DOSTAWA_LOWCOW, "Mo�e si� potargujemy? ", DIA_Wolf_DOSTAWA_LOWCOW_TARGUJ_SIE);
    Info_AddChoice		(DIA_Wolf_DOSTAWA_LOWCOW, "No dobra. Masz rud�. Dawaj dostaw�!", DIA_Wolf_DOSTAWA_LOWCOW_DAWAJ);
};

FUNC VOID DIA_Wolf_DOSTAWA_LOWCOW_UPS_ZAGINELO()
{
    AI_Output (other, self ,"DIA_Wolf_DOSTAWA_LOWCOW_UPS_ZAGINELO_15_01"); //Ojej. Chyba gdzie� mi zgin�o kilka bry�ek... Wr�c� p�niej. 
    AI_Output (self, other ,"DIA_Wolf_DOSTAWA_LOWCOW_UPS_ZAGINELO_03_02"); //Ha ha ha! Tylko wr�� w tym miesi�cu, bo �owcy nie wytrzymaj� d�ugo bez jedzenia.
    AI_Output (other, self ,"DIA_Wolf_DOSTAWA_LOWCOW_UPS_ZAGINELO_15_03"); //Z pewno�ci� co� sobie przyrz�dz�.
    AI_Output (self, other ,"DIA_Wolf_DOSTAWA_LOWCOW_UPS_ZAGINELO_03_04"); //Ha! Z pewno�ci� orka.
    B_LogEntry                     (CH5_FoodForHunters,"W moim ekwipunku jest niez�y ba�agan. Gdzie ja podzia�em te 400 bry�ek rudy. Hmmm...");
    Info_ClearChoices		(DIA_Wolf_DOSTAWA_LOWCOW);
    AI_StopProcessInfos	(self);
};

FUNC VOID DIA_Wolf_DOSTAWA_LOWCOW_TARGUJ_SIE()
{
	oplata_wolfa = 400;
    AI_Output (other, self ,"DIA_Wolf_DOSTAWA_LOWCOW_TARGUJ_SIE_15_01"); //Mo�e si� potargujemy? 
    if (MIS_KilnagaWolfa == LOG_SUCCESS)
    {
        AI_Output (self, other ,"DIA_Wolf_DOSTAWA_LOWCOW_TARGUJ_SIE_03_02"); //No dobra. Odnalaz�e� moj� star� kling�. Spuszcz� z ceny o 50 bry�ek. 
        AI_Output (self, other ,"DIA_Wolf_DOSTAWA_LOWCOW_TARGUJ_SIE_03_03"); //Jak chcesz wi�cej to b�d� mia� dla ciebie zadanie.
        AI_Output (other, self ,"DIA_Wolf_DOSTAWA_LOWCOW_TARGUJ_SIE_15_04"); //Co konkretnie mam zrobi�?
        AI_Output (self, other ,"DIA_Wolf_DOSTAWA_LOWCOW_TARGUJ_SIE_03_05"); //Butch... Kojarzysz typa? Nie zap�aci� mi za ci�k� zbroj�. Odzyskaj moj� rud�.
        AI_Output (other, self ,"DIA_Wolf_DOSTAWA_LOWCOW_TARGUJ_SIE_15_06"); //W porz�dku. 
        B_LogEntry                     (CH5_FoodForHunters,"Wilk spu�ci� mi cen� o 50 bry�ek, bo odnalaz�em kiedy� jego kling�. Je�li chc�, �eby Wilk spu�ci� mi cen� o kolejne bry�ki to musz� nam�wi� Butcha do oddania d�ugu za ci�k� zbroj� Szkodnika. ");
		pancerz_bustera = true;
		oplata_wolfa = oplata_wolfa - 50;
    }
    else
    {
        AI_Output (self, other ,"DIA_Wolf_DOSTAWA_LOWCOW_TARGUJ_SIE_03_07"); //No dobra b�d� mia� dla ciebie zadanie.
        AI_Output (other, self ,"DIA_Wolf_DOSTAWA_LOWCOW_TARGUJ_SIE_15_08"); //Co konkretnie mam zrobi�?
        AI_Output (self, other ,"DIA_Wolf_DOSTAWA_LOWCOW_TARGUJ_SIE_03_09"); //Butch... Kojarzysz typa? Nie zap�aci� mi za ci�k� zbroj�. Odzyskaj moj� rud�.
        AI_Output (other, self ,"DIA_Wolf_DOSTAWA_LOWCOW_TARGUJ_SIE_15_10"); //Spr�buj�.
		B_LogEntry                     (CH5_FoodForHunters,"Je�li chc�, �eby Wilk spu�ci� mi cen� o kolejne bry�ki to musz� nam�wi� Butcha do oddania d�ugu za ci�k� zbroj� Szkodnika. ");
		pancerz_bustera = true;
    };
    Info_ClearChoices		(DIA_Wolf_DOSTAWA_LOWCOW);
    AI_StopProcessInfos	(self);
};

FUNC VOID DIA_Wolf_DOSTAWA_LOWCOW_DAWAJ()
{
    AI_Output (other, self ,"DIA_Wolf_DOSTAWA_LOWCOW_DAWAJ_15_01"); //No dobra. Masz rud�. Dawaj dostaw�!
    AI_Output (self, other ,"DIA_Wolf_DOSTAWA_LOWCOW_DAWAJ_03_02"); //Oto paczka z �ywno�ci�.
    B_GiveInvItems (other, self, ItMiNugget, 400);
    CreateInvItems (self, foodlowcow, 1);
    B_GiveInvItems (self, other, foodlowcow, 1);
    Info_ClearChoices		(DIA_Wolf_DOSTAWA_LOWCOW);
    AI_StopProcessInfos	(self);
    B_LogEntry                     (CH5_FoodForHunters,"Bez �adnych ceregieli odebra�em dostaw�. ");

    B_GiveXP (150);
};



//========================================
//-----------------> ZAPLATA_PANCERZ
//========================================

INSTANCE DIA_Wolf_ZAPLATA_PANCERZ (C_INFO)
{
   npc          = ORG_855_Wolf;
   nr           = 1;
   condition    = DIA_Wolf_ZAPLATA_PANCERZ_Condition;
   information  = DIA_Wolf_ZAPLATA_PANCERZ_Info;
   permanent	= FALSE;
   description	= "Mam rud� za pancerz.";
};

FUNC INT DIA_Wolf_ZAPLATA_PANCERZ_Condition()
{
    if ((Npc_KnowsInfo (hero, DIA_Butch_ISIDRO)) || (Npc_KnowsInfo (hero, DIA_Butch_BUSTER_LOSE)))
    && (Npc_HasItems (hero, ItMiNugget)>=1500)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Wolf_ZAPLATA_PANCERZ_Info()
{
    AI_Output (other, self ,"DIA_Wolf_ZAPLATA_PANCERZ_15_01"); //Mam rud� za pancerz.
    AI_Output (self, other ,"DIA_Wolf_ZAPLATA_PANCERZ_03_02"); //Dobrze. Dawaj. Obni�� cen� o 100 bry�ek rudy. 
    B_GiveInvItems (other, self, ItMiNugget, 1500);
    B_LogEntry                     (CH5_FoodForHunters,"Odnios�em rud� Wilkowi. Obni�y� cen� o 100 bry�ek.");

    B_GiveXP (100);
	oplata_wolfa = oplata_wolfa - 100;
};


//========================================
//-----------------> ODBIEZR_DOSTAWE
//========================================

INSTANCE DIA_Wolf_ODBIEZR_DOSTAWE (C_INFO)
{
   npc          = ORG_855_Wolf;
   nr           = 1;
   condition    = DIA_Wolf_ODBIEZR_DOSTAWE_Condition;
   information  = DIA_Wolf_ODBIEZR_DOSTAWE_Info;
   permanent	= FALSE;
   description	= "Daj mi t� dostaw�.";
};

FUNC INT DIA_Wolf_ODBIEZR_DOSTAWE_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Wolf_ZAPLATA_PANCERZ))
    && (MIS_FoodForHunters == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Wolf_ODBIEZR_DOSTAWE_Info()
{
    AI_Output (other, self ,"DIA_Wolf_ODBIEZR_DOSTAWE_15_01"); //Daj mi t� dostaw�.
    AI_Output (self, other ,"DIA_Wolf_ODBIEZR_DOSTAWE_03_02"); //Zobaczmy.
    AI_Output (self, other ,"DIA_Wolf_ODBIEZR_DOSTAWE_03_03"); //Pomog�e� mi odzyska� rud�. Obni�� wi�c zap�at� za dostaw� o 100 bry�ek.
    if (MIS_KilnagaWolfa == LOG_SUCCESS)
    {
        AI_Output (self, other ,"DIA_Wolf_ODBIEZR_DOSTAWE_03_04"); //Odnalaz�e� te� moj� kling�.
        if (Npc_HasItems (hero, ItMiNugget)>=250)
        {
            AI_Output (self, other ,"DIA_Wolf_ODBIEZR_DOSTAWE_03_05"); //Masz dostaw�. Daj mi 250 bry�ek rudy jako wynagrodzenie.

            B_GiveInvItems (other, self, ItMiNugget, 250);
            CreateInvItems (self, foodlowcow, 1);
            B_GiveInvItems (self, other, foodlowcow, 1);
            B_LogEntry                     (CH5_FoodForHunters,"Za dostaw� musia�em zap�aci� 250 bry�ek rudy. Reszta jest moja. Mog� wreszcie wr�ci� do obozu �owc�w. ");

            B_GiveXP (250);
        }
        else
        {
            AI_Output (self, other ,"DIA_Wolf_ODBIEZR_DOSTAWE_03_06"); //Chcia�em ju� za�atwi� t� spraw�, ale patrz�c na twoj� sakiewk� widz�, �e i tak brakuje ci rudy.
            AI_Output (self, other ,"DIA_Wolf_ODBIEZR_DOSTAWE_03_07"); //Cholera. Jak mo�na by� tak niedba�ym. Przyjd� jak b�dziesz mia� te 250 bry�ek.
            znowu_250_odebrac = true;
        };
    }
else 
{
    if (Npc_HasItems (hero, ItMiNugget)>=300)
    {
        AI_Output (self, other ,"DIA_Wolf_ODBIEZR_DOSTAWE_03_08"); //Widz�, �e masz te 300 bry�ek rudy. Dawaj i ko�czmy te wymian�.
        B_LogEntry                     (CH5_FoodForHunters,"Za dostaw� musia�em zap�aci� 300 bry�ek rudy. Reszta jest moja. Mog� wreszcie wr�ci� do obozu �owc�w. ");

        B_GiveXP (200);
        CreateInvItems (self, foodlowcow, 1);
        B_GiveInvItems (self, other, foodlowcow, 1);
        B_GiveInvItems (other, self, ItMiNugget, 300);
    }
    else
    {
        AI_Output (self, other ,"DIA_Wolf_ODBIEZR_DOSTAWE_03_09"); //Chcia�em ju� za�atwi� t� spraw�, ale patrz�c na twoj� sakiewk� widz�, �e i tak brakuje ci rudy.
        AI_Output (self, other ,"DIA_Wolf_ODBIEZR_DOSTAWE_03_10"); //Cholera. Jak mo�na by� tak niedba�ym. Przyjd� jak b�dziesz mia� te 300 bry�ek.
         znowu_300_odebrac = true;
    };
};
};

//========================================
//-----------------> RUDA_DRUGI_RAZ
//========================================

INSTANCE DIA_Wolf_RUDA_DRUGI_RAZ (C_INFO)
{
   npc          = ORG_855_Wolf;
   nr           = 2;
   condition    = DIA_Wolf_RUDA_DRUGI_RAZ_Condition;
   information  = DIA_Wolf_RUDA_DRUGI_RAZ_Info;
   permanent	= FALSE;
   description	= "Dobra. Tym razem mam 250 bry�ek.";
};

FUNC INT DIA_Wolf_RUDA_DRUGI_RAZ_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Wolf_ODBIEZR_DOSTAWE))
    && (Npc_HasItems (hero, ItMiNugget)>=250)
    && (znowu_250_odebrac == true)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Wolf_RUDA_DRUGI_RAZ_Info()
{
    AI_Output (other, self ,"DIA_Wolf_RUDA_DRUGI_RAZ_15_01"); //Dobra. Tym razem mam 250 bry�ek.
    AI_Output (self, other ,"DIA_Wolf_RUDA_DRUGI_RAZ_03_02"); //Dawaj je. Masz dostaw�. 
    B_GiveInvItems (other, self, ItMiNugget, 300);
    CreateInvItems (self, foodlowcow, 1);
    B_GiveInvItems (self, other, foodlowcow, 1);
    B_LogEntry                     (CH5_FoodForHunters,"Za dostaw� musia�em zap�aci� 250 bry�ek rudy. Reszta jest moja. Mog� wreszcie wr�ci� do obozu �owc�w. ");

    B_GiveXP (270);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> 300_BRYLEK_ZAPLATY
//========================================

INSTANCE DIA_Wolf_300_BRYLEK_ZAPLATY (C_INFO)
{
   npc          = ORG_855_Wolf;
   nr           = 3;
   condition    = DIA_Wolf_300_BRYLEK_ZAPLATY_Condition;
   information  = DIA_Wolf_300_BRYLEK_ZAPLATY_Info;
   permanent	= FALSE;
   description	= "Mam ju� te 300 bry�ek.";
};

FUNC INT DIA_Wolf_300_BRYLEK_ZAPLATY_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Wolf_ODBIEZR_DOSTAWE))
    && (Npc_HasItems (hero, ItMiNugget)>=300) && (znowu_300_odebrac == true)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Wolf_300_BRYLEK_ZAPLATY_Info()
{
    AI_Output (other, self ,"DIA_Wolf_300_BRYLEK_ZAPLATY_15_01"); //Mam ju� te 300 bry�ek.
    AI_Output (self, other ,"DIA_Wolf_300_BRYLEK_ZAPLATY_03_02"); //Nareszcie! Dawaj je i we� dostaw�. Tylko nie zwlekaj z odniesieniem tak jak z zap�at�. 
    CreateInvItems (self, foodlowcow, 1);
    B_GiveInvItems (self, other, foodlowcow, 1);
    B_GiveInvItems (other, self, ItMiNugget, 300);
    B_LogEntry                     (CH5_FoodForHunters,"Za dostaw� musia�em zap�aci� 300 bry�ek rudy. Reszta jest moja. Mog� wreszcie wr�ci� do obozu �owc�w. ");

    B_GiveXP (190);
    AI_StopProcessInfos	(self);
};




