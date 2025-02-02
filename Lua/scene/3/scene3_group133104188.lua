--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 456, monster_id = 21010201, pos = { x = 676.1, y = 200.4, z = 455.9 }, rot = { x = 4.4, y = 358.8, z = 357.2 }, level = 18, drop_tag = "丘丘人", pose_id = 9003 },
	{ config_id = 457, monster_id = 21010201, pos = { x = 678.2, y = 200.2, z = 458.2 }, rot = { x = 4.7, y = 257.9, z = 9.0 }, level = 18, drop_tag = "丘丘人", pose_id = 9003 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 710, gadget_id = 70310006, pos = { x = 676.1, y = 200.4, z = 457.7 }, rot = { x = 0.6, y = 197.5, z = 1.1 }, level = 19 },
	{ config_id = 711, gadget_id = 70220005, pos = { x = 681.9, y = 200.6, z = 460.0 }, rot = { x = 0.0, y = 197.4, z = 0.0 }, level = 18 },
	{ config_id = 712, gadget_id = 70220005, pos = { x = 681.7, y = 200.4, z = 458.4 }, rot = { x = 0.0, y = 197.4, z = 0.0 }, level = 18 }
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
		monsters = { 456, 457 },
		gadgets = { 710, 711, 712 },
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
