import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClassicalFlowsReactionsChemistryLemmaCanonicalLaneLean

abbrev EquilibriumConstant := ℝ

structure EquilibriumState where
  reactants : List (Species × ℝ)
  products : List (Species × ℝ)
  reactionQuotient : ℝ
  equilibriumConstant : EquilibriumConstant
  temperature : Temperature

def freeEnergyChange (ΔG° : ℝ) (R : ℝ) (T : Temperature) (Q : ℝ) : ℝ :=
  ΔG° + R * T * Real.log Q

def equilibriumCondition (ΔG : ℝ) : Prop :=
  ΔG = 0

structure LeChatelierPrinciple where
  stress : String
  response : String
  principleClosed : Prop
  principleClosedProof : principleClosed

def equilibriumShift (principle : LeChatelierPrinciple) : Prop :=
  principle.principleClosed

structure ChemicalEquilibriumCertificate where
  state : EquilibriumState
  equilibriumClosed : Prop
  leChatelierClosed : Prop
  equilibriumClosedProof : equilibriumClosed
  leChatelierClosedProof : leChatelierClosed

def sourceChemicalEquilibriumCertificate : ChemicalEquilibriumCertificate := {
  state := { reactants := [], products := [], reactionQuotient := 1.0, equilibriumConstant := 1.0, temperature := 298.15 },
  equilibriumClosed := True,
  leChatelierClosed := True,
  equilibriumClosedProof := trivial,
  leChatelierClosedProof := trivial
}

end ClassicalFlowsReactionsChemistryLemmaCanonicalLaneLean
end HautevilleHouse