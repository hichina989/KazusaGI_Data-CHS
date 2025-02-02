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
	{ config_id = 1330, gadget_id = 70211101, pos = { x = 1941.5, y = 246.4, z = -911.9 }, rot = { x = 0.0, y = 97.9, z = 0.0 }, level = 10, drop_tag = "解谜低级蒙德", isOneoff = true },
	{ config_id = 1331, gadget_id = 70211101, pos = { x = 1741.7, y = 256.9, z = -825.7 }, rot = { x = 0.0, y = 285.8, z = 0.0 }, level = 10, drop_tag = "解谜低级蒙德", isOneoff = true },
	{ config_id = 1337, gadget_id = 70211101, pos = { x = 1970.3, y = 240.2, z = -370.4 }, rot = { x = 0.0, y = 318.4, z = 0.0 }, level = 10, drop_tag = "解谜低级蒙德", isOneoff = true },
	{ config_id = 1491, gadget_id = 70211101, pos = { x = 1954.6, y = 217.5, z = -643.1 }, rot = { x = 1.7, y = 1.9, z = 7.4 }, level = 10, drop_tag = "解谜低级蒙德", isOneoff = true }
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
		gadgets = { 1330, 1331, 1337, 1491 },
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
