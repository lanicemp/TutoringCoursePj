class SubmissionsController < ApplicationController

    before_action :authenticate_user! 

    def show 
        @submission = Submission.find_by(id: params[:id])
        set_assignment
      
    end 

    def index
        
        if params[:user_id]
            set_course
            @assignments = @course.assignments
        else 
        @submissions = Submission.all  
        end 
    end 

    def new
        @submission = Submission.new
      
        @assignment  = Assignment.find(params[:assignment_id])

        @submission = @assignment.submissions.build
        @submission.user_id = current_user.id
        # @assignment = current_user.new(course_id: params[:course_id])
       
    end

    def create
        
        @submission = current_user.submissions.build(submission_params)
        @submission.user_id = current_user.id
        if @submission.save
            flash[:success] = "Your Assignment has been Submitted!!"
            redirect_to courses_path
        else 
            
            flash[:error] = "Your Assignment has Not Submitted."
            redirect_to  new_course_path  
        end 

       
    end

    def destroy
        @submission =   Submission.find(params[:id])
        @submission.destroy
        flash[:notice] = "Submission deleted."
        redirect_to courses_path
    end

    private

    def submission_params
        params.require(:submission).permit(:a_1, :a_2, :a_3, :assignment_id, :user_id)
    end

    def set_assignment
        @assignment  = Assignment.find(params[:assignment_id]) 
    end
end
