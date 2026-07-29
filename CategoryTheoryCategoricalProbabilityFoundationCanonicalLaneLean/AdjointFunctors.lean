import CategoryTheoryCategoricalProbabilityFoundationCanonicalLaneLean.YonedaEmbedding

/-!
# Adjoint Functors Package
-/

namespace HautevilleHouse
namespace CategoryTheoryCategoricalProbabilityFoundationCanonicalLaneLean

structure AdjointFunctorsPackage {C : CategoryPackage} {D : CategoryPackage} where
  leftAdjoint : C.category → D.category
  rightAdjoint : D.category → C.category
  adjunctionIso : Prop
  unitNatural : Prop
  counitNatural : Prop
  triangleIdentities : Prop

structure AdjointFunctorsEvidence {C : CategoryPackage} {D : CategoryPackage} (A : AdjointFunctorsPackage C D) where
  leftAdjointClosed : A.leftAdjoint
  rightAdjointClosed : A.rightAdjoint
  adjunctionIsoClosed : A.adjunctionIso
  unitNaturalClosed : A.unitNatural
  counitNaturalClosed : A.counitNatural
  triangleIdentitiesClosed : A.triangleIdentities

def AdjointFunctorsClosed {C : CategoryPackage} {D : CategoryPackage} (A : AdjointFunctorsPackage C D) : Prop :=
  A.adjunctionIso ∧ A.unitNatural ∧ A.counitNatural ∧ A.triangleIdentities

theorem adjoint_functors_closed_from_evidence {C : CategoryPackage} {D : CategoryPackage} (A : AdjointFunctorsPackage C D) (E : AdjointFunctorsEvidence A) : AdjointFunctorsClosed A := by
  exact And.intro E.adjunctionIsoClosed (And.intro E.unitNaturalClosed (And.intro E.counitNaturalClosed E.triangleIdentitiesClosed))

end CategoryTheoryCategoricalProbabilityFoundationCanonicalLaneLean
end HautevilleHouse