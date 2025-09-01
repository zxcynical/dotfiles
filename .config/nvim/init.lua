require 'core.options'
require 'core.keymaps'

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
    local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
    if vim.v.shell_error ~= 0 then
	error('Error cloning lazy.nvim:\n' .. out)
    end
end

local rtp = vim.opt.rtp
rtp:prepend(lazypath)

require('lazy').setup({
	require 'plugins.neotree',
	require 'plugins.rosepine',
	require 'plugins.lualine',
	require 'plugins.indent',
	require 'plugins.treesitter',
	require 'plugins.gitsigns',
	{
		'windwp/nvim-autopairs',
		event = 'InsertEnter',
		config = true,
		opts = {}
	}
})
