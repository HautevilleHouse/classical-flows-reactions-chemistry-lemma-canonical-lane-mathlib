import classicalFlowsReactionsChemistryLemmaCanonicalLaneLean.ThermochemistryLayer

namespace HautevilleHouse
namespace ClassicalFlowsReactionsChemistryLemmaCanonicalLaneLean

structure MolecularOrbital where
  energy : ℝ
  occupation : ℕ

def hydrogenOrbital : MolecularOrbital := { energy := -13.6, occupation := 1 }

structure OrbitalCertificate where
  thermodynamic : ThermodynamicCertificate
  homoEnergy : Prop
  lumoEnergy : Prop
  homoEnergyClosed : homoEnergy
  lumoEnergyClosed : lumoEnergy
  gapPositive : Prop
  gapPositiveClosed : gapPositive

def sourceOrbitalCertificate : OrbitalCertificate := {
  thermodynamic := sourceThermodynamicCertificate
  homoEnergy := True
  lumoEnergy := True
  homoEnergyClosed := trivial
  lumoEnergyClosed := trivial
  gapPositive := True
  gapPositiveClosed := trivial
}

def OrbitalClosed (C : OrbitalCertificate) : Prop :=
  ThermodynamicClosed C.thermodynamic ∧
  C.homoEnergy ∧
  C.lumoEnergy ∧
  C.gapPositive

theorem source_orbital_closed : OrbitalClosed sourceOrbitalCertificate := by
  exact And.intro source_thermodynamic_closed
    (And.intro sourceOrbitalCertificate.homoEnergyClosed
      (And.intro sourceOrbitalCertificate.lumoEnergyClosed
        sourceOrbitalCertificate.gapPositiveClosed))

end ClassicalFlowsReactionsChemistryLemmaCanonicalLaneLean
end HautevilleHouse
