--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 10001, monster_id = 21011201, pos = { x = 1.7, y = 0.2, z = 0.1 }, rot = { x = 0.0, y = 10.6, z = 0.0 }, level = 1, drop_tag = "丘丘人", disableWander = true, pose_id = 9003 },
	{ config_id = 10002, monster_id = 21011201, pos = { x = 2.7, y = 0.5, z = 1.4 }, rot = { x = 0.0, y = 214.7, z = 0.0 }, level = 1, drop_tag = "丘丘人", disableWander = true, pose_id = 9003 },
	{ config_id = 10003, monster_id = 21011201, pos = { x = -0.5, y = 0.2, z = 1.3 }, rot = { x = 0.0, y = 47.1, z = 0.0 }, level = 1, drop_tag = "丘丘人", disableWander = true, pose_id = 9003 },
	{ config_id = 10004, monster_id = 21030401, pos = { x = 1.1, y = 0.5, z = 2.6 }, rot = { x = 0.1, y = 210.2, z = 0.1 }, level = 1, drop_tag = "丘丘萨满", disableWander = true, pose_id = 9012 },
	{ config_id = 10005, monster_id = 21020301, pos = { x = 0.3, y = 0.5, z = 3.6 }, rot = { x = 0.0, y = 171.0, z = 0.0 }, level = 1, drop_tag = "丘丘暴徒", disableWander = true, pose_id = 401 },
	{ config_id = 10006, monster_id = 21020301, pos = { x = 1.8, y = 0.7, z = 3.7 }, rot = { x = 0.0, y = 217.2, z = 0.0 }, level = 1, drop_tag = "丘丘暴徒", disableWander = true, pose_id = 401 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
}

-- 区域
regions = {
	{ config_id = 10009, shape = RegionShape.SPHERE, radius = 50, pos = { x = 0.1, y = 0.0, z = 0.1 } }
}

-- 触发器
triggers = {
	{ name = "ENTER_REGION_10009", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_10009", action = "action_EVENT_ENTER_REGION_10009", forbid_guest = false },
	{ name = "ANY_MONSTER_DIE_10010", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_10010", action = "action_EVENT_ANY_MONSTER_DIE_10010" }
}

-- 变量
variables = {
	{ name = "is_7", value = 0, no_refresh = false },
	{ name = "is_8", value = 0, no_refresh = false }
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
		monsters = { 10001, 10002, 10003 },
		gadgets = { },
		regions = { },
		triggers = { "ANY_MONSTER_DIE_10010" },
		rand_weight = 100
	},
	{
		-- suite_id = 2,
		-- description = suite_2,
		monsters = { 10001, 10003, 10004 },
		gadgets = { },
		regions = { },
		triggers = { "ANY_MONSTER_DIE_10010" },
		rand_weight = 100
	},
	{
		-- suite_id = 3,
		-- description = suite_3,
		monsters = { 10001, 10003, 10005 },
		gadgets = { },
		regions = { },
		triggers = { "ANY_MONSTER_DIE_10010" },
		rand_weight = 100
	},
	{
		-- suite_id = 4,
		-- description = suite_4,
		monsters = { 10001, 10003, 10006 },
		gadgets = { },
		regions = { },
		triggers = { "ANY_MONSTER_DIE_10010" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ENTER_REGION_10009(context, evt)
	if evt.param1 ~= 10009 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_10009(context, evt)
	-- 调用提示id为 1110019 的提示UI，会显示在屏幕中央偏下位置，id索引自 ReminderData表格
	if 0 ~= ScriptLib.ShowReminder(context, 1110019) then
		return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_10010(context, evt)
	-- 判断剩余怪物数量是否是0
	if ScriptLib.GetGroupMonsterCount(context) ~= 0 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_10010(context, evt)
	-- 设置操作台选项
	
	    ScriptLib.FinishRandTask(context, 10, true)
	
	
	return 0
end
