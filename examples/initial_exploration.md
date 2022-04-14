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
    DetailedDescription: ' ↵  [Serializable]↵  [FieldName("Area")]↵  Area calculated by width x height.↵ ↵  See also MyOtherClass'
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
       [FieldName("Area")]
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
```

```text:Output
Invalid or deleted object.
```

```matlab:Code
disp(classAnnotations)
```

```matlab:Code
restapi = MyRestApi
```

```text:Output
restapi = 
  MyRestApi with properties:

      Objects: []
    StartTime: 13-Apr-2022 00:00:45

```

```matlab:Code
restapi.main
```

```text:Output
ans = "My example RESTful API. Started at: 13-Apr-2022 00:00:45"
```

```matlab:Code
annotatedMethods = restapi.getAnnotatedMethods
```

```text:Output
annotatedMethods = 
  2x1 AnnotatedMethod array with properties:

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

            Annotations: "GET(/objects/{id})"
                   Name: 'getObject'
            Description: '[GET(/objects/{id})]'
    DetailedDescription: '  [SomeTag]'
                 Access: 'public'
                 Static: 0
               Abstract: 0
                 Sealed: 0
     ExplicitConversion: 0
                 Hidden: 0
             InputNames: {2x1 cell}
            OutputNames: {'obj'}
          DefiningClass: [1x1 meta.class]

```

```matlab:Code
annotatedMethods(2)
```

```text:Output
ans = 
  AnnotatedMethod with properties:

            Annotations: "GET(/)"
                   Name: 'main'
            Description: '[GET(/)]'
    DetailedDescription: ''
                 Access: 'public'
                 Static: 0
               Abstract: 0
                 Sealed: 0
     ExplicitConversion: 0
                 Hidden: 0
             InputNames: {'this'}
            OutputNames: {'msg'}
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
         PathParameters: [2x1 string]
        QueryParameters: [2x1 string]
         BodyParameters: []
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
ans = 2x1 string    
"id"         
"property"   

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
             Parameters: {2x1 cell}
         PathParameters: [0x0 string]
        QueryParameters: [2x1 string]
         BodyParameters: []
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

  0x0 empty string array
```

```matlab:Code
method.QueryParameters
```

```text:Output
ans = 2x1 string    
"limit"      
"skip"       

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
  PathParameter with properties:

    Method: [1x1 annotations.mixin.rest.Method]
      Name: "name"

```

```matlab:Code
method.QueryParameters
```

```text:Output
ans = 

  0x0 Parameter array with properties:

    Method
    Name
```

```matlab:Code
method.BodyParameters
```

```text:Output
ans = 
  BodyParameter with properties:

    Method: [1x1 annotations.mixin.rest.Method]
      Name: "object"

```
