require('Actor/ActorCommon')
local gadgetActorProxy = require('Actor/Gadget/GadgetActorProxy')

local Q1200001Trigger = class("Q1200001Trigger", gadgetActorProxy)

Q1200001Trigger.defaultAlias = "Q1200001Trigger"

local q12000Cfg = require('Quest/Client/Q12000ClientConfig')

function Q1200001Trigger:OnPostDataPrepare()
end

function Q1200001Trigger:OnPostComponentPrepare()
	self:AddComponentTrigger(5, DistType.EULER, M.Pos(0, 0.8, 0), self.TriggerIn, self.TriggerOut)
end

function Q1200001Trigger:TriggerIn()
    print("Out Q12000TriggerSP01")
	local quest = actorMgr:GetActor(q12000Cfg.ActorAlias)
	if quest ~= nil then
		print("***************get quest success")
		quest:FinishQuest(false, nil)
	end
	print("35301 start: 222")
    self:DestroySelf()
end

function Q1200001Trigger:TriggerOut()
	--print("Exit " .. tostring(outCnt))
	--self:DestroySelf()
	print("35301 start: 111")
end

return Q1200001Trigger