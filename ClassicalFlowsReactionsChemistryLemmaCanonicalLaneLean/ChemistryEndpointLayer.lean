import ClassicalFlowsReactionsChemistryLemmaCanonicalLaneLean.ChemistryCertificateLayer

/-!
# Chemistry Endpoint Layer

This module carries the endpoint route for the admitted analytic class of chemistry flows: source formula closure, bridge closure, gate closure, and the carried unrestricted classical boundary.
-/

namespace HautevilleHouse
namespace ClassicalFlowsReactionsChemistryLemmaCanonicalLaneLean

structure ChemistryEndpointCertificate where
  chemistryCertificate : ChemistryCertificate
  sourceFormulaClosed : Prop
  bridgeClosedOnObject : Prop
  gateClosedOnAdmissibleClass : Prop
  theoremBoundaryCarried : Prop
  sourceFormulaClosedProof : sourceFormulaClosed
  bridgeClosedOnObjectProof : bridgeClosedOnObject
  gateClosedOnAdmissibleClassProof : gateClosedOnAdmissibleClass
  theoremBoundaryCarriedProof : theoremBoundaryCarried

def chemistryAdmittedObject : AdmittedTheoremObject := {
  object := theoremSpecificObject
  localWitness := "Chemistry analytic certificate with reaction-diffusion balance, advection-reaction closure, and endpoint gate."
  bridgeEvidence := "source-derived Lean certificate fields"
  sourceKeyChecked := rfl
  theoremObjectChecked := rfl
}

def chemistryAdmissibleClass : AdmissibleClass := {
  object := chemistryAdmittedObject
  endpointSatisfied := ChemistryEquationClosed primitiveFlow
  remainderRecorded := formalizationCertificate.theoremBoundaryOpen = true
  gateWitness := Or.inl primitive_chemistry_equation_closed_checked
}

def sourceChemistryEndpointCertificate : ChemistryEndpointCertificate := {
  chemistryCertificate := sourceChemistryCertificate
  sourceFormulaClosed := sourceFormulaModels.length = 7
  bridgeClosedOnObject := bridgeClosed chemistryAdmissibleClass
  gateClosedOnAdmissibleClass := gateClosed chemistryAdmissibleClass
  theoremBoundaryCarried := formalizationCertificate.theoremBoundaryOpen = true
  sourceFormulaClosedProof := rfl
  bridgeClosedOnObjectProof := bridge_from_admissible_class chemistryAdmissibleClass
  gateClosedOnAdmissibleClassProof := gate_from_admissible_class chemistryAdmissibleClass
  theoremBoundaryCarriedProof := rfl
}

def ChemistryEndpointClosed (C : ChemistryEndpointCertificate) : Prop :=
  ChemistryCertificateClosed C.chemistryCertificate ∧
  C.sourceFormulaClosed ∧
  C.bridgeClosedOnObject ∧
  C.gateClosedOnAdmissibleClass ∧
  C.theoremBoundaryCarried

theorem source_chemistry_endpoint_closed :
    ChemistryEndpointClosed sourceChemistryEndpointCertificate := by
  exact And.intro source_chemistry_certificate_closed
    (And.intro sourceChemistryEndpointCertificate.sourceFormulaClosedProof
      (And.intro sourceChemistryEndpointCertificate.bridgeClosedOnObjectProof
        (And.intro sourceChemistryEndpointCertificate.gateClosedOnAdmissibleClassProof
          sourceChemistryEndpointCertificate.theoremBoundaryCarriedProof)))

end ClassicalFlowsReactionsChemistryLemmaCanonicalLaneLean
end HautevilleHouse