--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 36, monster_id = 28020301, pos = { x = 0.1, y = 0.0, z = 0.3 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, disableWander = true },
	{ config_id = 37, monster_id = 21010101, pos = { x = -1.2, y = 0.3, z = 2.0 }, rot = { x = 0.0, y = 133.3, z = 0.0 }, level = 1, drop_tag = "丘丘人", disableWander = true, pose_id = 9010 },
	{ config_id = 38, monster_id = 21010101, pos = { x = 2.2, y = 0.0, z = -0.1 }, rot = { x = 0.0, y = 288.9, z = 0.0 }, level = 1, drop_tag = "丘丘人", disableWander = true, pose_id = 9010 },
	{ config_id = 7001, monster_id = 21010201, pos = { x = 0.5, y = 0.2, z = 2.6 }, rot = { x = 0.0, y = 190.6, z = 0.0 }, level = 1, drop_tag = "丘丘人", disableWander = true, pose_id = 9010 },
	{ config_id = 7002, monster_id = 21010201, pos = { x = 2.1, y = 0.0, z = 1.0 }, rot = { x = 0.0, y = 261.4, z = 0.0 }, level = 1, drop_tag = "丘丘人", disableWander = true, pose_id = 0 },
	{ config_id = 7003, monster_id = 21010201, pos = { x = -1.6, y = 0.2, z = 0.9 }, rot = { x = 0.0, y = 119.2, z = 0.0 }, level = 1, drop_tag = "丘丘人", disableWander = true, pose_id = 0 },
	{ config_id = 7004, monster_id = 21010201, pos = { x = 0.0, y = 0.0, z = -1.6 }, rot = { x = 0.0, y = 1.2, z = 0.0 }, level = 1, drop_tag = "丘丘人", disableWander = true, pose_id = 9010 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
}

-- 区域
regions = {
	{ config_id = 27, shape = RegionShape.SPHERE, radius = 50, pos = { x = 0.5, y = 0.0, z = 0.4 } }
}

-- 触发器
triggers = {
	{ name = "ANY_MONSTER_DIE_20", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_20", action = "action_EVENT_ANY_MONSTER_DIE_20" },
	{ name = "ENTER_REGION_27", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_27", action = "action_EVENT_ENTER_REGION_27", forbid_guest = false }
}

-- 变量
variables = {
	{ name = "iskill37", value = 0, no_refresh = false },
	{ name = "iskill38", value = 0, no_refresh = false }
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
		monsters = { 36, 37, 38 },
		gadgets = { },
		regions = { 27 },
		triggers = { "ANY_MONSTER_DIE_20", "ENTER_REGION_27" },
		rand_weight = 100
	},
	{
		-- suite_id = 2,
		-- description = suite_2,
		monsters = { 36, 7001, 7002, 7003, 7004 },
		gadgets = { },
		regions = { 27 },
		triggers = { "ANY_MONSTER_DIE_20", "ENTER_REGION_27" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_20(context, evt)
	-- 判断剩余怪物数量是否是0
	if ScriptLib.GetGroupMonsterCount(context) ~= 0 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_20(context, evt)
	-- 设置操作台选项
	
	    ScriptLib.FinishRandTask(context, 7, true)
	
	
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_27(context, evt)
	if evt.param1 ~= 27 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_27(context, evt)
	-- 调用提示id为 1110022 的提示UI，会显示在屏幕中央偏下位置，id索引自 ReminderData表格
	if 0 ~= ScriptLib.ShowReminder(context, 1110022) then
		return -1
	end
	
	return 0
end
