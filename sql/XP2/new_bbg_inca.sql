--==========
-- Inca
--==========
UPDATE Units SET Combat=25, RangedCombat=40 WHERE UnitType='UNIT_INCA_WARAKAQ';

-- 24/05/2021: Change era from game to personal.
UPDATE Requirements SET RequirementType='REQUIREMENT_PLAYER_ERA_AT_LEAST' WHERE RequirementId='REQUIRES_ERA_ATLEASTEXPANSION_INDUSTRIAL';

INSERT INTO Modifiers(ModifierId, ModifierType) VALUES
    ('BBG_INTERNATIONAL_TRADE_ROUTE_GOLD_GRASS_MOUNTAIN_ORIGIN', 'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_YIELD_PER_TERRAIN_INTERNATIONAL'),
    ('BBG_INTERNATIONAL_TRADE_ROUTE_GOLD_PLAIN_MOUNTAIN_ORIGIN', 'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_YIELD_PER_TERRAIN_INTERNATIONAL'),
    ('BBG_INTERNATIONAL_TRADE_ROUTE_GOLD_DESERT_MOUNTAIN_ORIGIN', 'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_YIELD_PER_TERRAIN_INTERNATIONAL'),
    ('BBG_INTERNATIONAL_TRADE_ROUTE_GOLD_TUNDRA_MOUNTAIN_ORIGIN', 'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_YIELD_PER_TERRAIN_INTERNATIONAL'),
    ('BBG_INTERNATIONAL_TRADE_ROUTE_GOLD_SNOW_MOUNTAIN_ORIGIN', 'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_YIELD_PER_TERRAIN_INTERNATIONAL');
INSERT INTO ModifierArguments(ModifierId, Name, Value) VALUES
    ('BBG_INTERNATIONAL_TRADE_ROUTE_GOLD_GRASS_MOUNTAIN_ORIGIN', 'Origin', '1'),
    ('BBG_INTERNATIONAL_TRADE_ROUTE_GOLD_GRASS_MOUNTAIN_ORIGIN', 'Amount', '1'),
    ('BBG_INTERNATIONAL_TRADE_ROUTE_GOLD_GRASS_MOUNTAIN_ORIGIN', 'TerrainType', 'TERRAIN_GRASS_MOUNTAIN'),
    ('BBG_INTERNATIONAL_TRADE_ROUTE_GOLD_GRASS_MOUNTAIN_ORIGIN', 'YieldType', 'YIELD_GOLD'),
    ('BBG_INTERNATIONAL_TRADE_ROUTE_GOLD_PLAIN_MOUNTAIN_ORIGIN', 'Origin', '1'),
    ('BBG_INTERNATIONAL_TRADE_ROUTE_GOLD_PLAIN_MOUNTAIN_ORIGIN', 'Amount', '1'),
    ('BBG_INTERNATIONAL_TRADE_ROUTE_GOLD_PLAIN_MOUNTAIN_ORIGIN', 'TerrainType', 'TERRAIN_PLAINS_MOUNTAIN'),
    ('BBG_INTERNATIONAL_TRADE_ROUTE_GOLD_PLAIN_MOUNTAIN_ORIGIN', 'YieldType', 'YIELD_GOLD'),
    ('BBG_INTERNATIONAL_TRADE_ROUTE_GOLD_DESERT_MOUNTAIN_ORIGIN', 'Origin', '1'),
    ('BBG_INTERNATIONAL_TRADE_ROUTE_GOLD_DESERT_MOUNTAIN_ORIGIN', 'Amount', '1'),
    ('BBG_INTERNATIONAL_TRADE_ROUTE_GOLD_DESERT_MOUNTAIN_ORIGIN', 'TerrainType', 'TERRAIN_DESERT_MOUNTAIN'),
    ('BBG_INTERNATIONAL_TRADE_ROUTE_GOLD_DESERT_MOUNTAIN_ORIGIN', 'YieldType', 'YIELD_GOLD'),
    ('BBG_INTERNATIONAL_TRADE_ROUTE_GOLD_TUNDRA_MOUNTAIN_ORIGIN', 'Origin', '1'),
    ('BBG_INTERNATIONAL_TRADE_ROUTE_GOLD_TUNDRA_MOUNTAIN_ORIGIN', 'Amount', '1'),
    ('BBG_INTERNATIONAL_TRADE_ROUTE_GOLD_TUNDRA_MOUNTAIN_ORIGIN', 'TerrainType', 'TERRAIN_TUNDRA_MOUNTAIN'),
    ('BBG_INTERNATIONAL_TRADE_ROUTE_GOLD_TUNDRA_MOUNTAIN_ORIGIN', 'YieldType', 'YIELD_GOLD'),
    ('BBG_INTERNATIONAL_TRADE_ROUTE_GOLD_SNOW_MOUNTAIN_ORIGIN', 'Origin', '1'),
    ('BBG_INTERNATIONAL_TRADE_ROUTE_GOLD_SNOW_MOUNTAIN_ORIGIN', 'Amount', '1'),
    ('BBG_INTERNATIONAL_TRADE_ROUTE_GOLD_SNOW_MOUNTAIN_ORIGIN', 'TerrainType', 'TERRAIN_SNOW_MOUNTAIN'),
    ('BBG_INTERNATIONAL_TRADE_ROUTE_GOLD_SNOW_MOUNTAIN_ORIGIN', 'YieldType', 'YIELD_GOLD');
INSERT INTO TraitModifiers(TraitType, ModifierId) VALUES
    ('TRAIT_LEADER_PACHACUTI_QHAPAQ_NAN', 'BBG_INTERNATIONAL_TRADE_ROUTE_GOLD_GRASS_MOUNTAIN_ORIGIN'),
    ('TRAIT_LEADER_PACHACUTI_QHAPAQ_NAN', 'BBG_INTERNATIONAL_TRADE_ROUTE_GOLD_PLAIN_MOUNTAIN_ORIGIN'),
    ('TRAIT_LEADER_PACHACUTI_QHAPAQ_NAN', 'BBG_INTERNATIONAL_TRADE_ROUTE_GOLD_DESERT_MOUNTAIN_ORIGIN'),
    ('TRAIT_LEADER_PACHACUTI_QHAPAQ_NAN', 'BBG_INTERNATIONAL_TRADE_ROUTE_GOLD_TUNDRA_MOUNTAIN_ORIGIN'),
    ('TRAIT_LEADER_PACHACUTI_QHAPAQ_NAN', 'BBG_INTERNATIONAL_TRADE_ROUTE_GOLD_SNOW_MOUNTAIN_ORIGIN');

-- 17/04/23 Reduction to buy mountain tiles
INSERT INTO Modifiers (ModifierId, ModifierType) VALUES
    ('BBG_GRASS_MOUNTAIN_PLOT_COST', 'MODIFIER_PLAYER_CITIES_ADJUST_PLOT_PURCHASE_COST_TERRAIN'),
    ('BBG_PLAINS_MOUNTAIN_PLOT_COST', 'MODIFIER_PLAYER_CITIES_ADJUST_PLOT_PURCHASE_COST_TERRAIN'),
    ('BBG_TUNDRA_MOUNTAIN_PLOT_COST', 'MODIFIER_PLAYER_CITIES_ADJUST_PLOT_PURCHASE_COST_TERRAIN'),
    ('BBG_DESERT_MOUNTAIN_PLOT_COST', 'MODIFIER_PLAYER_CITIES_ADJUST_PLOT_PURCHASE_COST_TERRAIN'),
    ('BBG_SNOW_MOUNTAIN_PLOT_COST', 'MODIFIER_PLAYER_CITIES_ADJUST_PLOT_PURCHASE_COST_TERRAIN');
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES
    ('BBG_GRASS_MOUNTAIN_PLOT_COST', 'TerrainType', 'TERRAIN_GRASS_MOUNTAIN'),
    ('BBG_GRASS_MOUNTAIN_PLOT_COST', 'Amount', -50),
    ('BBG_PLAINS_MOUNTAIN_PLOT_COST', 'TerrainType', 'TERRAIN_PLAINS_MOUNTAIN'),
    ('BBG_PLAINS_MOUNTAIN_PLOT_COST', 'Amount', -50),
    ('BBG_TUNDRA_MOUNTAIN_PLOT_COST', 'TerrainType', 'TERRAIN_TUNDRA_MOUNTAIN'),
    ('BBG_TUNDRA_MOUNTAIN_PLOT_COST', 'Amount', -50),
    ('BBG_DESERT_MOUNTAIN_PLOT_COST', 'TerrainType', 'TERRAIN_DESERT_MOUNTAIN'),
    ('BBG_DESERT_MOUNTAIN_PLOT_COST', 'Amount', -50),
    ('BBG_SNOW_MOUNTAIN_PLOT_COST', 'TerrainType', 'TERRAIN_SNOW_MOUNTAIN'),
    ('BBG_SNOW_MOUNTAIN_PLOT_COST', 'Amount', -50);
INSERT INTO TraitModifiers(TraitType, ModifierId) VALUES
    ('TRAIT_LEADER_PACHACUTI_QHAPAQ_NAN', 'BBG_GRASS_MOUNTAIN_PLOT_COST'),
    ('TRAIT_LEADER_PACHACUTI_QHAPAQ_NAN', 'BBG_PLAINS_MOUNTAIN_PLOT_COST'),
    ('TRAIT_LEADER_PACHACUTI_QHAPAQ_NAN', 'BBG_TUNDRA_MOUNTAIN_PLOT_COST'),
    ('TRAIT_LEADER_PACHACUTI_QHAPAQ_NAN', 'BBG_DESERT_MOUNTAIN_PLOT_COST'),
    ('TRAIT_LEADER_PACHACUTI_QHAPAQ_NAN', 'BBG_SNOW_MOUNTAIN_PLOT_COST');

-- 15/12/24 Inca +1 amenity at 5 pop doubled at 10 pop
-- 15/12/24 en fait non
-- INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES
--     ('BBG_INCA_AMENITY_5_POPULATION', 'MODIFIER_PLAYER_CITIES_ADJUST_POLICY_AMENITY', 'BBG_CITY_HAS_5_POP_REQSET'),
--     ('BBG_INCA_AMENITY_10_POPULATION', 'MODIFIER_PLAYER_CITIES_ADJUST_POLICY_AMENITY', 'STADIUM_10_POPULATION_REQUIREMENTS');
-- INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES
--     ('BBG_INCA_AMENITY_5_POPULATION', 'Amount', 1),
--     ('BBG_INCA_AMENITY_10_POPULATION', 'Amount', 1);
-- INSERT INTO TraitModifiers (TraitType, ModifierId) VALUES
--     ('TRAIT_CIVILIZATION_GREAT_MOUNTAINS', 'BBG_INCA_AMENITY_5_POPULATION'),
--     ('TRAIT_CIVILIZATION_GREAT_MOUNTAINS', 'BBG_INCA_AMENITY_10_POPULATION');

-- INSERT INTO Requirements (RequirementId, RequirementType) VALUES
--     ('BBG_CITY_HAS_5_POP', 'REQUIREMENT_CITY_HAS_X_POPULATION');
-- INSERT INTO RequirementArguments (RequirementId, Name, Value) VALUES
--     ('BBG_CITY_HAS_5_POP', 'Amount', 5);
-- INSERT INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES
--     ('BBG_CITY_HAS_5_POP_REQSET', 'REQUIREMENTSET_TEST_ALL');
-- INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES
--     ('BBG_CITY_HAS_5_POP_REQSET', 'BBG_CITY_HAS_5_POP');


-- 15/12/24 recon units can build Qhapaq Nan (IMPROVEMENT_MOUNTAIN_ROAD)
INSERT INTO Requirements (RequirementId, RequirementType) VALUES
    ('BBG_UNIT_IS_RECON_REQUIREMENT', 'REQUIREMENT_UNIT_PROMOTION_CLASS_MATCHES');
INSERT INTO RequirementArguments (RequirementId, Name, Value) VALUES
    ('BBG_UNIT_IS_RECON_REQUIREMENT', 'UnitPromotionClass', 'PROMOTION_CLASS_RECON');
INSERT INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES
    ('BBG_UNIT_IS_RECON_REQSET', 'REQUIREMENTSET_TEST_ALL');
INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES
    ('BBG_UNIT_IS_RECON_REQSET', 'BBG_UNIT_IS_RECON_REQUIREMENT');

INSERT INTO Modifiers (ModifierId, ModifierType, OwnerRequirementSetId, SubjectRequirementSetId) VALUES
    ('BBG_INCA_SCOUT_BUILD_CHARGE', 'MODIFIER_PLAYER_UNITS_ADJUST_BUILDER_CHARGES', 'BBG_UTILS_PLAYER_HAS_CIVIC_FOREIGN_TRADE_REQSET', 'BBG_UNIT_IS_RECON_REQSET');
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES
    ('BBG_INCA_SCOUT_BUILD_CHARGE', 'Amount', 1);
INSERT INTO Improvement_ValidBuildUnits (ImprovementType, UnitType, ConsumesCharge) VALUES
    ('IMPROVEMENT_MOUNTAIN_ROAD', 'UNIT_SCOUT', 1),
    ('IMPROVEMENT_MOUNTAIN_ROAD', 'UNIT_RANGER', 1),
    ('IMPROVEMENT_MOUNTAIN_ROAD', 'UNIT_SPEC_OPS', 1),
    ('IMPROVEMENT_MOUNTAIN_ROAD', 'UNIT_INCA_WARAKAQ', 1);
INSERT INTO TraitModifiers (TraitType, ModifierId) VALUES
    ('TRAIT_CIVILIZATION_GREAT_MOUNTAINS', 'BBG_INCA_SCOUT_BUILD_CHARGE');
