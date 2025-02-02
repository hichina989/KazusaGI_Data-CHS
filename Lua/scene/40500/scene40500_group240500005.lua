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
	{ config_id = 5001, gadget_id = 70350023, pos = { x = 0.0, y = 0.0, z = 0.0 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 }
}

-- 区域
regions = {
}

-- 触发器
triggers = {
	{ name = "GADGET_CREATE_5002", event = EventType.EVENT_GADGET_CREATE, source = "", condition = "condition_EVENT_GADGET_CREATE_5002", action = "action_EVENT_GADGET_CREATE_5002" },
	{ name = "SELECT_OPTION_5003", event = EventType.EVENT_SELECT_OPTION, source = "", condition = "condition_EVENT_SELECT_OPTION_5003", action = "action_EVENT_SELECT_OPTION_5003", trigger_count = 0 }
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
		gadgets = { 5001 },
		regions = { },
		triggers = { "GADGET_CREATE_5002", "SELECT_OPTION_5003" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_GADGET_CREATE_5002(context, evt)
	if 5001 ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GADGET_CREATE_5002(context, evt)
	-- 设置操作台选项
	if 0 ~= ScriptLib.SetWorktopOptionsByGroupId(context, 240500005, 5001, {7}) then
		return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_SELECT_OPTION_5003(context, evt)
	-- 判断是gadgetid 5001 option_id 7
	if 5001 ~= evt.param1 then
		return false	
	end
	
	if 7 ~= evt.param2 then
		return false
	end
	
	
	return true
end

-- 触发操作
function action_EVENT_SELECT_OPTION_5003(context, evt)
	-- 创建编号为1（该怪物潮的识别id)的怪物潮，创建怪物总数为15，场上怪物最少5只，最多5只
	if 0 ~= ScriptLib.AutoMonsterTide(context, 1, 240500003, {3001,3002,3003,3004,3005,3006,3007,3011,3012,3008,3009,3013,3014,3010,3015}, 15, 5, 5) then
		return -1
	end
	
	-- 删除指定group： 240500005 ；指定config：5001；物件身上指定option：7；
	if 0 ~= ScriptLib.DelWorktopOptionByGroupId(context, 240500005, 5001, 7) then
		return -1
	end
	
	-- 改变指定group组240500005中， configid为5001的gadget的state
	if 0 ~= ScriptLib.SetGroupGadgetStateByConfigId(context, 240500005, 5001, GadgetState.GearStart) then
			return -1
		end 
	
	-- 改变指定group组240500001中， configid为1001的gadget的state
	if 0 ~= ScriptLib.SetGroupGadgetStateByConfigId(context, 240500001, 1001, GadgetState.Default) then
			return -1
		end 
	
	-- 改变指定group组240500001中， configid为1002的gadget的state
	if 0 ~= ScriptLib.SetGroupGadgetStateByConfigId(context, 240500001, 1002, GadgetState.Default) then
			return -1
		end 
	
	return 0
end
