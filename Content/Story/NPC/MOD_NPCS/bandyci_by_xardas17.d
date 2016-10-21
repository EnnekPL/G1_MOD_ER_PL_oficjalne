/************************************************************************* 
** Bandit Prototype ** 
*************************************************************************/ 

PROTOTYPE Mst_Default_bandyta(C_NPC) 
{ 
name = "Bandyta"; 
guild = GIL_GOBBO; 
aivar[AIV_MM_REAL_ID] = ID_BLACKGOBBO; 
level = 10; 
//------------------------------------------------------------------ 
attribute [ATR_STRENGTH] = 80; 
attribute [ATR_DEXTERITY] = 60; 

attribute [ATR_HITPOINTS_MAX] = 230; 
attribute [ATR_HITPOINTS] = 230; 

attribute [ATR_MANA_MAX] = 0; 
attribute [ATR_MANA] = 0; 

//------------------------------------------------------------------ 
fight_tactic = FAI_HUMAN_STRONG; 
//------------------------------------------------------------------ 

//-------- Talente -------- 

Npc_SetTalentSkill (self,NPC_TALENT_1H,4); 
Npc_SetTalentSkill (self,NPC_TALENT_BOW,1); 

//-------- inventory -------- 

EquipItem (self, ItMw_1H_Sword_02); 
EquipItem (self, ItRw_Bow_Long_01); 
CreateInvItems (self, ItAmArrow, 45); 
CreateInvItem (self, ItLsTorch); 
CreateInvItem (self, ItFo_Potion_Health_02); 

//------------------------------------------------------------------ 

senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL; 
senses_range = 3000; // 30m 

aivar[AIV_MM_Behaviour] = PACKHUNTER; 

aivar[AIV_MM_PercRange] = 1500; 
aivar[AIV_MM_DrohRange] = 1200; 
aivar[AIV_MM_AttackRange] = 700; 
aivar[AIV_MM_DrohTime] = 4; 
aivar[AIV_MM_FollowTime] = 10; 
aivar[AIV_MM_FollowInWater] = FALSE; 
//------------------------------------------------------------------ 
start_aistate = ZS_MM_AllScheduler; 

aivar[AIV_MM_RestStart] = OnlyRoutine; 
}; 
//------------------------------------------------------------------ 
func void Set_bandyta1_Visuals() 
{ 
Mdl_SetVisual (self,"HUMANS.MDS"); 
Mdl_ApplyOverlayMds (self,"Humans_Relaxed.mds"); 
// body mesh, head mesh, hairmesh, face-tex, hair-tex, skin 
Mdl_SetVisualBody (self,"hum_body_Naked0",0, 2,"Hum_Head_Pony", 8, 1, BAU_ARMOR_M); 
}; 
//------------------------------------------------------------------ 
func void Set_bandyta2_Visuals() 
{ 
//-------- visuals -------- 
// animations 
Mdl_SetVisual (self,"HUMANS.MDS"); 
Mdl_ApplyOverlayMds (self,"Humans_Militia.mds"); 
// body mesh ,bdytex,skin,head mesh ,headtex,teethtex,ruestung 
Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 1,"Hum_Head_Pony", 13, 1, BAU_ARMOR_M); 

}; 
//------------------------------------------------------------------ 
func void Set_bandyta3_Visuals() 
{ 
//-------- visuals -------- 
// animations 
Mdl_SetVisual (self,"HUMANS.MDS"); 
Mdl_ApplyOverlayMds (self,"Humans_Relaxed.mds"); 
// body mesh ,bdytex,skin,head mesh ,headtex,teethtex,ruestung 
Mdl_SetVisualBody (self,"hum_body_Naked0", 1 , 1 ,"Hum_Head_Psionic", 33 , 2, BAU_ARMOR_M); 

}; 
//------------------------------------------------------------------ 
func void Set_bandyta4_Visuals() 
{ 
//-------- visuals -------- 
// animations 
Mdl_SetVisual (self,"HUMANS.MDS"); 
Mdl_ApplyOverlayMds (self,"Humans_Relaxed.mds"); 
// body mesh, head mesh, hairmesh, face-tex, hair-tex, skin 
Mdl_SetVisualBody (self,"hum_body_Naked0",0,3,"Hum_Head_FatBald", 6, 1, BAU_ARMOR_M); 

}; 
//------------------------------------------------------------------ 
func void Set_bandyta5_Visuals() 
{ 
//-------- visuals -------- 
// animations 
Mdl_SetVisual (self,"HUMANS.MDS"); 
Mdl_ApplyOverlayMds (self,"Humans_Militia.mds"); 
// body mesh, head mesh, hairmesh, face-tex, hair-tex, skin 
Mdl_SetVisualBody (self,"hum_body_Naked0", 1, 1,"Hum_Head_Pony", 48, 1,BAU_ARMOR_M); 

}; 
//------------------------------------------------------------------ 
func void Set_bandyta6_Visuals() 
{ 
//-------- visuals -------- 
// animations 
Mdl_SetVisual (self,"HUMANS.MDS"); 
Mdl_ApplyOverlayMds (self,"Humans_Relaxed.mds"); 
// body mesh ,bdytex,skin,head mesh ,headtex,teethtex,ruestung 
Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 0,"Hum_Head_Bald", 14, 2, BAU_ARMOR_M); 

}; 
//------------------------------------------------------------------ 
func void Set_bandyta7_Visuals() 
{ 
//-------- visuals -------- 
// animations 
Mdl_SetVisual (self,"HUMANS.MDS"); 
Mdl_ApplyOverlayMds (self,"Humans_Mage.mds"); 
// body mesh ,bdytex,skin,head mesh ,headtex,teethtex,ruestung 
Mdl_SetVisualBody (self,"hum_body_Naked0", 1, 1 ,"Hum_Head_Bald", 117, 2, BAU_ARMOR_M); 

}; 
//------------------------------------------------------------------ 
func void Set_bandyta8_Visuals() 
{ 
//-------- visuals -------- 
// animations 
Mdl_SetVisual (self,"HUMANS.MDS"); 
Mdl_ApplyOverlayMds (self,"Humans_Tired.mds"); 
// body mesh, head mesh, hairmesh, face-tex, hair-tex, skin 
Mdl_SetVisualBody (self,"hum_body_Naked0",2,1,"Hum_Head_Pony", 0, 1, BAU_ARMOR_M); 

}; 
//------------------------------------------------------------------ 
func void Set_bandyta9_Visuals() 
{ 
//-------- visuals -------- 
// animations 
Mdl_SetVisual (self,"HUMANS.MDS"); 
Mdl_ApplyOverlayMds (self,"Humans_Militia.mds"); 
// body mesh ,bdytex,skin,head mesh ,headtex,teethtex,ruestung 
Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 1,"Hum_Head_Bald", 19, 1,BAU_ARMOR_M); 
EquipItem (self, ItMw_2H_Sword_Light_02); 

}; 
//------------------------------------------------------------------ 
func void Set_bandyta10_Visuals() 
{ 
//-------- visuals -------- 
// animations 
Mdl_SetVisual (self,"HUMANS.MDS"); 
// body mesh ,bdytex,skin,head mesh ,headtex,teethtex,ruestung 
Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 1, "Hum_Head_Psionic",8, 1, BAU_ARMOR_M); 

EquipItem (self, ItMw_2H_Sword_Light_01); 

}; 



/************************************************************************* 
** Black Gremlin Mace ** 
*************************************************************************/ 

INSTANCE bandyta1 (Mst_Default_bandyta) 
{ 
Set_bandyta1_Visuals(); 

}; 
INSTANCE bandyta2 (Mst_Default_bandyta) 
{ 
Set_bandyta2_Visuals(); 

}; 
INSTANCE bandyta3 (Mst_Default_bandyta) 
{ 
Set_bandyta3_Visuals(); 

}; 
INSTANCE bandyta4 (Mst_Default_bandyta) 
{ 
Set_bandyta4_Visuals(); 

}; 
INSTANCE bandyta5 (Mst_Default_bandyta) 
{ 
Set_bandyta5_Visuals(); 

}; 
INSTANCE bandyta6 (Mst_Default_bandyta) 
{ 
Set_bandyta6_Visuals(); 
}; 

INSTANCE bandyta7 (Mst_Default_bandyta) 
{ 
Set_bandyta7_Visuals(); 
}; 

INSTANCE bandyta8 (Mst_Default_bandyta) 
{ 
Set_bandyta8_Visuals(); 
}; 

INSTANCE bandyta9 (Mst_Default_bandyta) 
{ 
name = "Dowódca napadu"; 

Set_bandyta9_Visuals(); 
}; 

INSTANCE bandyta0 (Mst_Default_bandyta) 
{ 
Set_bandyta4_Visuals(); 
}; 
INSTANCE bandyta10 (Mst_Default_bandyta) 
{ 
name = "Genera³ bandytów"; 
Set_bandyta10_Visuals(); 
}; 

INSTANCE bandyta11 (Mst_Default_bandyta) 
{ 
Set_bandyta3_Visuals(); 
}; 

INSTANCE bandyta12 (Mst_Default_bandyta) 
{ 
Set_bandyta6_Visuals(); 
}; 

INSTANCE bandyta13 (Mst_Default_bandyta) 
{ 
name = "Bandyta - strzelec";
Set_bandyta4_Visuals(); 
fight_tactic = FAI_HUMAN_RANGED; 
attribute [ATR_STRENGTH] = 50; 
attribute [ATR_DEXTERITY] = 80; 
}; 

INSTANCE bandyta14 (Mst_Default_bandyta) 
{ 
name = "Bandyta - strzelec";
Set_bandyta2_Visuals(); 
fight_tactic = FAI_HUMAN_RANGED; 
attribute [ATR_STRENGTH] = 50; 
attribute [ATR_DEXTERITY] = 78; 
}; 
INSTANCE bandyta15 (Mst_Default_bandyta) 
{ 
name = "Bandyta - strzelec";
fight_tactic = FAI_HUMAN_RANGED; 
Set_bandyta10_Visuals(); 
attribute [ATR_STRENGTH] = 50; 
attribute [ATR_DEXTERITY] = 75; 
}; 


