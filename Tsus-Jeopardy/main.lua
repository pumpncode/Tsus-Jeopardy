--- STEAMODDED HEADER
--- MOD_NAME: Tsu's Jeopardy
--- MOD_ID: TsusJeo
--- MOD_AUTHOR: [tje.tsu]
--- MOD_DESCRIPTION: Balatro Gambling
--- BADGE_COLOR: 1DA387
--- PREFIX: tje
--- VERSION: 0.0.15 [TEST RELEASE]
----------------------------------------------
------------MOD CODE -------------------------
----------------tokens-------------------------------
assert(SMODS.load_file('items/Consumables/tokenConsumables.lua'))()
----------------Jokers---------------------------
assert(SMODS.load_file('items/Jokers/HexlegJokers.lua'))() --- Hexxed Legendaries
assert(SMODS.load_file('items/Jokers/ComingSoonJokers.lua'))()
assert(SMODS.load_file('items/Jokers/Jokers2/Jokers2.lua'))()
----------------etc---------------------------
assert(SMODS.load_file('essential/TjeLib.lua'))()
----------------Enhancements---------------------
-----------------------Decks-----------------------------------
assert(SMODS.load_file('items/Decks/phony.lua'))()
assert(SMODS.load_file('items/Decks/hexxed.lua'))()
-----------Global Values---------------------
assert(SMODS.load_file('global.lua'))()
--T T T TALISMAN SUPPORT!?!?!
to_big = to_big or function(x) return x end
to_number = to_number or function(x) return x end 
---- ATLASES -----------------------------------------------------------------------------------------------------------------------------------------------------
SMODS.Atlas{
    key = 'Decks', 
    path = 'Decks.png',
    px = 71, 
    py = 95 
}
SMODS.Atlas{
    key = 'TokenConsumableAtlas', --Blank key
    path = 'tokenConsumables.png',
    px = 71, 
    py = 95
}
SMODS.Atlas{
    key = 'soonjokers',
    path = 'csoonJoker.png',
    px = 71, 
    py = 95
}
SMODS.Atlas{
    key = 'Jokers',
    path = 'Jokers.png',
    px = 71,
    py = 95
}
SMODS.Atlas{
    key = 'Jokers2',
    path = 'Jokers2.png',
    px = 71,
    py = 95
}
---CONSUMABLE TYPES ------------------------------------------------------------------------------------------------------------------------------------------------------------
SMODS.ConsumableType{
    key = "TokenConsumable",
    collection_rows = {4,5},
    primary_colour = G.C.WHITE,
    secondary_colour = G.C.GREEN,
    loc_txt = {
        collection = "Tokens",
        name = "Token",
        undiscovered = {
            name = "???",
            text = {"Find the Joker that generates this card","To see its information!"}
        }
    },
    shop_rate = 0,
}
-------------------------MISC-------------------------------------------------
SMODS.Atlas {
    key = "modicon",
    path = "mod_icon.png",
    px = 32,
    py = 32,
}
----------------RARITY------------------------
local hexleggradiant =
SMODS.Gradient{
    key = "hexgradie",
    colours = {
        HEX('B400FA'),
        HEX('431E40')
    }
}
SMODS.Rarity{
    key = "tjHl",
    loc_txt = {
        name = "Hexed Legendary"
    },
    default_weight = 0,
    badge_colour = hexleggradiant,
    pools = {
        ['Schneider'] = true,
        ['Crystal'] = true
    }
}
local thmmtrongradie =
SMODS.Gradient{
    key = "thmmtrongradient",
    colours = {
        HEX('FE6262'),
        HEX('69A7F7')
    }
}
SMODS.Rarity{
    key = "comingsoon",
    loc_txt = {
        name = "Coming Soon!"
    },
    default_weight = 0,
    badge_colour = HEX('7ADF97'),
    pools = {
    }
}
---------------------grad for loc_text----------- ty again john smods!
loc_colour('') -- initializes args in case they're not there yet
G.ARGS.LOC_COLOURS.thmtron = SMODS.Gradients.tje_thmmtrongradient
G.ARGS.LOC_COLOURS.hextxt = SMODS.Gradients.tje_hexgradie
G.C.KusuriPopText = HEX('D33245')
G.C.tsusjeopardytxt = HEX('1DA387')
G.ARGS.LOC_COLOURS.tsusjeopardytxt = G.C.tsusjeopardytxt
G.C.clstite = HEX('CA4DDF')
G.ARGS.LOC_COLOURS.clstite = G.C.clstite
----------------------------------------------
------------MOD CODE END----------------------