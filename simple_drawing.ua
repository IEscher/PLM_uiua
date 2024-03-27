# Experimental!
R ~ "rayua"

R~InitWindow [800 450] "Rayua!"
R~SetTargetFPS 165

RRect ← [20 20] [200 200] [255 0 0 255]
GRect ← [20 20] [220 200] [0 255 0 255]
WRect ← [20 20] [200 220] [...255]

BCol ← [..0 255]
WCol ← [...255]

# [255 255 255 255]

[]
⍢(
  R~BeginDrawing

  # PRESSED

  ⍥(
    # R~ClearBackground BCol
    # R~DrawRectangle WRect
    R~DrawPixel R~GetMousePosition WCol
    R~GetMousePosition WCol
  ) R~IsMouseButtonPressed 0

  # DOWN

  ⍥(
    # R~ClearBackground BCol
    # R~DrawRectangle GRect
    R~DrawLine R~GetMousePosition
    R~GetMousePosition WCol
  ) R~IsMouseButtonDown 0

  # RELEASE

  ⍥(
    # R~ClearBackground BCol
    # R~DrawRectangle RRect
    R~DrawPixel
  ) R~IsMouseButtonReleased 0

  R~EndDrawing
| ¬R~WindowShouldClose
)
R~CloseWindow
