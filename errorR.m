function eR = errorR(R,Rdes)
    eR = 0.5 * vee_map(Rdes'*R - R'*Rdes);
end