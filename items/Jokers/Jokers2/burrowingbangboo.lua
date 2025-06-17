SMODS.Joker{
    key = 'burrowingbangboo',
    atlas = 'Jokers2',
    rarity = 1, 
    cost = 4, 
    unlocked = true, 
    discovered = true, 
    blueprint_compat = false, 
    eternal_compat = false,
    perishable_compat = true,
    pos = {x = 3, y = 2},
    config = {extra = {choseneffect = nil}},
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.choseneffect}}
    end,
    calculate = function(self, card, context)
        bangboopool = {
            "Consumable",
            "Hands",
            "Discards",
            "Money",
            "Common",
            "None"
        }
        if context.setting_blind then
            card.ability.extra.choseneffect = pseudorandom_element(bangboopool, pseudoseed('burrowingbamboo'))
            if card.ability.extra.choseneffect == "Consumable" and #G.consumeables.cards < G.consumeables.config.card_limit then
                local sets = {}
                for k, v in pairs(SMODS.ConsumableTypes) do
                    table.insert(sets , k)
                end
                SMODS.add_card({set = pseudorandom_element(sets , pseudoseed("burrowingbambooconsumable"))})
                return {
                    message = "Ahya!",
                    colour = HEX("787888")
                }
            elseif card.ability.extra.choseneffect == "Consumable" and #G.consumeables.cards >= G.consumeables.config.card_limit then
                ease_dollars(2)
                return {
                    message = "Keh...",
                    colour = HEX("787888")
                }
            elseif card.ability.extra.choseneffect == "Hands" then
                ease_hands_played(1)
                return {
                    message = "Wha haya!",
                    colour = HEX("787888")
                }
            elseif card.ability.extra.choseneffect == "Discards" then
                ease_discard(1)
                return {
                    message = "Waahoo!",
                    colour = HEX("787888")
                }
            elseif card.ability.extra.choseneffect == "Money" then
                ease_dollars(5)
                return {
                    message = "Wayaya!",
                    colour = HEX("787888")
                }
            elseif card.ability.extra.choseneffect == "Common" and #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                G.GAME.joker_buffer = G.GAME.joker_buffer+1
                G.E_MANAGER:add_event(Event({
                    func = function()
                        SMODS.add_card{
                            set = 'Joker',
                            area = G.jokers,
                            rarity = 0.1
                            }
                            G.GAME.joker_buffer = G.GAME.joker_buffer-1
                        return true
                    end}))
                return {
                    message = "Yahaha!",
                    colour = HEX("787888")
                }
            elseif card.ability.extra.choseneffect == "None" then
                return {
                    message = "..Uoh.",
                    colour = HEX("787888")
                }
            end
        end
    end
}
