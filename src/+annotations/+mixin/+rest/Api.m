classdef Api < annotations.mixin.Annotated

    methods
        function this = Api()
            this.Expression = "(GET|POST|PUT|HEAD|DELETE|PATCH|OPTIONS|CONNECT|TRACE)\(.+?\)";
        end

        function restMethods = getRestMethods(this)
            restMethods = this.getAnnotatedMethods(@annotations.mixin.rest.Method);
        end

        function getOpenApiSpecification(this)

            for m = this.getRestMethods()'
                assert(numel(m.Annotations) == 1, ...
                    "Found multiple REST signatures for method: " + ... 
                    m.DefiningClass.Name + "." + m.Name)
                
                queryArgs = getQueryArgs(m.Annotations);



            end

        end

    end

end

function args = getQueryArgs(annotation)
exp = "(?<=\{}).+?(?=\})";
args = regexp(annotation, exp, "match")';
end
