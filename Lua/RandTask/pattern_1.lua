--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 1, monster_id = 21010201, pos = { x = -1.5, y = -0.1, z = -1.9 }, rot = { x = 0.0, y = 34.4, z = 0.0 }, level = 1, drop_tag = "丘丘人", disableWander = true, pose_id = 9010 },
	{ config_id = 2, monster_id = 21010101, pos = { x = -2.0, y = 0.1, z = 1.1 }, rot = { x = 0.0, y = 111.7, z = 0.0 }, level = 1, drop_tag = "丘丘人", disableWander = true, pose_id = 9010 },
	{ config_id = 3, monster_id = 21010101, pos = { x = 1.7, y = 0.0, z = -1.2 }, rot = { x = 0.0, y = 311.4, z = 0.0 }, level = 1, drop_tag = "丘丘人", disableWander = true, pose_id = 9010 },
	{ config_id = 9, monster_id = 21010201, pos = { x = -1.9, y = 0.1, z = 1.0 }, rot = { x = 0.0, y = 121.0, z = 0.0 }, level = 1, drop_tag = "丘丘人", disableWander = true, pose_id = 9012 },
	{ config_id = 10, monster_id = 21010201, pos = { x = -1.3, y = -0.1, z = -2.1 }, rot = { x = 0.0, y = 25.6, z = 0.0 }, level = 1, drop_tag = "丘丘人", disableWander = true, pose_id = 9010 },
	{ config_id = 11, monster_id = 21010201, pos = { x = 1.7, y = -0.1, z = -1.1 }, rot = { x = 0.0, y = 309.4, z = 0.0 }, level = 1, drop_tag = "丘丘人", disableWander = true, pose_id = 9012 },
	{ config_id = 12, monster_id = 20011201, pos = { x = -0.1, y = -0.2, z = -2.5 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, drop_tag = "史莱姆", disableWander = true, pose_id = 901 },
	{ config_id = 13, monster_id = 20011201, pos = { x = -2.5, y = 0.0, z = -0.5 }, rot = { x = 0.0, y = 70.6, z = 0.0 }, level = 1, drop_tag = "史莱姆", pose_id = 901 },
	{ config_id = 14, monster_id = 20011201, pos = { x = 0.4, y = 0.2, z = 2.0 }, rot = { x = 0.0, y = 70.6, z = 0.0 }, level = 1, drop_tag = "史莱姆", pose_id = 901 },
	{ config_id = 15, monster_id = 20011201, pos = { x = 2.5, y = 0.1, z = 0.2 }, rot = { x = 0.0, y = 219.4, z = 0.0 }, level = 1, drop_tag = "史莱姆", pose_id = 901 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
}

-- 区域
regions = {
	{ config_id = 21, shape = RegionShape.SPHERE, radius = 30, pos = { x = 0.0, y = 0.0, z = 0.0 } }
}

-- 触发器
triggers = {
	{ name = "ANY_MONSTER_DIE_3", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_3", action = "action_EVENT_ANY_MONSTER_DIE_3" },
	{ name = "ENTER_REGION_21", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_21", action = "action_EVENT_ENTER_REGION_21", forbid_guest = false }
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
		monsters = { 1, 2, 3 },
		gadgets = { },
		regions = { 21 },
		triggers = { "ANY_MONSTER_DIE_3", "ENTER_REGION_21" },
		rand_weight = 100
	},
	{
		-- suite_id = 2,
		-- description = suite_2,
		monsters = { 9, 10, 11 },
		gadgets = { },
		regions = { },
		triggers = { "ANY_MONSTER_DIE_3" },
		rand_weight = 100
	},
	{
		-- suite_id = 3,
		-- description = suite_3,
		monsters = { 12, 13, 14, 15 },
		gadgets = { },
		regions = { },
		triggers = { "ANY_MONSTER_DIE_3" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_3(context, evt)
	-- 判断剩余怪物数量是否是0
	if ScriptLib.GetGroupMonsterCount(context) ~= 0 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_3(context, evt)
	-- 设置操作台选项
	
	    ScriptLib.FinishRandTask(context, 1, true)
	
	
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_21(context, evt)
	if evt.param1 ~= 21 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_21(context, evt)
	-- 调用提示id为 1110005 的提示UI，会显示在屏幕中央偏下位置，id索引自 ReminderData表格
	if 0 ~= ScriptLib.ShowReminder(context, 1110005) then
		return -1
	end
	
	return 0
end
