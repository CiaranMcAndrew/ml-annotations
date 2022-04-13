classdef MyBasicClass < annotations.mixin.Annotated
    properties
        Height (1,1) double
        Width (1,1) double
        Length (1,1) double
    end

    methods
        function S = calculateArea(this)
            % Calculates area (S) 
            %
            % [Serializable]
            % [XmlElement(ElementName = "Area")]
            % Area calculated by width x height.
            %
            % See also MyOtherClass

            S = this.Height * this.Width;
        end
    end
end