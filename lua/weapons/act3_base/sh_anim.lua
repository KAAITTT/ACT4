
local ActIndex = {
	[ "pistol" ]		= ACT_HL2MP_IDLE_PISTOL,
	[ "smg" ]			= ACT_HL2MP_IDLE_SMG1,
	[ "grenade" ]		= ACT_HL2MP_IDLE_GRENADE,
	[ "ar2" ]			= ACT_HL2MP_IDLE_AR2,
	[ "shotgun" ]		= ACT_HL2MP_IDLE_SHOTGUN,
	[ "rpg" ]			= ACT_HL2MP_IDLE_RPG,
	[ "physgun" ]		= ACT_HL2MP_IDLE_PHYSGUN,
	[ "crossbow" ]		= ACT_HL2MP_IDLE_CROSSBOW,
	[ "melee" ]			= ACT_HL2MP_IDLE_MELEE,
	[ "slam" ]			= ACT_HL2MP_IDLE_SLAM,
	[ "normal" ]		= ACT_HL2MP_IDLE,
	[ "fist" ]			= ACT_HL2MP_IDLE_FIST,
	[ "melee2" ]		= ACT_HL2MP_IDLE_MELEE2,
	[ "passive" ]		= ACT_HL2MP_IDLE_PASSIVE,
	[ "knife" ]			= ACT_HL2MP_IDLE_KNIFE,
	[ "duel" ]			= ACT_HL2MP_IDLE_DUEL,
	[ "camera" ]		= ACT_HL2MP_IDLE_CAMERA,
	[ "magic" ]			= ACT_HL2MP_IDLE_MAGIC,
	[ "revolver" ]		= ACT_HL2MP_IDLE_REVOLVER
}

-- THIS IS ACT3, BABY. AND WE'RE FUCKING INVINCIBLE.
SWEP.SpecialACTTable = {
	[ "passive" ] = {
		[ "base" ] = "passive",
		[ ACT_MP_STAND_IDLE ] = ACT_HL2MP_IDLE_PASSIVE,
		[ ACT_MP_WALK ] = ACT_HL2MP_WALK_PASSIVE,
		[ ACT_MP_RUN ] = ACT_HL2MP_RUN_PASSIVE,
		[ ACT_MP_CROUCH_IDLE ] = "pose_ducking_01",
		[ ACT_MP_CROUCHWALK ] = ACT_HL2MP_WALK_CROUCH_PASSIVE,
		[ ACT_MP_JUMP ] = ACT_HL2MP_JUMP_PASSIVE,
		[ ACT_MP_SWIM ] = ACT_HL2MP_SWIM_PASSIVE
	},
	[ "tight" ] = {
		[ "base" ] = "ar2",
		[ ACT_MP_STAND_IDLE ] = ACT_HL2MP_IDLE_RPG,
		[ ACT_MP_WALK ] = ACT_HL2MP_WALK_RPG,
		[ ACT_MP_RUN ] = ACT_HL2MP_RUN_RPG,
		[ ACT_MP_CROUCH_IDLE ] = ACT_HL2MP_IDLE_CROUCH_SMG1,
		[ ACT_MP_CROUCHWALK ] = ACT_HL2MP_WALK_CROUCH_SMG1,
		[ ACT_MP_JUMP ] = ACT_HL2MP_JUMP_RPG,
		[ ACT_MP_SWIM ] = ACT_HL2MP_SWIM_RPG,
	},
	[ "mp40" ] = {
		[ "base" ] = "smg",
		[ ACT_MP_STAND_IDLE ] = ACT_HL2MP_IDLE_RPG,
		[ ACT_MP_WALK ] = ACT_HL2MP_WALK_RPG,
		[ ACT_MP_RUN ] = ACT_HL2MP_RUN_RPG,
		[ ACT_MP_CROUCH_IDLE ] = ACT_HL2MP_IDLE_CROUCH_SMG1,
		[ ACT_MP_CROUCHWALK ] = ACT_HL2MP_WALK_CROUCH_SMG1,
		[ ACT_MP_JUMP ] = ACT_HL2MP_JUMP_RPG,
		[ ACT_MP_SWIM ] = ACT_HL2MP_SWIM_RPG,
	},
}

function SWEP:SetWeaponHoldType( t )
	if !self.Owner:IsValid() then return end

	t = string.lower( t )
	local index = ActIndex[ t ]

	if self.SpecialACTTable[t] and self.SpecialACTTable[t].base then
		index = ActIndex[ self.SpecialACTTable[t].base ]
	elseif ( index == nil ) then
		t = "normal"
		index = ActIndex[ t ]
	end

	self.ActivityTranslate = {}
	self.ActivityTranslate[ ACT_MP_STAND_IDLE ]					= index
	self.ActivityTranslate[ ACT_MP_WALK ]						= index + 1
	self.ActivityTranslate[ ACT_MP_RUN ]						= index + 2
	self.ActivityTranslate[ ACT_MP_CROUCH_IDLE ]				= index + 3
	self.ActivityTranslate[ ACT_MP_CROUCHWALK ]					= index + 4
	self.ActivityTranslate[ ACT_MP_ATTACK_STAND_PRIMARYFIRE ]	= index + 5
	self.ActivityTranslate[ ACT_MP_ATTACK_CROUCH_PRIMARYFIRE ]	= index + 5
	self.ActivityTranslate[ ACT_MP_RELOAD_STAND ]				= index + 6
	self.ActivityTranslate[ ACT_MP_RELOAD_CROUCH ]				= index + 6
	self.ActivityTranslate[ ACT_MP_JUMP ]						= index + 7
	self.ActivityTranslate[ ACT_RANGE_ATTACK1 ]					= index + 8
	self.ActivityTranslate[ ACT_MP_SWIM ]						= index + 9

	-- "normal" jump animation doesn't exist
	if ( t == "normal" ) then
		self.ActivityTranslate[ ACT_MP_JUMP ] = ACT_HL2MP_JUMP_SLAM
	end

	if self.SpecialACTTable[t] then
		-- thank you for choosing to animate with us at ACT3. We hope you have a lovely fight.

		for i, k in pairs(self.SpecialACTTable[t]) do
			if isnumber(k) then
				self.ActivityTranslate[i] = k
			else
				local act = self.Owner:GetSequenceActivity(self.Owner:LookupSequence(k))

				if act then
					self.ActivityTranslate[i] = act
				end
			end
		end
	end

	self:SetupWeaponHoldTypeForAI( t )

end

function SWEP:TranslateActivity( act )

	if ( self.Owner:IsNPC() ) then
		if ( self.ActivityTranslateAI[ act ] ) then
			return self.ActivityTranslateAI[ act ]
		end
		return -1
	end

	if ( self.ActivityTranslate[ act ] != nil ) then
		return self.ActivityTranslate[ act ]
	end

	return -1

end