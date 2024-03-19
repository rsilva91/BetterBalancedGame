-- only 1 envoy from levying city-states units
UPDATE ModifierArguments SET Value='1' WHERE ModifierId='LEVY_MILITARY_TWO_FREE_ENVOYS';
-- no combat bonus for levied units
-- DELETE FROM ModifierArguments WHERE ModifierId='RAVEN_LEVY_COMBAT' AND Name='Amount' AND Value='5';
-- Huszars only +2 combat strength from each alliance instead of 3
UPDATE ModifierArguments SET Value='1' WHERE ModifierId='HUSZAR_ALLIES_COMBAT_BONUS';
-- Black Army only +2 combat strength from adjacent levied units
UPDATE ModifierArguments SET Value='2' WHERE ModifierId='BLACK_ARMY_ADJACENT_LEVY';
-- Only 1 extra movement for levied units
UPDATE ModifierArguments SET Value='1' WHERE ModifierId='RAVEN_LEVY_MOVEMENT';


-- Levy combat to +3
UPDATE ModifierArguments SET VALUE='3' WHERE ModifierId='RAVEN_LEVY_COMBAT' AND Name='Amount';

-- Add Green Card
-- 05/03/2024 remove green card
/*INSERT INTO Modifiers(ModifierId, ModifierType, OwnerRequirementSetId) VALUES
    ('BBG_ADDITIONAL_GREEN_CARD', 'MODIFIER_PLAYER_CULTURE_ADJUST_GOVERNMENT_SLOTS_MODIFIER', 'BBG_UTILS_PLAYER_HAS_CIVIC_POLITICAL_PHILOSOPHY_REQSET');
INSERT INTO ModifierArguments(ModifierId, Name, Value) VALUES
    ('BBG_ADDITIONAL_GREEN_CARD', 'GovernmentSlotType', 'SLOT_DIPLOMATIC');
INSERT INTO TraitModifiers(TraitType, ModifierId) VALUES
    ('TRAIT_CIVILIZATION_PEARL_DANUBE', 'BBG_ADDITIONAL_GREEN_CARD');*/

-- Huszar +1 by suzed city-states
INSERT INTO Modifiers(ModifierId, ModifierType, SubjectRequirementSetId)
    SELECT 'BBG_MODIFIER_HUSZAR_SUZ_' || LeaderType, 'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH', 'BBG_PLAYER_IS_SUZERAIN_OF_' || LeaderType || '_REQUIREMENTS'
    FROM Leaders
    WHERE InheritFrom IN
        ('LEADER_MINOR_CIV_CULTURAL', 'LEADER_MINOR_CIV_INDUSTRIAL', 'LEADER_MINOR_CIV_MILITARISTIC',
        'LEADER_MINOR_CIV_RELIGIOUS', 'LEADER_MINOR_CIV_SCIENTIFIC', 'LEADER_MINOR_CIV_TRADE');

--INSERT INTO Modifiers(ModifierId, ModifierType) VALUES
    --('BBG_MODIFIER_HUSZAR_DISPLAY_MODIFIER','MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH');

INSERT INTO ModifierArguments(ModifierId, Name, Value)
    SELECT 'BBG_MODIFIER_HUSZAR_SUZ_' || LeaderType, 'Amount', '2'
    FROM Leaders
    WHERE InheritFrom IN
        ('LEADER_MINOR_CIV_CULTURAL', 'LEADER_MINOR_CIV_INDUSTRIAL', 'LEADER_MINOR_CIV_MILITARISTIC',
        'LEADER_MINOR_CIV_RELIGIOUS', 'LEADER_MINOR_CIV_SCIENTIFIC', 'LEADER_MINOR_CIV_TRADE');

--INSERT INTO ModifierArguments(ModifierId, Name, Value) VALUES
    --('BBG_MODIFIER_HUSZAR_DISPLAY_MODIFIER', 'Amount', '0');

INSERT INTO UnitAbilityModifiers(UnitAbilityType, ModifierId)
    SELECT 'ABILITY_HUSZAR', 'BBG_MODIFIER_HUSZAR_SUZ_' || LeaderType
    FROM Leaders
    WHERE InheritFrom IN
        ('LEADER_MINOR_CIV_CULTURAL', 'LEADER_MINOR_CIV_INDUSTRIAL', 'LEADER_MINOR_CIV_MILITARISTIC',
        'LEADER_MINOR_CIV_RELIGIOUS', 'LEADER_MINOR_CIV_SCIENTIFIC', 'LEADER_MINOR_CIV_TRADE');

--INSERT INTO UnitAbilityModifiers(UnitAbilityType, ModifierId) VALUES
    --('ABILITY_HUSZAR', 'BBG_MODIFIER_HUSZAR_DISPLAY_MODIFIER');

DELETE FROM UnitAbilityModifiers WHERE ModifierId='HUSZAR_ALLIES_COMBAT_BONUS';

INSERT INTO ModifierStrings(ModifierId, Context, Text) 
    SELECT 'BBG_MODIFIER_HUSZAR_SUZ_' || LeaderType, 'Preview', '+{1_Amount} {LOC_ABILITY_HUSZAIR_COMBAT_PREVIEW} {'||Name||'}'
    FROM Leaders
    WHERE InheritFrom IN
        ('LEADER_MINOR_CIV_CULTURAL', 'LEADER_MINOR_CIV_INDUSTRIAL', 'LEADER_MINOR_CIV_MILITARISTIC',
        'LEADER_MINOR_CIV_RELIGIOUS', 'LEADER_MINOR_CIV_SCIENTIFIC', 'LEADER_MINOR_CIV_TRADE');


-- Get 2 envoy when levy a city-state if there are a t2 building in gouv plaza

--INSERT INTO RequirementSets(RequirementSetId, RequirementSetType) VALUES
--    ('BBG_REQUIREMENT_HAS_T2_GOUV_PLAZA', 'REQUIREMENTSET_TEST_ANY');
--
--INSERT INTO RequirementSetRequirements(RequirementSetId, RequirementId) VALUES
--    ('BBG_REQUIREMENT_HAS_T2_GOUV_PLAZA', 'PLAYER_HAS_GOV_BUILDING_CITYSTATES_REQUIREMENT'),
--    ('BBG_REQUIREMENT_HAS_T2_GOUV_PLAZA', 'PLAYER_HAS_GOV_BUILDING_FAITH_REQUIREMENT'),
--    ('BBG_REQUIREMENT_HAS_T2_GOUV_PLAZA', 'PLAYER_HAS_GOV_BUILDING_SPIES_REQUIREMENT');
--
--INSERT INTO Modifiers(ModifierId, ModifierType, OwnerRequirementSetId) VALUES
--    ('BBG_LEVY_MILITARY_FREE_ENVOYS_T2_GOUV_PLAZA', 'MODIFIER_PLAYER_ADJUST_ENVOYS_FROM_LEVIED_CITY_STATES', 'BBG_REQUIREMENT_HAS_T2_GOUV_PLAZA');
--
--INSERT INTO ModifierArguments(ModifierId, Name, Value) VALUES
--    ('BBG_LEVY_MILITARY_FREE_ENVOYS_T2_GOUV_PLAZA', 'Amount', '1');
--
--INSERT INTO TraitModifiers(TraitType, ModifierId) VALUES
--    ('TRAIT_LEADER_RAVEN_KING', 'BBG_LEVY_MILITARY_FREE_ENVOYS_T2_GOUV_PLAZA');