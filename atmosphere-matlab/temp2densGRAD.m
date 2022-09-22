function localdens = temp2densGRAD(temp, temp_1, dens_1, temp_grad, g_0, Rgas)
%TEMP2DENSGRAD Calculates local air density in gradient atmosphere
%regions using local temperature
    arguments
        temp (1, :) double {mustBeFinite}
        temp_1 (1, 1) double {mustBeFinite, mustBePositive}
        dens_1 (1, 1) double {mustBeFinite}
        temp_grad (1, 1) double {mustBeFinite}
        g_0 (1, 1) double {mustBeFinite, mustBePositive} = ConstantsSI.gE0
        Rgas (1, 1) double {mustBeFinite, mustBePositive} = ConstantsSI.Rair
    end
    localdens = dens_1 .* (temp ./ temp_1).^(-g_0 / (temp_grad * Rgas) + 1);
end