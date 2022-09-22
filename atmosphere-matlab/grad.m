function gradient = grad(temp, alt, temp_0, alt_0)
%GRAD Calculates the temperature lapse rate for gradient atmosphere layers
    arguments
        temp (1, 1) double {mustBeFinite}
        alt (1, 1) double {mustBeFinite}
        temp_0 (1, 1) double {mustBeFinite}
        alt_0 (1, 1) double {mustBeFinite} = 0.0
    end
    gradient = (temp - temp_0) / (alt - alt_0);
end