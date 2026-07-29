import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CategoryTheoryCategoricalProbabilityFoundationCanonicalLaneLean.StochasticKernelCategory

namespace HautevilleHouse
namespace CategoryTheoryCategoricalProbabilityFoundationCanonicalLaneLean

structure MarkovCategory extends StochasticKernelCategory where
  copyMap : ∀ (X : object), morphism X (tensor X X)
  discardMap : ∀ (X : object), morphism X terminal
  copyingAndDiscarding : Prop
  comonoidLaws : Prop

structure MarkovCategoryEvidence (C : MarkovCategory) where
  copyMapClosed : ∀ X, C.copyMap X = C.copyMap X
  discardMapClosed : ∀ X, C.discardMap X = C.discardMap X
  copyingAndDiscardingClosed : C.copyingAndDiscarding
  comonoidLawsClosed : C.comonoidLaws

def MarkovCategoryClosed (C : MarkovCategory) : Prop :=
  C.copyingAndDiscarding ∧ C.comonoidLaws

theorem markov_category_closed_from_evidence (C : MarkovCategory) (E : MarkovCategoryEvidence C) : MarkovCategoryClosed C := by
  exact And.intro E.copyingAndDiscardingClosed E.comonoidLawsClosed

end CategoryTheoryCategoricalProbabilityFoundationCanonicalLaneLean
end HautevilleHouse