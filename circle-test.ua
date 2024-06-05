# Experimental!
Manip ~ "image-manip"

Upscale ← ≡(⍜⊙⍉▽⟜▽)
IntervalRow ← ÷÷2: -÷2, ⇡.
CoordMatrix ← °⍉⊞⊟ ∩IntervalRow
C ← ÷255
Export ← &fwa $"_.png" ⁅×1000⚂ &ime "png"

AddColors ← (
  # ao = aa + ab(1-aa)
  # Co = (Ca*aa + Cb*ab(1-aa)) / ao
  ⊙:∩(⍜(⇌|⊃(↘1|↙1))) # Ca Cb aa ab
  ⊙:⊙⊙(
    ×⊙:+1¯.    # ab(1-aa) aa
    +,,        # ao ab(1-aa) aa
    ⍜([⊙⊙∘]|⇌) # aa ab(1-aa) ao
  )
  ÷,+∩× # (Ca*aa + Cb*ab(1-aa)) / ao
  ⊂
)

Xy ← CoordMatrix 200 200
Rgb ← ÷2+1[⊃(◌°⊟∿|↥¯1↧1+°⊟∿|◌:°⊟∿)Xy]

⊂: Manip~Apply {{"Circle" {1}}} Xy Rgb
Manip~CircleGrad CoordMatrix 50 50 {0.5}
⊂ ×(C [255 67 0]) [..] Manip~Square CoordMatrix 50 50 {}
⬚0↙△,
↻[0 ¯50 ¯20]

# dump(0 Export ⍉)

≡≡AddColors ∩⍉
&ims
# Export

# ×255 AddColors C[255 0 63.75 63.75] C[0 255 0 127.5]

Manip~Square CoordMatrix 5 5 {}
[..]
Manip~Resize ⊙({20 20})
# &ims ⍉ .
Manip~Move ⊙(|0 {5 5})
&ims ⍉

Manip~Circle CoordMatrix 10 10 {1}
.
∩(Manip~Resize ⊙({30 35}))
Manip~Move ⊙(|0 {5 5})
⊙(Manip~Move ⊙(|0 {15 5}))
∩([.])
AddColors

Manip~Square CoordMatrix 5 5 {}
...
∩∩(Manip~Resize ⊙({30 35}))
Manip~Move ⊙(|0 {13 10})
⊙(Manip~Move ⊙(|0 {13 15}))
⊙⊙(Manip~Move ⊙(|0 {13 20}))
⊙⊙⊙(Manip~Move ⊙(|0 {13 25}))
∩∩([.])
∩AddColors
AddColors
AddColors

°⍉≡≡(↘1)⍉
⍉ ×(C [0 255 0])
&ims
