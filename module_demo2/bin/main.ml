let () =
  let p1 = (0., 0.) in
  let p2 = (3., 4.) in
  let d = Module_demo2.Math.distance p1 p2 in
  assert (d = 5.)
