
alias h  history 25
alias j  jobs -l
alias la ls -aF
alias lf		ls -FA
alias ll		ls -lAF
alias ls		ls -F
alias lv		lv -Au8
alias vi		vim
alias view		/usr/local/bin/vim -R
alias screen	/usr/local/bin/screen -U
alias o			objdump -d --disassembler-options=intel

setenv EDITOR vim
setenv PAGER 'lv -Au8'

if ($?prompt) then
	# An interactive shell -- set some stuff up
	#set prompt="[ `pwd`@`hostname -s`(`whoami`) \! ] > "   # *5
	set prompt="[%m] > "
	set promptchars = "%#"
	#alias precmd 'set prompt="[%m`~/bin/gitbranch`] > "'

	set filec
	set ignoreeof
	set history = 3000
	set savehist = (3000 merge)
	set autolist = ambiguous
	# Use history to aid expansion
	set autoexpand
	set autorehash
	set mail = (/var/mail/$USER)
	if ( $?tcsh ) then
		bindkey "^W" backward-delete-word
		bindkey -k up history-search-backward
		bindkey -k down history-search-forward
	endif

endif
