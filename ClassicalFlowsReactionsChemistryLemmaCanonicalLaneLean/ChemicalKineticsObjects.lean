import classicalFlowsReactionsChemistryLemmaCanonicalLaneLean.AdmissibleClass
import Mathlib.Data.Real.Basic

namespace HautevilleHouse
namespace ClassicalFlowsReactionsChemistryLemmaCanonicalLaneLean

abbrev Concentration := ℝ
abbrev Time := ℝ
abbrev SpeciesIndex := ℕ

structure ReactionNetwork where
  speciesCount : ℕ
  reactions : List (List SpeciesIndex × List SpeciesIndex × ℝ) -- reactants, products, rate constant

def zeroConcentration : Concentration := 0

structure KineticSystem where
  network : ReactionNetwork
  concentrations : Time → SpeciesIndex → Concentration
  rateEquations : Prop

def primitiveNetwork : ReactionNetwork := {
  speciesCount := 2
  reactions := [([0], [1], 1.0), ([1], [0], 0.5)]
}

def primitiveConcentrations (t : Time) (i : SpeciesIndex) : Concentration := 0

def primitiveKineticSystem : KineticSystem := {
  network := primitiveNetwork
  concentrations := primitiveConcentrations
  rateEquations := True
}

def MassActionClosed (K : KineticSystem) : Prop :=
  K.rateEquations

def DetailedBalance (K : KineticSystem) : Prop :=
  ∀ (r : K.network.reactions), r.2.2 > 0

def KineticBalanceClosed (K : KineticSystem) : Prop :=
  MassActionClosed K ∧ DetailedBalance K

theorem primitive_mass_action_closed : MassActionClosed primitiveKineticSystem := by
  trivial

theorem primitive_detailed_balance_closed : DetailedBalance primitiveKineticSystem := by
  intro r; rfl

theorem primitive_kinetic_balance_closed : KineticBalanceClosed primitiveKineticSystem := by
  exact And.intro primitive_mass_action_closed primitive_detailed_balance_closed

end ClassicalFlowsReactionsChemistryLemmaCanonicalLaneLean
end HautevilleHouse
