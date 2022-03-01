local installed, Variable = pcall(require, "utils.variable")
if not installed then return end

Variable.g({
	loaded_matchparen = 1,
	mapleader = ',',
})

Variable.g({
	vim_be_good_log_file = 1,
	vim_apm_lig = 1,
	python3_host_prog = tostring(os.getenv("HOME")) .. '/.pyenv/shims/python',
	-- python3_host_prog = tostring('/bin/python3'),
})
