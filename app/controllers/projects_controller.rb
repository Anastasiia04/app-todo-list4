class ProjectsController < ApplicationController
  before_action :set_project, only: [:edit, :update, :destroy]

  # http://edgeapi.rubyonrails.org/classes/ActionController/Responder.html
  respond_to :html
  respond_to :js

  # GET /tasks
  def index
    @complete_projects = Project.complete
    @incomplete_projects = Project.incomplete
  end

  # GET /tasks/new
  def new
    @project = Project.new
    respond_with(@project)
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  def create
    @project = Project.new(project_params)
    @project.user_id = current_user.id
    @project.completed = false
    @project.save
    respond_with(@project)
  end

  # PATCH/PUT /tasks/1
  def update
    @project.update(project_params)
    respond_with(@project)
  end

  # DELETE /tasks/1
  def destroy
    @project.destroy
    respond_with(@project)
  end

  def complete
    @project = Project.find(params[:id])
    @project.completed = true
    @project.save
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      # params.require(:task).permit(:name, :completed, :user_id)
      params.require(:project).permit(:name)
    end
end
