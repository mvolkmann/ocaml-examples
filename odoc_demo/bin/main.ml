open Printf

let () =
  let sum = My_math.sum2 3 4 in
  let product = My_math.product2 3 4 in
  printf "sum = %d, product = %d\n" sum product
