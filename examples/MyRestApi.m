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

        function prop = getObjectProperty(this, id, property)
            % [GET(/objects/{id}/{property})]
            obj = findobj(this.Objects, "id", id);
            prop = obj.(property);
        end
    end
end