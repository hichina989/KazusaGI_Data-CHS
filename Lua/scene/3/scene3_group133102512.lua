--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 512001, monster_id = 21010201, pos = { x = 1446.3, y = 229.4, z = 124.5 }, rot = { x = 352.3, y = 359.2, z = 11.3 }, level = 16, drop_tag = "丘丘人", disableWander = true },
	{ config_id = 512002, monster_id = 21010201, pos = { x = 1446.0, y = 230.1, z = 128.9 }, rot = { x = 5.2, y = 156.1, z = 353.0 }, level = 16, drop_tag = "丘丘人", disableWander = true },
	{ config_id = 512003, monster_id = 21010201, pos = { x = 1449.6, y = 230.2, z = 126.3 }, rot = { x = 10.3, y = 304.0, z = 6.9 }, level = 16, drop_tag = "丘丘人", disableWander = true }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 512004, gadget_id = 70310006, pos = { x = 1447.7, y = 229.9, z = 126.6 }, rot = { x = 355.2, y = 359.7, z = 6.5 }, level = 16 }
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
		monsters = { 512001, 512002, 512003 },
		gadgets = { 512004 },
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
