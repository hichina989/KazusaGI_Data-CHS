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
	{ config_id = 168001, gadget_id = 70900336, pos = { x = 931.8, y = 373.7, z = 1573.2 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 24 },
	{ config_id = 168002, gadget_id = 70360029, pos = { x = 924.6, y = 304.8, z = 1584.2 }, rot = { x = 0.0, y = 313.4, z = 0.0 }, level = 24 },
	{ config_id = 168007, gadget_id = 70360046, pos = { x = 824.0, y = 322.0, z = 1696.5 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 24 },
	{ config_id = 168009, gadget_id = 70360046, pos = { x = 938.8, y = 384.7, z = 1582.5 }, rot = { x = 0.0, y = 46.9, z = 0.0 }, level = 24 },
	{ config_id = 168015, gadget_id = 70360029, pos = { x = 926.2, y = 329.1, z = 1540.5 }, rot = { x = 0.0, y = 185.5, z = 0.0 }, level = 24 },
	{ config_id = 168017, gadget_id = 70360029, pos = { x = 928.8, y = 271.4, z = 1655.2 }, rot = { x = 0.0, y = 205.8, z = 0.0 }, level = 24 },
	{ config_id = 168024, gadget_id = 70360029, pos = { x = 776.3, y = 273.8, z = 1650.4 }, rot = { x = 0.0, y = 176.2, z = 0.0 }, level = 24 },
	{ config_id = 168025, gadget_id = 70360029, pos = { x = 793.9, y = 269.0, z = 1638.7 }, rot = { x = 0.0, y = 277.3, z = 0.0 }, level = 24 },
	{ config_id = 168028, gadget_id = 70360029, pos = { x = 975.0, y = 294.7, z = 1582.7 }, rot = { x = 0.0, y = 240.1, z = 0.0 }, level = 24 },
	{ config_id = 168029, gadget_id = 70360046, pos = { x = 875.3, y = 332.2, z = 1610.6 }, rot = { x = 0.0, y = 26.8, z = 0.0 }, level = 24 },
	{ config_id = 168032, gadget_id = 70360046, pos = { x = 887.8, y = 333.9, z = 1730.7 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 24 },
	{ config_id = 168034, gadget_id = 70360046, pos = { x = 990.5, y = 352.5, z = 1649.1 }, rot = { x = 0.0, y = 332.7, z = 0.0 }, level = 24 },
	{ config_id = 168035, gadget_id = 70360046, pos = { x = 907.1, y = 352.0, z = 1575.6 }, rot = { x = 0.0, y = 32.9, z = 0.0 }, level = 24 }
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
		gadgets = { 168001, 168002, 168007, 168009, 168015, 168017, 168024, 168025, 168028, 168029, 168032, 168034, 168035 },
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
