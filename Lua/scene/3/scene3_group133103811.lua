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
	{ config_id = 811001, gadget_id = 70500000, pos = { x = 761.7, y = 177.0, z = 1253.5 }, rot = { x = 346.8, y = 326.7, z = 8.5 }, level = 24, point_type = 1001 },
	{ config_id = 811002, gadget_id = 70500000, pos = { x = 762.4, y = 178.2, z = 1248.3 }, rot = { x = 7.6, y = 339.6, z = 62.1 }, level = 24, point_type = 1001 },
	{ config_id = 811003, gadget_id = 70500000, pos = { x = 752.0, y = 176.2, z = 1250.4 }, rot = { x = 0.0, y = 335.0, z = 0.0 }, level = 24, point_type = 1001 },
	{ config_id = 811004, gadget_id = 70500000, pos = { x = 754.5, y = 176.1, z = 1266.1 }, rot = { x = 10.6, y = 334.4, z = 356.1 }, level = 24, point_type = 1001 },
	{ config_id = 811005, gadget_id = 70500000, pos = { x = 764.9, y = 173.8, z = 1227.0 }, rot = { x = 359.7, y = 335.0, z = 357.6 }, level = 24, point_type = 1001 },
	{ config_id = 811006, gadget_id = 70500000, pos = { x = 766.0, y = 179.5, z = 1228.0 }, rot = { x = 17.2, y = 337.6, z = 17.0 }, level = 24, point_type = 1001 },
	{ config_id = 811007, gadget_id = 70500000, pos = { x = 751.6, y = 175.5, z = 1271.8 }, rot = { x = 6.2, y = 335.2, z = 3.9 }, level = 24, point_type = 1001 },
	{ config_id = 811008, gadget_id = 70500000, pos = { x = 762.8, y = 177.4, z = 1245.6 }, rot = { x = 345.3, y = 329.7, z = 39.7 }, level = 24, point_type = 1001 }
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
		gadgets = { 811001, 811002, 811003, 811004, 811005, 811006, 811007, 811008 },
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
