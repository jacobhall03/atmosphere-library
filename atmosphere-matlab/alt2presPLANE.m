function localdens = alt2presPLANE(metalt, dens_0, metalt_ref, dens_ref)
%ALT2PRESPLANEAPPROX Generates an exponential coefficient using reference
%points and calculates local air density using geometric altitude.
%Typically used in closed-form calculations of airplane performance.
% Default reference values are altitude of 11 km and 0.367 kg/m^3 density

    arguments
        metalt (1, :) double {mustBeFinite}
        dens_0 (1, 1) double {mustBeFinite}
        metalt_ref (1, 1) double {mustBeFinite} = 11000
        dens_ref (1, 1) double {mustBeFinite, mustBePositive} = 0.367
    end
    n = -log(dens_ref / dens_0) / metalt_ref;
    localdens = dens_0 .* exp(-n .* metalt);
end
