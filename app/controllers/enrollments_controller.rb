class EnrollmentsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_course

    def new
        @enrollment = @course.enrollments.build
       
    end

    def create
        binding.pry 
        @enrollment = current_user.enrollments.build(enrollment_params)
        @enrollment.student_id = current_user.id

        if @enrollment.save
            flash[:success] = "Your Enrolled!!"
            redirect_to new_course_assignment_path(@enrollment)
        else 
            flash[:error] = "Error Try again!!"
            redirect_to  new_course_path  
        end 
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

    private 

    def enrollment_params
        params.require(:enrollment).permit(:course_id, :student_id)
    end
    
    def set_course
        @course = Course.find(params[:course_id])
    end 
    #validattion on the assignmets to put a vaildation that the student is enrolled
    #

end
