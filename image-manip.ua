# Experimental!

# An Instruction is defined as an ID and an array of boxed values
# Ex: 1 {50}

# IdMap ↚ comptime(
#   map {} {}
#   insert "Circle" 0
#   insert "Square" 1
# )

# Circle ← >⌵/ℂ ⊙(°{∘} °□)
# Square ← ↯△⊢ ⊙(1 ◌)

# # instructions, coords
# Apply ← ∧◇(
#   ⟨
#     Circle
#   | Square
#   ⟩ get : IdMap ⊙: °□ °⊟
# )

Map! ↚^ (
  ⊕□⌊÷:⇡⧻, 2 # Group arguments by 2 ({name definition})
  ◌ ∧⊃(
    ⟜⊃(
      ◇⊂ ⊙⋅⊙⋅◌     # Add ID to values
    | ◇⊂ ◇↙1 ⋅⊙⋅⊙◌ # Add name to keys
    ) :
    +1                           # Increment ID
  | $"_\n_" : $"_ ← _" ◇°⊟ ⊙⋅⋅⋅∘ # Create function definition
  ) ⊙(0 {} {} "")                # ID keys values definitions

  ⟜⊓($"{_}" /($"\"_\" \"_\"")|$"[_]" /$"_ _") :
  ⊙$"IdMapG ↚ map _ _ _" # Create map defition and append function definitions

  ◇/$"_|_" ⇌
  stringify(get ⊙IdMapG ⊙: °□ °⊟ °□)
  $"# instructions, coords\nApply ← ∧(⟨_⟩ _)" : # Create Apply definition

  $"_\n_" :
)

Map!(
  Circle
| >⌵/ℂ ⊙(°{∘} °□)
| Square
| ↯△⊢ ⊙(1 ◌)
)
