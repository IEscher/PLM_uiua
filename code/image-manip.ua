# Experimental!

# Image manipulation functions

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

# Generate the above code without having to manually define the ID map and Apply function
#
# Expects a list of a function name followed by its definition
#
# Ex: Map!(Id | ∘ | Zero | 0)
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

  ⟜⊓($"{_}" ∧($"\"_\" _") :""|$"[_]" /($"_ _" :)) :
  ⊙$"IdMapG ↚ map _ _ _" # Create map defition and append function definitions

  ◇/$"_|_" ⇌
  stringify(get ⊙IdMapG ⊙: °□ °⊟ °□)
  $"# instructions, coords\nApply ← ∧(⟨_⟩ _)" : # Create Apply definition

  $"_\n_" :
)

Concat ← ♭/◇⊂ ⊟ ∩□

Map!(
  Circle
| >⌵/ℂ ⊙(°{∘} °□)
| Square
| ↯△⊢ ⊙(1 ◌)
| Rectangle
| ⬚1 ↯ :[] ⇌↘1 △ ⊙◌
| CircleGrad
| ↧+:1¯⌵/ℂ ⊙(°{∘} °□)
| Resize
| ⬚0 ↙Concat ⇌↘2⇌△ ⟜: ⊙[:°{⊙∘} °□]
| Move
| ⬚0 ↻Concat ×0⇡-2⧻△ ⟜: ⊙[:°{⊙∘} °□ ¯]
)
