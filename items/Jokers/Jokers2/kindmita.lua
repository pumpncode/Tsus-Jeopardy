SMODS.Joker{
    key = 'kindmita',
    atlas = 'Jokers2',
    rarity = 2, 
    cost = 4, 
    unlocked = true, 
    discovered = true, 
    blueprint_compat = false, 
    eternal_compat = false,
    perishable_compat = true,
    pos = {x = 1, y = 4},
    config = {extra = {}},
    loc_vars = function(self, info_queue, card)
        return {vars = {}}
    end,
    calculate = function(self, card, context)
        if context.scoring_name == "Straight" and context.before then
            card_eval_status_text(card, 'extra', nil, nil, nil, {message = "!", colour = HEX('5F4189')})
            for i, v in ipairs(G.play.cards) do
                if v.config.center.set ~= ‘Enhanced’ then
                    play_sound('tarot1')
                    v:juice_up(0.5)
                    v:flip()
                    enhancement = SMODS.poll_enhancement({guaranteed = true, type_key = "kindmita"})
                    v:set_ability(enhancement)
                    v:flip()
                end
            end
        end
    end
}


