--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 4, monster_id = 21010101, pos = { x = -0.1, y = 0.0, z = -1.4 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, drop_tag = "丘丘人", disableWander = true, pose_id = 9016 },
	{ config_id = 16, monster_id = 21010101, pos = { x = -2.3, y = 0.2, z = 1.6 }, rot = { x = 0.0, y = 125.1, z = 0.0 }, level = 1, drop_tag = "丘丘人", disableWander = true, pose_id = 9016 },
	{ config_id = 17, monster_id = 21010701, pos = { x = 0.4, y = 0.4, z = 2.8 }, rot = { x = 0.0, y = 125.1, z = 0.0 }, level = 1, drop_tag = "丘丘人", disableWander = true, pose_id = 0 },
	{ config_id = 18, monster_id = 21010701, pos = { x = 1.6, y = 0.0, z = -0.1 }, rot = { x = 0.0, y = 91.0, z = 0.0 }, level = 1, drop_tag = "丘丘人", disableWander = true },
	{ config_id = 19, monster_id = 21010701, pos = { x = -1.8, y = 0.0, z = -0.1 }, rot = { x = 0.0, y = 286.0, z = 0.0 }, level = 1, drop_tag = "丘丘人", disableWander = true },
	{ config_id = 2001, monster_id = 21010601, pos = { x = -0.2, y = 0.0, z = -1.2 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, drop_tag = "丘丘人", disableWander = true, pose_id = 9016 },
	{ config_id = 2002, monster_id = 21020101, pos = { x = -2.3, y = 0.0, z = -1.6 }, rot = { x = 0.0, y = 49.3, z = 0.0 }, level = 2, drop_tag = "丘丘暴徒", disableWander = true, pose_id = 401 },
	{ config_id = 2003, monster_id = 21030101, pos = { x = -3.5, y = 0.1, z = 1.1 }, rot = { x = 0.0, y = 105.1, z = 0.0 }, level = 1, drop_tag = "丘丘萨满", disableWander = true }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 3, gadget_id = 70220013, pos = { x = -1.2, y = -0.1, z = 0.3 }, rot = { x = 0.0, y = 312.2, z = 0.0 }, level = 1, born_type = GadgetBornType.GROUND },
	{ config_id = 2004, gadget_id = 70220014, pos = { x = 0.2, y = -0.1, z = -0.1 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, born_type = GadgetBornType.GROUND }
}

-- 区域
regions = {
	{ config_id = 22, shape = RegionShape.SPHERE, radius = 50, pos = { x = -0.7, y = 1.5, z = -0.4 } },
	{ config_id = 31, shape = RegionShape.SPHERE, radius = 50, pos = { x = -0.4, y = 1.0, z = -0.2 } }
}

-- 触发器
triggers = {
	{ name = "ANY_MONSTER_DIE_6", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_6", action = "action_EVENT_ANY_MONSTER_DIE_6" },
	{ name = "ENTER_REGION_22", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_22", action = "action_EVENT_ENTER_REGION_22", forbid_guest = false },
	{ name = "ENTER_REGION_31", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_31", action = "action_EVENT_ENTER_REGION_31", forbid_guest = false }
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
		monsters = { 4, 16, 17 },
		gadgets = { 3, 2004 },
		regions = { 22, 31 },
		triggers = { "ANY_MONSTER_DIE_6", "ENTER_REGION_22", "ENTER_REGION_31" },
		rand_weight = 100
	},
	{
		-- suite_id = 2,
		-- description = suite_2,
		monsters = { 4, 18, 19 },
		gadgets = { },
		regions = { },
		triggers = { "ANY_MONSTER_DIE_6" },
		rand_weight = 100
	},
	{
		-- suite_id = 3,
		-- description = suite_3,
		monsters = { 2001, 2002 },
		gadgets = { },
		regions = { },
		triggers = { "ANY_MONSTER_DIE_6" },
		rand_weight = 100
	},
	{
		-- suite_id = 4,
		-- description = suite_4,
		monsters = { 2001, 2002, 2003 },
		gadgets = { },
		regions = { },
		triggers = { "ANY_MONSTER_DIE_6" },
		rand_weight = 100
	},
	{
		-- suite_id = 5,
		-- description = suite_5,
		monsters = { 4, 18, 19, 2003 },
		gadgets = { },
		regions = { },
		triggers = { "ANY_MONSTER_DIE_6" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_6(context, evt)
	-- 判断剩余怪物数量是否是0
	if ScriptLib.GetGroupMonsterCount(context) ~= 0 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_6(context, evt)
	-- 设置操作台选项
	
	    ScriptLib.FinishRandTask(context, 2, true)
	
	
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_22(context, evt)
	if evt.param1 ~= 22 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_22(context, evt)
	-- 调用提示id为 1110007 的提示UI，会显示在屏幕中央偏下位置，id索引自 ReminderData表格
	if 0 ~= ScriptLib.ShowReminder(context, 1110007) then
		return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_31(context, evt)
	if evt.param1 ~= 31 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_31(context, evt)
	-- 调用提示id为 1110027 的提示UI，会显示在屏幕中央偏下位置，id索引自 ReminderData表格
	if 0 ~= ScriptLib.ShowReminder(context, 1110027) then
		return -1
	end
	
	return 0
end
