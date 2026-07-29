import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryCategoricalProbabilityFoundationCanonicalLaneLean

structure CategoricalProbabilityObject where
  category : Type u
  markovKernelType : Type v
  probabilityMeasured : Prop
  compositionality : Prop
  conclusionProp : Prop

structure AdmissibleClass where
  object : CategoricalProbabilityObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

end CategoryTheoryCategoricalProbabilityFoundationCanonicalLaneLean
end HautevilleHouse