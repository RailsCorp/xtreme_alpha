module Api
  module Teams
    class IndexQuery
      def initialize; end

      def execute
        teams =
          Team
            .includes(:group)
            .order(:created_at)

        Api:: TeamDecorator.decorate_collection(teams)
      end
    end
  end
end