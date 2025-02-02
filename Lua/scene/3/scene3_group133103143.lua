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
	{ config_id = 143001, gadget_id = 70620002, pos = { x = 1038.4, y = 270.4, z = 1480.1 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 10, isOneoff = true, persistent = true },
	{ config_id = 143002, gadget_id = 70211101, pos = { x = 1038.4, y = 269.0, z = 1480.1 }, rot = { x = 5.8, y = 237.6, z = 354.2 }, level = 10, drop_tag = "解谜低级璃月", state = GadgetState.ChestLocked, isOneoff = true, persistent = true }
}

-- 区域
regions = {
	{ config_id = 143004, shape = RegionShape.SPHERE, radius = 2, pos = { x = 1038.5, y = 272.9, z = 1480.2 } }
}

-- 触发器
triggers = {
	{ name = "GADGET_STATE_CHANGE_143003", event = EventType.EVENT_GADGET_STATE_CHANGE, source = "", condition = "condition_EVENT_GADGET_STATE_CHANGE_143003", action = "action_EVENT_GADGET_STATE_CHANGE_143003" },
	{ name = "ENTER_REGION_143004", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_143004", action = "action_EVENT_ENTER_REGION_143004" },
	{ name = "GADGET_CREATE_143005", event = EventType.EVENT_GADGET_CREATE, source = "", condition = "condition_EVENT_GADGET_CREATE_143005", action = "action_EVENT_GADGET_CREATE_143005", trigger_count = 0 }
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
		-- description = suite_1,
		monsters = { },
		gadgets = { 143001, 143002 },
		regions = { },
		triggers = { "GADGET_STATE_CHANGE_143003", "GADGET_CREATE_143005" },
		rand_weight = 100
	},
	{
		-- suite_id = 2,
		-- description = ,
		monsters = { },
		gadgets = { 143001 },
		regions = { 143004 },
		triggers = { "ENTER_REGION_143004" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_GADGET_STATE_CHANGE_143003(context, evt)
	if 143002 ~= evt.param2 or GadgetState.ChestOpened ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GADGET_STATE_CHANGE_143003(context, evt)
	    -- 杀死指定group内的gadget和monster,移除其它东西
	    ScriptLib.KillExtraGroupSuite(context, 133103143, 2)
	
	-- 运营数据埋点，匹配LD定义的规则使用
	    if 0 ~= ScriptLib.MarkPlayerAction(context, 1000, 3, 1) then
	      return -1
	    end
	
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_143004(context, evt)
	if evt.param1 ~= 143004 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_143004(context, evt)
	-- 将configid为 143002 的物件更改为状态 GadgetState.Default
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 143002, GadgetState.Default) then
			return -1
		end 
	
	return 0
end

-- 触发条件
function condition_EVENT_GADGET_CREATE_143005(context, evt)
	if 143001 ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GADGET_CREATE_143005(context, evt)
	-- 添加suite2的新内容
	    ScriptLib.AddExtraGroupSuite(context, 133103143, 2)
	
	return 0
end
