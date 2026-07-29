import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryCategoricalProbabilityFoundationCanonicalLaneLean

structure YonedaPackage (C : Type u) [Category C] where
  presheafCat : Type v
  yonedaEmbedding : C ⥤ presheafCat
  yonedaLemma : Prop
  naturalityCondition : Prop
  representableFunctor : C ⥤ Type (max u v)

structure YonedaEvidence {C : Type u} [Category C] (Y : YonedaPackage C) where
  yonedaLemmaClosed : Y.yonedaLemma
  naturalityConditionClosed : Y.naturalityCondition

def YonedaClosed {C : Type u} [Category C] (Y : YonedaPackage C) : Prop :=
  Y.yonedaLemma ∧ Y.naturalityCondition

theorem yoneda_closed_from_evidence {C : Type u} [Category C] (Y : YonedaPackage C)
    (E : YonedaEvidence Y) : YonedaClosed Y := by
  exact And.intro E.yonedaLemmaClosed E.naturalityConditionClosed

end CategoryTheoryCategoricalProbabilityFoundationCanonicalLaneLean
end HautevilleHouse