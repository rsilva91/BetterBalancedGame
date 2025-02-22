
-- 14/10/23 Sejong culture when getting to a new era equals the science per turn (instead of 2 times)
-- SEJONG_CLASSICAL_SCIENCE_INTO_CULTURE
-- SEJONG_MEDIEVAL_SCIENCE_INTO_CULTURE
-- SEJONG_RENAISSANCE_SCIENCE_INTO_CULTURE
-- SEJONG_INDUSTRIAL_SCIENCE_INTO_CULTURE
-- SEJONG_MODERN_SCIENCE_INTO_CULTURE
-- SEJONG_ATOMIC_SCIENCE_INTO_CULTURE
-- SEJONG_INFORMATION_SCIENCE_INTO_CULTURE
-- SEJONG_FUTURE_SCIENCE_INTO_CULTURE
-- 01/12/24 reverted to x2
UPDATE ModifierArguments SET Value=2 WHERE ModifierId LIKE "SEJONG%SCIENCE_INTO_CULTURE" AND Name="Multiplier";

-- Sejong exclusion from .5 adjacency
INSERT INTO ExcludedAdjacencies(TraitType, YieldChangeId) VALUES
    ('TRAIT_LEADER_SEJONG', 'District_Science');



-- 04/07/23 Korea rework (Seowon changes are in Korea.sql)
-- 1 culture/2 tourism per district if city has seowon+theater
INSERT INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES
	('BBG_CITY_HAS_SEOWON_AND_THEATER_REQSET', 'REQUIREMENTSET_TEST_ALL');
INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES
	('BBG_CITY_HAS_SEOWON_AND_THEATER_REQSET', 'BBG_CITY_HAS_DISTRICT_SEOWON_REQUIREMENT'),
	('BBG_CITY_HAS_SEOWON_AND_THEATER_REQSET', 'BBG_CITY_HAS_DISTRICT_THEATER_REQUIREMENT');
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES
	('BBG_SEJONG_CULTURE_PER_DISTRICTS', 'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_PER_DISTRICT', 'BBG_CITY_HAS_SEOWON_AND_THEATER_REQSET'),
	('BBG_SEJONG_TOURISM_PER_DISTRICTS', 'MODIFIER_PLAYER_DISTRICTS_ADJUST_TOURISM_CHANGE', 'BBG_CITY_HAS_SEOWON_AND_THEATER_REQSET');
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES
	('BBG_SEJONG_CULTURE_PER_DISTRICTS', 'YieldType', 'YIELD_CULTURE'),
	('BBG_SEJONG_CULTURE_PER_DISTRICTS', 'Amount', 1),
	('BBG_SEJONG_TOURISM_PER_DISTRICTS', 'Amount', 2);
INSERT INTO TraitModifiers (TraitType, ModifierId) VALUES
	('TRAIT_LEADER_SEJONG', 'BBG_SEJONG_CULTURE_PER_DISTRICTS'),
	('TRAIT_LEADER_SEJONG', 'BBG_SEJONG_TOURISM_PER_DISTRICTS');

-- 04/07/23 Cities get +15% prod towards builders after feudalism and if the city has no gov
-- 01/12/24 to +30%
INSERT INTO Modifiers (ModifierId, ModifierType, OwnerRequirementSetId, SubjectRequirementSetId) VALUES
	('BBG_SEJONG_BUILDER_PROD_NO_GOV', 'MODIFIER_PLAYER_UNITS_ADJUST_UNIT_PRODUCTION', 'BBG_UTILS_PLAYER_HAS_CIVIC_FEUDALISM_REQSET', 'CITY_HAS_NO_GOVERNOR_REQUIREMENTS');
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES
	('BBG_SEJONG_BUILDER_PROD_NO_GOV', 'UnitType', 'UNIT_BUILDER'),
	('BBG_SEJONG_BUILDER_PROD_NO_GOV', 'Amount', 30);
INSERT INTO TraitModifiers (TraitType, ModifierId) VALUES
	('TRAIT_LEADER_SEJONG', 'BBG_SEJONG_BUILDER_PROD_NO_GOV');