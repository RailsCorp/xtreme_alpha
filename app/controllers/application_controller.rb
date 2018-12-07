class ApplicationController < ActionController::Base
  include DeviseTokenAuth::Concerns::SetUserByToken
  protect_from_forgery with: :null_session

  before_action :authenticate_api_user!

  def if_user_joined_group?
    groups = []
    current_api_user.members.map do |member|
      groups.push member.group
    end

    if groups.blank?
      # errorメッセージを後々,i18nで作成
      render json: { text: I18n.t("errors.if_user_joined_group") }, status: :unprocessable_entity
    end
  end
end
