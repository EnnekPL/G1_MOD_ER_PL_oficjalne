//*********************************************************
//*********************************************************
//							EXIT									
//*********************************************************

instance  Sld_700_Lee_Exit (C_INFO)
{
	npc			=  Sld_700_Lee;
	nr			=  999;
	condition	=  Sld_700_Lee_Exit_Condition;
	information	=  Sld_700_Lee_Exit_Info;
	important	=  0;	
	permanent	=  1;
	description = DIALOG_ENDE;
};                       

FUNC int  Sld_700_Lee_Exit_Condition()
{
	return TRUE;
};

FUNC VOID  Sld_700_Lee_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

//*********************************************************
//						Greet									
//*********************************************************

instance  Sld_700_Lee_Greet (C_INFO)
{
	npc			=  Sld_700_Lee;
	nr			=  1;
	condition	=  Sld_700_Lee_Greet_Condition;
	information	=  Sld_700_Lee_Greet_Info;
	permanent	=  0;
	description = "Jesteœ szefem Najemników, tak?";
};                       

FUNC int  Sld_700_Lee_Greet_Condition()
{
	return 1;
};

FUNC VOID  Sld_700_Lee_Greet_Info()
{
	AI_Output (other, self,"DIA_Lee_Greet_15_00"); //Jesteœ szefem Najemników, tak?
	AI_Output (self, other,"DIA_Lee_Greet_08_01"); //Zgadza siê, ch³opcze!
};

//*********************************************************
//						Define									
//*********************************************************

instance  Sld_700_Lee_Define (C_INFO)
{
	npc			=  Sld_700_Lee;
	nr			=  1;
	condition	=  Sld_700_Lee_Define_Condition;
	information	=  Sld_700_Lee_Define_Info;
	permanent	=  0;
	description = "Czym zajmuje siê Najemnik w s³u¿bie magów?";
};                       

FUNC int  Sld_700_Lee_Define_Condition()
{
	if (Npc_KnowsInfo(hero,Sld_700_Lee_Greet))
	{
		return 1;
	};
};

FUNC VOID  Sld_700_Lee_Define_Info()
{
	AI_Output (other, self,"DIA_Lee_Define_15_00"); //Czym zajmuje siê Najemnik w s³u¿bie magów?
	AI_Output (self, other,"DIA_Lee_Define_08_01"); //To proste: pilnuje rudy i broni magów.
	AI_Output (self, other,"DIA_Lee_Define_08_02"); //Od czasu do czasu magowie zlecaj¹ nam jakieœ zadania specjalne.
};

//*********************************************************
//						Mitmachen									
//*********************************************************

instance  Sld_700_Lee_Mitmachen (C_INFO)
{
	npc			=  Sld_700_Lee;
	nr			=  2;
	condition	=  Sld_700_Lee_Mitmachen_Condition;
	information	=  Sld_700_Lee_Mitmachen_Info;
	permanent	=  0;
	description = "Chcia³bym do was do³¹czyæ!";
};                       

FUNC int  Sld_700_Lee_Mitmachen_Condition()
{
	if	(Npc_KnowsInfo(hero,Sld_700_Lee_Greet))
	&&	((Npc_GetTrueGuild(hero) == GIL_NONE) || (Npc_GetTrueGuild(hero) == GIL_ORG) || (Npc_GetTrueGuild(hero) == GIL_SFB)) //+ inne gildie NO
	&&	(oldHeroGuild == 0)
	{
		return 1;
	};
};

FUNC VOID  Sld_700_Lee_Mitmachen_Info()
{
	AI_Output (other, self,"DIA_Lee_Mitmachen_15_00"); //Chcia³bym do was do³¹czyæ!
	AI_Output (self, other,"DIA_Lee_Mitmachen_08_01"); //Odbi³o ci? Myœlisz, ¿e przyjmujê ka¿dego w³óczêgê, który siê do mnie zg³osi?
	AI_Output (self, other,"DIA_Lee_Mitmachen_08_02"); //Musisz najpierw spêdziæ trochê czasu w naszym Obozie. Bêdê ciê mia³ na oku! Zobaczymy, na co ciê staæ.
};


//*********************************************************
//						NowReady for Sld?									
//*********************************************************
	var int Lee_SldPossible;
//*********************************************************

instance  Sld_700_Lee_NowReady (C_INFO)
{
	npc			=  Sld_700_Lee;
	nr			=  700;
	condition	=  Sld_700_Lee_NowReady_Condition;
	information	=  Sld_700_Lee_NowReady_Info;
	permanent	=  1;
	description = "Chcia³bym zostaæ Najemnikiem w s³u¿bie magów. Myœlisz, ¿e jestem ju¿ gotów?";
};                       

FUNC int  Sld_700_Lee_NowReady_Condition()
{
	if	((Npc_GetTrueGuild(hero) == GIL_ORG) || (Npc_GetTrueGuild(hero) == GIL_SFB)) && (Npc_KnowsInfo(hero,Sld_700_Lee_Greet))
	//&&	((Npc_KnowsInfo(hero,Sld_700_Lee_Mitmachen) || (hero.level >= 10))) zbêdne
	{
		return 1;
	};
};

FUNC VOID  Sld_700_Lee_NowReady_Info()
{
	AI_Output (other, self,"DIA_Lee_NowReady_15_00"); //Chcia³bym zostaæ Najemnikiem w s³u¿bie magów. Myœlisz, ¿e jestem ju¿ gotów?
	
	if (CorKalom_BringMCQBalls == LOG_SUCCESS)
	{
		AI_Output			(self, other,"Sld_700_Lee_BECOMESLD_Info_08_01"); //Twoje dokonania w Starej Kopalni dowodz¹, ¿e staæ ciê na wiele.
		AI_Output			(self, other,"Sld_700_Lee_BECOMESLD_Info_08_02"); //Jestem sk³onny przyj¹æ ciê w poczet Najemników.
	
		if (hero.level < 10)
		{
			AI_Output			(self, other,"Sld_700_Lee_BECOMESLD_Info_08_03"); //Ale nie jesteœ gotowy do s³u¿by w naszych szeregach. Musisz zdobyæ jeszcze trochê doœwiadczenia.
	    	AI_StopProcessInfos	(self);
			B_PrintGuildCondition(10);
	    }
	    else if (hero.level >= 10)
	    {
	    	AI_Output			(self, other,"Sld_700_Lee_BECOMESLD_Info_08_04"); //Dam ci szansê. Co ty na to?
	    	Lee_SldPossible = TRUE;
		};
	}
	else
	{	
		AI_Output			(self, other,"Sld_700_Lee_BECOMESLD_Info_MOD_01"); //Najemnikami zostaj¹ ci, którzy dobrze poznali ¿ycie w kolonii lub zrobili coœ, co udowadnia ich odwagê.
		AI_Output			(self, other,"Sld_700_Lee_BECOMESLD_Info_MOD_02"); //Ty jeszcze nic takiego nie dokona³eœ. Czeka ciê d³uga droga.
	};

	//////////////////////////////////////////////
	// Ta czêœæ skryptu zosta³a wycofana, poniewa¿
	// mo¿liwoœæ zostania Najemnikiem w 1 rozdziale
	// naruszy³aby balans.
	//////////////////////////////////////////////
	
	/*	if (hero.level < 10)
		{
			AI_Output (self, other,"DIA_Lee_NowReady_08_01"); //Nadal nie jesteœ doœæ doœwiadczony. Musisz siê jeszcze wiele nauczyæ.
			B_PrintGuildCondition(10);
	    }
	    else if (hero.level >= 10)
	    {
	    	AI_Output			(self, other,"Sld_700_Lee_BECOMESLD_Info_08_04"); //Dam ci szansê. Co ty na to?
	    	Lee_SldPossible = TRUE;
		};
	};*/
};

/*------------------------------------------------------------------------
							SÖLDNER WERDEN	2									
------------------------------------------------------------------------*/

instance  Sld_700_Lee_BECOMESLDNOW (C_INFO)
{
	npc				= Sld_700_Lee;
	condition		= Sld_700_Lee_BECOMESLDNOW_Condition;
	information		= Sld_700_Lee_BECOMESLDNOW_Info;
	important		= 0;
	permanent		= 0;
	description		= "Chcê zostaæ Najemnikiem."; 
};

FUNC int  Sld_700_Lee_BECOMESLDNOW_Condition()
{	
	if (Lee_SldPossible == TRUE)
	&& (hero.level >= 10)
	&& (Npc_GetTrueGuild(hero) == GIL_ORG)
	&& (player_chose_WaterMages == false)
	&& (kapitel >= 2)
	{
		return TRUE;
	};
};

FUNC void  Sld_700_Lee_BECOMESLDNOW_Info()
{
	AI_Output			(other, self,"Sld_700_Lee_BECOMESLDNOW_Info_15_01"); //Chcê zostaæ Najemnikiem.
	AI_Output			(self, other,"Sld_700_Lee_BECOMESLDNOW_Info_08_02"); //M¹dra decyzja. Nie po¿a³ujesz.
	AI_Output			(self, other,"Sld_700_Lee_BECOMESLDNOW_Info_08_03"); //Powiedz mi: dlaczego? Dlaczego do³¹czy³eœ do nas, a nie do Bractwa, albo do Starego Obozu?

	Log_CreateTopic		(GE_BecomeMercenary,LOG_NOTE);
	B_LogEntry			(GE_BecomeMercenary,"Lee pozwoli³ mi do³¹czyæ do Najemników.");
	
	Info_ClearChoices	(Sld_700_Lee_BECOMESLDNOW);
	Info_AddChoice		(Sld_700_Lee_BECOMESLDNOW,"W tamtych obozach tylko traci³bym czas.",Sld_700_Lee_BECOMESLDNOW_NOOTHER);
	Info_AddChoice		(Sld_700_Lee_BECOMESLDNOW,"Od pocz¹tku myœla³em tylko o odzyskaniu wolnoœci.",Sld_700_Lee_BECOMESLDNOW_FREEDOM);
	Info_AddChoice		(Sld_700_Lee_BECOMESLDNOW,"Tak siê jakoœ z³o¿y³o.",Sld_700_Lee_BECOMESLDNOW_JUSTBECAUSE);
};
  
FUNC void  Sld_700_Lee_BECOMESLDNOW_NOOTHER()
{
	AI_Output			(other, self,"Sld_700_Lee_BECOMESLDNOW_NOOTHER_15_01"); //W tamtych obozach tylko traci³bym czas.
	AI_Output			(self, other,"Sld_700_Lee_BECOMESLDNOW_NOOTHER_08_02"); //Jedyna rzecz, która ma tutaj jak¹œ prawdziw¹ wartoœæ to pragnienie wolnoœci. Witaj wœród nas, NAJEMNIKU!
	CreateInvItem		(self,SLD_ARMOR_L);
	B_GiveInvItems      (self, hero, SLD_ARMOR_L, 1);
	AI_EquipBestArmor	(hero);
	Npc_SetTrueGuild	(hero,GIL_SLD);
	hero.guild = GIL_SLD;
	AI_StopProcessInfos	(self);
};

FUNC void  Sld_700_Lee_BECOMESLDNOW_FREEDOM()
{
	AI_Output			(other, self,"Sld_700_Lee_BECOMESLDNOW_FREEDOM_15_01"); //Od pocz¹tku myœla³em tylko o odzyskaniu wolnoœci.
	AI_Output			(self, other,"Sld_700_Lee_BECOMESLDNOW_FREEDOM_08_02"); //I dziêki nam wkrótce j¹ odzyskasz. Witaj wœród nas, NAJEMNIKU!
	CreateInvItem		(self,SLD_ARMOR_L);
	B_GiveInvItems      (self, hero, SLD_ARMOR_L, 1);
	AI_EquipBestArmor	(hero);
	Npc_SetTrueGuild	(hero,GIL_SLD);
	hero.guild = GIL_SLD;
	AI_StopProcessInfos	(self);
};

FUNC void  Sld_700_Lee_BECOMESLDNOW_JUSTBECAUSE()
{
	AI_Output			(other, self,"Sld_700_Lee_BECOMESLDNOW_JUSTBECAUSE_15_01"); //Tak siê jakoœ z³o¿y³o.
	AI_Output			(self, other,"Sld_700_Lee_BECOMESLDNOW_JUSTBECAUSE_08_02"); //¯eby siê tylko nie z³o¿y³o, ¿e kiedyœ nagle zmienisz zdanie. Witaj wœród nas, NAJEMNIKU!
	CreateInvItem		(self,SLD_ARMOR_L);
	B_GiveInvItems      (self, hero, SLD_ARMOR_L, 1);
	AI_EquipBestArmor	(hero);
	Npc_SetTrueGuild	(hero,GIL_SLD);
	hero.guild = GIL_SLD;
	AI_StopProcessInfos	(self);
};

/*------------------------------------------------------------------------
							WATERMAGE WERDEN	2									
------------------------------------------------------------------------*/

instance  Sld_700_Lee_BECOMEWMNOW (C_INFO)
{
	npc				= Sld_700_Lee;
	condition		= Sld_700_Lee_BECOMEWMNOW_Condition;
	information		= Sld_700_Lee_BECOMEWMNOW_Info;
	important		= 0;
	permanent		= 0;
	description		= "Chcê zostaæ Magiem Wody."; 
};

FUNC int  Sld_700_Lee_BECOMEWMNOW_Condition()
{	
	if (Lee_SldPossible == TRUE)
	&& (hero.level >= 10)
	&& (Npc_GetTrueGuild (hero) == GIL_ORG)
	&& (kapitel >= 2)
	{
		return TRUE;
	};
};

FUNC void  Sld_700_Lee_BECOMEWMNOW_Info()
{
	AI_Output			(other, self,"Sld_700_Lee_BECOMEWMNOW_Info_15_01"); //Chcê zostaæ Magiem Wody.
	AI_Output			(self, other,"Sld_700_Lee_BECOMEWMNOW_Info_08_02"); //Có¿, dokona³eœ wiele, jednak to nie ja o tym decydujê. Musisz porozmawiaæ z Cronosem. 
	
	Log_CreateTopic		(GE_BecomeWatermage,LOG_NOTE);
	B_LogEntry			(GE_BecomeWatermage,"Lee pozwoli³ mi do³¹czyæ do Magów Wody. Jednak to oni podejm¹ kluczow¹ decyzjê, czy jestem gotowy. Muszê porozmawiaæ z Cronosem.");	
};

//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################
/*------------------------------------------------------------------------
							SZENE DAMM									
------------------------------------------------------------------------*/

instance Sld_700_Lee_DAMNPAST (C_INFO)
{
	npc				= Sld_700_Lee;
	condition		= Sld_700_Lee_DAMNPAST_Condition;
	information		= Sld_700_Lee_DAMNPAST_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  Sld_700_Lee_DAMNPAST_Condition()
{	
	if (Saturas_BringFoci == 5)
	&& (Npc_GetDistToNpc (hero,self) < 1000)	
	&& (Npc_GetDistToWp (self,"NC_DAM") < 1000) 
	{
		return TRUE;
	};
};
func void  Sld_700_Lee_DAMNPAST_Info()
{
	AI_Output			(self, other,"Sld_700_Lee_DAMNPAST_Info_08_01"); //Kiedyœ wiod³em ca³kiem inne ¿ycie.
	AI_Output			(self, other,"Sld_700_Lee_DAMNPAST_Info_08_02"); //By³em jednym z najlepszych genera³ów tego królestwa.
	AI_Output			(self, other,"Sld_700_Lee_DAMNPAST_Info_08_03"); //Ca³e ¿ycie spêdzi³em broni¹c ojczyzny przed wrogiem.
	AI_Output			(self, other,"Sld_700_Lee_DAMNPAST_Info_08_04"); //Ale szlachta patrzy³a na mnie niechêtnie, bo Król wysoko ceni³ sobie moje rady. Te ³otry wiedzia³y, ¿e mogê pokrzy¿owaæ ich plany.
	AI_Output			(self, other,"Sld_700_Lee_DAMNPAST_Info_08_05"); //By³em zbyt pewny siebie i nie zauwa¿y³em side³, które na mnie zastawili. Aby mnie usun¹æ pos³u¿yli siê królewsk¹ ¿on¹.
	AI_Output			(self, other,"Sld_700_Lee_DAMNPAST_Info_08_06"); //Pos¹dzono mnie o jej zamordowanie. Rhobar nie mia³ innego wyboru.
	AI_Output			(self, other,"Sld_700_Lee_DAMNPAST_Info_08_07"); //Od szubienicy uratowa³o mnie tylko wiele lat przyk³adnej s³u¿by. W ten sposób trafi³em tutaj.
	AI_Output			(self, other,"Sld_700_Lee_DAMNPAST_Info_08_08"); //Ale pewnego dnia odzyskam wolnoœæ, a wtedy nadejdzie czas zemsty...
	
	AI_AlignToWP		(self);
	
	AI_Output			(self, other,"Sld_700_Lee_DAMNPAST_Info_08_09"); //Zemszczê siê!
	
	Npc_ExchangeRoutine (self,"START");
	
	var C_NPC Homer;
	Homer = Hlp_GetNpc	(BAU_935_HOMER);
	Npc_ExchangeRoutine	(Homer,"START"); 
	AI_ContinueRoutine	(Homer);
};

//*********************************************************
//						FMTaken									
//*********************************************************

instance  Sld_700_Lee_FMTaken (C_INFO)
{
	npc			=  Sld_700_Lee;
	nr			=  1;
	condition	=  Sld_700_Lee_FMTaken_Condition;
	information	=  Sld_700_Lee_FMTaken_Info;
	permanent	=  1;
	description = "Co myœlisz o ca³ej tej sprawie z kopalni¹?";
};                       

FUNC int  Sld_700_Lee_FMTaken_Condition()
{
	if	FMTaken
	{
		return TRUE;
	};
};

FUNC VOID  Sld_700_Lee_FMTaken_Info()
{
	AI_Output (other, self,"DIA_Lee_FMTaken_15_00"); //Co myœlisz o ca³ej tej sprawie z kopalni¹?
	
	if (Lee_freeminereport == 0) 					//SC hat jetzt die Möglichkeit, Lee über die freie Mine zu informieren! ***Björn***
	{
	
		AI_Output (self, other,"DIA_Lee_FMTaken_08_01"); //Tym razem posunêli siê za daleko. Jeszcze tego po¿a³uj¹.
	
	}
	else
	{
		AI_Output			(hero, self,"Info_Lee_now_freeminefree_15_01"); 	//Myœlê, ¿e zagro¿enie ju¿ minê³o.
		AI_Output			(self, hero,"Sld_700_Lee_CHANGESIDE_Info_08_02"); 	//Nasz Obóz wiele ci zawdziêcza. Przyda³by mi siê ktoœ taki jak ty.
		AI_Output			(hero, self,"Info_FreemineOrc_EXIT_15_03"); 		//Dziêkujê. Muszê ju¿ ruszaæ w dalsz¹ drogê.
		AI_Output			(self, hero,"Info_CorAngar_TELEPORT_08_01"); 		//Jeszcze coœ!
		AI_Output			(self, hero,"Info_CorAngar_TELEPORT_08_03"); 		//WeŸ tê magiczn¹ runê jako symbol naszej wdziêcznoœci za twoje dokonania.
		AI_Output			(hero, self,"Info_CorAngar_TELEPORT_15_05"); 		//Dziêkujê!
		AI_Output			(hero,	self,"Info_Exit_Info_15_01"); 				//Do zobaczenia!


		B_LogEntry			(CH4_BannedFromOC,	"Poinformowa³em Lee o wynikach akcji, któr¹ przeprowadzi³em wraz z Gornem w Wolnej Kopalni. By³ bardzo zadowolony.");
		
 	   	B_GiveInvItems (self,other, ItArRuneFirestorm, 1);
		B_GiveXP (500);		
		Lee_freeminereport = 0;
	};
};

/*------------------------------------------------------------------------
						WECHSEL VON GRD ZU SLD								
------------------------------------------------------------------------*/
instance  Sld_700_Lee_CHANGESIDE (C_INFO)
{
	npc				= Sld_700_Lee;
	condition		= Sld_700_Lee_CHANGESIDE_Condition;
	information		= Sld_700_Lee_CHANGESIDE_Info;
	important		= 0;
	permanent		= 0;
	description		= "Wyrzucono mnie ze Starego Obozu. Chcia³bym do was do³¹czyæ."; 
};

FUNC int  Sld_700_Lee_CHANGESIDE_Condition()
{	
	if (Npc_KnowsInfo (hero,KDW_600_Saturas_GOTOLEE))
	{
		return TRUE;
	};

};

FUNC void  Sld_700_Lee_CHANGESIDE_Info()
{
	AI_Output			(other, self,"Sld_700_Lee_CHANGESIDE_Info_15_01"); //Wyrzucono mnie ze Starego Obozu. Chcia³bym do was do³¹czyæ.
	AI_Output			(self, other,"Sld_700_Lee_CHANGESIDE_Info_08_02"); //Nasz Obóz wiele ci zawdziêcza. Przyda³by mi siê ktoœ taki jak ty.
	AI_Output			(self, other,"Sld_700_Lee_CHANGESIDE_Info_08_03"); //PrzejdŸmy od razu do rzeczy. Witaj w Nowym Obozie, Najemniku!
	AI_Output			(self, other,"Sld_700_Lee_CHANGESIDE_Info_08_04"); //WeŸ tê zbrojê. Dobrze, ¿e mamy ciê teraz po naszej stronie.

	CreateInvItem		(self, SLD_ARMOR_M);
	B_GiveInvItems      (self, hero, SLD_ARMOR_M, 1);
	Npc_GetInvItemBySlot(hero, INV_ARMOR, 2);
	if (Hlp_GetInstanceID(item)==SLD_ARMOR_M)
	{	
		AI_EquipArmor	(hero, item);
	};
	
	Npc_SetTrueGuild	(hero, GIL_SLD);
	hero.guild = GIL_SLD;

	B_LogEntry			(CH4_BannedFromOC,"Po tym jak zosta³em wygnany ze Starego Obozu, postanowi³em zostaæ Najemnikiem. Pora wracaæ do Saturasa!");

	Log_CreateTopic 	(GE_TeacherNC,LOG_NOTE);
	B_LogEntry			(GE_TeacherNC,"Lee mo¿e mnie nauczyæ walki dwurêcznym orê¿em oraz zwiêkszyæ moj¹ si³ê i zwinnoœæ.");
};  

/*------------------------------------------------------------------------
							ARMOR									
------------------------------------------------------------------------*/
instance  Sld_700_Lee_ARMOR (C_INFO)
{
	npc				= Sld_700_Lee;
	condition		= Sld_700_Lee_ARMOR_Condition;
	information		= Sld_700_Lee_ARMOR_Info;
	important		= 0;
	permanent		= 1;
	description		= "Przyda³aby mi siê lepsza zbroja."; 
};

FUNC int  Sld_700_Lee_ARMOR_Condition()
{	
	if  (Npc_GetTrueGuild (hero) == GIL_SLD)
	{
		return TRUE;
	};

};
FUNC void  Sld_700_Lee_ARMOR_Info()
{
	AI_Output				(other, self,"Sld_700_Lee_ARMOR_Info_15_01"); //Przyda³aby mi siê lepsza zbroja.
	AI_Output				(self, other,"Sld_700_Lee_ARMOR_Info_08_02"); //Najpierw musisz sobie na ni¹ zas³u¿yæ. Poza tym - taka rzecz nie jest tania.
	
	Info_ClearChoices	(Sld_700_Lee_ARMOR);
	Info_AddChoice		(Sld_700_Lee_ARMOR,DIALOG_BACK,Sld_700_Lee_ARMOR_BACK);
	Info_AddChoice		(Sld_700_Lee_ARMOR,B_BuildBuyArmorString(NAME_LeeMercs, VALUE_SLD_ARMOR_M) ,Sld_700_Lee_ARMOR_M);
	Info_AddChoice		(Sld_700_Lee_ARMOR,B_BuildBuyArmorString(NAME_LeeHeavyMercs, VALUE_SLD_ARMOR_H),Sld_700_Lee_ARMOR_H);
};  
func void Sld_700_Lee_ARMOR_BACK()
{
	Info_ClearChoices (Sld_700_Lee_ARMOR);
};
func void Sld_700_Lee_ARMOR_M()
{
	AI_Output				(other, self,"Sld_700_Lee_ARMOR_M_Info_08_01"); //Chcia³bym dostaæ wzmocnion¹ zbrojê.
	if (Kapitel < 3)
	{
		AI_Output			(self, other,"Sld_700_Lee_ARMOR_M_Info_08_02"); //Nie jesteœ jeszcze doœæ doœwiadczony, ¿eby otrzymaæ nowy pancerz. Wróæ, jak zdobêdziesz trochê doœwiadczenia.
	}
	else if (Npc_HasItems (hero,ItMinugget) < VALUE_SLD_ARMOR_M) 
	{
		AI_Output			(self, other,"Sld_700_Lee_ARMOR_M_Info_08_03"); //Bez rudy te¿ nie masz co marzyæ o nowej zbroi.
	}
	else 
	{
		AI_Output			(self, other,"Sld_700_Lee_ARMOR_M_Info_08_04"); //Ta zbroja to kawa³ solidnej roboty. Bêdzie ci dobrze s³u¿yæ.
		B_GiveInvItems  	(hero, self, ItMinugget,VALUE_SLD_ARMOR_M);
		CreateInvItem		(hero,SLD_ARMOR_M);
		
		CreateInvItem		(self, ItAmArrow);
		B_GiveInvItems      (self, hero, ItAmArrow, 1);
		Npc_RemoveInvItem	(hero, ItAmArrow);
	};
};
func void Sld_700_Lee_ARMOR_H()
{
	AI_Output				(other, self,"Sld_700_Lee_ARMOR_H_Info_08_01"); //Chcia³bym dostaæ ciê¿k¹ zbrojê.
	if (Kapitel < 4)
	{
		AI_Output			(self, other,"Sld_700_Lee_ARMOR_H_Info_08_02"); //Nie jesteœ jeszcze doœæ doœwiadczony, ¿eby otrzymaæ nowy pancerz. Wróæ, jak zdobêdziesz trochê doœwiadczenia.
	}
	else if (Npc_HasItems(hero,ItMinugget) < VALUE_SLD_ARMOR_H) 
	{
		AI_Output			(self, other,"Sld_700_Lee_ARMOR_H_Info_08_03"); //Bez rudy te¿ nie masz co marzyæ o nowej zbroi.
	}
	else 
	{
		AI_Output			(self, other,"Sld_700_Lee_ARMOR_H_Info_08_04"); //Ten pancerz to prawdziwe dzie³o sztuki. Lepszego nie znajdziesz po tej stronie Bariery. Mo¿esz mi wierzyæ, wart jest ka¿dej bry³ki...
		B_GiveInvItems  	(hero, self, ItMinugget,VALUE_SLD_ARMOR_H);

		CreateInvItem		(hero,SLD_ARMOR_H);	//SN: ohne B_GiveInvItem, weil sonst Lee nackt dasteht!

		// nur wegen Bildschirmausgabe "1 Gegenstand erhalten"
		CreateInvItem		(self, ItAmArrow);
		B_GiveInvItems      (self, hero, ItAmArrow, 1);
		Npc_RemoveInvItem	(hero, ItAmArrow);
	};

};
/*------------------------------------------------------------------------
							STR + DEX								
------------------------------------------------------------------------*/
INSTANCE Sld_700_Lee_Teach(C_INFO)
{
	npc			= Sld_700_Lee;
	nr			= 10;
	condition	= Sld_700_Lee_Teach_Condition;
	information	= Sld_700_Lee_Teach_Info;
	permanent	= 1;
	description = "Mo¿esz mnie czegoœ nauczyæ?";
};                       

FUNC INT Sld_700_Lee_Teach_Condition()
{
	if (Npc_GetTrueGuild (hero) == GIL_SLD)
	  
	{
		return TRUE;
	};
};

FUNC VOID Sld_700_Lee_Teach_Info()
{
	AI_Output(other,self,"Sld_700_Lee_Teach_15_00"); //Mo¿esz mnie czegoœ nauczyæ?
	AI_Output(self,other,"Sld_700_Lee_Teach_08_01"); //Mogê ci pomóc zwiêkszyæ twoj¹ si³ê i zrêcznoœæ.
	
	
	
	Info_ClearChoices	(Sld_700_Lee_Teach);
	Info_AddChoice		(Sld_700_Lee_Teach,DIALOG_BACK																,Sld_700_Lee_Teach_BACK);
	Info_AddChoice		(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)		,Sld_700_Lee_Teach_STR_5);
	Info_AddChoice		(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)		,Sld_700_Lee_Teach_STR_1);
	Info_AddChoice		(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,Sld_700_Lee_Teach_DEX_5);
	Info_AddChoice		(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)		,Sld_700_Lee_Teach_DEX_1);
};

func void Sld_700_Lee_Teach_BACK()
{
	
	Info_ClearChoices	(Sld_700_Lee_Teach);
};

func void Sld_700_Lee_Teach_STR_1()
{
	Mod_KupAtrybut (hero, ATR_STRENGTH, 1);
	Info_ClearChoices	(Sld_700_Lee_Teach);
	Info_AddChoice		(Sld_700_Lee_Teach,DIALOG_BACK																,Sld_700_Lee_Teach_BACK);
	Info_AddChoice		(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)		,Sld_700_Lee_Teach_STR_5);
	Info_AddChoice		(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)		,Sld_700_Lee_Teach_STR_1);
	Info_AddChoice		(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,Sld_700_Lee_Teach_DEX_5);
	Info_AddChoice		(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)		,Sld_700_Lee_Teach_DEX_1);
};

func void Sld_700_Lee_Teach_STR_5()
{
	Mod_KupAtrybut (hero, ATR_STRENGTH, 5);
	Info_ClearChoices	(Sld_700_Lee_Teach);
	Info_AddChoice		(Sld_700_Lee_Teach,DIALOG_BACK																,Sld_700_Lee_Teach_BACK);
	Info_AddChoice		(Sld_700_Lee_Teach,B_BuildLearnString( NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)		,Sld_700_Lee_Teach_STR_5);
	Info_AddChoice		(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)		,Sld_700_Lee_Teach_STR_1);
	Info_AddChoice		(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,Sld_700_Lee_Teach_DEX_5);
	Info_AddChoice		(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)		,Sld_700_Lee_Teach_DEX_1);
};

func void Sld_700_Lee_Teach_DEX_1()
{
	B_BuyAttributePoints (other, ATR_DEXTERITY, LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices	(Sld_700_Lee_Teach);
	Info_AddChoice		(Sld_700_Lee_Teach,DIALOG_BACK																,Sld_700_Lee_Teach_BACK);
	Info_AddChoice		(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)		,Sld_700_Lee_Teach_STR_5);
	Info_AddChoice		(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)		,Sld_700_Lee_Teach_STR_1);
	Info_AddChoice		(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,Sld_700_Lee_Teach_DEX_5);
	Info_AddChoice		(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)		,Sld_700_Lee_Teach_DEX_1);
};

func void Sld_700_Lee_Teach_DEX_5()
{
	Mod_KupAtrybut (hero, ATR_DEXTERITY, 5);
	Info_ClearChoices	(Sld_700_Lee_Teach);
	Info_AddChoice		(Sld_700_Lee_Teach,DIALOG_BACK																,Sld_700_Lee_Teach_BACK);
	Info_AddChoice		(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)		,Sld_700_Lee_Teach_STR_5);
	Info_AddChoice		(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)		,Sld_700_Lee_Teach_STR_1);
	Info_AddChoice		(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,Sld_700_Lee_Teach_DEX_5);
	Info_AddChoice		(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)		,Sld_700_Lee_Teach_DEX_1);
};
//---------------------------------------------------------------
// NAUKA WALKI ORÊ¯EM 2H
//---------------------------------------------------------------
instance  SLD_700_Lee_TEACH_2H (C_INFO)
{
	npc				= Sld_700_Lee;
	condition		= SLD_700_Lee_TEACH_2H_Condition;
	information		= SLD_700_Lee_TEACH_2H_Info;
	permanent		= 0;
	description		= "Mo¿esz mnie nauczyæ lepiej walczyæ dwurêcznym orê¿em?"; 
};
//
FUNC int  SLD_700_Lee_TEACH_2H_Condition()
{	
		return TRUE;
};

FUNC void  SLD_700_Lee_TEACH_2H_Info()
{
	AI_Output (other, self,"SLD_700_Lee_TEACH_2H_Info_15_01"); //Mo¿esz mnie nauczyæ lepiej walczyæ?
	AI_Output (self, other,"SLD_700_Lee_TEACH_2H_Info_09_02"); //Dobrze, ale musisz byæ cz³onkiem Nowego Obozu. 

	//if (log_Leefight == FALSE)
	//{
		Log_CreateTopic   	(GE_TeacherNC,LOG_NOTE);
		B_LogEntry			(GE_TeacherNC,"Lee mo¿e mnie nauczyæ walki dwurêcznym orê¿em, gdy tylko zostanê cz³onkiem Nowego Obozu.");
	//	log_Leefight = TRUE;
	//};
}; 

//---------------------------------------------------------------
// NAUKA WALKI ORÊ¯EM 2H
//---------------------------------------------------------------
instance  SLD_700_Lee_TEACH_2H_START (C_INFO)
{
	npc				= Sld_700_Lee;
	condition		= SLD_700_Lee_TEACH_2H_START_Condition;
	information		= SLD_700_Lee_TEACH_2H_START_Info;
	permanent		= 1;
	description		= "Zacznijmy trening."; 
};
//
FUNC int  SLD_700_Lee_TEACH_2H_START_Condition()
{	
	if (Npc_KnowsInfo (hero, SLD_700_Lee_TEACH_2H))
	&& ((Npc_GetTrueGuild    (hero) == GIL_SLD) || (Npc_GetTrueGuild    (hero) == GIL_ORG) || (Npc_GetTrueGuild    (hero) == GIL_SFB) || (Npc_GetTrueGuild    (hero) == GIL_KDW) || ( (Npc_GetTrueGuild(hero) == GIL_NONE) && (kapitel >= 4)))
	{
	return TRUE;
	};
};

FUNC void  SLD_700_Lee_TEACH_2H_START_Info()
{
	AI_Output (other, self,"SLD_700_Lee_TEACH_2H_START_Info_15_01"); //Zacznijmy trening.
	AI_Output (self, other,"SLD_700_Lee_TEACH_2H_START_Info_09_02"); //No dobra.

Info_ClearChoices	(SLD_700_Lee_TEACH_2H_START);
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,DIALOG_BACK,SLD_700_Lee_TEACH_2H_STARTBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 0) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Broñ dwurêczna, poziom 1, 100 bry³ek rudy, 10 PN",Lee_teach_2h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 1) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Broñ dwurêczna, poziom 2, 200 bry³ek rudy, 10 PN",Lee_teach_2h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 2) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Broñ dwurêczna, poziom 3, 300 bry³ek rudy, 10 PN",Lee_teach_2h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 3) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Broñ dwurêczna, poziom 4, 400 bry³ek rudy, 10 PN",Lee_teach_2h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 4) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Broñ dwurêczna, poziom 5, 500 bry³ek rudy, 10 PN",Lee_teach_2h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 5) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Broñ dwurêczna, poziom 6, 600 bry³ek rudy, 10 PN",Lee_teach_2h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 6) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Broñ dwurêczna, poziom 7, 1000 bry³ek rudy, 10 PN",Lee_teach_2h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 7) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Broñ dwurêczna, poziom 8, 1500 bry³ek rudy, 10 PN",Lee_teach_2h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 8) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Broñ dwurêczna, poziom 9, 2000 bry³ek rudy, 10 PN",Lee_teach_2h9);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 9) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Broñ dwurêczna, poziom 10, 2500 bry³ek rudy, 10 PN",Lee_teach_2h10);
	};
};

func void SLD_700_Lee_TEACH_2H_STARTBACK ()
{
	Info_ClearChoices	(SLD_700_Lee_TEACH_2H_START);
};

FUNC VOID Lee_teach_2h1 ()
{
	AI_Output (other,self,"DIA_Lee_TRAIN_2h_15_00"); //Chcia³bym nauczyæ siê walki dwurêcznym orê¿em.
	if (Npc_HasItems(other,itminugget) >= 100)
	{
		if (B_GiveSkill(other, NPC_TALENT_2h, 1, 10))
		{
		AI_Output (self,other,"DIA_Lee_TRAIN_2h_npc_01"); //Bronie dwurêczne wymagaj¹ sporo si³y. S¹ ciê¿kie, a przez to tak¿e wolniejsze.
		AI_Output (self,other,"DIA_Lee_TRAIN_2h_npc_02"); //Zmieni siê to jednak w trakcie czynienia przez ciebie postêpów w nauce.
		AI_Output (self,other,"DIA_Lee_TRAIN_2h_npc_03"); //Za powolnoœæ bronie dwurêczne odwdziêcz¹ ci siê potê¿nymi obra¿eniami.
		AI_Output (self,other,"DIA_Lee_TRAIN_2h_npc_04"); //Ka¿d¹ broñ musisz odpowiednio wyczuæ. Topory s¹ inaczej zbalansowane ni¿ miecze. Pamiêtaj o tym.
		B_GiveInvItems(other,self,itminugget,100);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Lee_TRAIN_2h_NoOre_01_00"); //Nie masz wystarczaj¹cej iloœci rudy!
	};	
	Info_ClearChoices	(SLD_700_Lee_TEACH_2H_START);
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,DIALOG_BACK,SLD_700_Lee_TEACH_2H_STARTBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 0) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Broñ dwurêczna, poziom 1, 100 bry³ek rudy, 10 PN",Lee_teach_2h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 1) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Broñ dwurêczna, poziom 2, 200 bry³ek rudy, 10 PN",Lee_teach_2h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 2) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Broñ dwurêczna, poziom 3, 300 bry³ek rudy, 10 PN",Lee_teach_2h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 3) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Broñ dwurêczna, poziom 4, 400 bry³ek rudy, 10 PN",Lee_teach_2h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 4) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Broñ dwurêczna, poziom 5, 500 bry³ek rudy, 10 PN",Lee_teach_2h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 5) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Broñ dwurêczna, poziom 6, 600 bry³ek rudy, 10 PN",Lee_teach_2h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 6) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Broñ dwurêczna, poziom 7, 1000 bry³ek rudy, 10 PN",Lee_teach_2h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 7) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Broñ dwurêczna, poziom 8, 1500 bry³ek rudy, 10 PN",Lee_teach_2h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 8) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Broñ dwurêczna, poziom 9, 2000 bry³ek rudy, 10 PN",Lee_teach_2h9);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 9) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Broñ dwurêczna, poziom 10, 2500 bry³ek rudy, 10 PN",Lee_teach_2h10);
	};
};

FUNC VOID Lee_teach_2h2 ()
{
	AI_Output (other,self,"DIA_Lee_TRAIN_2h_15_01"); //Naucz mnie sprawniej pos³ugiwaæ siê dwurêczn¹ broni¹.
	if (Npc_HasItems(other,itminugget) >= 200)
	{
		if (B_GiveSkill(other, NPC_TALENT_2h, 2, 10))
		{
		AI_Output (self,other,"DIA_Lee_TRAIN_2h_npc_06"); //Musisz pracowaæ nad swoj¹ si³¹. Pozwoli ci ona wykonywaæ szybsze ruchy i podnosiæ coraz ciê¿sze bronie. 
		//AI_DrawWeapon (other);
		AI_Output (self,other,"DIA_Lee_TRAIN_2h_npc_07"); //PóŸniej bêdziesz musia³ poznaæ odpowiedni¹ technikê walki i ³¹cznia ciosów. 
		//AI_RemoveWeapon (other);
		AI_Output (self,other,"DIA_Lee_TRAIN_2h_npc_08"); //Na razie nie jesteœ wstanie zadaæ pe³nych obra¿eñ na jakie pozwala ci dana broñ. Spokojnie, zajmiemy siê tym.
		B_GiveInvItems(other,self,itminugget,200);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Lee_TRAIN_2h_NoOre_01_00"); //Nie masz wystarczaj¹cej iloœci rudy!
	};	
	Info_ClearChoices	(SLD_700_Lee_TEACH_2H_START);
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,DIALOG_BACK,SLD_700_Lee_TEACH_2H_STARTBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 0) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Broñ dwurêczna, poziom 1, 100 bry³ek rudy, 10 PN",Lee_teach_2h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 1) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Broñ dwurêczna, poziom 2, 200 bry³ek rudy, 10 PN",Lee_teach_2h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 2) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Broñ dwurêczna, poziom 3, 300 bry³ek rudy, 10 PN",Lee_teach_2h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 3) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Broñ dwurêczna, poziom 4, 400 bry³ek rudy, 10 PN",Lee_teach_2h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 4) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Broñ dwurêczna, poziom 5, 500 bry³ek rudy, 10 PN",Lee_teach_2h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 5) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Broñ dwurêczna, poziom 6, 600 bry³ek rudy, 10 PN",Lee_teach_2h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 6) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Broñ dwurêczna, poziom 7, 1000 bry³ek rudy, 10 PN",Lee_teach_2h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 7) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Broñ dwurêczna, poziom 8, 1500 bry³ek rudy, 10 PN",Lee_teach_2h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 8) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Broñ dwurêczna, poziom 9, 2000 bry³ek rudy, 10 PN",Lee_teach_2h9);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 9) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Broñ dwurêczna, poziom 10, 2500 bry³ek rudy, 10 PN",Lee_teach_2h10);
	};
};

FUNC VOID Lee_teach_2h3 ()
{
	AI_Output (other,self,"DIA_Lee_TRAIN_2h_15_01"); //Naucz mnie sprawniej pos³ugiwaæ siê dwurêczn¹ broni¹.
	if (Npc_HasItems(other,itminugget) >= 300)
	{
		if (B_GiveSkill(other, NPC_TALENT_2h, 3, 10))
		{
		AI_Output (self,other,"DIA_Lee_TRAIN_2h_npc_10"); //Wiesz jaka jest jeszcze zaleta dwurêcznych broni?
		AI_Output (self,other,"DIA_Lee_TRAIN_2h_npc_11"); //S¹ d³ugie... Im d³u¿sze tym dalej od siebie mo¿esz trzymaæ przeciwnika. 
		AI_Output (self,other,"DIA_Lee_TRAIN_2h_npc_12"); //Gdy kupujesz broñ zwracaj uwagê na jej górn¹ czêœæ. Jeœli jest wystarczaj¹co ostra to nawet draœniêcie oponenta z daleka zada mu obra¿enia lub zniszczy jego pancerz. 
		AI_Output (self,other,"DIA_Lee_TRAIN_2h_npc_13"); //Poka¿ mi jeszcze jak wyci¹gasz broñ. Robisz jakieœ postêpy?
		AI_DrawWeapon (other);
		AI_Output (self,other,"DIA_Lee_TRAIN_2h_npc_14"); //Nie, nie, nie. Omówimy to na nastêpnej lekcji. 
		AI_RemoveWeapon (other);
		B_GiveInvItems(other,self,itminugget,300);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Lee_TRAIN_2h_NoOre_01_00"); //Nie masz wystarczaj¹cej iloœci rudy!
	};	
	Info_ClearChoices	(SLD_700_Lee_TEACH_2H_START);
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,DIALOG_BACK,SLD_700_Lee_TEACH_2H_STARTBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 0) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Broñ dwurêczna, poziom 1, 100 bry³ek rudy, 10 PN",Lee_teach_2h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 1) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Broñ dwurêczna, poziom 2, 200 bry³ek rudy, 10 PN",Lee_teach_2h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 2) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Broñ dwurêczna, poziom 3, 300 bry³ek rudy, 10 PN",Lee_teach_2h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 3) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Broñ dwurêczna, poziom 4, 400 bry³ek rudy, 10 PN",Lee_teach_2h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 4) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Broñ dwurêczna, poziom 5, 500 bry³ek rudy, 10 PN",Lee_teach_2h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 5) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Broñ dwurêczna, poziom 6, 600 bry³ek rudy, 10 PN",Lee_teach_2h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 6) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Broñ dwurêczna, poziom 7, 1000 bry³ek rudy, 10 PN",Lee_teach_2h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 7) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Broñ dwurêczna, poziom 8, 1500 bry³ek rudy, 10 PN",Lee_teach_2h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 8) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Broñ dwurêczna, poziom 9, 2000 bry³ek rudy, 10 PN",Lee_teach_2h9);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 9) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Broñ dwurêczna, poziom 10, 2500 bry³ek rudy, 10 PN",Lee_teach_2h10);
	};
};

FUNC VOID Lee_teach_2h4 ()
{
	AI_Output (other,self,"DIA_Lee_TRAIN_2h_15_01"); //Naucz mnie sprawniej pos³ugiwaæ siê dwurêczn¹ broni¹.
	if (Npc_HasItems(other,itminugget) >= 400)
	{
		if (B_GiveSkill(other, NPC_TALENT_2h, 4, 10))
		{
		AI_Output (self, other,"SLD_700_Lee_ZWEIHAND1_Info_09_03"); //Wyci¹gnij miecz przed siebie. Aby zaatakowaæ wroga tak ciê¿k¹ broni¹, musisz mocniej siê zamachn¹æ.
		AI_Output (self, other,"SLD_700_Lee_ZWEIHAND1_Info_09_04"); //Unieœ ramiê i zdecydowanie opuœæ miecz. To powinno wystarczyæ, ¿eby powaliæ przeciwnika na ziemiê.
		AI_Output (self, other,"SLD_700_Lee_ZWEIHAND1_Info_09_05"); //Wykorzystaj bezw³adnoœæ broni, by unieœæ j¹ ponownie do góry.
		AI_Output (self, other,"SLD_700_Lee_ZWEIHAND1_Info_09_06"); //Dwurêczne miecze œwietnie sprawdzaj¹ siê przy zadawaniu ciosów z boku. W ten sposób mo¿esz trzymaæ przeciwnika na dystans.
		AI_Output (self, other,"SLD_700_Lee_ZWEIHAND1_Info_09_07"); //To ci powinno wystarczyæ na pocz¹tek. Teraz trochê poæwicz.
		B_GiveInvItems(other,self,itminugget,400);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Lee_TRAIN_2h_NoOre_01_00"); //Nie masz wystarczaj¹cej iloœci rudy!
	};	
Info_ClearChoices	(SLD_700_Lee_TEACH_2H_START);
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,DIALOG_BACK,SLD_700_Lee_TEACH_2H_STARTBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 0) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Broñ dwurêczna, poziom 1, 100 bry³ek rudy, 10 PN",Lee_teach_2h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 1) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Broñ dwurêczna, poziom 2, 200 bry³ek rudy, 10 PN",Lee_teach_2h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 2) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Broñ dwurêczna, poziom 3, 300 bry³ek rudy, 10 PN",Lee_teach_2h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 3) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Broñ dwurêczna, poziom 4, 400 bry³ek rudy, 10 PN",Lee_teach_2h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 4) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Broñ dwurêczna, poziom 5, 500 bry³ek rudy, 10 PN",Lee_teach_2h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 5) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Broñ dwurêczna, poziom 6, 600 bry³ek rudy, 10 PN",Lee_teach_2h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 6) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Broñ dwurêczna, poziom 7, 1000 bry³ek rudy, 10 PN",Lee_teach_2h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 7) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Broñ dwurêczna, poziom 8, 1500 bry³ek rudy, 10 PN",Lee_teach_2h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 8) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Broñ dwurêczna, poziom 9, 2000 bry³ek rudy, 10 PN",Lee_teach_2h9);
	};	
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 9) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Broñ dwurêczna, poziom 10, 2500 bry³ek rudy, 10 PN",Lee_teach_2h10);
	};
};

FUNC VOID Lee_teach_2h5 ()
{
	AI_Output (other,self,"DIA_Lee_TRAIN_2h_15_01"); //Naucz mnie sprawniej pos³ugiwaæ siê dwurêczn¹ broni¹.
	if (Npc_HasItems(other,itminugget) >= 500)
	{
		if (B_GiveSkill(other, NPC_TALENT_2h, 5, 10))
		{
		AI_Output (self,other,"DIA_Lee_TRAIN_2h_npc_15"); //Na poprzedniej lekcji nauczy³em ciê jak porz¹dnie trzymaæ broñ i jak wykorzystaæ si³ê bezw³adnoœci ostrza.
		AI_Output (self,other,"DIA_Lee_TRAIN_2h_npc_16"); //Pamiêtaj, ¿e im lepiej wyczujesz balans broni tym ³atwiej bêdzie ci ³¹czyæ kolejne ciosy.
		AI_Output (self,other,"DIA_Lee_TRAIN_2h_npc_17"); //Musisz wiedzieæ, w którym momencie ponownie siê zamachn¹æ, tak by wykorzystaæ przy tym impet pierwszego uderzenia. Pozwoli ci to oszczêdziæ si³y.
			B_GiveInvItems(other,self,itminugget,500);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Lee_TRAIN_2h_NoOre_01_00"); //Nie masz wystarczaj¹cej iloœci rudy!
	};	
Info_ClearChoices	(SLD_700_Lee_TEACH_2H_START);
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,DIALOG_BACK,SLD_700_Lee_TEACH_2H_STARTBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 0) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Broñ dwurêczna, poziom 1, 100 bry³ek rudy, 10 PN",Lee_teach_2h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 1) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Broñ dwurêczna, poziom 2, 200 bry³ek rudy, 10 PN",Lee_teach_2h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 2) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Broñ dwurêczna, poziom 3, 300 bry³ek rudy, 10 PN",Lee_teach_2h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 3) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Broñ dwurêczna, poziom 4, 400 bry³ek rudy, 10 PN",Lee_teach_2h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 4) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Broñ dwurêczna, poziom 5, 500 bry³ek rudy, 10 PN",Lee_teach_2h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 5) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Broñ dwurêczna, poziom 6, 600 bry³ek rudy, 10 PN",Lee_teach_2h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 6) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Broñ dwurêczna, poziom 7, 1000 bry³ek rudy, 10 PN",Lee_teach_2h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 7) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Broñ dwurêczna, poziom 8, 1500 bry³ek rudy, 10 PN",Lee_teach_2h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 8) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Broñ dwurêczna, poziom 9, 2000 bry³ek rudy, 10 PN",Lee_teach_2h9);
	};	
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 9) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Broñ dwurêczna, poziom 10, 2500 bry³ek rudy, 10 PN",Lee_teach_2h10);
	};
};

FUNC VOID Lee_teach_2h6 ()
{
	AI_Output (other,self,"DIA_Lee_TRAIN_2h_15_01"); //Naucz mnie sprawniej pos³ugiwaæ siê dwurêczn¹ broni¹.
	if (Npc_HasItems(other,itminugget) >= 600)
	{
		if (B_GiveSkill(other, NPC_TALENT_2h, 6, 10))
		{
		AI_Output (self,other,"DIA_Lee_TRAIN_2h_npc_18"); //Stosuj ró¿ne strategie walki. Uderzaj raz z przodu, raz z boku. A póŸniej jeszcze z drugiej strony. 
		AI_Output (self,other,"DIA_Lee_TRAIN_2h_npc_19"); //Uniki z dwurêcznym mieczem w rêku faktycznie mog¹ byæ trudne, dlatego musisz parowaæ ciosy. Æwicz si³ê miêœni r¹k, pleców i klatki piersiowej. 
		AI_Output (self,other,"DIA_Lee_TRAIN_2h_npc_20"); //To pozwoli ci skutecznie blokowaæ, bez ryzyka po³amania sobie czegoœ. 
		B_GiveInvItems(other,self,itminugget,600);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Lee_TRAIN_2h_NoOre_01_00"); //Nie masz wystarczaj¹cej iloœci rudy!
	};
Info_ClearChoices	(SLD_700_Lee_TEACH_2H_START);
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,DIALOG_BACK,SLD_700_Lee_TEACH_2H_STARTBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 0) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Broñ dwurêczna, poziom 1, 100 bry³ek rudy, 10 PN",Lee_teach_2h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 1) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Broñ dwurêczna, poziom 2, 200 bry³ek rudy, 10 PN",Lee_teach_2h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 2) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Broñ dwurêczna, poziom 3, 300 bry³ek rudy, 10 PN",Lee_teach_2h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 3) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Broñ dwurêczna, poziom 4, 400 bry³ek rudy, 10 PN",Lee_teach_2h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 4) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Broñ dwurêczna, poziom 5, 500 bry³ek rudy, 10 PN",Lee_teach_2h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 5) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Broñ dwurêczna, poziom 6, 600 bry³ek rudy, 10 PN",Lee_teach_2h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 6) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Broñ dwurêczna, poziom 7, 1000 bry³ek rudy, 10 PN",Lee_teach_2h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 7) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Broñ dwurêczna, poziom 8, 1500 bry³ek rudy, 10 PN",Lee_teach_2h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 8) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Broñ dwurêczna, poziom 9, 2000 bry³ek rudy, 10 PN",Lee_teach_2h9);
	};	
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 9) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Broñ dwurêczna, poziom 10, 2500 bry³ek rudy, 10 PN",Lee_teach_2h10);
	};
};

FUNC VOID Lee_teach_2h7 ()
{
	AI_Output (other,self,"DIA_Lee_TRAIN_2h_15_01"); //Naucz mnie sprawniej pos³ugiwaæ siê dwurêczn¹ broni¹.
	if (Npc_HasItems(other,itminugget) >= 1000)
	{
		if (B_GiveSkill(other, NPC_TALENT_2h, 7, 10))
		{
		AI_Output (self, other,"SLD_700_Lee_ZWEIHAND2_Info_09_02"); //Musisz siê nauczyæ p³ynnie przenosiæ œrodek ciê¿koœci. Trzymaj miecz pionowo. Obie d³onie mocno zaciœnij na jego rêkojeœci i przesuñ go nieco w bok.
		AI_Output (self, other,"SLD_700_Lee_ZWEIHAND2_Info_09_03"); //Teraz uderz szybko od góry, i pozwól klindze powêdrowaæ nad twoje ramiê. Teraz mo¿esz wyprowadziæ szybkie ciêcie na prawo.
		AI_Output (self, other,"SLD_700_Lee_ZWEIHAND2_Info_09_04"); //Twój przeciwnik nie bêdzie mia³ okazji podejœæ bli¿ej.
		AI_Output (self, other,"SLD_700_Lee_ZWEIHAND2_Info_09_05"); //Albo spróbuj wyprowadziæ z lewej strony cios do przodu, aby odrzuciæ od siebie rywala.
		AI_Output (self, other,"SLD_700_Lee_ZWEIHAND2_Info_09_06"); //Teraz obrót, ¿eby kolejny cios nabra³ odpowiedniej mocy. Przy odrobinie szczêœcia wróg nie prze¿yje tego uderzenia.
		AI_Output (self, other,"SLD_700_Lee_ZWEIHAND2_Info_09_07"); //A jeœli i to nie wystarczy, wykorzystaj resztê si³y zamachowej, by ponownie unieœæ miecz do góry.
		AI_Output (self, other,"SLD_700_Lee_ZWEIHAND2_Info_09_08"); //Po skoñczonym ataku wykonaj zas³onê i wypatruj luki w obronie przeciwnika.
		AI_Output (self, other,"SLD_700_Lee_ZWEIHAND2_Info_09_09"); //Kluczem do sukcesu jest ci¹g³a zmiana pozycji i umiejêtne wykorzystanie bezw³adnoœci broni.
		B_GiveInvItems(other,self,itminugget,1000);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Lee_TRAIN_2h_NoOre_01_00"); //Nie masz wystarczaj¹cej iloœci rudy!
	};	
Info_ClearChoices	(SLD_700_Lee_TEACH_2H_START);
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,DIALOG_BACK,SLD_700_Lee_TEACH_2H_STARTBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 0) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Broñ dwurêczna, poziom 1, 100 bry³ek rudy, 10 PN",Lee_teach_2h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 1) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Broñ dwurêczna, poziom 2, 200 bry³ek rudy, 10 PN",Lee_teach_2h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 2) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Broñ dwurêczna, poziom 3, 300 bry³ek rudy, 10 PN",Lee_teach_2h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 3) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Broñ dwurêczna, poziom 4, 400 bry³ek rudy, 10 PN",Lee_teach_2h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 4) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Broñ dwurêczna, poziom 5, 500 bry³ek rudy, 10 PN",Lee_teach_2h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 5) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Broñ dwurêczna, poziom 6, 600 bry³ek rudy, 10 PN",Lee_teach_2h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 6) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Broñ dwurêczna, poziom 7, 1000 bry³ek rudy, 10 PN",Lee_teach_2h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 7) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Broñ dwurêczna, poziom 8, 1500 bry³ek rudy, 10 PN",Lee_teach_2h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 8) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Broñ dwurêczna, poziom 9, 2000 bry³ek rudy, 10 PN",Lee_teach_2h9);
	};	
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 9) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Broñ dwurêczna, poziom 10, 2500 bry³ek rudy, 10 PN",Lee_teach_2h10);
	};
};

FUNC VOID Lee_teach_2h8 ()
{
	AI_Output (other,self,"DIA_Lee_TRAIN_2h_15_01"); //Naucz mnie sprawniej pos³ugiwaæ siê dwurêczn¹ broni¹.
	if (Npc_HasItems(other,itminugget) >= 1500)
	{
		if (B_GiveSkill(other, NPC_TALENT_2h, 8, 10))
		{
		AI_Output (self,other,"DIA_Lee_TRAIN_2h_npc_21"); //Robisz postêpy. Skup siê na kolejnych ciosach. £¹cz je coraz szybciej i pewniej.
		B_GiveInvItems(other,self,itminugget,1500);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Lee_TRAIN_2h_NoOre_01_00"); //Nie masz wystarczaj¹cej iloœci rudy!
	};	
Info_ClearChoices	(SLD_700_Lee_TEACH_2H_START);
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,DIALOG_BACK,SLD_700_Lee_TEACH_2H_STARTBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 0) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Broñ dwurêczna, poziom 1, 100 bry³ek rudy, 10 PN",Lee_teach_2h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 1) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Broñ dwurêczna, poziom 2, 200 bry³ek rudy, 10 PN",Lee_teach_2h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 2) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Broñ dwurêczna, poziom 3, 300 bry³ek rudy, 10 PN",Lee_teach_2h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 3) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Broñ dwurêczna, poziom 4, 400 bry³ek rudy, 10 PN",Lee_teach_2h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 4) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Broñ dwurêczna, poziom 5, 500 bry³ek rudy, 10 PN",Lee_teach_2h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 5) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Broñ dwurêczna, poziom 6, 600 bry³ek rudy, 10 PN",Lee_teach_2h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 6) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Broñ dwurêczna, poziom 7, 1000 bry³ek rudy, 10 PN",Lee_teach_2h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 7) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Broñ dwurêczna, poziom 8, 1500 bry³ek rudy, 10 PN",Lee_teach_2h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 8) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Broñ dwurêczna, poziom 9, 2000 bry³ek rudy, 10 PN",Lee_teach_2h9);
	};	
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 9) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Broñ dwurêczna, poziom 10, 2500 bry³ek rudy, 10 PN",Lee_teach_2h10);
	};
};

FUNC VOID Lee_teach_2h9 ()
{
	AI_Output (other,self,"DIA_Lee_TRAIN_2h_15_01"); //Naucz mnie sprawniej pos³ugiwaæ siê dwurêczn¹ broni¹.
	if (Npc_HasItems(other,itminugget) >= 2000)
	{
		if (B_GiveSkill(other, NPC_TALENT_2h, 9, 10))
		{
		AI_Output (self,other,"DIA_Lee_TRAIN_2h_npc_22"); //Chc¹c najboleœniej zraniæ przeciwnika musisz dobrze wymierzyæ cios. Gdy masz szansê staraj siê trafiaæ w g³owê lub barki.
		AI_Output (self,other,"DIA_Lee_TRAIN_2h_npc_23"); //S³abe punkty to tak¿e ³¹cznia zbroi. Jeœli przeciwnik ma na sobie skórzan¹ zbrojê to po prostu bij w brzuch. 
		AI_Output (self,other,"DIA_Lee_TRAIN_2h_npc_24"); //Skórzane pancerze ³atwo siê rozcina. 
		AI_Output (self,other,"DIA_Lee_TRAIN_2h_npc_25"); //Przypomnij sobie jeszcze raz to wszystko, czego ciê nauczy³em i stosuj siê do tego. 
		B_GiveInvItems(other,self,itminugget,2000);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Lee_TRAIN_2h_NoOre_01_00"); //Nie masz wystarczaj¹cej iloœci rudy!
	};	
Info_ClearChoices	(SLD_700_Lee_TEACH_2H_START);
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,DIALOG_BACK,SLD_700_Lee_TEACH_2H_STARTBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 0) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Broñ dwurêczna, poziom 1, 100 bry³ek rudy, 10 PN",Lee_teach_2h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 1) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Broñ dwurêczna, poziom 2, 200 bry³ek rudy, 10 PN",Lee_teach_2h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 2) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Broñ dwurêczna, poziom 3, 300 bry³ek rudy, 10 PN",Lee_teach_2h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 3) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Broñ dwurêczna, poziom 4, 400 bry³ek rudy, 10 PN",Lee_teach_2h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 4) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Broñ dwurêczna, poziom 5, 500 bry³ek rudy, 10 PN",Lee_teach_2h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 5) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Broñ dwurêczna, poziom 6, 600 bry³ek rudy, 10 PN",Lee_teach_2h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 6) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Broñ dwurêczna, poziom 7, 1000 bry³ek rudy, 10 PN",Lee_teach_2h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 7) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Broñ dwurêczna, poziom 8, 1500 bry³ek rudy, 10 PN",Lee_teach_2h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 8) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Broñ dwurêczna, poziom 9, 2000 bry³ek rudy, 10 PN",Lee_teach_2h9);
	};	
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 9) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Broñ dwurêczna, poziom 10, 2500 bry³ek rudy, 10 PN",Lee_teach_2h10);
	};
};

FUNC VOID Lee_teach_2h10 ()
{
	AI_Output (other,self,"DIA_Lee_TRAIN_2h_15_01"); //Naucz mnie sprawniej pos³ugiwaæ siê dwurêczn¹ broni¹.
	if (Npc_HasItems(other,itminugget) >= 2500)
	{
		if (B_GiveSkill(other, NPC_TALENT_2h, 10, 10))
		{
		AI_Output (self,other,"DIA_Lee_TRAIN_2h_npc_26"); //To ju¿ nasza ostatnia lekcja. Poka¿ê ci sztuczki, które pozwol¹ ci jeszcze lepiej wyczuæ broñ.
		AI_Output (self,other,"DIA_Lee_TRAIN_2h_npc_27"); //Musisz nauczyæ siê rozpoznawaæ s³abe punkty przeciwników i skupiaæ siê na nich.
		AI_Output (self,other,"DIA_Lee_TRAIN_2h_npc_28"); //Z czasem dojdziesz do wprawy.
		B_GiveInvItems(other,self,itminugget,2500);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Lee_TRAIN_2h_NoOre_01_00"); //Nie masz wystarczaj¹cej iloœci rudy!
	};	
Info_ClearChoices	(SLD_700_Lee_TEACH_2H_START);
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,DIALOG_BACK,SLD_700_Lee_TEACH_2H_STARTBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 0) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Broñ dwurêczna, poziom 1, 100 bry³ek rudy, 10 PN",Lee_teach_2h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 1) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Broñ dwurêczna, poziom 2, 200 bry³ek rudy, 10 PN",Lee_teach_2h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 2) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Broñ dwurêczna, poziom 3, 300 bry³ek rudy, 10 PN",Lee_teach_2h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 3) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Broñ dwurêczna, poziom 4, 400 bry³ek rudy, 10 PN",Lee_teach_2h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 4) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Broñ dwurêczna, poziom 5, 500 bry³ek rudy, 10 PN",Lee_teach_2h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 5) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Broñ dwurêczna, poziom 6, 600 bry³ek rudy, 10 PN",Lee_teach_2h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 6) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Broñ dwurêczna, poziom 7, 1000 bry³ek rudy, 10 PN",Lee_teach_2h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 7) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Broñ dwurêczna, poziom 8, 1500 bry³ek rudy, 10 PN",Lee_teach_2h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 8) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Broñ dwurêczna, poziom 9, 2000 bry³ek rudy, 10 PN",Lee_teach_2h9);
	};	
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 9) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Broñ dwurêczna, poziom 10, 2500 bry³ek rudy, 10 PN",Lee_teach_2h10);
	};
};

/*
//-------------------------------------------------------------------------
//							ZWEIHANDKAMPF LERNEN STUFE 1
//-------------------------------------------------------------------------
instance  Sld_700_Lee_ZWEIHAND1 (C_INFO)
{
	npc				= Sld_700_Lee;
	condition		= Sld_700_Lee_ZWEIHAND1_Condition;
	information		= Sld_700_Lee_ZWEIHAND1_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildLearnString(NAME_Learn2h_1, LPCOST_TALENT_2H_1,0); 
};

FUNC int  Sld_700_Lee_ZWEIHAND1_Condition()
{	
	if 	( 
			(Npc_GetTalentSkill  (hero,NPC_TALENT_2H) < 1)
			&& ((Npc_GetTrueGuild    (hero) == GIL_SLD) || ((Npc_GetTrueGuild(hero)==GIL_KDW) && (Kapitel >= 4))  )	//jetzt auch als Wassermagier im 4. Kapitel möglich ***BJÖRN***
		)
	{
		return TRUE;
	};

};
FUNC void  Sld_700_Lee_ZWEIHAND1_Info()
{
	AI_Output			(other, self,"Sld_700_Lee_ZWEIHAND1_Info_15_01"); //Chcê siê nauczyæ pos³ugiwaæ dwurêcznym mieczem.
	if (hero.attribute[ATR_STRENGTH] >= 80)
	{
	if (B_GiveSkill(other,NPC_TALENT_2H , 1, LPCOST_TALENT_2H_1))
	{
		AI_Output			(self, other,"Sld_700_Lee_ZWEIHAND1_Info_08_02"); //W porz¹dku. Najpierw omówimy podstawy.
		AI_Output			(self, other,"Sld_700_Lee_ZWEIHAND1_Info_08_03"); //Wyci¹gnij miecz przed siebie. Aby zaatakowaæ wroga tak ciê¿k¹ broni¹, musisz mocniej siê zamachn¹æ.
		AI_Output			(self, other,"Sld_700_Lee_ZWEIHAND1_Info_08_04"); //Unieœ rêkê i zdecydowanie opuœæ miecz. To powinno wystarczyæ, ¿eby powaliæ przeciwnika na ziemiê.
		AI_Output			(self, other,"Sld_700_Lee_ZWEIHAND1_Info_08_05"); //Wykorzystaj bezw³adnoœæ broni, by unieœæ j¹ ponownie do góry.
		AI_Output			(self, other,"Sld_700_Lee_ZWEIHAND1_Info_08_06"); //Dwurêczne miecze œwietnie sprawdzaj¹ siê przy zadawaniu ciosów z boku. W ten sposób mo¿esz trzymaæ przeciwnika na dystans.
		AI_Output			(self, other,"Sld_700_Lee_ZWEIHAND1_Info_08_07"); //To ci powinno wystarczyæ na pocz¹tek. Potrenuj trochê.
	
		Sld_700_Lee_ZWEIHAND1.permanent = 0;
	};
	}
	else
	{
	AI_Output			(self,other,"Sld_700_Lee_NO_ENOUGHT_STR_1"); //Wróæ, gdy bêdziesz silniejszy. Walka broni¹ dwurêczn¹ to nie przelewki!
	PrintScreen	("Warunek: Si³a 80", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
};  
//-------------------------------------------------------------------------
//							ZWEIHANDKAMPF LERNEN STUFE 2
//-------------------------------------------------------------------------
instance  Sld_700_Lee_ZWEIHAND2 (C_INFO)
{
	npc				= Sld_700_Lee;
	condition		= Sld_700_Lee_ZWEIHAND2_Condition;
	information		= Sld_700_Lee_ZWEIHAND2_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildLearnString(NAME_Learn2h_2, LPCOST_TALENT_2H_2,0); 
};

FUNC int  Sld_700_Lee_ZWEIHAND2_Condition()
{	
	if
		( 
			(Npc_GetTalentSkill  (hero,NPC_TALENT_2H) == 1)
			&& ( (Npc_GetTrueGuild    (hero) == GIL_SLD) ||  ((Npc_GetTrueGuild(hero)==GIL_KDW) && (Kapitel >= 4))  )	//jetzt auch als Wassermagier im 4. Kapitel möglich ***BJÖRN***
		)
	{
		return TRUE;
	};

};
FUNC void  Sld_700_Lee_ZWEIHAND2_Info()
{
	AI_Output			(other, self,"Sld_700_Lee_ZWEIHAND2_Info_15_01"); //Chcia³bym siê dowiedzieæ czegoœ wiêcej o walce dwurêcznym mieczem.
	if (hero.attribute[ATR_STRENGTH] >= 120)
	{
	if (B_GiveSkill(other,NPC_TALENT_2H , 2, LPCOST_TALENT_2H_2))
	{
		AI_Output			(self, other,"Sld_700_Lee_ZWEIHAND2_Info_08_02"); //Musisz siê nauczyæ p³ynnie przenosiæ swój œrodek ciê¿koœci. Trzymaj miecz pionowo. Obie d³onie mocno zaciœnij na rêkojeœci i przesuñ go nieco w bok.
		AI_Output			(self, other,"Sld_700_Lee_ZWEIHAND2_Info_08_03"); //Teraz uderz szybko od góry i pozwól klindze powêdrowaæ nad twoje ramiê. Teraz mo¿esz wyprowadziæ szybkie ciêcie na prawo.
		AI_Output			(self, other,"Sld_700_Lee_ZWEIHAND2_Info_08_04"); //Twój przeciwnik nie bêdzie mia³ okazji podejœæ bli¿ej.
		AI_Output			(self, other,"Sld_700_Lee_ZWEIHAND2_Info_08_05"); //Albo spróbuj wyprowadziæ z lewej strony cios do przodu, aby odrzuciæ rywala do ty³u. 
		AI_Output			(self, other,"Sld_700_Lee_ZWEIHAND2_Info_08_06"); //Teraz obrót, ¿eby kolejny cios nabra³ odpowiedniej mocy. Przy odrobinie szczêœcia wróg nie prze¿yje tego uderzenia.
		AI_Output			(self, other,"Sld_700_Lee_ZWEIHAND2_Info_08_07"); //A jeœli i to nie wystarczy, wykorzystaj resztê si³y zamachowej, by ponownie unieœæ miecz do góry.
		AI_Output			(self, other,"Sld_700_Lee_ZWEIHAND2_Info_08_08"); //Po skoñczonym ataku wykonaj zas³onê i wypatruj luki w obronie przeciwnika.
		AI_Output			(self, other,"Sld_700_Lee_ZWEIHAND2_Info_08_09"); //Kluczem do sukcesu jest ci¹g³a zmiana pozycji i umiejêtne wykorzystanie bezw³adnoœci broni.
	
		Sld_700_Lee_ZWEIHAND2.permanent = 0;
	};
	}
	else
	{
	AI_Output			(self,other,"Sld_700_Lee_NO_ENOUGHT_STR_1"); //Wróæ, gdy bêdziesz silniejszy. Walka broni¹ dwurêczn¹ to nie przelewki!
	PrintScreen	("Warunek: Si³a 120", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
};  */
/*
//========================================
//-----------------> ZAplecami
//========================================

INSTANCE DIA_Lee_ZAplecami (C_INFO)
{
   npc          = Sld_700_Lee;
   nr           = 1;
   condition    = DIA_Lee_ZAplecami_Condition;
   information  = DIA_Lee_ZAplecami_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Lee_ZAplecami_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Saturas_PertractacjieDD))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Lee_ZAplecami_Info()
{
    AI_Output (self, other ,"DIA_Lee_ZAplecami_03_01"); //Czemu dowiadujê siê o wszystkim ostatni?
    AI_Output (other, self ,"DIA_Lee_ZAplecami_15_02"); //Nie wiem.
    AI_Output (self, other ,"DIA_Lee_ZAplecami_03_03"); //Dobrze wiesz o czym mówiê!
    AI_Output (self, other ,"DIA_Lee_ZAplecami_03_04"); //Razem z Saturasem poprosiliœcie o pomoc Quentina!
    AI_Output (self, other ,"DIA_Lee_ZAplecami_03_05"); //Saturas nie zajmie siê Woln¹ Kopalni¹, tylko bez negocjacji ze mn¹ prowadzi dyskusje z Bandytami!
    AI_Output (other, self ,"DIA_Lee_ZAplecami_15_06"); //Zauwa¿, ¿e dobrze to zaplanowa³.
    AI_Output (other, self ,"DIA_Lee_ZAplecami_15_07"); //Nasi ludzie musz¹ zostaæ w Obozie póki Gomez siê nie uspokoi.
    AI_Output (other, self ,"DIA_Lee_ZAplecami_15_08"); //W ka¿dej chwili mo¿emy siê spodziewaæ ataku.
    AI_Output (self, other ,"DIA_Lee_ZAplecami_03_09"); //Mo¿e masz racjê.
    AI_Output (other, self ,"DIA_Lee_ZAplecami_15_10"); //Pewnie, ¿e mam. Tylko ty musisz siê uspokoiæ i zastanowiæ nad tym co robisz.
    B_Givexp (350);
};
*/

//========================================
//-----------------> KOPALNIA_QUENTINA
//========================================

INSTANCE DIA_Lee_KOPALNIA_QUENTINA (C_INFO)
{
   npc          = Sld_700_Lee;
   nr           = 1;
   condition    = DIA_Lee_KOPALNIA_QUENTINA_Condition;
   information  = DIA_Lee_KOPALNIA_QUENTINA_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Lee_KOPALNIA_QUENTINA_Condition()
{
    if (MIS_TorlofNeedHelp == LOG_SUCCESS)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Lee_KOPALNIA_QUENTINA_Info()
{
    AI_Output (self, other ,"DIA_Lee_KOPALNIA_QUENTINA_03_01"); //Dobrze, ¿e jesteœ. Potrzeba nam kogoœ do pomocy.
    AI_Output (other, self ,"DIA_Lee_KOPALNIA_QUENTINA_15_02"); //W czym problem?
    AI_Output (self, other ,"DIA_Lee_KOPALNIA_QUENTINA_03_03"); //Ostatnio z wieœciami przyby³ pos³aniec z Obozu Bandytów. 
    AI_Output (self, other ,"DIA_Lee_KOPALNIA_QUENTINA_03_04"); //Ponoæ Gomez wys³a³ grupê ludzi do Opuszczonej Kopalni. Quentin chce udaremniæ jego plan wznowienia wydobycia. 
    AI_Output (self, other ,"DIA_Lee_KOPALNIA_QUENTINA_03_05"); //Jest jeden haczyk, kopalnia nie zosta³a opuszczona bez powodu. Roi siê w niej od przeró¿nego plugastwa. 
    AI_Output (self, other ,"DIA_Lee_KOPALNIA_QUENTINA_03_06"); //Mo¿liwe, ¿e jak pozbêdziecie siê Stra¿ników, to bêdzie was czeka³a walka z nieumar³ymi albo innym œcierwem.
    AI_Output (other, self ,"DIA_Lee_KOPALNIA_QUENTINA_15_07"); //Postaram siê prze¿yæ, jednak w pojedynkê nie bêdzie ³atwo...
    AI_Output (self, other ,"DIA_Lee_KOPALNIA_QUENTINA_03_08"); //Wys³a³em ju¿ Najemników, którzy ci pomog¹. Powinieneœ ich spotkaæ przy wejœciu do kopalni. IdŸ ju¿! Nie ma czasu do stracenia...
	
	//zadanie - oficjalne zadanie [odwiedzenie kopalni] dla wszystkich gildii innych ni¿ bandyta 
    MIS_SupportForQuentin = LOG_RUNNING;
	Log_CreateTopic          (CH4_SupportForQuentin, LOG_MISSION);
    Log_SetTopicStatus       (CH4_SupportForQuentin, LOG_RUNNING);
    B_LogEntry               (CH4_SupportForQuentin,"Lee chce pomóc Quentinowi pozbyæ siê Stra¿ników z Opuszczonej Kopalni. Gomez postanowi³ wznowiæ tam wydobycie. Przywódca Najemników twierdzi, ¿e Stra¿nicy nie s¹ najwiêkszym zagro¿eniem jakie czyha pod ziemi¹. Có¿, wkrótce przekonam siê o tym na w³asnej skórze. Mam siê przegrupowaæ z ludŸmi przydzielonymi przez Lee przy wejœciu do kopalni.");
	
	//rutyny: Cord [kluczowy npc], Jarvis, Rocky
	B_Story_AbMine_Soldiers ();
    
	//kluczowe! rutyna: Corristo, dialog, otwarcie bramy do kopalni
	B_Story_FocusCorristoQuest ();
	
	//koniec
    AI_StopProcessInfos	(self);
	
	//zadanie - wpis dla cz³onków bractwa
	if MIS_PsiAbadonedMine == log_running
	{
	B_LogEntry                     (CH4_PsiAbadonedMine,"Po rozmowie z Lee okaza³o siê, ¿e Nowy Obóz chce pomóc Bandytom odbiæ Opuszczon¹ Kopalniê. Mam siê tam udaæ i odszukaæ zaprzyjaŸnionych Najemników. Lee przestrzeg³ mnie, ¿e Kopalnia jest przeklêta od lat. Szykuje siê nie lada wyzwanie. ");
	};
};

//========================================
//-----------------> CZYSTKA_W_KOPALNI
//========================================

INSTANCE DIA_Lee_CZYSTKA_W_KOPALNI (C_INFO)
{
   npc          = Sld_700_Lee;
   nr           = 1;
   condition    = DIA_Lee_CZYSTKA_W_KOPALNI_Condition;
   information  = DIA_Lee_CZYSTKA_W_KOPALNI_Info;
   permanent	= FALSE;
   description	= "Pozby³em siê Stra¿ników i o¿ywieñców z kopalni.";
};

FUNC INT DIA_Lee_CZYSTKA_W_KOPALNI_Condition()
{
    if (MIS_SupportForQuentin == LOG_SUCCESS)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Lee_CZYSTKA_W_KOPALNI_Info()
{
    AI_Output (other, self ,"DIA_Lee_CZYSTKA_W_KOPALNI_15_01"); //Pozby³em siê Stra¿ników i o¿ywieñców z kopalni.
    AI_Output (self, other ,"DIA_Lee_CZYSTKA_W_KOPALNI_03_02"); //Czyli naprawdê byli tam o¿ywieñcy. Masz szczêœcie, ¿e jeszcze ¿yjesz.
    AI_Output (self, other ,"DIA_Lee_CZYSTKA_W_KOPALNI_03_03"); //Nie mniej jednak dobrze siê spisa³eœ. 
    AI_Output (other, self ,"DIA_Lee_CZYSTKA_W_KOPALNI_15_04"); //Cord kaza³ ci zaproponowaæ, ¿ebyœmy wznowili wydobycie w kopalni. Z³o¿a s¹ jeszcze dosyæ spore. 
    AI_Output (other, self ,"DIA_Lee_CZYSTKA_W_KOPALNI_15_05"); //Z pewnoœci¹ spodoba siê to Magom Wody.
    AI_Output (self, other ,"DIA_Lee_CZYSTKA_W_KOPALNI_03_06"); //Hmmm... Fakt. Kopalnia mo¿e nam przynieœæ znaczne korzyœci. Jednak transport rudy do Obozu by³by nie lada wyzwaniem.
    AI_Output (self, other ,"DIA_Lee_CZYSTKA_W_KOPALNI_03_07"); //Wszêdzie krêc¹ siê Stra¿nicy.
    AI_Output (other, self ,"DIA_Lee_CZYSTKA_W_KOPALNI_15_08"); //Chyba jednak warto zaryzykowaæ. 
    AI_Output (self, other ,"DIA_Lee_CZYSTKA_W_KOPALNI_03_09"); //Masz racjê, ale jest jeden problem. Do kopania rudy potrzebni s¹ robotnicy. Nie mam doœæ ludzi, aby wys³aæ ich do pracy.
    AI_Output (self, other ,"DIA_Lee_CZYSTKA_W_KOPALNI_03_10"); //IdŸ do Laresa i spytaj czy wys³a³by kilku Szkodników do kopalni.
    B_LogEntry                     (CH4_NC_Mine,"Mam iœæ do Laresa i poprosiæ go o wys³anie kilku Szkodników do pracy w kopalni. ");

    B_GiveXP (200);
    AI_StopProcessInfos	(self);
};
//========================================
//-----------------> BRAK_LUDZI
//========================================

INSTANCE DIA_Lee_BRAK_LUDZI (C_INFO)
{
   npc          = Sld_700_Lee;
   nr           = 1;
   condition    = DIA_Lee_BRAK_LUDZI_Condition;
   information  = DIA_Lee_BRAK_LUDZI_Info;
   permanent	= FALSE;
   description	= "Lares nie ma wystarczaj¹cej iloœci ludzi.";
};

FUNC INT DIA_Lee_BRAK_LUDZI_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Lares_POTZREBNI_LUDZIE))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Lee_BRAK_LUDZI_Info()
{
    AI_Output (other, self ,"DIA_Lee_BRAK_LUDZI_15_01"); //Lares nie ma wystarczaj¹cej iloœci ludzi.
    AI_Output (self, other ,"DIA_Lee_BRAK_LUDZI_03_02"); //Wiedzia³em! No to mamy niez³y problem. Je¿eli nie wyœlemy kogoœ do kopalni, to Gomez pewnie znowu j¹ zajmie.
    AI_Output (other, self ,"DIA_Lee_BRAK_LUDZI_15_03"); //Lares kaza³ ci prosiæ o pomoc Bandytów. 
    AI_Output (self, other ,"DIA_Lee_BRAK_LUDZI_03_04"); //Racja. Mo¿e oni wyœl¹ czêœæ swoich ludzi do kopalni. 
    AI_Output (self, other ,"DIA_Lee_BRAK_LUDZI_03_05"); //IdŸ do Quentina i siê z nim dogadaj. Zaproponuj mu czwart¹ czêœæ wydobytego urobku jako zap³atê.
    AI_Output (other, self ,"DIA_Lee_BRAK_LUDZI_15_06"); //Ju¿ tam idê.
    B_LogEntry                     (CH4_NC_Mine,"Trzeba dogadaæ siê z Quentinem. Mam zaproponowaæ przywódcy Bandytów czwart¹ czêœæ urobku z kopalni w zamian za pomoc. ");

    B_GiveXP (200);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> PertractacjieDD
//========================================

INSTANCE DIA_lee_PertractacjieDD (C_INFO)
{
   npc          = Sld_700_Lee;
   nr           = 1;
   condition    = DIA_lee_PertractacjieDD_Condition;
   information  = DIA_lee_PertractacjieDD_Info;
   permanent	= FALSE;
   description	= "Dogada³em siê z Quentinem.";
};

FUNC INT DIA_lee_PertractacjieDD_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Quentin_GuyWork)) && (MIS_NC_Mine == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_lee_PertractacjieDD_Info()
{
    AI_Output (other, self ,"DIA_lee_PertractacjieDD_15_01"); //Dogada³em siê z Quentinem.
    AI_Output (other, self ,"DIA_lee_PertractacjieDD_15_02"); //Nie by³ zbyt zadowolony, ale siê zgodzi³.
    AI_Output (self, other ,"DIA_lee_PertractacjieDD_03_03"); //Œwietnie. 
    AI_Output (self, other ,"DIA_lee_PertractacjieDD_03_04"); //Oto twoja zap³ata.
    CreateInvItems (self, ItMiNugget, 200);
    B_GiveInvItems (self, other, ItMiNugget, 200);
    B_LogEntry                     (CH4_NC_Mine,"Nowy Obóz dogada³ siê z Quentinem. Mamy zapewnione nowe Ÿród³o rudy ma³ym kosztem.");
    Log_SetTopicStatus       (CH4_NC_Mine, LOG_SUCCESS);
    MIS_NC_Mine = LOG_SUCCESS;
	if MIS_PsiAbadonedMine == log_running
	{
	Log_SetTopicStatus       (CH4_PsiAbadonedMine, LOG_SUCCESS);
    MIS_PsiAbadonedMine = LOG_SUCCESS;
	B_LogEntry                     (CH4_PsiAbadonedMine,"Najemnicy zyskali dostêp do Opuszczonej Kopalni, a Gomez zosta³ os³abiony. Tymczasowo uspokoi³em sytuacjê, ale wci¹¿ muszê byæ czujny. Wypada³oby w miêdzyczasie zanieœæ raport Cor Angarowi. Z pewnoœci¹ mnie jakoœ wynagrodzi.");
	};
    B_GiveXP (300);
};

//========================================
//-----------------> XARDASGOLEMS
//========================================

INSTANCE DIA_Lee_XARDASGOLEMS (C_INFO)
{
   npc          = SLD_700_Lee;
   nr           = 1;
   condition    = DIA_Lee_XARDASGOLEMS_Condition;
   information  = DIA_Lee_XARDASGOLEMS_Info;
   permanent	= FALSE;
   description	= "Saturas zleci³ mi odszukanie Xardasa. Co wiesz na jego temat?";
};

FUNC INT DIA_Lee_XARDASGOLEMS_Condition()
{
    if (Npc_KnowsInfo (hero, Info_Saturas_XARDASGO))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Lee_XARDASGOLEMS_Info()
{
    AI_Output (other, self ,"DIA_Lee_XARDASGOLEMS_15_01"); //Saturas zleci³ mi odszukanie Xardasa. Co wiesz na jego temat?
    AI_Output (self, other ,"DIA_Lee_XARDASGOLEMS_03_02"); //Jakiœ czas temu wys³a³em oddzia³ Najemników na polecenie Saturasa, aby odszukali tego Nekromantê, niestety nigdy nie wrócili. 
	AI_Output (self, other ,"DIA_Lee_XARDASGOLEMS_03_03"); //Postanowi³em wiêc wys³aæ Torlofa wraz z ma³ym oddzia³em, ¿eby sprawdziæ, co ich spotka³o.
    AI_Output (self, other ,"DIA_Lee_XARDASGOLEMS_03_04"); //Kilka dni póŸniej, gdy Torlof wróci³, opowiedzia³ mi o trzech golemach. Widzia³ je tylko z daleka, choæ nietrudno siê domyœliæ jaki los spotka³ moich ludzi. 
	AI_Output (self, other ,"DIA_Lee_XARDASGOLEMS_03_05"); //Dostêpu do wie¿y broni³ kamienny golem, ognisty oraz lodowy. Nie radzê ci siê tam wybieraæ, zrobi¹ z ciebie sieczkê.
    AI_Output (other, self ,"DIA_Lee_XARDASGOLEMS_15_06"); //Skoro zdoby³em kamienie ogniskuj¹ce zabijaj¹c po drodze trolle, harpie i inne plugastwo, to z tymi magicznymi pos¹gami poradzê sobie bez problemu.
    AI_Output (self, other ,"DIA_Lee_XARDASGOLEMS_03_07"); //Mam nadzieje. Dam ci jeszcze jedn¹ radê, uwa¿aj na Xardasa. Jest niezwykle przebieg³y i potê¿ny. 
	AI_Output (self, other ,"DIA_Lee_XARDASGOLEMS_03_08"); //Pamiêtam jak spotka³em go na dworze Rhobara, gdy zosta³ wyznaczony do przewodzenia magami, którzy mieli stworzyæ Barierê.
    AI_Output (self, other ,"DIA_Lee_XARDASGOLEMS_03_09"); //Wydawa³ siê byæ niezwykle wierny Innosowi. PóŸniej okaza³o siê, ¿e bardziej ci¹gnie go do magii demonów. Nigdy bym siê tego nie domyœli³.
    AI_Output (other, self ,"DIA_Lee_XARDASGOLEMS_15_10"); //Dziêki za radê. 
};



//========================================
//-----------------> DANGERORE
//========================================

INSTANCE DIA_Lee_DANGERORE (C_INFO)
{
   npc          = Sld_700_Lee;
   nr           = 1;
   condition    = DIA_Lee_DANGERORE_Condition;
   information  = DIA_Lee_DANGERORE_Info;
   permanent	= FALSE;
   description	= "Spotka³em Xardasa.";
};

FUNC INT DIA_Lee_DANGERORE_Condition()
{
    if (Npc_KnowsInfo (hero, Info_Xardas_DANGER))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Lee_DANGERORE_Info()
{
    AI_Output (other, self ,"DIA_Lee_DANGERORE_15_01"); //Spotka³em Xardasa. Powiedzia³ mi, ¿e pomys³ Magów Wody z kopcem rudy jest bezcelowy. Jednak jest inny sposób na zniszczenie Bariery. Nie bardzo wiem, jak powiedzieæ o tym Saturasowi.
    AI_Output (self, other ,"DIA_Lee_DANGERORE_03_02"); //Lepiej mu o tym nie mów. Saturas to bardzo wybuchowy cz³owiek. 
	AI_Output (self, other ,"DIA_Lee_DANGERORE_03_03"); //Ja sam dochowam tajemnicy, choæ jestem szczerze zdziwiony. Przez te wszystkie lata pod¹¿a³em œlepo za Magami Wody g³êboko wierz¹c w ich plan.
	AI_Output (self, other ,"DIA_Lee_DANGERORE_03_04"); //Przez ca³y czas wierzy³em, ¿e ich pomys³ odnoœnie Bariery wypali.
    AI_Output (self, other ,"DIA_Lee_DANGERORE_03_05"); //Da³em im s³owo, ¿e dopóki Bariera istnieje, bêdê im s³u¿y³ i tak w³aœnie zamierzam uczyniæ. 
	AI_Output (self, other ,"DIA_Lee_DANGERORE_03_06"); //S³u¿ba jako genera³ Króla Rhobara nauczy³a mnie honoru. Sta³eœ siê niezwykle potê¿ny, nie ka¿dy cz³owiek zdo³a³by przedrzeæ siê do Xardasa i zrobiæ na nim wra¿enie, tak jak tobie siê uda³o.
    AI_Output (self, other ,"DIA_Lee_DANGERORE_03_07"); //Powodzenia, przyjacielu! Mam nadziejê, ¿e ju¿ wkrótce siê zobaczymy.
};

//#####################################################################################
//####### ROZDZIA£ 5
//####### ZASTÊPSTWO DLA GORNA
//#####################################################################################
//========================================
//-----------------> OBRONA_WK
//========================================

INSTANCE DIA_Lee_OBRONA_WK (C_INFO)
{
   npc          = Sld_700_Lee;
   nr           = 1;
   condition    = DIA_Lee_OBRONA_WK_Condition;
   information  = DIA_Lee_OBRONA_WK_Info;
   permanent	= FALSE;
   description	= "Przysy³a mnie Gorn. Mam ci pomóc w organizacji obrony.";
};

FUNC INT DIA_Lee_OBRONA_WK_Condition()
{
    if (Npc_KnowsInfo (hero, Info_Gorn_ZASTEPSTWO))

    {
    return TRUE;
    };
};


FUNC VOID DIA_Lee_OBRONA_WK_Info()
{
    AI_Output (other, self ,"DIA_Lee_OBRONA_WK_15_01"); //Przysy³a mnie Gorn. Mam ci pomóc w organizacji obrony.
    AI_Output (self, other ,"DIA_Lee_OBRONA_WK_03_02"); //Ach tak! Dobrze, ¿e przyszed³eœ.
    AI_Output (self, other ,"DIA_Lee_OBRONA_WK_03_03"); //Ju¿ ustali³em którzy z moich ludzi zajm¹ siê kopalni¹.
    AI_Output (self, other ,"DIA_Lee_OBRONA_WK_03_04"); //Niestety, zagro¿enie ze strony Gomeza jeszcze nie minê³o i nie mia³em kogo wys³aæ do wybranych Najemników.
    AI_Output (other, self ,"DIA_Lee_OBRONA_WK_15_05"); //Ja mogê im to przekazaæ.
    AI_Output (self, other ,"DIA_Lee_OBRONA_WK_03_06"); //W porz¹dku. IdŸ zatem do Corda i Outlama. 
    AI_Output (self, other ,"DIA_Lee_OBRONA_WK_03_07"); //Przeka¿ im, ¿e kopalnie powierzam prowizorycznej stra¿y i myœliwym-najemnikom.
    AI_Output (other, self ,"DIA_Lee_OBRONA_WK_15_08"); //Nie ma sprawy.
    B_LogEntry                     (CH5_ObronaWk,"Lee wyznaczy³ do obrony kopalni ludzi Corda i Outlama. Mam im to przekazaæ.");

    B_GiveXP (150);
    AI_StopProcessInfos	(self);
};
//========================================
//-----------------> OBRONA_ENDQUEST
//========================================

INSTANCE DIA_Lee_OBRONA_ENDQUEST (C_INFO)
{
   npc          = Sld_700_Lee;
   nr           = 1;
   condition    = DIA_Lee_OBRONA_ENDQUEST_Condition;
   information  = DIA_Lee_OBRONA_ENDQUEST_Info;
   permanent	= FALSE;
   description	= "Zorganizowa³em obronê.";
};

FUNC INT DIA_Lee_OBRONA_ENDQUEST_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Outlam_CALL_OF_DUTY))
    && (Npc_KnowsInfo (hero, DIA_Cord_CALL_OF_DUTY))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Lee_OBRONA_ENDQUEST_Info()
{
    AI_Output (other, self ,"DIA_Lee_OBRONA_ENDQUEST_15_01"); //Zorganizowa³em obronê.
    AI_Output (self, other ,"DIA_Lee_OBRONA_ENDQUEST_03_02"); //Dobra robota! Teraz Stra¿nicy mog¹ nam naskoczyæ.
    AI_Output (self, other ,"DIA_Lee_OBRONA_ENDQUEST_03_03"); //Przeka¿ Gornowi, ¿e jest wolny.
    B_LogEntry                     (CH5_ObronaWK,"Najemnicy zajm¹ siê Woln¹ Kopalni¹, a Gorn mo¿e w koñcu udaæ siê na spotkanie.");
    Log_SetTopicStatus       (CH5_ObronaWK, LOG_SUCCESS);
    MIS_ObronaWK = LOG_SUCCESS;

    B_GiveXP (400);
    AI_StopProcessInfos	(self);
};


