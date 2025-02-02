--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 324002, monster_id = 20010801, pos = { x = 1689.3, y = 201.5, z = 82.6 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 15, drop_tag = "史莱姆", pose_id = 0 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
}

-- 区域
regions = {
	{ config_id = 324001, shape = RegionShape.SPHERE, radius = 3, pos = { x = 1689.8, y = 200.2, z = 84.2 } }
}

-- 触发器
triggers = {
	{ name = "ENTER_REGION_324001", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_324001", action = "action_EVENT_ENTER_REGION_324001" }
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
		regions = { 324001 },
		triggers = { "ENTER_REGION_324001" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ENTER_REGION_324001(context, evt)
	if evt.param1 ~= 324001 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_324001(context, evt)
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 324002, delay_time = 0 }) then
	  return -1
	end
	
	return 0
end
