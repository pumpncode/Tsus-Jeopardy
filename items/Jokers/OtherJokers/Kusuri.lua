SMODS.Joker{
    key = 'Kusuri',
    atlas = 'Jokers',
    rarity = 4, 
    cost = 20, 
    unlocked = true, 
    discovered = true, 
    blueprint_compat = true, 
    eternal_compat = true, --can it be eternal
    perishable_compat = true, --can it be perishable
    pos = {x = 4, y = 2},
    soul_pos = {x = 5, y = 2},
    config = {extra = {roundcount = 0, decreasebuffer = 0, thmmedicinemult = 0, thmmedicinemult = 0, thmmedicinechips = 0, state = 0, gfstate = 0, krnbffer = 0, krnxmult = 1, krnscale = 0.5, spadechecmsgsent = 0, heartcount = 0, hkrpayout = 0, hkrpayoutinc = 1, nothastalked = 0, shizukalvls = 3, handreq = 0, handrew = 0, nnoxmult = 1, nnoscalexmult = 0.25, hhrxmult = 1.5, hhrpayout = 1, hhrpayoutinc = 1.25}},
    loc_vars = function(self, info_queue, card)
        if card.ability.extra.state == 0 then
            return {key = 'j_tje_Kusuri', vars = {card.ability.extra.roundcount, card.ability.extra.decreasebuffer, card.ability.extra.state}}
        elseif card.ability.extra.roundcount > 0 and card.ability.extra.state == 1 then
            return {key = 'j_tje_Kusuri2', vars = {card.ability.extra.roundcount, card.ability.extra.decreasebuffer, card.ability.extra.thmmedicinemult, card.ability.extra.thmmedicinechips, card.ability.extra.state}}
        elseif card.ability.extra.roundcount > 0 and card.ability.extra.state == 2 and card.ability.extra.gfstate == 'krn' then
            return {key = 'j_tje_Kusuri3krn', vars = {card.ability.extra.roundcount, card.ability.extra.decreasebuffer, card.ability.extra.gfstate, card.ability.extra.krnbffer, card.ability.extra.krnxmult, card.ability.extra.krnscale, card.ability.extra.spadechecmsgsent, card.ability.extra.heartcount}}
        elseif card.ability.extra.roundcount > 0 and card.ability.extra.state == 2 and card.ability.extra.gfstate == 'hkr' then
            return {key = 'j_tje_Kusuri3hkr', vars = {card.ability.extra.roundcount, card.ability.extra.gfstate, card.ability.extra.hkrpayout, card.ability.extra.hkrpayoutinc, card.ability.extra.nothastalked}}
        elseif card.ability.extra.roundcount > 0 and card.ability.extra.state == 2 and card.ability.extra.gfstate == 'szk' then
            return {key = 'j_tje_Kusuri3szk', vars = {card.ability.extra.roundcount, card.ability.extra.gfstate, card.ability.extra.shizukalvls, card.ability.extra.handreq,  card.ability.extra.handrew}}
        elseif card.ability.extra.roundcount > 0 and card.ability.extra.state == 2 and card.ability.extra.gfstate == 'nno' then
            return {key = 'j_tje_Kusuri3nno', vars = {card.ability.extra.nnoxmult, card.ability.extra.nnoscalexmult}}
        elseif card.ability.extra.roundcount > 0 and card.ability.extra.state == 2 and card.ability.extra.gfstate == 'hhr' then
            return {key = 'j_tje_Kusuri3hhr', vars = {card.ability.extra.hhrxmult, card.ability.extra.hhrpayout, card.ability.extra.hhrpayoutinc}}
        end
    end,
    calculate = function(self, card, context)
        local szkyap = {
            "How wonderful!",
            "Thy Maiden is pleased!",
            "Oh happy day!"
        }
        local krnyap = {
            "THIS CHICK NEEDS REHAB!",
            "IT'S NOT LIKE I LIKE YOU OR ANYTHING!",
            "IM GONNA TEAR YOU LIMB FROM LIMB.",
            "SHUT UP, DUDE!",
            "*Flying Elbow Drop*"
        }
        local kusuriyap = {
            "Potion coming right up!",
            "diapie... full...",
            "Taste this!",
            "Kusuri's newest invention!",
            "Kusuri is proud with this one!"
        }
        local krnscore = {
            "Sowwy...",
            "...Did that hurt?",
            "I didn't mean it...",
            "You dont hate me, do you?"
        }
        local gftable = {
            "krn",
            "hkr",
            "szk",
            --"nno",
            "szk"

        }
        local KusuriPotionTable = {
            'c_tje_thmmedicin',
            'c_tje_ennui'
        }        
        if context.using_consumeable and context.consumeable.config.center.key == "c_tje_thmmedicin" and not context.blueprint then
            card.ability.extra.hkrexist = 0 --Check for hakaris payout cuz of end_of_round shenanigans
            card_eval_status_text(card, 'extra', nil, nil, nil, {message = ('Magnet-y!'), colour = HEX('D33245')})
            card.ability.extra.roundcount = card.ability.extra.roundcount+1
            card.ability.extra.state = 1
        elseif context.end_of_round and card.ability.extra.decreasebuffer == 0 and card.ability.extra.roundcount ~= 0 then
            card.ability.extra.roundcount = card.ability.extra.roundcount-1
            card.ability.extra.decreasebuffer = 1
        elseif card.ability.extra.roundcount == 0 and card.ability.extra.state ~= 0 then
            card.ability.extra.state = 0
        elseif context.setting_blind and not context.blueprint then
            card.ability.extra.decreasebuffer = 0
        end
        if context.setting_blind and card.ability.extra.state == 0 and #G.consumeables.cards < G.consumeables.config.card_limit then
            local potionValue = pseudorandom_element(KusuriPotionTable, pseudoseed('kuspo'))
            print(potionValue)
            local pot_card = create_card(nil,G.consumeables, nil, nil, nil, nil, potionValue, 'sup')
            pot_card:add_to_deck()
            G.consumeables:emplace(pot_card)
            return {
                delay = 1.75,
                message = (kusuriyap[math.random(#kusuriyap)]),
                colour =  HEX('D33245')
            }
        end
        if context.joker_main and card.ability.extra.roundcount > 0 and card.ability.extra.state == 1 then
            card.ability.extra.thmmedicinemult = ((hand_chips * mult)/4) - mult
            card.ability.extra.thmmedicinechips = ((hand_chips * mult)/4) - hand_chips
            return {
                remove_default_message = true,
                mult = card.ability.extra.thmmedicinemult,
                chips = card.ability.extra.thmmedicinechips,
                message = ("Mulched!"),
                colour = G.C.KusuriPopText
            }
        end
        if context.using_consumeable and context.consumeable.config.center.key == "c_tje_ennui" then
            card.ability.extra.roundcount = 1
            card.ability.extra.state = 2
            local randomValue = pseudorandom_element(gftable, pseudoseed('gftable'))
            print(randomValue)
            card.ability.extra.gfstate = randomValue
            if card.ability.extra.gfstate == "krn" and card.ability.extra.state == 2 then
                card.ability.extra.hkrexist = 0 --Check for hakaris payout cuz of end_of_round shenanigans
                card.ability.extra.gfbuffer = 1
                return {
                    delay = 1.75,
                    message = ('WHAT THE HECK, DUDE!?'),
                    colour =  HEX('FFBC2A')
                }
            elseif card.ability.extra.gfstate == "hkr" and card.ability.extra.state == 2 then
                card.ability.extra.hkrexist = 1 --Check for hakaris payout cuz of end_of_round shenanigans positive output
                card.ability.extra.gfbuffer = 1
                return {
                    delay = 1.75,
                    message = ('Rentarou, Darling!~'),
                    colour =  HEX('ECA1B5')
                }
            elseif card.ability.extra.gfstate == "szk" and card.ability.extra.state == 2 then
                card.ability.extra.hkrexist = 0
                card.ability.extra.gfbuffer = 1
                card.ability.extra.handreq = pseudorandom_element(TJ.handtypepool, pseudoseed('shizuka')) --Shizuka randomizer
                card.ability.extra.handrew = pseudorandom_element(TJ.handtypepool, pseudoseed('shizuka2'))
                return {
                    delay = 1.75,
                    message = ('Good Day!'),
                    colour =  HEX('332D5A')
                }   
            elseif card.ability.extra.gfstate == "nno" and card.ability.extra.state == 2 then
                card.ability.extra.hkrexist = 0
                card.ability.extra.gfbuffer = 1
                return {
                    delay = 1.75,
                    message = ('How inefficient...'),
                    colour = HEX('CFC5F1')
                }   
            elseif card.ability.extra.gfstate == "hhr" and card.ability.extra.state == 2 then
                card.ability.extra.hkrexist = 0
                card.ability.extra.gfbuffer = 1
                return {
                    delay = 1.75,
                    message = ('Come to Mommy!~'),
                    colour =  HEX('EB7F94')
                }
            end
        end
        card.ability.extra.krnhasyapped = 0
        if context.before and card.ability.extra.gfstate == "krn" and card.ability.extra.roundcount > 0 and card.ability.extra.state == 2 and card.ability.extra.krnhasyapped == 0 then
            card.ability.extra.krnhasyapped = card.ability.extra.krnhasyapped+1
            card.ability.extra.settriggereffect = 1
            return {
                delay = 1.75,
                message = (krnyap[math.random(#krnyap)]),
                colour = HEX('FFBC2A')
            }
        end
        if context.individual and context.cardarea == G.play and card.ability.extra.gfstate == "krn" and card.ability.extra.roundcount > 0 and card.ability.extra.state == 2 and card.ability.extra.settriggereffect == 1 then
            for i = 1, #G.play.cards do
                if G.play.cards[i]:is_suit('Hearts') then
                    card.ability.extra.krnxmult = card.ability.extra.krnxmult + card.ability.extra.krnscale
                    card.ability.extra.spadechecmsgsent = card.ability.extra.spadechecmsgsent+1
                    G.play.cards[i]:change_suit("Spades")
                    G.play.cards[i]:juice_up(0.5)
                end
            end   
        end
        if context.joker_main and card.ability.extra.gfstate == "krn" and card.ability.extra.roundcount > 0 and card.ability.extra.state == 2 then
            card.ability.extra.krnhasyapped = 0
            card.ability.extra.settriggereffect = 0
            return {
                remove_default_message = true,
                xmult = card.ability.extra.krnxmult,
                delay = 1.85,
                message = (krnscore[math.random(#krnscore)]),
                colour =  HEX('FFBC2A')
            }
        end-----------------------------EVERYTHING BELOW THIS IS HAKARI
        if card.ability.extra.gfstate == "hkr" and card.ability.extra.roundcount > 0 and card.ability.extra.state == 2 and context.scoring_name == "Pair" and context.cardarea == G.play then
            if card.ability.extra.nothastalked == 0 then
                card_eval_status_text(card, 'extra', nil, nil, nil, {message = ('Just the two of us~'), colour = HEX('ECA1B5')})
                card.ability.extra.nothastalked = 1
            end
            for i = 1, #G.hand.cards do
                G.E_MANAGER:add_event(Event({
                    func = function()
                        if G.hand.cards[i]:is_suit("Spades") then
                            G.hand.cards[i]:change_suit("Hearts")
                            G.hand.cards[i]:juice_up(0.5)
                            card.ability.extra.hkrpayout = card.ability.extra.hkrpayout+card.ability.extra.hkrpayoutinc
                        end
                        return true
                    end
                }))
            end
        end
        if card.ability.extra.gfstate == "hkr" and card.ability.extra.roundcount > 0 and card.ability.extra.state == 2 and context.after then
            card.ability.extra.nothastalked = 0
        end---------------------------------EVERYTHING BELOW THIS IS SHIZUKA
        if card.ability.extra.gfstate == "szk" and card.ability.extra.roundcount > 0 and card.ability.extra.state == 2 and context.scoring_name == card.ability.extra.handreq then
            update_hand_text({sound = 'button', volume = 0.7, pitch = 1.1, delay = 0}, {mult = 0, chips = 0, handname = card.ability.extra.handreq, level = ''})
	    	level_up_hand(card, card.ability.extra.handreq, nil, card.ability.extra.shizukalvls)
            card.ability.extra.handreq = pseudorandom_element(TJ.handtypepool, pseudoseed('shizuka'))
            card.ability.extra.handrew = pseudorandom_element(TJ.handtypepool, pseudoseed('shizuka2'))
            return {
                delay = 1.75,
                message = (szkyap[math.random(#szkyap)]),
                colour = HEX('332D5A')
            }
        end----------------------------------EVERYTHING BELOW THIS IS NANO
        if card.ability.extra.gfstate == "nno" and card.ability.extra.roundcount > 0 and card.ability.extra.state == 2 and context.cardarea == G.play and #G.play.cards >= 5 then
            if G.play.cards[1]:get_id() ~= 14 then
                cardplayed = G.play.cards[1]
                assert(SMODS.change_base(cardplayed, nil, "Ace"))
                card.ability.extra.nnoxmult = card.ability.extra.nnoxmult+card.ability.extra.nnoscalexmult
            end
            if G.play.cards[1]:get_id() ~= 13 then
                cardplayed2 = G.play.cards[1]
                assert(SMODS.change_base(cardplayed2, nil, "Ace"))
                card.ability.extra.nnoxmult = card.ability.extra.nnoxmult+card.ability.extra.nnoscalexmult
            end
            if G.play.cards[2]:get_id() ~= 13 then
                cardplayed2 = G.play.cards[2]
                assert(SMODS.change_base(cardplayed2, nil, "King"))
                card.ability.extra.nnoxmult = card.ability.extra.nnoxmult+card.ability.extra.nnoscalexmult
            end
            if G.play.cards[3]:get_id() ~= 12 then
                cardplayed3 = G.play.cards[3]
                assert(SMODS.change_base(cardplayed3, nil, "Queen"))
                card.ability.extra.nnoxmult = card.ability.extra.nnoxmult+card.ability.extra.nnoscalexmult
            end
            if G.play.cards[4]:get_id() ~= 11 then
                cardplayed4 = G.play.cards[4]
                assert(SMODS.change_base(cardplayed4, nil, "Jack"))
                card.ability.extra.nnoxmult = card.ability.extra.nnoxmult+card.ability.extra.nnoscalexmult
            end
            if G.play.cards[5]:get_id() ~= 10 then
                cardplayed5 = G.play.cards[5]
                assert(SMODS.change_base(cardplayed5, nil, "10"))
                card.ability.extra.nnoxmult = card.ability.extra.nnoxmult+card.ability.extra.nnoscalexmult
            end
        elseif card.ability.extra.gfstate == "nno" and card.ability.extra.roundcount > 0 and card.ability.extra.state == 2 and context.joker_main then
            return{
                xmult = card.ability.extra.nnoxmult,
                delay = 1.5,
                message = ('Thats more efficient.'),
                colour = HEX('CFC5F1')
            }
        end-------------------------------------EVERYTHING BELOW THIS IS HAHARI
        if card.ability.extra.gfstate == "hhr" and card.ability.extra.roundcount > 0 and card.ability.extra.state == 2 and context.cardarea == G.play and haharibuffer2 == 0 then
            for i = 1, #G.hand.cards do
                G.E_MANAGER:add_event(Event({
                    func = function()
                        if G.hand.cards[i]:get_id() == 2 then
                            SMODS.calculate_effect({message = ('X1.25 Base'), colour = G.C.MONEY}, G.hand.cards[i])
                            card.ability.extra.hhrpayout = (card.ability.extra.hhrpayout * card.ability.extra.hhrpayoutinc)
                            if card.ability.extra.hhrpayout > 0 then
                                ease_dollars(math.floor(card.ability.extra.hhrpayout))
                            end
                        end
                        return true
                    end
                }))
            end
            print('hahariplayinghand')
            for i, playedcardhhr in ipairs(context.full_hand) do
                print('hahariint')
                if playedcardhhr:get_id() ~= 2 and context.cardarea == G.play then
                    playedcarddhhr2 = context.full_hand[i]
                    assert(SMODS.change_base(playedcarddhhr2, nil, "2"))
                    print('haharichange1card')
                elseif playedcardhhr:get_id() == 2 and context.cardarea == G.play then
                    print('haharithats2alr')
                end
            end
            haharibuffer2 = 1
        elseif card.ability.extra.gfstate == "hhr" and card.ability.extra.roundcount > 0 and card.ability.extra.state == 2 and context.joker_main then
            haharibuffer2 = 0
        elseif card.ability.extra.gfstate == "hhr" and card.ability.extra.roundcount > 0 and card.ability.extra.state == 2 and context.individual and context.cardarea == G.play then
            card.ability.extra.hhrpayout = 1
            return {
                xmult = card.ability.extra.hhrxmult
            }
        end
    end,
    calc_dollar_bonus = function(self, card)-------------STUPID PAYOUTTHING
        bonus = card.ability.extra.hkrpayout
        if bonus > 0 and card.ability.extra.hkrexist == 1 then
            card.ability.extra.hkrexist = 0
            return bonus
        end
    end,
        --- Old/THe way that i want Karane code, will revisit. last touched 4/16/2025
        --- for i = 1, #G.play.cards do
        ---    card.ability.extra.spadechecmsgsenteq = card.ability.extra.spadechecmsgsenteq or 0
        ---   card.ability.extra.spadechecmsgsent = card.ability.extra.spadechecmsgsent or 0
        ---    if context.individual and context.cardarea == G.play and card.ability.extra.gfstate == "krn" and card.ability.extra.roundcount > 0 and card.ability.extra.state == 2 then
        ---     G.E_MANAGER:add_event(Event({
        ---            delay = 0.35,
        ---            trigger = 'before',
        ---            func = function()
        ---                if G.play.cards[i]:is_suit("Hearts") then
        ---                    card.ability.extra.krnxmult = card.ability.extra.krnxmult + card.ability.extra.krnscale
        ---                    card.ability.extra.spadechecmsgsent = card.ability.extra.spadechecmsgsent+1
        ---                    G.play.cards[i]:change_suit("Spades")
        ---                    G.play.cards[i]:juice_up(1)
        ---                    print('suitaccepted')  
        ---                end
        ---                return true
        ---            end  
        ---        }))
        ---    end
        ---    if context.individual and context.cardarea == G.play and card.ability.extra.gfstate == "krn" and card.ability.extra.roundcount > 0 and G.play.cards[i]:is_suit("Hearts") and card.ability.extra.state == 2 and card.ability.extra.spadechecmsgsent ~= card.ability.spadechecmsgsenteq then
        ---        card.ability.extra.spadechecmsgsenteq = card.ability.extra.spadechecmsgsenteq+1
        ---        G.E_MANAGER:add_event(Event({
        ---            delay = 0.35,
        ---            trigger = 'before',
        ---            SMODS.calculate_effect({message = (krnyap[math.random(#krnyap)]), colour = HEX('FFBC2A')}, G.play.cards[i]),
        ---            print('message sent')
        ---       }))
        ---    end 
        ---end 
        ---if context.post_joker and card.ability.extra.gfstate == "krn" and card.ability.extra.roundcount > 0 and card.ability.extra.state == 2 then
        ---    print('spademessagereset')
        ---    return {
        ---        remove_default_message = true,
        ---        xmult = card.ability.extra.krnxmult,
        ---        delay = 1.85,
        ---        message = (krnscore[math.random(#krnscore)]),
        ---        colour =  HEX('FFBC2A')
        ---    }
    ---    end
---    end
}