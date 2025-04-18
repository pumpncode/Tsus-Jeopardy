local hdyap = {
    "Ur cooked bud.",
    "Wrap it up Bozo.",
    "Lil bro think hes goated",
    "I hope you get Cryta// on your next run",
    "Waa Waa Waa",
    "^1.2 Bozo",
    "ikiab u pmo",
    "hope u catch a stray"
}
SMODS.Back{
    key = 'hexdeck',
    atlas = 'Decks',
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
                G.GAME.modifiers.no_blind_reward = G.GAME.modifiers.no_blind_reward or {} ---- stole this code from that one guy who made a gambler deck.. ily!!
                G.GAME.modifiers.no_interest = true
                G.jokers.config.card_limit = G.jokers.config.card_limit-3
                G.GAME.modifiers.no_extra_hand_money = true
                G.consumeables.config.card_limit = G.consumeables.config.card_limit-1
                G.GAME.modifiers.no_blind_reward.Small = true
                G.GAME.modifiers.no_blind_reward.Big = true
                G.GAME.modifiers.no_blind_reward.Boss = true
                return true
            end
        }))       
    end,
    calculate = function(self, back, context)
        if context.setting_blind then
            G.GAME.blind.chips = G.GAME.blind.chips^1.2
            G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
            return {
                delay = 1.5,
                message = (hdyap[math.random(#hdyap)]),
                colour = HEX('431E40')
            }
        end
        if context.starting_shop and G.GAME.probabilities.normal/2 or 0.5 > pseudorandom('hexdeckpayout') and nothaspaid == 0 or nil and not nothaspaid == 1 then
            nothaspaid = 1
            ease_dollars(7)
        end
    end
}
