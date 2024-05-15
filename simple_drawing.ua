# Experimental!
R ~ "rayua"

R~SetWindowFlag 4
R~InitWindow [800 800] "Simple Drawing"
R~SetTargetFPS 165

BCol ← [..0 255]
WCol ← [...255]

map {"Color" "MousePos"} {WCol R~GetMousePosition}

?

# R~GetMousePosition

⍢(
  R~BeginDrawing

  # PRESSED

  ⍥(
    R~DrawPixel R~GetMousePosition get "Color" .

    insert "MousePos" R~GetMousePosition
  ) R~IsMouseButtonPressed 0

  # DOWN

  ⍥(
    R~DrawLine R~GetMousePosition get "MousePos" , get "Color" .

    insert "MousePos" R~GetMousePosition
  ) R~IsMouseButtonDown 0

  # RELEASE

  ⍥(
    R~DrawPixel get "MousePos" , get "Color" .
  ) R~IsMouseButtonReleased 0

  # RIGHT CLICK

  ⍥(
    R~ClearBackground BCol
  ) R~IsMouseButtonPressed 1

  R~EndDrawing
| ¬R~WindowShouldClose
)
R~CloseWindow
