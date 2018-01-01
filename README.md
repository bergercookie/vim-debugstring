# vim-debugstring

**WARNING:** Current plugin is under heavy development. For the time being it
will probably not work as expected

## Purpose

Purpose of current plugin is to facilitate in standard debugging operations
(e.g., segfaults). It does that by facilitating the ubiquitous `printf ()`
debugging i.e., scatter logging statements around the various code snippets that
you want to test.

## Usage

TODO: Describe what are the standard operations for this plugin - What does it
support?

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

Copy the plugin files into the corresponding directories under `${HOME}/.vim`
(Linux) or `$VIMFILES` (Windows).

## Contributing

In case you want to contribute on a certain feature/fix, don't hesitate to
discuss about it in the Gitihub issues or to implement it and make a PR.

## License

Current plugin is distributed under the same terms as Vim itself. See the
[LICENSE](https://github.com/bergercookie/vim-debugstring/blob/master/LICENSE)
file

