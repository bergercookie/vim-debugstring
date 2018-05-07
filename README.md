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
It does that by facilitating the ubiquitous
[printf()-debugging](https://everything2.com/title/printf%28%29%20debugging)
i.e., scatter logging statements around the various code snippets that you want
to test.


### Demos

#### Standard debugging - C++

![demo_gif](https://github.com/bergercookie/vim-debugstring/blob/master/misc/demo_cpp.gif)

#### Debugging for expression/variables - C++

![demo_gif](https://github.com/bergercookie/vim-debugstring/blob/master/misc/demo_cpp_var.gif)

## Features

- The form and syntax of the logging statements target the language at hand
(e.g., use `printf()` in C/C++ but `puts()` in Ruby)

Currently the following languages are supported. First column corresponds to the
standard debugging string while the second to the case of debugging for a
specific variable.

```c++
// Debug String
std::cout << "[a.c:4] DEBUGGING STRING ==> " << 0 << std::endl;

// Debug Variable
std::cout << "[a.c:4] a_variable: " << a_variable << std::endl;
```

Lang       | Debug String       | Debug Variable
---        | ---                | ---
C          | :heavy_check_mark: | :heavy_check_mark:
C++        | :heavy_check_mark: | :heavy_check_mark:
CMake      | :heavy_check_mark: | :heavy_check_mark:
Fortran    | :heavy_check_mark: | :x:
Haskell    | :heavy_check_mark: | :heavy_check_mark:
Java       | :heavy_check_mark: | :heavy_check_mark:
Javascript | :heavy_check_mark: | :x:
PHP        | :heavy_check_mark: | :heavy_check_mark:
Python     | :heavy_check_mark: | :heavy_check_mark:
R          | :heavy_check_mark: | :heavy_check_mark:
Ruby       | :heavy_check_mark: | :x:
Shell      | :heavy_check_mark: | :heavy_check_mark:
Vim        | :heavy_check_mark: | :heavy_check_mark:

- Support for debugging variable expressions e.g., the values of variables or
    arbitrary expressions at certain parts of your code
- Support for [vim-repeat](https://github.com/tpope/vim-repeat). No
    need for repeat the same mapping, or rewrite the lengthy expression that you
    want to monitor, just use the `.` character

For a more detailed outline of `debugstring` check
[doc/debugstring.txt](https://github.com/bergercookie/vim-debugstring/blob/master/doc/debugstring.txt)

## Usage

Use the mappings of your choice to place unique logging directives during
debugging times.

```vim
nnoremap <your-key-combination> <Plug>DumpDebugString
nnoremap <a-second-key-combination> <Plug>DumpDebugStringExpr
```

Default mappings are: `<Leader>ds`, `<Leader>dS` respectively.

### Remarks - Debugging

* Make sure that the filetype plugin is enabled. A line like `filetype plugin on` in
    your `.vimrc` should do the job.


## Installation

### Dependencies

debugstring depends on the following vim plugins:

- vim-repeat [OPTIONAL]

### Using a runtimepath/package manager

I would personally recommend using [Pathogen](https://github.com/tpope/vim-pathogen/) for
installing the plugin but any other installation method (e.g.,
[Vundle](https://github.com/VundleVim/Vundle.vim)) should do the job (if not
please raise an
[issue](https://github.com/bergercookie/vim-debugstring/issues) on Github)

```bash
git clone https://github.com/tpope/vim-repeat ~/.vim/bundle/vim-repeat
git clone https://github.com/bergercookie/vim-debugstring.git ~/.vim/bundle/vim-debugstring

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


## Notes on Development

This mostly comprises a list of stuff I want to keep track of when developing
this or other vim plugins

* Use [vimdoc](https://github.com/google/vimdoc) to generate documentation from
    the `vim` docstring (instead of manually updating the .txt file). See the
    misc/build_doc for more on how this is done.
* Use [vader](https://github.com/junegunn/vader.vim) for unittesting.


## TODO

- [ ] Method to delete all the debugging strings in all "touched" buffers
- [ ] Method to delete all the debugging strings in current buffer
- [x] Method to print name and contents of a variable
- [ ] Add option for variable debugging in rest of langs
- [ ] Make the counter buffer-specific
- [ ] Escape double single quotes vimscript variable printing
- [x] Append to current line if that is empty
- [x] Support repeat.vim
- [ ] Use an assertion module
- [x] Use vader.vim for TDD
- [ ] Extend vader support for rest of languages
- [ ] Use travis for CI
- [x] Bug with changing the filename of the current file
- [x] Make vim-repeat dependency optional
- [x] Turn supported languages into a table - what do we support in which
    language
- [x] Make vim-repeat dependency optional
