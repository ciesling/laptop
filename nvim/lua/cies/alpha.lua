local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
	return
end

local dashboard = require("alpha.themes.dashboard")
dashboard.section.header.val = {

--[[
 ______   __   ______   ______    
/\  ___\ /\ \ /\  ___\ /\  ___\   
\ \ \____\ \ \\ \  __\ \ \___  \  
 \ \_____\\ \_\\ \_____\\/\_____\ 
  \/_____/ \/_/ \/_____/ \/_____/ 
--]]
}

-- Set other sections to empty
dashboard.section.footer.val = ""
dashboard.section.footer.opts.hl = ""
dashboard.section.header.opts.hl = ""

dashboard.opts.opts.noautocmd = true
alpha.setup(dashboard.opts)
