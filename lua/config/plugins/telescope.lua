return {
	{
		'nvim-telescope/telescope.nvim',
		tag = '0.1.8',
		dependencies = {
			'nvim-lua/plenary.nvim',
			{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
		},
		config = function()
			require('telescope').setup {
				pickers = {
					find_files = {
						theme = "ivy"
					}
				},
				extensions = {
					fzf = {}
				}
			}

			require('telescope').load_extension('fzf')
			vim.keymap.set("n", "<space>fd", require('telescope.builtin').find_files)
			require "config.telescope.multigrep".setup()
		end
	}
}