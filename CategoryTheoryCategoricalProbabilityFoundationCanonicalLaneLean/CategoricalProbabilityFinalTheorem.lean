import HautevilleHouse.CategoryTheoryCategoricalProbabilityFoundationCanonicalLaneLean.CategoricalProbabilityGateLemmas

namespace HautevilleHouse
namespace CategoryTheoryCategoricalProbabilityFoundationCanonicalLaneLean

def ConstrainedCategoryProbabilityClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_category_probability_endgame (A : AdmissibleClass) :
    ConstrainedCategoryProbabilityClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end CategoryTheoryCategoricalProbabilityFoundationCanonicalLaneLean
end HautevilleHouse