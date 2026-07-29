import canonicalLaneMathlib.AdmissibleClass
import ClassicalFlowsReactionsChemistryLemmaCanonicalLaneLean.ReactionKineticsObjects
import ClassicalFlowsReactionsChemistryLemmaCanonicalLaneLean.MolecularOrbitalLayer
import ClassicalFlowsReactionsChemistryLemmaCanonicalLaneLean.ThermodynamicsLayer
import ClassicalFlowsReactionsChemistryLemmaCanonicalLaneLean.ChemicalEquilibriumLayer

namespace HautevilleHouse
namespace ClassicalFlowsReactionsChemistryLemmaCanonicalLaneLean

struct FlowReactionsBridge where
  kinetics : ReactionKineticsOperators
  orbitals : MolecularOrbitalCertificate
  thermodynamics : ThermodynamicCertificate
  equilibrium : ChemicalEquilibriumCertificate
  bridgeClosed : Prop
  bridgeClosedProof : bridgeClosed

def sourceFlowReactionsBridge : FlowReactionsBridge := {
  kinetics := primitiveReactionKineticsOperators,
  orbitals := sourceMolecularOrbitalCertificate,
  thermodynamics := sourceThermodynamicCertificate,
  equilibrium := sourceChemicalEquilibriumCertificate,
  bridgeClosed := True,
  bridgeClosedProof := trivial
}

def flowReactionsBridgeClosed (b : FlowReactionsBridge) : Prop :=
  b.kinetics.detailedBalance ∧ b.orbitals.diagram.diagramClosed ∧ b.thermodynamics.idealGasLawClosed ∧ b.equilibrium.equilibriumClosed

theorem source_flow_reactions_bridge_closed : flowReactionsBridgeClosed sourceFlowReactionsBridge := by
  refine And.intro ?_ (And.intro ?_ (And.intro ?_ ?_))
  · exact sourceFlowReactionsBridge.kinetics.detailedBalanceClosed
  · exact sourceFlowReactionsBridge.orbitals.diagram.diagramClosedProof
  · exact sourceFlowReactionsBridge.thermodynamics.idealGasLawClosedProof
  · exact sourceFlowReactionsBridge.equilibrium.equilibriumClosedProof

end ClassicalFlowsReactionsChemistryLemmaCanonicalLaneLean
end HautevilleHouse