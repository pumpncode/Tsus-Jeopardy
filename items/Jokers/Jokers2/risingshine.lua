SMODS.Joker{
    key = 'risingshine',
    atlas = 'Jokers2',
    rarity = 3, 
    cost = 12, 
    unlocked = true, 
    discovered = true, 
    blueprint_compat = false, 
    eternal_compat = false,
    perishable_compat = true,
    pos = {x = 4, y = 1},
    config = {extra = {odds = 4, stage = 1, maxstage = 3, stagecheck = 0}},
    loc_vars = function(self, info_queue, card)
        return {vars = {G.GAME.probabilities.normal or 1, card.ability.extra.odds, card.ability.extra.stage, card.ability.extra.maxstage, card.ability.extra.stagecheck}}
    end,
    calculate = function(self, card, context)
        if context.setting_blind then
            card.ability.extra.stagecheck = 0
        end
        if context.end_of_round and G.GAME.blind.boss and card.ability.extra.stage < card.ability.extra.maxstage and card.ability.extra.stagecheck == 0 then
            card_eval_status_text(card, 'extra', nil, nil, nil, {message = "Grow!", colour = HEX('38da61')})
            card.ability.extra.stage = card.ability.extra.stage+1
            card.ability.extra.stagecheck = 1
        end
    end,
    calc_dollar_bonus = function(self, card)-------------STUPID PAYOUTTHING
        if pseudorandom('risingshine') < G.GAME.probabilities.normal/card.ability.extra.odds then
            card_eval_status_text(card, 'extra', nil, nil, nil, {message = "Zzz...", colour = HEX('fecb13')})
            bonus = math.floor((G.GAME.interest_cap/7.5*card.ability.extra.stage*-1))
            return bonus
        else bonus = math.floor((G.GAME.interest_cap/7.5*card.ability.extra.stage))
            card_eval_status_text(card, 'extra', nil, nil, nil, {message = "^o^", colour = HEX('fecb13')})
            return bonus
        end
    end,
}


