import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryCategoricalProbabilityFoundationCanonicalLaneLean

structure AdjunctionStructure where
  leftAdjoint : Type u → Type u
  rightAdjoint : Type u → Type u
  unit : Prop
  counit : Prop
  triangleIdentities : Prop

structure AdjunctionEvidence (A : AdjunctionStructure) where
  unitClosed : A.unit
  counitClosed : A.counit
  triangleIdentitiesClosed : A.triangleIdentities

def AdjunctionClosed (A : AdjunctionStructure) : Prop :=
  A.unit ∧ A.counit ∧ A.triangleIdentities

theorem adjunction_closed_from_evidence (A : AdjunctionStructure) (E : AdjunctionEvidence A) : AdjunctionClosed A := by
  exact And.intro E.unitClosed (And.intro E.counitClosed E.triangleIdentitiesClosed)

end CategoryTheoryCategoricalProbabilityFoundationCanonicalLaneLean
end HautevilleHouse