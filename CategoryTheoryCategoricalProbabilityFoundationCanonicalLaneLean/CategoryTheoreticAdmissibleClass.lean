import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryCategoricalProbabilityFoundationCanonicalLaneLean

structure CategoryAdmittedObject where
  source : Type u
  categoricalStructure : Type v
  probabilityStructure : Type w
  bridgeCondition : Prop
  gateCondition : Prop
  conclusion : bridgeCondition ∧ gateCondition

structure AdmissibleClass where
  object : CategoryAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  (A.object.bridgeCondition ∧ A.object.gateCondition) ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end CategoryTheoryCategoricalProbabilityFoundationCanonicalLaneLean
end HautevilleHouse