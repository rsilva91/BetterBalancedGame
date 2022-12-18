-- Created by iElden

UPDATE Modifiers SET SubjectRequirementSetId='BBG_ZULU_MOBILISATION_REQUIREMENTS' WHERE ModifierId='TRAIT_LAND_CORPS_COMBAT_STRENGTH';
UPDATE Modifiers SET SubjectRequirementSetId='BBG_ZULU_MOBILISATION_REQUIREMENTS' WHERE ModifierId='TRAIT_LAND_ARMIES_COMBAT_STRENGTH';

INSERT INTO TraitModifiers(TraitType, ModifierId) VALUES
    ('TRAIT_LEADER_AMABUTHO', 'BBG_LAND_CORPS_COMBAT_STRENGTH_NATIONALISM'),
    ('TRAIT_LEADER_AMABUTHO', 'BBG_LAND_ARMIES_COMBAT_STRENGTH_NATIONALISM');

INSERT INTO Modifiers(ModifierId, ModifierType, SubjectRequirementSetId) VALUES
    ('BBG_LAND_CORPS_COMBAT_STRENGTH_NATIONALISM', 'MODIFIER_PLAYER_CORPS_ARMY_MODIFIED_STRENGTH', 'BBG_ZULU_NATIONALISM_REQUIREMENTS'),
    ('BBG_LAND_ARMIES_COMBAT_STRENGTH_NATIONALISM', 'MODIFIER_PLAYER_CORPS_ARMY_MODIFIED_STRENGTH', 'BBG_ZULU_NATIONALISM_REQUIREMENTS');

INSERT INTO ModifierArguments(ModifierId, Name, Value) VALUES
    ('BBG_LAND_CORPS_COMBAT_STRENGTH_NATIONALISM', 'Corps', '1'),
    ('BBG_LAND_CORPS_COMBAT_STRENGTH_NATIONALISM', 'Domain', 'DOMAIN_LAND'),
    ('BBG_LAND_CORPS_COMBAT_STRENGTH_NATIONALISM', 'Amount', '3'),
    ('BBG_LAND_ARMIES_COMBAT_STRENGTH_NATIONALISM', 'Corps', '0'),
    ('BBG_LAND_ARMIES_COMBAT_STRENGTH_NATIONALISM', 'Domain', 'DOMAIN_LAND'),
    ('BBG_LAND_ARMIES_COMBAT_STRENGTH_NATIONALISM', 'Amount', '3');

INSERT INTO RequirementSets(RequirementSetId , RequirementSetType) VALUES
	('BBG_ZULU_NATIONALISM_REQUIREMENTS' , 'REQUIREMENTSET_TEST_ALL'),
	('BBG_ZULU_MOBILISATION_REQUIREMENTS' , 'REQUIREMENTSET_TEST_ALL');

INSERT INTO RequirementSetRequirements(RequirementSetId , RequirementId) VALUES
	('BBG_ZULU_NATIONALISM_REQUIREMENTS', 'BBG_PLAYER_HAS_NATIONALISM_REQUIREMENT'),
	('BBG_ZULU_NATIONALISM_REQUIREMENTS', 'BBG_PLAYER_HAS_NOT_MOBILISATION_REQUIREMENT'),
	('BBG_ZULU_MOBILISATION_REQUIREMENTS', 'BBG_PLAYER_HAS_MOBILISATION_REQUIREMENT');

INSERT INTO Requirements(RequirementId , RequirementType, Inverse) VALUES
	('BBG_PLAYER_HAS_NATIONALISM_REQUIREMENT' , 'REQUIREMENT_PLAYER_HAS_CIVIC', 0),
	('BBG_PLAYER_HAS_MOBILISATION_REQUIREMENT' , 'REQUIREMENT_PLAYER_HAS_CIVIC', 0),
	('BBG_PLAYER_HAS_NOT_MOBILISATION_REQUIREMENT' , 'REQUIREMENT_PLAYER_HAS_CIVIC', 1);

INSERT INTO RequirementArguments(RequirementId , Name, Value) VALUES
	('BBG_PLAYER_HAS_NATIONALISM_REQUIREMENT' , 'CivicType', 'CIVIC_NATIONALISM'),
	('BBG_PLAYER_HAS_MOBILISATION_REQUIREMENT' , 'CivicType', 'CIVIC_MOBILIZATION'),
	('BBG_PLAYER_HAS_NOT_MOBILISATION_REQUIREMENT' , 'CivicType', 'CIVIC_MOBILIZATION');

-- 16/05/2021: Replace Science Yield by Culture Yield
UPDATE ModifierArguments SET Value='YIELD_CULTURE' WHERE Name='YieldType' AND ModifierID IN
    ('TRAIT_IKANDA_BARRACKS_SCIENCE', 'TRAIT_IKANDA_STABLE_SCIENCE', 'TRAIT_IKANDA_ARMORY_SCIENCE', 'TRAIT_IKANDA_MILITARY_ACADEMY_SCIENCE');