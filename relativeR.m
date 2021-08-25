function R_ba = relativeR(R_a, R_b)
    %% Input - Two configurations R_a and R_b w.r.t Inertial Frame (Absolute configurations).
    %% Output - Relative configuration of R_b w.r.t frame R_a. It is denoted R_ba,.
    %% R_a, R_b, R_ab belong to SO(3)
    R_ba = R_a' * R_b ;
end