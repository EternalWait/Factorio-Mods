local nimh_sat_tint = {r = .75, b = .5, g = .5, a = 1}
local li_ion_sat_tint = {r = 0, b = 1, g = 0, a = 1}
local flywheel_sat_tint = {r= .5, g = .647, b = .5, a = 1}

--////////////////////////////////////////
--NiMH Satellite section
--////////////////////////////////////////
local item_nimh_satellite = table.deepcopy(data.raw.item["satellite"])
item_nimh_satellite.icon = nil
item_nimh_satellite.icons = {
	{
		icon = "__base__/graphics/icons/satellite.png",
		tint = nimh_sat_tint,
		icon_mipmaps = 4,
		icon_size = 64,
	}
}
item_nimh_satellite.rocket_launch_product =
{
	--1.0, 'I have this new battery, let's use it instead and simplfy our production chain!'
    "space-science-pack",
	2000
}
item_nimh_satellite.result = "nimh-satellite"
item_nimh_satellite.name = "nimh-satellite"
item_nimh_satellite.order = "m[satellite]a"
data:extend({item_nimh_satellite})

--////////////////////////////////////////
--Li-Ion Satellite section
--////////////////////////////////////////
local item_li_ion_satellite = table.deepcopy(data.raw.item["satellite"])
item_li_ion_satellite.icon = nil
item_li_ion_satellite.icons = {
	{
		icon = "__base__/graphics/icons/satellite.png",
		tint = li_ion_sat_tint,
		icon_mipmaps = 4,
		icon_size = 64,
	}
}
item_li_ion_satellite.rocket_launch_product =
{
	--2.0 'I have an even newer battery. Hey, I betcha I can make use of all this extra power I've got...
    "space-science-pack", 
	3500
}
item_li_ion_satellite.result = "li-ion-satellite"
item_li_ion_satellite.name = "li-ion-satellite"
item_li_ion_satellite.order = "m[satellite]b"
data:extend({item_li_ion_satellite})

--////////////////////////////////////////
--Flywheel Satellite section
--////////////////////////////////////////
local item_flywheel_satellite = table.deepcopy(data.raw.item["satellite"])
item_flywheel_satellite.icon = nil
item_flywheel_satellite.icons = {
	{
		icon = "__base__/graphics/icons/satellite.png",
		tint = flywheel_sat_tint,
		icon_mipmaps = 4,
		icon_size = 64,
	}
}
item_flywheel_satellite.rocket_launch_product =
{
	--3.0, 'I have this hugely dense battery, and these great generators. Let's make a deep space probe!'
    "space-science-pack",
	16500
}
item_flywheel_satellite.result = "flywheel-satellite"
item_flywheel_satellite.name = "flywheel-satellite"
item_flywheel_satellite.order = "m[satellite]c"
data:extend({item_flywheel_satellite})

data.raw["rocket-silo"]["rocket-silo"].rocket_result_inventory_size = 9