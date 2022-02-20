if CLIENT then

local queuedlensflares = {}
local queuedlasers = {}

local lasermat = Material("effects/laser1")
local laserflare = Material("particle/fire")
local flaremat = Material("sprites/act3_lensflare")

net.Receive("ACT3_NetworkLightsOn", function(len, ply)
    local wpn = net.ReadEntity()
    local onoff = net.ReadBool()

    if !wpn.ACT3Weapon then return end

    wpn:ToggleAccessories(onoff)
end)

function ACT3_DoFlashlight(pos, ang, ent, index, mat, dist, brightness, fov, col)
    dist = dist or 500
    brightness = brightness or 2
    col = col or Color(255, 255, 255)
    fov = fov or 70

    if !ent.LightsOn then return end

    if ACT3_InNightScope then
        dist = dist * 1.5
        brightness = brightness * 1.5
        col = Color(255, 255, 255)
    end

    cam.Start3D()

    if !ent.Flashlights[index] then
        local lamp = ProjectedTexture()

        ent.Flashlights[index] = lamp

        lamp:SetTexture(mat)
        lamp:SetFarZ(dist) -- How far the light should shine
        lamp:SetColor(col)
        lamp:SetBrightness(brightness)
        lamp:SetEnableShadows(false)
        lamp:SetFOV(fov)

        lamp:SetPos(pos) -- Initial position and angles
        lamp:SetAngles(ang)
        lamp:Update()
    else
        local lamp = ent.Flashlights[index]

        if IsValid(lamp) then
            lamp:SetColor(col)
            lamp:SetBrightness(brightness)
            lamp:SetFarZ(dist)

            lamp:SetPos(pos) -- Initial position and angles
            lamp:SetAngles(ang)
            lamp:Update()
        end
    end

    ACT3_DoLensFlare(pos, ang, col, 1)

    cam.End3D()
end

function ACT3_DoLaser(pos, ang, ent, col, asvm)
    if !ent.LightsOn then return end

    local dir = ang:Forward()

    ACT3_DoLensFlare(pos, dir:Angle(), col, 0.01)

    if asvm then
        pos = pos - (dir * 10)
    end

    if ent.State == ACT3_STATE_INSIGHTS and LocalPlayer() == ent.Owner and !ent:BeingOvertaken() then
        dir = LocalPlayer():EyeAngles():Forward()
    end

    local tr = util.TraceLine({
        start = pos,
        endpos = pos + (dir * 150000),
        filter = ent.Owner
    })
    local hit = tr.HitPos
    local didhit = tr.Hit

    if tr.StartSolid then return end

    local width = math.Rand(0.5, 1.25)

    if ACT3_InNightScope then
        col = Color(255, 255, 255)
    end

    if asvm then

    cam.Start3D()

    render.SetMaterial(lasermat)
    render.DrawBeam(pos, hit, width, 0, 1, col)

    if didhit then
        render.SetMaterial(laserflare)
        render.DrawSprite(hit, math.Rand(5, 7), math.Rand(5, 7), col)
    end

    cam.End3D()

    else

    table.insert(queuedlasers, {
        pos = pos,
        hit = hit,
        didhit = didhit,
        width = width,
        col = col
    })

    end

end

function ACT3_DoLensFlare(pos, ang, col, deg, reflect)
    local reflect = reflect or false

    local vtr = util.TraceLine({
        start = pos,
        endpos = EyePos(),
        mask = MASK_VISIBLE,
    })

    if vtr.Hit then return end

    deg = deg or 0.05

    local color = Color(col.r, col.g, col.b, 255)

    if reflect then
        local lightcol = render.GetLightColor(pos)

        local br = (lightcol.r + lightcol.b + lightcol.g) / 3

        color.a = br * 255
    end

    local flaredeg = (pos - EyePos()):GetNormalized():Dot(ang:Forward())

    if flaredeg < -(1 - deg) then
        flaredeg = (-flaredeg - (1 - deg)) * (1 / deg)
        local flaresize = Lerp(flaredeg, 0, 128)

        /*
        surface.SetDrawColor(col)
        surface.SetMaterial(flaremat)
        surface.DrawTexturedRect(toscreen.x - (flaresize / 2), toscreen.y - (flaresize / 2), flaresize, flaresize)
        surface.SetMaterial(flaremat2)
        surface.DrawTexturedRect(toscreen.x - (flaresize / 2), toscreen.y - (flaresize / 2), flaresize, flaresize)
        */

        if ACT3_InNightScope then
            flaresize = flaresize * 3
        end

        table.insert(queuedlensflares, {
            pos = pos,
            flaresize = flaresize,
            col = color
        })

    end
end

hook.Add("PostDrawTranslucentRenderables", "ACT3_PostDrawTranslucentRenderables", function(depth, skybox)

    for i, k in pairs(queuedlensflares) do
        render.SetMaterial(flaremat)
        render.DrawSprite(k.pos, k.flaresize, k.flaresize, k.col)
        local a = k.col.r + k.col.g + k.col.b
        a = a / 3
        render.DrawSprite(k.pos, k.flaresize, k.flaresize, Color(255, 255, 255, a))
    end

    queuedlensflares = {}

    for i, k in pairs(queuedlasers) do
        render.SetMaterial(lasermat)
        render.DrawBeam(k.pos, k.hit, k.width, 0, 1, k.col)

        if k.didhit then
            render.SetMaterial(laserflare)
            render.DrawSprite(k.hit, math.Rand(5, 7), math.Rand(5, 7), k.col)
        end
    end

    queuedlasers = {}

end)

end