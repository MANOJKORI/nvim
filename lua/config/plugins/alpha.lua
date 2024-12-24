return {
	"goolord/alpha-nvim",                             -- Dashboard plugin for Neovim
	dependencies = { "nvim-tree/nvim-web-devicons" }, -- Optional for icons
	opts = {
		dashboard = {
			preset = {
				header = {
					[[  ██╗      █████╗ ███████╗██╗   ██╗██╗   ██╗██╗███╗   ███╗          Z ]],
					[[  ██║     ██╔══██╗╚══███╔╝╚██╗ ██╔╝██║   ██║██║████╗ ████║      Z    ]],
					[[  ██║     ███████║  ███╔╝  ╚████╔╝ ██║   ██║██║██╔████╔██║   z       ]],
					[[  ██║     ██╔══██║ ███╔╝    ╚██╔╝  ╚██╗ ██╔╝██║██║╚██╔╝██║ z         ]],
					[[  ███████╗██║  ██║███████╗   ██║    ╚████╔╝ ██║██║ ╚═╝ ██║           ]],
					[[  ╚══════╝╚═╝  ╚═╝╚══════╝   ╚═╝     ╚═══╝  ╚═╝╚═╝     ╚═╝           ]],
				},
				keys = {
					{ icon = " ", key = "f", desc = "Find File", action = ":Telescope find_files <CR>" },
					{ icon = " ", key = "n", desc = "New File", action = ":ene | startinsert <CR>" },
					{ icon = " ", key = "r", desc = "Recent Files", action = ":Telescope oldfiles <CR>" },
					{ icon = " ", key = "c", desc = "Config", action = ":e ~/.config/nvim/init.lua <CR>" },
					{ icon = " ", key = "s", desc = "Restore Session", action = ":lua require('persistence').load() <CR>" },
					{ icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy <CR>" },
					{ icon = " ", key = "q", desc = "Quit", action = ":qa <CR>" },
				},
			},
		},
	},
	config = function(_, opts)
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		-- Set the header
		dashboard.section.header.val = opts.dashboard.preset.header

		-- Set menu options
		dashboard.section.buttons.val = {}
		for _, item in ipairs(opts.dashboard.preset.keys) do
			table.insert(
				dashboard.section.buttons.val,
				dashboard.button(item.key, item.icon .. " " .. item.desc, item.action)
			)
		end

		-- Footer (optional)
		dashboard.section.footer.val = "Customized Alpha Dashboard"

		-- Setup Alpha with the dashboard theme
		alpha.setup(dashboard.opts)

		-- Optional: Hide statusline and tabline in the dashboard
		vim.cmd([[
      autocmd FileType alpha setlocal nofoldenable | setlocal nonumber | setlocal norelativenumber
    ]])
	end,
}
