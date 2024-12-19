![GitHub License](https://img.shields.io/github/license/Alejandro-Mironov/Nioxis?style=for-the-badge) ![macOS Badge](https://img.shields.io/badge/macOS-black?style=for-the-badge&logo=apple&logoSize=auto) ![Windows Badge](https://img.shields.io/badge/Windows-blue?style=for-the-badge&logoSize=auto) ![Linux Badge](https://img.shields.io/badge/Linux-pink?style=for-the-badge&logo=archlinux&logoSize=auto)

![Nioxis Logo](https://github.com/user-attachments/assets/531e88bb-b7f5-454a-862a-1ec98f2f89a0)

# Introduction

Nioxis is my Neovim configuration for Linux, macOS and Windows based on ['kickstart'](https://github.com/nvim-lua/kickstart.nvim). The main motivation for creating yet-another-nvim-config, is to alleviate some of the hassles I faced trying to configure Neovim for two specific purposes : Game Development in Godot and Embedded Technologies/Microcontrollers.

The heart of this config is the `init.lua` file in the root directory. Since this a heavily modified version of kickstart, I intentionally left some of the comments already there and added some of my own to further refine this particular repo, however, I strongly suggest using the `:help` command.

# Features

- Plugin management using [Lazy.nvim](https://github.com/LazyVim/LazyVim).
- Custom greeter screen via [Alpha.nvim](https://github.com/goolord/alpha-nvim).
- Powerful and fast pair insertion tool via [Autopairs.nvim](https://github.com/windwp/nvim-autopairs).
- File search via fuzy finder [Telescope](https://github.com/nvim-telescope/telescope.nvim).
- Syntax Highlight and parsing via [treesitter](https://github.com/nvim-treesitter/nvim-treesitter).
- Modern buffer line with tabpage integration via [bufferline.nvim](https://github.com/akinsho/bufferline.nvim).
- Custom theme based on [Catppuccin](https://github.com/catppuccin/nvim), with easy-to-modify custom colors.
- Fast commenting plugin with treesitter integration via [comment.nvim](https://github.com/numToStr/Comment.nvim).
- Better formatting via [conform.nvim](https://github.com/stevearc/conform.nvim).
- Improved UI Neovim interfaces via [dressing.nvim](https://github.com/stevearc/dressing.nvim).
- Indentation guides via [Indent Blankline](https://github.com/lukas-reineke/indent-blankline.nvim).
- Git integration via [Lazygit](https://github.com/kdheepak/lazygit.nvim).
- Love2D run, stop and LSP integration via [love2d.nvim](https://github.com/kdheepak/lazygit.nvim).
- Language Server Protocol support via [lsp-config](https://github.com/neovim/nvim-lspconfig).
- LSP, linter and formatters management via [Mason](https://github.com/williamboman/mason.nvim).
- Beautiful and modern status line via [lualine](https://github.com/nvim-lualine/lualine.nvim).
- Auto-completion engine via [nvim-cmp](https://github.com/hrsh7th/nvim-cmp).
- Debugging capabilities via [nvim-dap](https://github.com/mfussenegger/nvim-dap).
- File explorer integration via [nvim-tree](https://github.com/nvim-tree/nvim-tree.lua).
- PlatformIO integration for embedded applications via [nvim-platformio](https://github.com/anurag3301/nvim-platformio.lua).
- Godot and GDScript integration via [vim-godot](https://github.com/habamax/vim-godot).
- LaTeX integration via [vimtex](https://github.com/lervag/vimtex).
- Neovim commands completion via [wilder.nvim](https://github.com/gelguy/wilder.nvim).
- ...and more.

# Installation

## Pre-requisites

### Terminal emulators

The [terminal emulator](https://en.wikipedia.org/wiki/Terminal_emulator) we choose is a big part of the appearance and features of Neovim. Most of the themes and plugins included in this config, take advantage of terminal emulators that use true colors. For a list of terminal emulators that support true colors, please see [here](https://github.com/termstandard/colors?tab=readme-ov-file#terminal-emulators).

Since I work mostly on macOS, I can recommend checking out [kitty](https://sw.kovidgoyal.net/kitty/), [iTerm2](https://iterm2.com/), [Alacritty](https://alacritty.org/) or my favorite and personal choice [wezterm](https://wezfurlong.org/wezterm/index.html). Wezterm uses Lua for its config file that I will also include in this repo.

In order to make the terminal a lot prettier, I recommend installing [Oh My Zsh](https://ohmyz.sh/). There are a lot of [themes](https://github.com/ohmyzsh/ohmyzsh/wiki/Themes) to choose from, but the examples I'll provide in this README will showcase [Powerlevel10k](https://github.com/romkatv/powerlevel10k).

### Installing Neovim

This config and the plugins I use, will require the latest stable version of Neovim, please check the official installation section [here](https://github.com/neovim/neovim?tab=readme-ov-file#install-from-package).

<details><summary>Windows with gcc/make using chocolatey</summary>

The easiest way to install Neovim and its basic dependencies is using choco.

1. Install [chocolatey](https://chocolatey.org/install)
   either follow the instructions on the page or use winget,
   run in cmd as **admin**:

```bash
winget install --accept-source-agreements chocolatey.chocolatey
```

2. Install all requirements using choco, exit previous cmd and
   open a new one so that choco path is set, and run in cmd as **admin**:

```bash
choco install -y neovim git ripgrep wget fd unzip gzip mingw make
```

</details>

<details><summary>macOS</summary>

You can install Neovim on macOS with [Homebrew](https://brew.sh/).

1. Install brew either by downloading the pkg from the main page or using this command on the terminal:

```sh
 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

2. Run the command to install Neovim.

```sh
brew install neovim
```

</details>

<details><summary>Ubuntu</summary>

```sh
sudo add-apt-repository ppa:neovim-ppa/unstable -y
sudo apt update
sudo apt install make gcc ripgrep unzip git xclip neovim
```

</details>

<details><summary>Arch Install Steps</summary>

```sh
sudo pacman -S --noconfirm --needed gcc make git ripgrep fd unzip neovim
```

</details>

### Install External Dependencies

External Requirements:

- If you followed the previous steps chances are, you already have most of this utils: `git`, `make`, `unzip`, C Compiler (`gcc`).
- [ripgrep](https://github.com/BurntSushi/ripgrep#installation)
- A great majority of plugins are written in Python. You can install it through the [official page](https://www.python.org/) or using [Anaconda](https://docs.anaconda.com/anaconda/install/index.html).
- A [Nerd Font](https://www.nerdfonts.com/): optional, provides icons that some plugins use. If you installed Oh My Zsh, it comes by default with MesloLGS.
  - `vim.g.have_nerd_font` in `init.lua` is set to `true` by default, change it to `false` should you don'f feel installing a Nerd Font.
- Language Setup:
  - If you want to write Typescript, you need `npm`
  - If you want to write Golang, you will need `go`
  - etc.

> [!NOTE]
> Whatever method you choose to install any dependency (ej. python, npm, nvim) make sure you add the installation directory to you PATH. You can do this by adding the following line at the end of your `.bash_profile`or `.zshrc` file, usually located in your HOME directory:
>
> ```sh
>  export PATH="/your/dependency/directory/:$PATH"
> ```
>
> This will ensure that your terminal can see it. Most package managers already do this, but is a common gotcha if you are not experienced with the terminal.

## Install Nioxis

Neovim's configurations are located under the following paths, depending on your OS:

| OS                   | PATH                                      |
| :------------------- | :---------------------------------------- |
| Linux, macOS         | `$XDG_CONFIG_HOME/nvim`, `~/.config/nvim` |
| Windows (cmd)        | `%localappdata%\nvim\`                    |
| Windows (powershell) | `$env:LOCALAPPDATA\nvim\`                 |

### Clone Nioxis

#### Linux and Mac

```sh
git clone https://github.com/Alejandro-Mironov/Nioxis.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim
```

#### Windows

If you're using `cmd.exe`:

```bash
git clone https://github.com/Alejandro-Mironov/Nioxis.git "%localappdata%\nvim"
```

If you're using `powershell.exe`

```bash
git clone https://github.com/Alejandro-Mironov/Nioxis.git "${env:LOCALAPPDATA}\nvim"
```

</details>

### Uninstall

You can uninstall this repo using the following commands, you can also use them to delete a previous installation and start clean again:

```sh
# Linux / macOS (unix)
rm -rf ~/.config/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.local/share/nvim

# Flatpak (linux)
rm -rf ~/.var/app/io.neovim.nvim/config/nvim
rm -rf ~/.var/app/io.neovim.nvim/data/nvim
rm -rf ~/.var/app/io.neovim.nvim/.local/state/nvim

# Windows CMD
rd -r ~\AppData\Local\nvim
rd -r ~\AppData\Local\nvim-data

# Windows PowerShell
rm -Force ~\AppData\Local\nvim
rm -Force ~\AppData\Local\nvim-data
```

### Post Installation

Start Neovim

```sh
nvim
```

That's it! Lazy will install all the plugins you have. Use `:Lazy` to view
current plugin status. Hit `q` to close the window.

Please check the [documentation](/doc/doc.md) and ... files to further take advatage of this config, like how to change themes, settings, keybinds and how to link Neovim for embedded development and Godot.
