class CoursesController < ApplicationController

    before_action :authenticate_user!
    
    def show 
        @course = Course.find_by(id: params[:id])
    end 

    def index
        @courses = Course.all
        
    end 

    def new
        @course = Course.new
       
    end

    def create
        
        @course = current_user.courses_as_teacher.create(course_params)
    
        if @course.save
            
            redirect_to new_course_assignment_path(@course)
        else 
            
            redirect_to  new_course_path  
        end 

       
    end

    def destroy
        @course =   Course.find(params[:id])
        @course.destroy
        flash[:notice] = "Course deleted."
        redirect_to courses_path
    end

    private

    def course_params
        params.require(:course).permit(:course_name, :description, :teacher_id)
    end

    # , course_ids:[], :course_attributes => [:name]
    
end
