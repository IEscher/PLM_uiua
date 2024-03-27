# Experimental!
R ~ "rayua"

Time ← ($"_:_:_"°[⊙⊙∘]≡(⬚@0↙¯2°⋕) ⌊[◿12 ⍥(⊃÷◿60)2 now])

BgColor ← [255 67 0 255]

R~InitWindow [800 800] "Rayua!"

R~SetTargetFPS 60
R~BeginDrawing
R~ClearBackground BgColor
R~EndDrawing

Xy ← °⍉⊞⊟. ÷÷2: -÷2,⇡.100
# Gradient
Rgb ← ([⊃(:°⊟×.|↯△⊢) (×∿◿τ now Xy) 0.5])
# U "Signed Distance Field"
# Takes coordinates
u ← ↥<0.2:>0.7.+×2 ×.:°⊟
# Circle "Signed Distance Field"
# Takes coordinates and radius
c ← >⌵/ℂ
Logo ← (⍉⊂:-⊃(¬u|c) Xy 1 +0.5 Rgb)
LogoData ← (&ime "png" Logo)
LogoImage ← (R~LoadImageFromMemory ".png" LogoData)
# &fwa "logo.png" LogoData

LogoTexture ← R~LoadTextureFromImage LogoImage # R~LoadTexture "logo.png"

White ← [...255]

# Xyy ← ⍉⍉⊞⊟.÷⟜⇡100
# F ← ⍉◿1⊂⊃(+/÷|÷3+1∿×τ+)Xyy
# Frames = ∵F÷⟜⇡10

# Rectangle, Colors [Default, Hover, Pressed]
# Returns pressed state
Button ← ()

[]
⍢(
  R~BeginDrawing

  # R~SetWindowOpacity ÷2+1∿now

  ⍥(R~ClearBackground BgColor) R~IsKeyPressed R~KeyEnter

  # R~ClearBackground [255 67 0 255]
  R~DrawRectangle [12 12] [R~MeasureText $"It is _" Time . 50] BgColor
  R~DrawText $"It is _" Time [12 12] 50 White

  # R~DrawCube [100 100 0] [100 100 1000] White

  R~UpdateTexture LogoTexture ⊡ 0 LogoImage
  R~DrawTexture LogoTexture -[50 50] R~GetMousePosition White

  # [0 (×R~IsMouseButtonDown 0 255) 127 255]
  # -:R~GetMousePosition ÷2.[200 150]
  # R~DrawRectangle

  # ⟨
  #   ◌
  # | R~DrawLine ⊙: R~GetMousePosition [255 255 255 255]
  # ⟩ ×¬≍[0 0].≠0⧻.

  # ? R~GetMousePosition

  ⍥(⊂[R~GetMousePosition]) R~IsMouseButtonPressed 0

  ⍥(
    [] R~DrawLine °⊟:White
  ) =2⧻.

  R~EndDrawing

  R~SetWindowIcon LogoImage # R~LoadImageFromScreen # 
| ¬R~WindowShouldClose
)
R~CloseWindow
