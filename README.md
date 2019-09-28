# Geometry-Toolbox
Contains all the functions (such as hat map, vee map, rotations, transport map, etc.) used during the development of geometric mechanics and control of robotic systems. 

### Naming convention (to be decided)

    + geometrytoolbox     # namespace
    ├── +rotation/SO3
    |   ├── +error
    |   |   ├── state.m   # eta
    |   |   ├── angvel.m  # delta-Omega
    |   ├── +variation
    |   |   ├── state.m   # eR
    |   |   ├── angvel.m  # eOmega
    |   |   ├── config.m  # PsiR
    |   |   └── ...    
    |   ├── rot2eul(R,'ZXY').m
    |   ├── eul2rot(R,'ZXY').m
    |   ├── eulerrate2angvel(de,'ZXY').m
    |   ├── angvel2eulerrate(Omega,'ZXY').m
    |   ├── xdeg.m
    |   ├── ydeg.m
    |   ├── zdeg.m
    |   └── ...    
    ├── +unitvector/S2
    |   ├── +error
    |   |   ├── state.m   # xi
    |   |   ├── angvel.m  # delta-omega
    |   ├── +variation
    |   |   ├── state.m   # eq
    |   |   ├── angvel.m  # eomega
    |   |   ├── config.m  # Psiq
    |   |   ├── ...
    |   └── ...   
    ├── dot.m
    ├── cross.m
    ├── hat.m
    ├── vee.m
    │   
    └── ...

