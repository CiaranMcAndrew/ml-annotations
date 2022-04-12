classdef Annotated < matlab.mixin.Heterogeneous
    
    properties (Hidden, Access = protected)
        Expression = "";
    end 

    methods
        function annotatedMethods = getAnnotatedMethods(this, type)
            arguments
                this
                type = @annotations.AnnotatedMethod
            end

            import annotations.*

            mc = metaclass(this);
            listMethods = mc.MethodList;

            % annotatedMethods = AnnotatedMethod.empty();
            annotatedMethods = feval(func2str(type) + ".empty");
            
            for m = listMethods'
                listAnnotations = getAnnotationsForMethod(m, this.Expression);
                
                if ~isempty(listAnnotations)
                    annotatedMethods = [annotatedMethods; type(m, listAnnotations)];
                end
            end

        end
    
    end
end

