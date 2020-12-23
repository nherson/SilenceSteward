local frame = CreateFrame("FRAME", "SilenceStewardFrame");
frame:RegisterEvent("GOSSIP_SHOW");

local function eventHandler(self, event, ...)
    local inCombat = UnitAffectingCombat("player");
    local gossipText = C_GossipInfo.GetText();
    local stewardTextMatch = string.match(gossipText, "Hoo! Can help?");
    if inCombat and stewardTextMatch ~= nil then
        C_GossipInfo.CloseGossip()
        print("Closing NPC dialog with steward while in combat!");
    end
end

frame:SetScript("OnEvent", eventHandler);