 func void B_Story_Aidan_Quest_CH3 ()
 {
	MIS_Aidan_Quest = LOG_RUNNING;
    Log_CreateTopic            (CH3_Aidan_Quest, LOG_MISSION);
    Log_SetTopicStatus       (CH3_Aidan_Quest, LOG_RUNNING);
    B_LogEntry                     (CH3_Aidan_Quest,"Aidan poprosi� mnie, bym odzyska� jego sprz�t �owiecki, kt�ry niegdy� po�yczy� jego zaginiony towarzysz. Podobno ukry� te rzeczy w jaskini, kt�r� znajd� w w�wozie prowadz�cym do starych orkowych ruin. ");
	Wld_InsertNpc				(Snapper,"OW_CAVE2_SNAPPER_MOVEMENT2");
	Wld_InsertNpc				(Snapper,"OW_CAVE2_SNAPPER_MOVEMENT2");
	Wld_InsertNpc				(Snapper,"OW_CAVE2_SNAPPER_MOVEMENT");
};