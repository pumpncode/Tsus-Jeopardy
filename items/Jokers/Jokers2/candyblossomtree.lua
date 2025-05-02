SMODS.Joker{
    key = 'candyblossomtree',
    atlas = 'Jokers2',
    rarity = 3, 
    cost = 250, 
    unlocked = true, 
    discovered = true, 
    blueprint_compat = false, 
    eternal_compat = false,
    perishable_compat = true,
    pos = {x = 6, y = 2},
    config = {extra = {}},
    loc_vars = function(self, info_queue, card)
        return {vars = {}}
    end,
    calculate = function(self, card, context)
        if context.setting_blind and  #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
            SMODS.add_card{
                set = 'Joker',
                area = G.jokers,
                key = 'j_tje_candyblossom'
            }
            return {
                message = "Harvested!",
                colour = HEX('EF8BFF')
            }
        end
    end
}


