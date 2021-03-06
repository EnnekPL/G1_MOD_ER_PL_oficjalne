// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE Info_Swiney_EXIT(C_INFO)
{
	npc			= SfB_1037_Swiney ;
	nr			= 999;
	condition	= Info_Swiney_EXIT_Condition;
	information	= Info_Swiney_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT Info_Swiney_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Swiney_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 						Hallo
// ************************************************************

INSTANCE Info_Swiney_Hello(C_INFO)
{
	npc			= SfB_1037_Swiney;
	nr			= 1;
	condition	= Info_Swiney_Hello_Condition;
	information	= Info_Swiney_Hello_Info;
	permanent	= 0;
	description = "Kim jeste�?";
};                       

FUNC INT Info_Swiney_Hello_Condition()
{
	return 1;
};

FUNC VOID Info_Swiney_Hello_Info()
{	
	AI_Output (other, self,"Info_Swiney_Hello_15_00"); //Kim jeste�?
	AI_Output (self, other,"Info_Swiney_Hello_09_01"); //Jestem najlepszym in�ynierem, jakiego ta przekl�ta Kolonia kiedykolwiek widzia�a, ch�opcze.
	AI_Output (self, other,"Info_Swiney_Hello_09_02"); //Pilnuj�, �eby nasi ch�opcy nie �ci�gn�li sobie na g�owy sterty kamieni kopi�c w niew�a�ciwym miejscu.
};

// ************************************************************
// 						Sch�rfer
// ************************************************************

INSTANCE Info_Swiney_Schuerfer(C_INFO)
{
	npc			= SfB_1037_Swiney;
	nr			= 1;
	condition	= Info_Swiney_Schuerfer_Condition;
	information	= Info_Swiney_Schuerfer_Info;
	permanent	= 1;
	description = "Chcia�bym do was do��czy�, jako Kret.";
};                       

FUNC INT Info_Swiney_Schuerfer_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Swiney_Hello)) && (Npc_GetTrueGuild(other) == GIL_NONE)
	{
		return 1;
	};
};

FUNC VOID Info_Swiney_Schuerfer_Info()
{	
	AI_Output (other, self,"Info_Swiney_Schuerfer_15_00"); //Chcia�bym do was do��czy�, jako Kret.
	AI_Output (self, other,"Info_Swiney_Schuerfer_09_01"); //Czy�by? Tylko nie oczekuj zbyt wiele po tej robocie. Trzy porcje ry�u na dzie�. Reszt� musisz sobie sam za�atwi�.
	AI_Output (self, other,"Info_Swiney_Schuerfer_09_02"); //Wiesz dlaczego odwalamy ca�� t� brudn� robot�? �eby pewnego dnia m�c wyj�� na wolno�� z tego przekl�tego wi�zienia.
	AI_Output (self, other,"Info_Swiney_Schuerfer_09_03"); //Ca�y nasz urobek jest sk�adowany na wielkim kopcu. Raz w miesi�cu ka�dy z nas dostaje 50 bry�ek, �eby m�c si� porz�dnie upi�.
	AI_Output (self, other,"Info_Swiney_Schuerfer_09_04"); //To najwa�niejsze rzeczy, kt�re powiniene� wiedzie�.
	AI_Output (self, other,"Info_Swiney_Schuerfer_09_05"); //Masz chocia� jakie� do�wiadczenie w tej robocie?
	
	Info_ClearChoices(Info_Swiney_Schuerfer);
	Info_AddChoice   (Info_Swiney_Schuerfer, "Nie."	,Info_Swiney_Schuerfer_Nein);
	Info_AddChoice	 (Info_Swiney_Schuerfer, "Tak."  ,Info_Swiney_Schuerfer_Ja);
	Info_AddChoice	 (Info_Swiney_Schuerfer, "Na razie nie chc� by� Kretem."  ,Info_Swiney_Schuerfer_Back);
};

func void Info_Swiney_Schuerfer_Back ()
{
	AI_Output (other, self,"Info_Swiney_Schuerfer_Back_15_00"); //Na razie nie chc� by� Kretem.
	AI_Output (self, other,"Info_Swiney_Schuerfer_Back_09_01"); //Wr��, gdy si� namy�lisz.
	Info_ClearChoices(Info_Swiney_Schuerfer);
	Info_Swiney_Schuerfer.permanent = 1;
};

func void Info_Swiney_Schuerfer_Ja()
{
	AI_Output (other, self,"Info_Swiney_Schuerfer_Ja_15_00"); //Tak.
	AI_Output (self, other,"Info_Swiney_Schuerfer_Ja_09_01"); //To �wietnie! Zatem wiesz, na co nale�y uwa�a�. Masz tu sw�j str�j roboczy. Kilof musisz znale�� sobie sam. Mi�ej zabawy.
	CreateInvItem		(self, ItAmArrow);
	B_GiveInvItems      (self, hero, ItAmArrow, 1);
	Npc_RemoveInvItem	(hero, ItAmArrow);
	
	CreateInvItem		(hero,SFB_ARMOR_L);
	AI_EquipBestArmor	(other); 
	hero.guild = GIL_SfB;
	Npc_SetTrueGuild (hero,GIL_SfB);
	HeroJoinToNC ();
	MIS_AwansJakoKret = LOG_RUNNING;
 	Log_CreateTopic          (CH1_AwansJakoKret, LOG_MISSION);
   	Log_SetTopicStatus       (CH1_AwansJakoKret, LOG_RUNNING);
  	B_LogEntry               (CH1_AwansJakoKret,"I to mi si� podoba! Zosta�em Kretem bez �adnych g�upich zada�. Jednak by zosta� Szkodnikiem, b�d� musia� zrobi� co� ambitniejszego ni� kopanie rudy.");
	B_giveXP (XP_BecomeSfb);
	Info_ClearChoices(Info_Swiney_Schuerfer);
	Info_Swiney_Schuerfer.permanent = 0;
};

func void Info_Swiney_Schuerfer_Nein()
{
	AI_Output (other, self,"Info_Swiney_Schuerfer_Nein_15_00"); //Nie.
	AI_Output (self, other,"Info_Swiney_Schuerfer_Nein_09_01"); //No jasne! Dlaczego to zawsze ja musz� was u�wiadamia�. S�uchaj uwa�nie: we� te ciuchy i za�� je na siebie - tutaj.
	AI_Output (self, other,"Info_Swiney_Schuerfer_Nein_09_02"); //Gdyby kawa�ek rudy spad� ci na bos� stop�, zosta�by� kalek� do ko�ca �ycia. Oczywi�cie wtedy by�by� dla nas znacznie mniej przydatny.
	AI_Output (self, other,"Info_Swiney_Schuerfer_Nein_09_03"); //Gdzie� w pobli�u powinien le�e� jaki� kilof.
	AI_Output (self, other,"Info_Swiney_Schuerfer_Nein_09_04"); //Oczywi�cie wiele z nim nie zdzia�asz... M�wi si� trudno...
	hero.guild = GIL_SfB;
	CreateInvItem		(self, ItAmArrow);
	B_GiveInvItems      (self, hero, ItAmArrow, 1);
	Npc_RemoveInvItem	(hero, ItAmArrow);
	
	CreateInvItem		(hero,SFB_ARMOR_L);
	AI_EquipBestArmor	(other); 
	Npc_SetTrueGuild (hero,GIL_SfB);
	HeroJoinToNC ();
	MIS_AwansJakoKret = LOG_RUNNING;
 	Log_CreateTopic          (CH1_AwansJakoKret, LOG_MISSION);
   	Log_SetTopicStatus       (CH1_AwansJakoKret, LOG_RUNNING);
  	B_LogEntry               (CH1_AwansJakoKret,"I to mi si� podoba! Zosta�em Kretem bez �adnych g�upich zada�. Jednak by zosta� Szkodnikiem, b�d� musia� zrobi� co� ambitniejszego ni� kopanie rudy. ");
	B_giveXP (XP_BecomeSfb);
	Info_ClearChoices(Info_Swiney_Schuerfer);
	Info_Swiney_Schuerfer.permanent = 0;
};

// ************************************************************
// 							PERM
// ************************************************************

INSTANCE Info_Swiney_PERM(C_INFO)
{
	npc			= SfB_1037_Swiney;
	nr			= 1;
	condition	= Info_Swiney_PERM_Condition;
	information	= Info_Swiney_PERM_Info;
	permanent	= 1;
	description = "Jak du�o rudy uda�o si� wam uzbiera� do tej pory?";
};                       

FUNC INT Info_Swiney_PERM_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Swiney_Hello)) 
	{
		return 1;
	};
};

FUNC VOID Info_Swiney_PERM_Info()
{	
	AI_Output (other, self,"Info_Swiney_PERM_15_00"); //Jak du�o rudy uda�o si� wam uzbiera� do tej pory?
	AI_Output (self, other,"Info_Swiney_PERM_09_01"); //Magowie m�wi�, �e mamy ju� niemal ca�� potrzebn� ilo��. Kiedy b�dziesz w Nowym Obozie rzu� okiem na kopiec.
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 							TRADE
// ************************************************************

INSTANCE Info_Swiney_TRADE(C_INFO)
{
	npc			= SfB_1037_Swiney;
	nr			= 1;
	condition	= Info_Swiney_TRADE_Condition;
	information	= Info_Swiney_TRADE_Info;
	permanent	= 0;
	description = "Gdzie mog� tu co� kupi�?";
};                       

FUNC INT Info_Swiney_TRADE_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Swiney_Hello)) 
	{
		return 1;
	};
};

FUNC VOID Info_Swiney_TRADE_Info()
{	
	AI_Output (other, self,"Info_Swiney_TRADE_15_00"); //Gdzie mog� tu co� kupi�?
	AI_Output (self, other,"Info_Swiney_TRADE_09_01"); //Pogadaj z Okylem. On zarz�dza nie tylko prac�, ale tak�e dostawami.
};

instance  Swiney_START_LEARN (C_INFO)
{
	npc					= SfB_1037_Swiney;
	condition			= Swiney_START_LEARN_Condition;
	information		= Swiney_START_LEARN_Info;
	important			= 0;
	permanent		= 1;
	nr 					= 800;
	description		= "Naucz mnie kopa� rud� (5 punkt�w nauki)."; 
};

FUNC int  Swiney_START_LEARN_Condition()
{	
		if (Npc_GetTalentSkill(hero, NPC_TALENT_REGENERATE) == 0) && (Npc_KnowsInfo(hero,Info_Swiney_Hello))
		{
		return 1;
		};
};

FUNC void  Swiney_START_LEARN_Info()
{
	AI_Output (other, self,"Swiney_START_LEARN_Info_15_01"); //Naucz mnie kopa� rud�.
	if ((hero.lp >=5))
	{
	if (Npc_GetTrueGuild(other) == GIL_SFB)
	{
	AI_Output (self, other,"Swiney_START_LEARN_Info_04_02"); //Pocz�tki nie s� zbyt trudne. Musisz umie� odpowiednio uderzy�. 
	AI_Output (self, other,"Swiney_START_LEARN_Info_04_03"); //Najwa�niejsza jest rozwaga. WIelu g�rnik�w zgin�o przyci�ni�tych przez ska�y, bo uderzali zbyt mocno.
	AI_Output (self, other,"Swiney_START_LEARN_Info_04_04"); //Z kolei inni kopali dniami i nocami bez rezultatu, bo uderzali zbyt s�abo lub kopali w nieodpowiednim miejscu.
	AI_Output (self, other,"Swiney_START_LEARN_Info_04_05"); //Uderzaj kilka razy lekko, aby zbada� ska�� i nieco j� rozbi�. Potem uderz silnie lub nawet bardzo silnie.
	AI_Output (self, other,"Swiney_START_LEARN_Info_04_06"); //Je�eli b�dziesz mia� troch� szcz�cia szybko wydob�dziesz bry�ki.
	AI_Output (self, other,"Swiney_START_LEARN_Info_04_07"); //Jeszcze jedno, pami�taj, �e ka�da �y�a rudy kiedy� si� sko�czy.
	hero.lp = hero.lp - 5;
	Npc_SetTalentSkill(hero, NPC_TALENT_REGENERATE, 1);
	//PrintScreen	("", -1,-1,"FONT_OLD_20_WHITE.tga",2);
	PrintS_Ext ("Nowa umiej�tno��: G�rnictwo",COL_Lime);
	}
	else
	{
	if (Npc_HasItems (hero, ItMiNugget)>=50)
	{
	AI_Output (self, other,"Swiney_START_LEARN_Info_04_02"); //Pocz�tki nie s� zbyt trudne. Musisz umie� odpowiednio uderzy�. 
	AI_Output (self, other,"Swiney_START_LEARN_Info_04_03"); //Najwa�niejsza jest rozwaga. WIelu g�rnik�w zgin�o przyci�ni�tych przez ska�y, bo uderzali zbyt mocno.
	AI_Output (self, other,"Swiney_START_LEARN_Info_04_04"); //Z kolei inni kopali dniami i nocami bez rezultatu, bo uderzali zbyt s�abo lub kopali w nieodpowiednim miejscu.
	AI_Output (self, other,"Swiney_START_LEARN_Info_04_05"); //Uderzaj kilka razy lekko, aby zbada� ska�� i nieco j� rozbi�. Potem uderz silnie lub nawet bardzo silnie.
	AI_Output (self, other,"Swiney_START_LEARN_Info_04_06"); //Je�eli b�dziesz mia� troch� szcz�cia szybko wydob�dziesz bry�ki.
	AI_Output (self, other,"Swiney_START_LEARN_Info_04_07"); //Jeszcze jedno, pami�taj, �e ka�da �y�a rudy kiedy� si� sko�czy.
	B_GiveInvItems (other,self, itminugget, 50);
	hero.lp = hero.lp - 5;
	Npc_SetTalentSkill(hero, NPC_TALENT_REGENERATE, 1);
	PrintS_Ext ("Nowa umiej�tno��: G�rnictwo",COL_Lime);
	}
	else
	{
	AI_Output (self, other,"Swiney_START_LEARN_Info_04_08"); //Nauka kosztuje 50 bry�ek!
	};
	};
	}
	else
	{
	AI_Output (self, other,"Swiney_START_LEARN_Info_04_09"); //Brakuje ci do�wiadczenia!
	};
};


// ************************************************************
// 							CAVALORN_TEST
// ************************************************************

INSTANCE Info_Swiney_CAVALORN_TEST(C_INFO)
{
	npc			= SfB_1037_Swiney;
	nr			= 1;
	condition	= Info_Swiney_CAVALORN_TEST_Condition;
	information	= Info_Swiney_CAVALORN_TEST_Info;
	permanent	= 0;
	description = "Co mo�esz mi powiedzie� o transporcie rudy?";
};                       

FUNC INT Info_Swiney_CAVALORN_TEST_Condition()
{
	if (wiecejOre == true) && (Npc_KnowsInfo (hero, DIA_Aidan_BROWAE))
    && (MIS_TestOc == LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID Info_Swiney_CAVALORN_TEST_Info()
{	
	AI_Output (other, self,"Info_Swiney_CAVALORN_TEST_15_00"); //Co mo�esz mi powiedzie� o transporcie rudy?
	AI_Output (self, other,"Info_Swiney_CAVALORN_TEST_09_01"); //Nie rozumiem, czemu mia�oby ci� to interesowa�.
	AI_Output (self, other,"Info_Swiney_CAVALORN_TEST_09_02"); //Przecie� nie nale�ysz do Nowego Obozu.
	Info_ClearChoices(Info_Swiney_CAVALORN_TEST);
	Info_AddChoice   (Info_Swiney_CAVALORN_TEST, "Chc� do��czy� do Nowego Obozu, wi�c potrzebuj� dowiedzie� si� jak najwi�cej."	,Info_Swiney_CAVALORN_TEST_TRUE);
	Info_AddChoice	 (Info_Swiney_CAVALORN_TEST, "Jestem po prostu ciekawy." ,Info_Swiney_CAVALORN_TEST_FALSE);
};

func void Info_Swiney_CAVALORN_TEST_TRUE ()
{
	AI_Output (other, self,"Info_Swiney_CAVALORN_TEST_TRUE_15_00"); //Chc� do��czy� do Nowego Obozu, wi�c potrzebuj� dowiedzie� si� jak najwi�cej.
	AI_Output (self, other,"Info_Swiney_CAVALORN_TEST_TRUE_09_01"); //Ach tak... Lares sobie upatrzy� jakiego� ��todzioba?
	AI_Output (other, self,"Info_Swiney_CAVALORN_TEST_TRUE_15_02"); //Tak, pracuj� dla Laresa.
	AI_Output (self, other,"Info_Swiney_CAVALORN_TEST_TRUE_09_03"); //W takim razie dobrze, powiem ci jak to wygl�da.
	AI_Output (self, other,"Info_Swiney_CAVALORN_TEST_TRUE_09_04"); //O czym ty... Ach tak, transport.
	AI_Output (self, other,"Info_Swiney_CAVALORN_TEST_TRUE_09_05"); //Ostatnio uda�o nam si� wydoby� 30 skrzy� rudy.
	AI_Output (self, other,"Info_Swiney_CAVALORN_TEST_TRUE_09_06"); //Jest to rekord w historii Wolnej Kopalni, wcze�niej wydobyli�my mniej.
	AI_Output (self, other,"Info_Swiney_CAVALORN_TEST_TRUE_09_07"); //Wygl�da na to, �e wielu Kret�w wzi�o sobie do serca zapewnienia mag�w o odzyskaniu wolno�ci.
	AI_Output (self, other,"Info_Swiney_CAVALORN_TEST_TRUE_09_08"); //A wracaj�c do tematu: nied�ugo organizujemy transport rudy.
	AI_Output (self, other,"Info_Swiney_CAVALORN_TEST_TRUE_09_09"); //Dopiero zacz��em opracowywa� plan, wi�c za wiele ci nie powiem.
	AI_Output (self, other,"Info_Swiney_CAVALORN_TEST_TRUE_09_10"); //My�l�, �e najlepsz� por� b�dzie noc. Przynajmniej zmniejszy to ryzyko, �e zostaniemy okradzeni.
	AI_Output (other, self,"Info_Swiney_CAVALORN_TEST_TRUE_15_11"); //Dzi�ki za informacje.
	knowsOre2 = true;
	B_LogEntry                     (CH1_TestOC,"Od Swineya dowiedzia�em si�, �e Krety w Wolnej Kopalni wydoby�y 30 skrzy� rudy. Swiney dopiero obmy�la plan transportu, ale jest pewien, �e odb�dzie si� on w nocy.");
	Info_ClearChoices(Info_Swiney_CAVALORN_TEST);
};

func void Info_Swiney_CAVALORN_TEST_FALSE ()
{
	AI_Output (other, self,"Info_Swiney_CAVALORN_TEST_FALSE_15_00"); //Jestem po prostu ciekawy.
	AI_Output (self, other,"Info_Swiney_CAVALORN_TEST_FALSE_09_01"); //Ciekawy? Nie roz�mieszaj mnie, ch�opcze.
	AI_Output (self, other,"Info_Swiney_CAVALORN_TEST_FALSE_09_02"); //Pewnie Gomezowi zachcia�o si� nas szpiegowa�.
	AI_Output (self, other,"Info_Swiney_CAVALORN_TEST_FALSE_09_03"); //Nic ci nie powiem, a je�li spr�bujesz co� kombinowa�, to Okyl zrobi z tob� porz�dek.
	AI_Output (other, self,"Info_Swiney_CAVALORN_TEST_FALSE_15_04"); //Ale...
	AI_Output (self, other,"Info_Swiney_CAVALORN_TEST_FALSE_09_05"); //Spadaj st�d!
	knowsOre2 = false;
	B_LogEntry                     (CH1_TestOC,"Nawali�em... Swiney nic mi nie powie o transporcie rudy. Co nie znaczy, �e obla�em test. Warto wr�ci� do Cavalorna i sprawdzi� jak mnie oceni.");
	Info_ClearChoices(Info_Swiney_CAVALORN_TEST);
};

