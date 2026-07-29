import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CategoryTheoryCategoricalProbabilityFoundationCanonicalLaneLean.CategoryTheoreticAdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryCategoricalProbabilityFoundationCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  A.object.bridgeCondition ∧ A.object.gateCondition

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end CategoryTheoryCategoricalProbabilityFoundationCanonicalLaneLean
end HautevilleHouse