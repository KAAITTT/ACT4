local nade = {}

nade.Name = "nade_frag"
nade.PrintName = "FRAG"
nade.InternalWeapon = "act3_nade_frag" -- Internal Weapon ammo type this nade uses
nade.SpinVector = Vector(1, 1, 1)

nade.ProjectileEntity = "act3_thrown_frag"
nade.ProjectileForce = 2000 -- Force the entity is thrown at
nade.ProjectileAngles = Vector(0, 0, 0)

ACT3_LoadNade(nade)