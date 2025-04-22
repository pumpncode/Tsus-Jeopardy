SMODS.Consumable{
    key = 'Schnorange',
    set = 'TokenConsumable',
    atlas = 'TokenConsumableAtlas',
    pos = {x = 0, y = 0},
    cost = 0,
    loc_txt = {
        name = "A {C:mult}Slice{} of {C:attention}Life{}",
        text = {
            "Adds {X:mult,C:white}X1.5{} to {C:attention}Schneider{}.",
            "{C:green}#1#{} in {C:green}#4#{} chance to {C:red}Destroy{} her {C:green}instead{}.",
            "{C:red}Self Destruct{} after {C:attention}Big Blind{}.",
            "{C:green,s:0.75}#1#{} {C:inactive,s:0.75}in{} {C:green,s:0.75}#5#{} {C:inactive,s:0.75}chance to{} {C:mult,s:0.75}Lose{} {C:money,s:0.75}$20{} {C:inactive,s:0.75}when sold.{}"
        }
    },
    can_use = function()
        return true
    end,
    config = {extra ={cost = -20, buffer = 0, odds = 8, odds2 = 2}},
    loc_vars = function(self, info_queue, card)
        return {vars = {G.GAME.probabilities.normal, card.ability.extra.negativecost, card.ability.extra.buffer, card.ability.extra.odds, card.ability.extra.odds2}}
    end,
    calculate = function(self, card, context)
        if context.selling_self then
            if pseudorandom('Schnorange') < G.GAME.probabilities.normal/card.ability.extra.odds2 then
                ease_dollars(-20)
            else
                ease_dollars(-1)
            end
        elseif context.end_of_round and G.GAME.blind:get_type() == "Big" and card.ability.extra.buffer ~= 1 then
            card.ability.extra.buffer = 1,
            play_sound('tarot1')
            card:start_dissolve()
        end
    end
}
SMODS.Consumable{ -- some code taken from JEns Almanac.. idk how to level up like that
    key = 'Celestite',
    set = 'TokenConsumable',
    atlas = 'TokenConsumableAtlas',
    pos = {x = 1, y = 0},
    soul_pos = {x = 2, y = 0},
    loc_txt = {
        name = "{C:celestite}Celestite{}",
        text = {
            "{C:celestite}+3 Levels{} to {C:blue}Most Played Hand{}",
            "{C:attention}Add{} {X:celestite,C:white}0.15{} {X:celestite,C:white}Charge{} to {C:celestite}CRYSTA//{}.",
            '{C:inactive}"Floating Space Rock..."{}'

        }
    },
    can_use = function()
        return true
    end,
    config = {extra ={ levels = 3}},
    loc_vars = function(self, info_queue, center)
        return {(((center or {}).ability or {}).extra or {}).levels or 3}
    end,
	can_use = function(self, card)
		return true
	end,
	use = function(self, card, area, copier)
		local hand = tje.mphand()
        update_hand_text({sound = 'button', volume = 0.7, pitch = 1.1, delay = 0}, {mult = 0, chips = 0, handname = hand, level = ''})
		level_up_hand(card, hand, nil, card.ability.extra.levels)
	end
}
SMODS.Consumable{ -- some code taken from JEns Almanac.. idk how to level up like that
    key = 'thmmedicin',
    set = 'TokenConsumable',
    atlas = 'TokenConsumableAtlas',
    pos = {x = 3, y = 0},
    loc_txt = {
        name = "{C:thmtron}The Human Magnet Medicinatron{}",
        text = {
            "{C:inactive,s:0.75}[Drug]{}",
            "{C:chips}Chips{} and {C:mult}Mult{} are {C:thmtron}Multiplied{}",
            "to {C:thmtron}eachother{} then {C:attention}Quartered{}",
            "{C:attention}after {C:blue}scoring{}",
            "{s:0.65,C:inactive}(Lasts for 1 Round)",
            "{s:0.55,C:inactive}FAIR WARNING :{}",
            "{s:0.45,C:inactive}This Drug can cause 3 days and nights of{}",
            "{s:0.45,C:inactive}Unimaginable Constipation.{}"

        }
    },
    can_use = function()
        return true
    end
}
SMODS.Consumable{
    key = 'potion1',
    set = 'TokenConsumable',
    atlas = 'TokenConsumableAtlas',
    pos = {x = 4, y = 0},
    loc_txt = {
        name = "{C:thmtron}Potion1{}",
        text = {
            "{C:inactive,s:0.75}[Drug]{}"

        }
    },
    can_use = function()
        return true
    end
}
SMODS.Consumable{
    key = 'potion2',
    set = 'TokenConsumable',
    atlas = 'TokenConsumableAtlas',
    pos = {x = 5, y = 0},
    loc_txt = {
        name = "{C:thmtron}Potion2{}",
        text = {
            "{C:inactive,s:0.75}[Drug]{}"

        }
    },
    can_use = function()
        return true
    end
}
SMODS.Consumable{
    key = 'ennui',
    set = 'TokenConsumable',
    atlas = 'TokenConsumableAtlas',
    pos = {x = 6, y = 0},
    loc_txt = {
        name = "{C:thmtron}Ultimate Ennui Destroy{}",
        text = {
            "{C:inactive,s:0.75}[Drug]{}"

        }
    },
    can_use = function()
        return true
    end
}
SMODS.Consumable{
    key = 'potion4',
    set = 'TokenConsumable',
    atlas = 'TokenConsumableAtlas',
    pos = {x = 7, y = 0},
    loc_txt = {
        name = "{C:thmtron}Potion4{}",
        text = {
            "{C:inactive,s:0.75}[Drug]{}"

        }
    },
    can_use = function()
        return true
    end
}