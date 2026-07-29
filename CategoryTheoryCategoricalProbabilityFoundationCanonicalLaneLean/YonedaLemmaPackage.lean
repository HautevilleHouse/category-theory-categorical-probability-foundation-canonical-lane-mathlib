import canonicalLaneMathlib.AdmissibleClass
import Mathlib.CategoryTheory.Yoneda

namespace HautevilleHouse
namespace CategoryTheoryCategoricalProbabilityFoundationCanonicalLaneLean

structure YonedaLemmaEvidence where
  fullyFaithfulYoneda : Prop
  naturalIso : Prop
  fullyFaithfulYonedaClosed : fullyFaithfulYoneda
  naturalIsoClosed : naturalIso

def YonedaLemmaClosed (E : YonedaLemmaEvidence) : Prop :=
  E.fullyFaithfulYoneda ∧ E.naturalIso

theorem yoneda_lemma_closed_from_evidence (E : YonedaLemmaEvidence) : YonedaLemmaClosed E :=
  And.intro E.fullyFaithfulYonedaClosed E.naturalIsoClosed

end CategoryTheoryCategoricalProbabilityFoundationCanonicalLaneLean
end HautevilleHouse