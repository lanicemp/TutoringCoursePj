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
    course = Course.create(course_params)
        if @course.save 
            redirect_to @course
        else render:new
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
        params.require(:course).permit(:course_name, :descripton, :content, course_ids:[], :course_attributes => [:name])
    end


    
end
