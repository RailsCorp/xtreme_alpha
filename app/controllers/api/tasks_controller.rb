module Api
  class TasksController < ApplicationController
    before_action :set_task, only: %i[update destroy show]

    def index
      tasks = Task.all
      @tasks = Api::TaskDecorator.decorate_collection(tasks)
      render :index, json: @tasks, status: :ok
    end

    def create
      task = Task.new(task_params)
      if task.save
        @task = Api::TaskDecorator.decorate(task)
        render :show, json: @task, status: :created
      else
        render json: task.errors.full_messages, status: :unprocessable_entity
      end
    end

    def update
      if @task.update(task_params)
        @task = Api::TaskDecorator.decorate(@task)
        render :show, json: @task, status: :ok
      else
        render json: @task.errors.full_messages, status: :unprocessable_entity
      end
    end

    def destroy
      @task.destroy
      render json: { id: params[:id].to_i }, status: 200
    end

    def show
      @task = Api::TaskDecorator.decorate(@task)
      render :show, json: @task, status: :ok
    end

    private

    def set_task
      @task = Task.find(params[:id])
    end

    def task_params
      params
        .require(:tasks)
        .permit(
          :title,
          :content,
          :is_finished,
          :deadline
        )
    end
  end
end
