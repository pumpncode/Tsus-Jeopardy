SMODS.Joker{
    key = 'dacnovania',
    atlas = 'Jokers2',
    rarity = 2, 
    cost = 6, 
    unlocked = true, 
    discovered = true, 
    blueprint_compat = false, 
    eternal_compat = false,
    perishable_compat = true,
    pos = {x = 1, y = 1},
    config = {extra = {odds = 2, storedmult = 0, hasstored = 0, hashalved = 0}},
    loc_vars = function(self, info_queue, card)
        return {vars = {G.GAME.probabilities.normal or 1, card.ability.extra.odds*2, card.ability.extra.odds, card.ability.extra.storedmult, card.ability.extra.hasstored, card.ability.extra.hashalved}}
    end,
    calculate = function(self, card, context)
        if context.before and card.ability.extra.hasstored == 0 then
            card.ability.extra.storedmult = card.ability.extra.storedmult+(mult/2)
            card_eval_status_text(card, 'extra', nil, nil, nil, {message = ("*stored."), colour = HEX('A01C1D')})
        end
        if context.joker_main and pseudorandom('dacnovania') < G.GAME.probabilities.normal/card.ability.extra.odds then
            card_eval_status_text(card, 'extra', nil, nil, nil, {message = ("*scored."), colour = HEX('A01C1D')})
            return {
                mult = card.ability.extra.storedmult
            }
        elseif context.end_of_round and card.ability.extra.hashalved == 0 then
            if pseudorandom('dacnovania2') < G.GAME.probabilities.normal/(card.ability.extra.odds*2) then
                card_eval_status_text(card, 'extra', nil, nil, nil, {message = ("*halved."), colour = HEX('A01C1D')})
                card.ability.extra.storedmult = card.ability.extra.storedmult/2
            end
            card.ability.extra.hashalved = 1
        elseif context.setting_blind then
            card.ability.extra.hashalved = 0
        end
    end
}



