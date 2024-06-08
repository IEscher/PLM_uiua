# Experimental!
Manip ~ "image-manip"
Utils ~ "utils"

C ← ÷255

Size ← 150 150

# Background
Manip~Apply {{"Square" {}}} Utils~CoordMatrix Size
×(C [0 0 0 255]) [...]

# Mouth
Manip~Apply {{"Circle" {1}} {"Resize" {Size}} {"Move" -35÷2{Size}}} Utils~CoordMatrix 70 70
×(C [255 67 0 255]) [...]
Manip~Apply {{"Circle" {1}} {"Resize" {Size}} {"Move" -25÷2{Size}}} Utils~CoordMatrix 50 50
×(C [0 0 0 255]) [...]
Utils~Composite
Manip~Apply {{"Move" {0 ¯75}} {"Move" {0 75}}}

# Eyes
Manip~Apply {{"Circle" {1}} {"Resize" {Size}} {"Move" {35 40}}} Utils~CoordMatrix 20 20
Manip~Apply {{"Circle" {1}} {"Resize" {Size}} {"Move" {95 40}}} Utils~CoordMatrix 20 20
∩(×(C [255 67 0 255]) [...])
Utils~Composite

# Final composition
Utils~Composite
Utils~Composite

&fwa "smile.png" &ime "png" ⍉
