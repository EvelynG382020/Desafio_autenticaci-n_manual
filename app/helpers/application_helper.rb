module ApplicationHelper
    def logged
        if session[:user_id].nil?
            false
        else
            true
        end
    end
end
