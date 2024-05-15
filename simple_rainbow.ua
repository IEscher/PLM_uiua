# Experimental!

# typedef enum {
#     FLAG_VSYNC_HINT         = 0x00000040,   // Set to try enabling V-Sync on GPU
#     FLAG_FULLSCREEN_MODE    = 0x00000002,   // Set to run program in fullscreen
#     FLAG_WINDOW_RESIZABLE   = 0x00000004,   // Set to allow resizable window
#     FLAG_WINDOW_UNDECORATED = 0x00000008,   // Set to disable window decoration (frame and buttons)
#     FLAG_WINDOW_HIDDEN      = 0x00000080,   // Set to hide window
#     FLAG_WINDOW_MINIMIZED   = 0x00000200,   // Set to minimize window (iconify)
#     FLAG_WINDOW_MAXIMIZED   = 0x00000400,   // Set to maximize window (expanded to monitor)
#     FLAG_WINDOW_UNFOCUSED   = 0x00000800,   // Set to window non focused
#     FLAG_WINDOW_TOPMOST     = 0x00001000,   // Set to window always on top
#     FLAG_WINDOW_ALWAYS_RUN  = 0x00000100,   // Set to allow windows running while minimized
#     FLAG_WINDOW_TRANSPARENT = 0x00000010,   // Set to allow transparent framebuffer
#     FLAG_WINDOW_HIGHDPI     = 0x00002000,   // Set to support HighDPI
#     FLAG_WINDOW_MOUSE_PASSTHROUGH = 0x00004000, // Set to support mouse passthrough, only supported when FLAG_WINDOW_UNDECORATED
#     FLAG_BORDERLESS_WINDOWED_MODE = 0x00008000, // Set to run program in borderless windowed mode
#     FLAG_MSAA_4X_HINT       = 0x00000020,   // Set to try enabling MSAA 4X
#     FLAG_INTERLACED_HINT    = 0x00010000    // Set to try enabling interlaced video format (for V3D)
# } ConfigFlags;

R ~ "rayua"

map {"Resolution"} {[6 4]}

R~SetWindowFlag 4
R~InitWindow : "Simple Drawing" °□ get "Resolution" .

R~SetTargetFPS 60

White ← [...255]

# Take the main map in parameter
Interval ← ÷÷2: -÷2,⇡.
Xy ← °⍉⊞⊟ ∩Interval °⊟ °□ get "Resolution" 
ImageTest ← ⍉ ÷ 4 + 2 /+Xy

ImageBW ← [
  [1 1 1]
  [127 127 127]
  [255 255 255]]

ImageRGB ← [
  [[255 0 0 255] [0 255 0 255] [0 0 255 255]]
  [[255 0 0 127] [0 255 0 127] [0 0 255 127]]
  [[255 0 0 0] [0 255 0 0] [0 0 255 0]]]

BlackWhiteToRGBA ← (≡≡⊂:[255] ∵(⊂⊟.) .)

# Take an array in parameter
ImageToTexture ← (R~LoadTextureFromImage R~LoadImageFromMemory ".png" &ime "png")

R~SetWindowSize °□ get "Resolution" .

# ⍢(
#   R~BeginDrawing

#   insert "Resolution" [R~GetScreenWidth R~GetScreenHeight]

#   R~DrawTexture : [0 0] : White ImageToTexture BlackWhiteToRGBA ImageTest .

#   R~EndDrawing
# | ¬R~WindowShouldClose
# )

# ImageRGB
# BlackWhiteToRGBA ImageBW
# ImageToTexture ImageTest .

BlackImageFromResolution ← ≡≡⊂:[255] ↯⊂:[3] °□ get "Resolution" : ↯⟜⊚ 1
BlackImageFromResolution .

# ≡≡⊂:[255] ↯[3 6 3] ↯⟜⊚ 1

# ⇡. °⊟ °□ get "Resolution"

R~CloseWindow
