class AssignmentsController < ApplicationController
    
    before_action :authenticate_user!
    
    def show
        @assignment = Assignment.find_by(id: params[:id])
    end
    
    def index
        @assignments = Assignment.all
    end

    def new
        @assignment = Assignment.new
    # @assignment.courses.build

    end

    def create
        assignment = Assignment.create(assignment_params)
        redirect_to assignment
    end

    private

    def assignment_params
    params.require(:assignment).permit(:title, :content, course_ids:[], :course_attributes => [:name])
    end
end
  
    

