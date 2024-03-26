local os = {}

function os.getName()
	local osname
	-- ask LuaJIT first
	if jit then
		return jit.os
	end

	-- Unix, Linux variants
	local fh, err = assert(io.popen("uname -o 2>/dev/null", "r"))
	if fh then
		osname = fh:read()
	end

	return osname or "Windows"
end

function os.isWindows()
	return os.getName() == "Windows"
end

function os.isLinux()
	return os.getName() == "GNU/Linux"
end

function os.isMac()
	return os.getName() == "Mac OS X"
end

function os.getGlobalNodeModulesPath()
	if os.isWindows() then
		return "C:/Program Files/nodejs/node_modules/"
	elseif os.isLinux() then
		return "/usr/lib/node_modules/"
	elseif os.isMac() then
		return "/opt/homebrew/lib/node_modules/"
	end
end

return os
