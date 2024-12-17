![Electron Neovim](https://github.com/user-attachments/assets/92cd5bc9-fdea-44a8-978f-971bb1f400b0)

# Introduction

Electron is my Neovim configuration for Linux, macOS and Windows based on ['kickstart'](https://github.com/nvim-lua/kickstart.nvim). The main motivation for creating yet-another-nvim-config, is to alleviate some of the hassles I faced trying to configure neovim for two specific purposes : Game Development in Godot and Embedded Technologies/Microcontrollers.

While I'll try to document this config as throughly as I can, I suggest looking at the kickstart docummentation to modify and customize Neovim to your liking, however, I left some comments from kickstart and added some from my own on top to make this config a lot more compact.

# Features

- Plugin management using [Lazy.nvim](https://github.com/LazyVim/LazyVim).
- Custom greeter screen via [Alpha.nvim](https://github.com/goolord/alpha-nvim).
- Powerful and fast pair insertion tool via [Autopairs.nvim](https://github.com/windwp/nvim-autopairs).
- [Telescope](https://github.com/nvim-telescope/telescope.nvim) fuzzy finder.
- Syntax Highlight and parsing via [treesitter](https://github.com/nvim-telescope/telescope.nvim).
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

The [terminal emulator](https://en.wikipedia.org/wiki/Terminal_emulator) we choose is a big part of the appearance and features of Neovim. Most of the themes and plugins included in this config, take advantage of terminal emulator that use true colors. For a list of terminal emulators that support true colors, please see [here](https://github.com/termstandard/colors?tab=readme-ov-file#terminal-emulators).

Since I work mostly on macOS, I can recommend checking out [kitty](https://sw.kovidgoyal.net/kitty/), [iTerm2](https://iterm2.com/), [Alacritty](https://alacritty.org/) or my personal favorite and choice [wezterm](https://wezfurlong.org/wezterm/index.html). Wezterm uses Lua for its config file that I will also include in this repo.

To make the terminal a lot prettier, I recommend installing [Oh My Zsh](https://ohmyz.sh/). There are a lot of [themes](https://github.com/ohmyzsh/ohmyzsh/wiki/Themes) to choose from, but the examples I'll provide in this README will showcase [Powerlevel10k](https://github.com/romkatv/powerlevel10k).

#### Installing Neovim

This config and the plugins I use, will require the latest stable version of Neovim, please check the official installation section [here](https://github.com/neovim/neovim?tab=readme-ov-file#install-from-package).

#### Install External Dependencies

External Requirements:

- Basic utils: `git`, `make`, `unzip`, C Compiler (`gcc`)
- [ripgrep](https://github.com/BurntSushi/ripgrep#installation)
- A [Nerd Font](https://www.nerdfonts.com/): optional, provides various icons
  - if you have it set `vim.g.have_nerd_font` in `init.lua` to true
- Language Setup:
  - If you want to write Typescript, you need `npm`
  - If you want to write Golang, you will need `go`
  - etc.

### Install Electron

Neovim's configurations are located under the following paths, depending on your OS:

| OS                   | PATH                                      |
| :------------------- | :---------------------------------------- |
| Linux, MacOS         | `$XDG_CONFIG_HOME/nvim`, `~/.config/nvim` |
| Windows (cmd)        | `%localappdata%\nvim\`                    |
| Windows (powershell) | `$env:LOCALAPPDATA\nvim\`                 |

#### Clone Electron

> **NOTE**
> If following the recommended step above (i.e., forking the repo), replace
> `nvim-lua` with `<your_github_username>` in the commands below

<details><summary> Linux and Mac </summary>

```sh
git clone https://github.com/Alejandro-Mironov/Electron.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim
```

</details>

<details><summary> Windows </summary>

If you're using `cmd.exe`:

```
git clone https://github.com/Alejandro-Mironov/Electron.git "%localappdata%\nvim"
```

If you're using `powershell.exe`

```
git clone https://github.com/Alejandro-Mironov/Electron.git "${env:LOCALAPPDATA}\nvim"
```

</details>

### Post Installation

Start Neovim

```sh
nvim
```

That's it! Lazy will install all the plugins you have. Use `:Lazy` to view
current plugin status. Hit `q` to close the window.

Read through the `init.lua` file in your configuration folder for more
information about extending and exploring Neovim. That also includes
examples of adding popularly requested plugins.

### Getting Started

[The Only Video You Need to Get Started with Neovim](https://youtu.be/m8C0Cq9Uv9o)

#### Windows Installation

<details><summary>Windows with Microsoft C++ Build Tools and CMake</summary>
Installation may require installing build tools and updating the run command for `telescope-fzf-native`

See `telescope-fzf-native` documentation for [more details](https://github.com/nvim-telescope/telescope-fzf-native.nvim#installation)

This requires:

- Install CMake and the Microsoft C++ Build Tools on Windows

```lua
{'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
```

</details>
<details><summary>Windows with gcc/make using chocolatey</summary>
Alternatively, one can install gcc and make which don't require changing the config,
the easiest way is to use choco:

1. install [chocolatey](https://chocolatey.org/install)
   either follow the instructions on the page or use winget,
   run in cmd as **admin**:

```
winget install --accept-source-agreements chocolatey.chocolatey
```

2. install all requirements using choco, exit previous cmd and
   open a new one so that choco path is set, and run in cmd as **admin**:

```
choco install -y neovim git ripgrep wget fd unzip gzip mingw make
```

</details>
<details><summary>WSL (Windows Subsystem for Linux)</summary>

```
wsl --install
wsl
sudo add-apt-repository ppa:neovim-ppa/unstable -y
sudo apt update
sudo apt install make gcc ripgrep unzip git xclip neovim
```

</details>

#### Linux Install

<details><summary>Ubuntu Install Steps</summary>

```
sudo add-apt-repository ppa:neovim-ppa/unstable -y
sudo apt update
sudo apt install make gcc ripgrep unzip git xclip neovim
```

</details>
<details><summary>Debian Install Steps</summary>

```
sudo apt update
sudo apt install make gcc ripgrep unzip git xclip curl

# Now we install nvim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
sudo rm -rf /opt/nvim-linux64
sudo mkdir -p /opt/nvim-linux64
sudo chmod a+rX /opt/nvim-linux64
sudo tar -C /opt -xzf nvim-linux64.tar.gz

# make it available in /usr/local/bin, distro installs to /usr/bin
sudo ln -sf /opt/nvim-linux64/bin/nvim /usr/local/bin/
```

</details>
<details><summary>Fedora Install Steps</summary>

```
sudo dnf install -y gcc make git ripgrep fd-find unzip neovim
```

</details>

<details><summary>Arch Install Steps</summary>

```
sudo pacman -S --noconfirm --needed gcc make git ripgrep fd unzip neovim
```

</details>
