%***********************************************************************
%       CONVERTS A RANDOMLY SAMPLED SIGNAL SET INTO AN EVENLY SAMPLED
%       SIGNAL SET (by interpolation)
%       
%	By	:	Haldun KOMSUOGLU
%	Start	:	07/23/1999
%	Last	:	07/23/1999
%	Statue  :	Neural Model Research Material
%	Inputs:	
%              t : A column vector that contains the time values for the
%                  corresponding computed state trajectory points
%              x : A matrix in which each row is a state value on the 
%                  solution trajectory that corresponds to the time value in
%                  vector t with the same row value. Format of each row:
%                          row = [x1 x2 ... xN]
%              Fs: The sampling frequency (1/sec) for the evenly sampled 
%                  set to be generated.
%       Outputs:
%              Et : Even sampling instants. This is a column vector in the
%                   same format with "t".
%              Ex : A matrix of the same form with "x" that contains the
%                   state values corresponding to the time instants in Et
%***********************************************************************
function [Et, Ex] = even_sample(t, x, Fs, type)
    if nargin < 3, Fs = 250; end
    if nargin < 4, type = 'spline'; end

    % Obtain the process related parameters
    [Mt, Nt] = size(t);
    [Mx, Nx] = size(x);
    if Nt == 1 % t is a column vector
        M = Mt; % Number of samples provided
    end
    if Mt == 1 % t is row vector
        M = Nt; % Number of samples provided
        t = t';
    end

    if Mx == M
        N = Nx; % number of signals to be interpolated
    elseif Nx == M
        N = Mx;
        x = x';
    end


    dt = diff(t);
    dt = dt + (dt==0)*1e-5;
    t = [0;cumsum(dt)];

    t0 = t(1);       % Initial time
    tf = t(M);       % Final time
    EM = (tf-t0)*Fs;   % Number of samples in the evenly sampled case with
                       % the specified sampling frequency
    Et = linspace(t0, tf, round(EM))';

    % Using linear interpolation (used to be cubic spline interpolation)
    % and re-sample each signal to obtain the evenly sampled forms
    for s = 1:N
      Ex(:,s) = interp1(t(:,1), x(:,s), Et(:,1),type); 
    end

end