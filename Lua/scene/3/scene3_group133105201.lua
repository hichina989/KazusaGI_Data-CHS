--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 201001, monster_id = 28030402, pos = { x = 825.9, y = 200.5, z = -11.1 }, rot = { x = 0.0, y = 81.9, z = 0.0 }, level = 19, drop_tag = "鸟类" },
	{ config_id = 201002, monster_id = 28030402, pos = { x = 829.5, y = 200.7, z = -14.8 }, rot = { x = 0.0, y = 99.4, z = 0.0 }, level = 19, drop_tag = "鸟类" },
	{ config_id = 201003, monster_id = 28030402, pos = { x = 828.0, y = 200.5, z = -11.0 }, rot = { x = 0.0, y = 71.2, z = 0.0 }, level = 19, drop_tag = "鸟类" },
	{ config_id = 201004, monster_id = 28030402, pos = { x = 828.5, y = 200.6, z = -14.4 }, rot = { x = 0.0, y = 129.3, z = 0.0 }, level = 19, drop_tag = "鸟类" }
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
		monsters = { 201001, 201002, 201003, 201004 },
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
