import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CategoryTheoryCategoricalProbabilityFoundationCanonicalLaneLean.MarkovCategory

namespace HautevilleHouse
namespace CategoryTheoryCategoricalProbabilityFoundationCanonicalLaneLean

structure BayesianInversion (C : MarkovCategory) (X Y : C.object) where
  prior : C.morphism terminal X
  likelihood : C.morphism X Y
  posterior : C.morphism Y X
  bayesRule : (prior ; likelihood) = (posterior ; likelihood) ∧ (posterior ; likelihood) = (prior ; likelihood)
  inversionLaws : Prop

structure BayesianInversionEvidence (C : MarkovCategory) (X Y : C.object) (B : BayesianInversion C X Y) where
  bayesRuleClosed : B.bayesRule
  inversionLawsClosed : B.inversionLaws

def BayesianInversionClosed (C : MarkovCategory) (X Y : C.object) (B : BayesianInversion C X Y) : Prop :=
  B.bayesRule ∧ B.inversionLaws

theorem bayesian_inversion_closed_from_evidence (C : MarkovCategory) (X Y : C.object) (B : BayesianInversion C X Y) (E : BayesianInversionEvidence C X Y B) : BayesianInversionClosed C X Y B := by
  exact And.intro E.bayesRuleClosed E.inversionLawsClosed

end CategoryTheoryCategoricalProbabilityFoundationCanonicalLaneLean
end HautevilleHouse