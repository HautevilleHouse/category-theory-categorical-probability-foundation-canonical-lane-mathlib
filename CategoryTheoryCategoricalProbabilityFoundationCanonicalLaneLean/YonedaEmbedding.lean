import CategoryTheoryCategoricalProbabilityFoundationCanonicalLaneLean.Limits

/-!
# Yoneda Embedding Package
-/

namespace HautevilleHouse
namespace CategoryTheoryCategoricalProbabilityFoundationCanonicalLaneLean

structure YonedaEmbeddingPackage {C : CategoryPackage} where
  yonedaFunctorDefined : Prop
  fullyFaithful : Prop
  representablePresheaves : Prop
  naturalityCondition : Prop
  embeddingClosed : Prop

structure YonedaEmbeddingEvidence {C : CategoryPackage} (Y : YonedaEmbeddingPackage C) where
  yonedaFunctorDefinedClosed : Y.yonedaFunctorDefined
  fullyFaithfulClosed : Y.fullyFaithful
  representablePresheavesClosed : Y.representablePresheaves
  naturalityConditionClosed : Y.naturalityCondition
  embeddingClosedClosed : Y.embeddingClosed

def YonedaEmbeddingClosed {C : CategoryPackage} (Y : YonedaEmbeddingPackage C) : Prop :=
  Y.yonedaFunctorDefined ∧ Y.fullyFaithful ∧ Y.representablePresheaves ∧ Y.naturalityCondition ∧ Y.embeddingClosed

theorem yoneda_embedding_closed_from_evidence {C : CategoryPackage} (Y : YonedaEmbeddingPackage C) (E : YonedaEmbeddingEvidence Y) : YonedaEmbeddingClosed Y := by
  exact And.intro E.yonedaFunctorDefinedClosed (And.intro E.fullyFaithfulClosed (And.intro E.representablePresheavesClosed (And.intro E.naturalityConditionClosed E.embeddingClosedClosed)))

end CategoryTheoryCategoricalProbabilityFoundationCanonicalLaneLean
end HautevilleHouse