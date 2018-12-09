module Api
  class MessagesController < ApplicationController
    before_action :if_user_joined_group?
    before_action :set_group
    before_action :set_team
    before_action :set_message, only: %i[destroy]

    def index
      @messages = Api::Messages::IndexQuery
                      .new(@team.id).execute
      render :index, formats: :json, status: :ok
    end

    def create
      # 本当はsidekiqで非同期処理にして全ての端末に対してpush_messageしたい。
      @message = Api::Messages::CreateUsecase
                    .new(message_params, @team.id, @group.id)
                    .execute

      render :show, formats: :json, status: :ok
    end

    def destroy
      @message.destroy
      render json: { id: params[:id].to_i }, status: 200
    end

    private

    def set_group
      @group = Group.find(params[:group_id])
    end

    def set_team
      @team = Team.find(params[:team_id])
    end

    def set_message
      @message = Message.find(params)
    end

    def message_params
      params
        .require(:messages)
        .permit(
          :message_type,
          value: %i[
            text
            image
            file
          ]
        )
    end

    def if_user_joined_group?
      if Rails.env != "production"
        false
      end
    end
  end
end
