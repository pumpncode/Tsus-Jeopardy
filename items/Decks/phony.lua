SMODS.Back{
    key = 'phonydeck',
    atlas = 'Decks',
    pos = {x = 1, y = 0},
    unlocked = true, 
    discovered = true,
    config = {},
    apply = function(self, back)
        G.E_MANAGER:add_event(Event({
            func = function()
                if G.jokers then
                    local joker = SMODS.add_card({set = 'Joker', area = G.jokers, key = pseudorandom_element(TJ.hxdkpool, pseudoseed('hxdkjk'))})
                    joker:start_materialize()
                end
                return true
            end
        }))       
    end,
}
