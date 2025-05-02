--- STEAMODDED HEADER
--- MOD_NAME: Tsu's Jeopardy
--- MOD_ID: TsusJeo
--- MOD_AUTHOR: [tje.tsu]
--- MOD_DESCRIPTION: Whole lotta Rolling
--- BADGE_COLOR: 1DA387
--- PREFIX: tje
--- VERSION: 0.25 [TEST RELEASE]
----------------------------------------------
------------MOD CODE -------------------------
----------------Boosters-------------------------
----------------Wager Consumable-----------------
----------------Blank Consumable-----------------
----------------tokens-------------------------------
assert(SMODS.load_file('items/Consumables/tokenConsumables.lua'))()
----------------Jokers---------------------------
assert(SMODS.load_file('items/Jokers/Jokers2/Jokers2.lua'))()
assert(SMODS.load_file('items/Jokers/HexlegJokers.lua'))() --- Hexxed Legendaries
assert(SMODS.load_file('items/Jokers/ComingSoonJokers.lua'))()
----------------Sounds---------------------------
assert(SMODS.load_file('essential/TjeLib.lua'))()
----------------Enhancements---------------------
--assert(SMODS.load_file('items/Enhancements/enhancements.lua'))()
-----------------------Decks-----------------------------------
assert(SMODS.load_file('items/Decks/phony.lua'))()
assert(SMODS.load_file('items/Decks/hexxed.lua'))()
assert(SMODS.load_file('items/Decks/candyblossom.lua'))()
assert(SMODS.load_file('items/Decks/dusted.lua'))()
------------Blinds-----------------------
-----------Global Values---------------------
assert(SMODS.load_file('global.lua'))()
--T T T TALISMAN SUPPORT!?!?!
to_big = to_big or function(x) return x end
to_number = to_number or function(x) return x end 
SMODS.Sound{
    key = "tje_divine_kill",
    path = "tje_divine_kill.ogg",
    sync = true
}
SMODS.Sound{
    key = "tje_divine_lvup",
    path = "tje_divine_lvup.ogg",
    sync = true
}
------------Colo(u)rs
local colours = {
    tje_blank_pack = HEX('9AB3F1'),
    
}

kusuripop = HEX('D33245')
---- ATLASES -----------------------------------------------------------------------------------------------------------------------------------------------------
SMODS.Atlas{
    key = 'Decks', --atlas key
    path = 'Decks.png', --atlas' path in (yourMod)/assets/1x or (yourMod)/assets/2x
    px = 71, --width of one card
    py = 95 -- height of one card
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
SMODS.Atlas{
    key = 'TokenConsumableAtlas',
    path = 'tokenConsumables.png',
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

SMODS.Gradient{
    key = "thmmtrongradient",
    colours = {
        HEX('FE6262'),
        HEX('69A7F7')
    }
}
SMODS.Gradient{
    key = "shockedgradient",
    colours = {
        HEX('FCE899'),
        HEX('99F5FC')
    }
}
SMODS.Gradient{
    key = "rainbowgradient",
    colours = {
        HEX('F61F31'),
        HEX('F66E1F'),
        HEX('F6C71F'),
        HEX('59F61F'),
        HEX('1FA3F6'),
        HEX('AE1FF6')
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
G.ARGS.LOC_COLOURS.shocked = SMODS.Gradients.tje_shockedgradient
G.C.chocolate = HEX('74594D')
G.ARGS.LOC_COLOURS.chocolate = G.C.chocolate
G.ARGS.LOC_COLOURS.rainbowgradient = SMODS.Gradients.tje_rainbowgradient
----------------------------------------------
------------MOD CODE END----------------------