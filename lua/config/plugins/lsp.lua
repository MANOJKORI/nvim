return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"saghen/blink.cmp",
			{
				"folke/lazydev.nvim",
				ft = "lua", -- only load on lua files
				opts = {
					library = {
						{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
					},
				},
			},
		},
		config = function()
			local capabilities = require("blink.cmp").get_lsp_capabilities()
			require("lspconfig").lua_ls.setup({ capabilites = capabilities })
			--typeScriptlanguageserver setup
			require("lspconfig").ts_ls.setup({ capabilities = capabilities })
			--Java Langauage Server setup
			require("lspconfig").jdtls.setup({capabilities = capabilities})
		end,
	},
}