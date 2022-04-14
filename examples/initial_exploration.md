```matlab:Code
mc = meta.class.fromName("MyBasicClass");
disp(mc.MethodList(1).Description)
```

```text:Output
Calculates area (S)
```

```matlab:Code

mc.MethodList(1)
```

```text:Output
ans = 
  method with properties:

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
          DefiningClass: [1x1 meta.class]

```

```matlab:Code

mc.MethodList(1).DetailedDescription
```

```text:Output
ans = 
    ' 
       [Serializable]
       [XmlElement(ElementName = "Area")]
       Area calculated by width x height.
      
       See also MyOtherClass'

```

```matlab:Code
obj = MyBasicClass;
listmethods = obj.getAnnotatedMethods
```

```text:Output
listmethods = 
  AnnotatedMethod with properties:

            Annotations: [2x1 string]
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
          DefiningClass: [1x1 meta.class]

```

```matlab:Code
disp(listmethods(1).Annotations)
```

```text:Output
    "Serializable"
    "XmlElement(ElementName = "Area")"
```

```matlab:Code
classAnnotations = annotations.getAnnotationsForMethod(mc.MethodList(1));
disp(classAnnotations)
```

```text:Output
    "Serializable"
    "XmlElement(ElementName = "Area")"
```

```matlab:Code
restapi = MyRestApi
```

```text:Output
restapi = 
  MyRestApi with properties:

        Objects: []
      StartTime: 14-Apr-2022 01:22:40
    ContentType: [1x1 matlab.net.http.field.ContentTypeField]

```

```matlab:Code
restapi.main
```

```text:Output
ans = "My example RESTful API. Started at: 14-Apr-2022 01:22:40"
```

```matlab:Code
annotatedMethods = restapi.getAnnotatedMethods
```

```text:Output
annotatedMethods = 
  5x1 AnnotatedMethod array with properties:

    Annotations
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

```

```matlab:Code
annotatedMethods(1)
```

```text:Output
ans = 
  AnnotatedMethod with properties:

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
             InputNames: {3x1 cell}
            OutputNames: {'prop'}
          DefiningClass: [1x1 meta.class]

```

```matlab:Code
annotatedMethods(2)
```

```text:Output
ans = 
  AnnotatedMethod with properties:

            Annotations: "POST(/object/{name})"
                   Name: 'addObject'
            Description: '[POST(/object/{name})]'
    DetailedDescription: ''
                 Access: 'public'
                 Static: 0
               Abstract: 0
                 Sealed: 0
     ExplicitConversion: 0
                 Hidden: 0
             InputNames: {3x1 cell}
            OutputNames: {'status'}
          DefiningClass: [1x1 meta.class]

```

```matlab:Code
restapi = MyRestApi;
rms = restapi.getRestMethods;
method = findobj(rms, "Name", "getObjectProperty")
```

```text:Output
method = 
  Method with properties:

               Endpoint: "GET(/objects/{id}/{property})"
             Parameters: [2x1 annotations.mixin.rest.parameters.PathParameter]
         PathParameters: [2x1 annotations.mixin.rest.parameters.PathParameter]
        QueryParameters: [0x0 annotations.mixin.rest.parameters.PathParameter]
         BodyParameters: [0x0 annotations.mixin.rest.parameters.PathParameter]
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
             InputNames: {3x1 cell}
            OutputNames: {'prop'}
          DefiningClass: [1x1 meta.class]

```

```matlab:Code
class(method)
```

```text:Output
ans = 'annotations.mixin.rest.Method'
```

```matlab:Code
method.PathParameters
```

```text:Output
ans = 
  2x1 PathParameter array with properties:

    Method
    Name
    Type

```

```matlab:Code
method.RequestMethod
```

```text:Output
ans = 
  RequestMethod enumeration

    GET

```

```matlab:Code
class(method.RequestMethod)
```

```text:Output
ans = 'matlab.net.http.RequestMethod'
```

```matlab:Code
restapi = MyRestApi;
rms = restapi.getRestMethods;
method = findobj(rms, "Name", "getObjects")
```

```text:Output
method = 
  Method with properties:

               Endpoint: "GET(/objects)"
             Parameters: [2x1 annotations.mixin.rest.parameters.QueryParameter]
         PathParameters: [0x0 annotations.mixin.rest.parameters.QueryParameter]
        QueryParameters: [2x1 annotations.mixin.rest.parameters.QueryParameter]
         BodyParameters: [0x0 annotations.mixin.rest.parameters.QueryParameter]
          RequestMethod: GET
            Annotations: "GET(/objects)"
                   Name: 'getObjects'
            Description: 'Gets all objects'
    DetailedDescription: '  Returns objects from skip up to amount defined by limit↵  [GET(/objects)]'
                 Access: 'public'
                 Static: 0
               Abstract: 0
                 Sealed: 0
     ExplicitConversion: 0
                 Hidden: 0
             InputNames: {3x1 cell}
            OutputNames: {'col'}
          DefiningClass: [1x1 meta.class]

```

```matlab:Code
method.PathParameters
```

```text:Output
ans = 

  0x0 QueryParameter array with properties:

    Method
    Name
    Type
```

```matlab:Code
method.QueryParameters
```

```text:Output
ans = 
  2x1 QueryParameter array with properties:

    Method
    Name
    Type

```

```matlab:Code
restapi = MyRestApi;
rms = restapi.getRestMethods;
method = findobj(rms, "Name", "addObject")
```

```text:Output
method = 
  Method with properties:

               Endpoint: "POST(/object/{name})"
             Parameters: [2x1 annotations.mixin.rest.parameters.Parameter]
         PathParameters: [1x1 annotations.mixin.rest.parameters.PathParameter]
        QueryParameters: [0x0 annotations.mixin.rest.parameters.Parameter]
         BodyParameters: [1x1 annotations.mixin.rest.parameters.BodyParameter]
          RequestMethod: POST
            Annotations: "POST(/object/{name})"
                   Name: 'addObject'
            Description: '[POST(/object/{name})]'
    DetailedDescription: ''
                 Access: 'public'
                 Static: 0
               Abstract: 0
                 Sealed: 0
     ExplicitConversion: 0
                 Hidden: 0
             InputNames: {3x1 cell}
            OutputNames: {'status'}
          DefiningClass: [1x1 meta.class]

```

```matlab:Code
method.PathParameters
```

```text:Output
ans = 
    Method: [1x1 annotations.mixin.rest.Method]
      Name: "name"
      Type: "PathParameter"

```

```matlab:Code
method.QueryParameters
```

```text:Output
ans =   0x0 Parameter array
```

```matlab:Code
method.BodyParameters
```

```text:Output
ans = 
    Method: [1x1 annotations.mixin.rest.Method]
      Name: "object"
      Type: "BodyParameter"

```

```matlab:Code
method.Parameters
```

```text:Output
ans = 
  2x1 Parameter array with properties:
                 Method                    Name           Type      
    _________________________________    ________    _______________

    1x1 annotations.mixin.rest.Method    "name"      "PathParameter"
    1x1 annotations.mixin.rest.Method    "object"    "BodyParameter"

```
