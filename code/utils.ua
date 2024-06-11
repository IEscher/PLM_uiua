# Experimental!
R ~ "rayua"
RG ~ "raygua"

# Makes a RGBA black image using a 1D array of 2 values
BlackImageFromResolution ← ≡≡⊂:[255] ↯⊂:[3] : ↯⟜⊚ 1
# Converts a BW image (one value per pixel) to RGBA
BlackWhiteToRGBA ← (≡≡⊂:[255] ∵(⊂⊟.) .)
# Clamp a value between 0 and 1
Clamp ← ⍥(0◌)<0. ⍥(1◌)>1.
# Clamp a value between 0 and 255
ClampAlpha ← ⍥(0◌)<0. ⍥(255◌)>255.
# # Clamp a value between 0 and 255
# ClampH ← ⍥(0◌)<0. ⍥(360◌)>360.
# Converts an array to a png renderable by Raylib
ImageToTexture ← (R~LoadTextureFromImage R~LoadImageFromMemory ".png" &ime "png")

# Execute a function on all R, G and B values of an image separately (clamped)
AffectRandGandB! ← (≡≡⊂: ⊙≡≡((Clamp^!)⊏0_1_2) ≡≡⊏3. :)
# Execute a function on all R, G and B values of an image separately (clamped)
AffectRGB! ← (≡≡⊂: ⊙≡≡(^!(⊏0_1_2)) ≡≡⊏3.)
# Execute a function on a R, G, B or A value of an image (clamped)
AffectR! ← (≡≡⍜⊡(Clamp^!)0:)
AffectG! ← (≡≡⍜⊡(Clamp^!)1:)
AffectB! ← (≡≡⍜⊡(Clamp^!)2:)
AffectA! ← (≡≡⍜⊡(ClampAlpha^!)3:)

# Takes a value then a RGBA image in parameter and add the value to all RGB composant clamped
RGBAdd ← AffectRandGandB!+
# Takes a value then a RGBA image in parameter and add the value to all RGB composant clamped
RGBSub ← AffectRandGandB!(-:)
# Takes a value then a RGBA image in parameter and add the value to all RGB composant clamped
RGBMult ← AffectRandGandB!×
# Takes a value then a RGBA image in parameter and add the value to all RGB composant clamped
RGBDiv ← AffectRandGandB!(÷:)

# ---- HSL ----

XMax ↚ /↥ # V
XMin ↚ /↧ # V-C

RisMax ↚ =1×(≥(⊏2)⟜(⊏0))⟜(≥(⊏1)⟜(⊏0))
GisMax ↚ =1×(≥(⊏2)⟜(⊏1))⟜(≥(⊏0)⟜(⊏1))
BisMax ↚ =1×(≥(⊏1)⟜(⊏2))⟜(≥(⊏0)⟜(⊏2))
RangeRGB ↚ - XMin⟜XMax  # C = 2(V-L)
MidRGB ↚ ÷2 + XMin⟜XMax # L = V-C/2

CaseVisR ↚ ×60(◿6 ÷RangeRGB: -⊏2, ⊏1.)
CaseVisG ↚ ×60(+2 ÷RangeRGB: -⊏0, ⊏2.)
CaseVisB ↚ ×60(+4 ÷RangeRGB: -⊏1, ⊏0.)
GetCase ↚ ⊗1[=0(RangeRGB) ⟜RisMax ⟜GisMax ⟜BisMax]

H ↚ ⟨0◌|CaseVisR|CaseVisG|CaseVisB⟩ GetCase.
L ↚ MidRGB
S ↚ ⟨÷-⌵(-1 ×2 MidRGB) : 1 ⟜(×2 (-MidRGB ⟜XMax))|0 ◌⟩ (+(=0MidRGB)⟜(=1MidRGB)).

OldRGBtoHSL ← [H ⟜S ⟜L]

# Convert RGB to HSL
# Expexct RGB between 0 and 1
RGBtoHSL ← (
  ⊃(/↥|/↧) .

  -:,, # delta cmax cmin [r g b]

  ⊙(⟜(:÷2+)) # delta cmax [r g b] l

  =0.

  ⟨
    ⊃(
      ⊙::⊙(⊗:,) # [r g b] delta
      ⟨
        ◿6 ÷: -:◌°[⊙⊙∘]     # ((g - b) / delta) % 6
        | +2 ÷: -⊙⋅∘°[⊙⊙∘]  # (b - r) / delta + 2
        | +4 ÷: -:⊙⊙◌°[⊙⊙∘] # (r - g) / delta + 4
      ⟩

      ⁅×60
      ⍥(+360) <0.
    | ÷: ⊙⋅⋅(+1¯⌵-1×2.) # delta / (1 - Math.abs(2 * l - 1))
    )
  | (⋅⋅⋅(0 0)) # If delta==0 h and s are 0
  ⟩            # h s l

  [⊙⊙∘]
)

HSLRGBf ↚ (
  ⊃(◿12+÷30°⊟↙2↻¯1|°⊟↘1↙3)
  +¯×↥¯1↧1↧+9¯⟜(-3)
)

HSLRGB ↚ (
  ⍜([⊙⊙∘]|⇌)
  ×↧+1¯.⟜:
  ⊃(⊂0|⊂8|⊂4|⊂¯1)[⊙⊙∘]
  ↙3[∩∩(HSLRGBf)]
)

HSLtoRGB ← HSLRGB °[⊙⊙∘]

RGBImageToHSL ← AffectRGB!RGBtoHSL
HSLImageToRGB ← AffectRGB!HSLtoRGB

AffectH! ← (≡≡⍜⊡(◿360^!)0:)
AffectS! ← (≡≡⍜⊡(Clamp^!)1:)
AffectL! ← (≡≡⍜⊡(Clamp^!)2:)

ShiftHue ← AffectH!+

Upscale ← ≡(⍜⊙⍉▽⟜▽)
IntervalRow ↚ ÷÷2: -÷2, ⇡.
CoordMatrix ← °⍉⊞⊟ ∩IntervalRow

SepA ↚ ∩(⍜(⇌|⊃(↘1|↙1)))
OneM ↚ +1¯

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
