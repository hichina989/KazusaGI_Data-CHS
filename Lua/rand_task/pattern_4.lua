--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 23, monster_id = 20011301, pos = { x = -0.1, y = 0.0, z = 0.0 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, drop_tag = "史莱姆" },
	{ config_id = 25, monster_id = 20011201, pos = { x = 0.8, y = 0.2, z = -1.7 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, drop_tag = "史莱姆", pose_id = 901 },
	{ config_id = 26, monster_id = 20011201, pos = { x = 1.9, y = 0.1, z = -0.1 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, drop_tag = "史莱姆", pose_id = 901 },
	{ config_id = 27, monster_id = 20011201, pos = { x = -0.3, y = 0.0, z = 1.6 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, drop_tag = "史莱姆", pose_id = 901 },
	{ config_id = 4001, monster_id = 20010901, pos = { x = -0.2, y = 0.0, z = 0.4 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, drop_tag = "史莱姆", disableWander = true, affix = { 1007 }, isElite = true },
	{ config_id = 4002, monster_id = 20010801, pos = { x = -1.0, y = -0.1, z = 1.2 }, rot = { x = 0.0, y = 116.8, z = 0.0 }, level = 1, drop_tag = "史莱姆", pose_id = 901 },
	{ config_id = 4003, monster_id = 20010801, pos = { x = 1.0, y = 0.0, z = 0.6 }, rot = { x = 0.0, y = 225.2, z = 0.0 }, level = 1, drop_tag = "史莱姆", pose_id = 901 },
	{ config_id = 4004, monster_id = 20010801, pos = { x = 0.1, y = 0.2, z = -1.7 }, rot = { x = 3.9, y = 7.3, z = 3.9 }, level = 1, drop_tag = "史莱姆", pose_id = 901 },
	{ config_id = 4005, monster_id = 20010801, pos = { x = 1.3, y = 0.1, z = -0.8 }, rot = { x = 3.9, y = 327.6, z = 3.9 }, level = 1, drop_tag = "史莱姆", pose_id = 901 },
	{ config_id = 4006, monster_id = 20010601, pos = { x = 0.2, y = 0.0, z = -0.3 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, drop_tag = "史莱姆", disableWander = true, affix = { 1007 }, isElite = true },
	{ config_id = 4007, monster_id = 20010701, pos = { x = 0.3, y = 0.0, z = 1.6 }, rot = { x = 0.0, y = 240.9, z = 0.0 }, level = 1, drop_tag = "史莱姆", disableWander = true, affix = { 1007 }, isElite = true },
	{ config_id = 4008, monster_id = 20010501, pos = { x = -1.8, y = -0.1, z = 0.4 }, rot = { x = 7.3, y = 64.5, z = 0.0 }, level = 1, drop_tag = "史莱姆", pose_id = 901 },
	{ config_id = 4009, monster_id = 20010501, pos = { x = 0.6, y = -0.1, z = 0.9 }, rot = { x = 7.3, y = 64.5, z = 0.0 }, level = 1, drop_tag = "史莱姆", pose_id = 901 },
	{ config_id = 4010, monster_id = 20010501, pos = { x = -0.6, y = 0.1, z = -1.1 }, rot = { x = 7.3, y = 64.5, z = 0.0 }, level = 1, drop_tag = "史莱姆", pose_id = 901 },
	{ config_id = 4011, monster_id = 20010501, pos = { x = 1.7, y = 0.2, z = -1.4 }, rot = { x = 7.3, y = 64.5, z = 0.0 }, level = 1, drop_tag = "史莱姆", pose_id = 901 },
	{ config_id = 4012, monster_id = 20011101, pos = { x = 0.2, y = 0.0, z = 0.2 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, drop_tag = "史莱姆", disableWander = true, affix = { 1007 }, isElite = true },
	{ config_id = 4013, monster_id = 20011001, pos = { x = 1.5, y = 0.1, z = -0.4 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, drop_tag = "史莱姆", pose_id = 901 },
	{ config_id = 4014, monster_id = 20011001, pos = { x = -0.1, y = -0.1, z = 1.2 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, drop_tag = "史莱姆", pose_id = 901 },
	{ config_id = 4015, monster_id = 20011001, pos = { x = -1.2, y = 0.0, z = 0.2 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, drop_tag = "史莱姆", pose_id = 901 },
	{ config_id = 4016, monster_id = 20011001, pos = { x = 0.3, y = 0.1, z = -1.2 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, drop_tag = "史莱姆", pose_id = 901 },
	{ config_id = 4017, monster_id = 20011001, pos = { x = 1.1, y = 0.0, z = 1.4 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, drop_tag = "史莱姆", pose_id = 901 },
	{ config_id = 4018, monster_id = 20011201, pos = { x = -1.3, y = 0.0, z = -0.6 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, drop_tag = "史莱姆", pose_id = 901 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
}

-- 区域
regions = {
	{ config_id = 24, shape = RegionShape.SPHERE, radius = 50, pos = { x = -0.1, y = 0.0, z = 0.0 } }
}

-- 触发器
triggers = {
	{ name = "ANY_MONSTER_DIE_9", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_9", action = "action_EVENT_ANY_MONSTER_DIE_9" },
	{ name = "ENTER_REGION_24", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_24", action = "action_EVENT_ENTER_REGION_24", forbid_guest = false }
}

-- 变量
variables = {
}

--================================================================
-- 
-- 初始化配置
-- 
--================================================================

-- 初始化时创建
init_config = {
	suite = 1,
	end_suite = 0,
	rand_suite = true
}

--================================================================
-- 
-- 小组配置
-- 
--================================================================

suites = {
	{
		-- suite_id = 1,
		-- description = ,
		monsters = { 23, 25, 26, 27, 4018 },
		gadgets = { },
		regions = { 24 },
		triggers = { "ANY_MONSTER_DIE_9", "ENTER_REGION_24" },
		rand_weight = 100
	},
	{
		-- suite_id = 2,
		-- description = suite_2,
		monsters = { 4001, 4002, 4003, 4004, 4005 },
		gadgets = { },
		regions = { 24 },
		triggers = { "ANY_MONSTER_DIE_9", "ENTER_REGION_24" },
		rand_weight = 100
	},
	{
		-- suite_id = 3,
		-- description = suite_3,
		monsters = { 4006, 4007, 4008, 4009, 4010, 4011 },
		gadgets = { },
		regions = { 24 },
		triggers = { "ANY_MONSTER_DIE_9", "ENTER_REGION_24" },
		rand_weight = 100
	},
	{
		-- suite_id = 4,
		-- description = suite_4,
		monsters = { 4012, 4013, 4014, 4015, 4016, 4017 },
		gadgets = { },
		regions = { 24 },
		triggers = { "ANY_MONSTER_DIE_9", "ENTER_REGION_24" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_9(context, evt)
	-- 判断剩余怪物数量是否是0
	if ScriptLib.GetGroupMonsterCount(context) ~= 0 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_9(context, evt)
	-- 设置操作台选项
	
	    ScriptLib.FinishRandTask(context, 4, true)
	
	
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_24(context, evt)
	if evt.param1 ~= 24 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_24(context, evt)
	-- 调用提示id为 1110013 的提示UI，会显示在屏幕中央偏下位置，id索引自 ReminderData表格
	if 0 ~= ScriptLib.ShowReminder(context, 1110013) then
		return -1
	end
	
	return 0
end
