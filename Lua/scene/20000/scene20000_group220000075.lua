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
	{ config_id = 539, gadget_id = 40210006, pos = { x = 96.0, y = 0.5, z = 401.2 }, rot = { x = 0.0, y = 225.0, z = 0.0 }, level = 1 },
	{ config_id = 540, gadget_id = 40210006, pos = { x = 86.9, y = 0.5, z = 378.6 }, rot = { x = 0.0, y = 70.7, z = 0.0 }, level = 1 },
	{ config_id = 541, gadget_id = 40210006, pos = { x = 110.6, y = 0.5, z = 382.5 }, rot = { x = 0.0, y = 337.9, z = 0.0 }, level = 1 },
	{ config_id = 542, gadget_id = 70320001, pos = { x = 102.8, y = 0.5, z = 388.6 }, rot = { x = 0.0, y = 238.7, z = 0.0 }, level = 1 },
	{ config_id = 543, gadget_id = 70320001, pos = { x = 91.3, y = 0.5, z = 388.5 }, rot = { x = 0.0, y = 182.6, z = 0.0 }, level = 1 },
	{ config_id = 544, gadget_id = 70320001, pos = { x = 97.5, y = 0.5, z = 395.4 }, rot = { x = 0.0, y = 306.1, z = 0.0 }, level = 1 },
	{ config_id = 545, gadget_id = 70320001, pos = { x = 97.2, y = 0.5, z = 381.8 }, rot = { x = 0.0, y = 191.2, z = 0.0 }, level = 1 }
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
	rand_suite = false,
	npcs = { }
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
		gadgets = { 539, 540, 541, 542, 543, 544, 545 },
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
