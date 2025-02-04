--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 15001, monster_id = 21010101, pos = { x = 1.7, y = 0.0, z = -0.5 }, rot = { x = 0.0, y = 301.3, z = 0.0 }, level = 1, drop_tag = "丘丘人", disableWander = true, pose_id = 9011 },
	{ config_id = 15002, monster_id = 21010101, pos = { x = -2.2, y = 0.0, z = 1.8 }, rot = { x = 0.0, y = 154.4, z = 0.0 }, level = 1, drop_tag = "丘丘人", disableWander = true, pose_id = 9011 },
	{ config_id = 15003, monster_id = 21010101, pos = { x = 2.1, y = 0.4, z = 2.9 }, rot = { x = 0.0, y = 222.8, z = 0.0 }, level = 1, drop_tag = "丘丘人", disableWander = true, pose_id = 9011 },
	{ config_id = 15004, monster_id = 21010701, pos = { x = -1.5, y = 0.1, z = -3.5 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, drop_tag = "丘丘人" },
	{ config_id = 15005, monster_id = 21020201, pos = { x = -4.4, y = 0.2, z = -3.4 }, rot = { x = 0.0, y = 36.8, z = 0.0 }, level = 1, drop_tag = "丘丘暴徒", pose_id = 401 },
	{ config_id = 15006, monster_id = 21020101, pos = { x = -0.1, y = 0.0, z = -2.9 }, rot = { x = 0.0, y = 4.7, z = 0.0 }, level = 1, drop_tag = "丘丘暴徒", disableWander = true, affix = { 1007 }, isElite = true, pose_id = 401 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 15007, gadget_id = 70300083, pos = { x = -1.3, y = -0.3, z = 0.1 }, rot = { x = 0.0, y = 325.5, z = 0.0 }, level = 1, born_type = GadgetBornType.GROUND },
	{ config_id = 15011, gadget_id = 70900201, pos = { x = -1.3, y = -0.3, z = 0.1 }, rot = { x = 0.0, y = 325.5, z = 0.0 }, level = 1, born_type = GadgetBornType.GROUND }
}

-- 区域
regions = {
	{ config_id = 15010, shape = RegionShape.SPHERE, radius = 50, pos = { x = -1.4, y = 2.3, z = -1.3 } }
}

-- 触发器
triggers = {
	{ name = "ANY_GADGET_DIE_15008", event = EventType.EVENT_ANY_GADGET_DIE, source = "", condition = "condition_EVENT_ANY_GADGET_DIE_15008", action = "action_EVENT_ANY_GADGET_DIE_15008" },
	{ name = "ANY_MONSTER_DIE_15009", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_15009", action = "action_EVENT_ANY_MONSTER_DIE_15009" },
	{ name = "ENTER_REGION_15010", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_15010", action = "action_EVENT_ENTER_REGION_15010", forbid_guest = false },
	{ name = "VARIABLE_CHANGE_15012", event = EventType.EVENT_VARIABLE_CHANGE, source = "", condition = "condition_EVENT_VARIABLE_CHANGE_15012", action = "action_EVENT_VARIABLE_CHANGE_15012", trigger_count = 0 },
	{ name = "VARIABLE_CHANGE_15013", event = EventType.EVENT_VARIABLE_CHANGE, source = "", condition = "condition_EVENT_VARIABLE_CHANGE_15013", action = "action_EVENT_VARIABLE_CHANGE_15013", trigger_count = 0 }
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
		monsters = { 15001, 15002, 15003, 15004 },
		gadgets = { 15007 },
		regions = { },
		triggers = { "ANY_GADGET_DIE_15008", "ANY_MONSTER_DIE_15009", "VARIABLE_CHANGE_15012", "VARIABLE_CHANGE_15013" },
		rand_weight = 100
	},
	{
		-- suite_id = 2,
		-- description = suite_2,
		monsters = { 15001, 15002, 15003, 15005 },
		gadgets = { 15007 },
		regions = { },
		triggers = { "ANY_GADGET_DIE_15008", "ANY_MONSTER_DIE_15009", "VARIABLE_CHANGE_15012", "VARIABLE_CHANGE_15013" },
		rand_weight = 100
	},
	{
		-- suite_id = 3,
		-- description = suite_3,
		monsters = { 15001, 15002, 15003, 15006 },
		gadgets = { 15007 },
		regions = { },
		triggers = { "ANY_GADGET_DIE_15008", "ANY_MONSTER_DIE_15009", "VARIABLE_CHANGE_15012", "VARIABLE_CHANGE_15013" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ANY_GADGET_DIE_15008(context, evt)
	if 15007 ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_GADGET_DIE_15008(context, evt)
	
	
	
	-- 将本组内变量名为 "monsterdone" 的变量设置为 1
	if 0 ~= ScriptLib.SetGroupVariableValue(context, "gadgetdone", 1) then
	  return -1
	end
	
	if ScriptLib.GetGroupVariableValue(context, "monsterdone") + ScriptLib.GetGroupVariableValue(context, "gadgetdone") == 2 then
	
	-- 设置随机任务选项
	
	    ScriptLib.FinishRandTask(context, 15, true)
	
	end
	
	
	
	
	return 0
end

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_15009(context, evt)
	-- 判断剩余怪物数量是否是0
	if ScriptLib.GetGroupMonsterCount(context) ~= 0 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_15009(context, evt)
	
	
	
	-- 将本组内变量名为 "monsterdone" 的变量设置为 1
	if 0 ~= ScriptLib.SetGroupVariableValue(context, "monsterdone", 1) then
	  return -1
	end
	
	if ScriptLib.GetGroupVariableValue(context, "monsterdone") + ScriptLib.GetGroupVariableValue(context, "gadgetdone") == 2 then
	
	-- 设置随机任务选项
	
	    ScriptLib.FinishRandTask(context, 15, true)
	
	end
	
	
	
	
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_15010(context, evt)
	if evt.param1 ~= 15010 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_15010(context, evt)
	-- 调用提示id为 1110016 的提示UI，会显示在屏幕中央偏下位置，id索引自 ReminderData表格
	if 0 ~= ScriptLib.ShowReminder(context, 1110016) then
		return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_VARIABLE_CHANGE_15012(context, evt)
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
function action_EVENT_VARIABLE_CHANGE_15012(context, evt)
	-- 创建id为15011的gadget
	if 0 ~= ScriptLib.CreateGadget(context, { config_id = 15011 }) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_VARIABLE_CHANGE_15013(context, evt)
	-- 判断变量"gadgetdone"为1
	if ScriptLib.GetGroupVariableValue(context, "gadgetdone") ~= 1 then
			return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_VARIABLE_CHANGE_15013(context, evt)
		-- 永久关闭CongfigId的Gadget，需要和Groups的RefreshWithBlock标签搭配
		if 0 ~= ScriptLib.KillEntityByConfigId(context, { config_id = 15011 }) then
		    return -1
		end
		
	
	return 0
end
