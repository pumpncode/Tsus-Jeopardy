SMODS.Joker{
    key = 'Schneider',
    atlas = 'Jokers',
    rarity = "tje_tjHl", 
    cost = 20, 
    unlocked = true, 
    discovered = true, 
    blueprint_compat = false, 
    eternal_compat = false, --can it be eternal
    perishable_compat = true, --can it be perishable
    pos = {x = 6, y = 1},
    soul_pos = {x = 7, y = 1},
    config = {extra = { odds = 8, xmult = 1, orangescale = 1.5, heartscaletext = 1, diamondscaletext = 8, clubscaletext = 50, spadescaletext = 150, heartscale = 0, diamondscale = 0, clubscale = 0, spadescale = 0, hasscored = 0, heartscaleafter = .1}},
    loc_vars = function(self, info_queue, card)
        return { vars = { G.GAME.probabilities.normal, card.ability.extra.odds, card.ability.extra.xmult, card.ability.extra.orangescale, card.ability.extra.heartscaletext, card.ability.extra.diamondscaletext, card.ability.extra.clubscaletext, card.ability.extra.spadescaletext, card.ability.extra.heartscale+1*1, card.ability.extra.diamondscale+1*8, card.ability.extra.clubscale+1*50, card.ability.extra.spadescale+1*150, card.ability.extra.hasscored} }
    end,
    calculate = function(self, card, context)
        if context.end_of_round and G.GAME.blind.boss and not context.blueprint  then
            if #G.consumeables.cards < G.consumeables.config.card_limit then --morefluff code lol!
                  card_eval_status_text(card, 'extra', nil, nil, nil, {message = ("...?"), colour = G.C.MULT})
                  local n_card = create_card(nil,G.consumeables, nil, nil, nil, nil, 'c_tje_Schnorange', 'sup')
                  n_card:add_to_deck()
                  G.consumeables:emplace(n_card)
            end
        elseif context.joker_main and card.ability.extra.hasscored == 0 and not context.blueprint then
            card.ability.extra.hasscored = card.ability.extra.hasscored+1
            return({
                remove_default_message = true,
                delay = 1.5,
                message = ("FIRE!"),
                colour = G.C.MULT,
                delay = 3.5,
                mult = card.ability.extra.clubscale*50,
                delay = 3.5,
                xmult = card.ability.extra.heartscale+1,
                delay = 3.5,
                ease_dollars(card.ability.extra.diamondscale*8),
                delay = 3.5,
                chips = card.ability.extra.spadescale*150,
            })
        elseif context.individual and context.cardarea == G.play and context.other_card:is_suit("Hearts") and card.ability.extra.hasscored == 0 and not context.blueprint then
            card.ability.extra.heartscale = card.ability.extra.heartscale+1
            return({
                delay = 1,
                message = ("Hearts"),
                colour = G.C.MULT
            })
        elseif context.individual and context.cardarea == G.play and context.other_card:is_suit("Clubs") and card.ability.extra.hasscored == 0 and not context.blueprint then
            card.ability.extra.clubscale = card.ability.extra.clubscale+1
            return({
                delay = 1,
                message = ("Clubs"),
                colour = G.C.CHIPS
            })
        elseif context.individual and context.cardarea == G.play and context.other_card:is_suit("Diamonds") and card.ability.extra.hasscored == 0 and not context.blueprint then
            card.ability.extra.diamondscale = card.ability.extra.diamondscale+1
            return({
                delay = 1,
                message = ('Diamonds'),
                colour = G.C.MONEY
            })
        elseif context.individual and context.cardarea == G.play and context.other_card:is_suit("Spades") and card.ability.extra.hasscored == 0 and not context.blueprint then
            card.ability.extra.spadescale = card.ability.extra.spadescale+1
            return({
                delay = 1,
                message = ('Spades'),
                colour = G.C.BLACK
            })
        elseif card.ability.extra.hasscored == 1 then
            card.ability.extra.hasscored=card.ability.extra.hasscored+1
            return({
                delay = 4.5,
                message = ("I need a break, My Lord."),
                colour = G.C.MULT
            })
        elseif context.individual and context.cardarea == G.play and not context.other_card:is_suit("") and card.ability.extra.hasscored == 0 and not context.blueprint then
            return({
                delay = 1.5,
                message = ("What card is that, My Lord?"),
                colour = G.C.MULT
            })
        elseif context.setting_blind then
            card.ability.extra.heartscale = 0
            card.ability.extra.spadescale = 0
            card.ability.extra.diamondscale = 0
            card.ability.extra.clubscale = 0
            card.ability.extra.hasscored = 0
            return({
                delay = 1.5,
                message = ("Ready, My Lord."),
                colour = G.C.MULT
            })
        elseif context.individual and context.cardarea == G.play and context.other_card:is_suit("Hearts") and card.ability.extra.hasscored == 2 and not context.blueprint then
            card.ability.extra.xmult = card.ability.extra.xmult+card.ability.extra.heartscaleafter
            return({
                message = ("!"),
                colour = G.C.MULT
            })
        elseif context.joker_main and card.ability.extra.hasscored == 2 then
            return({
                xmult = card.ability.extra.xmult,
                message = ("Resting..."),
                colour = G.C.MULT
            })
        elseif context.using_consumeable and context.consumeable.config.center.key == "c_tje_Schnorange" and not context.blueprint  then
            if pseudorandom('Schneider') > G.GAME.probabilities.normal/card.ability.extra.odds then
                card.ability.extra.xmult = card.ability.extra.xmult+card.ability.extra.orangescale
                return({
                    delay = 4.5,
                    message = ("My Lord... That's not fair."),
                    colour = G.C.MULT
                })
            else
                return({
                    delay = 3.5,
                    message = ("...To be shot by my own bullet."),
                    colour = G.C.MULT,
                    G.jokers:remove_card(card),
                    card:remove(),
                    card = nil
                })
            end
            
        end
    end
}
SMODS.Joker{
    key = 'Crystal',
    atlas = 'Jokers',
    rarity = 4, 
    cost = 20, 
    unlocked = true, 
    discovered = true, 
    blueprint_compat = true, 
    eternal_compat = true, --can it be eternal
    perishable_compat = true, --can it be perishable
    pos = {x = 0, y = 2},
    soul_pos = {x = 1, y = 2},
    config = {extra = {odds = 3, hasyappedatend = 0, hasyappedatconcerned = 0, charge = 1}},
    loc_vars = function(self, info_queue, card)
        return { vars = { G.GAME.probabilities.normal or 1, card.ability.extra.odds, card.ability.extra.hasyappedatend, card.ability.extra.hasyappedatconcerned, card.ability.extra.charge} }
    end,
    calculate = function(self, card, context)
        local crysyapstartblind = {
            "Get it on!",
            "Go get em!",
            "Right on!",
            "You got this!",
            "Hit it!",
            "Scratch that beat!"
        }
        local crysyapendblind = {
            "Too easy!",
            "Aha!",
            "Woop! Woop!",
            "Nuclear!",
            "Such a pro!",
            "Hell yeah!"
        }
        local crys1handconcerned = {
            "Wuh oh.",
            "Eek!",
            "Well...",
            "...Maybe do.. erm.",
            "Yikes.",
            "...I'll remember you!",
            "Aww Jeez rick."
        }
        local crycharge = {
            "Tasty!",
            "*Munch* *Burp*",
            "+0.2 Charge!",
            "Jarvis... Charge me",
            "More!"
        }
        if context.open_booster and not context.blueprint  then
            if pseudorandom('CRYSTA//') < G.GAME.probabilities.normal/card.ability.extra.odds and not context.blueprint then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        local front = pseudorandom_element(G.P_CARDS)
                        G.playing_card = 1
                        local crycard = Card(nil, nil, G.CARD_W, G.CARD_H, front, G.P_CENTERS.m_stone, {playing_card = G.playing_card})
                        card:start_materialize({G.C.SECONDARY_SET.Enhanced})
                        crycard:set_edition('e_polychrome')
                        G.deck:emplace(crycard)
                        table.insert(G.playing_cards, crycard)
                        card_eval_status_text(card, 'extra', nil, nil, nil, {message =('Mineral Found!'), colour = HEX('CA4DDF')})
                        return true
                    end}))
            end
        elseif context.cardarea == G.play and not context.blueprint  then
            for i, v in ipairs(G.play.cards) do
                if v.config.center == G.P_CENTERS.m_stone and #context.full_hand == 1 and context.cardarea == G.play and not context.blueprint then
                    if v.edition and v.edition.polychrome and context.destroy_card and context.destroy_card == context.full_hand[1] and #G.consumeables.cards < G.consumeables.config.card_limit then
                        ease_hands_played(1)
                        local c_card = create_card(nil,G.consumeables, nil, nil, nil, nil, 'c_tje_Celestite', 'sup')
                        c_card:add_to_deck()
                        G.consumeables:emplace(c_card)
                        card_eval_status_text(card, 'extra', nil, nil, nil, {message = ("Mineral Purified!"), colour = HEX('CA4DDF')})
                        return{
                            remove = true
                        }
                    elseif #G.consumeables.cards >= G.consumeables.config.card_limit and celbufferfullcon == 0 or nil then
                        card_eval_status_text(card, 'extra', nil, nil, nil, {message = ("...Your consumables are full, Player."), colour = HEX('CA4DDF')})
                        celbufferfullcon = 1
                    end
                end
            end
        elseif context.setting_blind then
            card.ability.extra.hasyappedatend = 0
            card.ability.extra.hasyappedatconcerned = 0
            return {
                delay = 1.5,
                message = (crysyapstartblind[math.random(#crysyapstartblind)]),
                colour = HEX('CA4DDF')
            }
        elseif context.end_of_round and card.ability.extra.hasyappedatend == 0 and not context.blueprint then
            card.ability.extra.hasyappedatend = 1
            card_eval_status_text(card, 'extra', nil, nil, nil, {message = (crysyapendblind[math.random(#crysyapendblind)]), colour = HEX('CA4DDF')})
        elseif G.GAME.current_round.hands_left == 1 and card.ability.extra.hasyappedatconcerned == 0 and not context.blueprint then
            card.ability.extra.hasyappedatconcerned = 1
            card_eval_status_text(card, 'extra', nil, nil, nil, {message = (crys1handconcerned[math.random(#crys1handconcerned)]), colour = HEX('CA4DDF')})
        elseif context.using_consumeable and context.consumeable.config.center.key == "c_tje_Celestite" and not context.blueprint  then
            card_eval_status_text(card, 'extra', nil, nil, nil, {message = (crycharge[math.random(#crycharge)]), colour = HEX('CA4DDF')})
            card.ability.extra.charge = card.ability.extra.charge+0.2
        elseif context.joker_main then
            celbufferfullcon = 0
            return ({
                mult = (G.GAME.hands[context.scoring_name].level)^(card.ability.extra.charge)
            })
        end
    end
}
SMODS.Joker{
    key = 'TheJoker',
    loc_txt = {
        name = 'The Joker',
        text = {
            "The All-Mighty",
            "The Constant",
            "The Null"
        }
        
    },
    atlas = 'Jokers',
    rarity = "tje_tjHl", 
    cost = 20, 
    unlocked = true, 
    discovered = true, 
    blueprint_compat = true, 
    eternal_compat = true, --can it be eternal
    perishable_compat = true, --can it be perishable
    pos = {x = 2, y = 2},
    soul_pos = {x = 3, y = 2},
}
assert(SMODS.load_file('items/Jokers/OtherJokers/Kusuri.lua'))() -- due to kusuri being too complicated, i made a seperate file!
SMODS.Joker{
    key = 'bettragedy',
    loc_txt = {
        name = 'TRAGEDY',
        text = {
            "{C:inactive}...Thank you for reminding me of that.",
        }
        
    },
    atlas = 'Jokers',
    rarity = 4, 
    unlocked = true, 
    discovered = true, 
    blueprint_compat = true, 
    eternal_compat = true, --can it be eternal
    perishable_compat = true, --can it be perishable
    pos = {x = 2, y = 3},
    soul_pos = {x = 3, y = 3},
}
SMODS.Joker{
    key = 'stpplayer',
    loc_txt = {
        name = 'The Player',
        text = {
            '{C:inactive}"...Mirror?"{}',
        }
        
    },
    atlas = 'Jokers',
    rarity = "tje_tjHl", 
    cost = 20, 
    unlocked = true, 
    discovered = true, 
    blueprint_compat = true, 
    eternal_compat = true, --can it be eternal
    perishable_compat = true, --can it be perishable
    pos = {x = 0, y = 3},
    soul_pos = {x = 1, y = 3},
}