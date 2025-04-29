return {
   { "nvim-tree/nvim-tree.lua", config = function()
        require("nvim-tree").setup()
    end },
	{ "williamboman/mason.nvim", config = function()
        require("mason").setup()
    end }
}


