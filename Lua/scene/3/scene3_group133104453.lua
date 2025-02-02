-- Trigger变量
local defs = {
	group_id = 133104453,
	gadget_target_1 = 453003,
	monster_mole_1 = 453001,
	gadget_home_1 = 453004
}


--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 453001, monster_id = 28050201, pos = { x = -22.0, y = 254.7, z = 483.6 }, rot = { x = 352.3, y = 28.1, z = 19.9 }, level = 32, drop_tag = "魔法生物" },
	{ config_id = 453002, monster_id = 28050201, pos = { x = -38.5, y = 257.8, z = 492.0 }, rot = { x = 17.6, y = 20.4, z = 329.8 }, level = 32, drop_tag = "魔法生物", pose_id = 3 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 453003, gadget_id = 70360027, pos = { x = -38.4, y = 257.7, z = 491.8 }, rot = { x = 15.8, y = 107.3, z = 18.6 }, level = 32 },
	{ config_id = 453004, gadget_id = 70360015, pos = { x = -21.9, y = 254.5, z = 483.7 }, rot = { x = 18.0, y = 13.9, z = 352.1 }, level = 32 }
}

-- 区域
regions = {
}

-- 触发器
triggers = {
	{ name = "ANY_MONSTER_DIE_453005", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_453005", action = "action_EVENT_ANY_MONSTER_DIE_453005" },
	{ name = "SELECT_OPTION_453006", event = EventType.EVENT_SELECT_OPTION, source = "", condition = "condition_EVENT_SELECT_OPTION_453006", action = "action_EVENT_SELECT_OPTION_453006", trigger_count = 0 },
	{ name = "GADGET_STATE_CHANGE_453007", event = EventType.EVENT_GADGET_STATE_CHANGE, source = "", condition = "condition_EVENT_GADGET_STATE_CHANGE_453007", action = "action_EVENT_GADGET_STATE_CHANGE_453007", trigger_count = 0 },
	{ name = "GADGET_STATE_CHANGE_453008", event = EventType.EVENT_GADGET_STATE_CHANGE, source = "", condition = "condition_EVENT_GADGET_STATE_CHANGE_453008", action = "action_EVENT_GADGET_STATE_CHANGE_453008", trigger_count = 0 },
	{ name = "GROUP_LOAD_453009", event = EventType.EVENT_GROUP_LOAD, source = "", condition = "", action = "action_EVENT_GROUP_LOAD_453009", trigger_count = 0 },
	{ name = "GADGET_STATE_CHANGE_453010", event = EventType.EVENT_GADGET_STATE_CHANGE, source = "", condition = "condition_EVENT_GADGET_STATE_CHANGE_453010", action = "action_EVENT_GADGET_STATE_CHANGE_453010", trigger_count = 0 }
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
		monsters = { 453001 },
		gadgets = { 453003, 453004 },
		regions = { },
		triggers = { "ANY_MONSTER_DIE_453005", "SELECT_OPTION_453006", "GADGET_STATE_CHANGE_453007", "GADGET_STATE_CHANGE_453008", "GROUP_LOAD_453009", "GADGET_STATE_CHANGE_453010" },
		rand_weight = 100
	},
	{
		-- suite_id = 2,
		-- description = suite_2,
		monsters = { },
		gadgets = { },
		regions = { },
		triggers = { },
		rand_weight = 100,
		ban_refresh = true
	},
	{
		-- suite_id = 3,
		-- description = suite_3,
		monsters = { 453002 },
		gadgets = { },
		regions = { },
		triggers = { },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_453005(context, evt)
	--判断死亡怪物的configid是否为 453002
	if evt.param1 ~= 453002 then
	    return false
	 end
	  
	
	--判断死亡怪物的死亡类型是否为0，0为普通死亡（比如被击杀），1为普通地被killself杀死，2为消失（比如小动物逃跑消失，北风狼脱战消失）
	if evt.param2 ~= 0 then
	    return false
	 end
	
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_453005(context, evt)
	-- 运营数据埋点，匹配LD定义的规则使用
	    if 0 ~= ScriptLib.MarkPlayerAction(context, 2006, 3, 1) then
	      return -1
	    end
	
	-- group调整group进度,只对非randSuite有效
	if 0 ~= ScriptLib.GoToGroupSuite(context, 133104453, 2) then
		return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_SELECT_OPTION_453006(context, evt)
	-- 判断是gadgetid 453004 option_id 171
	if 453004 ~= evt.param1 then
		return false	
	end
	
	if 171 ~= evt.param2 then
		return false
	end
	
	
	return true
end

-- 触发操作
function action_EVENT_SELECT_OPTION_453006(context, evt)
	-- 改变指定group组133104453中， configid为453004的gadget的state
	if 0 ~= ScriptLib.SetGroupGadgetStateByConfigId(context, 133104453, 453004, GadgetState.GearAction2) then
			return -1
		end 
	
	-- 删除指定group： 133104453 ；指定config：453004；物件身上指定option：171；
	if 0 ~= ScriptLib.DelWorktopOptionByGroupId(context, 133104453, 453004, 171) then
		return -1
	end
	
	-- 运营数据埋点，匹配LD定义的规则使用
	    if 0 ~= ScriptLib.MarkPlayerAction(context, 2006, 1, 1) then
	      return -1
	    end
	
	return 0
end

-- 触发条件
function condition_EVENT_GADGET_STATE_CHANGE_453007(context, evt)
	if 453004 ~= evt.param2 or GadgetState.GearAction1 ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GADGET_STATE_CHANGE_453007(context, evt)
	-- 设置操作台选项
	if 0 ~= ScriptLib.SetWorktopOptionsByGroupId(context, 133104453, 453004, {171}) then
		return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_GADGET_STATE_CHANGE_453008(context, evt)
	if 453003 ~= evt.param2 or GadgetState.GearStart ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GADGET_STATE_CHANGE_453008(context, evt)
	-- 添加suite3的新内容
	    ScriptLib.AddExtraGroupSuite(context, 133104453, 3)
	
	-- 将configid为 453004 的物件更改为状态 GadgetState.GearStart
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 453004, GadgetState.GearStart) then
			return -1
		end 
	
	return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_GROUP_LOAD_453009(context, evt)
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 453001, delay_time = 0 }) then
	  return -1
	end
	
	-- 删除suite3的所有内容
	    ScriptLib.RemoveExtraGroupSuite(context, 133104453, 3)
	
	return 0
end

-- 触发条件
function condition_EVENT_GADGET_STATE_CHANGE_453010(context, evt)
	if 453004 ~= evt.param2 or GadgetState.Action01 ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GADGET_STATE_CHANGE_453010(context, evt)
	--如果鼹鼠洞发射子弹5秒后，没有到达终点，（到达终点的情况下会改动这个鼹鼠洞到GearStart状态，就不会走到这里）
	--没有到达终点的情况下，将鼹鼠洞重新设置回到GearAction1的状态
	
	--这里判断鼹鼠终点的状态，如果是没有刷新鼹鼠的Default状态，则回滚设置鼹鼠洞为可以调查的GearAction1状态，
	if GadgetState.Default == ScriptLib.GetGadgetStateByConfigId(context, 0, defs.gadget_target_1) then
	 ScriptLib.SetGadgetStateByConfigId(context, defs.gadget_home_1, GadgetState.GearAction1)
	
	elseif GadgetState.GearStart == ScriptLib.GetGadgetStateByConfigId(context, 0, defs.gadget_target_1) then
	
	 ScriptLib.SetGadgetStateByConfigId(context, defs.gadget_home_1, GadgetState.GearStart)
	
	end
	
	
	
	
	return 0
end
