//poprawione i sprawdzone - Nocturn

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Uciekinier_EXIT(C_INFO)
{
	npc             = NOV_1380_ArtfiactsThief;
	nr              = 999;
	condition	= DIA_Uciekinier_EXIT_Condition;
	information	= DIA_Uciekinier_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Uciekinier_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Uciekinier_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO
//========================================

INSTANCE DIA_Uciekinier_HELLO (C_INFO)
{
   npc          = NOV_1380_ArtfiactsThief;
   nr           = 1;
   condition    = DIA_Uciekinier_HELLO_Condition;
   information  = DIA_Uciekinier_HELLO_Info;
   permanent	= FALSE;
   description	= "Znalaz³em ciê, z³odzieju.";
};

FUNC INT DIA_Uciekinier_HELLO_Condition()
{
	if (MIS_StolenStaff == LOG_RUNNING) {
    return TRUE; };
};

FUNC VOID DIA_Uciekinier_HELLO_Info()
{
    AI_Output (other, self ,"DIA_Uciekinier_HELLO_15_01"); //Znalaz³em ciê, z³odzieju.
    AI_Output (self, other ,"DIA_Uciekinier_HELLO_03_02"); //Je..je.. jesteœ Guru! Mmm...myœla³em, ¿e wyœl¹ za mn¹ co najwy¿ej jakiegoœ Nowicjusza...
	AI_Output (other, self ,"DIA_Uciekinier_HELLO_15_03"); //W takim razie nieŸle siê pomyli³eœ.
    AI_Output (self, other ,"DIA_Uciekinier_HELLO_03_04"); //Co ze mn¹ zrobisz?
    AI_Output (other, self ,"DIA_Uciekinier_HELLO_15_05"); //Wszystko zale¿y od ciebie...
    AI_Output (self, other ,"DIA_Uciekinier_HELLO_03_06"); //Mistrzu, pos³uchaj. Nie wiedzia³em co robiæ, zagubi³em siê. To na czym budowa³em mój œwiatopogl¹d nagle siê rozpad³o.
	AI_Output (self, other ,"DIA_Uciekinier_HELLO_03_07"); //Œni¹cy okaza³ siê demonem. Nasza nadzieja na ucieczkê przepad³a...
	AI_Output (self, other ,"DIA_Uciekinier_HELLO_03_08"); //Chcia³em ukraœæ kostur i sprzedaæ Magom Wody. Liczy³em, ¿e dziêki rudzie zostanê cz³onkiem obozu. Tam móg³bym zacz¹æ od nowa.
	AI_Output (self, other ,"DIA_Uciekinier_HELLO_03_09"); //Co za ironia... Do Kolonii trafi³em w³aœnie za kradzie¿. Znów da³em siê z³apaæ.
	Info_ClearChoices	(DIA_Uciekinier_HELLO);
	Info_AddChoice		(DIA_Uciekinier_HELLO,"Ka¿dy zas³uguje na drug¹ szansê.",DIA_Uciekinier_HELLO_Litosc);
	Info_AddChoice		(DIA_Uciekinier_HELLO,"Przekroczy³eœ pewne granice. To twój koniec.",DIA_Uciekinier_HELLO_Smierc);
};

func void DIA_Uciekinier_HELLO_Litosc ()
{
	AI_Output (other, self ,"DIA_Uciekinier_HELLO_Litosc_15_01"); //Ka¿dy zas³uguje na drug¹ szansê.
    AI_Output (self, other ,"DIA_Uciekinier_HELLO_Litosc_03_02"); //Dziêkujê, Mistrzu. Od pocz¹tku wierzy³em, ¿e jesteœ dobrym cz³owiekiem.
	AI_Output (other, self ,"DIA_Uciekinier_HELLO_Litosc_15_03"); //Te¿ kiedyœ pope³ni³em b³¹d...
	AI_Output (self, other ,"DIA_Uciekinier_HELLO_Litosc_03_04"); //W³aœnie dlatego doskonale rozumiesz, co siê teraz dzieje wewn¹trz mnie. Kolonia sta³a siê dla ciebie szans¹ na zmianê.
	AI_Output (self, other ,"DIA_Uciekinier_HELLO_Litosc_03_05"); //Spójrz ile dobrego zrobi³eœ odk¹d tu przyby³eœ. Wczeœniej nic siê nie zmienia³o... Pojawiali siê nowi skazañcy wraz z towarami ze Œwiata Zewnêtrznego.
	AI_Output (self, other ,"DIA_Uciekinier_HELLO_Litosc_03_06"); //Czêœæ ginê³a w kopalniach, reszta stawa³a siê rozbójnikami. A od kiedy pojawi³eœ siê ty wszystko nabra³o tempa.
	AI_Output (self, other ,"DIA_Uciekinier_HELLO_Litosc_03_07"); //Odby³o siê przywo³anie, dowiedzieliœmy siê o prawdziwej naturze Œni¹cego... Œwiadomie, czy nie ostrzeg³eœ nas o zagro¿eniu, które mog³o spowodowaæ œmieræ setek osób.
	AI_Output (other, self ,"DIA_Uciekinier_HELLO_Litosc_15_08"); //Wci¹¿ mo¿e. Problem Œni¹cego nie zosta³ rozwi¹zany.
	AI_Output (self, other ,"DIA_Uciekinier_HELLO_Litosc_03_09"); //Tak, ale Guru wkrótce coœ wymyœl¹... Chodzi mi o to, ¿e nie wiem jakie przestêpstwo pope³ni³eœ, ale z pewnoœci¹ ju¿ je odpokutowa³eœ.
	AI_Output (other, self ,"DIA_Uciekinier_HELLO_Litosc_15_10"); //Sk³oni³eœ mnie do pewnych przemyœleñ. Od³ó¿my to na razie. Mam jeszcze wiele spraw do za³atwienia.
	AI_Output (self, other ,"DIA_Uciekinier_HELLO_Litosc_03_11"); //Proszê, oto kostur. WeŸ go i zanieœ do œwi¹tyni. Zostanê tu jakiœ czas sam. 
	AI_Output (self, other ,"DIA_Uciekinier_HELLO_Litosc_03_12"); //Chce siê modliæ doY'Beriona, aby przebaczy³ mi mój czyn. 
	CreateInvItems (self, Stab_des_Lichts, 1);
	B_GiveInvItems (self, other, Stab_des_Lichts, 1);
	B_LogEntry     (CH3_StolenStaff,"Odnalaz³em z³odzieja w opuszczonej chacie na bagnie. Nie wyci¹gn¹³em konsekwencji z postêpku Nowicjusza. W zamian odda³ mi kostur po dobroci. Odby³em z nim te¿ bardzo ciekaw¹ rozmowê.");
	
	Info_ClearChoices	(DIA_Uciekinier_HELLO);
	AI_StopProcessInfos	(self);
};

func void DIA_Uciekinier_HELLO_Smierc ()
{
	AI_Output (other, self ,"DIA_Uciekinier_HELLO_Smierc_15_01"); //Przekroczy³eœ pewne granice. To twój koniec.
	AI_Output (other, self ,"DIA_Uciekinier_HELLO_Smierc_15_02"); //Zbezczeœci³eœ szcz¹tki Y"Beriona. Nie unikniesz kary.
    AI_Output (self, other ,"DIA_Uciekinier_HELLO_Smierc_03_03"); //S¹dzi³em, ¿e jesteœ inny. Liczy³em na drug¹ szansê. 
	AI_Output (self, other ,"DIA_Uciekinier_HELLO_Smierc_03_04"); //Tak naprawdê niczym siê nie ró¿nimy. Ty te¿ nie trafi³eœ tu za nic. Byæ mo¿e masz na sumieniu rzeczy gorsze ni¿ kradzie¿. Mo¿e morderstwo...
	AI_Output (self, other ,"DIA_Uciekinier_HELLO_Smierc_03_05"); //Próbujesz teraz odpokutowaæ wymierzaj¹c sprawiedliwoœæ takim jak ja. Myœlisz, ¿e moja œmieræ coœ zmieni? 
	AI_Output (self, other ,"DIA_Uciekinier_HELLO_Smierc_03_06"); //Innos nagle ci przebaczy, bo zabi³eœ jakiegoœ z³odziejaszka? Jesteœ ¿a³osny. W tym momencie niczym nie ró¿nisz siê od tych szumowin...
	AI_Output (other, self ,"DIA_Uciekinier_HELLO_Smierc_15_07"); //Doœæ!
	CreateInvItems (self, Stab_des_Lichts, 1);
	B_LogEntry     (CH3_StolenStaff,"Odnalaz³em z³odzieja w opuszczonej chacie na bagnie. Zas³u¿y³ na najwy¿sz¹ karê za zbezczeszczenie zw³ok Y'Beriona.");
	
	Info_ClearChoices	(DIA_Uciekinier_HELLO);
	AI_StopProcessInfos	(self);
    Npc_SetPermAttitude (self, ATT_HOSTILE);
    Npc_SetTarget (self,other);
    AI_StartState (self,ZS_ATTACK,1,"");
	
};
