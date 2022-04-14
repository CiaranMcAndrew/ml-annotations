classdef Method < annotations.AnnotatedMethod

    properties
        Endpoint
        Parameters
        PathParameters
        QueryParameters
        BodyParameters
        RequestMethod
    end

    methods
        function this = Method(varargin)
            this = this@annotations.AnnotatedMethod(varargin{:});

            assert(numel(this.Annotations) == 1, ...
                "Found multiple REST signatures for method: " + ...
                this.DefiningClass.Name + "." + this.Name)
        end

        function args = findPathParameters(this)
            args = getPathParameters(this.Endpoint);
        end
    end

    methods % get;set

        function endpoint = get.Endpoint(this)
            endpoint = this.Annotations;
        end

        function parameters = get.Parameters(this)
            if isempty(this.Parameters)
                parameters = annotations.mixin.rest.parameters.Parameter.empty();
                for n = this.InputNames(2:end)'
                    parameters = [parameters; annotations.mixin.rest.parameters.Parameter.FromMethod(this, string(n))];
                end
            else
                parameters = this.Parameters;
            end
        end

        function parameters = get.PathParameters(this)
            parameters = findobj(this.Parameters, 'Type', 'PathParameter');
        end

        function parameters = get.QueryParameters(this)
            parameters = findobj(this.Parameters, 'Type', 'QueryParameter');
        end

        function parameters = get.BodyParameters(this)
            parameters = findobj(this.Parameters, 'Type', 'BodyParameter');
        end

        function method = get.RequestMethod(this)
            exp = "(GET|POST|PUT|HEAD|DELETE|PATCH|OPTIONS|CONNECT|TRACE)(?=\()";
            str = regexp(this.Annotations, exp, "match", "once");
            method = matlab.net.http.RequestMethod.(str);
        end
    end
end

function args = getPathParameters(endpoint)
exp = "(?<=\{).+?(?=\})";
args = regexp(endpoint, exp, "match")';
end
