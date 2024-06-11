# Experimental!
R ~ "rayua"
RG ~ "raygua"
U ~ "utils"

Size ← [200 200]

Black ← [...0]

map {"Image"} {U~RGBImageToHSL ⊞(⊂.⊂) ÷⟜⇡ ⊡1 : ÷⟜⇡ ⊡0 . Size}

R~InitWindow Size "Hue shift"
R~SetTargetFPS 10

⍢(
  R~BeginDrawing

  R~ClearBackground Black

  ⍜(now|R~DrawTexture : [0 0] : [...255] U~ImageToTexture U~HSLImageToRGB °□ get "Image" .)

  &p $"FPS: _ (_ s)" ∩(÷100⁅×100) ÷: 1 .

  insert "Image" U~ShiftHue 10 °□ get "Image" .

  R~EndDrawing
| ¬R~WindowShouldClose
)
R~CloseWindow
◌
