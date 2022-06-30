class ProjectsController < ApplicationController
    def index
        @user = User.find(params[:user_id])
        @projects = @user.projects
    end
    
    def show
        @project = Project.find(params[:id])
    end
    
      def new
        @user = User.find(params[:user_id])
        @project = Project.new
      end

    def create
        @project = Project.new(project_params)
        if @project.save
            redirect_to(@project)
        else
            render(:new)
        end
    end

    def edit
        @user = User.find(params[:user_id])
        @project = Project.find(params[:id])
        render(:edit)
    end

    def update
        @project = Project.find(params[:id])
        @project.update(project_params)
        if @project.save
            redirect_to(@project)
        else
            render(:edit)
        end
    end

    def destroy
        @user = User.find_by(id: params[:user_id])
        @project = Project.find(params[:id])
        @project.destroy
        flash.now[:notice] = "Project deleted!"
        redirect_to(user_projects_path(user))
    end

    private

    def project_params
        params.require(:project).permit(:name, :type, :desc, :status, :user_id, :contractor_id)
    end
end