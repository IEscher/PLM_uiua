# Experimental!

# Example of a smiley face using the Image Manipulation functions
# This demonstrate the use of the generated `Apply` function that would have been used for the dynamic
# manipulations. 

Manip ~ "image-manip"
Utils ~ "utils"

# Convert a color from 0-255 to 0-1
C ← ÷255

Size ← 150 150

Resize ← {"Resize" {Size}}
Circle ← {"Circle" {1}}

# Colorize a 0-1 mask
Colorize ← ×C ⊙[...]

# Background
Manip~Apply {{"Square" {}}} Utils~CoordMatrix Size
Colorize [0 0 0 255]

# Mouth
Manip~Apply {Circle Resize {"Move" -35÷2{Size}}} Utils~CoordMatrix 70 70
Colorize [255 67 0 255]
Manip~Apply {Circle Resize {"Move" -25÷2{Size}}} Utils~CoordMatrix 50 50
Colorize [0 0 0 255]
Utils~Composite
Manip~Apply {{"Move" {0 ¯75}} {"Move" {0 75}}}

# Eyes
Manip~Apply {Circle Resize {"Move" {35 40}}} Utils~CoordMatrix 20 20
Manip~Apply {Circle Resize {"Move" {95 40}}} Utils~CoordMatrix 20 20
Colorize [255 67 0 255]
Utils~Composite

# Final composition
Utils~Composite
Utils~Composite

# Save the image
&fwa "smile.png" &ime "png" ⍉
