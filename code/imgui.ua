# Experimental!
R ~ "rayua"
RG ~ "raygua"

R~InitWindow [300 300] "Rayua!"
R~SetTargetFPS 60

Options ← {"One" "Two" "Three"}

Join ← /$"_;_"

map {"Toggled" "Slider" "DropState" "ToggleSlider" "BgColor"} {0 0.5 [0 0] 0 [0 0 0 255]}

⍢(
  R~BeginDrawing

  # RG~GuiButton [10 10 100 20] "Button"
  # R~ClearBackground ⟨[0 0 0 255]|[0 0 255 255]⟩

  ⍜(get "BgColor"|R~ClearBackground . RG~GuiColorPicker [100 100 100 100] "BG")

  # insert "Toggled" ? RG~GuiCheckBox [10 40 20 20] "Check" get "Toggled" .
  ⍜(get "Toggled"|◌ RG~GuiCheckBox [10 40 20 20] "Check")

  ⍜(°□ get "Slider"|◌ RG~GuiSliderBar [10 70 100 20] "" "" ⟜(0 1))
  ⍜(°□ get "Slider"|◌ RG~GuiSlider [10 100 100 20] "" "" ⟜(0 1))

  ⍜(get "DropState"|⊟ ⊙≠ : RG~GuiDropdownBox [10 130 100 20] Join Options ⊙. °⊟°□)

  ⍜(get "ToggleSlider"|◌ RG~GuiToggleSlider [10 160 100 20] "A;B;C;D")

  R~EndDrawing
| ¬R~WindowShouldClose
)
R~CloseWindow
