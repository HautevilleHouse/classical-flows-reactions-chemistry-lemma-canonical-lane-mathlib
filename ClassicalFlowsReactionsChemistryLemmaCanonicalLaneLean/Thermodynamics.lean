import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClassicalFlowsReactionsChemistryLemmaCanonicalLaneLean

abbrev Temperature := ℝ
abbrev Pressure := ℝ
abbrev Volume := ℝ
abbrev InternalEnergy := ℝ
abbrev Entropy := ℝ
abbrev GibbsFreeEnergy := ℝ

structure ThermodynamicState where
  temperature : Temperature
  pressure : Pressure
  volume : Volume
  internalEnergy : InternalEnergy
  entropy : Entropy
deriving Repr, DecidableEq

structure ThermodynamicProcess where
  initialState : ThermodynamicState
  finalState : ThermodynamicState
  heat : ℝ
  work : ℝ
deriving Repr, DecidableEq

structure ThermodynamicLaws where
  firstLaw : Prop
  secondLaw : Prop
  thirdLaw : Prop
deriving Repr, DecidableEq

def gibbsFreeEnergy (H : InternalEnergy) (T : Temperature) (S : Entropy) : GibbsFreeEnergy := H - T * S

def sourceThermodynamicState : ThermodynamicState := {
  temperature := 298.15
  pressure := 1.0
  volume := 24.5
  internalEnergy := 0.0
  entropy := 0.0
}

theorem gibbs_free_energy_formula (H : InternalEnergy) (T : Temperature) (S : Entropy) : gibbsFreeEnergy H T S = H - T * S := by
  rfl

end ClassicalFlowsReactionsChemistryLemmaCanonicalLaneLean
end HautevilleHouse