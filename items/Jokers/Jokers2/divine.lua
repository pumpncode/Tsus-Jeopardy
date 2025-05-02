SMODS.Joker{
    key = 'divine',
    atlas = 'Jokers2',
    rarity = 3, 
    cost = 1, 
    unlocked = true, 
    discovered = true, 
    blueprint_compat = false, 
    eternal_compat = false,
    perishable_compat = true,
    pos = {x = 3, y = 3},
    config = {extra = {odds = 7, killed = 0, level = 1, exp = 0, xmult = 1.1, xchips = 1.1, has_exppayout = 0, expincrement = 5, chancelevel = 0, exprequirement = 10}},
    loc_vars = function(self, info_queue, card)
        if card.ability.extra.level < 20 then
            return {vars = {(G.GAME.probabilities.normal+(card.ability.extra.chancelevel*0.2)), card.ability.extra.odds, card.ability.extra.killed,
            card.ability.extra.level, card.ability.extra.exp, card.ability.extra.exprequirement,
            card.ability.extra.xmult, card.ability.extra.xchips, card.ability.extra.has_exppayout, 
            card.ability.extra.expincrement, card.ability.extra.chancelevel}}
        elseif card.ability.extra.level >= 20 then
            return {key = 'j_tje_divine20', vars = {(G.GAME.probabilities.normal+(card.ability.extra.chancelevel*0.2)), card.ability.extra.odds, card.ability.extra.killed,
            card.ability.extra.level, card.ability.extra.exp, card.ability.extra.exprequirement,
            card.ability.extra.xmult, card.ability.extra.xchips, card.ability.extra.has_exppayout, 
            card.ability.extra.expincrement, card.ability.extra.chancelevel}}
        end   
    end,
    calculate = function(self, card, context)
        ---Declaring exp requirements per level
        if card.ability.extra.level == 1 then
            card.ability.extra.exprequirement = 10
        elseif card.ability.extra.level == 2 then
            card.ability.extra.exprequirement = 20
        elseif card.ability.extra.level == 3 then
            card.ability.extra.exprequirement = 30
        elseif card.ability.extra.level == 4 then
            card.ability.extra.exprequirement = 35
        elseif card.ability.extra.level == 5 then
            card.ability.extra.exprequirement = 40
        elseif card.ability.extra.level == 6 then
            card.ability.extra.exprequirement = 45
        elseif card.ability.extra.level == 7 then
            card.ability.extra.exprequirement = 50
        elseif card.ability.extra.level == 8 then
            card.ability.extra.exprequirement = 55
        elseif card.ability.extra.level == 9 then
            card.ability.extra.exprequirement = 60
        elseif card.ability.extra.level == 10 then
            card.ability.extra.exprequirement = 65
        elseif card.ability.extra.level == 11 then
            card.ability.extra.exprequirement = 70
        elseif card.ability.extra.level == 12 then
            card.ability.extra.exprequirement = 75
        elseif card.ability.extra.level == 13 then
            card.ability.extra.exprequirement = 80
        elseif card.ability.extra.level == 14 then
            card.ability.extra.exprequirement = 80
        elseif card.ability.extra.level == 15 then
            card.ability.extra.exprequirement = 80
        elseif card.ability.extra.level == 16 then
            card.ability.extra.exprequirement = 85
        elseif card.ability.extra.level == 17 then
            card.ability.extra.exprequirement = 85
        elseif card.ability.extra.level == 18 then
            card.ability.extra.exprequirement = 85
        elseif card.ability.extra.level == 19 then
            card.ability.extra.exprequirement = 99
        elseif card.ability.extra.level == 20 then
            card.ability.extra.exprequirement = 9999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999
        end
        ---Declaring stats per level
        if card.ability.extra.level < 6 and card.ability.extra.levelupcheck == 0 then
            card.ability.extra.levelupcheck = 1
            card.ability.extra.xmult = 1+(card.ability.extra.level*0.25)
            card.ability.extra.xchips = 1+(card.ability.extra.level*0.5)
        elseif card.ability.extra.level >= 6 and card.ability.extra.level < 10 and card.ability.extra.levelupcheck == 0 then
            card.ability.extra.levelupcheck = 1
            card.ability.extra.xmult = 1+(card.ability.extra.level*0.5)
            card.ability.extra.xchips = 1+(card.ability.extra.level*0.75)
            card.ability.extra.chancelevel = card.ability.extra.chancelevel+1
        elseif card.ability.extra.level >= 10 and card.ability.extra.level < 20 and card.ability.extra.levelupcheck == 0 then
            card.ability.extra.levelupcheck = 1
            card.ability.extra.xmult = 1+(card.ability.extra.level*1)
            card.ability.extra.xchips = 1+(card.ability.extra.level*2)
            card.ability.extra.chancelevel = card.ability.extra.chancelevel+2
        elseif card.ability.extra.level >= 20 and card.ability.extra.levelupcheck == 0 then
            card.ability.extra.levelupcheck = 1
            card.ability.extra.xmult = 99
            card.ability.extra.xchips = 99
            card.ability.extra.chancelevel = 490
        end
        if context.joker_main then
            for i, handcards in ipairs(G.hand.cards) do
                if pseudorandom('divine') < ((G.GAME.probabilities.normal+(card.ability.extra.chancelevel*0.2))/card.ability.extra.odds) then
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.3,
                        func = function()
                            play_sound('tje_divine_kill')
                            handcards:start_dissolve({G.C.RED}, nil, 1.6)
                            G.E_MANAGER:add_event(Event({  
                                func = function()
                                    print('expadded')
                                    card.ability.extra.killed = card.ability.extra.killed+1
                                    handcards:remove()
                                    return true
                                end    
                            }))           
                            return true
                        end
                    }))
                end
            end
            SMODS.calculate_effect({xmult = card.ability.extra.xmult, xchips = card.ability.extra.xchips}, card)
        elseif context.end_of_round and card.ability.extra.has_exppayout == 0 and card.ability.extra.killed > 0 and card.ability.extra.level ~= 20 then
            card.ability.extra.has_exppayout = 1
            card.ability.extra.exp = card.ability.extra.exp+card.ability.extra.killed*card.ability.extra.expincrement
            return {
                message = localize {type ='variable', key ='a_exp', vars = {card.ability.extra.killed*card.ability.extra.expincrement}},
                colour = HEX('ff37df')
            }
        elseif context.setting_blind then
            card.ability.extra.has_exppayout = 0
            card.ability.extra.killed = 0
        end
        if card.ability.extra.exp >= card.ability.extra.exprequirement and card.ability.extra.level ~= 20 then
            card.ability.extra.exp = card.ability.extra.exp-card.ability.extra.exprequirement
            card.ability.extra.level = card.ability.extra.level+1
            card.ability.extra.levelupcheck = 0
            play_sound('tje_divine_lvup')
            card_eval_status_text(card, 'extra', nil, nil, nil, {message = "*LEVEL UP!", colour = HEX('37e8ff')})
        end
    end 
}
