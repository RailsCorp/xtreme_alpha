module Api
  module Messages
    class IndexQuery
      def initialize(team_id)
        @team_id = team_id
      end

      def execute
        team = Team.find(@team_id)
        messages = team
                    .includes(:group)
                    .messages
                      .where(created_at >= (Time.zone.now - 3.months))
                      .with_message_text
                      .with_message_image
                      .with_message_file
                      .order("created_at ASC")

        Api::MessagesDecorator.decorate_collection(messages)
      end
    end
  end
end
