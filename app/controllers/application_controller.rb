class ApplicationController < ActionController::Base

    def welcome 
        if  !user_signed_in? 
            redirect_to login_path
        end 
    end 
    
    helpers do 

         
        def set_course
            @course = Course.find(params[:course_id])
        end   

    end 

       


end
