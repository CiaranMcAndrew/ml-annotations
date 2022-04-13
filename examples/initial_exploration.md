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
method = rms(1)
```

```text:Output
method = 
  Method with properties:

              QueryArgs: [2x1 string]
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
method.QueryArgs
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
