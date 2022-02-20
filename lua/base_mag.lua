-- List of all usable properties for a magazine.

local mag = {} -- just initializing the table.

mag.Name = "" -- mag short name. Should be the same as the file name, but doesn't have to be.
mag.PrintName = "" -- mag pretty name. This is what shows up in menus, etc.

mag.Type = "" -- type of the mag, determines what guns it can go in
mag.MagSize = 30 -- do I really need to explain this one
mag.Disposable = false -- a disposable mag will not drop if it's been completely used up, and cannot be reloaded. Perfect for e.g. RPG rocket
mag.Model = "" -- path to magazine model, or nil
mag.Slots = 1 -- inventory slots the mag takes
mag.Calibre = "45acp" -- type of bullets the mag takes
mag.DefaultLoad = "45acp_fmj"
mag.TubeMag = false -- whether or not this magazine is a tube magazine, like for shotguns. Allows e.g. minishells to take less space in it.

mag.Skin = 0 -- which skin of the mag to use
mag.FullBodygroups = {[1] = 3} -- these will set bodygroups of the magazine model if it's full, partially full, or empty.
mag.PartialBodygroups = {[1] = 2} -- these are tables so you can have multiple ones if you want
mag.EmptyBodygroups = {[1] = 1, [2] = 2, [3] = 0}

mag.AttachFunc = function(wep) end -- this should be pretty obvious as to what it does.
mag.DetachFunc = function(wep) end -- won't be necessarily reliable with internal mags.
-- attach/detach func triggers every reload, even if it's the same reload

ACT3_LoadMagazineType(mag)