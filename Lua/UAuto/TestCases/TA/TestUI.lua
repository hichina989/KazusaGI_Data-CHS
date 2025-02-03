
local baseClass = require('UAuto/TestCases/TA/TABase')
local UAutoLuaTestCase = class("TAUITest",baseClass)
local self = UAutoLuaTestCase
self.TestFixture = "TAUITest"
self.Category = "TA测试" --自行修改分类
self.Description = "TA_UI测试" --自行修改用例描述





UAutoLuaTestCase.Step_1 = {
    Order = 1, --执行顺序
    Type = CaseType.MonoTest,
    Description = "UI测试准备工作", --步骤描述
    Action = UAutoCoroutine(function()
        
        yield_return(self.base:RunGM("quest finish father 351 352 353"))
        yield_return(self:CloseMapIfExist())
        yield_return(self.base:RunGM("quest finish 35001 "))
        yield_return(self:CloseMapIfExist())
        yield_return(CS.UnityEngine.WaitForSeconds(5))
        yield_return(self.base:RunGM("AREA 3 ALL"))
        
        --一键解锁后关地图
        retry = 20
        while (retry>0) do  
            local map = CS.UnityEngine.GameObject.Find('InLevelMapPage');
           
            if(map~= nil and map.activeInHierarchy == true)
            then
                yield_return(self:CloseMapIfExist())
            else
                yield_return(CS.UnityEngine.WaitForSeconds(1))
            end
            retry = retry - 1
        end
        
        --跳一下防止摄像机不跟角色
        yield_return(self.base:Jump())

        -- 解锁扭蛋界面
        yield_return(self.base:RunGM("quest accept 35403"))
        yield_return(self.base:RunGM("quest finish 35403"))



        --开启性能采集
        local gm_startStatUnit = string.format("StartStatUnit Test@Server-Case@UItest@%s",'TAUITest')
        yield_return(self.base:RunGM(gm_startStatUnit))


        local uiManager = singletonManager:GetSingletonInstance("MoleMole.UIManager")
        
        yield_return(self:TAUpLoadDate())
        local remoteFile = self.base:UploadStatFile()
        self.base:UploadToStatDB(remoteFile)

	end)
    }


    UAutoLuaTestCase.Step_2 = {
        Order = 2, --执行顺序
        Type = CaseType.MonoTest,
        Description = "背包界面测试", --步骤描述
        Action = UAutoCoroutine(function()
            

        --------------- 背包界面测试 ---------------
        ----------------性能采集
        yield_return(CS.UnityEngine.WaitForSeconds(2))
        
        yield_return(self:TAUpLoadDate())
        
        -- 背包
        yield_return(self.base:MouseClick( "Canvas/Pages/InLevelMainPage/GrpMainPage/GrpMainBtn/GrpMainToggle/GrpTopPanel/BtnBag/Button"))
        yield_return(self.base:WaitFrames(66))

        local TabMobile = CS.UnityEngine.GameObject.Find("Tab_Mobile")
        local tabs = TabMobile:GetComponentsInChildren(typeof(CS.MoleMole.MonoImgTab))
        print(tabs.Length)

        ----------------性能采集
        yield_return(CS.UnityEngine.WaitForSeconds(2))
        
		yield_return(self:TAUpLoadDate())

        -- 武器分页
        tabs[0]:OnPointerClick(nil)
        yield_return(self.base:WaitFrames(66))

        ----------------性能采集
        yield_return(CS.UnityEngine.WaitForSeconds(2))
        
		yield_return(self:TAUpLoadDate())
        
        
        -- 详情按钮
        yield_return(self.base:MouseClick( "Canvas/Pages/BagPage/GrpBag/GrpOp/BtnUse/Content/ImgBg"))
        yield_return(self.base:WaitFrames(66))

        ----------------性能采集
        yield_return(CS.UnityEngine.WaitForSeconds(2))
        
		yield_return(self:TAUpLoadDate())

        -- 返回按钮
        yield_return(self.base:MouseClick( "Canvas/Pages/EquipOverviewPage/GrpEquip/BtnBack/Content/Btn"))
        yield_return(self.base:WaitFrames(66))

        ----------------性能采集
        yield_return(CS.UnityEngine.WaitForSeconds(2))
        
		yield_return(self:TAUpLoadDate())

        -- 圣遗物分页
        tabs[1]:OnPointerClick(nil)
        yield_return(self.base:WaitFrames(66))

        ----------------性能采集
        yield_return(CS.UnityEngine.WaitForSeconds(2))
        
        yield_return(self:TAUpLoadDate())

        -- 角色分页
        tabs[2]:OnPointerClick(nil)
        yield_return(self.base:WaitFrames(66))

        ----------------性能采集
        yield_return(CS.UnityEngine.WaitForSeconds(2))
        
        yield_return(self:TAUpLoadDate())

        -- 食物分页
        tabs[3]:OnPointerClick(nil)
        yield_return(self.base:WaitFrames(66))

        ----------------性能采集
        yield_return(CS.UnityEngine.WaitForSeconds(2))
        
        yield_return(self:TAUpLoadDate())

        -- 材料分页
        tabs[4]:OnPointerClick(nil)
        yield_return(self.base:WaitFrames(66))
        
        ----------------性能采集
        yield_return(CS.UnityEngine.WaitForSeconds(2))
        
        yield_return(self:TAUpLoadDate())

        -- 任务分页
        tabs[5]:OnPointerClick(nil)
        yield_return(self.base:WaitFrames(66))
        ----------------性能采集
        yield_return(CS.UnityEngine.WaitForSeconds(2))
        
        yield_return(self:TAUpLoadDate())

        -- 消耗品分页
        tabs[6]:OnPointerClick(nil)
        yield_return(self.base:WaitFrames(66))
        ----------------性能采集
        yield_return(CS.UnityEngine.WaitForSeconds(2))
        
        yield_return(self:TAUpLoadDate())

        -- 关闭背包
        yield_return(self.base:MouseClick( "Canvas/Pages/BagPage/GrpBag/BtnReturn/Content/Btn"))
        yield_return(self.base:WaitFrames(66))
        ----------------性能采集
        yield_return(CS.UnityEngine.WaitForSeconds(2))
        
        yield_return(self:TAUpLoadDate())
        yield_return(self.base:WaitFrames(200))




	end)
    }


    UAutoLuaTestCase.Step_3 = {
        Order = 3, --执行顺序
        Type = CaseType.MonoTest,
        Description = "角色界面测试", --步骤描述
        Action = UAutoCoroutine(function()
           





        --------------- 角色界面测试 ---------------
       
        ----------------性能采集
        yield_return(CS.UnityEngine.WaitForSeconds(2))
        
        yield_return(self:TAUpLoadDate())
        
        -- 角色
        yield_return(self.base:MouseClick( "Canvas/Pages/InLevelMainPage/GrpMainPage/GrpMainBtn/GrpMainToggle/GrpTopPanel/BtnSystem/Button"))
        yield_return(self.base:WaitFrames(66))
        ----------------性能采集
        yield_return(CS.UnityEngine.WaitForSeconds(2))
        
        yield_return(self:TAUpLoadDate())        

        -- 属性分页
        yield_return(self.base:MouseClick( "Canvas/Pages/CharacterPage/GrpCharacter/GrpTab/Menu/Content/BtnAvatar/Text/Touch"))
        yield_return(self.base:WaitFrames(66))
        ----------------性能采集
        yield_return(CS.UnityEngine.WaitForSeconds(2))
        
        yield_return(self:TAUpLoadDate())

        -- 武器分页
        yield_return(self.base:MouseClick( "Canvas/Pages/CharacterPage/GrpCharacter/GrpTab/Menu/Content/BtnWeapon/Text/Touch"))
        yield_return(self.base:WaitFrames(66))
        ----------------性能采集
        yield_return(CS.UnityEngine.WaitForSeconds(2))
        
        yield_return(self:TAUpLoadDate())


        -- 圣遗物分页
        yield_return(self.base:MouseClick( "Canvas/Pages/CharacterPage/GrpCharacter/GrpTab/Menu/Content/BtnRelic/Text/Touch"))
        yield_return(self.base:WaitFrames(66))
        ----------------性能采集
        yield_return(CS.UnityEngine.WaitForSeconds(2))
        
        yield_return(self:TAUpLoadDate())


        -- 命之座分页
        yield_return(self.base:MouseClick( "Canvas/Pages/CharacterPage/GrpCharacter/GrpTab/Menu/Content/BtnTalent/Text/Touch"))
        yield_return(self.base:WaitFrames(66))
        ----------------性能采集
        yield_return(CS.UnityEngine.WaitForSeconds(2))
        
        yield_return(self:TAUpLoadDate())


        -- 天赋分页
        yield_return(self.base:MouseClick( "Canvas/Pages/CharacterPage/GrpCharacter/GrpTab/Menu/Content/BtnSkill/Text/Touch"))
        yield_return(self.base:WaitFrames(66))
        ----------------性能采集
        yield_return(CS.UnityEngine.WaitForSeconds(2))
        
        yield_return(self:TAUpLoadDate())


        -- 资料分页
        yield_return(self.base:MouseClick( "Canvas/Pages/CharacterPage/GrpCharacter/GrpTab/Menu/Content/BtnFetter/Text/Touch"))
        yield_return(self.base:WaitFrames(66))
        ----------------性能采集
        yield_return(CS.UnityEngine.WaitForSeconds(2))
        
        yield_return(self:TAUpLoadDate())


        -- 关闭角色
        yield_return(self.base:MouseClick( "Canvas/Pages/CharacterPage/GrpCharacter/BtnReturn/Content/Btn"))
        yield_return(self.base:WaitFrames(66))
        ----------------性能采集
        yield_return(CS.UnityEngine.WaitForSeconds(2))
        
        yield_return(self:TAUpLoadDate())
        yield_return(self.base:WaitFrames(200))





    end)
    }


    UAutoLuaTestCase.Step_4 = {
        Order = 4, --执行顺序
        Type = CaseType.MonoTest,
        Description = "派蒙和任务界面测试", --步骤描述
        Action = UAutoCoroutine(function()
           
        --------------- 派蒙界面测试 ---------------
        ----------------性能采集
        yield_return(CS.UnityEngine.WaitForSeconds(2))
        
		yield_return(self:TAUpLoadDate())
        -- 派蒙
        yield_return(self.base:MouseClick( "Canvas/Pages/InLevelMainPage/GrpMainPage/MapInfo/BtnPlayerProfile"))
        yield_return(self.base:WaitFrames(66))
        ----------------性能采集
        yield_return(CS.UnityEngine.WaitForSeconds(2))
        
		yield_return(self:TAUpLoadDate())
        -- 打开角色一览
        yield_return(self.base:MouseClick( "Canvas/Pages/PlayerProfilePage/GrpProfile/GrpEntry/ScrollView/Content/AvatarList/Content"))
        yield_return(self.base:WaitFrames(66))
        ----------------性能采集
        yield_return(CS.UnityEngine.WaitForSeconds(2))
        
		yield_return(self:TAUpLoadDate())
        -- 关闭角色一览
        yield_return(self.base:MouseClick( "Canvas/Pages/AvatarPreviewPage/GrpAvatarPreview/BtnReturn/Content/Btn"))
        yield_return(self.base:WaitFrames(66))
        ----------------性能采集
        yield_return(CS.UnityEngine.WaitForSeconds(2))
        
		yield_return(self:TAUpLoadDate())
        -- 打开商店
        yield_return(self.base:MouseClick( "Canvas/Pages/PlayerProfilePage/GrpProfile/GrpEntry/ScrollView/Content/Shop/Content"))
        yield_return(self.base:WaitFrames(66))
        ----------------性能采集
        yield_return(CS.UnityEngine.WaitForSeconds(2))
        
		yield_return(self:TAUpLoadDate())
        -- 点击兑换
        yield_return(self.base:MouseClick( "Canvas/Pages/ShopPage/GrpShop/GrpBottom/GrpAction/BtnExchange/Content/ImgBg"))
        yield_return(self.base:WaitFrames(66))
        ----------------性能采集
        yield_return(CS.UnityEngine.WaitForSeconds(2))
        
		yield_return(self:TAUpLoadDate())
        -- 点击取消
        yield_return(self.base:MouseClick( "Canvas/Dialogs/GeneralDialog/Dialog/Content/ActionButton/CancelBtn/Content/ImgBg"))
        yield_return(self.base:WaitFrames(66))
        ----------------性能采集
        yield_return(CS.UnityEngine.WaitForSeconds(2))
        
		yield_return(self:TAUpLoadDate())
        -- 关闭商店
        yield_return(self.base:MouseClick( "Canvas/Pages/ShopPage/GrpShop/BtnReturn/Content/Btn"))
        yield_return(self.base:WaitFrames(66))
        ----------------性能采集
        yield_return(CS.UnityEngine.WaitForSeconds(2))
        
		yield_return(self:TAUpLoadDate())
        -- 打开设置
        yield_return(self.base:MouseClick( "Canvas/Pages/PlayerProfilePage/GrpProfile/GrpEntry/ScrollView/Content/Setting/Content"))
        yield_return(self.base:WaitFrames(66))
        ----------------性能采集
        yield_return(CS.UnityEngine.WaitForSeconds(2))
        
		yield_return(self:TAUpLoadDate())
        -- 控制页
        yield_return(self.base:MouseClick( "Canvas/Pages/SettingPage/GrpSetting/GrpTab/Menu/Content/BtnControl/Text/Touch"))
        yield_return(self.base:WaitFrames(66))
        ----------------性能采集
        yield_return(CS.UnityEngine.WaitForSeconds(2))
        
		yield_return(self:TAUpLoadDate())
        -- 图像页
        yield_return(self.base:MouseClick( "Canvas/Pages/SettingPage/GrpSetting/GrpTab/Menu/Content/BtnGraphic/Text/Touch"))
        yield_return(self.base:WaitFrames(66))
        ----------------性能采集
        yield_return(CS.UnityEngine.WaitForSeconds(2))
        
		yield_return(self:TAUpLoadDate())
        -- 声音页
        yield_return(self.base:MouseClick( "Canvas/Pages/SettingPage/GrpSetting/GrpTab/Menu/Content/BtnSound/Text/Touch"))
        yield_return(self.base:WaitFrames(66))
        ----------------性能采集
        yield_return(CS.UnityEngine.WaitForSeconds(2))
        
		yield_return(self:TAUpLoadDate())
        -- 消息页
        yield_return(self.base:MouseClick( "Canvas/Pages/SettingPage/GrpSetting/GrpTab/Menu/Content/BtnMessage/Text/Touch"))
        yield_return(self.base:WaitFrames(66))
        ----------------性能采集
        yield_return(CS.UnityEngine.WaitForSeconds(2))
        
		yield_return(self:TAUpLoadDate())
        -- 语言页
        yield_return(self.base:MouseClick( "Canvas/Pages/SettingPage/GrpSetting/GrpTab/Menu/Content/BtnLanguage/Text/Touch"))
        yield_return(self.base:WaitFrames(66))
        ----------------性能采集
        yield_return(CS.UnityEngine.WaitForSeconds(2))
        
		yield_return(self:TAUpLoadDate())
        -- 其他页
        yield_return(self.base:MouseClick( "Canvas/Pages/SettingPage/GrpSetting/GrpTab/Menu/Content/BtnOther/Text/Touch"))
        yield_return(self.base:WaitFrames(66))
        ----------------性能采集
        yield_return(CS.UnityEngine.WaitForSeconds(2))
        
		yield_return(self:TAUpLoadDate())
        -- 关闭设置
        yield_return(self.base:MouseClick( "Canvas/Pages/SettingPage/GrpSetting/BtnReturn/Content/Btn"))
        yield_return(self.base:WaitFrames(66))
        ----------------性能采集
        yield_return(CS.UnityEngine.WaitForSeconds(2))
        
		yield_return(self:TAUpLoadDate())
        -- 打开邮件
        yield_return(self.base:MouseClick( "Canvas/Pages/PlayerProfilePage/GrpProfile/GrpEntry/ScrollView/Content/Mail/Content"))
        yield_return(self.base:WaitFrames(66))
        ----------------性能采集
        yield_return(CS.UnityEngine.WaitForSeconds(2))
        
		yield_return(self:TAUpLoadDate())
        -- 关闭邮件
        yield_return(self.base:MouseClick( "Canvas/Pages/MailOverviewPage/GrpMail/BtnReturn/Content/Btn"))
        yield_return(self.base:WaitFrames(66))
        ----------------性能采集
        yield_return(CS.UnityEngine.WaitForSeconds(2))
        
		yield_return(self:TAUpLoadDate())
        -- 打开时间
        yield_return(self.base:MouseClick( "Canvas/Pages/PlayerProfilePage/GrpProfile/GrpEntry/ScrollView/Content/TimeAcceleration/Content"))
        yield_return(self.base:WaitFrames(66))
        ----------------性能采集
        yield_return(CS.UnityEngine.WaitForSeconds(2))
        
		yield_return(self:TAUpLoadDate())
        -- 关闭时间
        yield_return(self.base:MouseClick( "Canvas/Pages/InLevelClockPage/GrpClock/Top/BtnReturn/Content/Btn"))
        yield_return(self.base:WaitFrames(66))
        ----------------性能采集
        yield_return(CS.UnityEngine.WaitForSeconds(2))
        
		yield_return(self:TAUpLoadDate())
        -- 打开队伍配置
        yield_return(self.base:MouseClick( "Canvas/Pages/PlayerProfilePage/GrpProfile/GrpEntry/ScrollView/Content/Team/Content"))
        yield_return(self.base:WaitFrames(66))
        ----------------性能采集
        yield_return(CS.UnityEngine.WaitForSeconds(2))
        
		yield_return(self:TAUpLoadDate())
        -- 关闭队伍配置
        yield_return(self.base:MouseClick( "Canvas/Pages/TeamPage/GrpTeam/BtnReturn/Content/Btn"))
        yield_return(self.base:WaitFrames(66))
        ----------------性能采集
        yield_return(CS.UnityEngine.WaitForSeconds(2))
        
		yield_return(self:TAUpLoadDate())
        -- 关闭派蒙
        yield_return(self.base:MouseClick( "Canvas/Pages/PlayerProfilePage/BgMask"))
        yield_return(self.base:WaitFrames(66))
        ----------------性能采集
        yield_return(CS.UnityEngine.WaitForSeconds(2))
        
		yield_return(self:TAUpLoadDate())
        
        --------------- 任务界面测试 ---------------
        -- 任务
        yield_return(self.base:MouseClick( "Canvas/Pages/InLevelMainPage/GrpMainPage/MapInfo/BtnToggleQuest"))
        yield_return(self.base:WaitFrames(66))

        -- 关闭任务
        yield_return(self.base:MouseClick( "Canvas/Dialogs/InLevelQuestDialog/GrpQuestBook/BtnClose/Content/Btn"))
        yield_return(self.base:WaitFrames(66))





    end)
    }


    UAutoLuaTestCase.Step_5 = {
        Order = 5, --执行顺序
        Type = CaseType.MonoTest,
        Description = "地图界面测试", --步骤描述
        Action = UAutoCoroutine(function()
           
        --------------- 地图界面测试 ---------------
          ----------------性能采集
          yield_return(CS.UnityEngine.WaitForSeconds(2))
          
          yield_return(self:TAUpLoadDate())
        -- 打开地图
        yield_return(self.base:MouseClick( "Canvas/Pages/InLevelMainPage/GrpMainPage/MapInfo/GrpMiniMap/GrpMap/Btn"))
        yield_return(self.base:WaitFrames(66))
        ----------------性能采集
        yield_return(CS.UnityEngine.WaitForSeconds(2))
		yield_return(self:TAUpLoadDate())
        -- 选择地图锚点
        yield_return(self.base:MouseClick( "Canvas/Pages/InLevelMapPage/GrpMap/MarkContainer/Layer1/7/Point/Icon"))
        yield_return(self.base:WaitFrames(66))
        ----------------性能采集
        yield_return(CS.UnityEngine.WaitForSeconds(2))
		yield_return(self:TAUpLoadDate())
        -- 取消
        yield_return(self.base:MouseClick( "Canvas/Pages/InLevelMapPage/GrpMap/MapTipsContainer/MapTips/BtnCancel/Content/Btn"))
        yield_return(self.base:WaitFrames(66))
        ----------------性能采集
        yield_return(CS.UnityEngine.WaitForSeconds(2))
		yield_return(self:TAUpLoadDate())
        -- 关闭地图
        yield_return(self.base:MouseClick( "Canvas/Pages/InLevelMapPage/GrpMap/Top/BtnClose/Content/Btn"))
        yield_return(self.base:WaitFrames(66))
        ----------------性能采集
        yield_return(CS.UnityEngine.WaitForSeconds(2))
        
		yield_return(self:TAUpLoadDate())
        


    end)
    }


    UAutoLuaTestCase.Step_6 = {
        Order = 6, --执行顺序
        Type = CaseType.MonoTest,
        Description = "联机界面测试", --步骤描述
        Action = UAutoCoroutine(function()
           
        --------------- 联机界面测试 ---------------
         ----------------性能采集
         yield_return(CS.UnityEngine.WaitForSeconds(2))
         
         yield_return(self:TAUpLoadDate())   
        -- 打开联机
        yield_return(self.base:MouseClick( "Canvas/Pages/InLevelMainPage/GrpMainPage/MapInfo/BtnTogglePlayerList", true ))
        yield_return(self.base:WaitFrames(66))
        ----------------性能采集
        yield_return(CS.UnityEngine.WaitForSeconds(2))
        
		yield_return(self:TAUpLoadDate())
        -- 关闭联机
        yield_return(self.base:MouseClick( "Canvas/Pages/MPLobbyPage/GrpMPLobby/BtnReturn/Content/Btn"))
        yield_return(self.base:WaitFrames(66))
        ----------------性能采集
        yield_return(CS.UnityEngine.WaitForSeconds(2))
        
		yield_return(self:TAUpLoadDate())
        

    end)
    }


    UAutoLuaTestCase.Step_7 = {
        Order = 7, --执行顺序
        Type = CaseType.MonoTest,
        Description = "烹饪界面测试", --步骤描述
        Action = UAutoCoroutine(function()
           
        --------------- 烹饪界面测试 ---------------
         ----------------性能采集
         yield_return(CS.UnityEngine.WaitForSeconds(2))
         
         yield_return(self:TAUpLoadDate())     
        -- 打开烹饪界面
        uiManager:ShowPage(CS.MoleMole.CookingPageContext(CS.MoleMole.CookingPageType.COOK))
        yield_return(self.base:WaitFrames(66))
        ----------------性能采集
        yield_return(CS.UnityEngine.WaitForSeconds(2))
        
		yield_return(self:TAUpLoadDate())
        -- 制作
        yield_return(self.base:RunGM("item add 100011 100"))
        yield_return(self.base:RunGM("item add 100064 100"))
        yield_return(self.base:MouseClick( "Canvas/Pages/CookingPage/GrpCooking/GrpOp/BtnUse/Content/ImgBg"))
        yield_return(self.base:WaitFrames(66))

        ----------------性能采集
        yield_return(CS.UnityEngine.WaitForSeconds(2))
        
		yield_return(self:TAUpLoadDate())
        -- 开始
        yield_return(self.base:MouseClick( "Canvas/Pages/CookingQTEPage/GrpCooking/GrpOp/SELAction/GrpAction/BtnStart/Content/ImgBg"))
        yield_return(self.base:WaitFrames(300))
        ----------------性能采集
        yield_return(CS.UnityEngine.WaitForSeconds(2))
        
		yield_return(self:TAUpLoadDate())
        -- 关闭开始
        yield_return(self.base:MouseClick( "Canvas/Pages/CookingQTEPage/GrpCooking/GrpSettlement/ActionPanel/BtnClose/Content/ImgBg"))
        yield_return(self.base:WaitFrames(66))
        ----------------性能采集
        yield_return(CS.UnityEngine.WaitForSeconds(2))
        
		yield_return(self:TAUpLoadDate())
        -- 关闭制作
        yield_return(self.base:MouseClick( "Canvas/Pages/CookingQTEPage/GrpCooking/BtnReturn/Content/Btn"))
        yield_return(self.base:WaitFrames(66))
        ----------------性能采集
        yield_return(CS.UnityEngine.WaitForSeconds(2))
        yield_return(self:TAUpLoadDate())
        -- 关闭烹饪界面
        yield_return(self.base:MouseClick( "Canvas/Pages/CookingPage/GrpCooking/BtnReturn/Content/Btn"))
        yield_return(self.base:WaitFrames(66))
        ----------------性能采集
        yield_return(CS.UnityEngine.WaitForSeconds(2))
        
		yield_return(self:TAUpLoadDate())
        
	end)
    }


    UAutoLuaTestCase.Step_8 = {
        Order = 8, --执行顺序
        Type = CaseType.MonoTest,
        Description = "地城界面测试", --步骤描述
        Action = UAutoCoroutine(function()
           
        --------------- 地城界面测试 ---------------
         ----------------性能采集
         yield_return(CS.UnityEngine.WaitForSeconds(2))
         
         yield_return(self:TAUpLoadDate())    
        -- 打开地城界面
        singletonManager:GetSingletonInstance("MoleMole.UIManager"):ShowPage(CS.MoleMole.DungeonEntryPageContext(20))
        yield_return(self.base:WaitFrames(66))
        ----------------性能采集
        yield_return(CS.UnityEngine.WaitForSeconds(2))
        
		yield_return(self:TAUpLoadDate())
        -- 关闭地城界面
        yield_return(self.base:MouseClick( "Canvas/Pages/DungeonEntryPage/GrpDungeon/BtnReturn/Content/Btn"))
        yield_return(self.base:WaitFrames(66))
        ----------------性能采集
        yield_return(CS.UnityEngine.WaitForSeconds(2))
        
		yield_return(self:TAUpLoadDate())
        
    end)
    }


    UAutoLuaTestCase.Step_9 = {
        Order = 9, --执行顺序
        Type = CaseType.MonoTest,
        Description = "委托界面测试", --步骤描述
        Action = UAutoCoroutine(function()
           
        ------------- 探索委托界面测试 ---------------
        ----------------性能采集
        yield_return(CS.UnityEngine.WaitForSeconds(2))
        
		yield_return(self:TAUpLoadDate())    
        -- 打开探索委托界面
        local uiManager = singletonManager:GetSingletonInstance("MoleMole.UIManager")
        uiManager:ShowPage(CS.MoleMole.ExplorationPageContext())
        yield_return(self.base:WaitFrames(66))
        ----------------性能采集
        yield_return(CS.UnityEngine.WaitForSeconds(2))
        
		yield_return(self:TAUpLoadDate())
        -- 切换左侧ScrollView
        yield_return(self.base:MouseClick( "Canvas/Pages/ExplorationPage/GrpExplore/GrpExploreArea/ScrollView/Content/1/Text/Touch"))
        yield_return(self.base:WaitFrames(66))
         ----------------性能采集
         yield_return(CS.UnityEngine.WaitForSeconds(2))
         
         yield_return(self:TAUpLoadDate())   
        -- 关闭探索委托
        yield_return(self.base:MouseClick( "Canvas/Pages/ExplorationPage/GrpExplore/BtnReturn/Content/Btn"))
        yield_return(self.base:WaitFrames(66))
        ----------------性能采集
        yield_return(CS.UnityEngine.WaitForSeconds(2))
        
		yield_return(self:TAUpLoadDate())
        
    end)
    }


    UAutoLuaTestCase.Step_10 = {
        Order = 10, --执行顺序
        Type = CaseType.MonoTest,
        Description = "扭蛋界面测试", --步骤描述
        Action = UAutoCoroutine(function()
           
        --------------- 扭蛋界面测试 ---------------
         ----------------性能采集
         yield_return(CS.UnityEngine.WaitForSeconds(2))
         
         yield_return(self:TAUpLoadDate())   
        -- 打开扭蛋界面
        yield_return(self.base:MouseClick( "Canvas/Pages/InLevelMainPage/GrpMainPage/GrpMainBtn/GrpMainToggle/GrpTopPanel/BtnGacha/Button"))
        yield_return(self.base:WaitFrames(66))
        yield_return(self.base:RunGM("item add 223 1000"))
        yield_return(self.base:RunGM("item add 224 1000"))
        ----------------性能采集
        yield_return(CS.UnityEngine.WaitForSeconds(2))
        
		yield_return(self:TAUpLoadDate())
        -- 十连抽
        yield_return(self.base:MouseClick( "Canvas/Pages/InLevelGachaPage/GrpGacha/GrpAction/BtnTenTimes/Content/ImgBg"))
        yield_return(self.base:WaitFrames(200))
        ----------------性能采集
        yield_return(CS.UnityEngine.WaitForSeconds(2))
        
		yield_return(self:TAUpLoadDate())
        -- 许愿
        local gachaManager = singletonManager:GetSingletonInstance("MoleMole.GachaManager")
        local page = gachaManager:GetPrivateField("_gachaGazingPage")
        page:DoGacha()

        yield_return(self.base:WaitFrames(66))

        yield_return(self.base:MouseClick( "Canvas/SpecialDialogs/SkipWidgetContext/Touch"))
        yield_return(self.base:WaitFrames(200))
        
        -- 点击跳过按钮
        yield_return(self.base:MouseClick( "Canvas/SpecialDialogs/SkipWidgetContext/Skip/BtnSkip/Content/Touch"))
        yield_return(self.base:WaitFrames(66))
        ----------------性能采集
        yield_return(CS.UnityEngine.WaitForSeconds(2))
        
		yield_return(self:TAUpLoadDate())
        -- 点击OK按钮
        yield_return(self.base:MouseClick( "Canvas/SpecialDialogs/GeneralDialog/Dialog/Content/ActionButton/OKBtn/Content/ImgBg"))
        yield_return(self.base:WaitFrames(66))
        ----------------性能采集
        yield_return(CS.UnityEngine.WaitForSeconds(2))
        
		yield_return(self:TAUpLoadDate())
        -- 点击关闭
        yield_return(self.base:MouseClick( "Canvas/Pages/InLevelGachaSettlementPage/GrpGacha/BtnReturn/Content/Btn"))
        ----------------性能采集
        yield_return(CS.UnityEngine.WaitForSeconds(2))
        
		yield_return(self:TAUpLoadDate())
        -- 关闭扭蛋
        yield_return(self.base:MouseClick( "Canvas/Pages/InLevelGachaPage/GrpGacha/BtnReturn/Content/Btn"))
        ----------------性能采集
        yield_return(CS.UnityEngine.WaitForSeconds(2))
        
		yield_return(self:TAUpLoadDate())
	end)
    }


    UAutoLuaTestCase.Step_11 = {
        Order = 11, --执行顺序
        Type = CaseType.MonoTest,
        Description = "合成界面测试", --步骤描述
        Action = UAutoCoroutine(function()
           
        --------------- 合成界面测试 ---------------
          ----------------性能采集
          yield_return(CS.UnityEngine.WaitForSeconds(2))
          
          yield_return(self:TAUpLoadDate()) 
        -- 打开合成界面
        uiManager:ShowPage(CS.MoleMole.SynthesisPageContext())
        yield_return(self.base:WaitFrames(66))
        ----------------性能采集
        yield_return(CS.UnityEngine.WaitForSeconds(2))
        
		yield_return(self:TAUpLoadDate())
        -- 关闭合成界面
        yield_return(self.base:MouseClick( "Canvas/Pages/SynthesisPage/GrpSynthesis/BtnReturn/Content/Btn"))
        yield_return(self.base:WaitFrames(66))
        ----------------性能采集
        yield_return(CS.UnityEngine.WaitForSeconds(2))
        
		yield_return(self:TAUpLoadDate())
        

    end)
    }


    UAutoLuaTestCase.Step_12 = {
        Order = 12, --执行顺序
        Type = CaseType.MonoTest,
        Description = "锻造界面测试", --步骤描述
        Action = UAutoCoroutine(function()
           
        --------------- 锻造界面测试 ---------------
         ----------------性能采集
         yield_return(CS.UnityEngine.WaitForSeconds(2))
         
         yield_return(self:TAUpLoadDate())       
        -- 打开锻造界面
        uiManager:ShowPage(CS.MoleMole.ForgingPageContext())
        yield_return(self.base:WaitFrames(66))
        ----------------性能采集
        yield_return(CS.UnityEngine.WaitForSeconds(2))
		yield_return(self:TAUpLoadDate())
        -- 关闭锻造界面
        yield_return(self.base:MouseClick( "Canvas/Pages/ForgingPage/GrpForging/BtnReturn/Content/Btn"))
        yield_return(self.base:WaitFrames(66))
        ----------------性能采集
        yield_return(CS.UnityEngine.WaitForSeconds(2))
        
		yield_return(self:TAUpLoadDate())

        
	end)
}


UAutoLuaTestCase.Step_13 = {
    Order = 13, --执行顺序
    Type = CaseType.MonoTest,
    Description = "上传数据", --步骤描述
    Action = UAutoCoroutine(function()
		yield_return(self:TAUpLoadDate())
		yield_return(self.base:RunGM("StopStatUnit"))
		local remoteFile = self.base:UploadStatFile()
		self.base:UploadToStatDB(remoteFile)
	end)
}

return self
