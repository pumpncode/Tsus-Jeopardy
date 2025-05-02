SMODS.Joker{
    key = 'luckylucy',
    atlas = 'Jokers2',
    rarity = 3, 
    cost = 12, 
    unlocked = true, 
    discovered = true, 
    blueprint_compat = false, 
    eternal_compat = false,
    perishable_compat = true,
    pos = {x = 5, y = 1},
    config = {extra = {addodds = 4}},
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.addodds}}
    end,
    add_to_deck = function(self, card, from_debuff)
        if card.config.center.key == "j_tje_luckylucy" then
            for k, v in pairs(G.GAME.probabilities) do 
                G.GAME.probabilities[k] = v+card.ability.extra.addodds
            end
        end
        return true
    end,
    remove_from_deck = function(self, card, from_debuff)
        if card.config.center.key == "j_tje_luckylucy" then
            for k, v in pairs(G.GAME.probabilities) do
                G.GAME.probabilities[k] = 1
            end
        end
        return true
    end
}



