
alias ls ls -FG
alias la ls -a
alias j  jobs

setenv PAGER /usr/local/bin/lv
setenv EDITOR vim

if ($?prompt) then
	# An interactive shell -- set some stuff up
	#set prompt="[ `pwd`@`hostname -s`(`whoami`) \! ] > "   # *5
	set prompt="[%m] > "
	set autolist
	set filec
	set history = 100
	#set savehist = 100
	#set mail = (/var/mail/$USER)
	#setenv  crt     24
endif
