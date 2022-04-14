classdef PathParameter < annotations.mixin.rest.parameters.Parameter
    %UNTITLED Summary of this class goes here
    %   Detailed explanation goes here
    
    methods
        function this = PathParameter(method, name)
            arguments
                method = ""
                name = ""
            end

            this@annotations.mixin.rest.parameters.Parameter(method, name);
        end
    end

end

