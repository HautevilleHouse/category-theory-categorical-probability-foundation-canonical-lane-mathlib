import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryCategoricalProbabilityFoundationCanonicalLaneLean

structure AdjointFunctorPackage (C D : Type u) [Category C] [Category D] where
  leftAdjoint : C ⥤ D
  rightAdjoint : D ⥤ C
  adjunctionIso : Prop
  unitCounit : Prop
  universalProperty : Prop

structure AdjointFunctorEvidence {C D : Type u} [Category C] [Category D]
    (A : AdjointFunctorPackage C D) where
  adjunctionIsoClosed : A.adjunctionIso
  unitCounitClosed : A.unitCounit
  universalPropertyClosed : A.universalProperty

def AdjointFunctorClosed {C D : Type u} [Category C] [Category D]
    (A : AdjointFunctorPackage C D) : Prop :=
  A.adjunctionIso ∧ A.unitCounit ∧ A.universalProperty

theorem adjoint_functor_closed_from_evidence {C D : Type u} [Category C] [Category D]
    (A : AdjointFunctorPackage C D) (E : AdjointFunctorEvidence A) :
    AdjointFunctorClosed A := by
  exact And.intro E.adjunctionIsoClosed
    (And.intro E.unitCounitClosed E.universalPropertyClosed)

end CategoryTheoryCategoricalProbabilityFoundationCanonicalLaneLean
end HautevilleHouse