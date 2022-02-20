function ACT3_VectorLerp(delta, v1, v2)
    local v3 = Vector(0, 0, 0)

    v3.x = v1.x + (delta * (v2.x - v1.x))
    v3.y = v1.y + (delta * (v2.y - v1.y))
    v3.z = v1.z + (delta * (v2.z - v1.z))

    return v3
end

function ACT3_AngleLerp(delta, v1, v2)
    local v3 = Angle(0, 0, 0)

    v3.x = v1.x + (delta * (v2.p - v1.p))
    v3.y = v1.y + (delta * (v2.y - v1.y))
    v3.z = v1.z + (delta * (v2.r - v1.r))

    return v3
end

physenv.AddSurfaceData( [["act3_case_bouncy"
{
    "impacthard"	"DoorSound.Null"
	"impactsoft"	"DoorSound.Null"

	"audiohardnessfactor" "0.0"
	"audioroughnessfactor" "0.0"

	"scrapeRoughThreshold" "1.0"
	"impactHardThreshold" "1.0"

	"elasticity"	"5000"
	"friction"		"0.5"
	"density"		"10000"
}]] )