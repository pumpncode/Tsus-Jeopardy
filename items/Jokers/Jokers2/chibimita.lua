SMODS.Joker{
    key = 'chibimita',
    atlas = 'Jokers2',
    rarity = 1, 
    cost = 4, 
    unlocked = true, 
    discovered = true, 
    blueprint_compat = false, 
    eternal_compat = false,
    perishable_compat = true,
    pos = {x = 0, y = 4},
    config = {extra = {retrig = 0}},
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.retrig}}
    end,
    calculate = function(self, card, context)
        if context.repetition then
            if context.scoring_name == "High Card" then
                print('Check!')
                card.ability.extra.retrig = math.random(0,5)
            else
                card.ability.extra.retrig = 0
            end
            return {
                repetitions = card.ability.extra.retrig,
                card = card,
                message = "Again!",
                colour = HEX('5F4189')
            }
        end
    end
}


