module Api
  module Tasks
    class UpdateUsecase
      def initialize(params, task)
        @params = params
        @task = task
      end

      def execute
        if @params[:is_finished] == "true"
          success_task_log = SuccessTaskLog.new(task_id: @task.id, title: @task.title)
          success_task_log.save!
          { is_finished: true, message: I18n.t("models.messages.success_task_logs") }
        else
          update_usecase
        end
      end

      private

      def update_usecase
        if @task.update!(@params)
          Api::TaskDecorator.decorate(@task)
        else
          @task.errors.full_messages
        end
      end
    end
  end
end
