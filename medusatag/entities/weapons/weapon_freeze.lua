AddCSLuaFile()

SWEP.PrintName    = "Freeze Frame"
SWEP.Author = "octopodesrex"
SWEP.Contact = "octopodesrex@gmail.com"
SWEP.Purpose = "Freeze players on sight."
SWEP.Instructions = "Look at the player to freeze them, unfrozen when out of sight."
SWEP.Category = "Freeze Frame"

SWEP.Spawnable = true
SWEP.AdminSpawnable = true

SWEP.ViewModel = "models/weapons/v_pistol.mdl"
SWEP.WorldModel = "models/weapons/w_pistol.mdl"

SWEP.Primary.ClipSize = -1
SWEP.Primary.DefaultClip = -1
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = "none"

SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = -1
SWEP.Secondary.Automatic = false
SWEP.Secondary.Ammo = "none"

local ShootSound = Sound("npc/headcrab_poison/ph_hiss1.wav")
timeCounter = 1

function SWEP:Initialize()
    self:SetHoldType( "pistol" )

end

function SWEP:Reload()
end

function SWEP:Think()
    for k,v in pairs(ents.FindInCone(self:GetOwner():GetPos() ,self:GetOwner():GetAimVector() ,90,0) ) do

        print(v:GetName())

    end
    self:NextThink( CurTime()+0.2)
end

if SERVER then
elseif CLIENT then
end
