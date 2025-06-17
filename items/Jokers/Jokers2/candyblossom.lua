SMODS.Joker{
    key = 'candyblossom',
    atlas = 'Jokers2',
    rarity = 1, 
    cost = 15, 
    unlocked = true, 
    discovered = true, 
    blueprint_compat = false, 
    eternal_compat = false,
    perishable_compat = true,
    pos = {x = 4, y = 2},
    config = {extra = {mutation = "???", weight = "?.??kg", worth = "???", shockedxchips = 0, shockedretrig = 0, shockedcheck = 0}},
    loc_vars = function(self, info_queue, card)
        if card.ability.extra.mutation == "None" then
            return {key = 'j_tje_candyblossomnone', vars = {card.ability.extra.mutation, card.ability.extra.weight, card.ability.extra.worth}}
        elseif card.ability.extra.mutation == "Wet" then
            return {key = 'j_tje_candyblossomwet', vars = {card.ability.extra.mutation, card.ability.extra.weight, card.ability.extra.worth}}
        elseif card.ability.extra.mutation == "Rainbow" then
            return {key = 'j_tje_candyblossomrainbow', vars = {card.ability.extra.mutation, card.ability.extra.weight, card.ability.extra.worth, card.ability.extra.rainbowxmult}}
        elseif card.ability.extra.mutation == "Golden" then
            return {key = 'j_tje_candyblossomgolden', vars = {card.ability.extra.mutation, card.ability.extra.weight, card.ability.extra.worth, card.ability.extra.goldpayout}}
        elseif card.ability.extra.mutation == "Shocked" then
            return {key = 'j_tje_candyblossomshocked', vars = {card.ability.extra.mutation, card.ability.extra.weight, card.ability.extra.worth, card.ability.extra.shockedxchips, card.ability.extra.shockedretrig, card.ability.extra.shockedcheck}}
        elseif card.ability.extra.mutation == "Chocolate" then
            return {key = 'j_tje_candyblossomchocolate', vars = {card.ability.extra.mutation, card.ability.extra.weight, card.ability.extra.worth}}
        end
    end,
    add_to_deck = function(self, card, from_debuff)
        card.ability.extra.mutation = pseudorandom_element(TJ.mutations, pseudoseed('candyblossomadd'))
        local function randomdecimal(minimum, maximum)
            return math.random()*(maximum-minimum) + minimum
        end
        if pseudorandom('Candyblossomsizeup') < 1/10 then
            if pseudorandom('Candyblossomsizeup2') < 1/9 then
                if pseudorandom('Candyblossomsizeup3') < 1/8 then
                    if pseudorandom('Candyblossomsizeup4') < 1/7 then
                        card.ability.extra.weight = (randomdecimal(5, 40))*(randomdecimal(8, 50))
                    end
                else
                    card.ability.extra.weight = (randomdecimal(1, 10))*(randomdecimal(2, 10))
                end
            else
                card.ability.extra.weight = (randomdecimal(0.1, 8))*(randomdecimal(0.5, 9))
            end
        else
            card.ability.extra.weight = (randomdecimal(0.01, 7))*(randomdecimal(0.05, 5))
        end
        if card.ability.extra.mutation == "None" then
            card.ability.extra.worth = (math.floor(1.85*(((card.ability.extra.weight)*0.4)*1)))
        elseif card.ability.extra.mutation == "Golden" then
            card.ability.extra.worth = (math.floor(1.85*(((card.ability.extra.weight)*1.5)*3.5)))
        elseif card.ability.extra.mutation == "Rainbow" then
            card.ability.extra.worth = (math.floor(1.85*(((card.ability.extra.weight)*1)*3)))
            card.ability.extra.mutationnumber = 1
        elseif card.ability.extra.mutation == "Wet" then
            card.ability.extra.worth = (math.floor(1.85*(((card.ability.extra.weight)*0.2)*8)))
        elseif card.ability.extra.mutation == "Chocolate" then
            card.ability.extra.worth = (math.floor(1.85*(((card.ability.extra.weight)*1)*5.75)))
        elseif card.ability.extra.mutation == "Shocked" then
            card.ability.extra.worth = (math.floor(1.85*(((card.ability.extra.weight)*0.5)*15)))
            card.ability.extra.mutationnumber = 2
        end
        card.sell_cost = (card.ability.extra.worth)
        card.ability.extra.goldpayout = (math.floor(card.ability.extra.worth/20))
        card.ability.extra.rainbowxmult = (1+math.floor(card.ability.extra.worth/45))
        card.ability.extra.shockedxchips = (1+math.floor(card.ability.extra.worth/35))
    end,
    calculate = function(self, card, context)
        if card.sell_cost ~= card.ability.extra.worth then
            card.sell_cost = card.ability.extra.worth
        end
        if context.joker_main and card.ability.extra.mutation == "Golden" then
            ease_dollars(card.ability.extra.goldpayout)
            return {
                message = "Money!",
                colour = HEX('EF8BFF')
            }
        end
        if context.joker_main and card.ability.extra.mutation == "Rainbow" then
            return {
                xmult = card.ability.extra.rainbowxmult
            }
        end
        if context.joker_main and card.ability.extra.mutation == "Shocked" then
            return {
                xchips = card.ability.extra.shockedxchips
            }
        end
    end
}
