--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 1059, monster_id = 28020102, pos = { x = 2799.9, y = 259.5, z = -1260.7 }, rot = { x = 0.0, y = 21.7, z = 0.0 }, level = 1, drop_tag = "走兽", disableWander = true },
	{ config_id = 1060, monster_id = 28020102, pos = { x = 2799.5, y = 259.5, z = -1259.9 }, rot = { x = 0.0, y = 103.5, z = 0.0 }, level = 1, drop_tag = "走兽", disableWander = true }
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
		monsters = { 1059, 1060 },
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
