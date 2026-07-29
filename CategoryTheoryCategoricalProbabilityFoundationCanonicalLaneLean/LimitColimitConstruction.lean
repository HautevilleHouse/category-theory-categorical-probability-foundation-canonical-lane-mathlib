import canonicalLaneMathlib.AdmissibleClass
import Mathlib.CategoryTheory.Limits.Shapes.Terminal

namespace HautevilleHouse
namespace CategoryTheoryCategoricalProbabilityFoundationCanonicalLaneLean

structure LimitColimitEvidence where
  limitExists : Prop
  colimitExists : Prop
  limitUnique : Prop
  colimitUnique : Prop
  limitExistsClosed : limitExists
  colimitExistsClosed : colimitExists
  limitUniqueClosed : limitUnique
  colimitUniqueClosed : colimitUnique

def LimitColimitClosed (E : LimitColimitEvidence) : Prop :=
  E.limitExists ∧ E.colimitExists ∧ E.limitUnique ∧ E.colimitUnique

theorem limit_colimit_closed_from_evidence (E : LimitColimitEvidence) : LimitColimitClosed E :=
  And.intro E.limitExistsClosed (And.intro E.colimitExistsClosed (And.intro E.limitUniqueClosed E.colimitUniqueClosed))

end CategoryTheoryCategoricalProbabilityFoundationCanonicalLaneLean
end HautevilleHouse