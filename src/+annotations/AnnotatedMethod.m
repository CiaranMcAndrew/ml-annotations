classdef AnnotatedMethod 

    properties
        Annotations
    end

    properties (SetAccess=private, Hidden)
        MetaMethod
    end

    methods
        function this = AnnotatedMethod(method, listAnnotations)
            arguments
                method meta.method
                listAnnotations string
            end

            this.MetaMethod = method;
            
            if isempty(listAnnotations)
                this.Annotations = annotations.getAnnotationsForMethod(method);
            else 
                this.Annotations = listAnnotations;
            end
     
        end
    
    end

    %% Inherited from meta.method
    properties % Inherited
        Name
        Description
        DetailedDescription
        Access
        Static
        Abstract
        Sealed
        ExplicitConversion
        Hidden
        InputNames
        OutputNames
        DefiningClass
    end
    
    methods % Get inherited Properties
        function value = get.Name(this)
            value = this.MetaMethod.Name;
        end
        function value = get.Description(this)
            value = this.MetaMethod.Description;
        end
        function value = get.DetailedDescription(this)
            value = this.MetaMethod.DetailedDescription;
        end
        function value = get.Access(this)
            value = this.MetaMethod.Access;
        end
        function value = get.Static(this)
            value = this.MetaMethod.Static;
        end
        function value = get.Abstract(this)
            value = this.MetaMethod.Abstract;
        end
        function value = get.Sealed(this)
            value = this.MetaMethod.Sealed;
        end
        function value = get.ExplicitConversion(this)
            value = this.MetaMethod.ExplicitConversion;
        end
        function value = get.Hidden(this)
            value = this.MetaMethod.Hidden;
        end
        function value = get.InputNames(this)
            value = this.MetaMethod.InputNames;
        end
        function value = get.OutputNames(this)
            value = this.MetaMethod.OutputNames;
        end
        function value = get.DefiningClass(this)
            value = this.MetaMethod.DefiningClass;
        end
    end

end

