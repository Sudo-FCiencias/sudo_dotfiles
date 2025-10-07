return {
	-- -- -- -- -- -- -- -- -- -- -- -- 
	-- Autocomplete pairs: () "" {}
	{ "jiangmiao/auto-pairs" },
	-- Remember, use Alt + n in normal mode to scape from the ()""[]{}

	-- -- -- -- -- -- -- -- -- -- -- -- 
	-- Add symbols surround a text
	{ "tpope/vim-surround" },
	--[[ Examples
	V-LINE
	S"		Set the selected box in "
	NORMAL
	ysiw"	Set the word in "
	ds"		Remove all the "
	cs'"	Change the ' for "
	]]

	-- -- -- -- -- -- -- -- -- -- -- -- 
	-- Autocoment
	{ "tpope/vim-commentary" },
	--[[
	gcc		comment line
	gcap	comment all pharaph
	--]]

	-- -- -- -- -- -- -- -- -- -- -- -- 
	-- UNDO TREE
	{ "mbbill/undotree" }
	-- :Undotree Toggle
}
