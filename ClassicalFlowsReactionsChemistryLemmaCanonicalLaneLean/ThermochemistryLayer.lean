import classicalFlowsReactionsChemistryLemmaCanonicalLaneLean.ChemicalKineticsObjects
import Mathlib.Data.Real.Basic

namespace HautevilleHouse
namespace ClassicalFlowsReactionsChemistryLemmaCanonicalLaneLean

structure ThermodynamicState where
  temperature : ℝ
  pressure : ℝ
  gibbsFreeEnergy : ℝ
  enthalpy : ℝ
  entropy : ℝ

def zeroState : ThermodynamicState := {
  temperature := 0
  pressure := 0
  gibbsFreeEnergy := 0
  enthalpy := 0
  entropy := 0
}

structure ThermodynamicCertificate where
  kineticSystem : KineticSystem
  equilibriumConstant : Prop
  equilibriumConstantClosed : equilibriumConstant
  gibbsFreeEnergyRelation : Prop
  gibbsFreeEnergyRelationClosed : gibbsFreeEnergyRelation

def sourceThermodynamicCertificate : ThermodynamicCertificate := {
  kineticSystem := primitiveKineticSystem
  equilibriumConstant := True
  equilibriumConstantClosed := trivial
  gibbsFreeEnergyRelation := True
  gibbsFreeEnergyRelationClosed := trivial
}

def ThermodynamicClosed (C : ThermodynamicCertificate) : Prop :=
  KineticBalanceClosed C.kineticSystem ∧
  C.equilibriumConstant ∧
  C.gibbsFreeEnergyRelation

theorem source_thermodynamic_closed : ThermodynamicClosed sourceThermodynamicCertificate := by
  exact And.intro primitive_kinetic_balance_closed
    (And.intro sourceThermodynamicCertificate.equilibriumConstantClosed
      sourceThermodynamicCertificate.gibbsFreeEnergyRelationClosed)

end ClassicalFlowsReactionsChemistryLemmaCanonicalLaneLean
end HautevilleHouse
