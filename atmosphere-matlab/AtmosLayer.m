classdef AtmosLayer
% ATMOSLAYER Contains properties and methods of an atmosphere layer
    properties
        base_geopotalt (1, 1) double {mustBeFinite} = 0
        lapse_rate (1, 1) double {mustBeFinite} = 0
        base_temp (1, 1) double {mustBeFinite} = 0
        base_pres (1, 1) double {mustBeFinite} = 0
        base_dens (1, 1) double {mustBeFinite} = 0
    end

    methods
        function obj = AtmosLayer(base_geopotalt, lapse_rate, base_temp, ...
                base_pres, base_dens)
            arguments
                base_geopotalt (1, 1) double {mustBeFinite} = 0
                lapse_rate (1, 1) double {mustBeFinite} = 0
                base_temp (1, 1) double {mustBeFinite} = 0
                base_pres (1, 1) double {mustBeFinite} = 0
                base_dens (1, 1) double {mustBeFinite} = 0
            end
            obj.base_geopotalt = base_geopotalt;
            obj.lapse_rate = lapse_rate;
            obj.base_temp = base_temp;
            obj.base_pres = base_pres;
            obj.base_dens = base_dens;
        end
    
        function localtemp = alt2temp(obj, geometalt)
            arguments
                obj (1, 1) AtmosLayer
                geometalt (1, :) double {mustBeFinite}
            end

            if abs(obj.lapse_rate) < eps(2)
                localtemp = ones(size(geometalt)) .* obj.base_temp;
            else

                localtemp = alt2tempGRAD(geometalt, pot2met(obj.base_geopotalt), ...
                    obj.lapse_rate, obj.base_temp);
            end
        end

        function localdens = alt2dens(obj, geometalt, g_0, Rgas)
            arguments
                obj (1, 1) AtmosLayer
                geometalt (1, :) double {mustBeFinite}
                g_0 (1, 1) double {mustBeFinite} = ConstantsSI.gE0
                Rgas (1, 1) double {mustBeFinite} = ConstantsSI.Rair
            end


            if abs(obj.lapse_rate) < eps(2)
                localdens = alt2densISO(geometalt, pot2met(obj.base_geopotalt), obj.base_dens, obj.base_temp, g_0, Rgas);
            else
                localdens = alt2densGRAD(geometalt, pot2met(obj.base_geopotalt), obj.base_dens, obj.base_temp, obj.lapse_rate, g_0, Rgas);
            end
        end

        function localpres = alt2pres(obj, geometalt, g_0, Rgas)
            arguments
                obj (1, 1) AtmosLayer
                geometalt (1, :) double {mustBeFinite}
                g_0 (1, 1) double {mustBeFinite} = ConstantsSI.gE0
                Rgas (1, 1) double {mustBeFinite} = ConstantsSI.Rair
            end

            if abs(obj.lapse_rate) < eps(2)
                localpres = alt2presISO(geometalt, pot2met(obj.base_geopotalt), obj.base_pres, obj.base_temp, g_0, Rgas);
            else
                localpres = alt2densGRAD(geometalt, pot2met(obj.base_geopotalt), obj.base_pres, obj.base_temp, obj.lapse_rate, g_0, Rgas);
            end
        end
                
    end
end
