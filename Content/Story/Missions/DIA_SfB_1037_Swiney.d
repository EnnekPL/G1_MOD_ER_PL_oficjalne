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
	description = "Kim jesteœ?";
};                       

FUNC INT Info_Swiney_Hello_Condition()
{
	return 1;
};

FUNC VOID Info_Swiney_Hello_Info()
{	
	AI_Output (other, self,"Info_Swiney_Hello_15_00"); //Kim jesteœ?
	AI_Output (self, other,"Info_Swiney_Hello_09_01"); //Jestem najlepszym in¿ynierem, jakiego ta przeklêta Kolonia kiedykolwiek widzia³a, ch³opcze.
	AI_Output (self, other,"Info_Swiney_Hello_09_02"); //Pilnujê, ¿eby nasi ch³opcy nie œci¹gnêli sobie na g³owy sterty kamieni kopi¹c w niew³aœciwym miejscu.
};

// ************************************************************
// 						Schürfer
// ************************************************************

INSTANCE Info_Swiney_Schuerfer(C_INFO)
{
	npc			= SfB_1037_Swiney;
	nr			= 1;
	condition	= Info_Swiney_Schuerfer_Condition;
	information	= Info_Swiney_Schuerfer_Info;
	permanent	= 1;
	description = "Chcia³bym do was do³¹czyæ, jako Kret.";
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
	AI_Output (other, self,"Info_Swiney_Schuerfer_15_00"); //Chcia³bym do was do³¹czyæ, jako Kret.
	AI_Output (self, other,"Info_Swiney_Schuerfer_09_01"); //Czy¿by? Tylko nie oczekuj zbyt wiele po tej robocie. Trzy porcje ry¿u na dzieñ. Resztê musisz sobie sam za³atwiæ.
	AI_Output (self, other,"Info_Swiney_Schuerfer_09_02"); //Wiesz dlaczego odwalamy ca³¹ tê brudn¹ robotê? ¯eby pewnego dnia móc wyjœæ na wolnoœæ z tego przeklêtego wiêzienia.
	AI_Output (self, other,"Info_Swiney_Schuerfer_09_03"); //Ca³y nasz urobek jest sk³adowany na wielkim kopcu. Raz w miesi¹cu ka¿dy z nas dostaje 50 bry³ek, ¿eby móc siê porz¹dnie upiæ.
	AI_Output (self, other,"Info_Swiney_Schuerfer_09_04"); //To najwa¿niejsze rzeczy, które powinieneœ wiedzieæ.
	AI_Output (self, other,"Info_Swiney_Schuerfer_09_05"); //Masz chocia¿ jakieœ doœwiadczenie w tej robocie?
	
	Info_ClearChoices(Info_Swiney_Schuerfer);
	Info_AddChoice   (Info_Swiney_Schuerfer, "Nie."	,Info_Swiney_Schuerfer_Nein);
	Info_AddChoice	 (Info_Swiney_Schuerfer, "Tak."  ,Info_Swiney_Schuerfer_Ja);
	Info_AddChoice	 (Info_Swiney_Schuerfer, "Na razie nie chcê byæ Kretem."  ,Info_Swiney_Schuerfer_Back);
};

func void Info_Swiney_Schuerfer_Back ()
{
	AI_Output (other, self,"Info_Swiney_Schuerfer_Back_15_00"); //Na razie nie chcê byæ Kretem.
	AI_Output (self, other,"Info_Swiney_Schuerfer_Back_09_01"); //Wróæ, gdy siê namyœlisz.
	Info_ClearChoices(Info_Swiney_Schuerfer);
	Info_Swiney_Schuerfer.permanent = 1;
};

func void Info_Swiney_Schuerfer_Ja()
{
	AI_Output (other, self,"Info_Swiney_Schuerfer_Ja_15_00"); //Tak.
	AI_Output (self, other,"Info_Swiney_Schuerfer_Ja_09_01"); //To œwietnie! Zatem wiesz, na co nale¿y uwa¿aæ. Masz tu swój strój roboczy. Kilof musisz znaleŸæ sobie sam. Mi³ej zabawy.
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
  	B_LogEntry               (CH1_AwansJakoKret,"I to mi siê podoba! Zosta³em Kretem bez ¿adnych g³upich zadañ. Jednak by zostaæ Szkodnikiem, bêdê musia³ zrobiæ coœ ambitniejszego ni¿ kopanie rudy.");
	B_giveXP (XP_BecomeSfb);
	Info_ClearChoices(Info_Swiney_Schuerfer);
	Info_Swiney_Schuerfer.permanent = 0;
};

func void Info_Swiney_Schuerfer_Nein()
{
	AI_Output (other, self,"Info_Swiney_Schuerfer_Nein_15_00"); //Nie.
	AI_Output (self, other,"Info_Swiney_Schuerfer_Nein_09_01"); //No jasne! Dlaczego to zawsze ja muszê was uœwiadamiaæ. S³uchaj uwa¿nie: weŸ te ciuchy i za³ó¿ je na siebie - tutaj.
	AI_Output (self, other,"Info_Swiney_Schuerfer_Nein_09_02"); //Gdyby kawa³ek rudy spad³ ci na bos¹ stopê, zosta³byœ kalek¹ do koñca ¿ycia. Oczywiœcie wtedy by³byœ dla nas znacznie mniej przydatny.
	AI_Output (self, other,"Info_Swiney_Schuerfer_Nein_09_03"); //Gdzieœ w pobli¿u powinien le¿eæ jakiœ kilof.
	AI_Output (self, other,"Info_Swiney_Schuerfer_Nein_09_04"); //Oczywiœcie wiele z nim nie zdzia³asz... Mówi siê trudno...
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
  	B_LogEntry               (CH1_AwansJakoKret,"I to mi siê podoba! Zosta³em Kretem bez ¿adnych g³upich zadañ. Jednak by zostaæ Szkodnikiem, bêdê musia³ zrobiæ coœ ambitniejszego ni¿ kopanie rudy. ");
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
	description = "Jak du¿o rudy uda³o siê wam uzbieraæ do tej pory?";
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
	AI_Output (other, self,"Info_Swiney_PERM_15_00"); //Jak du¿o rudy uda³o siê wam uzbieraæ do tej pory?
	AI_Output (self, other,"Info_Swiney_PERM_09_01"); //Magowie mówi¹, ¿e mamy ju¿ niemal ca³¹ potrzebn¹ iloœæ. Kiedy bêdziesz w Nowym Obozie rzuæ okiem na kopiec.
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
	description = "Gdzie mogê tu coœ kupiæ?";
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
	AI_Output (other, self,"Info_Swiney_TRADE_15_00"); //Gdzie mogê tu coœ kupiæ?
	AI_Output (self, other,"Info_Swiney_TRADE_09_01"); //Pogadaj z Okylem. On zarz¹dza nie tylko prac¹, ale tak¿e dostawami.
};

instance  Swiney_START_LEARN (C_INFO)
{
	npc					= SfB_1037_Swiney;
	condition			= Swiney_START_LEARN_Condition;
	information		= Swiney_START_LEARN_Info;
	important			= 0;
	permanent		= 1;
	nr 					= 800;
	description		= "Naucz mnie kopaæ rudê. (5 punktów nauki, 50 bry³ek)"; 
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
	AI_Output (other, self,"Swiney_START_LEARN_Info_15_01"); //Naucz mnie kopaæ rudê.
	if ((hero.lp >=5))
	{
	if (Npc_GetTrueGuild(other) == GIL_SFB)
	{
	AI_Output (self, other,"Swiney_START_LEARN_Info_04_02"); //Pocz¹tki nie s¹ zbyt trudne. Musisz umieæ odpowiednio uderzyæ. 
	AI_Output (self, other,"Swiney_START_LEARN_Info_04_03"); //Najwa¿niejsza jest rozwaga. WIelu górników zginê³o przyciœniêtych przez ska³y, bo uderzali zbyt mocno.
	AI_Output (self, other,"Swiney_START_LEARN_Info_04_04"); //Z kolei inni kopali dniami i nocami bez rezultatu, bo uderzali zbyt s³abo lub kopali w nieodpowiednim miejscu.
	AI_Output (self, other,"Swiney_START_LEARN_Info_04_05"); //Uderzaj kilka razy lekko, aby zbadaæ ska³ê i nieco j¹ rozbiæ. Potem uderz silnie lub nawet bardzo silnie.
	AI_Output (self, other,"Swiney_START_LEARN_Info_04_06"); //Je¿eli bêdziesz mia³ trochê szczêœcia szybko wydobêdziesz bry³ki.
	AI_Output (self, other,"Swiney_START_LEARN_Info_04_07"); //Jeszcze jedno, pamiêtaj, ¿e ka¿da ¿y³a rudy kiedyœ siê skoñczy.
	hero.lp = hero.lp - 5;
	Npc_SetTalentSkill(hero, NPC_TALENT_REGENERATE, 1);
	//PrintScreen	("", -1,-1,"FONT_OLD_20_WHITE.tga",2);
	PrintS_Ext ("Nowa umiejêtnoœæ: Górnictwo",COL_Lime);
	}
	else
	{
	if (Npc_HasItems (hero, ItMiNugget)>=50)
	{
	AI_Output (self, other,"Swiney_START_LEARN_Info_04_02"); //Pocz¹tki nie s¹ zbyt trudne. Musisz umieæ odpowiednio uderzyæ. 
	AI_Output (self, other,"Swiney_START_LEARN_Info_04_03"); //Najwa¿niejsza jest rozwaga. WIelu górników zginê³o przyciœniêtych przez ska³y, bo uderzali zbyt mocno.
	AI_Output (self, other,"Swiney_START_LEARN_Info_04_04"); //Z kolei inni kopali dniami i nocami bez rezultatu, bo uderzali zbyt s³abo lub kopali w nieodpowiednim miejscu.
	AI_Output (self, other,"Swiney_START_LEARN_Info_04_05"); //Uderzaj kilka razy lekko, aby zbadaæ ska³ê i nieco j¹ rozbiæ. Potem uderz silnie lub nawet bardzo silnie.
	AI_Output (self, other,"Swiney_START_LEARN_Info_04_06"); //Je¿eli bêdziesz mia³ trochê szczêœcia szybko wydobêdziesz bry³ki.
	AI_Output (self, other,"Swiney_START_LEARN_Info_04_07"); //Jeszcze jedno, pamiêtaj, ¿e ka¿da ¿y³a rudy kiedyœ siê skoñczy.
	B_GiveInvItems (other,self, itminugget, 50);
	hero.lp = hero.lp - 5;
	Npc_SetTalentSkill(hero, NPC_TALENT_REGENERATE, 1);
	PrintS_Ext ("Nowa umiejêtnoœæ: Górnictwo",COL_Lime);
	}
	else
	{
	AI_Output (self, other,"Swiney_START_LEARN_Info_04_08"); //Nauka kosztuje 50 bry³ek!
	};
	};
	}
	else
	{
	AI_Output (self, other,"Swiney_START_LEARN_Info_04_09"); //Brakuje ci doœwiadczenia!
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
	description = "Co mo¿esz mi powiedzieæ o transporcie rudy?";
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
	AI_Output (other, self,"Info_Swiney_CAVALORN_TEST_15_00"); //Co mo¿esz mi powiedzieæ o transporcie rudy?
	AI_Output (self, other,"Info_Swiney_CAVALORN_TEST_09_01"); //Nie rozumiem, czemu mia³oby ciê to interesowaæ.
	AI_Output (self, other,"Info_Swiney_CAVALORN_TEST_09_02"); //Przecie¿ nie nale¿ysz do Nowego Obozu.
	Info_ClearChoices(Info_Swiney_CAVALORN_TEST);
	Info_AddChoice   (Info_Swiney_CAVALORN_TEST, "Chcê do³¹czyæ do Nowego Obozu, wiêc potrzebujê dowiedzieæ siê jak najwiêcej."	,Info_Swiney_CAVALORN_TEST_TRUE);
	Info_AddChoice	 (Info_Swiney_CAVALORN_TEST, "Jestem po prostu ciekawy." ,Info_Swiney_CAVALORN_TEST_FALSE);
};

func void Info_Swiney_CAVALORN_TEST_TRUE ()
{
	AI_Output (other, self,"Info_Swiney_CAVALORN_TEST_TRUE_15_00"); //Chcê do³¹czyæ do Nowego Obozu, wiêc potrzebujê dowiedzieæ siê jak najwiêcej.
	AI_Output (self, other,"Info_Swiney_CAVALORN_TEST_TRUE_09_01"); //Ach tak... Lares sobie upatrzy³ jakiegoœ ¿ó³todzioba?
	AI_Output (other, self,"Info_Swiney_CAVALORN_TEST_TRUE_15_02"); //Tak, pracujê dla Laresa.
	AI_Output (self, other,"Info_Swiney_CAVALORN_TEST_TRUE_09_03"); //W takim razie dobrze, powiem ci jak to wygl¹da.
	AI_Output (self, other,"Info_Swiney_CAVALORN_TEST_TRUE_09_04"); //O czym ty... Ach tak, transport.
	AI_Output (self, other,"Info_Swiney_CAVALORN_TEST_TRUE_09_05"); //Ostatnio uda³o nam siê wydobyæ 30 skrzyñ rudy.
	AI_Output (self, other,"Info_Swiney_CAVALORN_TEST_TRUE_09_06"); //Jest to rekord w historii Wolnej Kopalni, wczeœniej wydobyliœmy mniej.
	AI_Output (self, other,"Info_Swiney_CAVALORN_TEST_TRUE_09_07"); //Wygl¹da na to, ¿e wielu Kretów wziê³o sobie do serca zapewnienia magów o odzyskaniu wolnoœci.
	AI_Output (self, other,"Info_Swiney_CAVALORN_TEST_TRUE_09_08"); //A wracaj¹c do tematu: nied³ugo organizujemy transport rudy.
	AI_Output (self, other,"Info_Swiney_CAVALORN_TEST_TRUE_09_09"); //Dopiero zacz¹³em opracowywaæ plan, wiêc za wiele ci nie powiem.
	AI_Output (self, other,"Info_Swiney_CAVALORN_TEST_TRUE_09_10"); //Myœlê, ¿e najlepsz¹ por¹ bêdzie noc. Przynajmniej zmniejszy to ryzyko, ¿e zostaniemy okradzeni.
	AI_Output (other, self,"Info_Swiney_CAVALORN_TEST_TRUE_15_11"); //Dziêki za informacje.
	knowsOre2 = true;
	B_LogEntry                     (CH1_TestOC,"Od Swineya dowiedzia³em siê, ¿e Krety w Wolnej Kopalni wydoby³y 30 skrzyñ rudy. Swiney dopiero obmyœla plan transportu, ale jest pewien, ¿e odbêdzie siê on w nocy.");
	Info_ClearChoices(Info_Swiney_CAVALORN_TEST);
};

func void Info_Swiney_CAVALORN_TEST_FALSE ()
{
	AI_Output (other, self,"Info_Swiney_CAVALORN_TEST_FALSE_15_00"); //Jestem po prostu ciekawy.
	AI_Output (self, other,"Info_Swiney_CAVALORN_TEST_FALSE_09_01"); //Ciekawy? Nie rozœmieszaj mnie, ch³opcze.
	AI_Output (self, other,"Info_Swiney_CAVALORN_TEST_FALSE_09_02"); //Pewnie Gomezowi zachcia³o siê nas szpiegowaæ.
	AI_Output (self, other,"Info_Swiney_CAVALORN_TEST_FALSE_09_03"); //Nic ci nie powiem, a jeœli spróbujesz coœ kombinowaæ, to Okyl zrobi z tob¹ porz¹dek.
	AI_Output (other, self,"Info_Swiney_CAVALORN_TEST_FALSE_15_04"); //Ale...
	AI_Output (self, other,"Info_Swiney_CAVALORN_TEST_FALSE_09_05"); //Spadaj st¹d!
	knowsOre2 = false;
	B_LogEntry                     (CH1_TestOC,"Nawali³em... Swiney nic mi nie powie o transporcie rudy. Co nie znaczy, ¿e obla³em test. Warto wróciæ do Cavalorna i sprawdziæ jak mnie oceni.");
	Info_ClearChoices(Info_Swiney_CAVALORN_TEST);
};

