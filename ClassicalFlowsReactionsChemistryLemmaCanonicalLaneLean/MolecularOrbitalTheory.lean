import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClassicalFlowsReactionsChemistryLemmaCanonicalLaneLean

abbrev AtomicOrbital := String
abbrev MolecularOrbital := String

structure MolecularOrbitalBasis where
  atomicOrbitals : List AtomicOrbital
  molecularOrbitals : List MolecularOrbital
  overlapMatrix : List (List ℝ)
  hamiltonianMatrix : List (List ℝ)
deriving Repr, DecidableEq

structure MolecularOrbitalEnergy where
  orbital : MolecularOrbital
  energy : ℝ
deriving Repr, DecidableEq

structure ElectronConfiguration where
  levels : List (MolecularOrbital × Nat)
deriving Repr, DecidableEq

structure HartreeFockModel where
  basis : MolecularOrbitalBasis
  energies : List MolecularOrbitalEnergy
  configuration : ElectronConfiguration
  energyFunctional : Prop
  deriving Repr

def sourceHartreeFockModel : HartreeFockModel := {
  basis := {
    atomicOrbitals := ["1s_H", "1s_He"]
    molecularOrbitals := ["σ", "σ*"]
    overlapMatrix := [[1, 0.5], [0.5, 1]]
    hamiltonianMatrix := [[-13.6, -10], [-10, -24.6]]
  }
  energies := [{ orbital := "σ", energy := -30.0 }, { orbital := "σ*", energy := -5.0 }]
  configuration := { levels := [("σ", 2)] }
  energyFunctional := True.elim (by trivial)
}

theorem source_hartree_fock_energies_nonempty : sourceHartreeFockModel.energies.length = 2 := by
  rfl

end ClassicalFlowsReactionsChemistryLemmaCanonicalLaneLean
end HautevilleHouse