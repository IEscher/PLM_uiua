# Experimental!
R ~ "rayua"
RG ~ "raygua"

R~InitWindow [800 800] "Rayua!"
R~SetTargetFPS 60

Options ← {"One" "Two" "Three"}

Join ← /$"_;_"

map {"Clicked" "Toggled" "Slider" "DropState"} {0 0 0.1 [0 0]}
⍢(
  R~BeginDrawing

  ⍜(
    get "Clicked"
  | R~ClearBackground ⟨[0 0 0 255]|[0 0 255 255]⟩ °□
    RG~GuiButton [10 10 100 20] "Button"
  )

  # insert "Toggled" ? RG~GuiCheckBox [10 40 20 20] "Check" get "Toggled" .
  ⍜(get "Toggled"|◌ RG~GuiCheckBox [10 40 20 20] "Check")

  ⍜(°□ get "Slider"|◌ RG~GuiSlider [10 70 100 20] "" "" ⟜(0 100))

  ⍜(get "DropState"|⊟ ⊙≠ : RG~GuiDropdownBox [10 100 100 20] Join Options ⊙. °⊟°□)

  R~EndDrawing
| ¬R~WindowShouldClose
)
R~CloseWindow
