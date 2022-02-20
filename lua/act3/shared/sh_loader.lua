ACT3 = ACT3 or {}

ACT3Installed = true

ACT3.NumBulletTypes = 0
ACT3.BulletTable = {}
ACT3.BulletNameTable = {}

ACT3.NumAttachments = 0
ACT3.AttachmentTable = {}
ACT3.AttachmentIDTable = {}

ACT3.NumMagazines = 0
ACT3.MagazineTable = {}

-- this function analyses the minimum amount of bits needed to represent all bullet types with an unsigned int
-- this will help reduce network usage when networking mags
-- important since those things are going to be hella networked

function ACT3_UpdateBitNecessity()
	local bits = 1

	while ((2 ^ bits) - 1) < ACT3.NumBulletTypes do
		bits = bits + 1
	end

	ACT3.NeededBits = bits
end

function ACT3_LoadBullet(bullet)
	local id = ACT3.NumBulletTypes

	if ACT3.BulletNameTable[bullet.Name] then
		id = ACT3.BulletNameTable[bullet.Name]
	else
		ACT3.NumBulletTypes = ACT3.NumBulletTypes + 1
	end

	bullet.id = id
	ACT3.BulletTable[id] = bullet
	ACT3.BulletNameTable[bullet.Name] = id

	if ACT3.GenerateAmmoEntities then
		if !bullet.DoNotRegister then
			local ammoent = {}
			ammoent.Base = "act3_ammopack"
			ammoent.PrintName = bullet.PrintName
			ammoent.Category = "ACT3 - Loose Rounds"
			ammoent.GiveBullets = {}
			ammoent.GiveBullets[bullet.Name] = bullet.GiveCount or 40
			ammoent.Spawnable = true

			scripted_ents.Register( ammoent, "act3_ammo_" .. bullet.Name )
		end
	end
end

function ACT3_LoadAttachment(att)
	att.id = ACT3.NumAttachments
	ACT3.AttachmentIDTable[att.id] = att.Name
	ACT3.AttachmentTable[att.Name] = att
	ACT3.NumAttachments = ACT3.NumAttachments + 1

	if ACT3.GenerateAttEntities then
		if !(att.Free or att.DoNotRegister or att.InvAtt) then
			local attent = {}
			attent.Base = "act3_attachment"
			attent.PrintName = att.PrintName
			attent.Spawnable = true
			attent.Category = "ACT3 - Attachments"
			attent.GiveAttachments = {}
			attent.GiveAttachments[att.Name] = 1

			scripted_ents.Register( attent, "act3_att_" .. att.Name )
		end
	end
end

function ACT3_LoadNade(att)

end

local dnt_types = {
	["int"] = true,
	["melee"] = true
}

function ACT3_LoadMagazineType(mag)
	ACT3.MagazineTable[mag.Name] = mag
	ACT3.NumMagazines = ACT3.NumMagazines + 1

	if ACT3.GenerateMagEntities then
		if !(dnt_types[mag.Type] or mag.DoNotRegister) and mag.Model then
			local magent = {}
			magent.Base = "act3_magazine"
			magent.PrintName = mag.PrintName
			magent.Spawnable = true
			magent.Category = "ACT3 - Magazines"
			magent.DefaultLoad = mag.DefaultLoad
			magent.MagazineTable = {
				Type = mag.Name,
				Rounds = {}
			}

			scripted_ents.Register( magent, "act3_mag_" .. mag.Name )
		end
	end
end

for k, v in pairs(file.Find("act3/shared/bullet/*", "LUA")) do
	include("act3/shared/bullet/" .. v)
	AddCSLuaFile("act3/shared/bullet/" .. v)
end

ACT3_UpdateBitNecessity()

for k, v in pairs(file.Find("act3/shared/attachments/*", "LUA")) do
	include("act3/shared/attachments/" .. v)
	AddCSLuaFile("act3/shared/attachments/" .. v)
end

for k, v in pairs(file.Find("act3/shared/magazines/*", "LUA")) do
	include("act3/shared/magazines/" .. v)
	AddCSLuaFile("act3/shared/magazines/" .. v)
end

for k, v in pairs(file.Find("act3/shared/nades/*", "LUA")) do
	include("act3/shared/nades/" .. v)
	AddCSLuaFile("act3/shared/nades/" .. v)
end

if CLIENT then
	spawnmenu.AddCreationTab( "#spawnmenu.category.entities", function()

		local ctrl = vgui.Create( "SpawnmenuContentPanel" )
		ctrl:EnableSearch( "entities", "PopulateEntities" )
		ctrl:CallPopulateHook( "PopulateEntities" )

		return ctrl

	end, "icon16/bricks.png", 20 )
end