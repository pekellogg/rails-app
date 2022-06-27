class ProjectsController < ApplicationController
    def index
        if @user = check_from_user
            @user.projects
        else
            @projects = Project.all 
        end
    end
    
    def show
        if params[:user_id]
          @project = User.find(params[:user_id]).projects.find(params[:id])
        else
          @project = Project.find(params[:id])
        end
    end
    
      def new
        if params[:user_id] && !User.exists?(params[:user_id])
          redirect_to(users_path, alert: "User not found!")
        else
          @project = Project.new(user_id: params[:user_id])
        end
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
        if params[:user_id]
            user = User.find_by(id: params[:user_id])
            @project = user.projects.find_by(id: params[:id])
            redirect_to(user_projects_path(user), alert: "Project not found!") if @project.nil?
        end
        @project = Project.find(params[:id])
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
        @project = Project.find(params[:id])
        @project.destroy
        flash[:notice] = "Project deleted."
        redirect_to(projects_path)
    end

    private

    def project_params
        params.require(:project).permit(:name, :type, :desc, :status, :user_id)
    end

    def check_from_user
        params[:user_id] ? User.find(params[:user_id]) : false
    end
end