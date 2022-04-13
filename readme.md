# Annotations for MATLAB

Annotations provide a means to extend Object Oriented MATLAB using method level metadata tags and reflection behaviour, similar to how other languages allow (Java, C#, Python, Go).

## Basics
Annotations can be applied to class methods using `[square parenthesis]`. The class must use the mixin [`annotations.mixin.Annotated`](src/+annotations/+mixin/Annotated.m) or a subclass that inherits from it.

Example [MyBasicClass](examples/MyBasicClass.m)
```matlab
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
```
This adds annotations to the method `calculateArea`.

The class [`annotations.AnnotedMethod`](src/+annotations/AnnotatedMethod.m) extends the built-in `meta.method`, and allows for inspection of annotations on methods.

Get method metadata as an `AnnotatedMethod`:

```matlab
obj = MyBasicClass;
listmethods = obj.getAnnotatedMethods
```

```
listmethods = 
  AnnotatedMethod with properties:

            Annotations: [2×1 string]
                   Name: 'calculateArea'
            Description: 'Calculates area (S)'
    DetailedDescription: ' ↵  [Serializable]↵  [XmlElement(ElementName = "Area")]↵  Area calculated by width x height.↵ ↵  See also MyOtherClass'
                 Access: 'public'
                 Static: 0
               Abstract: 0
                 Sealed: 0
     ExplicitConversion: 0
                 Hidden: 0
             InputNames: {'this'}
            OutputNames: {'S'}
          DefiningClass: [1×1 meta.class]

```

View annotation text:
```matlab
disp(listmethods(1).Annotations)
```
```
    "Serializable"
    "XmlElement(ElementName = "Area")"
```

## Describing a REST API
Annotations allow for simple creation of RESTful APIs from object code without the need to write substantial boilerplate code. This pattern is used successfully in popular Python packages such as Flask and FastAPI.

[`annotations.mixin.rest.Api`](src/+annotations/+mixin/+rest/Api.m) extends `annotations.mixin.Annotated` to provide capabilities to describe how MATLAB methods translate into RESTful interfaces.


Example [MyRestApi](examples/MyRestApi.m)
```matlab
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

```
Query REST methods:

<table>
<tr>
<td style=vertical-align:top>

```matlab
restapi = MyRestApi;
rms = restapi.getRestMethods;
method = rms(1)
```

</td>
<td style=vertical-align:top>

```
method = 
  Method with properties:

              QueryArgs: [2×1 string]
          RequestMethod: GET
            Annotations: "GET(/objects/{id}/{property})"
                   Name: 'getObjectProperty'
            Description: '[GET(/objects/{id}/{property})]'
    DetailedDescription: ''
                 Access: 'public'
                 Static: 0
               Abstract: 0
                 Sealed: 0
     ExplicitConversion: 0
                 Hidden: 0
             InputNames: {3×1 cell}
            OutputNames: {'prop'}
          DefiningClass: [1×1 meta.class]
```

</td>
</tr>
<tr>
<td style=vertical-align:top>

```matlab
class(method)
```

</td>
<td style=vertical-align:top>

```
ans = 'annotations.mixin.rest.Method'
```

</td>
</tr>

<tr>
<td style=vertical-align:top>

```matlab
method.QueryArgs
```

</td>
<td style=vertical-align:top>

```
ans = 2×1 string    
"id"         
"property"   
```

</td>
</tr>

<tr>
<td style=vertical-align:top>

```matlab
method.RequestMethod
```

</td>
<td style=vertical-align:top>

```
ans = 
  RequestMethod enumeration

    GET  
```

</td>
</tr>

</table>