# Experimental!
R ~ "rayua"
RG ~ "raygua"

R~InitWindow [800 800] "Rayua!"
R~SetTargetFPS 60

map {"Clicked" "Toggled"} {0 0}
⍢(
  R~BeginDrawing
  R~ClearBackground ⟨[0 0 0 255]|[0 0 255 255]⟩ °□ get "Clicked" .
  insert "Clicked" RG~GuiButton [10 10 100 20] "Button"

  # insert "Toggled" ? RG~GuiCheckBox [10 40 20 20] "Check" get "Toggled" .
  ⍜(get "Toggled"|◌ RG~GuiCheckBox [10 40 20 20] "Check")

  R~EndDrawing
| ¬R~WindowShouldClose
)
R~CloseWindow
