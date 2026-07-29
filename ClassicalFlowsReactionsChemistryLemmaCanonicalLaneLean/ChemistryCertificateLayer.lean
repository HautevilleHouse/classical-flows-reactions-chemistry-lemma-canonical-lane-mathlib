import ClassicalFlowsReactionsChemistryLemmaCanonicalLaneLean.ChemistryFlowsLayer

/-!
# Chemistry Certificate Layer

This module packages the local chemistry flow layer into one proof-carrying certificate.
-/

namespace HautevilleHouse
namespace ClassicalFlowsReactionsChemistryLemmaCanonicalLaneLean

structure ChemistryCertificate where
  operatorsClosed : Prop
  flowLayerClosed : Prop
  endpointLayerClosed : Prop
  canonicalCarriageImported : Prop
  operatorsClosedProof : operatorsClosed
  flowLayerClosedProof : flowLayerClosed
  endpointLayerClosedProof : endpointLayerClosed
  canonicalCarriageImportedProof : canonicalCarriageImported

def sourceChemistryCertificate : ChemistryCertificate := {
  operatorsClosed := ChemistryEquationClosed primitiveFlow
  flowLayerClosed := ChemistryFlowLayerClosed sourceChemistryFlowLayerCertificate
  endpointLayerClosed := ChemistryEndpointClosed sourceChemistryEndpointCertificate
  canonicalCarriageImported := True
  operatorsClosedProof := primitive_chemistry_equation_closed_checked
  flowLayerClosedProof := source_chemistry_flow_layer_closed
  endpointLayerClosedProof := source_chemistry_endpoint_closed
  canonicalCarriageImportedProof := trivial
}

def ChemistryCertificateClosed (C : ChemistryCertificate) : Prop :=
  C.operatorsClosed ∧
  C.flowLayerClosed ∧
  C.endpointLayerClosed ∧
  C.canonicalCarriageImported

theorem source_chemistry_certificate_closed :
    ChemistryCertificateClosed sourceChemistryCertificate := by
  exact And.intro sourceChemistryCertificate.operatorsClosedProof
    (And.intro sourceChemistryCertificate.flowLayerClosedProof
      (And.intro sourceChemistryCertificate.endpointLayerClosedProof
        sourceChemistryCertificate.canonicalCarriageImportedProof))

end ClassicalFlowsReactionsChemistryLemmaCanonicalLaneLean
end HautevilleHouse