SMODS.Joker{
    key = 'cookiecat',
    atlas = 'Jokers2',
    rarity = 1, 
    cost = 3, 
    unlocked = true, 
    discovered = true, 
    blueprint_compat = false, 
    eternal_compat = false,
    perishable_compat = true,
    pos = {x = 3, y = 1},
    config = {extra = {odds = 2, usesremaining = 3, checked = 0}},
    loc_vars = function(self, info_queue, card)
        return {vars = {G.GAME.probabilities.normal or 1, card.ability.extra.odds, card.ability.extra.usesremaining, card.ability.extra.checked}}
    end,
    calculate = function(self, card, context)
        if context.before then
            if pseudorandom('cookiecat') < G.GAME.probabilities.normal/card.ability.extra.odds then
                card_eval_status_text(card, 'extra', nil, nil, nil, {message = ("Wooho!"), colour = HEX('F8BEC7')})
                SMODS.calculate_effect({level_up = true}, card)        
            elseif pseudorandom('cookiecat') < G.GAME.probabilities.normal/card.ability.extra.odds then
                card_eval_status_text(card, 'extra', nil, nil, nil, {message = ("Aww.."), colour = HEX('FFEED1')})
                ease_dollars(-2)
            end
        elseif context.end_of_round and card.ability.extra.checked == 0 then
            card.ability.extra.checked = 1
            card.ability.extra.usesremaining = card.ability.extra.usesremaining-1
        elseif context.setting_blind then
            card.ability.extra.checked = 0
        end
    end
}
