--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 374, monster_id = 21010201, pos = { x = 2002.8, y = 208.7, z = -103.8 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 27, drop_tag = "丘丘人", pose_id = 0 },
	{ config_id = 375, monster_id = 21010201, pos = { x = 2005.2, y = 209.5, z = -106.8 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 27, drop_tag = "丘丘人", pose_id = 0 }
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
	rand_suite = true
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
		monsters = { 374, 375 },
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
