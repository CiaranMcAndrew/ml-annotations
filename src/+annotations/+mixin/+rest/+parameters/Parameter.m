classdef (Abstract) Parameter < matlab.mixin.Heterogeneous & matlab.mixin.CustomDisplay & handle
    %UNTITLED Summary of this class goes here
    %   Detailed explanation goes here
    
    properties (SetAccess=protected)
        Method
        Name
        Type
    end

    methods
        function this = Parameter(method, name)
            arguments
                method = ""
                name = ""
            end

            this.Method = method;
            this.Name = name;
        end
    end

    methods (Sealed)
        function h = findobj(this, varargin)
            h = findobj@handle(this, varargin{:});
        end

        function T = toTable(this)
            s = warning;
            warning('off', 'MATLAB:structOnObject');
            T = struct2table(arrayfun(@struct, this));
            warning(s);
        end
    end

    methods (Sealed, Access=protected)
        function s = getHeader(this)
            import matlab.mixin.CustomDisplay.*
            s = "  " + convertDimensionsToString(this) + " " +  getClassNameForHeader(this) + " array";
            if numel(this) > 0
                s = s + " with properties:";
            end
        end

        function displayNonScalarObject(this)
            disp(this.getHeader);
            disp(this.toTable);
        end

        function displayEmptyObject(this) 
            disp(this.getHeader);
        end
        
    end

    methods
        function value = get.Type(this)
            pat = lookBehindBoundary(".") + lettersPattern + textBoundary;
            value = string(extract(class(this), pat));
        end
    end

    methods (Static)
        function obj = FromMethod(method, name)
            arguments
                method (1,1) annotations.mixin.rest.Method
                name (1,1) string
            end

            import annotations.mixin.rest.parameters.*
            import matlab.net.http.RequestMethod

            if ismember(name, method.findPathParameters)
                obj = PathParameter(method, name);
            else
                switch method.RequestMethod
                    case {RequestMethod.GET}
                        obj = QueryParameter(method, name);

                    case {RequestMethod.PUT;
                            RequestMethod.POST}
                        obj = BodyParameter(method, name);

                    otherwise 
                        error("Unsupported request method: " + method.RequestMethod)
                end
            end
        end
        
    end
end

