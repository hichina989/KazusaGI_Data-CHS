--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 386001, monster_id = 21010201, pos = { x = 624.8, y = 201.7, z = 450.8 }, rot = { x = 0.0, y = 231.1, z = 0.0 }, level = 17, drop_tag = "丘丘人" },
	{ config_id = 386002, monster_id = 21010201, pos = { x = 620.8, y = 200.6, z = 446.6 }, rot = { x = 0.0, y = 300.4, z = 0.0 }, level = 17, drop_tag = "丘丘人" }
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
		monsters = { 386001, 386002 },
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
