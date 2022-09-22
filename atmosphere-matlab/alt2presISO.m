function localpres = alt2presISO(metalt, metalt_1, pres_1, temp_1, g_0, Rgas)
% ALT2PRESISO Calculates local air pressure in a isothermal region
% given geometric altitude, reference altitude, pressure, and temperature (beginning of isothermal
% region) and optional gravitional acceleration and specific gas constants,
% with the defaults being that of the Earth's. 
    arguments
        metalt (1, :) double {mustBeFinite}
        metalt_1 (1, 1) double {mustBeFinite}
        pres_1 (1, 1) double {mustBeFinite, mustBePositive}
        temp_1 (1, 1) double {mustBeFinite, mustBePositive}
        g_0 (1, 1) double {mustBeFinite, mustBePositive} = ConstantsSI.gE0
        Rgas (1, 1) double {mustBeFinite, mustBePositive} = ConstantsSI.Rair
    end
    potaltdiff = met2pot(metalt) - met2pot(metalt_1);
    localpres = pres_1 .* exp(-(g_0 .* potaltdiff) ./ (Rgas * temp_1));
end