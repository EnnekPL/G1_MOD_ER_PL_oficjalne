/*
func void SetGhost(var int newGhost, var int transparency) {
//var oCNpc slf; slf = _^(MEM_InstGetOffset(newGhost)); // get ghost instance
       var oCNpc slf; slf = Hlp_GetNpc(newGhost); // version suggested by Avallach
slf.bloodEnabled = false; // disable blood emitter
slf._zCVob_bitfield[0] = slf._zCVob_bitfield[0] | zCVob_bitfield0_visualAlphaEnabled; // enable visual alpha
slf._zCVob_visualAlpha = divf(mkf(100-transparency), mkf(100)); // set transparency, if transparency = 100, then player is fully invisible!
slf._zCVob_bitfield[0] = slf._zCVob_bitfield[0] & ~zCVob_bitfield0_castDynShadow; // destroy casting shadows
};*/

var int JoinOC;
var int JoinNC;
var int JoinPC;
var int JoinBA;
/*
func void HeroJoinToPSI ()
{
if (JoinPC == false) 
{
if (Thorus_MordragKo != LOG_SUCCESS)
{
Log_SetTopicStatus       (CH1_MordragKO, LOG_FAILED);
B_LogEntry				 (CH1_MordragKO,"Przy³¹czy³em siê do Obozu Bractwa. Mogê od³o¿yæ tê sprawê na bok.");
};
Log_SetTopicStatus       (CH1_JoinOC, LOG_FAILED);
B_LogEntry				 (CH1_JoinOC,"Przy³¹czy³em siê do Obozu Bractwa. Mogê od³o¿yæ tê sprawê na bok.");
if (Diego_BringList  != LOG_SUCCESS)
{
Log_SetTopicStatus       (CH1_BringList, LOG_FAILED);
B_LogEntry				 (CH1_BringList,"Przy³¹czy³em siê do Obozu Bractwa. Mogê od³o¿yæ tê sprawê na bok.");
};
if (MIS_MineEnter != LOG_SUCCESS)
{
MIS_MineEnter = LOG_FAILED;
Log_SetTopicStatus       (Ch1_MineEnter, LOG_FAILED);
};
if (MIS_OreInOM != LOG_SUCCESS)
{
MIS_OreInOM = LOG_FAILED;
Log_SetTopicStatus       (CH1_OreInOM, LOG_FAILED);
};
if (MIS_EasyJoinOC != LOG_SUCCESS)
{
MIS_EasyJoinOC = LOG_FAILED;
Log_SetTopicStatus       (CH1_EasyJoinOC, LOG_FAILED);
};
if (MIS_Kopacz != LOG_SUCCESS)
{
MIS_Kopacz = LOG_FAILED;
Log_SetTopicStatus       (CH1_Kopacz, LOG_FAILED);
};
if (MIS_AwansCien != LOG_SUCCESS)
{
MIS_AwansCien = LOG_FAILED;
Log_SetTopicStatus       (CH1_AwansCien, LOG_FAILED);
};
if (MIS_TestOc != LOG_SUCCESS)
{
MIS_TestOc = LOG_FAILED;
Log_SetTopicStatus       (CH1_TestOc, LOG_FAILED);
};
if (MIS_OpinionInNewCamp != LOG_SUCCESS)
{
MIS_OpinionInNewCamp = LOG_FAILED;
Log_SetTopicStatus       (CH1_OpinionInNewCamp, LOG_FAILED);
};
if (MIS_OkylQuest != LOG_SUCCESS)
{
MIS_OkylQuest = LOG_FAILED;
Log_SetTopicStatus       (CH1_OkylQuest, LOG_FAILED);
};
if (MIS_AlternativBanditoSCamp != LOG_SUCCESS)
{
MIS_AlternativBanditoSCamp = LOG_FAILED;
Log_SetTopicStatus       (CH1_AlternativBanditoSCamp, LOG_FAILED);
};
if (MIS_AwansJakoKret != LOG_SUCCESS)
{
MIS_AwansJakoKret = LOG_FAILED;
Log_SetTopicStatus       (CH1_AwansJakoKret, LOG_FAILED);
};
if (MIS_PropozycjaFlinta != LOG_SUCCESS)
{
MIS_PropozycjaFlinta = LOG_FAILED;
Log_SetTopicStatus       (CH1_PropozycjaFlinta, LOG_FAILED);
};
if (MIS_FlintaPrzyjecie != LOG_SUCCESS)
{
MIS_FlintaPrzyjecie = LOG_FAILED;
Log_SetTopicStatus       (CH1_FlintaPrzyjecie, LOG_FAILED);
};
if (MIS_SayOkylFlintDead != LOG_SUCCESS)
{
MIS_SayOkylFlintDead = LOG_FAILED;
Log_SetTopicStatus       (CH1_SayOkylFlintDead, LOG_FAILED);
};
if (MIS_BANDITOS_CAMP != LOG_SUCCESS)
{
MIS_BANDITOS_CAMP = LOG_FAILED;
Log_SetTopicStatus       (CH1_BANDITOS_CAMP, LOG_FAILED);
};
if (MIS_BANDITOS_MORDRAG != LOG_SUCCESS)
{
MIS_BANDITOS_MORDRAG = LOG_FAILED;
Log_SetTopicStatus       (CH1_BANDITOS_MORDRAG, LOG_FAILED);
};

if (MIS_DraxTest != LOG_SUCCESS)
{
MIS_DraxTest = LOG_FAILED;
Log_SetTopicStatus       (CH1_DraxTest, LOG_FAILED);
B_LogEntry (CH1_DraxTest,"Do³¹czy³em do ");
};

PrintScreen	("Anulowano zadania z pozosta³ych obozów! ", -1,-1,"font_new_10_red.tga",2);	
JoinPC = true;
} else {
PrintScreen	("Zadania zosta³y ju¿ anulowane! ", -1,-1,"font_new_10_red.tga",2);	
};
};

func void HeroJoinToOC ()
{
if (JoinOC == false)
{

Log_SetTopicStatus       (CH1_JoinPsi, LOG_FAILED);
if (MIS_OreInOM != LOG_SUCCESS)
{
MIS_OreInOM = LOG_FAILED;
Log_SetTopicStatus       (CH1_OreInOM, LOG_FAILED);
};
if (MIS_OpinionInNewCamp != LOG_SUCCESS)
{
MIS_OpinionInNewCamp = LOG_FAILED;
Log_SetTopicStatus       (CH1_OpinionInNewCamp, LOG_FAILED);
};
if (MIS_OkylQuest != LOG_SUCCESS)
{
MIS_OkylQuest = LOG_FAILED;
Log_SetTopicStatus       (CH1_OkylQuest, LOG_FAILED);
};
if (MIS_AlternativBanditoSCamp != LOG_SUCCESS)
{
MIS_AlternativBanditoSCamp = LOG_FAILED;
Log_SetTopicStatus       (CH1_AlternativBanditoSCamp, LOG_FAILED);
};
if (MIS_AwansJakoKret != LOG_SUCCESS)
{
MIS_AwansJakoKret = LOG_FAILED;
Log_SetTopicStatus       (CH1_AwansJakoKret, LOG_FAILED);
};
if (MIS_BANDITOS_CAMP != LOG_SUCCESS)
{
MIS_BANDITOS_CAMP = LOG_FAILED;
Log_SetTopicStatus       (CH1_BANDITOS_CAMP, LOG_FAILED);
};
if (MIS_BANDITOS_MORDRAG != LOG_SUCCESS)
{
MIS_BANDITOS_MORDRAG = LOG_FAILED;
Log_SetTopicStatus       (CH1_BANDITOS_MORDRAG, LOG_FAILED);
};

if (MIS_DraxTest != LOG_SUCCESS)
{
MIS_DraxTest = LOG_FAILED;
Log_SetTopicStatus       (CH1_DraxTest, LOG_FAILED);
B_LogEntry (CH1_DraxTest,"Zosta³em Cieniem, wiêc nie mam ju¿ szansy wykonaæ tego zadania.");
};

PrintScreen	("Anulowano zadania z pozosta³ych obozów! ", -1,-1,"font_new_10_red.tga",2);	
JoinOC = true;
B_SetRoguesToHostile ();
} else {
PrintScreen	("Zadania zosta³y ju¿ anulowane! ", -1,-1,"font_new_10_red.tga",2);	
};
};

func void HeroJoinToNC () 
{
if (JoinNC == false)
{
if (Npc_GetTrueGuild(hero) == GIL_SFB)
{
Log_CreateTopic            (CH1_JoinNC, LOG_MISSION);
Log_SetTopicStatus      	 (CH1_JoinNC, LOG_SUCCESS);
B_LogEntry					 (CH1_JoinNC,"Do³¹czaj¹c do Kretów sta³em siê jednoczeœnie cz³onkiem Nowego Obozu.");

/* Info: To zadanie wystêpuje w póŸniejszym etapie gry. 
if (MIS_OpinionInNewCamp != LOG_SUCCESS) 
{
MIS_OpinionInNewCamp = LOG_FAILED;
Log_CreateTopic            (CH1_OpinionInNewCamp, LOG_MISSION);
Log_SetTopicStatus       (CH1_OpinionInNewCamp, LOG_FAILED);
B_LogEntry			(CH1_OpinionInNewCamp,"Do³¹czaj¹c do Kretów sta³em siê jednoczeœnie cz³onkiem Nowego Obozu. Nie muszê ju¿ przechodziæ testów Najemników.");
};
};

if (MIS_DraxTest != LOG_SUCCESS)
{
MIS_DraxTest = LOG_FAILED;
Log_SetTopicStatus       (CH1_DraxTest, LOG_FAILED);
B_LogEntry 					(CH1_DraxTest,"Zosta³em Kretem, wiêc nie mam ju¿ szansy wykonaæ tego zadania dla Draxa.");
};

if (MIS_MineEnter != LOG_SUCCESS)
{
MIS_MineEnter = LOG_FAILED;
Log_SetTopicStatus       (Ch1_MineEnter, LOG_FAILED);
};
if (Thorus_MordragKo != LOG_SUCCESS) 
{
Log_SetTopicStatus       (CH1_MordragKO, LOG_FAILED);
B_LogEntry					 (CH1_MordragKO,"To zadanie nie jest dla mnie. Zosta³em Szkodnikiem");
};
if (MordragProblemOC != LOG_SUCCESS)
{
MordragProblemOC = LOG_FAILED;
Log_SetTopicStatus       (CH1_MordragProblemOC, LOG_FAILED);
};
if (BANMordragRaport != LOG_SUCCESS)
{
BANMordragRaport = LOG_FAILED;
Log_SetTopicStatus       (CH1_BANMordragRaport, LOG_FAILED);
};
Log_SetTopicStatus       (CH1_JoinOC, LOG_FAILED);
B_LogEntry				 (CH1_JoinOC,"Zosta³em Szkodnikiem. Do³¹czenie do Starego Obozu to nie jest dobry pomys³.");
if (Diego_BringList  != LOG_SUCCESS)
{
Log_SetTopicStatus       (CH1_BringList, LOG_FAILED);
};
//CH1_JoinPsi = LOG_FAILED;
Log_SetTopicStatus       (CH1_JoinPsi, LOG_FAILED);
if (MIS_OreInOM  != LOG_SUCCESS)
{
MIS_OreInOM = LOG_FAILED;
Log_SetTopicStatus       (CH1_OreInOM, LOG_FAILED);
};
if (MIS_EasyJoinOC  != LOG_SUCCESS)
{
MIS_EasyJoinOC = LOG_FAILED;
Log_SetTopicStatus       (CH1_EasyJoinOC, LOG_FAILED);
};
if (MIS_Kopacz  != LOG_SUCCESS)
{
MIS_Kopacz = LOG_FAILED;
Log_SetTopicStatus       (CH1_Kopacz, LOG_FAILED);
};
if (MIS_AwansCien  != LOG_SUCCESS)
{
MIS_AwansCien = LOG_FAILED;
Log_SetTopicStatus       (CH1_AwansCien, LOG_FAILED);
};
if (MIS_TestOc  != LOG_SUCCESS)
{
MIS_TestOc = LOG_FAILED;
Log_SetTopicStatus       (CH1_TestOc, LOG_FAILED);
};
if (MIS_AlternativBanditoSCamp  != LOG_SUCCESS)
{
MIS_AlternativBanditoSCamp = LOG_FAILED;
Log_SetTopicStatus       (CH1_AlternativBanditoSCamp, LOG_FAILED);
};
if (MIS_PropozycjaFlinta  != LOG_SUCCESS)
{
MIS_PropozycjaFlinta = LOG_FAILED;
Log_SetTopicStatus       (CH1_PropozycjaFlinta, LOG_FAILED);
};
if (MIS_FlintaPrzyjecie  != LOG_SUCCESS)
{
MIS_FlintaPrzyjecie = LOG_FAILED;
Log_SetTopicStatus       (CH1_FlintaPrzyjecie, LOG_FAILED);
};
if (MIS_SayOkylFlintDead  != LOG_SUCCESS)
{
MIS_SayOkylFlintDead = LOG_FAILED;
Log_SetTopicStatus       (CH1_SayOkylFlintDead, LOG_FAILED);
};
if (MIS_BANDITOS_CAMP  != LOG_SUCCESS)
{
MIS_BANDITOS_CAMP = LOG_FAILED;
Log_SetTopicStatus       (CH1_BANDITOS_CAMP, LOG_FAILED);
};
if (MIS_BANDITOS_MORDRAG  != LOG_SUCCESS)
{
MIS_BANDITOS_MORDRAG = LOG_FAILED;
Log_SetTopicStatus       (CH1_BANDITOS_MORDRAG, LOG_FAILED);
};
//PrintScreen	("Anulowano zadania z pozosta³ych obozów! ", -1,-1,"font_new_10_red.tga",2);	
JoinNC = true;
} else {
//PrintScreen	("Zadania zosta³y ju¿ anulowane! ", -1,-1,"font_new_10_red.tga",2);	
};
};

func void HeroJoinToBAN ()
{
if (JoinBA == false)
{
Log_SetTopicStatus       (CH1_JoinPsi, LOG_FAILED);

if (MIS_MineEnter != LOG_SUCCESS)
{
MIS_MineEnter = LOG_FAILED;
Log_SetTopicStatus       (Ch1_MineEnter, LOG_FAILED);
};
if (Thorus_MordragKo != LOG_SUCCESS)
{
Log_SetTopicStatus       (CH1_MordragKO, LOG_FAILED);
};

Log_SetTopicStatus       (CH1_JoinOC, LOG_FAILED);

if (Diego_BringList  != LOG_SUCCESS)
{
Log_SetTopicStatus       (CH1_BringList, LOG_FAILED);
};
if (MIS_EasyJoinOC != LOG_SUCCESS)
{
MIS_EasyJoinOC = LOG_FAILED;
Log_SetTopicStatus       (CH1_EasyJoinOC, LOG_FAILED);
};
if (MIS_Kopacz != LOG_SUCCESS)
{
MIS_Kopacz = LOG_FAILED;
Log_SetTopicStatus       (CH1_Kopacz, LOG_FAILED);
};
if (MIS_AwansCien != LOG_SUCCESS)
{
MIS_AwansCien = LOG_FAILED;
Log_SetTopicStatus       (CH1_AwansCien, LOG_FAILED);
};
if (MIS_TestOc != LOG_SUCCESS)
{
MIS_TestOc = LOG_FAILED;
Log_SetTopicStatus       (CH1_TestOc, LOG_FAILED);
};
if (MIS_OpinionInNewCamp != LOG_SUCCESS)
{
MIS_OpinionInNewCamp = LOG_FAILED;
Log_SetTopicStatus       (CH1_OpinionInNewCamp, LOG_FAILED);
};
if (MIS_OkylQuest != LOG_SUCCESS)
{
MIS_OkylQuest = LOG_FAILED;
Log_SetTopicStatus       (CH1_OkylQuest, LOG_FAILED);
};
if (MIS_AwansJakoKret != LOG_SUCCESS)
{
MIS_AwansJakoKret = LOG_FAILED;
Log_SetTopicStatus       (CH1_AwansJakoKret, LOG_FAILED);
};
if (MIS_PropozycjaFlinta != LOG_SUCCESS)
{
MIS_PropozycjaFlinta = LOG_FAILED;
Log_SetTopicStatus       (CH1_PropozycjaFlinta, LOG_FAILED);
};
if (MIS_FlintaPrzyjecie != LOG_SUCCESS)
{
MIS_FlintaPrzyjecie = LOG_FAILED;
Log_SetTopicStatus       (CH1_FlintaPrzyjecie, LOG_FAILED);
};
if (MIS_SayOkylFlintDead != LOG_SUCCESS)
{
MIS_SayOkylFlintDead = LOG_FAILED;
Log_SetTopicStatus       (CH1_SayOkylFlintDead, LOG_FAILED);
};

PrintScreen	("Anulowano zadania z pozosta³ych obozów! ", -1,-1,"font_new_10_red.tga",2);	
JoinBA = true;
} else {
PrintScreen	("Zadania zosta³y ju¿ anulowane! ", -1,-1,"font_new_10_red.tga",2);	
};
};
*/

func void HeroJoinToNC ()
{
if (MIS_OreInOM == LOG_RUNNING)
{
	MIS_OreInOM = LOG_FAILED;
	Log_SetTopicStatus	(CH1_OreInOM,LOG_FAILED);
    B_LogEntry    			(CH1_OreInOM,"Nie uda³o mi siê ukoñczyæ tego zadania. Jestem teraz cz³owiekiem Laresa i sprawy Bandytów mnie nie interesuj¹.");
};


};

func void HeroJoinToBAN ()
{
	if (Diego_BringList == LOG_RUNNING)
	{
	Diego_BringList = LOG_FAILED;
	Log_SetTopicStatus      (CH1_BringList, LOG_FAILED);
	B_LogEntry    			(CH1_BringList,"Raczej nie bêdê móg³ teraz udowodniæ swojej lojalnoœci wobec Starego Obozu. Wybra³em inn¹ œcie¿kê.");
	};
};

func void HeroJoinToPSI ()
{

	if (MIS_OreInOM == LOG_RUNNING)
	{
	MIS_OreInOM = LOG_FAILED;
	Log_SetTopicStatus	(CH1_OreInOM,LOG_FAILED);
    B_LogEntry    			(CH1_OreInOM,"Nie uda³o mi siê ukoñczyæ tego zadania. Nale¿ê do Bractwa, wiec nie mogê pracowaæ dla Bandytów.");
	};

	if (Diego_BringList == LOG_RUNNING)
	{
	Diego_BringList = LOG_FAILED;
	Log_SetTopicStatus      (CH1_BringList, LOG_FAILED);
	B_LogEntry    			(CH1_BringList,"Raczej nie bêdê móg³ teraz udowodniæ swojej lojalnoœci wobec Starego Obozu. Wybra³em inn¹ œcie¿kê.");
	};
};

func void HeroJoinToOC ()
{
	// Canceln der anderen Aufnahmen
	Log_CreateTopic		(CH1_JoinNC,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_JoinNC,	LOG_FAILED);
	B_LogEntry			(CH1_JoinNC,	"Nie mogê zostaæ przyjêty do gangu Laresa, gdy¿ jestem jednym z ludzi Gomeza!");
	
	Log_CreateTopic		(CH1_JoinPsi,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_JoinPsi,	LOG_FAILED);
	B_LogEntry			(CH1_JoinPsi,	"Stary Obóz bêdzie od dziœ moim domem. Bractwo Œni¹cego bêdzie musia³o obejœæ siê jakoœ beze mnie.");
	
	Log_CreateTopic		(CH1_BANDITOS_CAMP,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_BANDITOS_CAMP,	LOG_FAILED);
	B_LogEntry			(CH1_BANDITOS_CAMP,	"Banda Quentina bêdzie musia³a siê beze mnie obejœæ. Postanowi³em przy³¹czyæ siê do Gomeza.");
};