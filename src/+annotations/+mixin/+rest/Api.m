classdef Api < annotations.mixin.Annotated

    methods
        function this = Api()
            this.Expression = "(GET|POST|PUT|HEAD|DELETE|PATCH|OPTIONS|CONNECT|TRACE)\(.+?\)";
        end

        function restMethods = getRestMethods(this)
            restMethods = this.getAnnotatedMethods(@annotations.mixin.rest.Method);
        end

        function getOpenApiSpecification(this)
            % TODO: Implement this
        end
    end
end

