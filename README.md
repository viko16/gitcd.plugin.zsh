# gitcd.plugin.zsh
👷 cd dir after git clone if not exist

## Installation

1. git clone this project. And `mkdir -p ~/.oh-my-zsh/custom/plugins/gitcd` if directory not exist.
2. run `link ./gitcd.plugin.zsh ~/.oh-my-zsh/custom/plugins/gitcd/gitcd.plugin.zsh`. Or `cp` if you want.
3. add `gitcd` to your oh-my-zsh configuration, "plugins" section.
4. run `source ~/.zshrc` to enable it.

```sh
# ~/.zshrc`
plugins=(git gitcd)
```

## Usage

```sh
$ gitcd <repo-url>
```

Example:

```sh
$ gitcd https://github.com/viko16/gitcd.plugin.zsh.git
# => will git clone and cd to "~/Code/github.com/viko16/gitcd.plugin.zsh"
```

If the repository is already cloned to local, it will automatically "cd" there.

## Config

By default, `gitcd` will git clone under `~/Code/<host>/<path>`.
If you want to change it, just set Environmental Variable name `GITCD_HOME`.

Example:
```sh
$ GITCD_HOME=~/myworkspace/ && gitcd https://github.com/facebook/react
# => ~/myworkspace/github.com/facebook/react
```

## Thanks
- https://github.com/goreliu/zshguide
- https://github.com/repo-utils/giturl
- https://github.com/robbyrussell/oh-my-zsh/wiki/Customization

## License

[MIT License](https://opensource.org/licenses/MIT) © [viko16](https://github.com/viko16)

