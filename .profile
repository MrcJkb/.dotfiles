export _JAVA_OPTIONS="-Dawt.useSystemAAFontSettings=on"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export KALEIDOSCOPE_DIR="$HOME/git/forks/Kaleidoscope"
export KALEIDOSCOPE_LANGUAGES_DIR="$HOME/git/forks/Kaleidoscope-Languages"
# export JAR="${HOME}/git/eclipse.jdt.ls/org.eclipse.jdt.ls.product/target/repository/plugins/org.eclipse.equinox.launcher_*.jar"
# export JDTLS_CONFIG="${HOME}/git/eclipse.jdt.ls/org.eclipse.jdt.ls.product/target/repository/config_linux"
export JAR="/usr/share/java/jdtls/plugins/org.eclipse.equinox.launcher_*.jar"
export JDTLS_CONFIG="/usr/share/java/jdtls/config_linux"
export WORKSPACE="$HOME/workspace"
# export JAVA_HOME="/usr/lib/jvm/liberica-jdk-11-full"
export JAVA_HOME="/usr/lib/jvm/liberica-jdk-full"
export INSTALL4J_JAVA_HOME="$JAVA_HOME"
export GRADLE_HOME="$HOME/.gradle"
export DOTFILES="$HOME/dotfiles"
export DZSHRC="$HOME/dotfiles/.zshrc"
export DVIMRC="$HOME/dotfiles/.vimrc"
export VIMCONFIG="$XDG_CONFIG_HOME/nvim"
export VIMDATA="$HOME/.local/share/nvim"
export OMF_CONFIG="$HOME/.config/omf"
export BAT_THEME="Material-darker"
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/gnupg/S.gpg-agent.ssh"
export BROWSER="brave-browser"
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/sh"
export PATH="$PATH:$HOME/bin"
export PATH="$PATH:$JAVA_HOME/bin"
export TZ="Europe/Berlin"
export RANGER_ZLUA=$(readlink -e $(which z))
