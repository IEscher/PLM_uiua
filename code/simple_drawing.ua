# Experimental!
R ~ "rayua"

R~SetWindowFlag 4
R~InitWindow [800 800] "Simple Drawing"
R~SetTargetFPS 165

Black ← [..0 255]
White ← [...255]

map {"MousePos"} {R~GetMousePosition}

⍢(
  R~BeginDrawing

  # PRESSED
  ⍥(
    R~DrawPixel R~GetMousePosition White

    insert "MousePos" R~GetMousePosition
  ) R~IsMouseButtonPressed 0

  # DOWN
  ⍥(
    R~DrawLine R~GetMousePosition :White get "MousePos" .

    insert "MousePos" R~GetMousePosition
  ) R~IsMouseButtonDown 0

  # RELEASE
  ⍥(
    R~DrawPixel :White get "MousePos" .
  ) R~IsMouseButtonReleased 0

  # RIGHT CLICK
  ⍥(
    R~ClearBackground Black
  ) R~IsMouseButtonPressed 1

  R~EndDrawing
| ¬R~WindowShouldClose
)
R~CloseWindow
