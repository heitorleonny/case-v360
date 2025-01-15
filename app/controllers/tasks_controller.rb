class TasksController < ApplicationController
  before_action :set_task_list

  def new
    @task = Task.new
  end

  def show
    @task_list = TaskList.find(params[:task_list_id])
    @task = @task_list.tasks.find(params[:id])
  end
  
  def edit
    @task =  @task_list.tasks.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to task_list_path(@task_list), notice: 'Task was successfully updated.'
    else
      render :edit
    end
  end
  

  def create
    @task = @task_list.tasks.new(task_params)

    if @task.save
      redirect_to task_list_path(@task_list), notice: 'Task was successfully created.'
    else
      render :new
    end
  end

  private

  def set_task_list
    @task_list = TaskList.find(params[:task_list_id])
  end

  def task_params
    params.require(:task).permit(:name, :status, :comment, :task_list_id)
  end

  def destroy
    @task.destroy
    redirect_to task_list_path(@task_list), notice: "Task was successfully deleted."
  end

end
