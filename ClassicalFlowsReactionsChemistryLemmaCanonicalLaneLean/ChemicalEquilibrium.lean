import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClassicalFlowsReactionsChemistryLemmaCanonicalLaneLean

abbrev EquilibriumConstant := ℝ
abbrev ReactionQuotient := ℝ
abbrev StandardGibbsFreeEnergy := ℝ

structure ChemicalReaction where
  stoichiometry : List (Species × ℝ)
  equilibriumConstant : EquilibriumConstant
deriving Repr, DecidableEq

structure EquilibriumCondition where
  reaction : ChemicalReaction
  quotient : ReactionQuotient
  standardGibbs : StandardGibbsFreeEnergy
  isSatisfied : Prop
deriving Repr, DecidableEq

def equilibriumConstantFromGibbs (dG : StandardGibbsFreeEnergy) (R : ℝ) (T : Temperature) : EquilibriumConstant := Real.exp (-dG / (R * T))

structure LeChatelierPrinciple where
  disturbance : String
  shift : String
deriving Repr, DecidableEq

def sourceChemicalReaction : ChemicalReaction := {
  stoichiometry := [("A", -1), ("B", -1), ("C", 1), ("D", 1)]
  equilibriumConstant := 4.0
}

theorem equilibrium_constant_positive : sourceChemicalReaction.equilibriumConstant > 0 := by
  norm_num

end ClassicalFlowsReactionsChemistryLemmaCanonicalLaneLean
end HautevilleHouse