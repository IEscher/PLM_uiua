# Experimental!
R ~ "rayua"
RG ~ "raygua"

map {"Toggled" "Slider" "DropState" "ToggleSlider" "BgColor" "Resolution"} {0 0.5 [0 0] 0 [0 0 0 255] [1280 720]}

R~SetWindowFlag 4
R~InitWindow : "I'm GUI!" °□ get "Resolution" .
R~SetTargetFPS 60
R~SetWindowSize °□ get "Resolution" .

Options ← {"One" "Two" "Three"}
BlackImageFromResolution ← ≡≡⊂:[255] ↯⊂:[3] °□ get "Resolution" : ↯⟜⊚ 1
BlackWhiteToRGBA ← (≡≡⊂:[255] ∵(⊂⊟.) .)
ImageToTexture ← (R~LoadTextureFromImage R~LoadImageFromMemory ".png" &ime "png")

Join ← /$"_;_"

⍢(
  R~BeginDrawing

  insert "Resolution" [R~GetScreenWidth R~GetScreenHeight]

  # RG~GuiButton [10 10 100 20] "Button"
  # R~ClearBackground ⟨[0 0 0 255]|[0 0 255 255]⟩

  ⍜(get "BgColor"|R~ClearBackground . RG~GuiColorPicker [100 100 100 100] "BG")

  # insert "Toggled" ? RG~GuiCheckBox [10 40 20 20] "Check" get "Toggled" .
  ⍜(get "Toggled"|◌ RG~GuiCheckBox [10 40 20 20] "Check")

  ⍜(°□ get "Slider"|◌ RG~GuiSliderBar [10 70 100 20] "" "" ⟜(0 1))
  ⍜(°□ get "Slider"|◌ RG~GuiSlider [10 100 100 20] "" "" ⟜(0 1))

  ⍜(get "ToggleSlider"|◌ RG~GuiToggleSlider [10 160 100 20] "A;B;C;D")

  ⍜(get "DropState"|⊟ ⊙≠ : RG~GuiDropdownBox [10 130 100 20] Join Options ⊙. °⊟°□)

  R~EndDrawing
| ¬R~WindowShouldClose
)
R~CloseWindow
