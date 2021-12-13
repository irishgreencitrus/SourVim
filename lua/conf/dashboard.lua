local setg = vim.g
setg.dashboard_custom_header = {
	'                                                           @@@@                ',
	'                                                                               ',
	'########+-  -*#######+  ###=  *### :*#######*: ###+  :###- ####  ###+   +###*  ',
	'@@@@@@@@@@= @@@@@@@@@@* @@@*  @@@@ #@@@@@@@@@@ @@@%  =@@@+ @@@@ @@@@@= *@@@@@  ',
	'@@@%--*###- @@@@--#@@@* @@@*  @@@@ #@@@=.=@@@@ @@@#  =@@@= @@@@ %@@@@@- #@@@@@%',
	'@@@#        @@@%  *@@@* @@@*  @@@@ #@@@--#@@@@ @@@%  =@@@+ @@@@ %@@@@@@#@@@@@@@',
	'@@@#        @@@%  *@@@* @@@*  @@@@ #@@@@@@@@+: @@@%  =@@@+ @@@@ %@@@@@@@@@@@@@@',
	'%@@@%+:     @@@%  *@@@* @@@*  @@@@ #@@@@@@@@*- @@@%  =@@@+ @@@@ %@@@@@@@@@@@@@@',
	' :=#@@@@#=. @@@%  *@@@* @@@*  @@@@ #@@@=-#@@@@ @@@%  =@@@+ @@@@ %@@@=#@@@*+@@@@',
	'.. :%@@@=   @@@%  *@@@* @@@*  @@@@ #@@@: :@@@@ @@@%  -@@@+ @@@@ %@@@- %@% =@@@@',
	'@@@#.=@@@@= @@@@%=#@@@* @@@@#-%@@@ %@@@- -@@@@ @@@# -#@@@+ @@@@ @@@@= .%: +@@@@',
	'@@@@@@@@@@- *@@@@@@@%+. #@@@@@@@#= -#@@- -@@#= @@@@@@@@@@- @@#= -*@@=   +@@*:  ',
	'@@@@@@@%=.    -#@@*-     .=%@%+:     .+: :=.   @@@@@@@%=.  =.    =:     --     ',
	'@@@@@*:                                        @@@@@*:                         ',
	'@@%=.                                          @@%=.                           ',
	'*:                                             *:                              ',
}
setg.dashboard_custom_section = {
	a = { description = {' Find File'},          command = 'DashboardFindFile'},
	b = { description = {' Change Colourscheme'},command = 'DashboardChangeColorscheme'},
	c = { description = {' Recently Edited'},    command = 'DashboardFindHistory'},
	d = { description = {' Find Word'},          command = 'DashboardFindWord'},
	e = { description = {' Create New'},         command = 'DashboardNewFile'},
}
setg.dashboard_custom_footer = {"SourVim version v1.0.0"}
setg.dashboard_default_executive = "telescope"

