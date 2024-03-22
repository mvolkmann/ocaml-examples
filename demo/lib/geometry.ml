type point = float * float

let square x = x *. x
let distance (x1, y1) (x2, y2) = sqrt (square (x1 -. x2) +. square (y1 -. y2))