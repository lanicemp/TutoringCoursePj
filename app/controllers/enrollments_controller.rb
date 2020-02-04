class EnrollmentsController < ApplicationController
    before_action :authenticate_user!

    def new
        @enrollment = Enrollment.new
       
    end

    def create
        @enrollment = current_user.enrollment.build(enrollment_params)
        @enrollment.user_id = current_user.id

        if @enrollment.save
            flash[:success] = "Your Enrolled!!"
            redirect_to new_course_assignment_path(@enrollment)
        else 
            flash[:error] = "Error Try again!!"
            redirect_to  new_course_path  
        end 

        def index
         
            if params[:course_id]
                 @course = Course.find(params[:course_id]) 
                 @enrollments = @course.enrollments
                 @teacher = @course.teacher == current_user
            else 
                 @assignments = Assignment.all
            end 
     
        end


        def enrollment_params
            params.require(:submission).permit(:course_id, :user_id)
        end
    #add a create and a new with a form pass the current insert a then redirect to the courses assignments
    #link to the 
    #validattion on the assignmets to put a vaildation that the student is enrolled
    #

end
