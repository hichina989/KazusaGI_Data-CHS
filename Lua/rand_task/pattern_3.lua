--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 6, monster_id = 21010201, pos = { x = 1.6, y = 0.1, z = 1.1 }, rot = { x = 0.0, y = 233.6, z = 0.0 }, level = 1, drop_tag = "丘丘人", disableWander = true, pose_id = 9012 },
	{ config_id = 7, monster_id = 21010201, pos = { x = -1.7, y = 0.1, z = -1.6 }, rot = { x = 0.0, y = 30.3, z = 0.0 }, level = 1, drop_tag = "丘丘人", disableWander = true, pose_id = 9012 },
	{ config_id = 8, monster_id = 21010201, pos = { x = 1.2, y = 0.2, z = -1.9 }, rot = { x = 0.0, y = 323.3, z = 0.0 }, level = 1, drop_tag = "丘丘人", disableWander = true, pose_id = 9012 },
	{ config_id = 20, monster_id = 21030101, pos = { x = -1.2, y = 0.0, z = 1.3 }, rot = { x = 0.0, y = 146.1, z = 0.0 }, level = 1, drop_tag = "丘丘萨满", disableWander = true, pose_id = 9012 },
	{ config_id = 21, monster_id = 21030201, pos = { x = -0.9, y = 0.0, z = 1.0 }, rot = { x = 0.0, y = 146.1, z = 0.0 }, level = 1, drop_tag = "丘丘萨满", disableWander = true, pose_id = 9012 },
	{ config_id = 22, monster_id = 21010601, pos = { x = 1.0, y = 0.1, z = -1.8 }, rot = { x = 0.0, y = 323.3, z = 0.0 }, level = 1, drop_tag = "丘丘人", disableWander = true, pose_id = 9003 },
	{ config_id = 3001, monster_id = 22010201, pos = { x = -1.2, y = 0.0, z = 1.2 }, rot = { x = 350.0, y = 141.0, z = 0.0 }, level = 1, drop_tag = "深渊法师", disableWander = true, affix = { 1007 }, isElite = true, pose_id = 9013 },
	{ config_id = 3002, monster_id = 22010101, pos = { x = -1.9, y = 0.0, z = 1.7 }, rot = { x = 0.0, y = 137.4, z = 0.0 }, level = 1, drop_tag = "深渊法师", disableWander = true, affix = { 1007 }, isElite = true, pose_id = 9013 },
	{ config_id = 3003, monster_id = 22010301, pos = { x = -1.1, y = 0.0, z = 0.8 }, rot = { x = 0.0, y = 135.7, z = 0.0 }, level = 1, drop_tag = "深渊法师", disableWander = true, pose_id = 9013 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
}

-- 区域
regions = {
	{ config_id = 23, shape = RegionShape.SPHERE, radius = 50, pos = { x = 0.0, y = 0.0, z = 0.0 } }
}

-- 触发器
triggers = {
	{ name = "ANY_MONSTER_DIE_4", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_4", action = "action_EVENT_ANY_MONSTER_DIE_4" },
	{ name = "ENTER_REGION_23", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_23", action = "action_EVENT_ENTER_REGION_23", forbid_guest = false }
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
		monsters = { 6, 7, 8, 20 },
		gadgets = { },
		regions = { 23 },
		triggers = { "ANY_MONSTER_DIE_4", "ENTER_REGION_23" },
		rand_weight = 100
	},
	{
		-- suite_id = 2,
		-- description = suite_2,
		monsters = { 6, 7, 21, 22 },
		gadgets = { },
		regions = { 23 },
		triggers = { "ANY_MONSTER_DIE_4", "ENTER_REGION_23" },
		rand_weight = 100
	},
	{
		-- suite_id = 3,
		-- description = suite_3,
		monsters = { 6, 7, 22, 3001 },
		gadgets = { },
		regions = { 23 },
		triggers = { "ANY_MONSTER_DIE_4", "ENTER_REGION_23" },
		rand_weight = 100
	},
	{
		-- suite_id = 4,
		-- description = suite_4,
		monsters = { 6, 7, 22, 3002 },
		gadgets = { },
		regions = { 23 },
		triggers = { "ANY_MONSTER_DIE_4", "ENTER_REGION_23" },
		rand_weight = 100
	},
	{
		-- suite_id = 5,
		-- description = suite_5,
		monsters = { 6, 7, 22, 3003 },
		gadgets = { },
		regions = { 23 },
		triggers = { "ANY_MONSTER_DIE_4", "ENTER_REGION_23" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_4(context, evt)
	-- 判断剩余怪物数量是否是0
	if ScriptLib.GetGroupMonsterCount(context) ~= 0 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_4(context, evt)
	-- 设置操作台选项
	
	    ScriptLib.FinishRandTask(context, 3, true)
	
	
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_23(context, evt)
	if evt.param1 ~= 23 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_23(context, evt)
	-- 调用提示id为 1110010 的提示UI，会显示在屏幕中央偏下位置，id索引自 ReminderData表格
	if 0 ~= ScriptLib.ShowReminder(context, 1110010) then
		return -1
	end
	
	return 0
end
