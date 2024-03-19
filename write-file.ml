let channel = open_out "output.txt" in
try
  output_string channel "line 1\n";
  output_string channel "line 2\n";
  output_string channel "line 3\n";
  close_out channel
with ex -> close_out channel
