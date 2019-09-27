classdef LowPassFilter2p < handle
   
properties
    
    _delay_element_1 = [1; 0; 0];
    _delay_element_2 = [1; 0; 0];

    sample_freq = 0.0;
    cutoff_freq = 0.0;
    
    _a1 = 0.0;
    _a2 = 0.0;
    _b0 = 1.0;
    _b1 = 0.0;
    _b2 = 0.0;
end


methods
    function obj =  LowPassFilter2p(varargin)
        obj.set_cutoff_frequency(sample_freq, cutoff_freq);
        
    end
    
    function set_cutoff_frequency(sample_freq, cutoff_freq)
        obj.sample_freq = sample_freq;
        obj.cutoff_freq = cutoff_freq;

        obj._delay_element_1 = zeros(3,1);
        obj._delay_element_2 = zeros(3,1);

        if cutoff_freq < 0
            return
        end

        fr = obj.sample_freq/obj.cutoff_freq;
        ohm = tan(pi/fr);
        c = 1+ 2*cos(pi/4)*ohm + ohm^2;

        obj._b0 = ohm^2/c;
        obj._b1 = 2*_b0;
        obj._b2 = obj._b0;

        obj._a1 = 2*(ohm^2-1)/c;
        obj._a2 = (1 - 2*cos(pi/4)*ohm + ohm^2)/c;


    end

    function output = apply(sample)
		delay_element_0 = sample - _delay_element_1 *_a1 - _delay_element_2 * _a2;
        output = delay_element_0 *_b0 + _delay_element_1 *_b1 + _delay_element_2 * _b2;
        
		_delay_element_2 = _delay_element_1;
		_delay_element_1 = delay_element_0;
    end

    function output = reset(sample)
        obj._delay_element_1 = sample;
        obj._delay_element_2 = sample;
        output = obj.apply(sample);
    end

end
    
end
%% 