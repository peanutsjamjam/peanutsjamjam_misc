
alias ls ls -FG
alias la ls -a
alias j  jobs
alias h  history
alias vi /usr/local/bin/vim
alias view /usr/local/bin/vim -R

setenv PAGER /usr/local/bin/lv
setenv EDITOR /usr/local/bin/vim
setenv POSTGRES_HOME /usr/local/Cellar/postgresql@11/11.7_1
setenv PGDATA /usr/local/var/postgresql@11

if ($?prompt) then
	# An interactive shell -- set some stuff up
	#set prompt="[ `pwd`@`hostname -s`(`whoami`) \! ] > "   # *5
	#alias precmd 'set prompt="[%n`~/programs/c/gitbranch/gitbranch`] > "'
	set prompt="[%m] > "
	set autolist
	set filec
	set ignoreeof
	set history = 1000
	set savehist = 1000
	#set mail = (/var/mail/$USER)
	#setenv  crt     24
endif
