module Api
  class TeamsController < ApplicationController
    before_action :if_user_joined_group?
    before_action :set_group
    before_action :set_team, only: %i[show update destroy]

    def index
      @teams = Api::Teams::IndexQuery.new.execute
      render :index, formats: :json, status: :ok
    end

    def show
      @team = Api::TeamDecorator.decorate(@team)
      render :show, status: :ok
    end

    def create
      @team = Team.new(team_params)

      if @team.save
        @team = Api::TeamDecorator.decorate(@team)
        render :show, status: :created
      else
        render json: @team.errors.full_messages, status: :unprocessable_entity
      end
    end

    def update
      if @team.update(team_params)
        @team = Api::TeamDecorator.decorate(@team)
        render :show, json: @team, status: :ok
      else
        render json: @team.errors.full_messages, status: :unprocessable_entity
      end
    end

    def destroy
      @team.destroy
      render json: { id: params[:id].to_i }, status: 200
    end

    private

    def set_group
      @group = Group.find(params[:group_id])
    end

    def set_team
      @team = Team.find(params[:id])
    end

    def team_params
      params
        .require(:teams)
        .permit(
          :name,
          :introduce,
          :image
        ).merge(
          group_id: @group.id
        )
    end
  end
end