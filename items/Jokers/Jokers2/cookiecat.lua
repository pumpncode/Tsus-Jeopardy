SMODS.Joker{
    key = 'cookiecat',
    atlas = 'Jokers2',
    rarity = 2, 
    cost = 4, 
    unlocked = true, 
    discovered = true, 
    blueprint_compat = false, 
    eternal_compat = false,
    perishable_compat = true,
    pos = {x = 3, y = 1},
    config = {extra = {odds = 2, usesremaining = 5}},
    loc_vars = function(self, info_queue, card)
        return {vars = {G.GAME.probabilities.normal or 1, card.ability.extra.odds, card.ability.extra.usesremaining}}
    end,
    calculate = function(self, card, context)
        if context.before and card.ability.extra.usesremaining ~= 0 then
            card.ability.extra.usesremaining = card.ability.extra.usesremaining-1
            if pseudorandom('cookiecat') < G.GAME.probabilities.normal/card.ability.extra.odds then
                card_eval_status_text(card, 'extra', nil, nil, nil, {message = ("Wooho!"), colour = HEX('F8BEC7')})
                SMODS.calculate_effect({level_up = true}, card)        
            end
            if pseudorandom('cookiecat2') < G.GAME.probabilities.normal/card.ability.extra.odds then
                card_eval_status_text(card, 'extra', nil, nil, nil, {message = ("Aww.."), colour = HEX('FFEED1')})
                ease_dollars(-2)
            end
            if card.ability.extra.usesremaining == 0 and context.after then
                card:juice_up(0.3, 0.4)
                G.jokers:remove_card(card)
                card:remove()
            end
        end
    end
}
