local Keybind = {}
local options = {
  n   = { noremap=true },
  e   = { expr=true },
  s   = { silent=true },
  ne  = { noremap=true, expr=true },
  en  = { noremap=true, expr=true },
  ns  = { noremap=true, silent=true },
  sn  = { noremap=true, silent=true },
  es  = { silent=true, expr=true },
  se  = { silent=true, expr=true },
  nes = { noremap=true, silent=true, expr=true },
  esn = { noremap=true, silent=true, expr=true },
  ens = { noremap=true, silent=true, expr=true },
  sen = { noremap=true, silent=true, expr=true },
	def	= {}
}

Keybind.add_global_keybinds = function (keybinds, mode, opt_key)
  mode = mode or 'n'
  opt_key = opt_key or 'def'

  for _, keybind in pairs(keybinds) do
    vim.api.nvim_set_keymap(
        mode,
        keybind[1],
        keybind[2],
        options[opt_key]
    )
  end
end

Keybind.add_global_normal_keybinds = function (keybinds, opt_key)
  opt_key = opt_key or 'n'

  for _, keybind in pairs(keybinds) do
    vim.api.nvim_set_keymap(
        'n',
        keybind[1],
        keybind[2],
        options[opt_key]
    )

  end
end

Keybind.add_buffer_keybinds = function (keybinds)
	for _, keybind in pairs(keybinds) do
		if(keybind[5] == nil)  then
			keybind[5] = {}
		end

		vim.api.nvim_buf_set_keymap(
		keybind[1],
		keybind[2],
		keybind[3],
		keybind[4],
		keybind[5]
		)
	end
end

Keybind.g = Keybind.add_global_keybinds
Keybind.b = Keybind.add_buffer_keybinds

Keybind.n_opt = { noremap=true }
Keybind.e_opt = { expr=true }
Keybind.s_opt = { silent=true }
Keybind.ns_opt = { noremap=true, silent=true }
Keybind.nse_opt = { noremap=true, silent=true, expr=true }

Keybind.g_n = Keybind.add_global_normal_keybinds

return Keybind
