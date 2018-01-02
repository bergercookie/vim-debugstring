# vim-debugstring

```
     _      _                     _        _
    | |    | |                   | |      (_)
  __| | ___| |__  _   _  __ _ ___| |_ _ __ _ _ __   __ _
 / _` |/ _ \ '_ \| | | |/ _` / __| __| '__| | '_ \ / _` |
| (_| |  __/ |_) | |_| | (_| \__ \ |_| |  | | | | | (_| |
 \__,_|\___|_.__/ \__,_|\__, |___/\__|_|  |_|_| |_|\__, |
                         __/ |                      __/ |
                        |___/                      |___/

```

## Purpose

debugstring aims to automate standard debugging operations (e.g., segfaults).
It does that by facilitating the ubiquitous `printf()-debugging` i.e., scatter
logging statements around the various code snippets that you want to test.

The form and syntax of the logging statements target the language at hand
(e.g., use `printf()` in C/C++ but `puts()` in Ruby)

![demo_gif](https://github.com/bergercookie/vim-debugstring/blob/master/misc/demo.gif)

For a more detailed outline of `debugstring` check
[doc/debugstring.txt](https://github.com/bergercookie/vim-debugstring/blob/master/doc/debugstring.txt)

## Usage

Use the mapping of your choice to place unique logging directives during
debugging times.

```vim
nnoremap <your-key-combination> <Plug>DumpDebugString
```

Default mapping is: `<Leader>ds`

## Installation

### Using a runtimepath/package manager

I would personally recommend using [Pathogen](https://github.com/tpope/vim-pathogen/) for
installing the plugin but any other installation method (e.g.,
[Vundle](https://github.com/VundleVim/Vundle.vim)) should do the job (if not
please raise an
[issue](https://github.com/bergercookie/vim-debugstring/issues) on Github)

```bash
git clone https://github.com/bergercookie/vim-debustring.git ~/.vim/bundle/vim-debugstring
```

### Manual installation

Copy the plugin files to their corresponding directories under `${HOME}/.vim`
(Linux) or `$HOME/vimfiles` (Windows).

## Contributing

In case you want to contribute on a certain feature/fix, don't hesitate to
discuss about it in the Github issues or to implement it and make a PR.

## License

Current plugin is distributed under the same terms as Vim itself. See the
[LICENSE](https://github.com/bergercookie/vim-debugstring/blob/master/LICENSE)
file

## Self Promotion

In case you like the plugin, you might as well [star it on
Github](https://github.com/bergercookie/vim-debugstring) or [rate it on
vim.org](https://vim.sourceforge.io/scripts/script.php?script_id=5634)

## TODO

- [ ] Method to delete all the debugging strings in all "touched" buffers
- [ ] Method to delete all the debugging strings in current buffer
- [ ] Method to print a name of a variable easily


