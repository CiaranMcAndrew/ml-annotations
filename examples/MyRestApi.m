classdef MyRestApi < annotations.mixin.rest.Api

    properties
        Objects = []
        StartTime
    end

    methods
        function this = MyRestApi()
            this.StartTime = datetime;
        end

        function msg = main(this)
            % [GET(/)]
            msg = "My example RESTful API. Started at: " + string(this.StartTime);
        end

        function obj = getObject(this, id)
            % [GET(/objects/{id})]
            % [SomeTag]
            obj = findobj(this.Objects, "id", id);
        end

        function col = getObjects(this, skip, limit)
            % Gets all objects 
            % Returns objects from skip up to amount defined by limit
            % [GET(/objects)]

%             arguments
%                 this
%                 skip int = 0;
%                 limit int = 10;
%             end

            col = this.Objects(skip:skip + limit);
            
        end

        function status = addObject(this, name, object)
            % [POST(/object/{name})]
        end

        function prop = getObjectProperty(this, id, property)
            % [GET(/objects/{id}/{property})]
            obj = findobj(this.Objects, "id", id);
            prop = obj.(property);
        end
    end
end