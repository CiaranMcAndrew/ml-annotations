classdef Path < handle

    % See https://swagger.io/specification/#paths-object

    properties
        Endpoint (1,1) string
        RequestMethod (1,1) matlab.net.http.RequestMethod
        Description (1,1) string
        StatusCode (1,1) matlab.net.http.StatusCode
        Parameters
    end

    methods

    end
end
