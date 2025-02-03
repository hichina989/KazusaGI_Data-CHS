require('Actor/ActorCommon')
local gadgetActorProxy = require('Actor/Gadget/GadgetActorProxy')

local Q20101Trigger05 = class("Q20101Trigger05", gadgetActorProxy)

Q20101Trigger05.defaultAlias = "Q20101Trigger05"

local q20101Cfg = require('Quest/Client/Q20101ClientConfig')

function Q20101Trigger05:OnPostDataPrepare()
end

function Q20101Trigger05:OnPostComponentPrepare()
	self:AddComponentTrigger(5, DistType.EULER, M.Pos(0, 0.8, 0), self.TriggerIn, self.TriggerOut)
end

function Q20101Trigger05:TriggerIn()
    print("In Q20101Trigger05")
	local quest = actorMgr:GetActor(q20101Cfg.ActorAlias)
	if quest ~= nil then
		quest:FinishQuestID(false, 2010136)
	end
    self:DestroySelf()
end

function Q20101Trigger05:TriggerOut()
	--print("Exit " .. tostring(outCnt))
    --self:DestroySelf()
end

return Q20101Trigger05