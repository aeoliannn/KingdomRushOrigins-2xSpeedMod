local ok, V = pcall(require, "klua.vector")
if not ok then V = require("hump.vector-light") end

local M = {
	active = false,
	btn_added = false,
	btn = nil,
	prev_in_game = false,
	_last_click = 0
}

function M:init()
	local sio = require("storage_io_generic")
	local orig_write_file = sio.write_file
	sio.write_file = function(self, filename, data_table)
		if filename == "settings.lua" then
			data_table.custom_script = "mod"
		end
		return orig_write_file(self, filename, data_table)
	end
end

function M:update(dt)
	if not game then return end

	local in_game = game.game_gui ~= nil

	if in_game then
		local gg = game.game_gui
		if M.btn_added and gg and gg.hud_bottom and gg.hud_bottom.next_wave ~= M._nw then
			M.btn_added = false
			M.btn = nil
			M._nw = nil
		end
		if not M.btn_added then
			M:add_button()
		end
		game.DBG_TIME_MULT = M.active and 2 or nil
	else
		game.DBG_TIME_MULT = nil
		M:set_active(false)
		if M.btn_added then
			M.btn_added = false
			M.btn = nil
			M._nw = nil
		end
	end

	M.prev_in_game = in_game
end

function M:add_button()
	local gg = game.game_gui
	if not gg or not gg.hud_bottom or not gg.hud_bottom.next_wave then return end
	if not gg.next_wave_button then return end
	M.btn_added = true

	local nw = gg.hud_bottom.next_wave
	local nwb = gg.next_wave_button
	M._nw = nw

	local ok, btn = pcall(function()
		return GGOptionsButton:new("1x Speed")
	end)
	if not ok or not btn then return end
	if not btn.size or not nwb.pos or not nwb.size then return end

	btn.anchor = V.v(math.floor(btn.size.x / 2), btn.size.y)
	btn.pos = V.v(nwb.pos.x - nwb.size.x / 2 - btn.size.x / 2 - 6, nwb.pos.y)

	function btn.on_click(self)
		local t = os.clock()
		if t - M._last_click < 0.25 then return end
		M._last_click = t
		M:set_active(not M.active)
	end

	if not nw.add_child then return end
	nw:add_child(btn)
	M.btn = btn
end

function M:set_active(v)
	M.active = v
	if M.btn and M.btn.label then
		M.btn.label.text = v and "2x Speed" or "1x Speed"
	end
end

function M:keypressed(key, isrepeat)
	if key ~= "f" then return end
	if not game or not game.game_gui then return end
	M:set_active(not M.active)
end

custom_script = M
return M
