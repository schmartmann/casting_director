module ParamHelper
    def validate_params(params)
        if params["actors"].length != 0 && params["characters"].length != 0
            capture_params(params)
        else
            false
        end
    end

    def capture_params(params)
        @actors = params["actors"].split(',').map {|name| name.strip}
        @characters = params["characters"].split(',').map {|name| name.strip}
    end
end