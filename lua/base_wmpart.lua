wmpart = {
    model = "", -- model for the WM part
    nodraw = true, -- true makes this thing not draw
    pos = Vector(0, 0, 0), -- position of part relative to base wm
    ang = Angle(0, 0, 0), -- see above
    shield = false, -- whether or not this part should be physical and block bullets
    renderfunc = function(pos, ang, ent, slotid, asvm)
        -- pos: World position attachment is being rendered at
        -- ang: World angle attachment is being rendered at
        -- ent: Weapon the part is attached to
        -- slotid: ID of the slot the attachment is attached to
        -- asvm: Whether or not the attachment is being rendered as a viewmodel
    end
}