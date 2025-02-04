--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 16001, monster_id = 21010501, pos = { x = 1.1, y = 0.0, z = -1.4 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, drop_tag = "远程丘丘人", pose_id = 0 },
	{ config_id = 16002, monster_id = 21010501, pos = { x = -0.9, y = 0.1, z = 1.7 }, rot = { x = 0.0, y = 79.5, z = 0.0 }, level = 1, drop_tag = "远程丘丘人", pose_id = 0 },
	{ config_id = 16003, monster_id = 21011201, pos = { x = -2.0, y = -0.1, z = 0.4 }, rot = { x = 0.0, y = 38.7, z = 0.0 }, level = 1, drop_tag = "丘丘人", pose_id = 0 },
	{ config_id = 16004, monster_id = 21010501, pos = { x = -0.9, y = 0.0, z = -0.9 }, rot = { x = 0.0, y = 41.2, z = 0.0 }, level = 1, drop_tag = "远程丘丘人" },
	{ config_id = 16005, monster_id = 21010501, pos = { x = 0.4, y = 0.2, z = 2.3 }, rot = { x = 0.0, y = 181.0, z = 0.0 }, level = 1, drop_tag = "远程丘丘人" },
	{ config_id = 16008, monster_id = 21011201, pos = { x = 1.3, y = 0.2, z = 0.6 }, rot = { x = 0.0, y = 72.9, z = 0.0 }, level = 1, drop_tag = "丘丘人", disableWander = true, pose_id = 9003 },
	{ config_id = 16009, monster_id = 21030401, pos = { x = 2.3, y = 0.2, z = 0.1 }, rot = { x = 0.0, y = 274.0, z = 0.0 }, level = 1, drop_tag = "丘丘萨满", disableWander = true, pose_id = 9012 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
}

-- 区域
regions = {
	{ config_id = 16007, shape = RegionShape.SPHERE, radius = 50, pos = { x = -0.1, y = 0.0, z = 0.0 } }
}

-- 触发器
triggers = {
	{ name = "ANY_MONSTER_DIE_16006", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_16006", action = "action_EVENT_ANY_MONSTER_DIE_16006" },
	{ name = "ENTER_REGION_16007", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_16007", action = "action_EVENT_ENTER_REGION_16007", forbid_guest = false }
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
		-- description = suite_2,
		monsters = { 16001, 16002, 16004, 16005 },
		gadgets = { },
		regions = { },
		triggers = { "ANY_MONSTER_DIE_16006" },
		rand_weight = 100
	},
	{
		-- suite_id = 2,
		-- description = suite_3,
		monsters = { 16001, 16003, 16005, 16008 },
		gadgets = { },
		regions = { },
		triggers = { "ANY_MONSTER_DIE_16006" },
		rand_weight = 100
	},
	{
		-- suite_id = 3,
		-- description = suite_4,
		monsters = { 16001, 16002, 16004, 16005, 16009 },
		gadgets = { },
		regions = { },
		triggers = { "ANY_MONSTER_DIE_16006" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_16006(context, evt)
	-- 判断剩余怪物数量是否是0
	if ScriptLib.GetGroupMonsterCount(context) ~= 0 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_16006(context, evt)
	-- 设置操作台选项
	
	    ScriptLib.FinishRandTask(context, 16, true)
	
	
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_16007(context, evt)
	if evt.param1 ~= 16007 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_16007(context, evt)
	-- 调用提示id为 1110013 的提示UI，会显示在屏幕中央偏下位置，id索引自 ReminderData表格
	if 0 ~= ScriptLib.ShowReminder(context, 1110013) then
		return -1
	end
	
	return 0
end
