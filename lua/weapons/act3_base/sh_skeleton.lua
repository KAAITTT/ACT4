function SWEP:ResetSkeleton()
    local model = self.Owner

    local bonecount = model:GetBoneCount() - 1

    for i = 0, bonecount do
        model:ManipulateBonePosition(i, Vector(0, 0, 0))
        model:ManipulateBoneAngles(i, Angle(0, 0, 0))
    end
end

function SWEP:ApplySkeleton()
    local model = self.Owner

    local bonecount = model:GetBoneCount() - 1

    for i = 0, bonecount do
        local bonename = model:GetBoneName(i)

        if self.SkeletonManip[bonename] then
            model:ManipulateBonePosition(i, self.SkeletonManip[bonename].pos)
            model:ManipulateBoneAngles(i, self.SkeletonManip[bonename].ang)
        end
    end
end