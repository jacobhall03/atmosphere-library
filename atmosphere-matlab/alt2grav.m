function localgrav = alt2grav(metalt, r_0, g_0)
% ALT2GRAV returns local gravitational acceleration
% provided geometric altitude and optional radius/gravitational
% acceleration at said radius as inputs with the default being that of the Earth's
    arguments
        metalt (1, :) double {mustBeFinite}
        r_0 (1, 1) double {mustBeFinite, mustBePositive} = ConstantsSI.radiusE
        g_0 (1, 1) double {mustBeFinite, mustBePositive} = ConstantsSI.gE0
    end
    localgrav = (g_0 * r_0) ./ (r_0 + metalt);
end