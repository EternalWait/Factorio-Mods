--Reminder: -25 to +25 is a length of 50, not 25!
building_size = 49.9 / 2
building_scale = (building_size*2) / 3

--Number of beacons around a standard building.
beacon_count = 12

ITEM_LIST = {
	["gc-asif"] = "electronic-circuit",
	["rc-asif"] = "advanced-circuit",
	["bc-asif"] = "processing-unit",
	["lds-asif"] = "low-density-structure",
	["eng-asif"] = "engine-unit"
}
base_recipes = {"copper-plate", "iron-plate", "steel-plate", "plastic-bar", "sulfuric-acid" }

--//modules (level 3)
local spd_module_speed_bonus = data.raw.module["speed-module-3"].effect.speed.bonus
local spd_module_pwr_penality = data.raw.module["speed-module-3"].effect.consumption.bonus
local prod_mod_speed_penalty = data.raw.module["productivity-module-3"].effect.speed.bonus
prod_mod_prod_bonus = data.raw.module["productivity-module-3"].effect.productivity.bonus
local prod_mod_pwr_penality = data.raw.module["productivity-module-3"].effect.consumption.bonus
prod_mod_pollution_penalty = data.raw.module["productivity-module-3"].effect.pollution.bonus

--//Beacon
tmp = string.gsub(data.raw["beacon"]["beacon"].energy_usage,"%kW","")
beacon_pwr_drain = tonumber(tmp)

beacon_pwr_penalty = spd_module_pwr_penality * beacon_count
total_beacon_speed_bonus = spd_module_speed_bonus * beacon_count

--//Assembler (refers to vanilla object)
base_ass_entity = data.raw["assembling-machine"]["assembling-machine-3"]
local tmp = string.gsub(base_ass_entity.energy_usage,"%kW","")
assembler_base_pwr_use = tonumber(tmp)
assembler_base_speed = base_ass_entity.crafting_speed
assembler_base_pollution = base_ass_entity.energy_source.emissions_per_minute
assembler_base_modules = base_ass_entity.module_specification.module_slots

local assembler_modules_speed_effect = assembler_base_modules * prod_mod_speed_penalty
local assembler_modules_pwr_penalty = assembler_base_modules * prod_mod_pwr_penality
assembler_productivity_factor = assembler_base_modules * prod_mod_prod_bonus

assembler_total_speed_bonus = assembler_base_speed * (assembler_modules_speed_effect + total_beacon_speed_bonus + 1)
assembler_per_unit_pwr_drain_penalty = (beacon_pwr_penalty + assembler_modules_pwr_penalty + 1)
--Note: value DOES NOT include power drain from beacons (IE the 320Kw the beacon itself uses). This is to be done in the
-- entity function itself.
assembler_total_pwr_draw = assembler_base_pwr_use * assembler_per_unit_pwr_drain_penalty


--//Chem plant (refers to vanilla object)
base_chem_entity = data.raw["assembling-machine"]["chemical-plant"]
local tmp = string.gsub(base_chem_entity.energy_usage,"%kW","")
chem_base_pwr_use = tonumber(tmp)
chem_base_speed = base_chem_entity.crafting_speed
chem_base_pollution = base_chem_entity.energy_source.emissions_per_minute
chem_base_modules = base_chem_entity.module_specification.module_slots

local chem_modules_pwr_penalty = chem_base_modules * prod_mod_pwr_penality
chem_productivity_factor = chem_base_modules * prod_mod_prod_bonus

chem_per_unit_pwr_drain_penalty = (beacon_pwr_penalty + chem_modules_pwr_penalty + 1)
chem_total_pwr_draw = chem_base_pwr_use * chem_per_unit_pwr_drain_penalty

--///
--Reminder: Crafting speed formula is:
--final speed = Recipe time / (assembler speed * (beacon_effect + module_spd_effect + 1)
--final speed is the number of seconds it takes to craft one item, so to get items/second,
-- you need to divide 1 by it. IE: 1/final speed = items per second.
--Note: Productivity modules also cause additional items to be produced, so remember to
-- factor in that effect as well. IE: Items per second = ProdModBonus * 1/final_speed
--///