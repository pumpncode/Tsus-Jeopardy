SMODS.Joker{
    key = 'mineturtle',
    atlas = 'Jokers2',
    rarity = 2, 
    cost = 7, 
    unlocked = true, 
    discovered = true, 
    blueprint_compat = false, 
    eternal_compat = false,
    perishable_compat = true,
    pos = {x = 2, y = 0},
    config = {extra = {odds = 4, xmult = 4}},
    loc_vars = function(self, info_queue, card)
        return {vars = {G.GAME.probabilities.normal or 1, card.ability.extra.odds, card.ability.extra.xmult}}
    end,
    calculate = function(self, card, context)
        if context.setting_blind then
            if pseudorandom('mineturtle') < G.GAME.probabilities.normal/card.ability.extra.odds then
                G.GAME.blind.chips = G.GAME.blind.chips*3
                G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
                card:juice_up(0.5)
                return {
                    message = ("Hello!"),
                    colour = HEX('8A9A5B')
                }
            end
        elseif context.joker_main then
            return {
                xmult = card.ability.extra.xmult
            }
        end
    end
}


