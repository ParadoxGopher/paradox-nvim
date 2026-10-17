local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- auto-install lazy plugin manager
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	print("installing lazy plugin manager")
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
	print("done.")
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	spec = {
		{ import = "plugins" },
	},
})
