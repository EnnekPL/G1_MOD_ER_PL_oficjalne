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
	description = "Kim jesteœ?";
};                       

FUNC INT DIA_Wolf_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_Wolf_Hello_Info()
{
	AI_Output			(other, self,"DIA_Wolf_Hello_15_00"); //Kim jesteœ?
	AI_Output			(self, other,"DIA_Wolf_Hello_09_01"); //Jestem p³atnerzem. Mówi¹ na mnie Wilk.

	B_LogEntry			(GE_TraderNC,	"Wilk zaopatruje Szkodniki w zbroje. Zwykle przesiaduje przed swoj¹ chat¹, w wielkiej jaskini.");
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
   description	= "Jesteœ Najemnikiem, czy Szkodnikiem?";
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
    AI_Output (other, self ,"DIA_Wolf_YourGuild_15_01"); //Jesteœ Najemnikiem, czy Szkodnikiem?
    AI_Output (self, other ,"DIA_Wolf_YourGuild_03_02"); //Najemnikiem, ale tak siê sk³ada, ¿e trzymam siê obydwu grup.
    AI_Output (self, other ,"DIA_Wolf_YourGuild_03_03"); //Wczeœniej by³em jednym z ludzi Laresa, ale mimo awansu nie porzuci³em starej bandy.
    AI_Output (self, other ,"DIA_Wolf_YourGuild_03_04"); //Zarówno Lee, jak i Lares darz¹ mnie zaufaniem.
    AI_Output (self, other ,"DIA_Wolf_YourGuild_03_05"); //Rozporz¹dzam zbrojowni¹. Je¿eli do³¹czysz do Nowego Obozu, bêdziesz móg³ kupiæ u mnie pancerz.
    AI_Output (other, self ,"DIA_Wolf_YourGuild_15_06"); //Co s¹dzisz o sporze Najemników i Szkodników?
    AI_Output (self, other ,"DIA_Wolf_YourGuild_03_07"); //Uwa¿am, ¿e jest bezsensowny.
    AI_Output (self, other ,"DIA_Wolf_YourGuild_03_08"); //Powinniœmy siê wszyscy trzymaæ razem.
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
	AI_Output (self, other,"DIA_Wolf_GreetORG_09_00"); //Hej, teraz jesteœ jednym z nas!
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
	AI_Output (other, self,"Org_855_Wolf_TRADE_15_00"); //Zajmujesz siê czymœ jeszcze?
	AI_Output (self, other,"Org_855_Wolf_TRADE_09_01"); //Skupujê skóry i futra od myœliwych. Gdybyœ mia³ kiedyœ taki towar na zbyciu - zg³oœ siê do mnie.
	

};

//****************************************
//				Wo Jäger
//****************************************

instance  Org_855_Wolf_WhereHunter (C_INFO)
{
	npc				= Org_855_Wolf;
	nr				= 900;
	condition		= Org_855_Wolf_WhereHunter_Condition;
	information		= Org_855_Wolf_WhereHunter_Info;
	permanent		= 0;
	description		= "Jak mogê zdobyæ futra albo skóry?"; 
};

FUNC int  Org_855_Wolf_WhereHunter_Condition()
{	
if (Npc_KnowsInfo (hero , DIA_Wolf_Hello)) {
	return 1; };
};

FUNC void  Org_855_Wolf_WhereHunter_Info()
{
	AI_Output (other, self,"Org_855_Wolf_WhereHunter_15_00"); //Jak mogê zdobyæ futra albo skóry?
	AI_Output (self, other,"Org_855_Wolf_WhereHunter_09_01"); //Przy drodze do Nowego Obozu krêci siê Aidan. On mo¿e ciê nauczyæ, jak œci¹gaæ skórê ze zwierz¹t.
	AI_Output (self, other,"Org_855_Wolf_WhereHunter_09_02"); //Ratford i Drax poluj¹ zwykle na pó³noc od Starego Obozu, na drodze do miejsca wymiany.
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
	description = "Potrzebujê lepszej zbroi.";
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
	AI_Output (other, self,"DIA_Wolf_SellArmor_15_00"); //Potrzebujê lepszej zbroi.
	
	if ( (Npc_GetTrueGuild(other)==GIL_ORG) || (Npc_GetTrueGuild(other)==GIL_SLD) )
	{
		AI_Output (self, other,"DIA_Wolf_SellArmor_09_01"); //Teraz, kiedy jesteœ jednym z nas, mogê ci jak¹œ sprzedaæ.

		Info_ClearChoices 	(DIA_Wolf_SellArmor);
		Info_Addchoice 		(DIA_Wolf_SellArmor,DIALOG_BACK														,DIA_Wolf_SellArmor_BACK);
		Info_Addchoice 		(DIA_Wolf_SellArmor,B_BuildBuyArmorString(NAME_WolfBandits,VALUE_ORG_ARMOR_M),DIA_Wolf_SellArmor_M);
		Info_Addchoice 		(DIA_Wolf_SellArmor,B_BuildBuyArmorString(NAME_WolfHeavyBandits,VALUE_ORG_ARMOR_H)		,DIA_Wolf_SellArmor_H);
	}
	else
	{
		AI_Output (self, other,"DIA_Wolf_SellArmor_WRONGGUILD_09_00"); //Nie mogê ci nic sprzedaæ. Lares zabi³by mnie, gdyby dowiedzia³ siê, ¿e sprzedajê zbroje obcym.
	};
};

func void DIA_Wolf_SellArmor_BACK()
{
	Info_ClearChoices 	(DIA_Wolf_SellArmor);
};

func void DIA_Wolf_SellArmor_M()
{
	AI_Output (other, self,"DIA_Wolf_SellArmor_M_15_01"); //Potrzebujê wzmocnionego pancerza.
	
	if (Npc_HasItems (hero,ItMinugget)< VALUE_ORG_ARMOR_M)
	{
		AI_Output (self, other,"DIA_Wolf_SellArmor_M_09_02"); //Nie ma rudy, nie ma zbroi.
	}
	else 
	{
		AI_Output			(self, other,"DIA_Wolf_SellArmor_M_09_03"); //To solidny pancerz. Oczywiœcie nie tak dobry jak ten, który mam na sobie, ale zapewnia niez³¹ ochronê.

		B_GiveInvItems		(hero, self,ItMinugget,VALUE_ORG_ARMOR_M);
		
		CreateInvItem		(hero,ORG_ARMOR_M);
		
		CreateInvItem		(self, ItAmArrow);
		B_GiveInvItems      (self, hero, ItAmArrow, 1);
		Npc_RemoveInvItem	(hero, ItAmArrow);
	};
};

func void DIA_Wolf_SellArmor_H()
{
	AI_Output (other,self,"DIA_Wolf_SellArmor_H_15_01"); //Mo¿esz mi sprzedaæ ciê¿ki pancerz?

	if (Npc_HasItems (hero,ItMinugget) < VALUE_ORG_ARMOR_H) 
	{
		AI_Output (self, other,"DIA_Wolf_SellArmor_H_09_02"); //Nie ma rudy, nie ma zbroi.
	}
	else 
	{
		AI_Output			(self, other,"DIA_Wolf_SellArmor_H_09_03"); //Ta zbroja uchroni ciê przed ka¿dym zagro¿eniem. Sam tak¹ nosi³em, i jak dot¹d nie zosta³em nawet draœniêty. To bardzo solidny pancerz.

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
	description		= "Chcia³bym nauczyæ siê strzelaæ z ³uku."; 
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
	AI_Output (other, self,"ORG_855_Wolf_TRAINOFFER_Info_15_01"); //Chcia³bym nauczyæ siê strzelaæ z ³uku.
	AI_Output (self, other,"ORG_855_Wolf_TRAINOFFER_Info_09_02"); //Có¿, móg³bym ciê nauczyæ, ale to bêdzie kosztowaæ. Ja te¿ muszê jeœæ, no nie?
	AI_Output (other, self,"ORG_855_Wolf_TRAINOFFER_Info_15_03"); //Ile?
	AI_Output (self, other,"ORG_855_Wolf_TRAINOFFER_Info_09_04"); //50 bry³ek, bez targowania.
	
	Log_CreateTopic   	(GE_TeacherNC,	LOG_NOTE);
	B_LogEntry			(GE_TeacherNC,	"Najemnik imieniem Wilk mo¿e mnie nauczyæ strzelania z ³uku.");
	
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
	AI_Output (other, self,"ORG_855_Wolf_TRAIN_Info_15_01"); //Naucz mnie strzelaæ z ³uku.
	if (hero.attribute[ATR_Dexterity] >= 30)
	{
	if (Npc_HasItems (hero,ItMiNugget) >= 50) 
	{
		if B_GiveSkill(hero,NPC_TALENT_BOW,1,LPCOST_TALENT_BOW_1)
		{
			AI_Output (self, other,"ORG_855_Wolf_TRAIN_Info_09_02"); //Twoja celnoœæ zale¿y g³ównie od twojej zrêcznoœci. Im bardziej zwinnie bêd¹ twoje ruchy, tym pewniej twoje strza³y bêd¹ trafia³y w cel.
			AI_Output (self, other,"ORG_855_Wolf_TRAIN_Info_09_03"); //Twoje umiejêtnoœci wp³yn¹ na odleg³oœæ z jakiej bêdziesz móg³ skutecznie raziæ wrogów. Jeœli chcesz kiedyœ zostaæ strzelcem wyborowym, musisz systematycznie rozwijaæ zarówno zrêcznoœæ jak i umiejêtnoœci.
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
	AI_Output			(self,other,"DIA_Wolf_NO_ENOUGHT_STR_1"); //Popracuj jeszcze nad swoj¹ zrêcznoœci¹.
	PrintScreen	("Warunek: Zrêcznoœæ 30", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
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
	AI_Output (other, self,"ORG_855_Wolf_TRAINAGAIN_Info_15_01"); //Chcia³bym sprawniej pos³ugiwaæ siê ³ukiem.
		if (hero.attribute[ATR_Dexterity] >= 60)
	{
	if (Npc_HasItems (hero,ItMiNugget) >= 50) 
	{
		if B_GiveSkill(hero,NPC_TALENT_BOW,2,LPCOST_TALENT_BOW_2)
		{
			AI_Output (self, other,"ORG_855_Wolf_TRAINAGAIN_Info_09_02"); //Jesteœ ju¿ ca³kiem niez³ym myœliwym. Teraz pora abyœ pozna³ resztê najwa¿niejszych informacji.
			AI_Output (self, other,"ORG_855_Wolf_TRAINAGAIN_Info_09_03"); //Dobry ³ucznik bierze pod uwagê wiele czynników zewnêtrznych, ale robi to odruchowo, nieœwiadomie.
			AI_Output (self, other,"ORG_855_Wolf_TRAINAGAIN_Info_09_04"); //Odkryj tajniki funkcjonowania twojego oka, pamiêtaj o sile naci¹gu i wyobra¿aj sobie trajektoriê lotu strza³y, ale przede wszystkim - zawsze b¹dŸ czujny!
			AI_Output (self, other,"ORG_855_Wolf_TRAINAGAIN_Info_09_05"); //Opanowa³eœ ju¿ wiêkszoœæ tajników strzelania z ³uku. Teraz pozosta³o ci tylko rozwijaæ twoje umiejêtnoœci podczas polowania i walki.
			
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
	AI_Output			(self,other,"DIA_Wolf_NO_ENOUGHT_STR_1"); //Popracuj jeszcze nad swoj¹ zrêcznoœci¹.
	PrintScreen	("Warunek: Zrêcznoœæ 60", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
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
	description = "Mo¿esz mnie czegoœ nauczyæ?";
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
	AI_Output(other,self,"ORG_855_Wolf_Teach_15_00"); //Mo¿esz mnie czegoœ nauczyæ?
	AI_Output(self,other,"ORG_855_Wolf_Teach_09_01"); //Powodzenie podczas polowania zale¿y przede wszystkim od twojej zrêcznoœci.
	
	if (log_wolftrain == FALSE)
	{
	Log_CreateTopic   	(GE_TeacherNC,LOG_NOTE);
	B_LogEntry			(GE_TeacherNC,"Najemnik imieniem Wilk mo¿e pomóc mi zwiêkszyæ moj¹ zwinnoœæ.");
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
	description = "Gorn powiedzia³, ¿e chcesz ze mn¹ pilnie porozmawiaæ?";
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
	AI_Output 			(hero,self,"Info_Wolf_GOOD_15_01"); //Gorn powiedzia³, ¿e chcesz ze mn¹ pilnie porozmawiaæ?
	AI_Output 			(self,hero,"Info_Wolf_GOOD_09_02"); //Dobrze, ¿e zd¹¿y³eœ zajrzeæ do mnie przed wymarszem!
	if (!Npc_KnowsInfo(hero,Info_Gorn_FMCENTRANCE))
	{
		AI_Output 			(hero,self,"Info_Wolf_GOOD_15_03"); //Przed jakim wymarszem?
		AI_Output 			(self,hero,"Info_Wolf_GOOD_09_04"); //Przed waszym wymarszem do Niezupe³nie-Wolnej-Kopalni.
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
	AI_Output 			(self,hero,"Info_Wolf_SPEAK_09_02"); //Mam pomys³ na zupe³nie nowy rodzaj pancerza.
	AI_Output 			(hero,self,"Info_Wolf_SPEAK_15_03"); //Czy¿by? A có¿ to za pomys³?
	AI_Output 			(self,hero,"Info_Wolf_SPEAK_09_04"); //Pancerze pe³zaczy s¹ niezwykle twarde. Znacznie trwalsze ni¿ choæby stal.
	AI_Output 			(self,hero,"Info_Wolf_SPEAK_09_05"); //Oczywiœcie nie mam tu na myœli tych wychudzonych osobników, które nawiedza³y zawalon¹ kopalniê Gomeza...
	AI_Output 			(self,hero,"Info_Wolf_SPEAK_09_06"); //... O nie, one nie wystarcz¹. W NASZEJ kopalni ¿yj¹ PRAWDZIWE PE£ZACZE. Wiêksze, silniejsze i jeszcze bardziej wredne.
	AI_Output 			(self,hero,"Info_Wolf_SPEAK_09_07"); //Pancerz tych bestii jest niemal nie do przebicia!
	AI_Output 			(self,hero,"Info_Wolf_SPEAK_09_08"); //Gdybyœ móg³ mi przynieœæ kilka p³ytek z ich pancerzy, móg³bym z nich posk³adaæ nie lada zbrojê!
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
	description = "W jaki sposób mam oddzieliæ te p³ytki od zw³ok pe³zaczy?";
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
	AI_Output 			(hero,self,"Info_Wolf_SKIN_15_01"); //W jaki sposób mam oddzieliæ te p³ytki od zw³ok pe³zaczy?
	AI_Output 			(self,hero,"Info_Wolf_SKIN_09_02"); //To proste. P³ytki na grzbiecie przymocowane s¹ tylko przy krawêdziach.
	AI_Output 			(self,hero,"Info_Wolf_SKIN_09_03"); //Wystarczy wzi¹æ ostry nó¿ i "ci¹æ wzd³u¿ przerywanej linii".
	AI_Output 			(hero,self,"Info_Wolf_SKIN_15_04"); //W porz¹dku. Postaram siê przynieœæ ci kilka p³ytek z pancerzy pe³zaczy.

	Knows_GetMCPlates = TRUE;
	PrintScreen	("Nowa umiejêtnoœæ: Wycinanie p³ytek pancerza", -1,-1,"FONT_OLD_20_WHITE.TGA",3);
	
	Log_CreateTopic		(CH4_MCPlateArmor,	LOG_MISSION);
	Log_SetTopicStatus	(CH4_MCPlateArmor,	LOG_RUNNING);
	B_LogEntry			(CH4_MCPlateArmor,	"Wilk, Najemnik z Nowego Obozu, zaproponowa³ mi wykonanie zbroi z pancerzy pe³zaczy. Pokaza³ mi jak nale¿y je usuwaæ z martwych potworów."); 
	
	Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
	B_LogEntry (GE_AnimalTrophies,"Umiejêtnoœæ usuwania pancerzy z martwych pe³zaczy-wojowników.");

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
	description = "I mówisz mi to wszystko nie ¿¹daj¹c niczego w zamian?";
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
	AI_Output 			(hero,self,"Info_Wolf_PROFIT_15_01"); //I mówisz mi to wszystko nie ¿¹daj¹c niczego w zamian?
	AI_Output 			(self,hero,"Info_Wolf_PROFIT_09_02"); //No niezupe³nie... Jeœli uda mi siê skleciæ z tych p³ytek porz¹dn¹ zbrojê, bêdê... bardzo szybko... bardzo du¿o... Ach, niewa¿ne!
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
	description = "Przynios³em ci kilka tych p³ytek, o które prosi³eœ!";
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
	AI_Output 			(hero,self,"Info_Wolf_MCPLATESFEW_15_01"); //Przynios³em ci kilka tych p³ytek, o które prosi³eœ!
	AI_Output 			(self,hero,"Info_Wolf_MCPLATESFEW_09_02"); //To za ma³o! Nie starczy na ca³¹ zbrojê!
	AI_Output 			(self,hero,"Info_Wolf_MCPLATESFEW_09_03"); //Przynieœ mi wiêcej p³ytek!
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
	description = "Zebra³em mnóstwo p³ytek z pancerzy pe³zaczy!";
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
	AI_Output 			(hero,self,"Info_Wolf_MCPLATESENOUGH_15_01"); //Zebra³em mnóstwo p³ytek z pancerzy pe³zaczy!
	AI_Output 			(self,hero,"Info_Wolf_MCPLATESENOUGH_09_02"); //Fantastycznie! Natychmiast zabieram siê do roboty!
	AI_Output 			(hero,self,"Info_Wolf_MCPLATESENOUGH_15_03"); //Jak d³ugo to zajmie?
	AI_Output 			(self,hero,"Info_Wolf_MCPLATESENOUGH_09_04"); //Nie mam pojêcia. To coœ zupe³nie nowego. Jeszcze nigdy czegoœ takiego nie robi³em!
	AI_Output 			(self,hero,"Info_Wolf_MCPLATESENOUGH_09_05"); //Bêdziesz musia³ zagl¹daæ do mnie od czasu do czasu.
/*
	//mod
	AI_Output 			(self,hero,"Info_Wolf_MCPLATESENOUGH_09_06"); //Oczekuj¹c mo¿esz te¿ zajrzeæ na pola ry¿owe. Podobno dzieje siê tam coœ niepokoj¹cego.
	AI_Output 			(self,hero,"Info_Wolf_MCPLATESENOUGH_09_07"); //Lewus nie mo¿e zapanowaæ nad sytuacj¹. Oczywiœcie nie musisz mu pomagaæ.
	AI_Output 			(self,hero,"Info_Wolf_MCPLATESENOUGH_09_08"); //Tak tylko mówiê, co siê dzieje w obozie...
	
	if (Mod_Story_RunRebelInNC == FALSE)
	{
	B_Story_BauRebellion ();
	};
*/
	MCPlatesDelivered = TRUE;

	B_LogEntry			(CH4_MCPlateArmor,	"Da³em Wilkowi 15 tych p³ytek z pancerzy. Teraz potrzebuje trochê czasu, ¿eby sporz¹dziæ z nich dla mnie now¹ zbrojê.");
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
	description = "Jak postêpuj¹ prace nad nowym pancerzem?";
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
	AI_Output 			(hero,self,"Info_Wolf_ARMORINWORK_15_01"); //Jak postêpuj¹ prace nad nowym pancerzem?
	AI_Output 			(self,hero,"Info_Wolf_ARMORINWORK_09_02"); //To zajmie d³u¿ej ni¿ myœla³em! Te p³ytki s¹ niezwykle twarde. Nie bardzo wiem jak mam je ze sob¹ po³¹czyæ!
	AI_Output 			(self,hero,"Info_Wolf_ARMORINWORK_09_03"); //Daj mi jeszcze trochê czasu! Dam radê, zaufaj mi!
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
	description = "Jak postêpuj¹ prace nad nowym pancerzem?";
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
	AI_Output 			(hero,self,"Info_Wolf_ARMORFINISHED_15_01"); //Jak postêpuj¹ prace nad nowym pancerzem?
	AI_Output 			(self,hero,"Info_Wolf_ARMORFINISHED_09_02"); //Uda³o mi siê wreszcie znaleŸæ sposób na po³¹czenie p³ytek ze sob¹!
	AI_Output 			(hero,self,"Info_Wolf_ARMORFINISHED_15_03"); //Czy to znaczy, ¿e zbroja jest ju¿ gotowa!
	AI_Output 			(self,hero,"Info_Wolf_ARMORFINISHED_09_04"); //Dok³adnie! Oto i ona! Jest twardsza ni¿ jakikolwiek pancerz jaki widzia³em na oczy!
	AI_Output 			(hero,self,"Info_Wolf_ARMORFINISHED_15_05"); //Dziêki, jestem twoim d³u¿nikiem!
	AI_Output 			(self,hero,"Info_Wolf_ARMORFINISHED_09_06"); //Nie ma o czym mówiæ! Na pewno na tym nie stracê! Co to, to nie! Ha Ha!

	B_LogEntry			(CH4_MCPlateArmor,	"Wilk skoñczy³ ju¿ moj¹ now¹ zbrojê. To najlepszy pancerz, jaki w ¿yciu widzia³em!");
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
	description		= "Gdzie mogê kupiæ jakiœ ³uk?"; 
};

FUNC int  Org_855_Wolf_SELLBOW_Condition()
{
	return TRUE;
};
FUNC void  Org_855_Wolf_SELLBOW_Info()
{
	AI_Output (other, self,"Org_855_Wolf_SELLBOW_Info_15_01"); //Gdzie mogê kupiæ jakiœ ³uk?
	AI_Output (self, other,"Org_855_Wolf_SELLBOW_Info_09_02"); //Trafi³eœ pod w³aœciwy adres. Mam tu dobry towar za bardzo przystêpne ceny.
	Log_CreateTopic   	(GE_TraderNC,LOG_NOTE);
	B_LogEntry			(GE_TraderNC,"Najemnik imieniem Wilk sprzedaje ³uki.");

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
   description	= "Szukam poparcia Najemników.";
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
    AI_Output (other, self ,"DIA_Wolf_ZaparcieNajemnikow_15_01"); //Szukam poparcia Najemników.
    AI_Output (self, other ,"DIA_Wolf_ZaparcieNajemnikow_03_02"); //I dlatego przyszed³eœ do mnie?
    AI_Output (other, self ,"DIA_Wolf_ZaparcieNajemnikow_15_03"); //Tak. Wspomnia³ mi o tobie Jarvis.
    AI_Output (self, other ,"DIA_Wolf_ZaparcieNajemnikow_03_04"); //Ach, Jarvis powiadasz. No dobrze. Mam znaleŸæ dla ciebie jakieœ zadanie?
    AI_Output (other, self ,"DIA_Wolf_ZaparcieNajemnikow_15_05"); //By³oby mi³o.
    AI_Output (self, other ,"DIA_Wolf_ZaparcieNajemnikow_03_06"); //Dobrze wiêc. Akurat przypomnia³a mi siê pewna historia.
    AI_Output (self, other ,"DIA_Wolf_ZaparcieNajemnikow_15_07"); //Trzy lata temu zgubi³em gdzieœ w okolicy moj¹ ozdobn¹ klingê.
    AI_Output (self, other ,"DIA_Wolf_ZaparcieNajemnikow_03_08"); //Móg³byœ jej poszukaæ. By³a srebrna.
    AI_Output (other, self ,"DIA_Wolf_ZaparcieNajemnikow_15_09"); //Postaram siê j¹ znaleŸæ.
    MIS_KilnagaWolfa = LOG_RUNNING;

    Log_CreateTopic            (CH1_KilnagaWolfa, LOG_MISSION);
    Log_SetTopicStatus       (CH1_KilnagaWolfa, LOG_RUNNING);
    B_LogEntry                     (CH1_KilnagaWolfa,"Wilk poleci³ mi odnaleŸæ swoj¹ ozdobn¹ klingê. Zgubi³ j¹ w okolicach Nowego Obozu. Poznam j¹ po srebrnym kolorze.");
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
   description	= "Mam twoj¹ zgubê.";
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
    AI_Output (other, self ,"DIA_Wolf_FindSword_15_01"); //Mam twoj¹ zgubê.
    AI_Output (self, other ,"DIA_Wolf_FindSword_03_02"); //Naprawdê j¹ znalaz³eœ?
    AI_Output (other, self ,"DIA_Wolf_FindSword_15_03"); //Tak. Proszê, oto ona.
    AI_Output (other, self ,"DIA_Wolf_FindSword_15_04"); //Le¿a³a w pobli¿u jakichœ szcz¹tek.
    AI_Output (self, other ,"DIA_Wolf_FindSword_03_05"); //Domyœlam siê kto to by³...
    AI_Output (self, other ,"DIA_Wolf_FindSword_03_06"); //Chciwoœæ potrafi zniszczyæ nawet z pozoru siln¹ przyjaŸñ. Zapamiêtaj to, ch³opcze.
    AI_Output (self, other ,"DIA_Wolf_FindSword_03_07"); //Mo¿esz liczyæ na moje poparcie. Potrzebujemy takich ludzi. WeŸ tak¿e ten ³uk.
    B_LogEntry                     (CH1_KilnagaWolfa,"Znalaz³em zgubê Wilka. Zosta³a mu dawno skradziona przez przyjaciela. Uda³o mi siê zyskaæ poparcie kolejnego Najemnika.");
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
   description	= "Przychodzê po dostawê dla ³owców orków.";
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
    AI_Output (other, self ,"DIA_Wolf_DOSTAWA_LOWCOW_15_01"); //Przychodzê po dostawê dla ³owców orków.
    AI_Output (self, other ,"DIA_Wolf_DOSTAWA_LOWCOW_03_02"); //Zaszed³eœ a¿ tak daleko? Jestem w szoku. Chyba Ÿle ciê oceni³em.
    AI_Output (other, self ,"DIA_Wolf_DOSTAWA_LOWCOW_15_03"); //Ostatnio coraz czêœciej to s³yszê, ale do rzeczy.
    AI_Output (self, other ,"DIA_Wolf_DOSTAWA_LOWCOW_03_04"); //Ano tak. Dostawa... Hmm... Nale¿y siê 400 bry³ek rudy.

    Info_ClearChoices		(DIA_Wolf_DOSTAWA_LOWCOW);
    Info_AddChoice		(DIA_Wolf_DOSTAWA_LOWCOW, "Ojej. Chyba gdzieœ mi zginê³o kilka bry³ek... Wrócê póŸniej. ", DIA_Wolf_DOSTAWA_LOWCOW_UPS_ZAGINELO);
    Info_AddChoice		(DIA_Wolf_DOSTAWA_LOWCOW, "Mo¿e siê potargujemy? ", DIA_Wolf_DOSTAWA_LOWCOW_TARGUJ_SIE);
    Info_AddChoice		(DIA_Wolf_DOSTAWA_LOWCOW, "No dobra. Masz rudê. Dawaj dostawê!", DIA_Wolf_DOSTAWA_LOWCOW_DAWAJ);
};

FUNC VOID DIA_Wolf_DOSTAWA_LOWCOW_UPS_ZAGINELO()
{
    AI_Output (other, self ,"DIA_Wolf_DOSTAWA_LOWCOW_UPS_ZAGINELO_15_01"); //Ojej. Chyba gdzieœ mi zginê³o kilka bry³ek... Wrócê póŸniej. 
    AI_Output (self, other ,"DIA_Wolf_DOSTAWA_LOWCOW_UPS_ZAGINELO_03_02"); //Ha ha ha! Tylko wróæ w tym miesi¹cu, bo ³owcy nie wytrzymaj¹ d³ugo bez jedzenia.
    AI_Output (other, self ,"DIA_Wolf_DOSTAWA_LOWCOW_UPS_ZAGINELO_15_03"); //Z pewnoœci¹ coœ sobie przyrz¹dz¹.
    AI_Output (self, other ,"DIA_Wolf_DOSTAWA_LOWCOW_UPS_ZAGINELO_03_04"); //Ha! Z pewnoœci¹ orka.
    B_LogEntry                     (CH5_FoodForHunters,"W moim ekwipunku jest niez³y ba³agan. Gdzie ja podzia³em te 400 bry³ek rudy. Hmmm...");
    Info_ClearChoices		(DIA_Wolf_DOSTAWA_LOWCOW);
    AI_StopProcessInfos	(self);
};

FUNC VOID DIA_Wolf_DOSTAWA_LOWCOW_TARGUJ_SIE()
{
	oplata_wolfa = 400;
    AI_Output (other, self ,"DIA_Wolf_DOSTAWA_LOWCOW_TARGUJ_SIE_15_01"); //Mo¿e siê potargujemy? 
    if (MIS_KilnagaWolfa == LOG_SUCCESS)
    {
        AI_Output (self, other ,"DIA_Wolf_DOSTAWA_LOWCOW_TARGUJ_SIE_03_02"); //No dobra. Odnalaz³eœ moj¹ star¹ klingê. Spuszczê z ceny o 50 bry³ek. 
        AI_Output (self, other ,"DIA_Wolf_DOSTAWA_LOWCOW_TARGUJ_SIE_03_03"); //Jak chcesz wiêcej to bêdê mia³ dla ciebie zadanie.
        AI_Output (other, self ,"DIA_Wolf_DOSTAWA_LOWCOW_TARGUJ_SIE_15_04"); //Co konkretnie mam zrobiæ?
        AI_Output (self, other ,"DIA_Wolf_DOSTAWA_LOWCOW_TARGUJ_SIE_03_05"); //Butch... Kojarzysz typa? Nie zap³aci³ mi za ciê¿k¹ zbrojê. Odzyskaj moj¹ rudê.
        AI_Output (other, self ,"DIA_Wolf_DOSTAWA_LOWCOW_TARGUJ_SIE_15_06"); //W porz¹dku. 
        B_LogEntry                     (CH5_FoodForHunters,"Wilk spuœci³ mi cenê o 50 bry³ek, bo odnalaz³em kiedyœ jego klingê. Jeœli chcê, ¿eby Wilk spuœci³ mi cenê o kolejne bry³ki to muszê namówiæ Butcha do oddania d³ugu za ciê¿k¹ zbrojê Szkodnika. ");
		pancerz_bustera = true;
		oplata_wolfa = oplata_wolfa - 50;
    }
    else
    {
        AI_Output (self, other ,"DIA_Wolf_DOSTAWA_LOWCOW_TARGUJ_SIE_03_07"); //No dobra bêdê mia³ dla ciebie zadanie.
        AI_Output (other, self ,"DIA_Wolf_DOSTAWA_LOWCOW_TARGUJ_SIE_15_08"); //Co konkretnie mam zrobiæ?
        AI_Output (self, other ,"DIA_Wolf_DOSTAWA_LOWCOW_TARGUJ_SIE_03_09"); //Butch... Kojarzysz typa? Nie zap³aci³ mi za ciê¿k¹ zbrojê. Odzyskaj moj¹ rudê.
        AI_Output (other, self ,"DIA_Wolf_DOSTAWA_LOWCOW_TARGUJ_SIE_15_10"); //Spróbujê.
		B_LogEntry                     (CH5_FoodForHunters,"Jeœli chcê, ¿eby Wilk spuœci³ mi cenê o kolejne bry³ki to muszê namówiæ Butcha do oddania d³ugu za ciê¿k¹ zbrojê Szkodnika. ");
		pancerz_bustera = true;
    };
    Info_ClearChoices		(DIA_Wolf_DOSTAWA_LOWCOW);
    AI_StopProcessInfos	(self);
};

FUNC VOID DIA_Wolf_DOSTAWA_LOWCOW_DAWAJ()
{
    AI_Output (other, self ,"DIA_Wolf_DOSTAWA_LOWCOW_DAWAJ_15_01"); //No dobra. Masz rudê. Dawaj dostawê!
    AI_Output (self, other ,"DIA_Wolf_DOSTAWA_LOWCOW_DAWAJ_03_02"); //Oto paczka z ¿ywnoœci¹.
    B_GiveInvItems (other, self, ItMiNugget, 400);
    CreateInvItems (self, foodlowcow, 1);
    B_GiveInvItems (self, other, foodlowcow, 1);
    Info_ClearChoices		(DIA_Wolf_DOSTAWA_LOWCOW);
    AI_StopProcessInfos	(self);
    B_LogEntry                     (CH5_FoodForHunters,"Bez ¿adnych ceregieli odebra³em dostawê. ");

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
   description	= "Mam rudê za pancerz.";
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
    AI_Output (other, self ,"DIA_Wolf_ZAPLATA_PANCERZ_15_01"); //Mam rudê za pancerz.
    AI_Output (self, other ,"DIA_Wolf_ZAPLATA_PANCERZ_03_02"); //Dobrze. Dawaj. Obni¿ê cenê o 100 bry³ek rudy. 
    B_GiveInvItems (other, self, ItMiNugget, 1500);
    B_LogEntry                     (CH5_FoodForHunters,"Odnios³em rudê Wilkowi. Obni¿y³ cenê o 100 bry³ek.");

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
   description	= "Daj mi tê dostawê.";
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
    AI_Output (other, self ,"DIA_Wolf_ODBIEZR_DOSTAWE_15_01"); //Daj mi tê dostawê.
    AI_Output (self, other ,"DIA_Wolf_ODBIEZR_DOSTAWE_03_02"); //Zobaczmy.
    AI_Output (self, other ,"DIA_Wolf_ODBIEZR_DOSTAWE_03_03"); //Pomog³eœ mi odzyskaæ rudê. Obni¿ê wiêc zap³atê za dostawê o 100 bry³ek.
    if (MIS_KilnagaWolfa == LOG_SUCCESS)
    {
        AI_Output (self, other ,"DIA_Wolf_ODBIEZR_DOSTAWE_03_04"); //Odnalaz³eœ te¿ moj¹ klingê.
        if (Npc_HasItems (hero, ItMiNugget)>=250)
        {
            AI_Output (self, other ,"DIA_Wolf_ODBIEZR_DOSTAWE_03_05"); //Masz dostawê. Daj mi 250 bry³ek rudy jako wynagrodzenie.

            B_GiveInvItems (other, self, ItMiNugget, 250);
            CreateInvItems (self, foodlowcow, 1);
            B_GiveInvItems (self, other, foodlowcow, 1);
            B_LogEntry                     (CH5_FoodForHunters,"Za dostawê musia³em zap³aciæ 250 bry³ek rudy. Reszta jest moja. Mogê wreszcie wróciæ do obozu ³owców. ");

            B_GiveXP (250);
        }
        else
        {
            AI_Output (self, other ,"DIA_Wolf_ODBIEZR_DOSTAWE_03_06"); //Chcia³em ju¿ za³atwiæ tê sprawê, ale patrz¹c na twoj¹ sakiewkê widzê, ¿e i tak brakuje ci rudy.
            AI_Output (self, other ,"DIA_Wolf_ODBIEZR_DOSTAWE_03_07"); //Cholera. Jak mo¿na byæ tak niedba³ym. PrzyjdŸ jak bêdziesz mia³ te 250 bry³ek.
            znowu_250_odebrac = true;
        };
    }
else 
{
    if (Npc_HasItems (hero, ItMiNugget)>=300)
    {
        AI_Output (self, other ,"DIA_Wolf_ODBIEZR_DOSTAWE_03_08"); //Widzê, ¿e masz te 300 bry³ek rudy. Dawaj i koñczmy te wymianê.
        B_LogEntry                     (CH5_FoodForHunters,"Za dostawê musia³em zap³aciæ 300 bry³ek rudy. Reszta jest moja. Mogê wreszcie wróciæ do obozu ³owców. ");

        B_GiveXP (200);
        CreateInvItems (self, foodlowcow, 1);
        B_GiveInvItems (self, other, foodlowcow, 1);
        B_GiveInvItems (other, self, ItMiNugget, 300);
    }
    else
    {
        AI_Output (self, other ,"DIA_Wolf_ODBIEZR_DOSTAWE_03_09"); //Chcia³em ju¿ za³atwiæ tê sprawê, ale patrz¹c na twoj¹ sakiewkê widzê, ¿e i tak brakuje ci rudy.
        AI_Output (self, other ,"DIA_Wolf_ODBIEZR_DOSTAWE_03_10"); //Cholera. Jak mo¿na byæ tak niedba³ym. PrzyjdŸ jak bêdziesz mia³ te 300 bry³ek.
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
   description	= "Dobra. Tym razem mam 250 bry³ek.";
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
    AI_Output (other, self ,"DIA_Wolf_RUDA_DRUGI_RAZ_15_01"); //Dobra. Tym razem mam 250 bry³ek.
    AI_Output (self, other ,"DIA_Wolf_RUDA_DRUGI_RAZ_03_02"); //Dawaj je. Masz dostawê. 
    B_GiveInvItems (other, self, ItMiNugget, 300);
    CreateInvItems (self, foodlowcow, 1);
    B_GiveInvItems (self, other, foodlowcow, 1);
    B_LogEntry                     (CH5_FoodForHunters,"Za dostawê musia³em zap³aciæ 250 bry³ek rudy. Reszta jest moja. Mogê wreszcie wróciæ do obozu ³owców. ");

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
   description	= "Mam ju¿ te 300 bry³ek.";
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
    AI_Output (other, self ,"DIA_Wolf_300_BRYLEK_ZAPLATY_15_01"); //Mam ju¿ te 300 bry³ek.
    AI_Output (self, other ,"DIA_Wolf_300_BRYLEK_ZAPLATY_03_02"); //Nareszcie! Dawaj je i weŸ dostawê. Tylko nie zwlekaj z odniesieniem tak jak z zap³at¹. 
    CreateInvItems (self, foodlowcow, 1);
    B_GiveInvItems (self, other, foodlowcow, 1);
    B_GiveInvItems (other, self, ItMiNugget, 300);
    B_LogEntry                     (CH5_FoodForHunters,"Za dostawê musia³em zap³aciæ 300 bry³ek rudy. Reszta jest moja. Mogê wreszcie wróciæ do obozu ³owców. ");

    B_GiveXP (190);
    AI_StopProcessInfos	(self);
};




