

local function LoadHotFixFile()
	if  package.loaded['Hotfix_Instance'] then
		package.loaded['Hotfix_Instance'] = nil
	end
	if  package.loaded['Hotfix_Instance_2'] then
		package.loaded['Hotfix_Instance_2'] = nil
	end
	require('Hotfix_Instance')
	require('Hotfix_Instance_2')
end



LoadHotFixFile()