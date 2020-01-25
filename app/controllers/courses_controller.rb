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
    # @assignment.courses.build
    end

    def create
    course = Course.create(course_params)
    redirect_to course
    end

    private

    def course_params
    params.require(:course).permit(:title, :content, course_ids:[], :course_attributes => [:name])
    end


    
end
