--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 164001, monster_id = 28020102, pos = { x = 1512.5, y = 205.6, z = 1104.4 }, rot = { x = 0.0, y = 275.6, z = 0.0 }, level = 19, drop_tag = "走兽" },
	{ config_id = 164002, monster_id = 28020102, pos = { x = 1504.5, y = 203.6, z = 1089.9 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 19, drop_tag = "走兽" },
	{ config_id = 164003, monster_id = 28020102, pos = { x = 1499.2, y = 211.1, z = 1120.7 }, rot = { x = 0.0, y = 142.8, z = 0.0 }, level = 19, drop_tag = "走兽" }
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
		monsters = { 164001, 164002, 164003 },
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
