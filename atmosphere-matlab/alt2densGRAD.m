function localdens = alt2densGRAD(metalt, metalt_1, dens_1, temp_1, temp_grad, g_0, Rgas)
%ALT2DENSGRAD Calculates the local density using altitude within a gradient
%atmosphere region
    arguments
        metalt (1, :) double {mustBeFinite}
        metalt_1 (1, 1) double {mustBeFinite}
        dens_1 (1, 1) double {mustBeFinite}
        temp_1 (1, 1) double {mustBeFinite}
        temp_grad (1, 1) double {mustBeFinite}
        g_0 (1, 1) double {mustBeFinite} = ConstantsSI.gE0
        Rgas (1, 1) double {mustBeFinite} = ConstantsSI.Rair
    end
    temp = alt2tempGRAD(metalt, metalt_1, temp_grad, temp_1);
    localdens = temp2densGRAD(temp, temp_1, dens_1, temp_grad, g_0, Rgas);
end
