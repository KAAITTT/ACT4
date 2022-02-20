SWEP.SavesData = {}

function SWEP:GetSavesDir(base)
    if self.SaveBase then
        return "act3saves/" .. self.SaveBase
    end
    base = base or self:GetClass()
    local weapon = weapons.GetStored(base)

    if string.find(weapon.Base, "base") then
        return "act3saves/" .. base -- if the weapon we're examining is derived from a "base" then it's *probably* the base
        -- I can only imagine this failing in *extremely* rare cases where a gun is called "base" but in these cases, just set SWEP.SaveBase
    else
        return self:GetSavesDir(weapon.Base)
    end
end

function SWEP:LoadSaveData(filename)
    local preset = {
        Name = "",
        Filename = filename,
        Attachments = {}
    }

    if !file.Exists(filename, "DATA") then return nil end

    local f = file.Open(filename, "r", "DATA")

    preset.Name = f:ReadLine()

    local rs = true
    local slot
    local i = string.Trim(f:ReadLine())
    while i do
        i = string.Trim(i, "\n")
        i = string.Trim(i, "\n")
        if rs then
            slot = i
        else
            table.insert(preset.Attachments, {Slot = slot, Att = i})
        end

        rs = !rs

        i = f:ReadLine()
    end

    f:Close()

    return preset
end

function SWEP:DeleteSave(name)
    file.Delete(name)
    self:UpdateSaves()
end

function SWEP:Save()
    file.CreateDir(self:GetSavesDir())

    local atts = {}

    for i, k in pairs(self.Attachments) do
        if k.Installed then
            table.insert(atts, {Order = k.InstalledOrder, Att = k.Installed, Slot = i})
        end
    end

    table.SortByMember(atts, "Order", true)

    local name = tostring(os.time()) .. string.lower(self.PrintName) .. ".dat"

    file.Write(self:GetSavesDir() .. "/" .. name, self.PrintName .. "\n")

    for i, k in pairs(atts) do
        file.Append(self:GetSavesDir() .. "/" .. name, k.Slot .. "\n")
        file.Append(self:GetSavesDir() .. "/" .. name, k.Att .. "\n")
    end

    self:UpdateSaves()
end

function SWEP:UpdateSaves()
    local presettable = {}

    for i, k in pairs(file.Find(self:GetSavesDir() .. "/*", "DATA")) do
        table.insert(presettable, self:LoadSaveData(self:GetSavesDir() .. "/" .. k))
    end

    self.SavesData = presettable
end

function SWEP:Load(preset)
    self.PrintName = preset.Name

    for i, k in pairs(self.Attachments) do
        self:RequestDetach(i)
    end

    for _ = 1, 3 do
        for _, k in pairs(preset.Attachments) do
            self:RequestAttach(k.Slot, k.Att)
        end
    end

    self:UpdateSaves()
end