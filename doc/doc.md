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

If you are an avid user of Neovim, this section can be skipped as the majority of the `init.lua` file, is heavily commented and it's self-explanatory, however, if you are somewhat new to Neovim, I want to point out a few key lines of code to make your experience a lot smoother.

### Leader Key

The leader key is a special key that you can set as a prefix for creating custom shortcuts. This key is set in:

```Lua
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
```

By default, this key is set to `space`, but you can change it to whatever key you like. Make a note of this key since you will use it for most of the commands in this config.
