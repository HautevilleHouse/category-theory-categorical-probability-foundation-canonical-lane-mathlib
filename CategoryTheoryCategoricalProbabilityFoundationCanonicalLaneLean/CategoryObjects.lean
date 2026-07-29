import canonicalLaneMathlib.AdmissibleClass
import Mathlib.CategoryTheory.Category.Basic

namespace HautevilleHouse
namespace CategoryTheoryCategoricalProbabilityFoundationCanonicalLaneLean

structure CategoricalAdmittedObject where
  carrier : Type u
  category : Category.{v} carrier
  probabilityStructure : Type w
  probabilityCategory : Category.{x} probabilityStructure
  bridgeClosed : Prop
  gateClosed : Prop
  bridgeWitness : bridgeClosed
  gateWitness : gateClosed

def CategoricalWitnessClosed (O : CategoricalAdmittedObject) : Prop :=
  O.bridgeClosed ∧ O.gateClosed

end CategoryTheoryCategoricalProbabilityFoundationCanonicalLaneLean
end HautevilleHouse