source ./gitcd.plugin.zsh

assert_ok() {
    [[ $1 == $2 ]] || {
        print -P "%B%F{red}Error:"
        print -P "%u%B%F{red}expect %b%f%U$1"
        print -P "%u%B%F{red}got    %b%f%U$2"
        exit 1
    }
}

# 规则来自 https://github.com/repo-utils/giturl/blob/master/test/giturl.test.js
assert_ok $(_giturl2dir 'git://gitlab.com/edp/logger.git') 'gitlab.com/edp/logger'
assert_ok $(_giturl2dir 'git@gitlab.com:edp/logger.git') 'gitlab.com/edp/logger'
assert_ok $(_giturl2dir 'git://github.com/treygriffith/cellar.git') 'github.com/treygriffith/cellar'
assert_ok $(_giturl2dir 'git@gitlab.xxx.com:frontend/arch/xxx.git') 'gitlab.xxx.com/frontend/arch/xxx'
assert_ok $(_giturl2dir 'https://github.com/banchee/tranquil.git') 'github.com/banchee/tranquil'
assert_ok $(_giturl2dir 'https://github.com/banchee/tranquil') 'github.com/banchee/tranquil'
assert_ok $(_giturl2dir 'http://github.com/banchee/tranquil.git') 'github.com/banchee/tranquil'
assert_ok $(_giturl2dir 'git+https://github.com/banchee/tranquil.git') 'github.com/banchee/tranquil'
assert_ok $(_giturl2dir 'github.com/banchee/tranquil.git') 'github.com/banchee/tranquil'
assert_ok $(_giturl2dir 'https://jpillora@github.com/banchee/tranquil.git') 'github.com/banchee/tranquil'
assert_ok $(_giturl2dir 'git@github.com:cnpm/cnpm.git') 'github.com/cnpm/cnpm'
assert_ok $(_giturl2dir 'github.com:cnpm/cnpm.git') 'github.com/cnpm/cnpm'
assert_ok $(_giturl2dir 'git@github.com:cnpm/cnpm') 'github.com/cnpm/cnpm'
assert_ok $(_giturl2dir 'git@gitcafe.com:fengmk2/cnpm.git') 'gitcafe.com/fengmk2/cnpm'
assert_ok $(_giturl2dir 'git@gist.github.com:3135914.git') 'gist.github.com/3135914'

print -P "%B%F{green}All Pass!"
