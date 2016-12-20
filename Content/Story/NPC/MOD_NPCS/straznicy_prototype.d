PROTOTYPE Mst_Default_gardist(C_NPC) 
{ 
name = "Strażnik"; 
guild = GIL_GRD; 
aivar[AIV_MM_REAL_ID] = ID_BLACKGOBBO; 
level = 15; 
//------------------------------------------------------------------ 
attribute [ATR_STRENGTH] = 100; 
attribute [ATR_DEXTERITY] = 100; 

attribute [ATR_HITPOINTS_MAX] = 350; 
attribute [ATR_HITPOINTS] = 350; 

attribute [ATR_MANA_MAX] = 0; 
attribute [ATR_MANA] = 0; 

//------------------------------------------------------------------ 
fight_tactic = FAI_HUMAN_STRONG; 
//------------------------------------------------------------------ 

//-------- Talente -------- 

Npc_SetTalentSkill (self,NPC_TALENT_1H,2); 
Npc_SetTalentSkill (self,NPC_TALENT_CROSSBOW,2); 

//-------- inventory -------- 

EquipItem (self, ItMw_1H_Sword_04); 
EquipItem (self, ItRw_Crossbow_02_Z); 
CreateInvItems (self, ItAmBolt, 100); 
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
func void Set_gardist1_Visuals() 
{ 
Mdl_SetVisual (self,"HUMANS.MDS"); 
Mdl_ApplyOverlayMds (self,"Humans_Relaxed.mds"); 
// body mesh, head mesh, hairmesh, face-tex, hair-tex, skin 
Mdl_SetVisualBody (self,"hum_body_Naked0",0, 2,"Hum_Head_Pony", 8, 1, GRD_ARMOR_M); 
}; 
//------------------------------------------------------------------ 
func void Set_gardist2_Visuals() 
{ 
//-------- visuals -------- 
// animations 
Mdl_SetVisual (self,"HUMANS.MDS"); 
Mdl_ApplyOverlayMds (self,"Humans_Militia.mds"); 
// body mesh ,bdytex,skin,head mesh ,headtex,teethtex,ruestung 
Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 1,"Hum_Head_Pony", 13, 1, GRD_ARMOR_M); 

}; 
//------------------------------------------------------------------ 
func void Set_gardist3_Visuals() 
{ 
//-------- visuals -------- 
// animations 
Mdl_SetVisual (self,"HUMANS.MDS"); 
Mdl_ApplyOverlayMds (self,"Humans_Relaxed.mds"); 
// body mesh ,bdytex,skin,head mesh ,headtex,teethtex,ruestung 
Mdl_SetVisualBody (self,"hum_body_Naked0", 1 , 1 ,"Hum_Head_Psionic", 33 , 2, grd_ARMOR_M); 

}; 
//------------------------------------------------------------------ 
func void Set_gardist4_Visuals() 
{ 
//-------- visuals -------- 
// animations 
Mdl_SetVisual (self,"HUMANS.MDS"); 
Mdl_ApplyOverlayMds (self,"Humans_Relaxed.mds"); 
// body mesh, head mesh, hairmesh, face-tex, hair-tex, skin 
Mdl_SetVisualBody (self,"hum_body_Naked0",0,3,"Hum_Head_FatBald", 6, 1, grd_ARMOR_M); 

}; 
//------------------------------------------------------------------ 
func void Set_gardist5_Visuals() 
{ 
//-------- visuals -------- 
// animations 
Mdl_SetVisual (self,"HUMANS.MDS"); 
Mdl_ApplyOverlayMds (self,"Humans_Militia.mds"); 
// body mesh, head mesh, hairmesh, face-tex, hair-tex, skin 
Mdl_SetVisualBody (self,"hum_body_Naked0", 1, 1,"Hum_Head_Pony", 48, 1,grd_ARMOR_M); 

}; 
//------------------------------------------------------------------ 
func void Set_gardist6_Visuals() 
{ 
//-------- visuals -------- 
// animations 
Mdl_SetVisual (self,"HUMANS.MDS"); 
Mdl_ApplyOverlayMds (self,"Humans_Relaxed.mds"); 
// body mesh ,bdytex,skin,head mesh ,headtex,teethtex,ruestung 
Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 0,"Hum_Head_Bald", 14, 2, grd_ARMOR_M); 

}; 
//------------------------------------------------------------------ 
func void Set_gardist7_Visuals() 
{ 
//-------- visuals -------- 
// animations 
Mdl_SetVisual (self,"HUMANS.MDS"); 
Mdl_ApplyOverlayMds (self,"Humans_Mage.mds"); 
// body mesh ,bdytex,skin,head mesh ,headtex,teethtex,ruestung 
Mdl_SetVisualBody (self,"hum_body_Naked0", 1, 1 ,"Hum_Head_Bald", 117, 2, grd_ARMOR_M); 

}; 
//------------------------------------------------------------------ 
func void Set_gardist8_Visuals() 
{ 
//-------- visuals -------- 
// animations 
Mdl_SetVisual (self,"HUMANS.MDS"); 
Mdl_ApplyOverlayMds (self,"Humans_Tired.mds"); 
// body mesh, head mesh, hairmesh, face-tex, hair-tex, skin 
Mdl_SetVisualBody (self,"hum_body_Naked0",2,1,"Hum_Head_Pony", 0, 1, grd_ARMOR_M); 

}; 
//------------------------------------------------------------------ 
func void Set_gardist9_Visuals() 
{ 
//-------- visuals -------- 
// animations 
Mdl_SetVisual (self,"HUMANS.MDS"); 
Mdl_ApplyOverlayMds (self,"Humans_Militia.mds"); 
// body mesh ,bdytex,skin,head mesh ,headtex,teethtex,ruestung 
Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 1,"Hum_Head_Bald", 19, 1,grd_ARMOR_M); 
EquipItem (self, ItMw_2H_Sword_Light_02); 

}; 
//------------------------------------------------------------------ 
func void Set_gardist10_Visuals() 
{ 
//-------- visuals -------- 
// animations 
Mdl_SetVisual (self,"HUMANS.MDS"); 
// body mesh ,bdytex,skin,head mesh ,headtex,teethtex,ruestung 
Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 1, "Hum_Head_Psionic",8, 1, grd_ARMOR_M); 

EquipItem (self, ItMw_2H_Sword_Light_01); 

}; 



/************************************************************************* 
** Black Gremlin Mace ** 
*************************************************************************/ 

INSTANCE gardist1 (Mst_Default_gardist) 
{ 
Set_gardist1_Visuals(); 

}; 
INSTANCE gardist2 (Mst_Default_gardist) 
{ 
Set_gardist2_Visuals(); 

}; 
INSTANCE gardist3 (Mst_Default_gardist) 
{ 
Set_gardist3_Visuals(); 

}; 
INSTANCE gardist4 (Mst_Default_gardist) 
{ 
Set_gardist4_Visuals(); 

}; 
INSTANCE gardist5 (Mst_Default_gardist) 
{ 
Set_gardist5_Visuals(); 

}; 
INSTANCE gardist6 (Mst_Default_gardist) 
{ 
Set_gardist6_Visuals(); 
}; 

INSTANCE gardist7 (Mst_Default_gardist) 
{ 
Set_gardist7_Visuals(); 
}; 

INSTANCE gardist8 (Mst_Default_gardist) 
{ 
Set_gardist8_Visuals(); 
}; 

INSTANCE gardist9 (Mst_Default_gardist) 
{ 
name = "Herszt bandytów"; 

Set_gardist9_Visuals(); 
}; 

INSTANCE gardist0 (Mst_Default_gardist) 
{ 
Set_gardist4_Visuals(); 
}; 
INSTANCE gardist10 (Mst_Default_gardist) 
{ 
name = "Generał bandytów"; 
Set_gardist10_Visuals(); 
}; 

INSTANCE gardist11 (Mst_Default_gardist) 
{ 
Set_gardist3_Visuals(); 
}; 

INSTANCE gardist12 (Mst_Default_gardist) 
{ 
Set_gardist6_Visuals(); 
}; 

INSTANCE gardist13 (Mst_Default_gardist) 
{ 
Set_gardist4_Visuals(); 
}; 

INSTANCE gardist14 (Mst_Default_gardist) 
{ 
Set_gardist2_Visuals(); 
}; 
INSTANCE gardist15 (Mst_Default_gardist) 
{ 
Set_gardist10_Visuals(); 
}; 


