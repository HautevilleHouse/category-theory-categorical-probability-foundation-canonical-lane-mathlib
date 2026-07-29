import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryCategoricalProbabilityFoundationCanonicalLaneLean

structure LimitsPackage (C : Type u) [Category C] where
  hasLimits : Prop
  hasColimits : Prop
  limitConstruction : Prop
  colimitConstruction : Prop
  universalProperty : Prop

structure LimitsEvidence {C : Type u} [Category C] (L : LimitsPackage C) where
  hasLimitsClosed : L.hasLimits
  hasColimitsClosed : L.hasColimits
  limitConstructionClosed : L.limitConstruction
  colimitConstructionClosed : L.colimitConstruction
  universalPropertyClosed : L.universalProperty

def LimitsClosed {C : Type u} [Category C] (L : LimitsPackage C) : Prop :=
  L.hasLimits ∧ L.hasColimits ∧ L.limitConstruction ∧ L.colimitConstruction ∧ L.universalProperty

theorem limits_closed_from_evidence {C : Type u} [Category C] (L : LimitsPackage C)
    (E : LimitsEvidence L) : LimitsClosed L := by
  exact And.intro E.hasLimitsClosed
    (And.intro E.hasColimitsClosed
      (And.intro E.limitConstructionClosed
        (And.intro E.colimitConstructionClosed E.universalPropertyClosed)))

end CategoryTheoryCategoricalProbabilityFoundationCanonicalLaneLean
end HautevilleHouse