-- Trigger变量
local defs = {
	group_id = 133103324,
	gadget_target_1 = 324003,
	monster_mole_1 = 324001,
	gadget_home_1 = 324004
}


--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 324001, monster_id = 28050201, pos = { x = 351.1, y = 269.3, z = 1152.3 }, rot = { x = 0.0, y = 29.5, z = 0.0 }, level = 32, drop_tag = "魔法生物" },
	{ config_id = 324002, monster_id = 28050201, pos = { x = 332.0, y = 266.4, z = 1147.6 }, rot = { x = 0.0, y = 29.5, z = 0.0 }, level = 32, drop_tag = "魔法生物", pose_id = 3 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 324003, gadget_id = 70360027, pos = { x = 332.1, y = 266.5, z = 1147.5 }, rot = { x = 3.6, y = 103.4, z = 338.1 }, level = 32 },
	{ config_id = 324004, gadget_id = 70360015, pos = { x = 351.3, y = 269.2, z = 1152.4 }, rot = { x = 340.9, y = 13.5, z = 9.3 }, level = 32 }
}

-- 区域
regions = {
}

-- 触发器
triggers = {
	{ name = "ANY_MONSTER_DIE_324005", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_324005", action = "action_EVENT_ANY_MONSTER_DIE_324005" },
	{ name = "SELECT_OPTION_324006", event = EventType.EVENT_SELECT_OPTION, source = "", condition = "condition_EVENT_SELECT_OPTION_324006", action = "action_EVENT_SELECT_OPTION_324006", trigger_count = 0 },
	{ name = "GADGET_STATE_CHANGE_324007", event = EventType.EVENT_GADGET_STATE_CHANGE, source = "", condition = "condition_EVENT_GADGET_STATE_CHANGE_324007", action = "action_EVENT_GADGET_STATE_CHANGE_324007", trigger_count = 0 },
	{ name = "GADGET_STATE_CHANGE_324008", event = EventType.EVENT_GADGET_STATE_CHANGE, source = "", condition = "condition_EVENT_GADGET_STATE_CHANGE_324008", action = "action_EVENT_GADGET_STATE_CHANGE_324008", trigger_count = 0 },
	{ name = "GROUP_LOAD_324009", event = EventType.EVENT_GROUP_LOAD, source = "", condition = "", action = "action_EVENT_GROUP_LOAD_324009", trigger_count = 0 },
	{ name = "GADGET_STATE_CHANGE_324010", event = EventType.EVENT_GADGET_STATE_CHANGE, source = "", condition = "condition_EVENT_GADGET_STATE_CHANGE_324010", action = "action_EVENT_GADGET_STATE_CHANGE_324010", trigger_count = 0 }
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
		monsters = { 324001 },
		gadgets = { 324003, 324004 },
		regions = { },
		triggers = { "ANY_MONSTER_DIE_324005", "SELECT_OPTION_324006", "GADGET_STATE_CHANGE_324007", "GADGET_STATE_CHANGE_324008", "GROUP_LOAD_324009", "GADGET_STATE_CHANGE_324010" },
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
		monsters = { 324002 },
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
function condition_EVENT_ANY_MONSTER_DIE_324005(context, evt)
	--判断死亡怪物的configid是否为 324002
	if evt.param1 ~= 324002 then
	    return false
	 end
	  
	
	--判断死亡怪物的死亡类型是否为0，0为普通死亡（比如被击杀），1为普通地被killself杀死，2为消失（比如小动物逃跑消失，北风狼脱战消失）
	if evt.param2 ~= 0 then
	    return false
	 end
	
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_324005(context, evt)
	-- 运营数据埋点，匹配LD定义的规则使用
	    if 0 ~= ScriptLib.MarkPlayerAction(context, 2006, 3, 1) then
	      return -1
	    end
	
	-- group调整group进度,只对非randSuite有效
	if 0 ~= ScriptLib.GoToGroupSuite(context, 133103324, 2) then
		return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_SELECT_OPTION_324006(context, evt)
	-- 判断是gadgetid 324004 option_id 171
	if 324004 ~= evt.param1 then
		return false	
	end
	
	if 171 ~= evt.param2 then
		return false
	end
	
	
	return true
end

-- 触发操作
function action_EVENT_SELECT_OPTION_324006(context, evt)
	-- 改变指定group组133103324中， configid为324004的gadget的state
	if 0 ~= ScriptLib.SetGroupGadgetStateByConfigId(context, 133103324, 324004, GadgetState.GearAction2) then
			return -1
		end 
	
	-- 删除指定group： 133103324 ；指定config：324004；物件身上指定option：171；
	if 0 ~= ScriptLib.DelWorktopOptionByGroupId(context, 133103324, 324004, 171) then
		return -1
	end
	
	-- 运营数据埋点，匹配LD定义的规则使用
	    if 0 ~= ScriptLib.MarkPlayerAction(context, 2006, 1, 1) then
	      return -1
	    end
	
	return 0
end

-- 触发条件
function condition_EVENT_GADGET_STATE_CHANGE_324007(context, evt)
	if 324004 ~= evt.param2 or GadgetState.GearAction1 ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GADGET_STATE_CHANGE_324007(context, evt)
	-- 设置操作台选项
	if 0 ~= ScriptLib.SetWorktopOptionsByGroupId(context, 133103324, 324004, {171}) then
		return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_GADGET_STATE_CHANGE_324008(context, evt)
	if 324003 ~= evt.param2 or GadgetState.GearStart ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GADGET_STATE_CHANGE_324008(context, evt)
	-- 添加suite3的新内容
	    ScriptLib.AddExtraGroupSuite(context, 133103324, 3)
	
	-- 将configid为 324004 的物件更改为状态 GadgetState.GearStart
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 324004, GadgetState.GearStart) then
			return -1
		end 
	
	return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_GROUP_LOAD_324009(context, evt)
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 324001, delay_time = 0 }) then
	  return -1
	end
	
	-- 删除suite3的所有内容
	    ScriptLib.RemoveExtraGroupSuite(context, 133103324, 3)
	
	return 0
end

-- 触发条件
function condition_EVENT_GADGET_STATE_CHANGE_324010(context, evt)
	if 324004 ~= evt.param2 or GadgetState.Action01 ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GADGET_STATE_CHANGE_324010(context, evt)
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
