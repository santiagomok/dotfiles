-- Fuzzy finder
-- https://github.com/ibhagwan/fzf-lua

return {
	"ibhagwan/fzf-lua",
	cmd = "FzfLua",
	keys = {
		{ "<leader><space>",    "<cmd>FzfLua live_grep_native<cr>",      desc = "Grep" },
		{ "<leader>*",          "<cmd>FzfLua grep_cword<cr>",            desc = "Grep word under cursor" },
		{ "grC",                "<cmd>FzfLua grep_cword<cr>",            desc = "Grep WORD under cursor" },

		{ "ff",         "<cmd>FzfLua files<cr>",            desc = "Find files" },
		{ "FF",         "<cmd>FzfLua files cwd=../..<cr>",  desc = "Find files from parents" },
		{ "<leader>b",  "<cmd>FzfLua buffers<cr>",          desc = "Find buffers" },

		{ "ss",  "<cmd>FzfLua spell_suggest<cr>",         desc = "Spell suggest" },
		{ "ft",  "<cmd>FzfLua filetypes<cr>",             desc = "Change file-types" },
		{ "<leader><leader>",  "<cmd>FzfLua keymaps<cr>",               desc = "View keymaps" },
		{ "<leader>?",  "<cmd>FzfLua help_tags<cr>",             desc = "Help tags" },

		{ "ch",  "<cmd>FzfLua command_history<cr>",       desc = "Command history" },
		{ "sh",  "<cmd>FzfLua search_history<cr>",        desc = "Search history" },
		{ "hg",  "<cmd>FzfLua highlights<cr>",            desc = "Highlights" },

		{ "sc",  "<cmd>FzfLua git_bcommits<cr>",          desc = "Source control commits" },

		{ "ld",  "<cmd>FzfLua lsp_definitions<cr>",       desc = "LSP definitions" },
		{ "lr",  "<cmd>FzfLua lsp_references<cr>",        desc = "LSP references" },
		{ "li",  "<cmd>FzfLua lsp_implementations<cr>",   desc = "LSP implementations" },
		{ "ltd", "<cmd>FzfLua lsp_typedefs<cr>",          desc = "LSP type definitions" },
		{ "lds", "<cmd>FzfLua lsp_document_symbols<cr>",  desc = "LSP document symbols" },
		{ "lws", "<cmd>FzfLua lsp_workspace_symbols<cr>", desc = "LSP workspace symbols" },
		{ "ca",  "<cmd>FzfLua lsp_code_actions<cr>",      desc = "LSP code actions" },
	}
}
