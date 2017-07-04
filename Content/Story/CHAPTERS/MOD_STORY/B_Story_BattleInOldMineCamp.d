func void B_Story_BattleInOldMineCamp ()
{
B_KillNpc			(GRD_8020_Stra¿nik);

B_ExchangeRoutine	(GRD_7006_Joel, "obrona");
B_KillNpc			(GRD_7006_Joel);	

B_ExchangeRoutine	(GRD_7005_Spike, "ded");
B_KillNpc			(GRD_7005_Spike);	

B_ExchangeRoutine	(VLK_7011_kopacz , "ded");
B_KillNpc			(VLK_7011_kopacz );	

B_ExchangeRoutine	(GRD_7002_KUCHARZ, "ded");
B_KillNpc			(GRD_7002_KUCHARZ);

B_ExchangeRoutine	(GRD_7007_Mirzo, "obrona");
B_KillNpc			(GRD_7007_Mirzo);

B_ExchangeRoutine	(GRD_2017_Artch, "ded");
B_KillNpc			(GRD_2017_Artch);

B_ExchangeRoutine	(STT_316_Schatten, "ded");
B_KillNpc			(STT_316_Schatten);

B_ExchangeRoutine	(GRD_241_Gardist, "ded");
B_KillNpc			(GRD_241_Gardist);

B_ExchangeRoutine	(STT_306_Schatten, "ded");
B_KillNpc			(STT_306_Schatten);

B_ExchangeRoutine	(STT_314_Schatten, "ded");
B_KillNpc			(STT_314_Schatten);

if (!Npc_knowsinfo (hero, DIA_Abel_Win))
{
B_KillNpc			(VLK_7003_Abel);
};

B_ExchangeRoutine	(GRD_7001_Artegor, "stay");
B_ChangeGuild    (GRD_7001_Artegor,GIL_NONE);  
B_SetPermAttitude	(GRD_7001_Artegor,	ATT_NEUTRAL);
};