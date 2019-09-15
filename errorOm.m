function eOm = errorOm(R,Om,Rdes,Omdes)
  eOm = Om - (R'*Rdes)*Omdes;
end