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
	{ config_id = 331001, gadget_id = 70900340, pos = { x = 1527.3, y = 250.5, z = -1385.4 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 10 },
	{ config_id = 331002, gadget_id = 70900340, pos = { x = 1526.2, y = 251.5, z = -1376.6 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 10 },
	{ config_id = 331003, gadget_id = 70900340, pos = { x = 1537.1, y = 251.8, z = -1385.9 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 5 }
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
		gadgets = { 331001, 331002, 331003 },
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
