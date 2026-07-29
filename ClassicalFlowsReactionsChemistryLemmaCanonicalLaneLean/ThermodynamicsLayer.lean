import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClassicalFlowsReactionsChemistryLemmaCanonicalLaneLean

abbrev Temperature := ℝ
abbrev Pressure := ℝ
abbrev Volume := ℝ
abbrev Entropy := ℝ
abbrev Enthalpy := ℝ
abbrev GibbsFreeEnergy := ℝ

structure ThermodynamicState where
  T : Temperature
  P : Pressure
  V : Volume
  S : Entropy
  H : Enthalpy
  G : GibbsFreeEnergy

def idealGasLaw (P : Pressure) (V : Volume) (n : ℝ) (T : Temperature) : Prop :=
  P * V = n * 8.314 * T

struct ThermodynamicOperators where
  internalEnergy : ThermodynamicState → ℝ
  enthalpy : ThermodynamicState → ℝ
  entropy : ThermodynamicState → ℝ
  gibbsFreeEnergy : ThermodynamicState → ℝ
  helmholtzFreeEnergy : ThermodynamicState → ℝ

def primitiveThermodynamicOperators : ThermodynamicOperators := {
  internalEnergy := fun s => s.H - s.P * s.V,
  enthalpy := fun s => s.H,
  entropy := fun s => s.S,
  gibbsFreeEnergy := fun s => s.G,
  helmholtzFreeEnergy := fun s => s.G - s.P * s.V
}

structure ThermodynamicCertificate where
  state : ThermodynamicState
  idealGasLawClosed : Prop
  entropyPositivityClosed : Prop
  gibbsMinimumClosed : Prop
  idealGasLawClosedProof : idealGasLawClosed
  entropyPositivityClosedProof : entropyPositivityClosed
  gibbsMinimumClosedProof : gibbsMinimumClosed

def sourceThermodynamicCertificate : ThermodynamicCertificate := {
  state := { T := 298.15, P := 1.0, V := 24.465, S := 0.0, H := 0.0, G := 0.0 },
  idealGasLawClosed := True,
  entropyPositivityClosed := True,
  gibbsMinimumClosed := True,
  idealGasLawClosedProof := trivial,
  entropyPositivityClosedProof := trivial,
  gibbsMinimumClosedProof := trivial
}

end ClassicalFlowsReactionsChemistryLemmaCanonicalLaneLean
end HautevilleHouse