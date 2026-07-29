import classicalFlowsReactionsChemistryLemmaCanonicalLaneLean.MolecularOrbitalLayer

namespace HautevilleHouse
namespace ClassicalFlowsReactionsChemistryLemmaCanonicalLaneLean

def ConstrainedChemistryClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_chemistry_endgame (A : AdmissibleClass) : ConstrainedChemistryClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end ClassicalFlowsReactionsChemistryLemmaCanonicalLaneLean
end HautevilleHouse
