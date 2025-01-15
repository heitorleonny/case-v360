class TaskListsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_task_list, only: %i[show edit update destroy]

  def index
    @task_lists = current_user.task_lists
  end

  def show
  end

  def new
    @task_list = current_user.task_lists.build
  end

  def create
    @task_list = current_user.task_lists.build(task_list_params)
    if @task_list.save
      redirect_to @task_list, notice: 'Task list was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @task_list.update(task_list_params)
      redirect_to @task_list, notice: 'Task list was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @task_list.destroy
    redirect_to task_lists_url, notice: 'Task list was successfully destroyed.'
  end

  private

  def set_task_list
    @task_list = current_user.task_lists.find(params[:id])
  end

  def task_list_params
    params.require(:task_list).permit(:name, :user_id)
  end
end
