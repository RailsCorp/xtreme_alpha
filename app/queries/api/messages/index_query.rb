module Api
  module Messages
    class IndexQuery
      def initialize(team_id)
        @team_id = team_id
      end

      def execute
        team = Team.find(@team_id)
        messages =
          team
            .messages
              .where("created_at >= ?", DateTime.now - 3.months)
              .order(:created_at)

        Api::MessageDecorator.decorate_collection(messages)
      end
    end
  end
end
