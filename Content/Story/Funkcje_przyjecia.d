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
B_LogEntry				 (CH1_MordragKO,"Przy��czy�em si� do Obozu Bractwa. Mog� od�o�y� t� spraw� na bok.");
};
Log_SetTopicStatus       (CH1_JoinOC, LOG_FAILED);
B_LogEntry				 (CH1_JoinOC,"Przy��czy�em si� do Obozu Bractwa. Mog� od�o�y� t� spraw� na bok.");
if (Diego_BringList  != LOG_SUCCESS)
{
Log_SetTopicStatus       (CH1_BringList, LOG_FAILED);
B_LogEntry				 (CH1_BringList,"Przy��czy�em si� do Obozu Bractwa. Mog� od�o�y� t� spraw� na bok.");
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
B_LogEntry (CH1_DraxTest,"Do��czy�em do ");
};

PrintScreen	("Anulowano zadania z pozosta�ych oboz�w! ", -1,-1,"font_new_10_red.tga",2);	
JoinPC = true;
} else {
PrintScreen	("Zadania zosta�y ju� anulowane! ", -1,-1,"font_new_10_red.tga",2);	
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
B_LogEntry (CH1_DraxTest,"Zosta�em Cieniem, wi�c nie mam ju� szansy wykona� tego zadania.");
};

PrintScreen	("Anulowano zadania z pozosta�ych oboz�w! ", -1,-1,"font_new_10_red.tga",2);	
JoinOC = true;
B_SetRoguesToHostile ();
} else {
PrintScreen	("Zadania zosta�y ju� anulowane! ", -1,-1,"font_new_10_red.tga",2);	
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
B_LogEntry					 (CH1_JoinNC,"Do��czaj�c do Kret�w sta�em si� jednocze�nie cz�onkiem Nowego Obozu.");

/* Info: To zadanie wyst�puje w p�niejszym etapie gry. 
if (MIS_OpinionInNewCamp != LOG_SUCCESS) 
{
MIS_OpinionInNewCamp = LOG_FAILED;
Log_CreateTopic            (CH1_OpinionInNewCamp, LOG_MISSION);
Log_SetTopicStatus       (CH1_OpinionInNewCamp, LOG_FAILED);
B_LogEntry			(CH1_OpinionInNewCamp,"Do��czaj�c do Kret�w sta�em si� jednocze�nie cz�onkiem Nowego Obozu. Nie musz� ju� przechodzi� test�w Najemnik�w.");
};
};

if (MIS_DraxTest != LOG_SUCCESS)
{
MIS_DraxTest = LOG_FAILED;
Log_SetTopicStatus       (CH1_DraxTest, LOG_FAILED);
B_LogEntry 					(CH1_DraxTest,"Zosta�em Kretem, wi�c nie mam ju� szansy wykona� tego zadania dla Draxa.");
};

if (MIS_MineEnter != LOG_SUCCESS)
{
MIS_MineEnter = LOG_FAILED;
Log_SetTopicStatus       (Ch1_MineEnter, LOG_FAILED);
};
if (Thorus_MordragKo != LOG_SUCCESS) 
{
Log_SetTopicStatus       (CH1_MordragKO, LOG_FAILED);
B_LogEntry					 (CH1_MordragKO,"To zadanie nie jest dla mnie. Zosta�em Szkodnikiem");
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
B_LogEntry				 (CH1_JoinOC,"Zosta�em Szkodnikiem. Do��czenie do Starego Obozu to nie jest dobry pomys�.");
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
//PrintScreen	("Anulowano zadania z pozosta�ych oboz�w! ", -1,-1,"font_new_10_red.tga",2);	
JoinNC = true;
} else {
//PrintScreen	("Zadania zosta�y ju� anulowane! ", -1,-1,"font_new_10_red.tga",2);	
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

PrintScreen	("Anulowano zadania z pozosta�ych oboz�w! ", -1,-1,"font_new_10_red.tga",2);	
JoinBA = true;
} else {
PrintScreen	("Zadania zosta�y ju� anulowane! ", -1,-1,"font_new_10_red.tga",2);	
};
};
*/

func void HeroJoinToNC ()
{
if (MIS_OreInOM == LOG_RUNNING)
{
	MIS_OreInOM = LOG_FAILED;
	Log_SetTopicStatus	(CH1_OreInOM,LOG_FAILED);
    B_LogEntry    			(CH1_OreInOM,"Nie uda�o mi si� uko�czy� tego zadania. Jestem teraz cz�owiekiem Laresa i sprawy Bandyt�w mnie nie interesuj�.");
};


};

func void HeroJoinToBAN ()
{
	if (Diego_BringList == LOG_RUNNING)
	{
	Diego_BringList = LOG_FAILED;
	Log_SetTopicStatus      (CH1_BringList, LOG_FAILED);
	B_LogEntry    			(CH1_BringList,"Raczej nie b�d� m�g� teraz udowodni� swojej lojalno�ci wobec Starego Obozu. Wybra�em inn� �cie�k�.");
	};
};

func void HeroJoinToPSI ()
{

	if (MIS_OreInOM == LOG_RUNNING)
	{
	MIS_OreInOM = LOG_FAILED;
	Log_SetTopicStatus	(CH1_OreInOM,LOG_FAILED);
    B_LogEntry    			(CH1_OreInOM,"Nie uda�o mi si� uko�czy� tego zadania. Nale�� do Bractwa, wiec nie mog� pracowa� dla Bandyt�w.");
	};

	if (Diego_BringList == LOG_RUNNING)
	{
	Diego_BringList = LOG_FAILED;
	Log_SetTopicStatus      (CH1_BringList, LOG_FAILED);
	B_LogEntry    			(CH1_BringList,"Raczej nie b�d� m�g� teraz udowodni� swojej lojalno�ci wobec Starego Obozu. Wybra�em inn� �cie�k�.");
	};
};

func void HeroJoinToOC ()
{
	// Canceln der anderen Aufnahmen
	Log_CreateTopic		(CH1_JoinNC,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_JoinNC,	LOG_FAILED);
	B_LogEntry			(CH1_JoinNC,	"Nie mog� zosta� przyj�ty do gangu Laresa, gdy� jestem jednym z ludzi Gomeza!");
	
	Log_CreateTopic		(CH1_JoinPsi,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_JoinPsi,	LOG_FAILED);
	B_LogEntry			(CH1_JoinPsi,	"Stary Ob�z b�dzie od dzi� moim domem. Bractwo �ni�cego b�dzie musia�o obej�� si� jako� beze mnie.");
	
	Log_CreateTopic		(CH1_BANDITOS_CAMP,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_BANDITOS_CAMP,	LOG_FAILED);
	B_LogEntry			(CH1_BANDITOS_CAMP,	"Banda Quentina b�dzie musia�a si� beze mnie obej��. Postanowi�em przy��czy� si� do Gomeza.");
};