SMODS.Back{
    key = 'dusteddeck',
    atlas = 'Decks',
    pos = {x = 3, y = 0},
    unlocked = true, 
    discovered = true,
    config = {vouchers = {'v_magic_trick','v_illusion'}},
    apply = function(self, back)
        G.E_MANAGER:add_event(Event({
            func = function()
                local joker = SMODS.add_card({set = 'Joker', area = G.jokers, key = 'j_tje_divine'})
                joker:start_materialize()
                SMODS.Stickers['eternal']:apply(joker, true)
                G.jokers.config.card_limit = G.jokers.config.card_limit-4
                G.GAME.modifiers.no_extra_hand_money = true
                G.consumeables.config.card_limit = G.consumeables.config.card_limit+8
                G.GAME.joker_rate = 0
                G.hand:change_size(7)
                return true
            end
        }))
    end,
    calculate = function(self, back, context)
    end
}