SMODS.Joker{
    key = 'tsunova',
    atlas = 'Jokers2',
    rarity = 2, 
    cost = 5, 
    unlocked = true, 
    discovered = true, 
    blueprint_compat = false, 
    eternal_compat = false,
    perishable_compat = true,
    pos = {x = 1, y = 0},
    config = {extra = {odds = 4}},
    loc_vars = function(self, info_queue, card)
        return {vars = {G.GAME.probabilities.normal or 1, card.ability.extra.odds, card.ability.extra.odds+2}}
    end,
    calculate = function(self, card, context)
        if context.using_consumeable and context.consumeable.config.center.set ~= "Planet" then
            if pseudorandom('tsunova') < G.GAME.probabilities.normal/card.ability.extra.odds and #G.consumeables.cards < G.consumeables.config.card_limit then
                local newCard = create_card("Planet", G.consumables, nil, nil, nil, nil)
                newCard:add_to_deck()
                G.consumeables:emplace(newCard)
                card:juice_up(0.5)
                return {
                    message = ("Ahaha!"),
                    colour = HEX('D851FF')
                }
            end
        end
        if pseudorandom('tsunova') < G.GAME.probabilities.normal/(card.ability.extra.odds+2) and context.using_consumeable and context.consumeable.config.center.set == "Planet" then
            local hand = tje.mphand()
            update_hand_text({sound = 'button', volume = 0.7, pitch = 1.1, delay = 0}, {mult = 0, chips = 0, handname = hand, level = ''})
	    	level_up_hand(card, hand, nil, -1)
            return {
                message = ("Whoopsie!"),
                colour = HEX('D851FF')
            }
        end
    end
}
