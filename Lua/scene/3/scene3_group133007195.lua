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
	{ config_id = 701, gadget_id = 70690006, pos = { x = 2477.2, y = 245.7, z = 452.9 }, rot = { x = 0.0, y = 123.5, z = 0.0 }, level = 23 },
	{ config_id = 702, gadget_id = 70690006, pos = { x = 2476.1, y = 263.7, z = 438.8 }, rot = { x = 0.0, y = 150.0, z = 0.0 }, level = 23 }
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
		gadgets = { },
		regions = { },
		triggers = { },
		rand_weight = 100
	},
	{
		-- suite_id = 2,
		-- description = suite_2,
		monsters = { },
		gadgets = { 701, 702 },
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
