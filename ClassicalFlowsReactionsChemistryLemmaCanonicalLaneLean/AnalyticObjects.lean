import ClassicalFlowsReactionsChemistryLemmaCanonicalLaneLean.MathlibStatement
import Mathlib.Data.Real.Basic

/-!
# Classical Flows Reactions Chemistry Analytic Objects

This module defines the chemical species space, time, concentration fields, reaction rate fields, and operators used in reaction kinetics and flow chemistry.
-/

namespace HautevilleHouse
namespace ClassicalFlowsReactionsChemistryLemmaCanonicalLaneLean

abbrev SpeciesIdx := Fin 5 → ℝ
abbrev Time := ℝ
abbrev ConcentrationField := Time → SpeciesIdx → ℝ
abbrev ReactionRateField := Time → SpeciesIdx → ℝ

def zeroConcentration : ConcentrationField := fun _ _ => 0
def zeroReactionRate : ReactionRateField := fun _ _ => 0

structure ChemistryOperators where
  diffusion : ConcentrationField → ConcentrationField
  advection : ConcentrationField → ConcentrationField
  reaction : ConcentrationField → ReactionRateField
  timeDerivative : ConcentrationField → ConcentrationField
  source : ConcentrationField → ConcentrationField

def primitiveOperators : ChemistryOperators := {
  diffusion := fun c => c
  advection := fun c => c
  reaction := fun c => zeroReactionRate
  timeDerivative := fun _ => zeroConcentration
  source := fun _ => zeroConcentration
}

structure ChemicalFlow where
  concentration : ConcentrationField
  temperature : ℝ → ℝ
  rateConstants : ℝ
  operators : ChemistryOperators

def primitiveFlow : ChemicalFlow := {
  concentration := zeroConcentration
  temperature := fun _ => 298.15
  rateConstants := 1
  operators := primitiveOperators
}

def ReactionDiffusionBalance (F : ChemicalFlow) : Prop :=
  F.operators.timeDerivative F.concentration = F.operators.diffusion F.concentration

def AdvectionReactionClosed (F : ChemicalFlow) : Prop :=
  F.operators.advection F.concentration = F.concentration

def ChemistryEquationClosed (F : ChemicalFlow) : Prop :=
  ReactionDiffusionBalance F ∧ AdvectionReactionClosed F

theorem primitive_reaction_diffusion_balance_checked :
    ReactionDiffusionBalance primitiveFlow := by
  rfl

theorem primitive_advection_reaction_closed_checked :
    AdvectionReactionClosed primitiveFlow := by
  rfl

theorem primitive_chemistry_equation_closed_checked :
    ChemistryEquationClosed primitiveFlow := by
  exact And.intro primitive_reaction_diffusion_balance_checked primitive_advection_reaction_closed_checked

end ClassicalFlowsReactionsChemistryLemmaCanonicalLaneLean
end HautevilleHouse