AddCSLuaFile("shared.lua")
AddCSLuaFile("cl_init.lua")
AddCSLuaFile("teamsetup.lua")

include("shared.lua")
include("teamsetup.lua")


-- Spawn
function GM:PlayerSpawn( ply )
    -- TODO need to create a selector, this is a placeholder selector!!!
    teamtopick = math.random(0,1)
    ply:SetupTeam(teamtopick)
end
