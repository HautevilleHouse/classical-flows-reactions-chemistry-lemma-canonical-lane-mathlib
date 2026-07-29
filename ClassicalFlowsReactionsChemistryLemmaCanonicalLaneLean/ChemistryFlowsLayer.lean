import ClassicalFlowsReactionsChemistryLemmaCanonicalLaneLean.AnalyticObjects

/-!
# Chemistry Flows Layer

This module records the flow layer used by the admitted chemistry lane.
-/

namespace HautevilleHouse
namespace ClassicalFlowsReactionsChemistryLemmaCanonicalLaneLean

structure ChemistryFlowLayerCertificate where
  flow : ChemicalFlow
  reactionDiffusionBalance : Prop
  advectionReactionClosed : Prop
  reactionDiffusionBalanceClosed : reactionDiffusionBalance
  advectionReactionClosedClosed : advectionReactionClosed

def sourceChemistryFlowLayerCertificate : ChemistryFlowLayerCertificate := {
  flow := primitiveFlow
  reactionDiffusionBalance := ReactionDiffusionBalance primitiveFlow
  advectionReactionClosed := AdvectionReactionClosed primitiveFlow
  reactionDiffusionBalanceClosed := primitive_reaction_diffusion_balance_checked
  advectionReactionClosedClosed := primitive_advection_reaction_closed_checked
}

def ChemistryFlowLayerClosed (C : ChemistryFlowLayerCertificate) : Prop :=
  C.reactionDiffusionBalance ∧ C.advectionReactionClosed

theorem source_chemistry_flow_layer_closed :
    ChemistryFlowLayerClosed sourceChemistryFlowLayerCertificate := by
  exact And.intro sourceChemistryFlowLayerCertificate.reactionDiffusionBalanceClosed
    sourceChemistryFlowLayerCertificate.advectionReactionClosedClosed

end ClassicalFlowsReactionsChemistryLemmaCanonicalLaneLean
end HautevilleHouse