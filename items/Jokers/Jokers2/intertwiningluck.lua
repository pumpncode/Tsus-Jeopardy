SMODS.Joker{
    key = 'intertwiningluck',
    atlas = 'Jokers2',
    rarity = 2, 
    cost = 4, 
    unlocked = true, 
    discovered = true, 
    blueprint_compat = false, 
    eternal_compat = false,
    perishable_compat = true,
    pos = {x = 4, y = 0},
    config = {extra = {odds = 2, wishcost = 6, rarepity = 0, legendarypity = 0, raresoftpity = 0, legendarysoftpity = 0, jokerrarity = 0}},
    loc_vars = function(self, info_queue, card)
        return {vars = {G.GAME.probabilities.normal or 1, card.ability.extra.wishcost, card.ability.extra.odds+2, card.ability.extra.odds+8, card.ability.extra.odds+88, card.ability.extra.rarepity, card.ability.extra.legendarypity, card.ability.extra.raresoftpity, card.ability.extra.legendarysoftpity, card.ability.extra.jokerrarity}}
    end,
    calculate = function(self, card, context)
        if context.setting_blind and G.GAME.dollars+G.GAME.dollar_buffer >= to_big(card.ability.extra.wishcost) and #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
            G.GAME.joker_buffer = G.GAME.joker_buffer + 1
            ease_dollars(card.ability.extra.wishcost*-1)
            card:juice_up(0.5)
            card.ability.extra.jokerrarity = 0
            if pseudorandom('intertwiningluckuncommon') < G.GAME.probabilities.normal/(card.ability.extra.odds+2) then
                print('uncommon')
                card.ability.extra.jokerrarity = 1
            end
            if card.ability.extra.raresoftpity ~= 1 and card.ability.extra.rarepity ~= 9 then
                if pseudorandom('intertwiningluckrare') < G.GAME.probabilities.normal/(card.ability.extra.odds+8) then
                    print('upgraderarevianone')
                    card.ability.extra.jokerrarity = 2
                end
            elseif card.ability.extra.raresoftpity == 1 and card.ability.extra.rarepity ~= 9 then
                if pseudorandom('intertwiningluckrare') < (G.GAME.probabilities.normal/(card.ability.extra.odds+8))+(card.ability.extra.raresoftpity*0.45) then
                    print('upgraderareviararesoftpity')
                    card.ability.extra.jokerrarity = 2
                end        
            elseif card.ability.extra.raresoftpity ~= 1 and card.ability.extra.rarepity == 9 then
                print('upgraderareviararepity')
                card.ability.extra.jokerrarity = 2
            end
            if card.ability.extra.legendarysoftpity <= 0 and card.ability.extra.legendarypity ~= 89 then
                if pseudorandom('intertwininglucklegendary') < (G.GAME.probabilities.normal/(card.ability.extra.odds+88)) then
                    print('upgradelegendaryvianone')
                    card.ability.extra.jokerrarity = 3
                end
            elseif card.ability.extra.legendarysoftpity > 0 and card.ability.extra.legendarypity ~= 89 then
                if pseudorandom('intertwininglucklegendary') < (G.GAME.probabilities.normal/(card.ability.extra.odds+88))+(card.ability.extra.legendarysoftpity*0.062125) then
                    print('upgradelegendaryviasoftpity')
                    card.ability.extra.jokerrarity = 3
                end
            elseif card.ability.extra.legendarysoftpity >= 0 and card.ability.extra.legendarypity == 89 then
                card.ability.extra.jokerrarity = 3
                print('upgradelegendaryviapity')
            end
             ---------------------------------------UNCOMMON CHECKS---------------------------------------------------------------------------------
             -------------------------UNCOMMON NOPITY-----------------------------
            if card.ability.extra.jokerrarity == 1 and card.ability.extra.rarepity < 8 and card.ability.extra.legendarypity < 74 then
                card.ability.extra.rarepity = card.ability.extra.rarepity+1
                card.ability.extra.legendarypity = card.ability.extra.legendarypity+1
                card_eval_status_text(card, 'extra', nil, nil, nil, {message = ("3 Star"), colour = HEX('60B6FD')})
                print('nopityuncommon')
                G.E_MANAGER:add_event(Event({func = function()
                    SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        rarity = 0.95
                    }
                    G.GAME.joker_buffer = G.GAME.joker_buffer - 1
                    return true end }))
             -------------------------UNCOMMON RARESOFTPITY-----------------------------
            elseif card.ability.extra.jokerrarity == 1 and card.ability.extra.rarepity == 8 and card.ability.extra.legendarypity < 74 then
                card.ability.extra.rarepity = card.ability.extra.rarepity+1
                card.ability.extra.raresoftpity = card.ability.extra.raresoftpity+1
                card.ability.extra.legendarypity = card.ability.extra.legendarypity+1
                print('raresoftpityuncommon')
                card_eval_status_text(card, 'extra', nil, nil, nil, {message = ("3 Star"), colour = HEX('60B6FD')})
                G.E_MANAGER:add_event(Event({func = function()
                    SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        rarity = 0.95
                    }
                    G.GAME.joker_buffer = G.GAME.joker_buffer - 1
                    return true end }))
                -----------------------UNCOMMON LEGENDARYSOFTPITY--------------------------------------------
            elseif card.ability.extra.jokerrarity == 1 and card.ability.extra.rarepity < 8 and card.ability.extra.legendarypity >= 74 then
                card.ability.extra.rarepity = card.ability.extra.rarepity+1
                card.ability.extra.raresoftpity = card.ability.extra.raresoftpity+1
                card.ability.extra.legendarypity = card.ability.extra.legendarypity+1
                print('legendarysoftpityuncommon')
                card_eval_status_text(card, 'extra', nil, nil, nil, {message = ("3 Star"), colour = HEX('60B6FD')})
                G.E_MANAGER:add_event(Event({func = function()
                    SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        rarity = 0.95
                    }
                    G.GAME.joker_buffer = G.GAME.joker_buffer - 1
                    return true end }))
             -------------------------UNCOMMON RARESOFTPITY AND LEGENDARYSOFTPITY-----------------------------
            elseif card.ability.extra.jokerrarity == 1 and card.ability.extra.rarepity == 8 and card.ability.extra.legendarypity >= 74 then
                card.ability.extra.rarepity = card.ability.extra.rarepity+1
                card.ability.extra.raresoftpity = card.ability.extra.raresoftpity+1
                card.ability.extra.legendarypity = card.ability.extra.legendarypity+1
                card.ability.extra.legendarysoftpity = card.ability.extra.legendarysoftpity+1
                print('bothpityuncommon')
                card_eval_status_text(card, 'extra', nil, nil, nil, {message = ("3 Star"), colour = HEX('60B6FD')})
                G.E_MANAGER:add_event(Event({func = function()
                    SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        rarity = 0.95
                    }
                    G.GAME.joker_buffer = G.GAME.joker_buffer - 1
                    return true end }))
              ------------------------------------RARE CHECKS-----------------------------------------------
            elseif card.ability.extra.jokerrarity == 2 and card.ability.extra.legendarypity < 74 then
                card.ability.extra.rarepity = 0
                card.ability.extra.raresoftpity = 0
                card.ability.extra.legendarypity = card.ability.extra.legendarypity+1
                print('legendarypityincreaserare')
                card_eval_status_text(card, 'extra', nil, nil, nil, {message = ("4 Star"), colour = HEX('CA75FF')})
                G.E_MANAGER:add_event(Event({func = function()
                    SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        rarity = 1
                    }
                    G.GAME.joker_buffer = G.GAME.joker_buffer - 1
                    return true end }))
            elseif card.ability.extra.jokerrarity == 2 and card.ability.extra.legendarypity >= 74 then
                card.ability.extra.rarepity = 0
                card.ability.extra.raresoftpity = 0
                card.ability.extra.legendarypity = card.ability.extra.legendarypity+1
                card.ability.extra.legendarysoftpity = card.ability.extra.legendarysoftpity+1
                print('legendaryincreaseraresoftpity')
                card_eval_status_text(card, 'extra', nil, nil, nil, {message = ("4 Star"), colour = HEX('CA75FF')})
                G.E_MANAGER:add_event(Event({func = function()
                    SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        rarity = 1
                    }
                    G.GAME.joker_buffer = G.GAME.joker_buffer - 1
                    return true end }))
             ------------------------------LEGENDARY CHECKS---------------------------------------
            elseif card.ability.extra.jokerrarity == 3 then
                card.ability.extra.rarepity = 0
                card.ability.extra.raresoftpity = 0
                card.ability.extra.legendarypity = 0
                card.ability.extra.legendarysoftpity = 0
                print('legendarynone')
                card_eval_status_text(card, 'extra', nil, nil, nil, {message = ("5 Star"), colour = HEX('FFE375')})
                G.E_MANAGER:add_event(Event({func = function()
                    SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        legendary = true
                    }
                    G.GAME.joker_buffer = G.GAME.joker_buffer - 1
                    return true
                end }))
            elseif card.ability.extra.jokerrarity == 0 then
                card.ability.extra.legendarypity = card.ability.extra.legendarypity+1
                card.ability.extra.rarepity = card.ability.extra.rarepity+1
                print('qiqid')
                card_eval_status_text(card, 'extra', nil, nil, nil, {message = ("Coco... goat..."), colour = HEX('CA91CC')})
                G.GAME.joker_buffer = G.GAME.joker_buffer-1
            end
        end
    end

}
