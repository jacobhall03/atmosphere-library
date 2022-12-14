classdef AtmosModel
% ATMOSMODEL Allows contruction of an atmospheric model using atmosphere
% layers and provides methods
    properties
        name string = "Atmosphere Model"
        atmos_layers (1, :) AtmosLayer = [AtmosLayer()]
        mean_sealevel (1, 1) double = ConstantsSI.radiusE
        grav_sealevel (1, 1) double = ConstantsSI.gE0
        gas_constant (1, 1) double = ConstantsSI.Rair
    end

    methods
        function obj = AtmosModel(name, atmos_layers, mean_sealevel, grav_sealevel, gas_constant)
            arguments
                name string = "Atmosphere Model"
                atmos_layers (1, :) AtmosLayer = [AtmosLayer()]
                mean_sealevel (1, 1) double = ConstantsSI.radiusE
                grav_sealevel (1, 1) double = ConstantsSI.gE0
                gas_constant (1, 1) double = ConstantsSI.Rair
            end
            obj.name = name;
            obj.atmos_layers = atmos_layers;
            obj.mean_sealevel = mean_sealevel;
            obj.grav_sealevel = grav_sealevel;
            obj.gas_constant = gas_constant;
        end

        function layerindex = alt2layer(obj, geometalt)
            arguments
                obj (1, 1) AtmosModel
                geometalt (1, 1) double {mustBeFinite}
            end
            
            geopotalt = met2pot(geometalt);
            if (obj.atmos_layers(1).base_geopotalt >= geopotalt)
                layerindex = 1;
            elseif (obj.atmos_layers(end).base_geopotalt <= geopotalt)
                layerindex = size(obj.atmos_layers, 2);
            else
                for j = 1:size(obj.atmos_layers, 2)
                    if (obj.atmos_layers(j).base_geopotalt <= geopotalt) ...
                        && (obj.atmos_layers(j+1).base_geopotalt > geopotalt)
                        layerindex = j;
                    end
                end
            end
        end

        function localtemp = alt2temp(obj, geometalt)
            arguments
                obj (1, 1) AtmosModel
                geometalt (1, :) double {mustBeFinite}
            end
            
            localtemp = zeros(size(geometalt))';
            for i = 1:size(geometalt,2)
                j = obj.alt2layer(geometalt(i));
                localtemp(i) = obj.atmos_layers(j).alt2temp(geometalt(i), obj.mean_sealevel);
            end       
        end

        function localdens = alt2dens(obj, geometalt)
            arguments
                obj (1, 1) AtmosModel
                geometalt (1, :) double {mustBeFinite}
            end

            localdens = zeros(size(geometalt))';
            for i = 1:size(geometalt, 2)
                j = obj.alt2layer(geometalt(i));
                localdens(i) = obj.atmos_layers(j).alt2dens(geometalt(i), ...
                    obj.grav_sealevel, obj.gas_constant, obj.mean_sealevel);
            end
        end


        function localpres = alt2pres(obj, geometalt)
            arguments
                obj (1, 1) AtmosModel
                geometalt (1, :) double {mustBeFinite}
            end

            localpres = zeros(size(geometalt))';
            for i = 1:size(geometalt, 2)
                j = obj.alt2layer(geometalt(i));
                localpres(i) = obj.atmos_layers(j).alt2pres(geometalt(i), ...
                    obj.grav_sealevel, obj.gas_constant, obj.mean_sealevel);
            end
        end
        
    end
end
