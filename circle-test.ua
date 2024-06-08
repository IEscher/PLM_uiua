# Experimental!
Manip ~ "image-manip"
Utils ~ "utils"

C ← ÷255
Export ← &fwa $"_.png" ⁅×1000⚂ &ime "png"

SepA ← ∩(⍜(⇌|⊃(↘1|↙1)))

AddColors ← (
  # ao = aa + ab(1-aa)
  # Co = (Ca*aa + Cb*ab(1-aa)) / ao
  ⊙:SepA # Ca Cb aa ab
  ⊙:⊙⊙(
    ×⊙:+1¯.    # ab(1-aa) aa
    +,,        # ao ab(1-aa) aa
    ⍜([⊙⊙∘]|⇌) # aa ab(1-aa) ao
  )
  ÷,+∩× # (Ca*aa + Cb*ab(1-aa)) / ao
  ⊂
)

AddColorsPre ← (
  ⊙:∩(⊸×)SepA # Ca*aa Cb*bb aa ab

  ⊙⊙(+1¯.) # Ca*aa Cb*bb 1-aa aa ab

  +⊙(×,)  # Co 1-aa ao ab
  ⊙(+×⊙:) # Co ao
  ÷,
  ⊂
)

OneM ← +1¯

AddColorss ← (
  ⊙⊙(0)

  ⊙:SepA # Cs Cd as ad
  # ⊙:∩(×,⍜(⇌|⊃(↘1|↙1)))

  ⊙⊙(
    ⊙::×,,⊃(×OneM:|×OneM) #  As Ad Ab
  )

  ⊙:. # Cs Cd Cb As Ad Ab

  λadbecfggdef # Cs As Cd Ad Cb Ab 0 0 As Ad Ab

  ++∩∩×   # C 0 As Ad Ab
  ⊙(+⊙++) # C a

  ⊂÷,
)

Composite ← (
  :
  ⊙:SepA # y1 y2 a1 a2

  ⊙⊙(
    ,
    .OneM×∩OneM
    ⊙(⟨∘|0⟩ =NaN . ÷)
    OneM.:
  )

  ⊙:  # y1 1-k y2 k ao
  +∩× # co ao
  ⊂
)

Xy ← Utils~CoordMatrix 100 100
Rgb ← ÷2+1[⊃(◌°⊟∿|↥¯1↧1+°⊟∿|◌:°⊟∿)Xy]

⊂: Manip~Apply {{"Circle" {1}}} Xy Rgb
Manip~CircleGrad Utils~CoordMatrix 30 30 {1}
⊂ ×(C [255 67 0]) [..] Manip~Square Utils~CoordMatrix 30 30 {}
⬚0↙△,
Manip~Move ⊙(|0 {20 20})

dump(0 Export ⍉)
≡≡Composite ∩⍉
# dump(0 Export)
&ims

# ×255 AddColors C[255 0 63.75 63.75] C[0 255 0 127.5]

# Manip~Square CoordMatrix 5 5 {}
# [..]
# Manip~Resize ⊙({20 20})
# # &ims ⍉ .
# Manip~Move ⊙(|0 {5 5})
# &ims ⍉

# Manip~Circle CoordMatrix 10 10 {1}
# .
# ∩(Manip~Resize ⊙({30 35}))
# Manip~Move ⊙(|0 {5 5})
# ⊙(Manip~Move ⊙(|0 {15 5}))
# ∩([.])
# AddColors

# Manip~Square CoordMatrix 5 5 {}
# ...
# ∩∩(Manip~Resize ⊙({30 35}))
# Manip~Move ⊙(|0 {13 10})
# ⊙(Manip~Move ⊙(|0 {13 15}))
# ⊙⊙(Manip~Move ⊙(|0 {13 20}))
# ⊙⊙⊙(Manip~Move ⊙(|0 {13 25}))
# ∩∩([.])
# ∩AddColors
# AddColors
# AddColors

# °⍉≡≡(↘1)⍉
# ⍉ ×(C [0 255 0])
# &ims
