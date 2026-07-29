import canonicalLaneMathlib.AdmissibleClass
import Mathlib.CategoryTheory.Monad.Basic

namespace HautevilleHouse
namespace CategoryTheoryCategoricalProbabilityFoundationCanonicalLaneLean

structure GiryMonad where
  carrier : Type u → Type u
  unit : ∀ (X : Type u), X → carrier X
  bind : ∀ (X Y : Type u), carrier X → (X → carrier Y) → carrier Y
  leftUnit : ∀ X Y (x : X) (f : X → carrier Y), bind X Y (unit X x) f = f x
  rightUnit : ∀ X (mx : carrier X), bind X X mx (unit X) = mx
  associativity : ∀ X Y Z (mx : carrier X) (f : X → carrier Y) (g : Y → carrier Z), bind X Z mx (λ x => bind Y Z (f x) g) = bind Y Z (bind X Y mx f) g
  measureExtensionality : Prop

structure GiryMonadEvidence (G : GiryMonad) where
  leftUnitClosed : ∀ X Y (x : X) (f : X → G.carrier Y), G.bind X Y (G.unit X x) f = f x
  rightUnitClosed : ∀ X (mx : G.carrier X), G.bind X X mx (G.unit X) = mx
  associativityClosed : ∀ X Y Z (mx : G.carrier X) (f : X → G.carrier Y) (g : Y → G.carrier Z), G.bind X Z mx (λ x => G.bind Y Z (f x) g) = G.bind Y Z (G.bind X Y mx f) g
  measureExtensionalityClosed : G.measureExtensionality

def GiryMonadClosed (G : GiryMonad) : Prop :=
  (∀ X Y (x : X) (f : X → G.carrier Y), G.bind X Y (G.unit X x) f = f x) ∧
  (∀ X (mx : G.carrier X), G.bind X X mx (G.unit X) = mx) ∧
  (∀ X Y Z (mx : G.carrier X) (f : X → G.carrier Y) (g : Y → G.carrier Z), G.bind X Z mx (λ x => G.bind Y Z (f x) g) = G.bind Y Z (G.bind X Y mx f) g) ∧
  G.measureExtensionality

theorem giry_monad_closed_from_evidence (G : GiryMonad) (E : GiryMonadEvidence G) : GiryMonadClosed G := by
  exact And.intro E.leftUnitClosed (And.intro E.rightUnitClosed (And.intro E.associativityClosed E.measureExtensionalityClosed))

end CategoryTheoryCategoricalProbabilityFoundationCanonicalLaneLean
end HautevilleHouse