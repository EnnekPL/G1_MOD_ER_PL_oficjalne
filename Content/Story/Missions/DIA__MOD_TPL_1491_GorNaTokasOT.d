instance Info_TPL_1405_GorNaRan (C_INFO)
{
	npc			= TPL_1491_GorNaTokasOT;
	condition	= Info_TPL_1405_GorNaRan_Condition;
	information	= Info_TPL_1405_GorNaRan_Info;
	permanent	= 0;
	important	= 1;
};                       

FUNC INT Info_TPL_1405_GorNaRan_Condition()
{
		return TRUE;
};

FUNC VOID Info_TPL_1405_GorNaRan_Info()
{
	AI_Output (self, other,"Info_TPL_1405_GorNaRan_Info_13_01"); //A dok�d to si� wybierasz? Nikt nie ma tu prawa wst�pu!
};


// ****************** ANGRIFF  *********************

INSTANCE Info_TPL_1405_GorNaRan2 (C_INFO)
{
	npc			= TPL_1491_GorNaTokasOT;
	nr			= 1;
	condition	= Info_TPL_1405_GorNaRan2_Condition;
	information	= Info_TPL_1405_GorNaRan2_Info;
	permanent	= 1;
	description = "A co si� tu tak w og�le dzieje?";
};                       

FUNC INT Info_TPL_1405_GorNaRan2_Condition()
{
	if ( Npc_KnowsInfo ( hero, Info_TPL_1405_GorNaRan )) {
		return 1;
	};
};

FUNC VOID Info_TPL_1405_GorNaRan2_Info()
{
	AI_Output (other, self,"Info_TPL_1405_GorNaRan_Info_15_02"); //A co si� tu tak w og�le dzieje?
	AI_Output (self, other,"Info_TPL_1405_GorNaRan_Info_13_03"); //Pytasz, co si� tu dzieje? Padnij na kolana i b�agaj �ni�cego o lito�� nad tw� grzeszn� dusz�! Oto bowiem nadszed� moment jego wielkiego przebudzenia!
	AI_Output (self, other,"Info_TPL_1405_GorNaRan_Info_13_03_NE1"); //Jeste� �lepcem! Nie dostrzeg�e� pot�gi �ni�cego. Gdyby� rozumia�, co si� tu dzieje, ju� dawno sta�by� po mojej stronie.
	AI_Output (self, other,"Info_TPL_1405_GorNaRan_Info_13_03_NE2"); //Nie zauwa�y�e� nawet tego cienia, kt�ry szed� za tob� od pocz�tku twojej w�dr�wki po �wi�tyni.
	AI_Output (self, other,"Info_TPL_1405_GorNaRan_Info_13_03_NE3"); //Tak, ten ma�o rozgarni�ty cz�owieczek by� jak tw�j cie�. Zawsze krok za tob�. 
	AI_Output (self, other,"Info_TPL_1405_GorNaRan_Info_13_03_NE4"); //A wiesz, co go tu zaprowadzi�o? Ch�� zemsty za zabicie jego towarzysza. Pewnie znasz t� histori�, pewnie ci j� opowiada�...
	AI_Output (self, other,"Info_TPL_1405_GorNaRan_Info_13_03_NE5"); //Ten cz�owiek nie wie tylko, �e przyby� tu na pewn� �mier�. Jestem natchniony przez �ni�cego. Jestem pot�g�!
	AI_Output (self, other,"Info_TPL_1405_GorNaRan_Info_13_03_NE6"); //No prosz�, wr�� do niego. Stoi tu� za rogiem. I przyprowad� go na �mier� z mojej r�ki! Niech pozna pot�g� �ni�cego!
	AI_Output (other, self,"Info_TPL_1405_GorNaRan_Info_15_02_NE6"); //DO��! 
	AI_StopProcessInfos (self);
	Wld_InsertNpc				( NON_5676_MagnusOT, 	"TPL_319" ); 
};

/*
// ****************** ANGRIFF  *********************

INSTANCE Info_TPL_1405_GorNaRan3 (C_INFO)
{
	npc			= TPL_1491_GorNaTokasOT;
	nr			= 1;
	condition	= Info_TPL_1405_GorNaRan3_Condition;
	information	= Info_TPL_1405_GorNaRan3_Info;
	permanent	= 1;
	description = "Chcia�em si� tylko troch� rozejrze�.";
};                       

FUNC INT Info_TPL_1405_GorNaRan3_Condition()
{
	if ( Npc_KnowsInfo ( hero, Info_TPL_1405_GorNaRan2 )) {
		return 1;
	};
};

FUNC VOID Info_TPL_1405_GorNaRan3_Info()
{	
	AI_Output (other, self,"Info_TPL_1405_GorNaRan_Info_15_04"); //Chcia�em si� tylko troch� rozejrze�.
	AI_Output (self, other,"Info_TPL_1405_GorNaRan_Info_13_05"); //Gnido! Tacy jak ty nie maj� tu czego szuka� we wznios�ej chwili ostatecznego triumfu �ni�cego! Widz�, �e musz� ci to wbi� do g�owy!
	
	AI_StopProcessInfos	( self );
	
	Npc_SetTarget 	( self, hero );
	AI_StartState 		( self, ZS_Attack, 1 ,"" );
};
*/


INSTANCE Info_TPL_1405_GorNaRan4 (C_INFO)
{
	npc			= TPL_1491_GorNaTokasOT;
	nr			= 1;
	condition	= Info_TPL_1405_GorNaRan4_Condition;
	information	= Info_TPL_1405_GorNaRan4_Info;
	permanent	= 0;
	important	= 1;
};                       

FUNC INT Info_TPL_1405_GorNaRan4_Condition()
{
	if ( Npc_KnowsInfo ( hero, DIA_MagnusOT_HELLO1 )) {
		return 1;
	};
};

FUNC VOID Info_TPL_1405_GorNaRan4_Info()
{	
	AI_Output (other, self,"Info_TPL_1405_GorNaRan_Info_15_06"); //Nie powstrzymasz mnie!
	AI_Output (self, other,"Info_TPL_1405_GorNaRan_Info_13_07"); //Jak sobie �yczysz, ch�opcze, w imi� �ni�cego!

	B_ChangeGuild    	(self,GIL_GRD);  
	self.guild = GIL_GRD;
	AI_StopProcessInfos	( self );
	
	Npc_SetTarget 	( self, hero );
	AI_StartState 	( self, ZS_Attack, 1 ,"" );
	
	Log_CreateTopic(Bossowie, LOG_NOTE);
	B_LogEntry (Bossowie, "Kolejnym przeciwnikiem na mojej drodze by� Gor Na Tokas, Stra�nik �wi�tynny, kt�rego zna�em z obozu na bagnie. Dzier�y wspania�y i niezwykle szybki miecz, wykuty ku chwale �ni�cego. Ciesz� si�, �e jest ze mn� Magnus.");
};
