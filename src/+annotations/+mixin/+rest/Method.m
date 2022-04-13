classdef Method < annotations.AnnotatedMethod

    properties
        QueryArgs
        RequestMethod
    end

    methods
        function this = Method(varargin)
            this = this@annotations.AnnotatedMethod(varargin{:});

            assert(numel(this.Annotations) == 1, ...
                "Found multiple REST signatures for method: " + ...
                this.DefiningClass.Name + "." + this.Name)
        end
    end

    methods % get;set
        function args = get.QueryArgs(this)
            args = getQueryArgs(this.Annotations);
        end

        function method = get.RequestMethod(this)
            exp = "(GET|POST|PUT|HEAD|DELETE|PATCH|OPTIONS|CONNECT|TRACE)(?=\()";
            str = regexp(this.Annotations, exp, "match", "once");
            method = matlab.net.http.RequestMethod.(str);
        end
    end
end

function args = getQueryArgs(annotation)
exp = "(?<=\{).+?(?=\})";
args = regexp(annotation, exp, "match")';
end

