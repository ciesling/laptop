--[[

 ______   __   ______   ______    
/\  ___\ /\ \ /\  ___\ /\  ___\   
\ \ \____\ \ \\ \  __\ \ \___  \  
 \ \_____\\ \_\\ \_____\\/\_____\ 
  \/_____/ \/_/ \/_____/ \/_____/ 

  --]]
require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})
