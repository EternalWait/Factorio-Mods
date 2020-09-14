data:extend(
{   {
    type = "double-setting",
    name = "TS_energy_consumption_multiplier",
    setting_type = "startup",
    default_value = 2,
    maximum_value = 100,
    minimum_value = 0.01,
	order = "a",
    per_user = false,
	},
    {
    type = "int-setting",
    name = "TS_base_shield",
    setting_type = "startup",
    default_value = 200,
    maximum_value = 10000,
    minimum_value = 50,
	order = "a",
    per_user = false,
	},    
    {
    type = "int-setting",
    name = "TS_base_charge_rate",
    setting_type = "startup",
    default_value = 20,
    maximum_value = 1000,
    minimum_value = 0,
	order = "b",
    per_user = false,
	},
	{
    type = "double-setting",
    name = "TS_power_drain",
    setting_type = "startup",
    default_value = 10.0,
    maximum_value = 50.0,
    minimum_value = 0.1,
	order = "ca",
    per_user = false,
	},
	{
    type = "bool-setting",
    name = "TS_alternate_effect",
    setting_type = "runtime-global",
    default_value = true,
	order = "e",
    per_user = false,
	},   
	{
    type = "bool-setting",
    name = "TS_research_enabled",
    setting_type = "runtime-global",
    default_value = true,
	order = "f",
    per_user = false,
	},   
    {
    type = "int-setting",
    name = "TS_research_size",
    setting_type = "startup",
    default_value = 5,
    maximum_value = 100,
    minimum_value = 1,
	order = "g",
    per_user = false,
	},
	{
    type = "int-setting",
    name = "TS_research_speed",
    setting_type = "startup",
    default_value = 5,
    maximum_value = 100,
    minimum_value = 1,
	order = "h",
    per_user = false,
	},
	{
    type = "int-setting",
    name = "TS_max_research_level",
    setting_type = "startup",
    default_value = 25,
    maximum_value = 100,
    minimum_value = 5,
	order = "h",
    per_user = false,
	},
})


