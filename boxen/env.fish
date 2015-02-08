# set +e
# set +u

# boxen root
set BOXEN_HOME /opt/boxen

# path
set PATH $BOXEN_HOME/rbenv/{shims,bin} $BOXEN_HOME/rbenv/plugins/ruby-build/bin $BOXEN_HOME/homebrew/bin $BOXEN_HOME/homebrew/sbin $BOXEN_HOME/bin $PATH

# man
set MANPATH $BOXEN_HOME/homebrew/share/man $MANPTH

# env
for f in "$BOXEN_HOME/env.d/*.sh";
	if test -f $f
		. $f
	end
end

# version
set BOXEN_SETUP_VERSION (set GIT_DIR $BOXEN_HOME/repo/.git git rev-parse --short HEAD)

set BOXEN_NVM_DIR $BOXEN_HOME/nvm
set BOXEN_NVM_DEFAULT_VERSION 'v0.10.1'
