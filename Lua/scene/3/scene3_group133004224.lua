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
	{ config_id = 1260, gadget_id = 70130001, pos = { x = 2203.7, y = 230.2, z = -770.5 }, rot = { x = 0.0, y = 160.0, z = 0.0 }, level = 2 },
	{ config_id = 1263, gadget_id = 70130001, pos = { x = 2213.2, y = 220.0, z = -846.1 }, rot = { x = 0.0, y = 153.5, z = 0.0 }, level = 2 },
	{ config_id = 1264, gadget_id = 70130001, pos = { x = 2322.1, y = 225.0, z = -848.6 }, rot = { x = 0.0, y = 182.4, z = 0.0 }, level = 2 },
	{ config_id = 1265, gadget_id = 70130003, pos = { x = 2177.8, y = 233.6, z = -797.3 }, rot = { x = 0.0, y = 1.8, z = 0.0 }, level = 2 },
	{ config_id = 1266, gadget_id = 70130003, pos = { x = 2172.2, y = 238.6, z = -876.3 }, rot = { x = 0.0, y = 9.7, z = 0.0 }, level = 2 },
	{ config_id = 1267, gadget_id = 70130003, pos = { x = 2295.5, y = 234.0, z = -949.2 }, rot = { x = 0.0, y = 2.6, z = 0.0 }, level = 2 },
	{ config_id = 1268, gadget_id = 70130003, pos = { x = 2361.9, y = 234.2, z = -860.9 }, rot = { x = 0.0, y = 6.6, z = 0.0 }, level = 2 }
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
		monsters = { },
		gadgets = { 1260, 1263, 1264, 1265, 1266, 1267, 1268 },
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
