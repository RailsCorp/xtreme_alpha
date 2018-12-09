module Api
  module Messages
    class CreateUSecase
      def initialize(params, team_id, group_id)
        @params = params
        @team = Team.find(team_id)
        @group = Group.find(group_id)
      end

      def execute
        message = Message.create!(
          message_type: @params[:message_type],
          team_id: @team.id,
          group_id: @group.id
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
            file: @params[:value][:image]
          )
        when "file"
          MessageFile.create!(
            message_id: message.id,
            file: @params[:value][:file]
          )
        else
          { error: I18n.t("errors.messages.not_found_type") }
        end
        # notify_workerを作る。 Messages::NotifyWorker

        Api::MessageDecorator.decorate(message)
      end
    end
  end
end
