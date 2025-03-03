gitcd() {
    basedir="$HOME/Code"
    # If global GITCD_HOME exists, use it
    [[ -n $GITCD_HOME ]] && {
        basedir=$GITCD_HOME
    }

    # User input parameter
    url=$1

    # If no parameter is provided, exit
    [[ $url == "" ]] && {
        # Display in red and bold
        print -P "%B%F{red}[gitcd] Please input your repo url."
        return
    }

    # Calculate the directory path from the git URL
    dir=$(_giturl2dir $url)
    target=$basedir/$dir

    # If the directory already exists, just cd into it
    [[ -d $target ]] && {
        # Display in green and bold
        print -P "%B[gitcd] $target %F{green}already exists."
        cd $target
        return
    }

    if ! git clone $url $target; then
        print -P "%B%F{red}[gitcd] Failed to clone the repository. Please check your URL and try again."
        return
    fi
    cd $target
    # Display in green and bold
    print -P "%B%F{green}[gitcd] Done. Have a great day!"
}

_giturl2dir() {
    # Rules referenced from https://github.com/repo-utils/giturl/blob/master/lib/giturl.js

    url=$1
    # Remove `@` and everything before it, e.g., `git@` || `https://jpillora@` => ""
    url=${url#*@} # Remove left-matched content, minimal match
    # Remove protocol header, e.g., `git://` || `git+https://` => ""
    url=${url#*://}
    # Remove `.git` at the end, e.g., .git => ""
    url=${url%.git*}
    # Replace the first colon with a slash, e.g., github.com:foo/bar => github.com/foo/bar
    url=${url/:/\/}

    [[ -n $GITCD_USEHOST ]] && [[ "${GITCD_USEHOST:l}" == "false" ]] && {
        # echo $url
        url=$(echo $url | cut -d "/" -f 2-)
    }

    # Return to the caller using echo instead of return
    echo $url
}