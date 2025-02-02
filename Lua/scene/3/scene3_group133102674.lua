--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 674001, monster_id = 28010301, pos = { x = 1324.3, y = 200.0, z = 1000.0 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 19, drop_tag = "采集动物" },
	{ config_id = 674002, monster_id = 28010301, pos = { x = 1335.9, y = 200.3, z = 1000.9 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 19, drop_tag = "采集动物" },
	{ config_id = 674003, monster_id = 28010301, pos = { x = 1333.8, y = 200.2, z = 999.2 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 19, drop_tag = "采集动物" },
	{ config_id = 674004, monster_id = 28010301, pos = { x = 1330.6, y = 200.7, z = 1003.0 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 19, drop_tag = "采集动物" },
	{ config_id = 674005, monster_id = 28010301, pos = { x = 1304.2, y = 200.4, z = 991.2 }, rot = { x = 0.0, y = 203.3, z = 0.0 }, level = 19, drop_tag = "采集动物" }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
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
		monsters = { 674001, 674002, 674003, 674004, 674005 },
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
