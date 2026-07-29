import canonicalLaneMathlib.AdmissibleClass
import Mathlib.CategoryTheory.Adjunction.Basic

namespace HautevilleHouse
namespace CategoryTheoryCategoricalProbabilityFoundationCanonicalLaneLean

structure AdjointFunctorEvidence where
  leftAdjointExists : Prop
  rightAdjointExists : Prop
  adjunctionIso : Prop
  leftAdjointExistsClosed : leftAdjointExists
  rightAdjointExistsClosed : rightAdjointExists
  adjunctionIsoClosed : adjunctionIso

def AdjointFunctorClosed (E : AdjointFunctorEvidence) : Prop :=
  E.leftAdjointExists ∧ E.rightAdjointExists ∧ E.adjunctionIso

theorem adjoint_functor_closed_from_evidence (E : AdjointFunctorEvidence) : AdjointFunctorClosed E :=
  And.intro E.leftAdjointExistsClosed (And.intro E.rightAdjointExistsClosed E.adjunctionIsoClosed)

end CategoryTheoryCategoricalProbabilityFoundationCanonicalLaneLean
end HautevilleHouse