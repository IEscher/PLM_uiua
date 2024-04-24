# Experimental!
R ~ "rayua"

map {"Resolution"} {[800 1200]}

R~InitWindow : "Simple Drawing" °□ get "Resolution" .

R~SetTargetFPS 60

White ← [...255]

Interval ← ÷÷2: -÷2,⇡.
Xy ← °⍉⊞⊟ ∩Interval °⊟ °□ get "Resolution"
Image ← ⍉ ÷ 4 + 2 /+Xy

ImageTexture ← (R~LoadTextureFromImage R~LoadImageFromMemory ".png" &ime "png" Image)

R~SetWindowSize [600 600]

⍢(
  R~BeginDrawing

  R~DrawTexture : [0 0] : White ImageTexture .

  R~EndDrawing
| ¬R~WindowShouldClose
)
R~CloseWindow
