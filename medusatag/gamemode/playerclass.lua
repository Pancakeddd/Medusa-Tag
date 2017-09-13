local ply = FindMetaTable("Player")



local combineclass = {}
local rebelclass = {}

ply.Class = {}
ply.NoRespawnRandom = false

--[[-------------------------------------------------------------------------
    Combine Classes
---------------------------------------------------------------------------]]

-- Soldier Class

combineclass[0] = {
    name = "Soldier",
    shortname = "soldier",
    description = "Standardly equpied soldier, Good at ranged combat.",
    equipdesc = {"Ar2","Grenade","Stun Stick"},
    weapons = {"weapon_ar2","weapon_frag","weapon_stunstick"},
    hp = 100,
    wspeed = 200,
    rspeed = 300,
    ammo = { {"ar2",60} }
    }
-- Brute Class

combineclass[1] = {
    name = "Shotgun Soldier",
    shortname = "shotsoldier",
    description = "Specialized soldier for close quarters combat.",
    equipdesc = {"Shotgun","Stun Stick"},
    weapons = {"weapon_shotgun","weapon_stunstick"},
    hp = 100,
    wspeed = 275,
    rspeed = 375,
    ammo = { {"buckshot",20} }
    }

-- Explosives Specalist

combineclass[2] = {
    name = "Explosives Soldier",
    shortname = "expsoldier",
    description = "Soldier that carries a rocket launcher. nuff said.",
    equipdesc = {"Rpg","Pistol","Stun Stick"},
    weapons = {"weapon_rpg","weapon_pistol","weapon_stunstick"},
    hp = 125,
    wspeed = 165,
    rspeed = 225,
    ammo = { {"pistol",15} }
    }

--[[-------------------------------------------------------------------------
    Rebel Classes
---------------------------------------------------------------------------]]

-- Rebel Soldier

rebelclass[0] = {
    name = "Rebel Soldier",
    shortname = "rebsoldier",
    description = "Standard Rebel, smg, pistol, crowbar, and a will to revolt.",
    equipdesc = {"Smg","Pistol","Crowbar"},
    weapons = {"weapon_smg1","weapon_pistol","weapon_crowbar"},
    hp = 100,
    wspeed = 245,
    rspeed = 345,
    ammo = { {"smg1",60},{"pistol",15} }
    }

-- Rebel Arbalist

rebelclass[1] = {
    name = "Rebel Arbalist",
    shortname = "arba",
    description = "Rebel with a crossbow, a well trained arbalist can decimate the battlefield.",
    equipdesc = {"Crossbow","Crowbar"},
    weapons = {"weapon_crossbow","weapon_crowbar"},
    hp = 85,
    wspeed = 225,
    rspeed = 275,
    ammo = { {"XBowBolt",7} }
    }

-- Rebel Scout

rebelclass[2] = {
    name = "Rebel Scout",
    shortname = "scout",
    description = "Lightly armored rebel with a improved pistol.",
    equipdesc = {"Advanced Pistol","Crowbar"},
    weapons = {"weapon_alyxgun","weapon_crowbar"},
    hp = 75,
    wspeed = 300,
    rspeed = 375,
    ammo = { {"AlyxGun",80} }
    }



function ply:SetClass( team ,classname )
    if(team == 0) then
        for i,c in pairs(combineclass) do
            if(c.shortname == classname) then
                ply.Class = c
                print(ply.Class.shortname)
                print(c.shortname)

            end
        end

    else
        for i,c in pairs(rebelclass) do

            if(c.shortname == classname) then
                ply.Class = c
                print(ply.Class.shortname)
                print(c.shortname)
            end
        end
    end
end


function ply:SetClassByIndex( team ,index )
    if(team == 0) then
        ply.Class = combineclass[index]
    else
        ply.Class = rebelclass[index]
    end
end

function ply:GetClass()
    return ply.Class
end

function chatCommand( ply, text, public )
    if (string.sub(text, 1, 7) == "#change") then
        classto = string.sub(text, 9, #text)
        ply:StripAmmo() 
        ply:StripWeapons()
        ply:SetClass(tonumber( classto[1] ),string.sub(classto,3,#classto))
        ply:SetupTeam(tonumber( classto[1] ))
        ply.NoRespawnRandom = true
    end
end
hook.Add( "PlayerSay", "chatCommand", chatCommand );
