function listAnnotations = getAnnotationsForMethod(method, expression)
arguments
    method (1,1) meta.method
    expression string = "";
end

fullDescription = string([method.Description method.DetailedDescription]);

if expression == ""
    exp = "(?<=\[).+?(?=\])"; % https://regex101.com/r/AB8inS/1
else
    exp = "(?<=\[)" + expression + "(?=\])";
end

listAnnotations = regexp(fullDescription, exp, "match")';


end