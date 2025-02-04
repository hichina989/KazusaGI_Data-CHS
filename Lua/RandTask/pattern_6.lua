--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 33, monster_id = 21010201, pos = { x = 1.7, y = 0.1, z = 0.1 }, rot = { x = 0.0, y = 214.7, z = 0.0 }, level = 1, drop_tag = "丘丘人", disableWander = true, pose_id = 9010 },
	{ config_id = 34, monster_id = 21010201, pos = { x = 2.7, y = 0.1, z = 1.4 }, rot = { x = 0.0, y = 214.7, z = 0.0 }, level = 1, drop_tag = "丘丘人", disableWander = true, pose_id = 9003 },
	{ config_id = 35, monster_id = 21010201, pos = { x = 0.0, y = 0.0, z = 1.6 }, rot = { x = 0.0, y = 214.7, z = 0.0 }, level = 1, drop_tag = "丘丘人", disableWander = true, pose_id = 9010 },
	{ config_id = 6001, monster_id = 21030201, pos = { x = 1.1, y = 0.1, z = 2.6 }, rot = { x = 0.1, y = 210.2, z = 0.1 }, level = 1, drop_tag = "丘丘萨满", disableWander = true, pose_id = 9012 },
	{ config_id = 6002, monster_id = 21020201, pos = { x = 0.3, y = 0.1, z = 3.6 }, rot = { x = 0.0, y = 171.0, z = 0.0 }, level = 1, drop_tag = "丘丘暴徒", disableWander = true, pose_id = 401 },
	{ config_id = 6003, monster_id = 21020101, pos = { x = 1.8, y = 0.1, z = 3.7 }, rot = { x = 0.0, y = 217.2, z = 0.0 }, level = 1, drop_tag = "丘丘暴徒", disableWander = true, pose_id = 401 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 7, gadget_id = 70300089, pos = { x = 0.7, y = -0.1, z = -1.3 }, rot = { x = 0.0, y = 305.5, z = 0.0 }, level = 1, born_type = GadgetBornType.GROUND },
	{ config_id = 8, gadget_id = 70300089, pos = { x = -1.1, y = -0.1, z = 0.2 }, rot = { x = 0.0, y = 305.5, z = 0.0 }, level = 1, born_type = GadgetBornType.GROUND }
}

-- 区域
regions = {
	{ config_id = 26, shape = RegionShape.SPHERE, radius = 50, pos = { x = 0.1, y = 0.0, z = 0.1 } }
}

-- 触发器
triggers = {
	{ name = "ENTER_REGION_26", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_26", action = "action_EVENT_ENTER_REGION_26", forbid_guest = false },
	{ name = "ANY_GADGET_DIE_32", event = EventType.EVENT_ANY_GADGET_DIE, source = "", condition = "condition_EVENT_ANY_GADGET_DIE_32", action = "action_EVENT_ANY_GADGET_DIE_32" },
	{ name = "ANY_GADGET_DIE_33", event = EventType.EVENT_ANY_GADGET_DIE, source = "", condition = "condition_EVENT_ANY_GADGET_DIE_33", action = "action_EVENT_ANY_GADGET_DIE_33" }
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
		monsters = { 33, 34, 35 },
		gadgets = { 7, 8 },
		regions = { 26 },
		triggers = { "ENTER_REGION_26", "ANY_GADGET_DIE_32", "ANY_GADGET_DIE_33" },
		rand_weight = 100
	},
	{
		-- suite_id = 2,
		-- description = suite_2,
		monsters = { 33, 35, 6001 },
		gadgets = { 7, 8 },
		regions = { 26 },
		triggers = { "ENTER_REGION_26", "ANY_GADGET_DIE_32", "ANY_GADGET_DIE_33" },
		rand_weight = 100
	},
	{
		-- suite_id = 3,
		-- description = suite_3,
		monsters = { 33, 35, 6002 },
		gadgets = { 7, 8 },
		regions = { 26 },
		triggers = { "ENTER_REGION_26", "ANY_GADGET_DIE_32", "ANY_GADGET_DIE_33" },
		rand_weight = 100
	},
	{
		-- suite_id = 4,
		-- description = suite_4,
		monsters = { 33, 35, 6003 },
		gadgets = { 7, 8 },
		regions = { 26 },
		triggers = { "ENTER_REGION_26", "ANY_GADGET_DIE_32", "ANY_GADGET_DIE_33" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ENTER_REGION_26(context, evt)
	if evt.param1 ~= 26 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_26(context, evt)
	-- 调用提示id为 1110019 的提示UI，会显示在屏幕中央偏下位置，id索引自 ReminderData表格
	if 0 ~= ScriptLib.ShowReminder(context, 1110019) then
		return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ANY_GADGET_DIE_32(context, evt)
	if 7 ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_GADGET_DIE_32(context, evt)
	
	-- 将本组内变量名为 "is_7" 的变量设置为 1
	if 0 ~= ScriptLib.SetGroupVariableValue(context, "is_7", 1) then
	  return -1
	end
	
	
	-- 获取本组内变量名为 "is_7" 的变量值
	
	if ScriptLib.GetGroupVariableValue(context, "is_7") + ScriptLib.GetGroupVariableValue(context, "is_8") == 2 then
	
	    ScriptLib.FinishRandTask(context, 6, true)
	
	end
	
	
	
	return 0
end

-- 触发条件
function condition_EVENT_ANY_GADGET_DIE_33(context, evt)
	if 8 ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_GADGET_DIE_33(context, evt)
	
	-- 将本组内变量名为 "is_7" 的变量设置为 1
	if 0 ~= ScriptLib.SetGroupVariableValue(context, "is_8", 1) then
	  return -1
	end
	
	
	-- 获取本组内变量名为 "is_7" 的变量值
	
	if ScriptLib.GetGroupVariableValue(context, "is_7") + ScriptLib.GetGroupVariableValue(context, "is_8") == 2 then
	
	    ScriptLib.FinishRandTask(context, 6, true)
	
	end
	
	
	
	return 0
end
