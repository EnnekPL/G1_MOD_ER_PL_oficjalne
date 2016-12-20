// **************************************************
//						 EXIT 
// **************************************************

instance DIA_Josh_Exit (C_INFO)
{
	npc				= BAN_1606_Josh;
	nr				= 999;
	condition		= DIA_Josh_Exit_Condition;
	information		= DIA_Josh_Exit_Info;
	permanent		= 1;
	description 	= DIALOG_ENDE;
};                       

FUNC INT DIA_Josh_Exit_Condition()
{
	return 1;
};

func VOID DIA_Josh_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
//						Hallo
// **************************************************

instance DIA_Josh_Hallo(C_INFO)
{
	npc				= BAN_1606_Josh;
	nr				= 1;
	condition		= DIA_Josh_Hallo_Condition;
	information		= DIA_Josh_Hallo_Info;
	permanent		= 0;
	important	 	= 1;
};                       

FUNC INT DIA_Josh_Hallo_Condition()
{
	if MIS_OreInOM == LOG_RUNNING
	{
	return 1;
	};
};

func VOID DIA_Josh_Hallo_Info()
{
	AI_Output (self, other,"DIA_Josh_Hallo_04_01"); //Czeœæ...
	AI_Output (other, self,"DIA_Josh_Hallo_15_02"); //Eee... Czeœæ. Znamy siê?
	AI_Output (self, other,"DIA_Josh_Hallo_04_03"); //Spojrza³eœ na mnie tak, jakbyœ mnie zna³ lub szuka³ kogoœ podobnego do mnie. Nazywam siê Josh.
	AI_Output (other, self,"DIA_Josh_Hallo_15_04"); //Nie, nie kojarzê. Ja z kolei jestem... Czekaj! Powiedzia³eœ Josh? 
	AI_Output (self, other,"DIA_Josh_Hallo_04_05"); //Widzisz, mówi³em, ¿e nasze spotkanie to nie przypadek.
	AI_Output (other, self,"DIA_Josh_Hallo_15_06"); //Znasz Draxa?
	AI_Output (self, other,"DIA_Josh_Hallo_04_07"); //Ha ha! Widzê, ¿e wyczu³em naszego nowego cz³owieka. Pewnie, ¿e go znam. 
	AI_Output (other, self,"DIA_Josh_Hallo_15_08"); //Mam odebraæ od ciebie rudê. Nie powinieneœ byæ czasem w Kopalni i j¹ zdobywaæ?
	AI_Output (self, other,"DIA_Josh_Hallo_04_09"); //Powinienem, jednak musia³em siê stamt¹d zmyæ.
	AI_Output (other, self,"DIA_Josh_Hallo_15_10"); //A to dlaczego?
	AI_Output (self, other,"DIA_Josh_Hallo_04_11"); //Mój dawny wspólnik, niejaki Drake nagle postanowi³, ¿e zacznie byæ lojalny wobec swojego szefa. 
	AI_Output (self, other,"DIA_Josh_Hallo_04_12"); //Namówi³ Kopaczy od których zbiera³em rudê, na doniesienie na mnie Ianowi. 
	AI_Output (self, other,"DIA_Josh_Hallo_04_13"); //Ten cholernie siê wœciek³ i wyda³ polecenie zabicia mnie. 
	AI_Output (self, other,"DIA_Josh_Hallo_04_14"); //Gdy zauwa¿y³em Stra¿ników id¹cych w moj¹ stronê uzna³em, ¿e atmosfera zrobi³a siê trochê za gor¹ca, wiêc opuœci³em Kopalniê.
	AI_Output (other, self,"DIA_Josh_Hallo_15_15"); //Stra¿nicy nie powinni ciê goniæ?
	AI_Output (self, other,"DIA_Josh_Hallo_04_16"); //Uda³o mi siê ich zwieœæ. Ukry³em siê za straganem Alberto, który nie wiedzia³ o co chodzi. Gdy Stra¿nicy poszli szukaæ w innym kierunku, da³em w d³ug¹ i wybieg³em na powierzchniê.
	AI_Output (self, other,"DIA_Josh_Hallo_04_17"); //Zaczepi³ mnie Artch i powiedzia³, ¿e ju¿ nigdy wiêcej nie wpuœci mnie do Kopalni. 
	AI_Output (self, other,"DIA_Josh_Hallo_04_18"); //Przestraszy³em siê, bo myœla³em, ¿e ju¿ o wszystkim wie. 
	AI_Output (self, other,"DIA_Josh_Hallo_04_19"); //Na szczêœcie okaza³o siê, ¿e nie. Po prostu od jakiegoœ czasu zaostrzone zosta³y zasady dotycz¹ce wstêpu. Tacy jak my, nie mog¹ tam ju¿ wchodziæ bez powodu.
	AI_Output (other, self,"DIA_Josh_Hallo_15_20"); //Ciekawa historia, ale wola³bym ju¿ dostaæ tê rudê. 
	AI_Output (self, other,"DIA_Josh_Hallo_04_21"); //Gdybyœ da³ mi dokoñczyæ, wiedzia³byœ, ¿e ju¿ jej nie mam.
	AI_Output (other, self,"DIA_Josh_Hallo_15_22"); //A wiêc kto jest teraz w jej posiadaniu?
	AI_Output (self, other,"DIA_Josh_Hallo_04_23"); //Sêk w tym, ¿e nie wiem.
	AI_Output (other, self,"DIA_Josh_Hallo_15_24"); //No dobra, po kolei. Gdzie j¹ zgubi³eœ?
	AI_Output (self, other,"DIA_Josh_Hallo_04_25"); //Sakiewka z rud¹ wypad³a mi gdzieœ przy wejœciu do Kopalni w³aœnie podczas mojej ucieczki. 
	AI_Output (other, self,"DIA_Josh_Hallo_15_26"); //Pójdê po ni¹...
	AI_Output (self, other,"DIA_Josh_Hallo_04_27"); //Czekaj! Ju¿ tam by³em. Nigdzie jej nie ma. Na pewno j¹ ktoœ znalaz³. Musisz mi pomóc dowiedzieæ siê, kto to jest.
	AI_Output (self, other,"DIA_Josh_Hallo_04_28"); //S¹ dwie kwestie, które u³atwi¹ ci poszukiwania. Mianowicie, ostatnio do Kopalni nie wchodzi³ nikt nowy, a z zewn¹trz nie przychodzili Kopacze.
	AI_Output (self, other,"DIA_Josh_Hallo_04_29"); //Oznacza to, ¿e rudê ma ktoœ w tym obozie. Druga rzecz, to to, ¿e rudy na pewno nie ma ¿aden Stra¿nik. 
	AI_Output (other, self,"DIA_Josh_Hallo_15_30"); //Sk¹d ta pewnoœæ?
	AI_Output (self, other,"DIA_Josh_Hallo_04_31"); //Znam Stra¿ników. To ba³wany, którzy myœl¹, ¿e maj¹ tu w³adzê. Gdyby, któryœ z nich znalaz³ tak¹ iloœæ rudy, na pewno zacz¹³by siê tym chwaliæ. 
	AI_Output (self, other,"DIA_Josh_Hallo_04_32"); //No bo czemu nie? W koñcu nikt by mu jej nie odebra³. 
	AI_Output (self, other,"DIA_Josh_Hallo_04_33"); //Rudê znalaz³ jakiœ Kopacz, który utrzymuje to w tajemnicy. Inaczej Stra¿nicy zabraliby mu rudê, a towarzysze mogliby go okraœæ. 
	AI_Output (self, other,"DIA_Josh_Hallo_04_34"); //Pogadaj z ludŸmi. Mo¿e czegoœ siê dowiesz...
	AI_Output (self, other,"DIA_Josh_Hallo_04_35"); //Spadaj ju¿. Nie chcê, ¿eby ten pieprzony kucharz nas zobaczy³. Gapi siê na mnie od kiedy to przyszed³em.
	
	B_LogEntry               (CH1_OreInOM,"Spotka³em Josha w obozie przed Star¹ Kopalni¹. Okazuje siê, ¿e wpad³ w k³opoty i musia³ opuœciæ Kopalniê. Podczas ucieczki zgubi³ sakiewkê z ca³¹ rud¹, któr¹ zbiera³ od jakiegoœ czasu. Bandyta uwa¿a, ¿e sakiewkê ju¿ ktoœ znalaz³, oraz ¿e znalazc¹ na pewno nie jest ¿aden Stra¿nik, a Kopacz. Muszê popytaæ w okolicy i znaleŸæ tego Kopacza, zanim ruda opuœci obóz.");
};

//========================================
//-----------------> TheftFind
//========================================

INSTANCE DIA_Josh_TheftFind (C_INFO)
{
   npc          = BAN_1606_Josh;
   nr           = 1;
   condition    = DIA_Josh_TheftFind_Condition;
   information  = DIA_Josh_TheftFind_Info;
   permanent	= FALSE;
   description	= "Wiem, kto ma rudê.";
};

FUNC INT DIA_Josh_TheftFind_Condition()
{
    if (MIS_OreInOM == LOG_RUNNING) && (hero_knows_hysenfinder)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Josh_TheftFind_Info()
{
    AI_Output (other, self ,"DIA_Josh_TheftFind_15_01"); //Wiem, kto ma rudê. To Kopacz Hysen. Ukry³ j¹ w jakiejœ skrzyni. Klucz ma zapewne przy sobie.
    AI_Output (self, other ,"DIA_Josh_TheftFind_03_02"); //Dobra robota. Ukradnij klucz, znajdŸ skrzynie, otwórz j¹ i zabierajmy siê st¹d jak najszybciej. 
    AI_Output (other, self ,"DIA_Josh_TheftFind_15_03"); //Dlaczego ty tego nie zrobisz? Nie jestem zbyt dobrym z³odziejem.
	AI_Output (self, other ,"DIA_Josh_TheftFind_03_04"); //Nie mogê opuœciæ obozu. Muszê mieæ kilka rzeczy na oku. Ian chyba da³ jakieœ instrukcje Stra¿nikom z obozu. 
	AI_Output (self, other ,"DIA_Josh_TheftFind_03_05"); //Ponadto chcia³em za³atwiæ jeszcze dwie rzeczy. Mogê ciê nauczyæ kradzie¿y kieszonkowej i otwierania zamków.
	AI_Output (self, other ,"DIA_Josh_TheftFind_03_06"); //Przyda ci siê te¿ co nieco wiedzy o zrêcznoœci. 
    B_LogEntry                     (CH1_OreInOM,"Josh nie mo¿e opuœciæ obozu i udaæ siê na poszukiwania skrzyni. Muszê sam ukraœæ klucz i znaleŸæ skrzyniê.");

};

// **************************************************
// 						 Lehrer
// **************************************************

INSTANCE DIA_Josh_Lehrer (C_INFO)
{
	npc				= BAN_1606_Josh;
	nr				= 2;
	condition		= DIA_Josh_Lehrer_Condition;
	information		= DIA_Josh_Lehrer_Info;
	permanent		= 1;
	description		= "Naucz mnie okradaæ."; 
};

FUNC INT DIA_Josh_Lehrer_Condition()
{	
	if (Npc_KnowsInfo (hero, DIA_Josh_TheftFind))
	{
		return 1;	
	};
};

FUNC VOID DIA_Josh_Lehrer_Info()
{
	AI_Output (other, self,"DIA_Josh_Lehrer_15_00"); //Naucz mnie okradaæ.
	AI_Output (self, other,"DIA_Josh_Lehrer_05_02"); //Czego konkretnie chcia³byœ siê nauczyæ?



	Info_ClearChoices	(DIA_Josh_Lehrer );
	Info_AddChoice		(DIA_Josh_Lehrer,DIALOG_BACK																,DIA_Josh_Lehrer_BACK);
	if	(Npc_GetTalentSkill(hero, NPC_TALENT_PICKPOCKET) == 1) 
	{
		Info_AddChoice		(DIA_Josh_Lehrer,B_BuildLearnString(NAME_LearnPickpocket_2,LPCOST_TALENT_PICKPOCKET_2,500)		,DIA_Josh_Lehrer_Pickpocket2);
	};
	if	(Npc_GetTalentSkill(hero, NPC_TALENT_PICKPOCKET) == 0) 
	{
		Info_AddChoice		(DIA_Josh_Lehrer,B_BuildLearnString(NAME_LearnPickpocket_1,LPCOST_TALENT_PICKPOCKET_1,250)		,DIA_Josh_Lehrer_Pickpocket);
	};
	if	(Npc_GetTalentSkill(hero, NPC_TALENT_PICKLOCK) == 1) 
	{
		Info_AddChoice	(DIA_Josh_Lehrer,B_BuildLearnString(NAME_LearnPicklock_2,	LPCOST_TALENT_PICKLOCK_2,600)		,DIA_Josh_Lehrer_Lockpick2);
	};
	if	(Npc_GetTalentSkill(hero, NPC_TALENT_PICKLOCK) == 0) 
	{
		Info_AddChoice	(DIA_Josh_Lehrer,B_BuildLearnString(NAME_LearnPicklock_1,	LPCOST_TALENT_PICKLOCK_1,300)		,DIA_Josh_Lehrer_Lockpick);
	};
	if	(Npc_GetTalentSkill(hero, NPC_TALENT_SNEAK) == 0) 
	{
		Info_AddChoice	(DIA_Josh_Lehrer,B_BuildLearnString(NAME_LearnSneak, 		LPCOST_TALENT_SNEAK,200)			,DIA_Josh_Lehrer_Schleichen);
	};
	Info_AddChoice		(DIA_Josh_Lehrer,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,DIA_Josh_LehrerDEX5);
	Info_AddChoice		(DIA_Josh_Lehrer,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)		,DIA_Josh_LehrerDEX1);
};

func void DIA_Josh_LehrerDEX5 ()
{
	Mod_KupAtrybut (hero, ATR_DEXTERITY, 5);
	Info_ClearChoices	(DIA_Josh_Lehrer );
	Info_AddChoice		(DIA_Josh_Lehrer,DIALOG_BACK																,DIA_Josh_Lehrer_BACK);
	if	(Npc_GetTalentSkill(hero, NPC_TALENT_PICKPOCKET) == 1) 
	{
		Info_AddChoice		(DIA_Josh_Lehrer,B_BuildLearnString(NAME_LearnPickpocket_2,LPCOST_TALENT_PICKPOCKET_2,500)		,DIA_Josh_Lehrer_Pickpocket2);
	};
	if	(Npc_GetTalentSkill(hero, NPC_TALENT_PICKPOCKET) == 0) 
	{
		Info_AddChoice		(DIA_Josh_Lehrer,B_BuildLearnString(NAME_LearnPickpocket_1,LPCOST_TALENT_PICKPOCKET_1,250)		,DIA_Josh_Lehrer_Pickpocket);
	};
	if	(Npc_GetTalentSkill(hero, NPC_TALENT_PICKLOCK) == 1) 
	{
		Info_AddChoice	(DIA_Josh_Lehrer,B_BuildLearnString(NAME_LearnPicklock_2,	LPCOST_TALENT_PICKLOCK_2,600)		,DIA_Josh_Lehrer_Lockpick2);
	};
	if	(Npc_GetTalentSkill(hero, NPC_TALENT_PICKLOCK) == 0) 
	{
		Info_AddChoice	(DIA_Josh_Lehrer,B_BuildLearnString(NAME_LearnPicklock_1,	LPCOST_TALENT_PICKLOCK_1,300)		,DIA_Josh_Lehrer_Lockpick);
	};
	if	(Npc_GetTalentSkill(hero, NPC_TALENT_SNEAK) == 0) 
	{
		Info_AddChoice	(DIA_Josh_Lehrer,B_BuildLearnString(NAME_LearnSneak, 		LPCOST_TALENT_SNEAK,200)			,DIA_Josh_Lehrer_Schleichen);
	};
	Info_AddChoice		(DIA_Josh_Lehrer,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,DIA_Josh_LehrerDEX5);
	Info_AddChoice		(DIA_Josh_Lehrer,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)		,DIA_Josh_LehrerDEX1);
};

func void DIA_Josh_LehrerDEX1 ()
{
	Mod_KupAtrybut (hero, ATR_DEXTERITY, 1);
	Info_ClearChoices	(DIA_Josh_Lehrer );
	Info_AddChoice		(DIA_Josh_Lehrer,DIALOG_BACK																,DIA_Josh_Lehrer_BACK);
	if	(Npc_GetTalentSkill(hero, NPC_TALENT_PICKPOCKET) == 1) 
	{
		Info_AddChoice		(DIA_Josh_Lehrer,B_BuildLearnString(NAME_LearnPickpocket_2,LPCOST_TALENT_PICKPOCKET_2,500)		,DIA_Josh_Lehrer_Pickpocket2);
	};
	if	(Npc_GetTalentSkill(hero, NPC_TALENT_PICKPOCKET) == 0) 
	{
		Info_AddChoice		(DIA_Josh_Lehrer,B_BuildLearnString(NAME_LearnPickpocket_1,LPCOST_TALENT_PICKPOCKET_1,250)		,DIA_Josh_Lehrer_Pickpocket);
	};
	if	(Npc_GetTalentSkill(hero, NPC_TALENT_PICKLOCK) == 1) 
	{
		Info_AddChoice	(DIA_Josh_Lehrer,B_BuildLearnString(NAME_LearnPicklock_2,	LPCOST_TALENT_PICKLOCK_2,600)		,DIA_Josh_Lehrer_Lockpick2);
	};
	if	(Npc_GetTalentSkill(hero, NPC_TALENT_PICKLOCK) == 0) 
	{
		Info_AddChoice	(DIA_Josh_Lehrer,B_BuildLearnString(NAME_LearnPicklock_1,	LPCOST_TALENT_PICKLOCK_1,300)		,DIA_Josh_Lehrer_Lockpick);
	};
	if	(Npc_GetTalentSkill(hero, NPC_TALENT_SNEAK) == 0) 
	{
		Info_AddChoice	(DIA_Josh_Lehrer,B_BuildLearnString(NAME_LearnSneak, 		LPCOST_TALENT_SNEAK,200)			,DIA_Josh_Lehrer_Schleichen);
	};
	Info_AddChoice		(DIA_Josh_Lehrer,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,DIA_Josh_LehrerDEX5);
	Info_AddChoice		(DIA_Josh_Lehrer,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)		,DIA_Josh_LehrerDEX1);
};


func void DIA_Josh_Lehrer_Schleichen()
{
	AI_Output (other, self,"DIA_Josh_Lehrer_Schleichen_15_00"); //Chcia³bym nauczyæ siê poruszaæ bezszelestnie.
	if (Npc_HasItems (hero, itminugget) >=200)
		{
	if (B_GiveSkill(other, NPC_TALENT_SNEAK, 1, LPCOST_TALENT_SNEAK))
	{
		AI_Output (self, other,"DIA_Josh_Lehrer_Schleichen_05_01"); //Grunt to zachowaæ równowagê. Oprócz tego musisz nauczyæ siê kontrolowaæ swój oddech.
		AI_Output (self, other,"DIA_Josh_Lehrer_Schleichen_05_02"); //Przyjmij odpowiedni¹ postawê, a nikt nie us³yszy twoich kroków.
	};
	B_GiveInvItems (hero, self, itminugget, 200);
		Npc_RemoveInvItems (self, itminugget, 200);
		}
		else
		{
		AI_Output (self, other,"DIA_Josh_Lehrer_NOORE"); //Nie ma nic za darmo!
		};
};

func void DIA_Josh_Lehrer_Lockpick()
{
	AI_Output (other, self,"DIA_Josh_Lehrer_Lockpick_15_00"); //Chcia³bym nauczyæ siê otwieraæ zamki.
	if (Npc_HasItems (hero, itminugget) >=300)
		{
	if (B_GiveSkill(other, NPC_TALENT_PICKLOCK, 1, LPCOST_TALENT_PICKLOCK_1))
	{
		AI_Output (self, other,"DIA_Josh_Lehrer_Lockpick_05_01"); //Nie w¹tpiê! Có¿... Pocz¹tki nie s¹ zbyt trudne.
		AI_Output (self, other,"DIA_Josh_Lehrer_Lockpick_05_02"); //Przede wszystkim musisz uwa¿aæ, ¿eby nie z³amaæ wytrycha.
		AI_Output (self, other,"DIA_Josh_Lehrer_Lockpick_05_03"); //Musisz byæ bardzo cierpliwy. Wtedy nie bêdziesz potrzebowa³ tylu wytrychów, he he!
	};
	B_GiveInvItems (hero, self, itminugget, 300);
		Npc_RemoveInvItems (self, itminugget, 300);
		}
		else
		{
		AI_Output (self, other,"DIA_Josh_Lehrer_NOORE"); //Nie ma nic za darmo!
		};
};

func void DIA_Josh_Lehrer_Lockpick2()
{
	AI_Output (other, self,"DIA_Josh_Lehrer_Lockpick2_15_00"); //Chcia³bym zostaæ ekspertem w otwieraniu zamków.
	if (Npc_HasItems (hero, itminugget) >=600)
		{
	if (B_GiveSkill(other, NPC_TALENT_PICKLOCK, 2, LPCOST_TALENT_PICKLOCK_2))
	{
		AI_Output (self, other,"DIA_Josh_Lehrer_Lockpick2_05_01"); //Gdy nabierzesz ju¿ trochê doœwiadczenia, nauczysz siê rozpoznawaæ dŸwiêk, jaki wydaje wytrych zanim pêknie.
		AI_Output (self, other,"DIA_Josh_Lehrer_Lockpick2_05_02"); //Myœlê, ¿e powinieneœ sobie z tym poradziæ. Ws³uchaj siê uwa¿nie w dŸwiêki jakie wydaje otwierany zamek, a nie bêdziesz potrzebowa³ tylu wytrychów, he, he!
		AI_Output (self, other,"DIA_Josh_Lehrer_Lockpick2_05_03"); //Prawdziwy mistrz w tym fachu potrafi otworzyæ ka¿d¹ skrzyniê nie ³ami¹c ani jednego wytrycha.
	};
	B_GiveInvItems (hero, self, itminugget, 600);
		Npc_RemoveInvItems (self, itminugget, 600);
		}
		else
		{
		AI_Output (self, other,"DIA_Josh_Lehrer_NOORE"); //Nie ma nic za darmo!
		};
};

func void DIA_Josh_Lehrer_Pickpocket()
{
	AI_Output (other, self,"DIA_Josh_Lehrer_PICKPOCKET_15_00"); //Chcia³bym zostaæ zrêcznym kieszonkowcem!
	if (Npc_GetTalentSkill(other, NPC_TALENT_SNEAK) == 1)
	{
		if (Npc_HasItems (hero, itminugget) >=250)
		{
		if (B_GiveSkill(other, NPC_TALENT_PICKPOCKET, 1, LPCOST_TALENT_PICKPOCKET_1))
		{
			AI_Output (self, other,"DIA_Josh_Lehrer_PICKPOCKET_05_01"); //Chcia³byœ odci¹¿yæ parê osób z ich dobytku, co? No dobra.
			AI_Output (self, other,"DIA_Josh_Lehrer_PICKPOCKET_05_02"); //Poka¿ê ci na czym powinieneœ siê skoncentrowaæ, ale szanse, ¿e zostaniesz z³apany bêd¹ nadal znaczne.
			AI_Output (self, other,"DIA_Josh_Lehrer_PICKPOCKET_05_03"); //Podejmuj ryzyko wy³¹cznie jeœli w pobli¿u ofiary nie ma osób trzecich.
			AI_Output (self, other,"DIA_Josh_Lehrer_PICKPOCKET_05_04"); //Tylko prawdziwy mistrz potrafi ukraœæ coœ pozostaj¹c ca³kowicie niezauwa¿onym!
		};
		B_GiveInvItems (hero, self, itminugget, 250);
		Npc_RemoveInvItems (self, itminugget, 250);
		}
		else
		{
		AI_Output (self, other,"DIA_Josh_Lehrer_NOORE"); //Nie ma nic za darmo!
		};
	}
	else
	{
		AI_Output (self, other,"DIA_Josh_lehrer_Pickpocket_05_05"); //Nie ma o czym mówiæ! Nie bêdzie z ciebie z³odzieja, dopóki nie nauczysz siê skradaæ!
	};
};

func void DIA_Josh_Lehrer_Pickpocket2()
{
	AI_Output (other, self,"DIA_Josh_Lehrer_Pickpocket2_15_00"); //Chcia³bym zostaæ mistrzem kieszonkowców!
	if (Npc_HasItems (hero, itminugget) >=500)
	{
	if (B_GiveSkill(other, NPC_TALENT_PICKPOCKET, 2, LPCOST_TALENT_PICKPOCKET_2))
	{		
		AI_Output (self, other,"DIA_Josh_Lehrer_Pickpocket2_05_01"); //Có¿, chyba rzeczywiœcie potrafisz ju¿ wystarczaj¹co du¿o, ¿eby opanowaæ zaawansowane sztuczki.
		AI_Output (self, other,"DIA_Josh_Lehrer_Pickpocket2_05_02"); //Ale musisz pamiêtaæ, ¿e nawet mistrzowie z³odziejscy od czasu do czasu zostaj¹ z³apani.
		AI_Output (self, other,"DIA_Josh_Lehrer_Pickpocket2_05_03"); //Uwa¿aj na siebie.
	};
		B_GiveInvItems (hero, self, itminugget, 500);
		Npc_RemoveInvItems (self, itminugget, 500);
		}
		else
		{
		AI_Output (self, other,"DIA_Josh_Lehrer_NOORE"); //Nie ma nic za darmo!
		};
};

func VOID DIA_Josh_Lehrer_BACK()
{
	Info_ClearChoices	( DIA_Josh_Lehrer );
};