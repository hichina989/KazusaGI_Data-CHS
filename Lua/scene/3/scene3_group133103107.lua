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
	{ config_id = 342, gadget_id = 70211101, pos = { x = 753.5, y = 306.7, z = 1742.9 }, rot = { x = 2.9, y = 167.5, z = 353.1 }, level = 24, drop_tag = "解谜低级璃月", isOneoff = true, persistent = true, type = GadgetType.GADGET_WORLD_CHECT },
	{ config_id = 343, gadget_id = 70220004, pos = { x = 751.8, y = 306.5, z = 1743.4 }, rot = { x = 0.0, y = 344.1, z = 0.0 }, level = 24 },
	{ config_id = 344, gadget_id = 70220004, pos = { x = 754.6, y = 306.7, z = 1744.0 }, rot = { x = 0.0, y = 344.1, z = 0.0 }, level = 24 },
	{ config_id = 345, gadget_id = 70220004, pos = { x = 753.9, y = 306.6, z = 1741.5 }, rot = { x = 0.0, y = 344.1, z = 0.0 }, level = 24 }
}

-- 区域
regions = {
}

-- 触发器
triggers = {
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
		gadgets = { 342, 343, 344, 345 },
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
