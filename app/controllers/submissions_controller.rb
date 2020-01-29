class SubmissionsController < ApplicationController

    before_action :authenticate_user! 

    def show 
        @submission = Submission.find_by(id: params[:id])
    end 

    def index
        @submissions = Submission.all
        
    end 

    def new
        @submission = Submission.new
       
    end

    def create
        
        @submission = Submission.create(submission_params)
    
        if @submission.save
            
            redirect_to new_course_assignment_path(@submission)
        else 
            
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

    def course_params
        params.require(:course_id, :assignment_id).permit(:a_1, :a_2, :a_3)
    end
end
