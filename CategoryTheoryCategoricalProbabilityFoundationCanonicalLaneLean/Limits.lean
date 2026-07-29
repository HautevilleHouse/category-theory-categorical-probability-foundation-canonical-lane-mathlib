import CategoryTheoryCategoricalProbabilityFoundationCanonicalLaneLean.AdjointFunctors

/-!
# Limits and Colimits Package
-/

namespace HautevilleHouse
namespace CategoryTheoryCategoricalProbabilityFoundationCanonicalLaneLean

structure LimitsColimitsPackage {C : CategoryPackage} where
  limitExists : Prop
  colimitExists : Prop
  universalProperty : Prop
  coneCondition : Prop
  coconeCondition : Prop

structure LimitsColimitsEvidence {C : CategoryPackage} (L : LimitsColimitsPackage C) where
  limitExistsClosed : L.limitExists
  colimitExistsClosed : L.colimitExists
  universalPropertyClosed : L.universalProperty
  coneConditionClosed : L.coneCondition
  coconeConditionClosed : L.coconeCondition

def LimitsColimitsClosed {C : CategoryPackage} (L : LimitsColimitsPackage C) : Prop :=
  L.limitExists ∧ L.colimitExists ∧ L.universalProperty ∧ L.coneCondition ∧ L.coconeCondition

theorem limits_colimits_closed_from_evidence {C : CategoryPackage} (L : LimitsColimitsPackage C) (E : LimitsColimitsEvidence L) : LimitsColimitsClosed L := by
  exact And.intro E.limitExistsClosed (And.intro E.colimitExistsClosed (And.intro E.universalPropertyClosed (And.intro E.coneConditionClosed E.coconeConditionClosed)))

end CategoryTheoryCategoricalProbabilityFoundationCanonicalLaneLean
end HautevilleHouse