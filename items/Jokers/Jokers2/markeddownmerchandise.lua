SMODS.Joker{
    key = 'markeddownmerchandise',
    atlas = 'Jokers2',
    rarity = 1, 
    cost = 6, 
    unlocked = true, 
    discovered = true, 
    blueprint_compat = false, 
    eternal_compat = false,
    perishable_compat = true,
    pos = {x = 1, y = 3},
    config = {extra = {odds = 3, mult = 35, lawsuitamount = -5}},
    loc_vars = function(self, info_queue, card)
        return {vars = {G.GAME.probabilities.normal or 1, card.ability.extra.odds, card.ability.extra.mult, card.ability.extra.lawsuitamount}}
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                mult = card.ability.extra.mult
            }
        end
    end,
    calc_dollar_bonus = function(self, card)-------------STUPID PAYOUTTHING
        if pseudorandom('markeddownmerchandise') < G.GAME.probabilities.normal/card.ability.extra.odds then
            card_eval_status_text(card, 'extra', nil, nil, nil, {message = "Lawsuit Pending!", colour = HEX('FF3234')})
            bonus = card.ability.extra.lawsuitamount
            return bonus
        end
    end,
}


