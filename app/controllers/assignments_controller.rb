class AssignmentsController < ApplicationController
    
    before_action :authenticate_user!
    

    def show
        @assignment = Assignment.find_by(id: params[:id])
    end
    
    def index
        
       if params[:course_id]
            set_course
            @assignments = @course.assignments
            @teacher = @course.teacher == current_user
       else 
            @assignments = Assignment.all
       end 

    end

    def new
        @assignment = Assignment.new
        @assignment = current_user.assignments_as_teacher.new(course_id: params[:course_id])
    # @assignment.courses.build

    end

    def create

        @assignment = Assignment.create(assignment_params)
  
        if @assignment.save
            flash[:success] = "Your Assignment has been Created!!"
            redirect_to course_assignments_path(@assignment)
        else 
            flash[:error] = "This Assignment !!"
            render  new
        end 


    end

    private

    def assignment_params
    params.require(:assignment).permit(:assignment_name, :description, :q_1, :q_2, :q_3, :course_id)
    # :course_attributes => [:name]
    end

    def set_course
        @course = Course.find(params[:course_id])
    end 
end
  
    

