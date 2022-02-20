-- Seperated the code for doing night vision and thermal vision
-- This way, it'll be more adaptable.

if SERVER then return end

local mat_color = Material( "pp/colour" )
local mat_noise = Material( "act3hud/nvg_noise" )
local mat_texturize = Material( "pp/texturize/plain.png" )

function ACT3_DoNightVision(ns)
   ACT3_InNightScope = true

   local dlight = DynamicLight(LocalPlayer():EntIndex())
   dlight.r = ns.NightScopeColor.r
   dlight.g = ns.NightScopeColor.g
   dlight.b = ns.NightScopeColor.b
   dlight.minlight = 0
   dlight.style = 0
   dlight.Brightness = 1
   dlight.Pos = EyePos()
   dlight.Size = ns.NightScopeActiveNVStrength
   dlight.Decay = ns.NightScopeActiveNVStrength * 0.25
   dlight.DieTime = CurTime() + 0.1

   render.UpdateScreenEffectTexture()

   if !ns.FullColor then
      mat_color:SetTexture( "$fbtexture", render.GetScreenEffectTexture() )

      mat_color:SetFloat( "$pp_colour_addr", 0 )
      mat_color:SetFloat( "$pp_colour_addg", 0 )
      mat_color:SetFloat( "$pp_colour_addb", 0 )
      mat_color:SetFloat( "$pp_colour_mulr", 0 )
      mat_color:SetFloat( "$pp_colour_mulg", 0 )
      mat_color:SetFloat( "$pp_colour_mulb", 0 )
      mat_color:SetFloat( "$pp_colour_brightness", 0.00 )
      mat_color:SetFloat( "$pp_colour_contrast", 1 )
      mat_color:SetFloat( "$pp_colour_colour", 0 )

      render.SetMaterial( mat_color )
      render.DrawScreenQuad()

      render.UpdateScreenEffectTexture()
   end

   mat_color:SetTexture( "$fbtexture", render.GetScreenEffectTexture() )

   mat_color:SetFloat( "$pp_colour_addr", ns.NightScopeColor.r - 255 )
   mat_color:SetFloat( "$pp_colour_addg", ns.NightScopeColor.g - 255 )
   mat_color:SetFloat( "$pp_colour_addb", ns.NightScopeColor.b - 255 )
   mat_color:SetFloat( "$pp_colour_mulr", 0 )
   mat_color:SetFloat( "$pp_colour_mulg", 0 )
   mat_color:SetFloat( "$pp_colour_mulb", 0 )
   mat_color:SetFloat( "$pp_colour_brightness", 0 )
   mat_color:SetFloat( "$pp_colour_contrast", ns.NightScopeContrast )
   mat_color:SetFloat( "$pp_colour_colour", 1 )

   render.SetMaterial( mat_color )
   render.DrawScreenQuad()

   local w = ScrW()
   local h = ScrH()

   local noise_col = Color(ns.NightScopeColor.r, ns.NightScopeColor.g, ns.NightScopeColor.b, ns.NightScopeNoise or 255)

   surface.SetMaterial( mat_noise )
   surface.SetDrawColor( noise_col )
   surface.DrawTexturedRect( 0 + math.Rand(-128,128), 0 + math.Rand(-128,128), w, h )
   surface.DrawTexturedRect( 0 + math.Rand(-64,64), 0 + math.Rand(-64,64), w, h )

   DrawBloom( ns.NightScopeDarken or 0.1, 1, (ns.NightScopeMultX or 1) * 6, (ns.NightScopeMultY or 1) * 6, 1, 1, 1, 1, 1 )
end

local lastframewasirscope = false

-- Thermal Vision based on Wiremod thermal vision

local IRLive = CreateMaterial("ir_living", "UnlitGeneric", {
   ["$basetexture"] = "color/white",
   ["$model"] = 1,
})

local IRDead = CreateMaterial("ir_dead", "VertexLitGeneric", {
   ["$basetexture"] = "color/white",
   ["$model"] = 1,
})
   
local materialOverrides = {
   PlayerDraw = { IRLive, IRDead },
   DrawOpaqueRenderables = { IRLive, nil },
   DrawTranslucentRenderables = { IRDead, nil },
   DrawSkybox = { IRDead, nil }
}

function ACT3_DoThermalVision(tv)

   DrawColorModify({
      [ "$pp_colour_addr" ] = 0.4,
		[ "$pp_colour_addg" ] = -0.5,
		[ "$pp_colour_addb" ] = -0.5,
		[ "$pp_colour_brightness" ] = 0,
		[ "$pp_colour_contrast" ] = 1.2,
		[ "$pp_colour_colour" ] = 0,
		[ "$pp_colour_mulr" ] = 0,
		[ "$pp_colour_mulg" ] = 0,
		[ "$pp_colour_mulb" ] = 0
   })

   if !lastframewasirscope then
      for hookName, materials in pairs(materialOverrides) do
         hook.Add("Pre" .. hookName, "act3ir", function() render.MaterialOverride(materials[1]) end)
         hook.Add("Post" .. hookName, "act3ir", function() render.MaterialOverride(materials[2]) end)
      end
   end

   DrawBloom(0.5, 10, 5, 5, 1, 0, 1, 1, 1)
   DrawTexturize( 1, tv.ThermalVisionTexture )

   ACT3_InThermalVision = true
   ACT3_InNightScope = true
   lastframewasirscope = true
end

hook.Add("HUDPaintBackground", "ACT3_Vision", function()
   if lastframewasirscope and !ACT3_InThermalVision then
      for hookName, materials in pairs(materialOverrides) do
         hook.Remove("Pre" .. hookName, "act3ir")
         hook.Remove("Post" .. hookName, "act3ir")
      end
      lastframewasirscope = false
   end

   ACT3_InNightScope = false -- these globals must be set
   ACT3_InThermalVision = false
end)