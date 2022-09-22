function localdens = alt2densISO(metalt, metalt_1, dens_1, temp, g_0, Rgas)
% ALT2DENSISO Calculates local air density in a isothermal region
% given geometric altitude, reference altitude, density, and temperature (beginning of isothermal
% region) and optional gravitional acceleration and specific gas constants,
% with the defaults being that of the Earth's.
    arguments
        metalt (1, :) double {mustBeFinite}
        metalt_1 (1, 1) double {mustBeFinite}
        dens_1 (1, 1) double {mustBeFinite}
        temp (1, 1) double {mustBeFinite}
        g_0 (1, 1) double {mustBeFinite} = ConstantsSI.gE0
        Rgas (1, 1) double {mustBeFinite} = ConstantsSI.Rair
    end
    potaltdiff = met2pot(metalt) - met2pot(metalt_1);
    localdens = dens_1 .* exp(-(g_0 .* potaltdiff) ./ (Rgas * temp));
end