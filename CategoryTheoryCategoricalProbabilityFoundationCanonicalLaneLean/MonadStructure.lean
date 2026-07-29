import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryCategoricalProbabilityFoundationCanonicalLaneLean

structure MonadPackage (C : Type u) [Category C] where
  endofunctor : C ⥤ C
  unit : 𝟭 C ⟶ endofunctor
  multiplication : endofunctor ⋙ endofunctor ⟶ endofunctor
  associativity : Prop
  unitLeft : Prop
  unitRight : Prop

structure MonadEvidence {C : Type u} [Category C] (M : MonadPackage C) where
  associativityClosed : M.associativity
  unitLeftClosed : M.unitLeft
  unitRightClosed : M.unitRight

def MonadClosed {C : Type u} [Category C] (M : MonadPackage C) : Prop :=
  M.associativity ∧ M.unitLeft ∧ M.unitRight

theorem monad_closed_from_evidence {C : Type u} [Category C] (M : MonadPackage C)
    (E : MonadEvidence M) : MonadClosed M := by
  exact And.intro E.associativityClosed
    (And.intro E.unitLeftClosed E.unitRightClosed)

end CategoryTheoryCategoricalProbabilityFoundationCanonicalLaneLean
end HautevilleHouse