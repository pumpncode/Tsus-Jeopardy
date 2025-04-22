SMODS.Joker{
    key = 'nomorenuzzles',
    atlas = 'Jokers2',
    rarity = 3, 
    cost = 12, 
    unlocked = true, 
    discovered = true, 
    blueprint_compat = false, 
    eternal_compat = false,
    perishable_compat = true,
    pos = {x = 0, y = 1},
    config = {extra = {xmult = 1.25, triggercount = 1, xmulttriggered = 0, hasdiscarded = 0, hasaddedretrigger = 0}},
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.xmult, card.ability.extra.triggercount, card.ability.extra.xmulttriggered, card.ability.extra.hasdiscarded, card.ability.extra.hasaddedretrigger}}
    end,
    calculate = function(self, card, context)
        ::retrigger::
        if context.pre_discard then
            card.ability.extra.hasdiscarded = 1
            if card.ability.extra.triggercount ~= 0 then
                card_eval_status_text(card, 'extra', nil, nil, nil, {message = ("NUZZLED!"), colour = HEX('FF456B')})
                card.ability.extra.triggercount = card.ability.extra.triggercount-1
                card.ability.extra.hasdiscarded = 1
            end  
        elseif context.joker_main and card.ability.extra.xmulttriggered ~= card.ability.extra.triggercount then
            card.ability.extra.xmulttriggered = card.ability.extra.xmulttriggered+1
            SMODS.calculate_effect({xmult = card.ability.extra.xmult}, card)
            goto retrigger
        elseif context.after and card.ability.extra.xmulttriggered == card.ability.extra.triggercount then
            card.ability.extra.xmulttriggered = 0
        elseif context.end_of_round and card.ability.extra.hasdiscarded ~= 1 and card.ability.extra.hasaddedretrigger == 0 then
            card_eval_status_text(card, 'extra', nil, nil, nil, {message = ("Bark!"), colour = HEX('FF456B')})
            card.ability.extra.triggercount = card.ability.extra.triggercount+1
            card.ability.extra.hasaddedretrigger = 1
        elseif context.setting_blind then
            card.ability.extra.hasaddedretrigger = 0
            card.ability.extra.hasdiscarded = 0
        end
    end
}


