# neovim-config
My configuration for neovim (as a backup)

## Path to config files

There are two main folders used by neovim, namely: nvim and nvim-data. These are located at (for Windows):
```
C:/Users/<username>/AppData/Local/
```

## About the folders (nvim and nvim-data)

- nvim-data : stores the downloaded plugins, history, logs and a bunch of other stuff, and is generated pretty much automatically. We don't need to touch this folder. All we need to ensure is that the folder exists (if it doesn't then we can just create it with this name).
- nvim : **This folder will store all the configuration files**, that tell neovim how it should behave, how the UI of the editor should look, what plugins to install, etc.

## Configuration files (inside the nvim folder)

The essential structure (excluding the plugin files) of the nvim folder looks like

```
nvim/
|--- init.lua
|--- lua/
      |--- config/
      |       |--- lazy.lua
      |--- plugins/
```

- init.lua : Contains the basic configuration (line numbers, keeping syntax highlighting on, etc.). **Importantly, here we include the config/lazy.lua file (through a require call)**.
- lazy.lua : configuration to include the Lazy-nvim plugin manager. **Here, we add the ability to go through the files in the plugins folder, and include them**.

## Some plugins and their uses

- telescope.lua : for nvim-telescope, that helps with fuzzy finding
- treesitter.lua : for nvim-treesitter, that helps with syntax highlighting, code navigation, etc.
- lsp.lua : for LSP config (language server), to allow abilities like 'go to references', 'go to implementation', 'go to definition', etc.
- dap.lua : for debugging controls
- colorscheme.lua : for complete color customization (either using some theme, or by manual customization)
- autocompletion.lua : for text autocompletion (a dropdown that shows up while typing, to give suggestions)
- statusline.lua : for the styling of the statusline

## Mapping Caps Lock to Esc key

In Windows, one way I have found to map Caps Lock to Esc, in through the use of the tool Uncap: https://github.com/susam/uncap
Just running uncap.exe in the background maps the Caps Lock key to Esc key. To automate this task, the following can be included in the init.lua file:

```lua
-- run uncap.exe if it is not already running (to map caps lock to esc key)
if vim.loop.os_uname().sysname == "Windows_NT" then
  local handle = io.popen('tasklist /FI "IMAGENAME eq uncap.exe"')
  local result = handle:read("*a")
  handle:close()
  if not result:match("uncap.exe") then
    vim.fn.jobstart({ "<PATH TO uncap.exe>" }, { detach = true })
	
	-- to kill uncap.exe when all nvim instances close
	vim.api.nvim_create_autocmd("VimLeave", {
      callback = function()
        os.execute("taskkill /IM uncap.exe /F")
      end,
    })
  end
end
```

This starts uncap.exe whenever nvim starts, and kills it when all nvim instances close.

## References / Resources Used

- TJ DeVries, The Only Video You Need to Get Started with Neovim, https://www.youtube.com/watch?v=m8C0Cq9Uv9o&t=1712s

Most of the plugins have been borrowed from the following two places:
- nvim-lua, https://github.com/nvim-lua/kickstart.nvim/blob/master/init.lua
- tjdevries, https://github.com/tjdevries/config.nvim/blob/master/lua/custom/plugins/

ChatGPT is also a great resource to help build some small things into the config without having to refer to some other resource.
