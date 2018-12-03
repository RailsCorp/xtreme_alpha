require "rails_helper"

RSpec.describe "Tasks Controller Requests", type: :request do
  before do
    @user = create(:user)
  end
  let(:params) {
    {
      tasks: {
        title: "test1",
        deadline: "2018-11-04 20:46:57",
        is_finished: true,
        content: "test1"
      }
    }
  }
  let(:params1) {
    {
      tasks: {
        title: "test1",
        deadline: "2018-11-04 20:46:57",
        is_finished: false,
        content: "test2"
      }
    }
  }
  it "#index action" do
    get api_user_tasks_path(@user)
    expect(response).to have_http_status(200)
    expect(response.content_type).to eq("application/json")
  end

  it "#show action" do
    @task = create(:task, user_id: @user.id)
    get api_user_task_path(@user, @task)
    expect(response).to have_http_status(200)
    expect(response.content_type).to eq("application/json")
    body = JSON.parse(response.body)
    expect(body["deadline"].class).to eq(String)
    expect(body["is_finished"]).to eq false
  end

  it "#create action" do
    post api_user_tasks_path(@user), params: params
    expect(response).to have_http_status(201)
    expect(response.content_type).to eq("application/json")
  end

  it "#update action" do
    @task = create(:task, user_id: @user.id)
    expect do
      put api_user_task_path(@user, @task), params: params
    end.to change(
      SuccessTaskLog, :count
    ).by(1)
    expect(response).to have_http_status(200)
    expect(response.content_type).to eq("application/json")
    body = JSON.parse(response.body)
    expect(body["is_finished"]).to eq true
    expect(body["message"]).to eq "タスクお疲れ様でした"
  end

  it "#update action2" do
    @task = create(:task, user_id: @user.id)
    expect do
      put api_user_task_path(@user, @task), params: params1
    end.to change(
      SuccessTaskLog, :count
    ).by(0)
    expect(response).to have_http_status(200)
    expect(response.content_type).to eq("application/json")
    body = JSON.parse(response.body)
    expect(body["content"]).to eq "test2"
  end

  it "#destroy action" do
    @task = create(:task, user_id: @user.id)
    delete api_user_task_path(@user, @task)
    expect(response).to have_http_status(200)
    expect(response.content_type).to eq("application/json")
  end
end
