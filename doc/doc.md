# Customizing your install

## Wezterm

I've chosen [Wezterm](https://wezfurlong.org/wezterm/index.html) for the examples as it is my personal choice, it's cross-platform, it supports true colors, [multiplexing](https://wezfurlong.org/wezterm/multiplexing.html), it's written in Rust and the configuration is a single Lua file, much like Neovim.

The config is the `.wezterm.lua` file, and it's [recommended](https://wezfurlong.org/wezterm/config/files.html#quick-start) to be placed in your HOME directory. `cd` into `$HOME/` (or `%HOME%/` if you are on Windows) and place it there.

While I commented most lines, there are some explanations that can be of use:

### Fonts

To specify the font you want to use in the terminal and by extention Neovim, you use:

```Lua
config.font = wezterm.font({
	family = "MesloLGS NF", -- Set you font here
	weight = "Medium",
	harfbuzz_features = { "calt", "liga", "dlig", "ss01", "ss02", "ss03", "ss04", "ss05", "ss06", "ss07", "ss08" },
})
```

I recommend a [Nerd Font](https://www.nerdfonts.com/) since PowerLevel10k and some Neovim plugins use it to display icons. However, if you like a particular font that does not come with them, you can still use it and set a [fallback](https://wezfurlong.org/wezterm/config/lua/wezterm/font_with_fallback.html) font whenever an icon is required. You can to this by using:

```Lua
config.font = wezterm.font_with_fallback ({
    {
      family = 'JetBrains Mono',
      harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' },
    },
    { family = 'Terminus', weight = 'Bold' },
    'Noto Color Emoji',
  })
```

In the example you set JetBrains Mono as a primary font, and Terminus for any glyph that JetBrains does not have.

### Themes and colors

You can choose from a variety of [themes](https://wezfurlong.org/wezterm/colorschemes/index.html) for your terminal and set them in:

```Lua
-- Setting up the theme and customizing the background color.
config.color_scheme = "catppuccin-macchiato"
config.color_schemes = {
	["catppuccin-macchiato"] = {
		background = "#20200d",
	},
}
```

In this example I'm using [Catppuccin](https://github.com/catppuccin/wezterm) with a custom background color.

You can enable transparency and blur (on macOS) with:

```Lua
-- Enabling window transparency and blur on macOS.
config.window_background_opacity = 0.3
config.macos_window_background_blur = 100
```

> [!NOTE]
> By default, Neovim will use the colors from the theme set in the terminal configuration. You can individually tell Neovim to use the same (or another) theme via the `colorscheme.lua` file in the `/lua/custom/plugins` folder.

## Setting up Neovim

If you are an avid user of Neovim, this section can be skipped as the majority of the `init.lua` file, is heavily commented, and it's self-explanatory, however, if you are somewhat new to Neovim, I want to point out a few key lines of code to make your experience a lot smoother.

### Leader Key

The leader key is a special key that you can set as a prefix for creating custom shortcuts. This key is set in:

```Lua
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
```

By default, this key is set to `space`, but you can change it to whatever key you like. Make a note of this key since you will use it for most of the commands in this config.

### Language servers and highlighting.

#### Tresitter

This config includes [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter) for syntax highlighting and works in tandem with [lsp-config](https://github.com/neovim/nvim-lspconfig) for rich auto-completion and suggestions. By default, treesitter will install the language if not detected; additionally you can specify what languages you want in the `init.lua` file:

```Lua
opts = {
      ensure_installed = {
        'bash',
        'c',
        'diff',
        'html',
        'lua',
        'luadoc',
        'markdown',
        'markdown_inline',
        'query',
        'vim',
        'vimdoc',
        'gdscript',
        'godot_resource',
        'gdshader',
        'rust',
      },
```

#### Mason

Mason is your point of entry for installing language servers for the LSP. You can open Mason by using the command `:Mason`.

> [!WARNING]
> Is important to note, that some language servers will require the dependencies of the language you try to install, for instance, if you want to install the Node LSP, you will need to install `npm`.
> If you have trouble installing a language, you can run `:checkhealth` to see what dependencies are giving you trouble.

### Plugins

I made this config as modular and simple to understand as possible. Most plugins are self-contained in a single Lua file in the `/lua/custom/plugins` folder.

You can install new plugins by creating a `.lua` file inside this folder following the next template:

```Lua
return{
	'guthubuser/pluginrepo.nvim',
	opts = {
	},
}
```

> [!NOTE]
> To properly configure each plugin, make sure to read its documentation. While you only need to specify the short Github url, the `opts` block will let you configure additional functionality for your plugin.

Once you save the `.lua` file, restart Neovim and Lazy will run the installation. If you want to manage, update, or uninstall your plugins, you can use the command `:Lazy` to open the manager.

### Themes

You can further customize Neovim by applying a color theme. In this config I've chosen [Catppuccin](https://github.com/catppuccin/nvim) and while I made some tweaking easy, feel free to change it to whatever you like. You can find the `colorscheme.lua` in the plugin's folder.

> [!NOTE]
> If you have enabled background transparency in your terminal, set `transparent_background` to `true`.

Catppuccin has a couple variations or "flavours", you can set them in:

```Lua
config = function()
    require('catppuccin').setup {
      flavour = 'mocha', -- latte, frappe, macchiato, mocha
      background = { -- :h background
        light = 'latte',
        dark = 'mocha',
      },
```

Fortunately, the catppuccin documentation is very easy to follow, and they provide the [style-guide](https://github.com/catppuccin/catppuccin/blob/main/docs/style-guide.md) to modify the colors, you can do this in the `color_overrides` section:

```Lua
...
color_overrides = {
        mocha = {
          text = '#F4CDE9',
          subtext1 = '#DEBAD4',
          subtext0 = '#C8A6BE',
          overlay2 = '#B293A8',
          overlay1 = '#9C7F92',
          overlay0 = '#866C7D',
          surface2 = '#705867',
          surface1 = '#5A4551',
          surface0 = '#44313B',

          lavender = '#FFCBBC',
          base = '#FFFFFF',
          mantle = '#211924',
          crust = '#1a1016',
        },
...
```

Finally, the cherry on top (at least for me): You can specify a "highlight" color for the current line number. This is done in the following lines:

```lua
vim.api.nvim_set_hl(0, 'LineNrAbove', { fg = 'grey' })
vim.api.nvim_set_hl(0, 'LineNr', { fg = 'pink' })
vim.api.nvim_set_hl(0, 'LineNrBelow', { fg = 'grey' })
```

Where `LineNr` is the color of the current line number.
