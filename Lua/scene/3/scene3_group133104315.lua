-- Trigger变量
local defs = {
	point_sum = 13,
	route_2 = 310400135,
	gadget_seelie = 315002
}
-- DEFS_MISCS
defs.final_point = defs.point_sum - 1















-- DEFS_MISCS

--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 315001, gadget_id = 70710006, pos = { x = 571.1, y = 214.6, z = 892.7 }, rot = { x = 2.1, y = 96.2, z = 7.2 }, level = 19, persistent = true },
	{ config_id = 315002, gadget_id = 70710010, pos = { x = 629.0, y = 206.3, z = 894.2 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 24, route_id = 310400134 },
	{ config_id = 315003, gadget_id = 70710007, pos = { x = 575.0, y = 213.7, z = 893.2 }, rot = { x = 0.0, y = 89.3, z = 0.0 }, level = 19 },
	{ config_id = 315004, gadget_id = 70211111, pos = { x = 574.0, y = 213.4, z = 893.4 }, rot = { x = 350.3, y = 69.4, z = 6.7 }, level = 19, drop_tag = "解谜中级璃月", showcutscene = true, isOneoff = true, persistent = true }
}

-- 区域
regions = {
	{ config_id = 315007, shape = RegionShape.SPHERE, radius = 5, pos = { x = 629.1, y = 206.3, z = 894.5 } }
}

-- 触发器
triggers = {
	{ name = "PLATFORM_REACH_POINT_315005", event = EventType.EVENT_PLATFORM_REACH_POINT, source = "", condition = "condition_EVENT_PLATFORM_REACH_POINT_315005", action = "action_EVENT_PLATFORM_REACH_POINT_315005", trigger_count = 0 },
	{ name = "AVATAR_NEAR_PLATFORM_315006", event = EventType.EVENT_AVATAR_NEAR_PLATFORM, source = "", condition = "condition_EVENT_AVATAR_NEAR_PLATFORM_315006", action = "action_EVENT_AVATAR_NEAR_PLATFORM_315006", trigger_count = 0 },
	{ name = "ENTER_REGION_315007", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_315007", action = "action_EVENT_ENTER_REGION_315007", trigger_count = 0 },
	{ name = "GADGET_STATE_CHANGE_315008", event = EventType.EVENT_GADGET_STATE_CHANGE, source = "", condition = "condition_EVENT_GADGET_STATE_CHANGE_315008", action = "action_EVENT_GADGET_STATE_CHANGE_315008" },
	{ name = "GADGET_CREATE_315009", event = EventType.EVENT_GADGET_CREATE, source = "", condition = "condition_EVENT_GADGET_CREATE_315009", action = "action_EVENT_GADGET_CREATE_315009" }
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
	end_suite = 2,
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
		-- description = suite_1,
		monsters = { },
		gadgets = { 315001, 315002, 315003 },
		regions = { 315007 },
		triggers = { "PLATFORM_REACH_POINT_315005", "AVATAR_NEAR_PLATFORM_315006", "ENTER_REGION_315007", "GADGET_STATE_CHANGE_315008" },
		rand_weight = 100
	},
	{
		-- suite_id = 2,
		-- description = suite_2,
		monsters = { },
		gadgets = { 315001, 315004 },
		regions = { },
		triggers = { "GADGET_CREATE_315009" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_PLATFORM_REACH_POINT_315005(context, evt)
	if defs.gadget_seelie ~= evt.param1 then
	return false
	end
	
	if defs.route_2 ~= evt.param2 then
	return false
	end
	
	if  defs.final_point ~= evt.param3 then
	return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_PLATFORM_REACH_POINT_315005(context, evt)
	-- 将configid为 315001 的物件更改为状态 GadgetState.GearStart
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 315001, GadgetState.GearStart) then
			return -1
		end 
	
	-- 停止移动平台
	if 0 ~= ScriptLib.StopPlatform(context, 315002) then
	  return -1
	end
	
		-- 永久关闭CongfigId的Gadget，需要和Groups的RefreshWithBlock标签搭配
		if 0 ~= ScriptLib.KillEntityByConfigId(context, { config_id = 315002 }) then
		    return -1
		end
		
	
	-- 运营数据埋点，匹配LD定义的规则使用
	    if 0 ~= ScriptLib.MarkPlayerAction(context, 2005, 3, 1) then
	      return -1
	    end
	
	return 0
end

-- 触发条件
function condition_EVENT_AVATAR_NEAR_PLATFORM_315006(context, evt)
	if defs.gadget_seelie ~= evt.param1 then
	return false
	end
	
	if defs.route_2 ~= evt.param2 then
	return false
	end
	
	if defs.final_point == evt.param3 then
	return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_AVATAR_NEAR_PLATFORM_315006(context, evt)
	if 0 ~= ScriptLib.StartPlatform(context, 315002) then
	return -1
	end
	
	-- 运营数据埋点，匹配LD定义的规则使用
	if 0 ~= evt.param3 then
	ScriptLib.MarkPlayerAction(context, 2005, 2, evt.param3 + 1)
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_315007(context, evt)
	if evt.param1 ~= 315007 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_315007(context, evt)
	-- 设置移动平台路径
	if 0 ~= ScriptLib.SetPlatformRouteId(context, 315002, 310400135) then
	  return -1
	end
	
		-- 永久关闭CongfigId的Gadget，需要和Groups的RefreshWithBlock标签搭配
		if 0 ~= ScriptLib.KillEntityByConfigId(context, { config_id = 315003 }) then
		    return -1
		end
		
	
	-- 运营数据埋点，匹配LD定义的规则使用
	    if 0 ~= ScriptLib.MarkPlayerAction(context, 2005, 1, 1) then
	      return -1
	    end
	
	return 0
end

-- 触发条件
function condition_EVENT_GADGET_STATE_CHANGE_315008(context, evt)
	if 315001 ~= evt.param2 or GadgetState.GearAction1 ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GADGET_STATE_CHANGE_315008(context, evt)
	-- group调整group进度,只对非randSuite有效
	if 0 ~= ScriptLib.GoToGroupSuite(context, 133104315, 2) then
		return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_GADGET_CREATE_315009(context, evt)
	if 315001 ~= evt.param1 or GadgetState.Default ~= ScriptLib.GetGadgetStateByConfigId(context, 0, evt.param1) then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GADGET_CREATE_315009(context, evt)
	-- 将configid为 315001 的物件更改为状态 GadgetState.GearAction1
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 315001, GadgetState.GearAction1) then
			return -1
		end 
	
	return 0
end
