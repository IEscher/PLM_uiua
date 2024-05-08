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

map {"Resolution"} {[600 600]}

R~SetWindowFlag 4
R~InitWindow : "Simple Drawing" °□ get "Resolution" .

R~SetTargetFPS 60

White ← [...255]

Interval ← ÷÷2: -÷2,⇡.
Xy ← °⍉⊞⊟ ∩Interval °⊟ °□ get "Resolution"
Image ← ⍉ ÷ 4 + 2 /+Xy

ImageTexture ← (R~LoadTextureFromImage R~LoadImageFromMemory ".png" &ime "png" Image)

R~SetWindowSize [600 600]

⍢(
  R~BeginDrawing

  insert "Resolution" [R~GetScreenWidth R~GetScreenHeight]

  R~DrawTexture : [0 0] : White ImageTexture .

  R~EndDrawing
| ¬R~WindowShouldClose
)
R~CloseWindow
