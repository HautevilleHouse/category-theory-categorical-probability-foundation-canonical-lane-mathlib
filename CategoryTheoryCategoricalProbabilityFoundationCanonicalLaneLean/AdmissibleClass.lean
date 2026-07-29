import CategoryTheoryCategoricalProbabilityFoundationCanonicalLaneLean.TheoremStatement
import CanonicalLaneMathlibCore
import Mathlib.Topology.Basic

namespace HautevilleHouse
namespace CategoryTheoryCategoricalProbabilityFoundationCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure CategoryObject where
  carrier : Type
  categoryStructure : Prop

structure CategoricalAdmittedObject where
  object : CategoryObject
  universalConstruction : Prop
  adjointFunctorExists : Prop
  limitColimitExist : Prop
  yonedaEmbedding : Prop
  conclusion : yonedaEmbedding

structure CategoricalEndgameState where
  object : CategoricalAdmittedObject

def CategoricalWitnessClosed (O : CategoricalAdmittedObject) : Prop :=
  O.yonedaEmbedding

end CategoryTheoryCategoricalProbabilityFoundationCanonicalLaneLean
end HautevilleHouse