import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryCategoricalProbabilityFoundationCanonicalLaneLean

structure StochasticKernelCategory (M N : Type u) where
  object : Type u
  morphism : Type v
  composition : morphism → morphism → morphism
  identity : object → morphism
  associative : Prop
  leftIdentity : Prop
  rightIdentity : Prop
  kernelLaws : Prop

structure StochasticKernel {C : StochasticKernelCategory} (X Y : C.object) where
  kernel : C.morphism
  source : X
  target : Y

end CategoryTheoryCategoricalProbabilityFoundationCanonicalLaneLean
end HautevilleHouse