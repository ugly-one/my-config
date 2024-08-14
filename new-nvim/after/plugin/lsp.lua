local lsp_zero = require('lsp-zero')

-- lsp_attach is where you enable features that only work
-- if there is a language server active in the file
local lsp_attach = function(client, bufnr)
	local opts = {buffer = bufnr}

	vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
	vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
	vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
	vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
	vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
	vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
	vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
	vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
	vim.keymap.set({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
	vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
end

lsp_zero.extend_lspconfig({
	sign_text = false,
	lsp_attach = lsp_attach,
	capabilities = require('cmp_nvim_lsp').default_capabilities(),
})

require('mason').setup({})
require('mason-lspconfig').setup({
	-- Replace the language servers listed here 
	-- with the ones you want to install
	ensure_installed = {'lua_ls', 'omnisharp'},
	handlers = {
		function(server_name)
			require('lspconfig')[server_name].setup({})
		end,
	},
})

local cmp = require('cmp')

cmp.setup({
	sources = {
		{name = 'nvim_lsp'},
	},
	snippet = {
		expand = function(args)
			-- You need Neovim v0.10 to use vim.snippet
			vim.snippet.expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({}),
})


--require'lspconfig'.omnisharp.setup {
--	cmd = { "dotnet", "/home/tgn/.local/lib/omnisharp/OmniSharp.dll" },
--
--	settings = {
--		FormattingOptions = {
--			-- Enables support for reading code style, naming convention and analyzer
--			-- settings from .editorconfig.
--			EnableEditorConfigSupport = true,
--			-- Specifies whether 'using' directives should be grouped and sorted during
--			-- document formatting.
--			OrganizeImports = nil,
--		},
--		MsBuild = {
--			-- If true, MSBuild project system will only load projects for files that
--			-- were opened in the editor. This setting is useful for big C# codebases
--			-- and allows for faster initialization of code navigation features only
--			-- for projects that are relevant to code that is being edited. With this
--			-- setting enabled OmniSharp may load fewer projects and may thus display
--			-- incomplete reference lists for symbols.
--			LoadProjectsOnDemand = nil,
--		},
--		RoslynExtensionsOptions = {
--			-- Enables support for roslyn analyzers, code fixes and rulesets.
--			EnableAnalyzersSupport = nil,
--			-- Enables support for showing unimported types and unimported extension
--			-- methods in completion lists. When committed, the appropriate using
--			-- directive will be added at the top of the current file. This option can
--			-- have a negative impact on initial completion responsiveness,
--			-- particularly for the first few completion sessions after opening a
--			-- solution.
--			EnableImportCompletion = nil,
--			-- Only run analyzers against open files when 'enableRoslynAnalyzers' is
--			-- true
--			AnalyzeOpenDocumentsOnly = nil,
--		},
--		Sdk = {
--			-- Specifies whether to include preview versions of the .NET SDK when
--			-- determining which version to use for project loading.
--			IncludePrereleases = true,
--		},
--	},
--}
