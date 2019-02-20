-----------------------------------
-- Area: North Gustaberg
--  NPC: Cavernous Maw
-- !pos -78 -0.5 600 106
-- Teleports Players to Abyssea - Grauberg
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/teleports");
require("scripts/globals/abyssea");
local ID = require("scripts/zones/North_Gustaberg/IDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    if (ENABLE_ABYSSEA == 1 and player:getMainLvl() >= 30) then
        local HasStone = getTravStonesTotal(player);
        if (HasStone >= 1 and player:getQuestStatus(ABYSSEA, dsp.quests.ids.abyssea.DAWN_OF_DEATH) == QUEST_ACCEPTED
        and player:getQuestStatus(ABYSSEA, dsp.quests.ids.abyssea.AN_ULCEROUS_URAGNITE) == QUEST_AVAILABLE) then
            player:startEvent(0);
        else
            player:startEvent(908,0,1); -- No param = no entry.
        end
    else
        player:messageSpecial(ID.text.NOTHING_HAPPENS);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    -- print("CSID:",csid);
    -- print("RESULT:",option);
    if (csid == 0) then
        player:addQuest(ABYSSEA, dsp.quests.ids.abyssea.AN_ULCEROUS_URAGNITE);
    elseif (csid == 1) then
        -- Killed Amphitrite
    elseif (csid == 908 and option == 1) then
        player:setPos(-555,31,-760,0,254);
    end
end;