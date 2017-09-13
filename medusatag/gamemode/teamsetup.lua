local ply = FindMetaTable("Player")

local teams = {}

-- Defines teams
teams[0] = {name = "Humans",color = Vector(0.0,0.0,1.0)}
teams[1] = {name = "Medusa",color = Vector(1.0,0.0,0.0)}

function ply:SetupTeam( n )
    -- If not valid team number then return
    if ( not teams[n]) then
        return
    end
    -- Sets players team and color
    self:SetTeam(n)
    self:SetPlayerColor(teams[n].color)

    -- Sets model for player
    if ( n == 0 ) then
        self:SetModel("models/Humans/Group03/Male_0"..math.random(1,9)..".mdl")
    else
        self:SetModel("models/gman_high.mdl")

    end
end
