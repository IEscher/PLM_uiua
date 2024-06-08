# Experimental!
R ~ "rayua"
RG ~ "raygua"
U ~ "utils"

map {"Resolution"} {[200 200]}

# map {"Resolution"} {[6 4]}

White ← [..1 255]
Black ← [...0]

# Take the main map in parameter
Interval ← ÷÷2: -÷2,⇡.
Xy ← °⍉⊞⊟ ∩Interval °⊟ °□ get "Resolution"
BlackWhiteRainbow ← ⍉ ÷ 4 + 2 /+Xy

# insert "Image" U~BlackWhiteToRGBA BlackWhiteRainbow .
insert "Image" ⊞(⊂.⊂) ÷⟜⇡ ⊡1 : ÷⟜⇡ ⊡0 . °□ get "Resolution" .

R~SetWindowFlag 4
R~InitWindow : "I'm GUI!" °□ get "Resolution" .
R~SetTargetFPS 10
R~SetWindowSize °□ get "Resolution" .

⍢(
  R~BeginDrawing

  R~ClearBackground Black

  insert "Resolution" [R~GetScreenWidth R~GetScreenHeight]

  R~DrawTexture : [0 0] : [...255] U~ImageToTexture °□ get "Image" .

  insert "Image" U~HSLImageToRGB U~ShiftHue 10 U~RGBImageToHSL °□ get "Image" .

  R~EndDrawing
| ¬R~WindowShouldClose
)
R~CloseWindow
◌

ImageRGB ← [
  [[1 0.5 0.5 255] [0 1 0.5 255] [0.5 0.5 1 255]]
  [[1 0.7 0.7 127] [0.7 1 0 127] [0.7 0.7 1 127]]
  [[1 0.2 0.2 0] [0.2 1 0.2 0] [0.2 0.2 1 0]]]

ImageHSL ← [
  [[0 1 0.75 255] [150 1 0.5 255] [240 1 0.75 255]]
  [[0 1 0.85 127] [78 1 0.5 127] [240 1 0.85 127]]
  [[0 1 0.6 0] [120 1 0.6 0] [240 1 0.6 0]]]
