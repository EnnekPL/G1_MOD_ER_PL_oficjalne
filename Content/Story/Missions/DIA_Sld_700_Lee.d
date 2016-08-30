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
	description = "Jeste� szefem Najemnik�w, tak?";
};                       

FUNC int  Sld_700_Lee_Greet_Condition()
{
	return 1;
};

FUNC VOID  Sld_700_Lee_Greet_Info()
{
	AI_Output (other, self,"DIA_Lee_Greet_15_00"); //Jeste� szefem Najemnik�w, tak?
	AI_Output (self, other,"DIA_Lee_Greet_08_01"); //Zgadza si�, ch�opcze!
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
	description = "Czym zajmuje si� Najemnik w s�u�bie mag�w?";
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
	AI_Output (other, self,"DIA_Lee_Define_15_00"); //Czym zajmuje si� Najemnik w s�u�bie mag�w?
	AI_Output (self, other,"DIA_Lee_Define_08_01"); //To proste: pilnuje rudy i broni mag�w.
	AI_Output (self, other,"DIA_Lee_Define_08_02"); //Od czasu do czasu magowie zlecaj� nam jakie� zadania specjalne.
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
	description = "Chcia�bym do was do��czy�!";
};                       

FUNC int  Sld_700_Lee_Mitmachen_Condition()
{
	if	(Npc_KnowsInfo(hero,Sld_700_Lee_Greet))
	&&	(Npc_GetTrueGuild(hero) == GIL_NONE)
	&&	(oldHeroGuild == 0)
	{
		return 1;
	};
};

FUNC VOID  Sld_700_Lee_Mitmachen_Info()
{
	AI_Output (other, self,"DIA_Lee_Mitmachen_15_00"); //Chcia�bym do was do��czy�!
	AI_Output (self, other,"DIA_Lee_Mitmachen_08_01"); //Odbi�o ci? My�lisz, �e przyjmuj� ka�dego w��cz�g�, kt�ry si� do mnie zg�osi?
	AI_Output (self, other,"DIA_Lee_Mitmachen_08_02"); //Musisz najpierw sp�dzi� troch� czasu w naszym Obozie. B�d� ci� mia� na oku! Zobaczymy, na co ci� sta�.
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
	description = "Chcia�bym zosta� Najemnikiem w s�u�bie mag�w. My�lisz, �e jestem ju� got�w?";
};                       

FUNC int  Sld_700_Lee_NowReady_Condition()
{
	if	(Npc_GetTrueGuild(hero) == GIL_ORG)
	&&	((Npc_KnowsInfo(hero,Sld_700_Lee_Mitmachen) || (hero.level >= 10)))
	{
		return 1;
	};
};

FUNC VOID  Sld_700_Lee_NowReady_Info()
{
	AI_Output (other, self,"DIA_Lee_NowReady_15_00"); //Chcia�bym zosta� Najemnikiem w s�u�bie mag�w. My�lisz, �e jestem ju� got�w?
	
	if (CorKalom_BringMCQBalls == LOG_SUCCESS)
	{
		AI_Output			(self, other,"Sld_700_Lee_BECOMESLD_Info_08_01"); //Twoje dokonania w Starej Kopalni dowodz�, �e sta� ci� na wiele.
		AI_Output			(self, other,"Sld_700_Lee_BECOMESLD_Info_08_02"); //Jestem sk�onny przyj�� ci� w poczet Najemnik�w.
	
		if hero.level < 10
		{
			AI_Output			(self, other,"Sld_700_Lee_BECOMESLD_Info_08_03"); //Ale nie jeste� gotowy do s�u�by w naszych szeregach. Musisz zdoby� jeszcze troch� do�wiadczenia.
	    	AI_StopProcessInfos	(self);
			B_PrintGuildCondition(10);
	    }
	    else if hero.level >= 10
	    {
	    	AI_Output			(self, other,"Sld_700_Lee_BECOMESLD_Info_08_04"); //Dam ci szans�. Co ty na to?
	    	Lee_SldPossible = TRUE;
		};
	}
	else
	{	
		if hero.level < 10
		{
			AI_Output (self, other,"DIA_Lee_NowReady_08_01"); //Nadal nie jeste� do�� do�wiadczony. Musisz si� jeszcze wiele nauczy�.
			B_PrintGuildCondition(10);
	    }
	    else if hero.level >= 10
	    {
	    	AI_Output			(self, other,"Sld_700_Lee_BECOMESLD_Info_08_04"); //Dam ci szans�. Co ty na to?
	    	Lee_SldPossible = TRUE;
		};
	};
};

/*------------------------------------------------------------------------
							S�LDNER WERDEN	2									
------------------------------------------------------------------------*/

instance  Sld_700_Lee_BECOMESLDNOW (C_INFO)
{
	npc				= Sld_700_Lee;
	condition		= Sld_700_Lee_BECOMESLDNOW_Condition;
	information		= Sld_700_Lee_BECOMESLDNOW_Info;
	important		= 0;
	permanent		= 0;
	description		= "Chc� zosta� Najemnikiem."; 
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
	AI_Output			(other, self,"Sld_700_Lee_BECOMESLDNOW_Info_15_01"); //Chc� zosta� Najemnikiem.
	AI_Output			(self, other,"Sld_700_Lee_BECOMESLDNOW_Info_08_02"); //M�dra decyzja. Nie po�a�ujesz.
	AI_Output			(self, other,"Sld_700_Lee_BECOMESLDNOW_Info_08_03"); //Powiedz mi: dlaczego? Dlaczego do��czy�e� do nas, a nie do Bractwa, albo do Starego Obozu?

	Log_CreateTopic		(GE_BecomeMercenary,LOG_NOTE);
	B_LogEntry			(GE_BecomeMercenary,"Lee pozwoli� mi do��czy� do Najemnik�w.");
	
	Info_ClearChoices	(Sld_700_Lee_BECOMESLDNOW);
	Info_AddChoice		(Sld_700_Lee_BECOMESLDNOW,"W tamtych obozach tylko traci�bym czas.",Sld_700_Lee_BECOMESLDNOW_NOOTHER);
	Info_AddChoice		(Sld_700_Lee_BECOMESLDNOW,"Od pocz�tku my�la�em tylko o odzyskaniu wolno�ci.",Sld_700_Lee_BECOMESLDNOW_FREEDOM);
	Info_AddChoice		(Sld_700_Lee_BECOMESLDNOW,"Tak si� jako� z�o�y�o.",Sld_700_Lee_BECOMESLDNOW_JUSTBECAUSE);
};
  
FUNC void  Sld_700_Lee_BECOMESLDNOW_NOOTHER()
{
	AI_Output			(other, self,"Sld_700_Lee_BECOMESLDNOW_NOOTHER_15_01"); //W tamtych obozach tylko traci�bym czas.
	AI_Output			(self, other,"Sld_700_Lee_BECOMESLDNOW_NOOTHER_08_02"); //Jedyna rzecz, kt�ra ma tutaj jak�� prawdziw� warto�� to pragnienie wolno�ci. Witaj w�r�d nas, NAJEMNIKU!
	CreateInvItem		(self,SLD_ARMOR_L);
	B_GiveInvItems      (self, hero, SLD_ARMOR_L, 1);
	AI_EquipBestArmor	(hero);
	Npc_SetTrueGuild	(hero,GIL_SLD);
	hero.guild = GIL_SLD;
	AI_StopProcessInfos	(self);
};

FUNC void  Sld_700_Lee_BECOMESLDNOW_FREEDOM()
{
	AI_Output			(other, self,"Sld_700_Lee_BECOMESLDNOW_FREEDOM_15_01"); //Od pocz�tku my�la�em tylko o odzyskaniu wolno�ci.
	AI_Output			(self, other,"Sld_700_Lee_BECOMESLDNOW_FREEDOM_08_02"); //I dzi�ki nam wkr�tce j� odzyskasz. Witaj w�r�d nas, NAJEMNIKU!
	CreateInvItem		(self,SLD_ARMOR_L);
	B_GiveInvItems      (self, hero, SLD_ARMOR_L, 1);
	AI_EquipBestArmor	(hero);
	Npc_SetTrueGuild	(hero,GIL_SLD);
	hero.guild = GIL_SLD;
	AI_StopProcessInfos	(self);
};

FUNC void  Sld_700_Lee_BECOMESLDNOW_JUSTBECAUSE()
{
	AI_Output			(other, self,"Sld_700_Lee_BECOMESLDNOW_JUSTBECAUSE_15_01"); //Tak si� jako� z�o�y�o.
	AI_Output			(self, other,"Sld_700_Lee_BECOMESLDNOW_JUSTBECAUSE_08_02"); //�eby si� tylko nie z�o�y�o, �e kiedy� nagle zmienisz zdanie. Witaj w�r�d nas, NAJEMNIKU!
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
	description		= "Chc� zosta� Magiem Wody."; 
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
	AI_Output			(other, self,"Sld_700_Lee_BECOMEWMNOW_Info_15_01"); //Chc� zosta� Magiem Wody.
	AI_Output			(self, other,"Sld_700_Lee_BECOMEWMNOW_Info_08_02"); //C�, dokona�e� wiele, jednak to nie ja o tym decyduj�. Musisz porozmawia� z Cronosem. 
	
	Log_CreateTopic		(GE_BecomeWatermage,LOG_NOTE);
	B_LogEntry			(GE_BecomeWatermage,"Lee pozwoli� mi do��czy� do Mag�w Wody. Jednak to oni podejm� kluczow� decyzj�, czy jestem gotowy. Musz� porozmawia� z Cronosem.");	
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
	AI_Output			(self, other,"Sld_700_Lee_DAMNPAST_Info_08_01"); //Kiedy� wiod�em ca�kiem inne �ycie.
	AI_Output			(self, other,"Sld_700_Lee_DAMNPAST_Info_08_02"); //By�em jednym z najlepszych genera��w tego kr�lestwa.
	AI_Output			(self, other,"Sld_700_Lee_DAMNPAST_Info_08_03"); //Ca�e �ycie sp�dzi�em broni�c ojczyzny przed wrogiem.
	AI_Output			(self, other,"Sld_700_Lee_DAMNPAST_Info_08_04"); //Ale szlachta patrzy�a na mnie niech�tnie, bo Kr�l wysoko ceni� sobie moje rady. Te �otry wiedzia�y, �e mog� pokrzy�owa� ich plany.
	AI_Output			(self, other,"Sld_700_Lee_DAMNPAST_Info_08_05"); //By�em zbyt pewny siebie i nie zauwa�y�em side�, kt�re na mnie zastawili. Aby mnie usun�� pos�u�yli si� kr�lewsk� �on�.
	AI_Output			(self, other,"Sld_700_Lee_DAMNPAST_Info_08_06"); //Pos�dzono mnie o jej zamordowanie. Rhobar nie mia� innego wyboru.
	AI_Output			(self, other,"Sld_700_Lee_DAMNPAST_Info_08_07"); //Od szubienicy uratowa�o mnie tylko wiele lat przyk�adnej s�u�by. W ten spos�b trafi�em tutaj.
	AI_Output			(self, other,"Sld_700_Lee_DAMNPAST_Info_08_08"); //Ale pewnego dnia odzyskam wolno��, a wtedy nadejdzie czas zemsty...
	
	AI_AlignToWP		(self);
	
	AI_Output			(self, other,"Sld_700_Lee_DAMNPAST_Info_08_09"); //Zemszcz� si�!
	
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
	description = "Co my�lisz o ca�ej tej sprawie z kopalni�?";
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
	AI_Output (other, self,"DIA_Lee_FMTaken_15_00"); //Co my�lisz o ca�ej tej sprawie z kopalni�?
	
	if (Lee_freeminereport == 0) 					//SC hat jetzt die M�glichkeit, Lee �ber die freie Mine zu informieren! ***Bj�rn***
	{
	
		AI_Output (self, other,"DIA_Lee_FMTaken_08_01"); //Tym razem posun�li si� za daleko. Jeszcze tego po�a�uj�.
	
	}
	else
	{
		AI_Output			(hero, self,"Info_Lee_now_freeminefree_15_01"); 	//My�l�, �e zagro�enie ju� min�o.
		AI_Output			(self, hero,"Sld_700_Lee_CHANGESIDE_Info_08_02"); 	//Nasz Ob�z wiele ci zawdzi�cza. Przyda�by mi si� kto� taki jak ty.
		AI_Output			(hero, self,"Info_FreemineOrc_EXIT_15_03"); 		//Dzi�kuj�. Musz� ju� rusza� w dalsz� drog�.
		AI_Output			(self, hero,"Info_CorAngar_TELEPORT_08_01"); 		//Jeszcze co�!
		AI_Output			(self, hero,"Info_CorAngar_TELEPORT_08_03"); 		//We� t� magiczn� run� jako symbol naszej wdzi�czno�ci za twoje dokonania.
		AI_Output			(hero, self,"Info_CorAngar_TELEPORT_15_05"); 		//Dzi�kuj�!
		AI_Output			(hero,	self,"Info_Exit_Info_15_01"); 				//Do zobaczenia!


		B_LogEntry			(CH4_BannedFromOC,	"Poinformowa�em Lee o wynikach akcji, kt�r� przeprowadzi�em wraz z Gornem w Wolnej Kopalni. By� bardzo zadowolony.");
		
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
	description		= "Wyrzucono mnie ze Starego Obozu. Chcia�bym do was do��czy�."; 
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
	AI_Output			(other, self,"Sld_700_Lee_CHANGESIDE_Info_15_01"); //Wyrzucono mnie ze Starego Obozu. Chcia�bym do was do��czy�.
	AI_Output			(self, other,"Sld_700_Lee_CHANGESIDE_Info_08_02"); //Nasz Ob�z wiele ci zawdzi�cza. Przyda�by mi si� kto� taki jak ty.
	AI_Output			(self, other,"Sld_700_Lee_CHANGESIDE_Info_08_03"); //Przejd�my od razu do rzeczy. Witaj w Nowym Obozie, Najemniku!
	AI_Output			(self, other,"Sld_700_Lee_CHANGESIDE_Info_08_04"); //We� t� zbroj�. Dobrze, �e mamy ci� teraz po naszej stronie.

	CreateInvItem		(self, SLD_ARMOR_M);
	B_GiveInvItems      (self, hero, SLD_ARMOR_M, 1);
	Npc_GetInvItemBySlot(hero, INV_ARMOR, 2);
	if (Hlp_GetInstanceID(item)==SLD_ARMOR_M)
	{	
		AI_EquipArmor	(hero, item);
	};
	
	Npc_SetTrueGuild	(hero, GIL_SLD);
	hero.guild = GIL_SLD;

	B_LogEntry			(CH4_BannedFromOC,"Po tym jak zosta�em wygnany ze Starego Obozu, postanowi�em zosta� Najemnikiem. Pora wraca� do Saturasa!");

	Log_CreateTopic 	(GE_TeacherNC,LOG_NOTE);
	B_LogEntry			(GE_TeacherNC,"Lee mo�e mnie nauczy� walki dwur�cznym or�em oraz zwi�kszy� moj� si�� i zwinno��.");
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
	description		= "Przyda�aby mi si� lepsza zbroja."; 
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
	AI_Output				(other, self,"Sld_700_Lee_ARMOR_Info_15_01"); //Przyda�aby mi si� lepsza zbroja.
	AI_Output				(self, other,"Sld_700_Lee_ARMOR_Info_08_02"); //Najpierw musisz sobie na ni� zas�u�y�. Poza tym - taka rzecz nie jest tania.
	
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
	AI_Output				(other, self,"Sld_700_Lee_ARMOR_M_Info_08_01"); //Chcia�bym dosta� wzmocnion� zbroj�.
	if (Kapitel < 3)
	{
		AI_Output			(self, other,"Sld_700_Lee_ARMOR_M_Info_08_02"); //Nie jeste� jeszcze do�� do�wiadczony, �eby otrzyma� nowy pancerz. Wr��, jak zdob�dziesz troch� do�wiadczenia.
	}
	else if (Npc_HasItems (hero,ItMinugget) < VALUE_SLD_ARMOR_M) 
	{
		AI_Output			(self, other,"Sld_700_Lee_ARMOR_M_Info_08_03"); //Bez rudy te� nie masz co marzy� o nowej zbroi.
	}
	else 
	{
		AI_Output			(self, other,"Sld_700_Lee_ARMOR_M_Info_08_04"); //Ta zbroja to kawa� solidnej roboty. B�dzie ci dobrze s�u�y�.
		B_GiveInvItems  	(hero, self, ItMinugget,VALUE_SLD_ARMOR_M);
		CreateInvItem		(hero,SLD_ARMOR_M);
		
		CreateInvItem		(self, ItAmArrow);
		B_GiveInvItems      (self, hero, ItAmArrow, 1);
		Npc_RemoveInvItem	(hero, ItAmArrow);
	};
};
func void Sld_700_Lee_ARMOR_H()
{
	AI_Output				(other, self,"Sld_700_Lee_ARMOR_H_Info_08_01"); //Chcia�bym dosta� ci�k� zbroj�.
	if (Kapitel < 4)
	{
		AI_Output			(self, other,"Sld_700_Lee_ARMOR_H_Info_08_02"); //Nie jeste� jeszcze do�� do�wiadczony, �eby otrzyma� nowy pancerz. Wr��, jak zdob�dziesz troch� do�wiadczenia.
	}
	else if (Npc_HasItems(hero,ItMinugget) < VALUE_SLD_ARMOR_H) 
	{
		AI_Output			(self, other,"Sld_700_Lee_ARMOR_H_Info_08_03"); //Bez rudy te� nie masz co marzy� o nowej zbroi.
	}
	else 
	{
		AI_Output			(self, other,"Sld_700_Lee_ARMOR_H_Info_08_04"); //Ten pancerz to prawdziwe dzie�o sztuki. Lepszego nie znajdziesz po tej stronie Bariery. Mo�esz mi wierzy�, wart jest ka�dej bry�ki...
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
	description = "Mo�esz mnie czego� nauczy�?";
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
	AI_Output(other,self,"Sld_700_Lee_Teach_15_00"); //Mo�esz mnie czego� nauczy�?
	AI_Output(self,other,"Sld_700_Lee_Teach_08_01"); //Mog� ci pom�c zwi�kszy� twoj� si�� i zr�czno��.
	
	
	
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
// NAUKA WALKI ORʯEM 2H
//---------------------------------------------------------------
instance  SLD_700_Lee_TEACH_2H (C_INFO)
{
	npc				= Sld_700_Lee;
	condition		= SLD_700_Lee_TEACH_2H_Condition;
	information		= SLD_700_Lee_TEACH_2H_Info;
	permanent		= 0;
	description		= "Mo�esz mnie nauczy� lepiej walczy� dwur�cznym or�em?"; 
};
//
FUNC int  SLD_700_Lee_TEACH_2H_Condition()
{	
		return TRUE;
};

FUNC void  SLD_700_Lee_TEACH_2H_Info()
{
	AI_Output (other, self,"SLD_700_Lee_TEACH_2H_Info_15_01"); //Mo�esz mnie nauczy� lepiej walczy�?
	AI_Output (self, other,"SLD_700_Lee_TEACH_2H_Info_09_02"); //Dobrze, ale musisz by� cz�onkiem Nowego Obozu. 

	//if (log_Leefight == FALSE)
	//{
		Log_CreateTopic   	(GE_TeacherNC,LOG_NOTE);
		B_LogEntry			(GE_TeacherNC,"Lee mo�e mnie nauczy� walki dwur�cznym or�em, gdy tylko zostan� cz�onkiem Nowego Obozu.");
	//	log_Leefight = TRUE;
	//};
}; 

//---------------------------------------------------------------
// NAUKA WALKI ORʯEM 2H
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
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Bro� dwur�czna, poziom 1, 100 bry�ek rudy, 10 PN",Lee_teach_2h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 1) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Bro� dwur�czna, poziom 2, 200 bry�ek rudy, 10 PN",Lee_teach_2h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 2) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Bro� dwur�czna, poziom 3, 300 bry�ek rudy, 10 PN",Lee_teach_2h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 3) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Bro� dwur�czna, poziom 4, 400 bry�ek rudy, 10 PN",Lee_teach_2h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 4) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Bro� dwur�czna, poziom 5, 500 bry�ek rudy, 10 PN",Lee_teach_2h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 5) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Bro� dwur�czna, poziom 6, 600 bry�ek rudy, 10 PN",Lee_teach_2h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 6) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Bro� dwur�czna, poziom 7, 1000 bry�ek rudy, 10 PN",Lee_teach_2h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 7) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Bro� dwur�czna, poziom 8, 1500 bry�ek rudy, 10 PN",Lee_teach_2h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 8) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Bro� dwur�czna, poziom 9, 2000 bry�ek rudy, 10 PN",Lee_teach_2h9);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 9) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Bro� dwur�czna, poziom 10, 2500 bry�ek rudy, 10 PN",Lee_teach_2h10);
	};
};

func void SLD_700_Lee_TEACH_2H_STARTBACK ()
{
	Info_ClearChoices	(SLD_700_Lee_TEACH_2H_START);
};

FUNC VOID Lee_teach_2h1 ()
{
	AI_Output (other,self,"DIA_Lee_TRAIN_2h_15_00"); //Chcia�bym nauczy� si� walki dwur�cznym or�em.
	if (Npc_HasItems(other,itminugget) >= 100)
	{
		if (B_GiveSkill(other, NPC_TALENT_2h, 1, 10))
		{
		AI_Output (self,other,"DIA_Lee_TRAIN_2h_npc_01"); //Bronie dwur�czne wymagaj� sporo si�y. S� ci�kie, a przez to tak�e wolniejsze.
		AI_Output (self,other,"DIA_Lee_TRAIN_2h_npc_02"); //Zmieni si� to jednak w trakcie czynienia przez ciebie post�p�w w nauce.
		AI_Output (self,other,"DIA_Lee_TRAIN_2h_npc_03"); //Za powolno�� bronie dwur�czne odwdzi�cz� ci si� pot�nymi obra�eniami.
		AI_Output (self,other,"DIA_Lee_TRAIN_2h_npc_04"); //Ka�d� bro� musisz odpowiednio wyczu�. Topory s� inaczej zbalansowane ni� miecze. Pami�taj o tym.
		B_GiveInvItems(other,self,itminugget,100);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Lee_TRAIN_2h_NoOre_01_00"); //Nie masz wystarczaj�cej ilo�ci rudy!
	};	
	Info_ClearChoices	(SLD_700_Lee_TEACH_2H_START);
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,DIALOG_BACK,SLD_700_Lee_TEACH_2H_STARTBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 0) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Bro� dwur�czna, poziom 1, 100 bry�ek rudy, 10 PN",Lee_teach_2h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 1) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Bro� dwur�czna, poziom 2, 200 bry�ek rudy, 10 PN",Lee_teach_2h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 2) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Bro� dwur�czna, poziom 3, 300 bry�ek rudy, 10 PN",Lee_teach_2h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 3) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Bro� dwur�czna, poziom 4, 400 bry�ek rudy, 10 PN",Lee_teach_2h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 4) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Bro� dwur�czna, poziom 5, 500 bry�ek rudy, 10 PN",Lee_teach_2h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 5) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Bro� dwur�czna, poziom 6, 600 bry�ek rudy, 10 PN",Lee_teach_2h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 6) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Bro� dwur�czna, poziom 7, 1000 bry�ek rudy, 10 PN",Lee_teach_2h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 7) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Bro� dwur�czna, poziom 8, 1500 bry�ek rudy, 10 PN",Lee_teach_2h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 8) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Bro� dwur�czna, poziom 9, 2000 bry�ek rudy, 10 PN",Lee_teach_2h9);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 9) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Bro� dwur�czna, poziom 10, 2500 bry�ek rudy, 10 PN",Lee_teach_2h10);
	};
};

FUNC VOID Lee_teach_2h2 ()
{
	AI_Output (other,self,"DIA_Lee_TRAIN_2h_15_01"); //Naucz mnie sprawniej pos�ugiwa� si� dwur�czn� broni�.
	if (Npc_HasItems(other,itminugget) >= 200)
	{
		if (B_GiveSkill(other, NPC_TALENT_2h, 2, 10))
		{
		AI_Output (self,other,"DIA_Lee_TRAIN_2h_npc_06"); //Musisz pracowa� nad swoj� si��. Pozwoli ci ona wykonywa� szybsze ruchy i podnosi� coraz ci�sze bronie. 
		//AI_DrawWeapon (other);
		AI_Output (self,other,"DIA_Lee_TRAIN_2h_npc_07"); //P�niej b�dziesz musia� pozna� odpowiedni� technik� walki i ��cznia cios�w. 
		//AI_RemoveWeapon (other);
		AI_Output (self,other,"DIA_Lee_TRAIN_2h_npc_08"); //Na razie nie jeste� wstanie zada� pe�nych obra�e� na jakie pozwala ci dana bro�. Spokojnie, zajmiemy si� tym.
		B_GiveInvItems(other,self,itminugget,200);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Lee_TRAIN_2h_NoOre_01_00"); //Nie masz wystarczaj�cej ilo�ci rudy!
	};	
	Info_ClearChoices	(SLD_700_Lee_TEACH_2H_START);
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,DIALOG_BACK,SLD_700_Lee_TEACH_2H_STARTBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 0) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Bro� dwur�czna, poziom 1, 100 bry�ek rudy, 10 PN",Lee_teach_2h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 1) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Bro� dwur�czna, poziom 2, 200 bry�ek rudy, 10 PN",Lee_teach_2h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 2) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Bro� dwur�czna, poziom 3, 300 bry�ek rudy, 10 PN",Lee_teach_2h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 3) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Bro� dwur�czna, poziom 4, 400 bry�ek rudy, 10 PN",Lee_teach_2h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 4) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Bro� dwur�czna, poziom 5, 500 bry�ek rudy, 10 PN",Lee_teach_2h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 5) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Bro� dwur�czna, poziom 6, 600 bry�ek rudy, 10 PN",Lee_teach_2h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 6) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Bro� dwur�czna, poziom 7, 1000 bry�ek rudy, 10 PN",Lee_teach_2h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 7) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Bro� dwur�czna, poziom 8, 1500 bry�ek rudy, 10 PN",Lee_teach_2h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 8) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Bro� dwur�czna, poziom 9, 2000 bry�ek rudy, 10 PN",Lee_teach_2h9);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 9) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Bro� dwur�czna, poziom 10, 2500 bry�ek rudy, 10 PN",Lee_teach_2h10);
	};
};

FUNC VOID Lee_teach_2h3 ()
{
	AI_Output (other,self,"DIA_Lee_TRAIN_2h_15_01"); //Naucz mnie sprawniej pos�ugiwa� si� dwur�czn� broni�.
	if (Npc_HasItems(other,itminugget) >= 300)
	{
		if (B_GiveSkill(other, NPC_TALENT_2h, 3, 10))
		{
		AI_Output (self,other,"DIA_Lee_TRAIN_2h_npc_10"); //Wiesz jaka jest jeszcze zaleta dwur�cznych broni?
		AI_Output (self,other,"DIA_Lee_TRAIN_2h_npc_11"); //S� d�ugie... Im d�u�sze tym dalej od siebie mo�esz trzyma� przeciwnika. 
		AI_Output (self,other,"DIA_Lee_TRAIN_2h_npc_12"); //Gdy kupujesz bro� zwracaj uwag� na jej g�rn� cz��. Je�li jest wystarczaj�co ostra to nawet dra�ni�cie oponenta z daleka zada mu obra�enia lub zniszczy jego pancerz. 
		AI_Output (self,other,"DIA_Lee_TRAIN_2h_npc_13"); //Poka� mi jeszcze jak wyci�gasz bro�. Robisz jakie� post�py?
		AI_DrawWeapon (other);
		AI_Output (self,other,"DIA_Lee_TRAIN_2h_npc_14"); //Nie, nie, nie. Om�wimy to na nast�pnej lekcji. 
		AI_RemoveWeapon (other);
		B_GiveInvItems(other,self,itminugget,300);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Lee_TRAIN_2h_NoOre_01_00"); //Nie masz wystarczaj�cej ilo�ci rudy!
	};	
	Info_ClearChoices	(SLD_700_Lee_TEACH_2H_START);
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,DIALOG_BACK,SLD_700_Lee_TEACH_2H_STARTBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 0) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Bro� dwur�czna, poziom 1, 100 bry�ek rudy, 10 PN",Lee_teach_2h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 1) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Bro� dwur�czna, poziom 2, 200 bry�ek rudy, 10 PN",Lee_teach_2h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 2) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Bro� dwur�czna, poziom 3, 300 bry�ek rudy, 10 PN",Lee_teach_2h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 3) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Bro� dwur�czna, poziom 4, 400 bry�ek rudy, 10 PN",Lee_teach_2h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 4) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Bro� dwur�czna, poziom 5, 500 bry�ek rudy, 10 PN",Lee_teach_2h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 5) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Bro� dwur�czna, poziom 6, 600 bry�ek rudy, 10 PN",Lee_teach_2h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 6) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Bro� dwur�czna, poziom 7, 1000 bry�ek rudy, 10 PN",Lee_teach_2h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 7) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Bro� dwur�czna, poziom 8, 1500 bry�ek rudy, 10 PN",Lee_teach_2h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 8) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Bro� dwur�czna, poziom 9, 2000 bry�ek rudy, 10 PN",Lee_teach_2h9);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 9) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Bro� dwur�czna, poziom 10, 2500 bry�ek rudy, 10 PN",Lee_teach_2h10);
	};
};

FUNC VOID Lee_teach_2h4 ()
{
	AI_Output (other,self,"DIA_Lee_TRAIN_2h_15_01"); //Naucz mnie sprawniej pos�ugiwa� si� dwur�czn� broni�.
	if (Npc_HasItems(other,itminugget) >= 400)
	{
		if (B_GiveSkill(other, NPC_TALENT_2h, 4, 10))
		{
		AI_Output (self, other,"SLD_700_Lee_ZWEIHAND1_Info_09_03"); //Wyci�gnij miecz przed siebie. Aby zaatakowa� wroga tak ci�k� broni�, musisz mocniej si� zamachn��.
		AI_Output (self, other,"SLD_700_Lee_ZWEIHAND1_Info_09_04"); //Unie� rami� i zdecydowanie opu�� miecz. To powinno wystarczy�, �eby powali� przeciwnika na ziemi�.
		AI_Output (self, other,"SLD_700_Lee_ZWEIHAND1_Info_09_05"); //Wykorzystaj bezw�adno�� broni, by unie�� j� ponownie do g�ry.
		AI_Output (self, other,"SLD_700_Lee_ZWEIHAND1_Info_09_06"); //Dwur�czne miecze �wietnie sprawdzaj� si� przy zadawaniu cios�w z boku. W ten spos�b mo�esz trzyma� przeciwnika na dystans.
		AI_Output (self, other,"SLD_700_Lee_ZWEIHAND1_Info_09_07"); //To ci powinno wystarczy� na pocz�tek. Teraz troch� po�wicz.
		B_GiveInvItems(other,self,itminugget,400);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Lee_TRAIN_2h_NoOre_01_00"); //Nie masz wystarczaj�cej ilo�ci rudy!
	};	
Info_ClearChoices	(SLD_700_Lee_TEACH_2H_START);
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,DIALOG_BACK,SLD_700_Lee_TEACH_2H_STARTBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 0) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Bro� dwur�czna, poziom 1, 100 bry�ek rudy, 10 PN",Lee_teach_2h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 1) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Bro� dwur�czna, poziom 2, 200 bry�ek rudy, 10 PN",Lee_teach_2h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 2) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Bro� dwur�czna, poziom 3, 300 bry�ek rudy, 10 PN",Lee_teach_2h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 3) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Bro� dwur�czna, poziom 4, 400 bry�ek rudy, 10 PN",Lee_teach_2h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 4) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Bro� dwur�czna, poziom 5, 500 bry�ek rudy, 10 PN",Lee_teach_2h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 5) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Bro� dwur�czna, poziom 6, 600 bry�ek rudy, 10 PN",Lee_teach_2h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 6) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Bro� dwur�czna, poziom 7, 1000 bry�ek rudy, 10 PN",Lee_teach_2h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 7) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Bro� dwur�czna, poziom 8, 1500 bry�ek rudy, 10 PN",Lee_teach_2h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 8) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Bro� dwur�czna, poziom 9, 2000 bry�ek rudy, 10 PN",Lee_teach_2h9);
	};	
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 9) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Bro� dwur�czna, poziom 10, 2500 bry�ek rudy, 10 PN",Lee_teach_2h10);
	};
};

FUNC VOID Lee_teach_2h5 ()
{
	AI_Output (other,self,"DIA_Lee_TRAIN_2h_15_01"); //Naucz mnie sprawniej pos�ugiwa� si� dwur�czn� broni�.
	if (Npc_HasItems(other,itminugget) >= 500)
	{
		if (B_GiveSkill(other, NPC_TALENT_2h, 5, 10))
		{
		AI_Output (self,other,"DIA_Lee_TRAIN_2h_npc_15"); //Na poprzedniej lekcji nauczy�em ci� jak porz�dnie trzyma� bro� i jak wykorzysta� si�� bezw�adno�ci ostrza.
		AI_Output (self,other,"DIA_Lee_TRAIN_2h_npc_16"); //Pami�taj, �e im lepiej wyczujesz balans broni tym �atwiej b�dzie ci ��czy� kolejne ciosy.
		AI_Output (self,other,"DIA_Lee_TRAIN_2h_npc_17"); //Musisz wiedzie�, w kt�rym momencie ponownie si� zamachn��, tak by wykorzysta� przy tym impet pierwszego uderzenia. Pozwoli ci to oszcz�dzi� si�y.
			B_GiveInvItems(other,self,itminugget,500);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Lee_TRAIN_2h_NoOre_01_00"); //Nie masz wystarczaj�cej ilo�ci rudy!
	};	
Info_ClearChoices	(SLD_700_Lee_TEACH_2H_START);
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,DIALOG_BACK,SLD_700_Lee_TEACH_2H_STARTBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 0) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Bro� dwur�czna, poziom 1, 100 bry�ek rudy, 10 PN",Lee_teach_2h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 1) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Bro� dwur�czna, poziom 2, 200 bry�ek rudy, 10 PN",Lee_teach_2h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 2) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Bro� dwur�czna, poziom 3, 300 bry�ek rudy, 10 PN",Lee_teach_2h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 3) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Bro� dwur�czna, poziom 4, 400 bry�ek rudy, 10 PN",Lee_teach_2h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 4) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Bro� dwur�czna, poziom 5, 500 bry�ek rudy, 10 PN",Lee_teach_2h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 5) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Bro� dwur�czna, poziom 6, 600 bry�ek rudy, 10 PN",Lee_teach_2h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 6) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Bro� dwur�czna, poziom 7, 1000 bry�ek rudy, 10 PN",Lee_teach_2h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 7) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Bro� dwur�czna, poziom 8, 1500 bry�ek rudy, 10 PN",Lee_teach_2h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 8) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Bro� dwur�czna, poziom 9, 2000 bry�ek rudy, 10 PN",Lee_teach_2h9);
	};	
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 9) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Bro� dwur�czna, poziom 10, 2500 bry�ek rudy, 10 PN",Lee_teach_2h10);
	};
};

FUNC VOID Lee_teach_2h6 ()
{
	AI_Output (other,self,"DIA_Lee_TRAIN_2h_15_01"); //Naucz mnie sprawniej pos�ugiwa� si� dwur�czn� broni�.
	if (Npc_HasItems(other,itminugget) >= 600)
	{
		if (B_GiveSkill(other, NPC_TALENT_2h, 6, 10))
		{
		AI_Output (self,other,"DIA_Lee_TRAIN_2h_npc_18"); //Stosuj r�ne strategie walki. Uderzaj raz z przodu, raz z boku. A p�niej jeszcze z drugiej strony. 
		AI_Output (self,other,"DIA_Lee_TRAIN_2h_npc_19"); //Uniki z dwur�cznym mieczem w r�ku faktycznie mog� by� trudne, dlatego musisz parowa� ciosy. �wicz si�� mi�ni r�k, plec�w i klatki piersiowej. 
		AI_Output (self,other,"DIA_Lee_TRAIN_2h_npc_20"); //To pozwoli ci skutecznie blokowa�, bez ryzyka po�amania sobie czego�. 
		B_GiveInvItems(other,self,itminugget,600);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Lee_TRAIN_2h_NoOre_01_00"); //Nie masz wystarczaj�cej ilo�ci rudy!
	};
Info_ClearChoices	(SLD_700_Lee_TEACH_2H_START);
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,DIALOG_BACK,SLD_700_Lee_TEACH_2H_STARTBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 0) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Bro� dwur�czna, poziom 1, 100 bry�ek rudy, 10 PN",Lee_teach_2h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 1) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Bro� dwur�czna, poziom 2, 200 bry�ek rudy, 10 PN",Lee_teach_2h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 2) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Bro� dwur�czna, poziom 3, 300 bry�ek rudy, 10 PN",Lee_teach_2h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 3) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Bro� dwur�czna, poziom 4, 400 bry�ek rudy, 10 PN",Lee_teach_2h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 4) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Bro� dwur�czna, poziom 5, 500 bry�ek rudy, 10 PN",Lee_teach_2h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 5) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Bro� dwur�czna, poziom 6, 600 bry�ek rudy, 10 PN",Lee_teach_2h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 6) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Bro� dwur�czna, poziom 7, 1000 bry�ek rudy, 10 PN",Lee_teach_2h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 7) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Bro� dwur�czna, poziom 8, 1500 bry�ek rudy, 10 PN",Lee_teach_2h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 8) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Bro� dwur�czna, poziom 9, 2000 bry�ek rudy, 10 PN",Lee_teach_2h9);
	};	
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 9) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Bro� dwur�czna, poziom 10, 2500 bry�ek rudy, 10 PN",Lee_teach_2h10);
	};
};

FUNC VOID Lee_teach_2h7 ()
{
	AI_Output (other,self,"DIA_Lee_TRAIN_2h_15_01"); //Naucz mnie sprawniej pos�ugiwa� si� dwur�czn� broni�.
	if (Npc_HasItems(other,itminugget) >= 1000)
	{
		if (B_GiveSkill(other, NPC_TALENT_2h, 7, 10))
		{
		AI_Output (self, other,"SLD_700_Lee_ZWEIHAND2_Info_09_02"); //Musisz si� nauczy� p�ynnie przenosi� �rodek ci�ko�ci. Trzymaj miecz pionowo. Obie d�onie mocno zaci�nij na jego r�koje�ci i przesu� go nieco w bok.
		AI_Output (self, other,"SLD_700_Lee_ZWEIHAND2_Info_09_03"); //Teraz uderz szybko od g�ry, i pozw�l klindze pow�drowa� nad twoje rami�. Teraz mo�esz wyprowadzi� szybkie ci�cie na prawo.
		AI_Output (self, other,"SLD_700_Lee_ZWEIHAND2_Info_09_04"); //Tw�j przeciwnik nie b�dzie mia� okazji podej�� bli�ej.
		AI_Output (self, other,"SLD_700_Lee_ZWEIHAND2_Info_09_05"); //Albo spr�buj wyprowadzi� z lewej strony cios do przodu, aby odrzuci� od siebie rywala.
		AI_Output (self, other,"SLD_700_Lee_ZWEIHAND2_Info_09_06"); //Teraz obr�t, �eby kolejny cios nabra� odpowiedniej mocy. Przy odrobinie szcz�cia wr�g nie prze�yje tego uderzenia.
		AI_Output (self, other,"SLD_700_Lee_ZWEIHAND2_Info_09_07"); //A je�li i to nie wystarczy, wykorzystaj reszt� si�y zamachowej, by ponownie unie�� miecz do g�ry.
		AI_Output (self, other,"SLD_700_Lee_ZWEIHAND2_Info_09_08"); //Po sko�czonym ataku wykonaj zas�on� i wypatruj luki w obronie przeciwnika.
		AI_Output (self, other,"SLD_700_Lee_ZWEIHAND2_Info_09_09"); //Kluczem do sukcesu jest ci�g�a zmiana pozycji i umiej�tne wykorzystanie bezw�adno�ci broni.
		B_GiveInvItems(other,self,itminugget,1000);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Lee_TRAIN_2h_NoOre_01_00"); //Nie masz wystarczaj�cej ilo�ci rudy!
	};	
Info_ClearChoices	(SLD_700_Lee_TEACH_2H_START);
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,DIALOG_BACK,SLD_700_Lee_TEACH_2H_STARTBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 0) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Bro� dwur�czna, poziom 1, 100 bry�ek rudy, 10 PN",Lee_teach_2h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 1) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Bro� dwur�czna, poziom 2, 200 bry�ek rudy, 10 PN",Lee_teach_2h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 2) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Bro� dwur�czna, poziom 3, 300 bry�ek rudy, 10 PN",Lee_teach_2h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 3) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Bro� dwur�czna, poziom 4, 400 bry�ek rudy, 10 PN",Lee_teach_2h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 4) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Bro� dwur�czna, poziom 5, 500 bry�ek rudy, 10 PN",Lee_teach_2h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 5) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Bro� dwur�czna, poziom 6, 600 bry�ek rudy, 10 PN",Lee_teach_2h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 6) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Bro� dwur�czna, poziom 7, 1000 bry�ek rudy, 10 PN",Lee_teach_2h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 7) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Bro� dwur�czna, poziom 8, 1500 bry�ek rudy, 10 PN",Lee_teach_2h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 8) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Bro� dwur�czna, poziom 9, 2000 bry�ek rudy, 10 PN",Lee_teach_2h9);
	};	
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 9) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Bro� dwur�czna, poziom 10, 2500 bry�ek rudy, 10 PN",Lee_teach_2h10);
	};
};

FUNC VOID Lee_teach_2h8 ()
{
	AI_Output (other,self,"DIA_Lee_TRAIN_2h_15_01"); //Naucz mnie sprawniej pos�ugiwa� si� dwur�czn� broni�.
	if (Npc_HasItems(other,itminugget) >= 1500)
	{
		if (B_GiveSkill(other, NPC_TALENT_2h, 8, 10))
		{
		AI_Output (self,other,"DIA_Lee_TRAIN_2h_npc_21"); //Robisz post�py. Skup si� na kolejnych ciosach. ��cz je coraz szybciej i pewniej.
		B_GiveInvItems(other,self,itminugget,1500);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Lee_TRAIN_2h_NoOre_01_00"); //Nie masz wystarczaj�cej ilo�ci rudy!
	};	
Info_ClearChoices	(SLD_700_Lee_TEACH_2H_START);
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,DIALOG_BACK,SLD_700_Lee_TEACH_2H_STARTBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 0) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Bro� dwur�czna, poziom 1, 100 bry�ek rudy, 10 PN",Lee_teach_2h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 1) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Bro� dwur�czna, poziom 2, 200 bry�ek rudy, 10 PN",Lee_teach_2h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 2) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Bro� dwur�czna, poziom 3, 300 bry�ek rudy, 10 PN",Lee_teach_2h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 3) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Bro� dwur�czna, poziom 4, 400 bry�ek rudy, 10 PN",Lee_teach_2h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 4) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Bro� dwur�czna, poziom 5, 500 bry�ek rudy, 10 PN",Lee_teach_2h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 5) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Bro� dwur�czna, poziom 6, 600 bry�ek rudy, 10 PN",Lee_teach_2h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 6) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Bro� dwur�czna, poziom 7, 1000 bry�ek rudy, 10 PN",Lee_teach_2h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 7) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Bro� dwur�czna, poziom 8, 1500 bry�ek rudy, 10 PN",Lee_teach_2h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 8) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Bro� dwur�czna, poziom 9, 2000 bry�ek rudy, 10 PN",Lee_teach_2h9);
	};	
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 9) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Bro� dwur�czna, poziom 10, 2500 bry�ek rudy, 10 PN",Lee_teach_2h10);
	};
};

FUNC VOID Lee_teach_2h9 ()
{
	AI_Output (other,self,"DIA_Lee_TRAIN_2h_15_01"); //Naucz mnie sprawniej pos�ugiwa� si� dwur�czn� broni�.
	if (Npc_HasItems(other,itminugget) >= 2000)
	{
		if (B_GiveSkill(other, NPC_TALENT_2h, 9, 10))
		{
		AI_Output (self,other,"DIA_Lee_TRAIN_2h_npc_22"); //Chc�c najbole�niej zrani� przeciwnika musisz dobrze wymierzy� cios. Gdy masz szans� staraj si� trafia� w g�ow� lub barki.
		AI_Output (self,other,"DIA_Lee_TRAIN_2h_npc_23"); //S�abe punkty to tak�e ��cznia zbroi. Je�li przeciwnik ma na sobie sk�rzan� zbroj� to po prostu bij w brzuch. 
		AI_Output (self,other,"DIA_Lee_TRAIN_2h_npc_24"); //Sk�rzane pancerze �atwo si� rozcina. 
		AI_Output (self,other,"DIA_Lee_TRAIN_2h_npc_25"); //Przypomnij sobie jeszcze raz to wszystko, czego ci� nauczy�em i stosuj si� do tego. 
		B_GiveInvItems(other,self,itminugget,2000);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Lee_TRAIN_2h_NoOre_01_00"); //Nie masz wystarczaj�cej ilo�ci rudy!
	};	
Info_ClearChoices	(SLD_700_Lee_TEACH_2H_START);
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,DIALOG_BACK,SLD_700_Lee_TEACH_2H_STARTBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 0) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Bro� dwur�czna, poziom 1, 100 bry�ek rudy, 10 PN",Lee_teach_2h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 1) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Bro� dwur�czna, poziom 2, 200 bry�ek rudy, 10 PN",Lee_teach_2h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 2) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Bro� dwur�czna, poziom 3, 300 bry�ek rudy, 10 PN",Lee_teach_2h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 3) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Bro� dwur�czna, poziom 4, 400 bry�ek rudy, 10 PN",Lee_teach_2h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 4) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Bro� dwur�czna, poziom 5, 500 bry�ek rudy, 10 PN",Lee_teach_2h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 5) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Bro� dwur�czna, poziom 6, 600 bry�ek rudy, 10 PN",Lee_teach_2h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 6) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Bro� dwur�czna, poziom 7, 1000 bry�ek rudy, 10 PN",Lee_teach_2h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 7) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Bro� dwur�czna, poziom 8, 1500 bry�ek rudy, 10 PN",Lee_teach_2h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 8) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Bro� dwur�czna, poziom 9, 2000 bry�ek rudy, 10 PN",Lee_teach_2h9);
	};	
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 9) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Bro� dwur�czna, poziom 10, 2500 bry�ek rudy, 10 PN",Lee_teach_2h10);
	};
};

FUNC VOID Lee_teach_2h10 ()
{
	AI_Output (other,self,"DIA_Lee_TRAIN_2h_15_01"); //Naucz mnie sprawniej pos�ugiwa� si� dwur�czn� broni�.
	if (Npc_HasItems(other,itminugget) >= 2500)
	{
		if (B_GiveSkill(other, NPC_TALENT_2h, 10, 10))
		{
		AI_Output (self,other,"DIA_Lee_TRAIN_2h_npc_26"); //To ju� nasza ostatnia lekcja. Poka�� ci sztuczki, kt�re pozwol� ci jeszcze lepiej wyczu� bro�.
		AI_Output (self,other,"DIA_Lee_TRAIN_2h_npc_27"); //Musisz nauczy� si� rozpoznawa� s�abe punkty przeciwnik�w i skupia� si� na nich.
		AI_Output (self,other,"DIA_Lee_TRAIN_2h_npc_28"); //Z czasem dojdziesz do wprawy.
		B_GiveInvItems(other,self,itminugget,2500);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Lee_TRAIN_2h_NoOre_01_00"); //Nie masz wystarczaj�cej ilo�ci rudy!
	};	
Info_ClearChoices	(SLD_700_Lee_TEACH_2H_START);
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,DIALOG_BACK,SLD_700_Lee_TEACH_2H_STARTBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 0) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Bro� dwur�czna, poziom 1, 100 bry�ek rudy, 10 PN",Lee_teach_2h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 1) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Bro� dwur�czna, poziom 2, 200 bry�ek rudy, 10 PN",Lee_teach_2h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 2) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Bro� dwur�czna, poziom 3, 300 bry�ek rudy, 10 PN",Lee_teach_2h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 3) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Bro� dwur�czna, poziom 4, 400 bry�ek rudy, 10 PN",Lee_teach_2h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 4) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Bro� dwur�czna, poziom 5, 500 bry�ek rudy, 10 PN",Lee_teach_2h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 5) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Bro� dwur�czna, poziom 6, 600 bry�ek rudy, 10 PN",Lee_teach_2h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 6) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Bro� dwur�czna, poziom 7, 1000 bry�ek rudy, 10 PN",Lee_teach_2h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 7) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Bro� dwur�czna, poziom 8, 1500 bry�ek rudy, 10 PN",Lee_teach_2h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 8) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Bro� dwur�czna, poziom 9, 2000 bry�ek rudy, 10 PN",Lee_teach_2h9);
	};	
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 9) 
	{
	Info_AddChoice		(SLD_700_Lee_TEACH_2H_START,"Bro� dwur�czna, poziom 10, 2500 bry�ek rudy, 10 PN",Lee_teach_2h10);
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
			&& ((Npc_GetTrueGuild    (hero) == GIL_SLD) || ((Npc_GetTrueGuild(hero)==GIL_KDW) && (Kapitel >= 4))  )	//jetzt auch als Wassermagier im 4. Kapitel m�glich ***BJ�RN***
		)
	{
		return TRUE;
	};

};
FUNC void  Sld_700_Lee_ZWEIHAND1_Info()
{
	AI_Output			(other, self,"Sld_700_Lee_ZWEIHAND1_Info_15_01"); //Chc� si� nauczy� pos�ugiwa� dwur�cznym mieczem.
	if (hero.attribute[ATR_STRENGTH] >= 80)
	{
	if (B_GiveSkill(other,NPC_TALENT_2H , 1, LPCOST_TALENT_2H_1))
	{
		AI_Output			(self, other,"Sld_700_Lee_ZWEIHAND1_Info_08_02"); //W porz�dku. Najpierw om�wimy podstawy.
		AI_Output			(self, other,"Sld_700_Lee_ZWEIHAND1_Info_08_03"); //Wyci�gnij miecz przed siebie. Aby zaatakowa� wroga tak ci�k� broni�, musisz mocniej si� zamachn��.
		AI_Output			(self, other,"Sld_700_Lee_ZWEIHAND1_Info_08_04"); //Unie� r�k� i zdecydowanie opu�� miecz. To powinno wystarczy�, �eby powali� przeciwnika na ziemi�.
		AI_Output			(self, other,"Sld_700_Lee_ZWEIHAND1_Info_08_05"); //Wykorzystaj bezw�adno�� broni, by unie�� j� ponownie do g�ry.
		AI_Output			(self, other,"Sld_700_Lee_ZWEIHAND1_Info_08_06"); //Dwur�czne miecze �wietnie sprawdzaj� si� przy zadawaniu cios�w z boku. W ten spos�b mo�esz trzyma� przeciwnika na dystans.
		AI_Output			(self, other,"Sld_700_Lee_ZWEIHAND1_Info_08_07"); //To ci powinno wystarczy� na pocz�tek. Potrenuj troch�.
	
		Sld_700_Lee_ZWEIHAND1.permanent = 0;
	};
	}
	else
	{
	AI_Output			(self,other,"Sld_700_Lee_NO_ENOUGHT_STR_1"); //Wr��, gdy b�dziesz silniejszy. Walka broni� dwur�czn� to nie przelewki!
	PrintScreen	("Warunek: Si�a 80", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
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
			&& ( (Npc_GetTrueGuild    (hero) == GIL_SLD) ||  ((Npc_GetTrueGuild(hero)==GIL_KDW) && (Kapitel >= 4))  )	//jetzt auch als Wassermagier im 4. Kapitel m�glich ***BJ�RN***
		)
	{
		return TRUE;
	};

};
FUNC void  Sld_700_Lee_ZWEIHAND2_Info()
{
	AI_Output			(other, self,"Sld_700_Lee_ZWEIHAND2_Info_15_01"); //Chcia�bym si� dowiedzie� czego� wi�cej o walce dwur�cznym mieczem.
	if (hero.attribute[ATR_STRENGTH] >= 120)
	{
	if (B_GiveSkill(other,NPC_TALENT_2H , 2, LPCOST_TALENT_2H_2))
	{
		AI_Output			(self, other,"Sld_700_Lee_ZWEIHAND2_Info_08_02"); //Musisz si� nauczy� p�ynnie przenosi� sw�j �rodek ci�ko�ci. Trzymaj miecz pionowo. Obie d�onie mocno zaci�nij na r�koje�ci i przesu� go nieco w bok.
		AI_Output			(self, other,"Sld_700_Lee_ZWEIHAND2_Info_08_03"); //Teraz uderz szybko od g�ry i pozw�l klindze pow�drowa� nad twoje rami�. Teraz mo�esz wyprowadzi� szybkie ci�cie na prawo.
		AI_Output			(self, other,"Sld_700_Lee_ZWEIHAND2_Info_08_04"); //Tw�j przeciwnik nie b�dzie mia� okazji podej�� bli�ej.
		AI_Output			(self, other,"Sld_700_Lee_ZWEIHAND2_Info_08_05"); //Albo spr�buj wyprowadzi� z lewej strony cios do przodu, aby odrzuci� rywala do ty�u. 
		AI_Output			(self, other,"Sld_700_Lee_ZWEIHAND2_Info_08_06"); //Teraz obr�t, �eby kolejny cios nabra� odpowiedniej mocy. Przy odrobinie szcz�cia wr�g nie prze�yje tego uderzenia.
		AI_Output			(self, other,"Sld_700_Lee_ZWEIHAND2_Info_08_07"); //A je�li i to nie wystarczy, wykorzystaj reszt� si�y zamachowej, by ponownie unie�� miecz do g�ry.
		AI_Output			(self, other,"Sld_700_Lee_ZWEIHAND2_Info_08_08"); //Po sko�czonym ataku wykonaj zas�on� i wypatruj luki w obronie przeciwnika.
		AI_Output			(self, other,"Sld_700_Lee_ZWEIHAND2_Info_08_09"); //Kluczem do sukcesu jest ci�g�a zmiana pozycji i umiej�tne wykorzystanie bezw�adno�ci broni.
	
		Sld_700_Lee_ZWEIHAND2.permanent = 0;
	};
	}
	else
	{
	AI_Output			(self,other,"Sld_700_Lee_NO_ENOUGHT_STR_1"); //Wr��, gdy b�dziesz silniejszy. Walka broni� dwur�czn� to nie przelewki!
	PrintScreen	("Warunek: Si�a 120", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
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
    AI_Output (self, other ,"DIA_Lee_ZAplecami_03_01"); //Czemu dowiaduj� si� o wszystkim ostatni?
    AI_Output (other, self ,"DIA_Lee_ZAplecami_15_02"); //Nie wiem.
    AI_Output (self, other ,"DIA_Lee_ZAplecami_03_03"); //Dobrze wiesz o czym m�wi�!
    AI_Output (self, other ,"DIA_Lee_ZAplecami_03_04"); //Razem z Saturasem poprosili�cie o pomoc Quentina!
    AI_Output (self, other ,"DIA_Lee_ZAplecami_03_05"); //Saturas nie zajmie si� Woln� Kopalni�, tylko bez negocjacji ze mn� prowadzi dyskusje z Bandytami!
    AI_Output (other, self ,"DIA_Lee_ZAplecami_15_06"); //Zauwa�, �e dobrze to zaplanowa�.
    AI_Output (other, self ,"DIA_Lee_ZAplecami_15_07"); //Nasi ludzie musz� zosta� w Obozie p�ki Gomez si� nie uspokoi.
    AI_Output (other, self ,"DIA_Lee_ZAplecami_15_08"); //W ka�dej chwili mo�emy si� spodziewa� ataku.
    AI_Output (self, other ,"DIA_Lee_ZAplecami_03_09"); //Mo�e masz racj�.
    AI_Output (other, self ,"DIA_Lee_ZAplecami_15_10"); //Pewnie, �e mam. Tylko ty musisz si� uspokoi� i zastanowi� nad tym co robisz.
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
    if (MIS_PomocTorlofowi == LOG_SUCCESS)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Lee_KOPALNIA_QUENTINA_Info()
{
    AI_Output (self, other ,"DIA_Lee_KOPALNIA_QUENTINA_03_01"); //Dobrze, �e jeste�. Potrzeba nam kogo� do pomocy.
    AI_Output (other, self ,"DIA_Lee_KOPALNIA_QUENTINA_15_02"); //W czym problem?
    AI_Output (self, other ,"DIA_Lee_KOPALNIA_QUENTINA_03_03"); //Ostatnio z wie�ciami przyby� pos�aniec z Obozu Bandyt�w. 
    AI_Output (self, other ,"DIA_Lee_KOPALNIA_QUENTINA_03_04"); //Pono� Gomez wys�a� grup� ludzi do Opuszczonej Kopalni. Quentin chce udaremni� jego plan wznowienia wydobycia. 
    AI_Output (self, other ,"DIA_Lee_KOPALNIA_QUENTINA_03_05"); //Jest jeden haczyk, kopalnia nie zosta�a opuszczona bez powodu. Roi si� w niej od przer�nego plugastwa. 
    AI_Output (self, other ,"DIA_Lee_KOPALNIA_QUENTINA_03_06"); //Mo�liwe, �e jak pozb�dziecie si� Stra�nik�w, to b�dzie was czeka�a walka z nieumar�ymi albo innym �cierwem.
    AI_Output (other, self ,"DIA_Lee_KOPALNIA_QUENTINA_15_07"); //Postaram si� prze�y�, jednak w pojedynk� nie b�dzie �atwo...
    AI_Output (self, other ,"DIA_Lee_KOPALNIA_QUENTINA_03_08"); //Wys�a�em ju� Najemnik�w, kt�rzy ci pomog�. Powiniene� ich spotka� przy wej�ciu do kopalni. Id� ju�! Nie ma czasu do stracenia...
	
	//zadanie - oficjalne zadanie [odwiedzenie kopalni] dla wszystkich gildii innych ni� bandyta 
    MIS_PomocQuentinowi = LOG_RUNNING;
	Log_CreateTopic          (CH1_PomocQuentinowi, LOG_MISSION);
    Log_SetTopicStatus       (CH1_PomocQuentinowi, LOG_RUNNING);
    B_LogEntry               (CH1_PomocQuentinowi,"Lee chce pom�c Quentinowi pozby� si� Stra�nik�w z Opuszczonej Kopalni. Gomez postanowi� wznowi� tam wydobycie. Przyw�dca Najemnik�w twierdzi, �e Stra�nicy nie s� najwi�kszym zagro�eniem jakie czyha pod ziemi�. C�, wkr�tce przekonam si� o tym na w�asnej sk�rze. Mam si� przegrupowa� z lud�mi przydzielonymi przez Lee przy wej�ciu do kopalni.");
	
	//rutyny: Cord [kluczowy npc], Jarvis, Rocky
	B_Story_AbMine_Soldiers ();
    
	//kluczowe! rutyna: Corristo, dialog, otwarcie bramy do kopalni
	B_Story_FocusCorristoQuest ();
	
	//koniec
    AI_StopProcessInfos	(self);
	
	//zadanie - wpis dla cz�onk�w bractwa
	if MIS_Bractwo_Kopalnia == log_running
	{
	B_LogEntry                     (CH1_Bractwo_Kopalnia,"Po rozmowie z Lee okaza�o si�, �e Nowy Ob�z chce pom�c Bandytom odbi� Opuszczon� Kopalni�. Mam si� tam uda� i odszuka� zaprzyja�nionych Najemnik�w. Lee przestrzeg� mnie, �e Kopalnia jest przekl�ta od lat. Szykuje si� nie lada wyzwanie. ");
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
   description	= "Pozby�em si� Stra�nik�w i o�ywie�c�w z kopalni.";
};

FUNC INT DIA_Lee_CZYSTKA_W_KOPALNI_Condition()
{
    if (MIS_PomocQuentinowi == LOG_SUCCESS)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Lee_CZYSTKA_W_KOPALNI_Info()
{
    AI_Output (other, self ,"DIA_Lee_CZYSTKA_W_KOPALNI_15_01"); //Pozby�em si� Stra�nik�w i o�ywie�c�w z kopalni.
    AI_Output (self, other ,"DIA_Lee_CZYSTKA_W_KOPALNI_03_02"); //Czyli naprawd� byli tam o�ywie�cy. Masz szcz�cie, �e jeszcze �yjesz.
    AI_Output (self, other ,"DIA_Lee_CZYSTKA_W_KOPALNI_03_03"); //Nie mniej jednak dobrze si� spisa�e�. 
    AI_Output (other, self ,"DIA_Lee_CZYSTKA_W_KOPALNI_15_04"); //Cord kaza� ci zaproponowa�, �eby�my wznowili wydobycie w kopalni. Z�o�a s� jeszcze dosy� spore. 
    AI_Output (other, self ,"DIA_Lee_CZYSTKA_W_KOPALNI_15_05"); //Z pewno�ci� spodoba si� to Magom Wody.
    AI_Output (self, other ,"DIA_Lee_CZYSTKA_W_KOPALNI_03_06"); //Hmmm... Fakt. Kopalnia mo�e nam przynie�� znaczne korzy�ci. Jednak transport rudy do Obozu by�by nie lada wyzwaniem.
    AI_Output (self, other ,"DIA_Lee_CZYSTKA_W_KOPALNI_03_07"); //Wsz�dzie kr�c� si� Stra�nicy.
    AI_Output (other, self ,"DIA_Lee_CZYSTKA_W_KOPALNI_15_08"); //Chyba jednak warto zaryzykowa�. 
    AI_Output (self, other ,"DIA_Lee_CZYSTKA_W_KOPALNI_03_09"); //Masz racj�, ale jest jeden problem. Do kopania rudy potrzebni s� robotnicy. Nie mam do�� ludzi, aby wys�a� ich do pracy.
    AI_Output (self, other ,"DIA_Lee_CZYSTKA_W_KOPALNI_03_10"); //Id� do Laresa i spytaj czy wys�a�by kilku Szkodnik�w do kopalni.
    B_LogEntry                     (CH1_NC_Mine,"Mam i�� do Laresa i poprosi� go o wys�anie kilku Szkodnik�w do pracy w kopalni. ");

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
   description	= "Lares nie ma wystarczaj�cej ilo�ci ludzi.";
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
    AI_Output (other, self ,"DIA_Lee_BRAK_LUDZI_15_01"); //Lares nie ma wystarczaj�cej ilo�ci ludzi.
    AI_Output (self, other ,"DIA_Lee_BRAK_LUDZI_03_02"); //Wiedzia�em! No to mamy niez�y problem. Je�eli nie wy�lemy kogo� do kopalni, to Gomez pewnie znowu j� zajmie.
    AI_Output (other, self ,"DIA_Lee_BRAK_LUDZI_15_03"); //Lares kaza� ci prosi� o pomoc Bandyt�w. 
    AI_Output (self, other ,"DIA_Lee_BRAK_LUDZI_03_04"); //Racja. Mo�e oni wy�l� cz�� swoich ludzi do kopalni. 
    AI_Output (self, other ,"DIA_Lee_BRAK_LUDZI_03_05"); //Id� do Quentina i si� z nim dogadaj. Zaproponuj mu czwart� cz�� wydobytego urobku jako zap�at�.
    AI_Output (other, self ,"DIA_Lee_BRAK_LUDZI_15_06"); //Ju� tam id�.
    B_LogEntry                     (CH1_NC_Mine,"Trzeba dogada� si� z Quentinem. Mam zaproponowa� przyw�dcy Bandyt�w czwart� cz�� urobku z kopalni w zamian za pomoc. ");

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
   description	= "Dogada�em si� z Quentinem.";
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
    AI_Output (other, self ,"DIA_lee_PertractacjieDD_15_01"); //Dogada�em si� z Quentinem.
    AI_Output (other, self ,"DIA_lee_PertractacjieDD_15_02"); //Nie by� zbyt zadowolony, ale si� zgodzi�.
    AI_Output (self, other ,"DIA_lee_PertractacjieDD_03_03"); //�wietnie. 
    AI_Output (self, other ,"DIA_lee_PertractacjieDD_03_04"); //Oto twoja zap�ata.
    CreateInvItems (self, ItMiNugget, 200);
    B_GiveInvItems (self, other, ItMiNugget, 200);
    B_LogEntry                     (CH1_NC_Mine,"Nowy Ob�z dogada� si� z Quentinem. Mamy zapewnione nowe �r�d�o rudy ma�ym kosztem.");
    Log_SetTopicStatus       (CH1_NC_Mine, LOG_SUCCESS);
    MIS_NC_Mine = LOG_SUCCESS;
	if MIS_Bractwo_Kopalnia == log_running
	{
	Log_SetTopicStatus       (CH1_Bractwo_Kopalnia, LOG_SUCCESS);
    MIS_Bractwo_Kopalnia = LOG_SUCCESS;
	B_LogEntry                     (CH1_Bractwo_Kopalnia,"Najemnicy zyskali dost�p do Opuszczonej Kopalni, a Gomez zosta� os�abiony. Tymczasowo uspokoi�em sytuacj�, ale wci�� musz� by� czujny. Wypada�oby w mi�dzyczasie zanie�� raport Cor Angarowi. Z pewno�ci� mnie jako� wynagrodzi.");
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
   description	= "Saturas zleci� mi odszukanie Xardasa. Co wiesz na jego temat?";
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
    AI_Output (other, self ,"DIA_Lee_XARDASGOLEMS_15_01"); //Saturas zleci� mi odszukanie Xardasa. Co wiesz na jego temat?
    AI_Output (self, other ,"DIA_Lee_XARDASGOLEMS_03_02"); //Jaki� czas temu wys�a�em oddzia� Najemnik�w na polecenie Saturasa, aby odszukali tego Nekromant�, niestety nigdy nie wr�cili. 
	AI_Output (self, other ,"DIA_Lee_XARDASGOLEMS_03_03"); //Postanowi�em wi�c wys�a� Torlofa wraz z ma�ym oddzia�em, �eby sprawdzi�, co ich spotka�o.
    AI_Output (self, other ,"DIA_Lee_XARDASGOLEMS_03_04"); //Kilka dni p�niej, gdy Torlof wr�ci�, opowiedzia� mi o trzech golemach. Widzia� je tylko z daleka, cho� nietrudno si� domy�li� jaki los spotka� moich ludzi. 
	AI_Output (self, other ,"DIA_Lee_XARDASGOLEMS_03_05"); //Dost�pu do wie�y broni� kamienny golem, ognisty oraz lodowy. Nie radz� ci si� tam wybiera�, zrobi� z ciebie sieczk�.
    AI_Output (other, self ,"DIA_Lee_XARDASGOLEMS_15_06"); //Skoro zdoby�em kamienie ogniskuj�ce zabijaj�c po drodze trolle, harpie i inne plugastwo, to z tymi magicznymi pos�gami poradz� sobie bez problemu.
    AI_Output (self, other ,"DIA_Lee_XARDASGOLEMS_03_07"); //Mam nadzieje. Dam ci jeszcze jedn� rad�, uwa�aj na Xardasa. Jest niezwykle przebieg�y i pot�ny. 
	AI_Output (self, other ,"DIA_Lee_XARDASGOLEMS_03_08"); //Pami�tam jak spotka�em go na dworze Rhobara, gdy zosta� wyznaczony do przewodzenia magami, kt�rzy mieli stworzy� Barier�.
    AI_Output (self, other ,"DIA_Lee_XARDASGOLEMS_03_09"); //Wydawa� si� by� niezwykle wierny Innosowi. P�niej okaza�o si�, �e bardziej ci�gnie go do magii demon�w. Nigdy bym si� tego nie domy�li�.
    AI_Output (other, self ,"DIA_Lee_XARDASGOLEMS_15_10"); //Dzi�ki za rad�. 
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
   description	= "Spotka�em Xardasa.";
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
    AI_Output (other, self ,"DIA_Lee_DANGERORE_15_01"); //Spotka�em Xardasa. Powiedzia� mi, �e pomys� Mag�w Wody z kopcem rudy jest bezcelowy. Jednak jest inny spos�b na zniszczenie Bariery. Nie bardzo wiem, jak powiedzie� o tym Saturasowi.
    AI_Output (self, other ,"DIA_Lee_DANGERORE_03_02"); //Lepiej mu o tym nie m�w. Saturas to bardzo wybuchowy cz�owiek. 
	AI_Output (self, other ,"DIA_Lee_DANGERORE_03_03"); //Ja sam dochowam tajemnicy, cho� jestem szczerze zdziwiony. Przez te wszystkie lata pod��a�em �lepo za Magami Wody g��boko wierz�c w ich plan.
	AI_Output (self, other ,"DIA_Lee_DANGERORE_03_04"); //Przez ca�y czas wierzy�em, �e ich pomys� odno�nie Bariery wypali.
    AI_Output (self, other ,"DIA_Lee_DANGERORE_03_05"); //Da�em im s�owo, �e dop�ki Bariera istnieje, b�d� im s�u�y� i tak w�a�nie zamierzam uczyni�. 
	AI_Output (self, other ,"DIA_Lee_DANGERORE_03_06"); //S�u�ba jako genera� Kr�la Rhobara nauczy�a mnie honoru. Sta�e� si� niezwykle pot�ny, nie ka�dy cz�owiek zdo�a�by przedrze� si� do Xardasa i zrobi� na nim wra�enie, tak jak tobie si� uda�o.
    AI_Output (self, other ,"DIA_Lee_DANGERORE_03_07"); //Powodzenia, przyjacielu! Mam nadziej�, �e ju� wkr�tce si� zobaczymy.
};

//#####################################################################################
//####### ROZDZIA� 5
//####### ZAST�PSTWO DLA GORNA
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
   description	= "Przysy�a mnie Gorn. Mam ci pom�c w organizacji obrony.";
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
    AI_Output (other, self ,"DIA_Lee_OBRONA_WK_15_01"); //Przysy�a mnie Gorn. Mam ci pom�c w organizacji obrony.
    AI_Output (self, other ,"DIA_Lee_OBRONA_WK_03_02"); //Ach tak! Dobrze, �e przyszed�e�.
    AI_Output (self, other ,"DIA_Lee_OBRONA_WK_03_03"); //Ju� ustali�em kt�rzy z moich ludzi zajm� si� kopalni�.
    AI_Output (self, other ,"DIA_Lee_OBRONA_WK_03_04"); //Niestety, zagro�enie ze strony Gomeza jeszcze nie min�o i nie mia�em kogo wys�a� do wybranych Najemnik�w.
    AI_Output (other, self ,"DIA_Lee_OBRONA_WK_15_05"); //Ja mog� im to przekaza�.
    AI_Output (self, other ,"DIA_Lee_OBRONA_WK_03_06"); //W porz�dku. Id� zatem do Corda i Outlama. 
    AI_Output (self, other ,"DIA_Lee_OBRONA_WK_03_07"); //Przeka� im, �e kopalnie powierzam prowizorycznej stra�y i my�liwym-najemnikom.
    AI_Output (other, self ,"DIA_Lee_OBRONA_WK_15_08"); //Nie ma sprawy.
    B_LogEntry                     (CH5_ObronaWk,"Lee wyznaczy� do obrony kopalni ludzi Corda i Outlama. Mam im to przekaza�.");

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
   description	= "Zorganizowa�em obron�.";
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
    AI_Output (other, self ,"DIA_Lee_OBRONA_ENDQUEST_15_01"); //Zorganizowa�em obron�.
    AI_Output (self, other ,"DIA_Lee_OBRONA_ENDQUEST_03_02"); //Dobra robota! Teraz Stra�nicy mog� nam naskoczy�.
    AI_Output (self, other ,"DIA_Lee_OBRONA_ENDQUEST_03_03"); //Przeka� Gornowi, �e jest wolny.
    B_LogEntry                     (CH5_ObronaWK,"Najemnicy zajm� si� Woln� Kopalni�, a Gorn mo�e w ko�cu uda� si� na spotkanie.");
    Log_SetTopicStatus       (CH5_ObronaWK, LOG_SUCCESS);
    MIS_ObronaWK = LOG_SUCCESS;

    B_GiveXP (400);
    AI_StopProcessInfos	(self);
};


