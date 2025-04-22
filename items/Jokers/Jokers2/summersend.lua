SMODS.Joker{
    key = 'summersend',
    loc_txt = {
        name = "Summer's End",
        text = {
            '{s:0.75,C:inactive}"..."{}'
        }
    },
    atlas = 'Jokers2',
    rarity = 2, 
    cost = 20, 
    unlocked = true, 
    discovered = true, 
    blueprint_compat = false, 
    eternal_compat = false,
    perishable_compat = true,
    pos = {x = 0, y = 0},
    config = {extra = {odds = 2, hascopied = 0}},
    loc_vars = function(self, info_queue, card)
        return {vars = {G.GAME.probabilities.normal or 1, card.ability.extra.odds, card.ability.extra.hascopied}}
    end,
    calculate = function(self, card, context)
    if context.cardarea == G.play and card.ability.extra.hascopied == 0 then
        print('1sttaken')
        card.ability.extra.hascopied = 1 
        for i = 1, #G.play.cards do
            local card = G.play.cards[1]
            local rank = card.base.id
            local suit = card.base.suit
            local enhancement = SMODS.get_enhancements(card, extra_only)
            local edition = card.edition
            local seal = card.seal
        end 
    elseif context.cardarea == G.play and card.ability.extra.hascopied == 1 and pseudorandom('summerend') < G.GAME.probabilities.normal/card.ability.extra.odds then
        for i = 1, #G.play.cards do
            print('changed')
            cardplayed = G.play.cards[1]
            assert(SMODS.change_base(cardplayed, suit, rank))
            cardplayed:set_edition(edition)
            cardplayed:set_seal(seal)
        end
    elseif context.cardarea == G.play and card.ability.extra.hascopied == 1 and pseudorandom('summerend') > G.GAME.probabilities.normal/card.ability.extra.odds then
        print('overwrite')
        for i = 1, #G.play.cards do
            local card = G.play.cards[1]
            local rank = card.base.id
            local suit = card.base.suit
            local enhancement = SMODS.get_enhancements(card, extra_only)
            local edition = card.edition
            local seal = card.seal
        end
    end
end
}



