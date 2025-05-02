SMODS.Back{
    key = 'sweetthumbdeck',
    atlas = 'Decks',
    pos = {x = 2, y = 0},
    unlocked = true, 
    discovered = true,
    config = {},
    apply = function(self, back)
        G.E_MANAGER:add_event(Event({
            func = function()
                local joker = SMODS.add_card({set = 'Joker', area = G.jokers, key = 'j_tje_candyblossomtree'})
                joker:start_materialize()
                SMODS.Stickers['eternal']:apply(joker, true)
                G.GAME.modifiers.no_blind_reward = G.GAME.modifiers.no_blind_reward or {} ---- stole this code from that one guy who made a gambler deck.. ily!!
                G.GAME.modifiers.no_interest = true
                G.GAME.modifiers.no_blind_reward.Small = true
                G.GAME.modifiers.no_blind_reward.Big = true
                G.GAME.modifiers.no_blind_reward.Boss = true
                G.GAME.joker_rate = 0
                return true
            end
        }))       
    end,
}
