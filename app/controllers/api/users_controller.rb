module Api
  class UsersController < ApplicationController
    before_action :set_user

    def show
      @user = Api::UserDecorator.decorate(@user)
      render :show, json: @user, status: :ok
    end

    private

    def set_user
      @user = User.find(params[:id])
    end
  end
end
