# Experimental!
R ~ "rayua"
RG ~ "raygua"

map {"Toggled" "Slider" "DropState" "ToggleSlider" "BgColor" "Resolution"} {0 0.5 [0 0] 0 [0 0 0 255] [1280 720]}

R~SetWindowFlag 4
R~InitWindow : "I'm GUI!" °□ get "Resolution" .
R~SetTargetFPS 60
R~SetWindowSize °□ get "Resolution" .

White ← [..1 255]
Black ← [...0]
Options ← {"One" "Two" "Three"}

# Execute a function on all R, G and B values of an image separately (clamped)
AffectRandGandB! ← (≡≡⊂: ⊙≡≡((Clamp^!)⊏0_1_2) ≡≡⊏3. :)
# Execute a function on all R, G and B values of an image separately (clamped)
AffectRGB! ← (≡≡⊂: ⊙≡≡(^!(⊏0_1_2)) ≡≡⊏3.)
# Execute a function on a R, G, B or A value of an image (clamped)
AffectR! ← (≡≡⍜⊡(Clamp^!)0:)
AffectG! ← (≡≡⍜⊡(Clamp^!)1:)
AffectB! ← (≡≡⍜⊡(Clamp^!)2:)
AffectA! ← (≡≡⍜⊡(ClampAlpha^!)3:)

HSLRGBf ↚ (
  ⊃(◿12+÷30°⊟↙2↻¯1|°⊟↘1↙3)
  +¯×↥¯1↧1↧+9¯⟜(-3)
)

HSLRGB ↚ (
  ⍜([⊙⊙∘]|⇌)
  ×↧+1¯.⟜:
  ⊃(⊂0|⊂8|⊂4|⊂¯1)[⊙⊙∘]
  ⌊×255↙3[∩∩(HSLRGBf)]
)

# Makes a RGBA black image using screen resolution
BlackImageFullScreen ← ≡≡⊂:[255] ↯⊂:[3] °□ get "Resolution" : ↯⟜⊚ 1
# Makes a RGBA black image using a 1D array of 2 values
BlackImageFromResolution ← ≡≡⊂:[255] ↯⊂:[3] : ↯⟜⊚ 1
# Converts a BW image (one value per pixel) to RGBA
BlackWhiteToRGBA ← (≡≡⊂:[255] ∵(⊂⊟.) .)
# Clamp a value between 0 and 1
Clamp ← ⍥(0◌)<0. ⍥(1◌)>1.
# Clamp a value between 0 and 255
ClampAlpha ← ⍥(0◌)<0. ⍥(255◌)>255.
# Converts an array to a png renderable by Raylib
ImageToTexture ← (R~LoadTextureFromImage R~LoadImageFromMemory ".png" &ime "png")

Join ← /$"_;_"

# Takes a value then a RGBA image in parameter and add the value to all RGB composant clamped
RGBAdd ← AffectRandGandB!+
# Takes a value then a RGBA image in parameter and add the value to all RGB composant clamped
RGBSub ← AffectRandGandB!(-:)
# Takes a value then a RGBA image in parameter and add the value to all RGB composant clamped
RGBMult ← AffectRandGandB!×
# Takes a value then a RGBA image in parameter and add the value to all RGB composant clamped
RGBDiv ← AffectRandGandB!(÷:)

# ⍢(
#   R~BeginDrawing

#   insert "Resolution" [R~GetScreenWidth R~GetScreenHeight]

#   R~DrawTexture : [220 220] : White ImageToTexture RGBAdd 0.5 BlackImageFromResolution [200 200]

#   R~EndDrawing
# | ¬R~WindowShouldClose
# )
# R~CloseWindow

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

HSL ← [H ⟜S ⟜L]
# HSL [0.4 0.4 0.8]

HSLtoRGB ← ÷255 HSLRGB °[⊙⊙∘]

# HSLtoRGB [0.45 0.45 0.85]

ImageRGB ← [
  [[1 0.5 0.5 255] [0 1 0.5 255] [0.5 0.5 1 255]]
  [[1 0.7 0.7 127] [0.7 1 0 127] [0.7 0.7 1 127]]
  [[1 0.2 0.2 0] [0.2 1 0.2 0] [0.2 0.2 1 0]]]

Test ← AffectRGB!(HSLtoRGB HSL)
Test ImageRGB
