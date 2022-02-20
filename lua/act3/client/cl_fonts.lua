if CLIENT then

local ACT3Font = "Open Sans Light"

surface.CreateFont( "ACT3_HUD_20", {
	font = ACT3Font,
	size = ScreenScale(20),
	weight = 0,
	antialias = true,
} )

surface.CreateFont( "ACT3_LCD_20_Glow", {
	font = "Open 24 Display St",
	size = ScreenScale(20),
	weight = 0,
	additive = true,
	blursize = ScreenScale(1),
	scanlines = 2,
	antialias = true,
} )

surface.CreateFont( "ACT3_LCD_20", {
	font = "Open 24 Display St",
	size = ScreenScale(20),
	weight = 0,
	additive = true,
	scanlines = ScreenScale(1),
	antialias = true,
} )

surface.CreateFont( "ACT3_HUD_16", {
	font = ACT3Font,
	size = ScreenScale(16),
	weight = 0,
	antialias = true,
} )

surface.CreateFont( "ACT3_HUD_10", {
	font = ACT3Font,
	size = ScreenScale(10),
	weight = 0,
	antialias = true,
} )

surface.CreateFont( "ACT3_HUD_10_Glow", {
	font = ACT3Font,
	size = ScreenScale(10),
	weight = 0,
	blursize = 2,
	antialias = true,
} )

surface.CreateFont( "ACT3_HUD_8", {
	font = ACT3Font,
	size = ScreenScale(8),
	weight = 0,
	antialias = true,
} )

surface.CreateFont( "ACT3_HUD_8_Glow", {
	font = ACT3Font,
	size = ScreenScale(8),
	weight = 0,
	blursize = 2,
	antialias = true,
} )

surface.CreateFont( "ACT3_HUD_6", {
	font = ACT3Font,
	size = ScreenScale(6),
	weight = 0,
	antialias = true,
} )

surface.CreateFont( "ACT3_HL2_8", {
	font = "Helvetica",
	extended = false,
	size = ScreenScale(8),
	weight = 0,
	antialias = true,
} )

end