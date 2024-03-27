# Experimental!
R ~ "rayua"

R~InitWindow [800 450] "Simple Drawing"
R~SetTargetFPS 165

BCol ← [..0 255]
WCol ← [...255]

R~GetMousePosition

⍢(
  R~BeginDrawing

  # PRESSED

  ⍥(
    R~DrawPixel R~GetMousePosition WCol

    ◌
    R~GetMousePosition
  ) R~IsMouseButtonPressed 0

  # DOWN

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
