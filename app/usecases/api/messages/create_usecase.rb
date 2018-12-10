module Api
  module Messages
    class CreateUsecase
      def initialize(params, team_id, user_id)
        @params = params
        @team_id = team_id
        @user_id = user_id
      end

      def execute
        message = Message.create!(
          message_type: @params[:message_type],
          team_id: @team_id,
          user_id: @user_id
        )

        case message.message_type
        when "text"
          MessageText.create!(
            message_id: message.id,
            text: @params[:value][:text]
          )
        when "image"
          MessageImage.create!(
            message_id: message.id,
            image: @params[:value][:image]
          )
        when "file"
          MessageFile.create!(
            message_id: message.id,
            file: @params[:value][:file]
          )
        else
          return { error: I18n.t("errors.messages.not_found_type") }
        end
        # notify_workerを作る。 Messages::NotifyWorker

        Api::MessageDecorator.decorate(message)
      end
    end
  end
end
