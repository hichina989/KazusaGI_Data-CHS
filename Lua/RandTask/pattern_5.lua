--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 28, monster_id = 21010101, pos = { x = 2.0, y = 0.0, z = -1.1 }, rot = { x = 0.0, y = 301.3, z = 0.0 }, level = 1, drop_tag = "丘丘人", disableWander = true, pose_id = 9011 },
	{ config_id = 29, monster_id = 21010101, pos = { x = -1.7, y = 0.1, z = 1.8 }, rot = { x = 0.0, y = 154.4, z = 0.0 }, level = 1, drop_tag = "丘丘人", disableWander = true, pose_id = 9011 },
	{ config_id = 30, monster_id = 21010101, pos = { x = 1.7, y = 0.0, z = 2.0 }, rot = { x = 0.0, y = 214.1, z = 0.0 }, level = 1, drop_tag = "丘丘人", disableWander = true, pose_id = 9011 },
	{ config_id = 31, monster_id = 21010701, pos = { x = -2.6, y = 0.3, z = -2.6 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, drop_tag = "丘丘人" },
	{ config_id = 32, monster_id = 21020201, pos = { x = -3.0, y = 0.3, z = -2.7 }, rot = { x = 0.0, y = 36.8, z = 0.0 }, level = 1, drop_tag = "丘丘暴徒", pose_id = 401 },
	{ config_id = 5001, monster_id = 21020101, pos = { x = -0.7, y = 0.4, z = -3.4 }, rot = { x = 0.0, y = 4.7, z = 0.0 }, level = 1, drop_tag = "丘丘暴徒", disableWander = true, affix = { 1007 }, isElite = true, pose_id = 401 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 6, gadget_id = 70300101, pos = { x = -1.7, y = -0.9, z = 0.0 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, born_type = GadgetBornType.GROUND },
	{ config_id = 5002, gadget_id = 70900201, pos = { x = -1.7, y = 2.4, z = 0.0 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, born_type = GadgetBornType.GROUND }
}

-- 区域
regions = {
	{ config_id = 25, shape = RegionShape.SPHERE, radius = 50, pos = { x = -1.4, y = 1.5, z = -1.3 } }
}

-- 触发器
triggers = {
	{ name = "ANY_GADGET_DIE_10", event = EventType.EVENT_ANY_GADGET_DIE, source = "", condition = "condition_EVENT_ANY_GADGET_DIE_10", action = "action_EVENT_ANY_GADGET_DIE_10" },
	{ name = "ANY_MONSTER_DIE_11", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_11", action = "action_EVENT_ANY_MONSTER_DIE_11" },
	{ name = "ENTER_REGION_25", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_25", action = "action_EVENT_ENTER_REGION_25", forbid_guest = false },
	{ name = "VARIABLE_CHANGE_5003", event = EventType.EVENT_VARIABLE_CHANGE, source = "", condition = "condition_EVENT_VARIABLE_CHANGE_5003", action = "action_EVENT_VARIABLE_CHANGE_5003", trigger_count = 0 },
	{ name = "VARIABLE_CHANGE_5004", event = EventType.EVENT_VARIABLE_CHANGE, source = "", condition = "condition_EVENT_VARIABLE_CHANGE_5004", action = "action_EVENT_VARIABLE_CHANGE_5004", trigger_count = 0 }
}

-- 变量
variables = {
	{ name = "monsterdone", value = 0, no_refresh = false },
	{ name = "gadgetdone", value = 0, no_refresh = false }
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
		monsters = { 28, 29, 30, 31 },
		gadgets = { 6 },
		regions = { 25 },
		triggers = { "ANY_GADGET_DIE_10", "ANY_MONSTER_DIE_11", "ENTER_REGION_25", "VARIABLE_CHANGE_5003", "VARIABLE_CHANGE_5004" },
		rand_weight = 100
	},
	{
		-- suite_id = 2,
		-- description = suite_2,
		monsters = { 28, 29, 30, 32 },
		gadgets = { 6 },
		regions = { 25 },
		triggers = { "ANY_GADGET_DIE_10", "ANY_MONSTER_DIE_11", "ENTER_REGION_25", "VARIABLE_CHANGE_5003", "VARIABLE_CHANGE_5004" },
		rand_weight = 100
	},
	{
		-- suite_id = 3,
		-- description = suite_3,
		monsters = { 28, 29, 30, 5001 },
		gadgets = { 6 },
		regions = { 25 },
		triggers = { "ANY_GADGET_DIE_10", "ANY_MONSTER_DIE_11", "ENTER_REGION_25", "VARIABLE_CHANGE_5003", "VARIABLE_CHANGE_5004" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ANY_GADGET_DIE_10(context, evt)
	if 6 ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_GADGET_DIE_10(context, evt)
	
	
	
	-- 将本组内变量名为 "monsterdone" 的变量设置为 1
	if 0 ~= ScriptLib.SetGroupVariableValue(context, "gadgetdone", 1) then
	  return -1
	end
	
	if ScriptLib.GetGroupVariableValue(context, "monsterdone") + ScriptLib.GetGroupVariableValue(context, "gadgetdone") == 2 then
	
	-- 设置随机任务选项
	
	    ScriptLib.FinishRandTask(context, 5, true)
	
	end
	
	
	
	
	return 0
end

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_11(context, evt)
	-- 判断剩余怪物数量是否是0
	if ScriptLib.GetGroupMonsterCount(context) ~= 0 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_11(context, evt)
	
	
	
	-- 将本组内变量名为 "monsterdone" 的变量设置为 1
	if 0 ~= ScriptLib.SetGroupVariableValue(context, "monsterdone", 1) then
	  return -1
	end
	
	if ScriptLib.GetGroupVariableValue(context, "monsterdone") + ScriptLib.GetGroupVariableValue(context, "gadgetdone") == 2 then
	
	-- 设置随机任务选项
	
	    ScriptLib.FinishRandTask(context, 5, true)
	
	end
	
	
	
	
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_25(context, evt)
	if evt.param1 ~= 25 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_25(context, evt)
	-- 调用提示id为 1110016 的提示UI，会显示在屏幕中央偏下位置，id索引自 ReminderData表格
	if 0 ~= ScriptLib.ShowReminder(context, 1110016) then
		return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_VARIABLE_CHANGE_5003(context, evt)
	-- 判断变量"monsterdone"为1
	if ScriptLib.GetGroupVariableValue(context, "monsterdone") ~= 1 then
			return false
	end
	
	-- 判断变量"gadgetdone"为0
	if ScriptLib.GetGroupVariableValue(context, "gadgetdone") ~= 0 then
			return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_VARIABLE_CHANGE_5003(context, evt)
	-- 创建id为5002的gadget
	if 0 ~= ScriptLib.CreateGadget(context, { config_id = 5002 }) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_VARIABLE_CHANGE_5004(context, evt)
	-- 判断变量"gadgetdone"为1
	if ScriptLib.GetGroupVariableValue(context, "gadgetdone") ~= 1 then
			return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_VARIABLE_CHANGE_5004(context, evt)
		-- 永久关闭CongfigId的Gadget，需要和Groups的RefreshWithBlock标签搭配
		if 0 ~= ScriptLib.KillEntityByConfigId(context, { config_id = 5002 }) then
		    return -1
		end
		
	
	return 0
end
