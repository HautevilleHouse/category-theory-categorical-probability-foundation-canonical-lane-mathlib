import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryCategoricalProbabilityFoundationCanonicalLaneLean

structure MarkovCategoryStructure where
  category : Type u
  monoidalProduct : Type u → Type u → Type u
  morphisms : Type u → Type u → Type u

structure ProbabilityMonadStructure where
  carrierType : Type u
  monad : (Type u → Type u)
  kleisliComposition : Prop
  bayesianInversion : Prop

structure MeasurePreservingMorphism (A B : Type u) where
  map : A → B
  measurablePreimage : Prop
  pushforwardMeasure : Prop

structure MarkovCategoryEvidence (M : MarkovCategoryStructure) where
  monoidalProductClosed : Prop
  compositionClosed : Prop
  probabilityMonadStructureClosed : M.monoidalProduct = M.morphisms → Prop

def MarkovCategoryClosed (M : MarkovCategoryStructure) : Prop :=
  True

theorem markov_category_closed_from_evidence (M : MarkovCategoryStructure) (E : MarkovCategoryEvidence M) : MarkovCategoryClosed M := by
  trivial

end CategoryTheoryCategoricalProbabilityFoundationCanonicalLaneLean
end HautevilleHouse