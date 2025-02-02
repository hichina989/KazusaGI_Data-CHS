--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 39, monster_id = 20010901, pos = { x = 2.9, y = 0.1, z = 0.1 }, rot = { x = 0.0, y = 269.1, z = 0.0 }, level = 1, drop_tag = "史莱姆", disableWander = true },
	{ config_id = 40, monster_id = 20010801, pos = { x = 0.8, y = 0.0, z = 2.0 }, rot = { x = 0.0, y = 199.0, z = 0.0 }, level = 1, drop_tag = "史莱姆" },
	{ config_id = 41, monster_id = 20010801, pos = { x = -1.0, y = 0.0, z = 1.9 }, rot = { x = 0.0, y = 155.7, z = 0.0 }, level = 1, drop_tag = "史莱姆" },
	{ config_id = 8001, monster_id = 20010801, pos = { x = -1.5, y = 0.0, z = -0.7 }, rot = { x = 0.0, y = 73.8, z = 0.0 }, level = 1, drop_tag = "史莱姆" },
	{ config_id = 8003, monster_id = 20011301, pos = { x = -1.8, y = 0.0, z = 0.9 }, rot = { x = 0.0, y = 89.8, z = 0.0 }, level = 1, drop_tag = "史莱姆", disableWander = true, affix = { 1007 }, isElite = true },
	{ config_id = 8004, monster_id = 20011201, pos = { x = -0.9, y = 0.0, z = -1.1 }, rot = { x = 0.0, y = 21.1, z = 0.0 }, level = 1, drop_tag = "史莱姆", pose_id = 901 },
	{ config_id = 8005, monster_id = 20011201, pos = { x = 0.2, y = 0.0, z = 2.6 }, rot = { x = 0.0, y = 21.1, z = 0.0 }, level = 1, drop_tag = "史莱姆", pose_id = 901 },
	{ config_id = 8006, monster_id = 20011201, pos = { x = 1.0, y = 0.0, z = 0.8 }, rot = { x = 0.0, y = 21.1, z = 0.0 }, level = 1, drop_tag = "史莱姆", pose_id = 901 },
	{ config_id = 8007, monster_id = 20011201, pos = { x = -2.1, y = 0.0, z = -0.7 }, rot = { x = 0.0, y = 21.1, z = 0.0 }, level = 1, drop_tag = "史莱姆", pose_id = 901 },
	{ config_id = 8009, monster_id = 20011501, pos = { x = -1.8, y = 0.0, z = 2.2 }, rot = { x = 0.0, y = 124.8, z = 0.0 }, level = 1, drop_tag = "史莱姆", disableWander = true },
	{ config_id = 8010, monster_id = 20011401, pos = { x = -2.4, y = 0.0, z = 0.2 }, rot = { x = 0.0, y = 57.9, z = 0.0 }, level = 1, drop_tag = "史莱姆" },
	{ config_id = 8011, monster_id = 20011401, pos = { x = -1.3, y = 0.0, z = -1.4 }, rot = { x = 0.0, y = 57.9, z = 0.0 }, level = 1, drop_tag = "史莱姆" },
	{ config_id = 8012, monster_id = 20011401, pos = { x = 0.0, y = 0.0, z = -0.8 }, rot = { x = 0.0, y = 321.7, z = 0.0 }, level = 1, drop_tag = "史莱姆" },
	{ config_id = 8013, monster_id = 20011401, pos = { x = 0.1, y = 0.0, z = 1.8 }, rot = { x = 0.0, y = 57.9, z = 0.0 }, level = 1, drop_tag = "史莱姆" }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 9, gadget_id = 70210103, pos = { x = -0.1, y = 1.2, z = -0.1 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, born_type = GadgetBornType.GROUND }
}

-- 区域
regions = {
	{ config_id = 28, shape = RegionShape.SPHERE, radius = 50, pos = { x = -0.4, y = 0.0, z = 0.3 } }
}

-- 触发器
triggers = {
	{ name = "ANY_GADGET_DIE_14", event = EventType.EVENT_ANY_GADGET_DIE, source = "", condition = "condition_EVENT_ANY_GADGET_DIE_14", action = "action_EVENT_ANY_GADGET_DIE_14" },
	{ name = "ANY_MONSTER_DIE_15", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_15", action = "action_EVENT_ANY_MONSTER_DIE_15" },
	{ name = "ENTER_REGION_28", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_28", action = "action_EVENT_ENTER_REGION_28", forbid_guest = false },
	{ name = "ANY_GADGET_DIE_8002", event = EventType.EVENT_ANY_GADGET_DIE, source = "", condition = "condition_EVENT_ANY_GADGET_DIE_8002", action = "action_EVENT_ANY_GADGET_DIE_8002" },
	{ name = "ANY_GADGET_DIE_8008", event = EventType.EVENT_ANY_GADGET_DIE, source = "", condition = "condition_EVENT_ANY_GADGET_DIE_8008", action = "action_EVENT_ANY_GADGET_DIE_8008" }
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
		monsters = { },
		gadgets = { 9 },
		regions = { 28 },
		triggers = { "ANY_GADGET_DIE_14", "ANY_MONSTER_DIE_15", "ENTER_REGION_28" },
		rand_weight = 100
	},
	{
		-- suite_id = 2,
		-- description = suite_2,
		monsters = { },
		gadgets = { 9 },
		regions = { 28 },
		triggers = { "ANY_MONSTER_DIE_15", "ENTER_REGION_28", "ANY_GADGET_DIE_8002" },
		rand_weight = 100
	},
	{
		-- suite_id = 3,
		-- description = suite_3,
		monsters = { },
		gadgets = { 9 },
		regions = { 28 },
		triggers = { "ANY_MONSTER_DIE_15", "ENTER_REGION_28", "ANY_GADGET_DIE_8008" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ANY_GADGET_DIE_14(context, evt)
	if 9 ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_GADGET_DIE_14(context, evt)
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 40, delay_time = 0 }) then
	  return -1
	end
	
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 41, delay_time = 0 }) then
	  return -1
	end
	
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 39, delay_time = 0 }) then
	  return -1
	end
	
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 8001, delay_time = 0 }) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_15(context, evt)
	-- 判断剩余怪物数量是否是0
	if ScriptLib.GetGroupMonsterCount(context) ~= 0 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_15(context, evt)
	-- 设置操作台选项
	
	    ScriptLib.FinishRandTask(context, 8, true)
	
	
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_28(context, evt)
	if evt.param1 ~= 28 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_28(context, evt)
	-- 调用提示id为 1110025 的提示UI，会显示在屏幕中央偏下位置，id索引自 ReminderData表格
	if 0 ~= ScriptLib.ShowReminder(context, 1110025) then
		return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ANY_GADGET_DIE_8002(context, evt)
	if 9 ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_GADGET_DIE_8002(context, evt)
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 8003, delay_time = 0 }) then
	  return -1
	end
	
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 8004, delay_time = 0 }) then
	  return -1
	end
	
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 8005, delay_time = 0 }) then
	  return -1
	end
	
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 8006, delay_time = 0 }) then
	  return -1
	end
	
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 8007, delay_time = 0 }) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ANY_GADGET_DIE_8008(context, evt)
	if 9 ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_GADGET_DIE_8008(context, evt)
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 8009, delay_time = 0 }) then
	  return -1
	end
	
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 8010, delay_time = 0 }) then
	  return -1
	end
	
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 8011, delay_time = 0 }) then
	  return -1
	end
	
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 8012, delay_time = 0 }) then
	  return -1
	end
	
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 8013, delay_time = 0 }) then
	  return -1
	end
	
	return 0
end
