function Om_ba = relativeOm(R_a, Om_a, R_b, Om_b)
  Om_ba = Om_b - (R_b'*R_a)*Om_a;
end