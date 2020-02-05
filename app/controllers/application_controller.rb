class ApplicationController < ActionController::Base

    def welcome 
    end 
    
    helpers do 

         
        def set_course
            @course = Course.find(params[:course_id])
        end   

    end 

       


end
