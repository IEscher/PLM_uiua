# Experimental!
R ~ "rayua"
Manip ~ "image-manip"

R~SetTraceLogLevel 7

Time ← ($"_:_:_"°[⊙⊙∘]≡(⬚@0↙¯2°⋕) ⌊[◿12 ⍥(⊃÷◿60)2 now])

BgColor ← [255 67 0 255]

R~InitWindow [800 800] "Rayua!"

R~SetTargetFPS 60
R~BeginDrawing
R~ClearBackground BgColor
R~EndDrawing

LoadImage ← R~LoadImageFromMemory ".qoi" &ime "qoi"

IntervalRow ← ÷÷2: -÷2, ⇡.
Xy ← °⍉⊞⊟ ∩IntervalRow 200 200
M ← ×∿◿τ
# Gradient
Rgb ← (÷2+1[⊃(◌°⊟∿ M ÷2now|+°⊟∿|◌:°⊟∿ M now) Xy]) # ([⊃(:°⊟×.|↯△⊢) Xy 0.75])
# U "Signed Distance Field"
# Takes coordinates
u ← ↥<0.2:>0.7.+×2 ×.:°⊟
# Circle "Signed Distance Field"
# Takes coordinates and radius
c ← >⌵/ℂ
# Logo ← (⍉⊂:-⊃(¬u|c) Xy 1 +0.5 Rgb)

Logo ← (⍉⊂: Manip~Apply {{"Circle" {0.8}}} Xy Rgb) # c Xy 0.8 Rgb #

LogoImage ← (LoadImage Logo)

LogoTexture ← R~LoadTextureFromImage LogoImage

White ← [...255]

# Xyy ← ⍉⍉⊞⊟.÷⟜⇡100
# F ← ⍉◿1⊂⊃(+/÷|÷3+1∿×τ+)Xyy
# Frames = ∵F÷⟜⇡10

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
  R~DrawTexture LogoTexture -[100 100] R~GetMousePosition White

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

  # R~SetWindowIcon R~LoadImageFromScreen #
| ¬R~WindowShouldClose
)
R~CloseWindow
