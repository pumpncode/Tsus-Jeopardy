SMODS.Joker{
    key = 'hauntinglysweetvices',
    atlas = 'Jokers2',
    rarity = 2, 
    cost = 5, 
    unlocked = true, 
    discovered = true, 
    blueprint_compat = false, 
    eternal_compat = false,
    perishable_compat = true,
    pos = {x = 2, y = 1},
    config = {extra = {odds = 4, chips = 50, mult = 10, checked = 0, chipsd = 5, multd = 1}},
    loc_vars = function(self, info_queue, card)
        return {vars = {G.GAME.probabilities.normal or 1, card.ability.extra.odds, card.ability.extra.chips, card.ability.extra.mult, card.ability.extra.chipsd, card.ability.extra.multd, card.ability.extra.checked}}
    end,
    calculate = function(self, card, context)
        if context.end_of_round and card.ability.extra.checked ~= 3 and card.ability.extra.chips ~= 0 and card.ability.extra.mult ~= 0 then
            card.ability.extra.checked = card.ability.extra.checked+1
            if pseudorandom('garcello') < G.GAME.probabilities.normal/card.ability.extra.odds then
                card.ability.extra.chips =  card.ability.extra.chips-card.ability.extra.chipsd
                card.ability.extra.mult = card.ability.extra.mult-card.ability.extra.multd
                card = card
                card:juice_up(0.5)
                card_eval_status_text(card, 'extra', nil, nil, nil, {message = ("COUGH!"), colour = HEX('48FEAC')})
            end
        elseif context.joker_main then
            return {
                chips = card.ability.extra.chips,
                mult = card.ability.extra.mult
            }
        elseif context.setting_blind then
            card.ability.extra.checked = 0
        elseif card.ability.extra.chips == 0 and card.ability.extra.mult == 0 then
            card:juice_up(0.3, 0.4)
            G.jokers:remove_card(card)
            card:remove()
        end
    end
}



