tje = {}
function tje.mphand() -- takes most played hand (Port of Jen's Almanac's favhand, sorry!!! and thank you so much!!!)
	if not G.GAME or not G.GAME.current_round then return 'High Card' end
	local chosen_hand = 'High Card'
	local _handname, _played, _order = 'High Card', -1, 100
	for k, v in pairs(G.GAME.hands) do
		if v.played > _played or (v.played == _played and _order > v.order) then 
			_played = v.played
			_handname = k
		end
	end
	chosen_hand = _handname
	return chosen_hand
end
function tje.lvlhandtrig() -- also a port of JEnsLib... SORRY!!!
	update_hand_text({sound = 'button', volume = 0.7, pitch = 1.1, delay = 0}, {mult = 0, chips = 0, handname = '', level = ''})
end