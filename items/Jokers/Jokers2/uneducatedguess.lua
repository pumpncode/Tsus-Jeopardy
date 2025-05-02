SMODS.Joker{
    key = 'uneducatedguess',
    atlas = 'Jokers2',
    rarity = 1, 
    cost = 6, 
    unlocked = true, 
    discovered = true, 
    blueprint_compat = false, 
    eternal_compat = false,
    perishable_compat = true,
    pos = {x = 4, y = 3},
    config = {extra = {rank1label = "?", rank2label = "?", rank3label = "?", payout = 15}},
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.rank1label, card.ability.extra.rank2label, card.ability.extra.rank3label, card.ability.extra.payout}}
    end,
    add_to_deck = function(self, card, from_debuff)
        ranktable = {
            2,
            3,
            4,
            5,
            6,
            7,
            8,
            9,
            10,
            11,
            12,
            13,
            14
        }
        rank1 = pseudorandom_element(ranktable, pseudoseed('uneducatedguess1'))
        rank2 = pseudorandom_element(ranktable, pseudoseed('uneducatedguess2'))
        rank3 = pseudorandom_element(ranktable, pseudoseed('uneducatedguess3'))
        if rank1 > 10 then
            if rank1 == 11 then
                card.ability.extra.rank1label = "Jack"
            elseif rank1 == 12 then
                card.ability.extra.rank1label = "Queen"
            elseif rank1 == 13 then
                card.ability.extra.rank1label = "King"
            elseif rank1 == 14 then
                card.ability.extra.rank1label = "Ace"
            end
        else
            card.ability.extra.rank1label = rank1
        end
        ::rank2check::
        if rank2 == rank1 then
            rank2 = pseudorandom_element(ranktable, pseudoseed('uneducatedguess6'))
            goto rank2check
        end
        if rank2 > 10 then
            if rank2 == 11 then
                card.ability.extra.rank2label = "Jack"
            elseif rank2 == 12 then
                card.ability.extra.rank2label = "Queen"
            elseif rank2 == 13 then
                card.ability.extra.rank2label = "King"
            elseif rank2 == 14 then
                card.ability.extra.rank2label = "Ace"
            end
        else card.ability.extra.rank2label = rank2
        end
        ::rank3check::
        if rank3 == rank2 or rank3 == rank1 then
            rank3 = pseudorandom_element(ranktable, pseudoseed('uneducatedguess6'))
            goto rank3check
        end
        if rank3 > 10 then
            if rank3 == 11 then
                card.ability.extra.rank3label = "Jack"
            elseif rank3 == 12 then
                card.ability.extra.rank3label = "Queen"
            elseif rank3 == 13 then
                card.ability.extra.rank3label = "King"
            elseif rank3 == 14 then
                card.ability.extra.rank3label = "Ace"
            end
        else card.ability.extra.rank3label = rank3
        end
    end,
    calculate = function(self, card, context)
        if rank1 > 10 then
            if rank1 == 11 then
                card.ability.extra.rank1label = "Jack"
            elseif rank1 == 12 then
                card.ability.extra.rank1label = "Queen"
            elseif rank1 == 13 then
                card.ability.extra.rank1label = "King"
            elseif rank1 == 14 then
                card.ability.extra.rank1label = "Ace"
            end
        else
            card.ability.extra.rank1label = rank1
        end
        ::rank2check::
        if rank2 == rank1 then
            rank2 = pseudorandom_element(ranktable, pseudoseed('uneducatedguess6'))
            goto rank2check
        end
        if rank2 > 10 then
            if rank2 == 11 then
                card.ability.extra.rank2label = "Jack"
            elseif rank2 == 12 then
                card.ability.extra.rank2label = "Queen"
            elseif rank2 == 13 then
                card.ability.extra.rank2label = "King"
            elseif rank2 == 14 then
                card.ability.extra.rank2label = "Ace"
            end
        else card.ability.extra.rank2label = rank2
        end
        ::rank3check::
        if rank3 == rank2 or rank3 == rank1 then
            rank3 = pseudorandom_element(ranktable, pseudoseed('uneducatedguess6'))
            goto rank3check
        end
        if rank3 > 10 then
            if rank3 == 11 then
                card.ability.extra.rank3label = "Jack"
            elseif rank3 == 12 then
                card.ability.extra.rank3label = "Queen"
            elseif rank3 == 13 then
                card.ability.extra.rank3label = "King"
            elseif rank3 == 14 then
                card.ability.extra.rank3label = "Ace"
            end
        else card.ability.extra.rank3label = rank3
        end
        local chosenranktable = {
            rank1,
            rank2,
            rank3
        }
        local actualchosenrank = pseudorandom_element(chosenranktable, pseudoseed('uneducatedguess4')) 
        if context.before then
            for i, playedcard in ipairs(context.scoring_hand) do
                if playedcard:get_id() == actualchosenrank then
                    print('you got it right!!')
                    ease_dollars(to_big(15))
                    card_eval_status_text(playedcard, 'extra', nil, nil, nil, {message = ("CORRECT!"), colour = HEX('2dfe8e')})
                end
            end
        end
        if context.after then
            rank1 = pseudorandom_element(ranktable, pseudoseed('uneducatedguess5'))
            rank2 = pseudorandom_element(ranktable, pseudoseed('uneducatedguess6'))
            rank3 = pseudorandom_element(ranktable, pseudoseed('uneducatedguess7'))
            return {
                message = 'Changed!',
                colour = HEX('e9d4ff')
            }
        end
    end
}
