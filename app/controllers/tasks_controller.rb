class TasksController < ApplicationController
  before_action :set_task, only: %i[edit update destroy]
  # Task一覧画面表示
  def index
    @tasks = Task.all
  end
  # Task作成画面表示
  def new
    @task = Task.new
  end
  # Task作成処理
  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to tasks_path
    end
  end
  def edit
  end
  # Task更新処理
  def update
    if @task.update(task_params)
      redirect_to tasks_path
    end
  end
  # Task削除処理
  def destroy
    @task.destroy
    redirect_to tasks_path
  end
  private
  # ストロングパラメータ
  # permitで指定した項目を許可する
  def task_params
    params.require(:task).permit(:content)
  end
  def set_task
    @task = Task.find(params[:id])
  end
end
