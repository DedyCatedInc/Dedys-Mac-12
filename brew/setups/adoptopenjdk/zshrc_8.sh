alias composer="php /usr/local/bin/composer"

export JAVA_HOME_8=$(/usr/libexec/java_home -v1.8)
export JAVA_HOME=$JAVA_HOME_8

export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"
