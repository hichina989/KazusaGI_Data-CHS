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
	{ config_id = 487001, gadget_id = 70220013, pos = { x = -87.8, y = 271.8, z = 116.2 }, rot = { x = 2.2, y = 360.0, z = 358.7 }, level = 19 },
	{ config_id = 487002, gadget_id = 70220013, pos = { x = -90.0, y = 271.9, z = 116.3 }, rot = { x = 354.7, y = 0.5, z = 349.4 }, level = 19 },
	{ config_id = 487003, gadget_id = 70220014, pos = { x = -94.6, y = 270.4, z = 104.0 }, rot = { x = 343.6, y = 1.0, z = 352.9 }, level = 19 },
	{ config_id = 487004, gadget_id = 70220014, pos = { x = -96.3, y = 274.0, z = 115.2 }, rot = { x = 358.6, y = 360.0, z = 2.1 }, level = 19 }
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
		gadgets = { 487001, 487002, 487003, 487004 },
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
