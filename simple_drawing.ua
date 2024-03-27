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

# [0]

R~GetMousePosition

⍢(
  R~BeginDrawing

  # PRESSED

  ⍥(
    R~DrawPixel R~GetMousePosition WCol

    ◌
    R~GetMousePosition
  ) R~IsMouseButtonPressed 0

  # # DOWN

  ⍥(
    R~DrawLine R~GetMousePosition : WCol

    R~GetMousePosition
  ) R~IsMouseButtonDown 0

  # RELEASE

  ⍥(
    R~DrawPixel : WCol

    R~GetMousePosition
  ) R~IsMouseButtonReleased 0

  # RIGHT CLICK

  ⍥(
    R~ClearBackground BCol
  ) R~IsMouseButtonReleased 1

  R~EndDrawing
| ¬R~WindowShouldClose
)
R~CloseWindow
