gitcd() {
  basedir="$HOME/Code"
  # 如果存在全局的 GITCD_HOME，就用它
  [[ -n $GITCD_HOME ]] && {
    basedir=$GITCD_HOME
  }

  # 用户传入的参数
  url=$1

  # 忘记输入参数，就跳出
  if [[ $url == "" ]] {
    # 显示红色加粗
    print -P '%B%F{red}Please input your repo url.'
    return
  }

  # 通过 git url 计算出路径来
  dir=$(_giturl2dir $url)
  target=$basedir/$dir

  # 如果文件夹已经存在，那直接 cd 过去就好了
  [[ -d $target ]] && {
    # 显示绿色加粗
    print -P "%B%F{green}$target already exists."
    cd $target
    return
  }

  git clone $url $target && cd $target
  # 显示绿色加粗
  print -P "%B%F{green}Done. Have a great day!"
}

_giturl2dir() {
  # 规则参考了 https://github.com/repo-utils/giturl/blob/master/lib/giturl.js

  url=$1
  # 删掉 @ 和之前的内容，即 `git@`` || `https://jpillora@` => ""
  url=${url#*@} # 删除左端匹配到的内容，最小匹配
  # 删掉协议头，即 `git://` || `git+https://` => ""
  url=${url#*://}
  # 删掉末尾的 .git，即 .git => ""
  url=${url%.git*}
  # 替换掉第一个冒号，即 github.com:foo/bar => github.com/foo/bar
  url=${url/:/\/}

  # 用 echo 返回给调用方，而不是用 return
  echo $url
}
