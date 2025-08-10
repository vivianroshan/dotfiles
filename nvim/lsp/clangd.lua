function GetQueryDriver()
	local queryDriver = {
		"/opt/homebrew/bin/gcc-14",
		"/opt/homebrew/bin/g++-14",
		"/opt/homebrew/bin/riscv64-unknown-elf-gcc",
		"/opt/homebrew/bin/riscv64-unknown-elf-g++",
	}
	local queryDriverStr = '--query-driver="'
	for i, v in ipairs(queryDriver) do
		queryDriverStr = queryDriverStr .. v
		if i < #queryDriver then
			queryDriverStr = queryDriverStr .. ","
		end
	end
	queryDriverStr = queryDriverStr .. '"'
	return queryDriverStr
end
return {
	cmd = { "clangd", GetQueryDriver() },
}
