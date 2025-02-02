--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 21, monster_id = 22010201, pos = { x = 17.9, y = 4.0, z = -64.6 }, rot = { x = 0.0, y = 90.0, z = 0.0 }, level = 20, disableWander = true },
	{ config_id = 22, monster_id = 20010801, pos = { x = 18.9, y = 4.0, z = -61.2 }, rot = { x = 0.0, y = 90.0, z = 0.0 }, level = 20, disableWander = true },
	{ config_id = 23, monster_id = 20010801, pos = { x = 17.7, y = 4.0, z = -67.2 }, rot = { x = 0.0, y = 90.0, z = 0.0 }, level = 20, disableWander = true },
	{ config_id = 24, monster_id = 20010801, pos = { x = 20.3, y = 4.0, z = -63.9 }, rot = { x = 0.0, y = 90.0, z = 0.0 }, level = 20, disableWander = true }
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
	rand_suite = true,
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
		monsters = { 21, 22, 23, 24 },
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
