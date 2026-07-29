import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClassicalFlowsReactionsChemistryLemmaCanonicalLaneLean

abbrev Concentration := ℝ
abbrev Time := ℝ
abbrev Rate := ℝ

structure Species where
  name : String
  concentration : Concentration → Time → ℝ
  diffusionCoeff : ℝ
  initialCondition : ℝ

structure Reaction where
  name : String
  reactants : List Species
  products : List Species
  rateConstant : ℝ
  rateLaw : Concentration → Time → ℝ

structure ReactionNetwork where
  species : List Species
  reactions : List Reaction
  conservationLaws : List (Concentration → Time → Prop)

def concentrationVector : ReactionNetwork → Time → List ℝ := fun net t =>
  net.species.map (fun s => s.concentration s.initialCondition t)

def reactionFlux (r : Reaction) (t : Time) : ℝ :=
  r.rateLaw (r.reactants.length) t

def totalRateLaw (net : ReactionNetwork) (t : Time) : List ℝ :=
  net.reactions.map (fun r => reactionFlux r t)

structure ReactionKineticsOperators where
  network : ReactionNetwork
  detailedBalance : Prop
  massActionConsistency : Prop
  detailedBalanceClosed : detailedBalance
  massActionConsistencyClosed : massActionConsistency

source object for admissible class.

def primitiveReactionKineticsOperators : ReactionKineticsOperators := {
  network := { species := [], reactions := [], conservationLaws := [] },
  detailedBalance := True,
  massActionConsistency := True,
  detailedBalanceClosed := trivial,
  massActionConsistencyClosed := trivial
}

end ClassicalFlowsReactionsChemistryLemmaCanonicalLaneLean
end HautevilleHouse