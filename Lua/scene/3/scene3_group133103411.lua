--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 411001, monster_id = 20011201, pos = { x = 106.8, y = 187.5, z = 1403.2 }, rot = { x = 0.0, y = 32.9, z = 0.0 }, level = 24, drop_tag = "史莱姆" },
	{ config_id = 411002, monster_id = 20011301, pos = { x = 107.4, y = 188.2, z = 1404.9 }, rot = { x = 0.0, y = 36.8, z = 0.0 }, level = 24, drop_tag = "史莱姆" },
	{ config_id = 411003, monster_id = 20011201, pos = { x = 104.5, y = 188.5, z = 1405.4 }, rot = { x = 0.0, y = 24.8, z = 0.0 }, level = 24, drop_tag = "史莱姆" }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
}

-- 区域
regions = {
	{ config_id = 411004, shape = RegionShape.SPHERE, radius = 8, pos = { x = 106.2, y = 188.3, z = 1405.8 } }
}

-- 触发器
triggers = {
	{ name = "ENTER_REGION_411004", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_411004", action = "action_EVENT_ENTER_REGION_411004" }
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
	rand_suite = false
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
		gadgets = { },
		regions = { 411004 },
		triggers = { "ENTER_REGION_411004" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ENTER_REGION_411004(context, evt)
	if evt.param1 ~= 411004 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_411004(context, evt)
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 411001, delay_time = 0 }) then
	  return -1
	end
	
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 411002, delay_time = 0 }) then
	  return -1
	end
	
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 411003, delay_time = 0 }) then
	  return -1
	end
	
	return 0
end
