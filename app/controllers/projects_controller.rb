class ProjectsController < ApplicationController
    before_action :set_project, only: [:show, :edit, :update]
    
    def index
    end
    
    def show
    end
    
      def new
        @project = Project.new(user_id: current_user.id)
      end

    def create
        @project = Project.new(project_params)
        @project.user_id = current_user.id
        if @project.save
            redirect_to(@project)
        else
            render(:new)
        end
    end

    def edit
    end

    def update
        @project.update(project_params)
        if @project.save
            redirect_to(@project)
        else
            render(:edit)
        end
    end

    def destroy
        @project = Project.find(params[:id])
        @project.destroy
        redirect_to(current_user)
    end

    private

    def set_project
        @project = Project.find(params[:id])
    end

    def project_params
        params.require(:project).permit(:name, :type, :desc, :status, :user_id, :contractor_id)
    end
end