# Experimental!
R ~ "rayua"
RG ~ "raygua"

R~InitWindow [800 800] "Rayua!"
R~SetTargetFPS 60

Options ← {"One" "Two" "Three"}

Join ← /$"_;_"

map {"Toggled" "Slider" "DropState" "ToggleSlider"} {0 0.1 [0 0] 0}

⍢(
  R~BeginDrawing

  RG~GuiButton [10 10 100 20] "Button"
  R~ClearBackground ⟨[0 0 0 255]|[0 0 255 255]⟩

  # insert "Toggled" ? RG~GuiCheckBox [10 40 20 20] "Check" get "Toggled" .
  ⍜(get "Toggled"|◌ RG~GuiCheckBox [10 40 20 20] "Check")

  ⍜(°□ get "Slider"|◌ RG~GuiSlider [10 70 100 20] "" "" ⟜(0 100))

  ⍜(get "DropState"|⊟ ⊙≠ : RG~GuiDropdownBox [10 100 100 20] Join Options ⊙. °⊟°□)

  ⍜(get "ToggleSlider"|◌ RG~GuiToggleSlider [10 130 100 20] "A;B;C;D")

  R~EndDrawing
| ¬R~WindowShouldClose
)
R~CloseWindow
