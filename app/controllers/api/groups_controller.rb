module Api
  class GroupsController < ApplicationController
    before_action :set_group, only: %i[update destroy show]
    before_action :if_user_joined_group?, only: %i[update destroy show]

    def create
      group = Group.new(group_params)
      if group.save
        @group = Api::GroupDecorator.decorate(group)
        render :show, json: @group, status: :created
      else
        render json: @group.errors.full_messages, status: :unprocessable_entity
      end
    end

    def update
      if @group.update(group_params)
        @group = Api::GroupDecorator.decorate(@group)
        render :show, json: @group, status: :ok
      else
        render json: @group.errors.full_messages, status: :unprocessable_entity
      end
    end

    def destroy
      @group.destroy
      render json: { id: params[:id].to_i }, status: 200
    end

    def show
      @group = Api::GroupDecorator.decorate(@group)
      render :show, json: @group, status: :ok
    end

    private

    def set_group
      @group = Group.find(params[:id])
    end

    def group_params
      params
        .require(:groups)
        .permit(
          :group_type,
          :name,
          :image
        )
    end
  end
end
