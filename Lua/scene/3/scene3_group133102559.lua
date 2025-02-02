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
	{ config_id = 559001, gadget_id = 70211101, pos = { x = 1256.2, y = 214.9, z = 1042.1 }, rot = { x = 23.6, y = 170.2, z = 352.8 }, level = 19, drop_tag = "解谜低级璃月", state = GadgetState.ChestLocked, isOneoff = true, persistent = true, type = GadgetType.GADGET_WORLD_CHECT },
	{ config_id = 559002, gadget_id = 70220021, pos = { x = 1256.5, y = 213.8, z = 1041.9 }, rot = { x = 33.0, y = 323.9, z = 14.9 }, level = 19, isOneoff = true, persistent = true }
}

-- 区域
regions = {
}

-- 触发器
triggers = {
	{ name = "ANY_GADGET_DIE_559003", event = EventType.EVENT_ANY_GADGET_DIE, source = "", condition = "condition_EVENT_ANY_GADGET_DIE_559003", action = "action_EVENT_ANY_GADGET_DIE_559003" }
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
		gadgets = { 559001, 559002 },
		regions = { },
		triggers = { "ANY_GADGET_DIE_559003" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ANY_GADGET_DIE_559003(context, evt)
	if 559002 ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_GADGET_DIE_559003(context, evt)
	-- 将configid为 559001 的物件更改为状态 GadgetState.Default
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 559001, GadgetState.Default) then
			return -1
		end 
	
	-- 运营数据埋点，匹配LD定义的规则使用
	    if 0 ~= ScriptLib.MarkPlayerAction(context, 2012, 3, 1) then
	      return -1
	    end
	
	return 0
end
