local baseClass = require("UAuto/Base/UAutoLuaTestBase")
local UAutoLuaTestCase = class("PlayCutScene29", baseClass)
local self = UAutoLuaTestCase
self.TestFixture = "CutScene29"
self.Category = "CutScene" --自行修改分类
self.Description = "香菱登场" --自行修改用例描述

UAutoLuaTestCase.Step_1 = {
    Order = 1, --执行顺序
    Type = CaseType.MonoTest,
    Description = "香菱登场", --步骤描述
    Action = UAutoCoroutine(
        function()
			yield_return(self:EnterWorldBySex())
			
			yield_return(self:GotoPos("1956.99 208.5 -812.6"))

			yield_return(self:PlayCutscene(1100001,self.TestFixture))

        end
    )
}

return self