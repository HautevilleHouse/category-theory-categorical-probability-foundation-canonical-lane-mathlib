import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CategoryTheoryCategoricalProbabilityFoundationCanonicalLaneLean.GiryMonad

namespace HautevilleHouse
namespace CategoryTheoryCategoricalProbabilityFoundationCanonicalLaneLean

structure KleisliCategory (G : GiryMonad) where
  object : Type u → Type u
  morphism : ∀ (X Y : Type u), (X → G.carrier Y) → Prop
  identity : ∀ (X : Type u), X → G.carrier X
  composition : ∀ (X Y Z : Type u) (f : X → G.carrier Y) (g : Y → G.carrier Z), X → G.carrier Z
  identityLeft : ∀ X Y (f : X → G.carrier Y), composition X X Y (identity X) f = f
  identityRight : ∀ X Y (f : X → G.carrier Y), composition X Y Y f (identity Y) = f
  associative : ∀ X Y Z W (f : X → G.carrier Y) (g : Y → G.carrier Z) (h : Z → G.carrier W), composition X Z W (composition X Y Z f g) h = composition X Y W f (λ x => composition Y Z W (g x) h)

structure KleisliCategoryEvidence (G : GiryMonad) (K : KleisliCategory G) where
  identityLeftClosed : ∀ X Y (f : X → G.carrier Y), K.composition X X Y (K.identity X) f = f
  identityRightClosed : ∀ X Y (f : X → G.carrier Y), K.composition X Y Y f (K.identity Y) = f
  associativeClosed : ∀ X Y Z W (f : X → G.carrier Y) (g : Y → G.carrier Z) (h : Z → G.carrier W), K.composition X Z W (K.composition X Y Z f g) h = K.composition X Y W f (λ x => K.composition Y Z W (g x) h)

def KleisliCategoryClosed (G : GiryMonad) (K : KleisliCategory G) : Prop :=
  (∀ X Y (f : X → G.carrier Y), K.composition X X Y (K.identity X) f = f) ∧
  (∀ X Y (f : X → G.carrier Y), K.composition X Y Y f (K.identity Y) = f) ∧
  (∀ X Y Z W (f : X → G.carrier Y) (g : Y → G.carrier Z) (h : Z → G.carrier W), K.composition X Z W (K.composition X Y Z f g) h = K.composition X Y W f (λ x => K.composition Y Z W (g x) h))

theorem kleisli_category_closed_from_evidence (G : GiryMonad) (K : KleisliCategory G) (E : KleisliCategoryEvidence G K) : KleisliCategoryClosed G K := by
  exact And.intro E.identityLeftClosed (And.intro E.identityRightClosed E.associativeClosed)

end CategoryTheoryCategoricalProbabilityFoundationCanonicalLaneLean
end HautevilleHouse