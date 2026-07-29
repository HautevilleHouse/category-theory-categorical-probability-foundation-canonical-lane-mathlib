import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryCategoricalProbabilityFoundationCanonicalLaneLean

structure CategoricalProbabilityPackage (C : Type u) [Category C] where
  markovCategory : Prop
  comonadStructure : Prop
  disintegration : Prop
  bayesRule : Prop
  conditionalExpectation : Prop

structure CategoricalProbabilityEvidence {C : Type u} [Category C]
    (P : CategoricalProbabilityPackage C) where
  markovCategoryClosed : P.markovCategory
  comonadStructureClosed : P.comonadStructure
  disintegrationClosed : P.disintegration
  bayesRuleClosed : P.bayesRule
  conditionalExpectationClosed : P.conditionalExpectation

def CategoricalProbabilityClosed {C : Type u} [Category C]
    (P : CategoricalProbabilityPackage C) : Prop :=
  P.markovCategory ∧ P.comonadStructure ∧ P.disintegration ∧ P.bayesRule ∧ P.conditionalExpectation

theorem categorical_probability_closed_from_evidence {C : Type u} [Category C]
    (P : CategoricalProbabilityPackage C) (E : CategoricalProbabilityEvidence P) :
    CategoricalProbabilityClosed P := by
  exact And.intro E.markovCategoryClosed
    (And.intro E.comonadStructureClosed
      (And.intro E.disintegrationClosed
        (And.intro E.bayesRuleClosed E.conditionalExpectationClosed)))

end CategoryTheoryCategoricalProbabilityFoundationCanonicalLaneLean
end HautevilleHouse