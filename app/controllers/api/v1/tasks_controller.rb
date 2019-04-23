class Api::V1::TasksController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User, except: [ :index ]
  before_action :set_task, only: [ :destroy, :update ]

  def index
    @tasks = policy_scope(Task)
  end

  def my_weekly_tasks
    @tasks = Task.where(user: current_user).select { |task| current_week?(task.start_at) }
    @tasks.each { |task| authorize task }
    render :index
  end

  def create
    @task = Task.new(task_params)
    @task.user = User.find(task_params[:user_id])
    @task.client = Client.find(task_params[:client_id])
    authorize @task
    if @task.save
      render :index
    else
      render_error
    end
  end

  def update
    authorize @task
    if @task.update(task_params)
      render :index
    else
      render_error
    end
  end

  def destroy
    authorize @task
    @task.destroy
    head :no_content
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:user_id, :client_id, :description, :start_at, :end_at)
  end

  def render_error
    render json: { errors: @task.errors.full_messages },
      status: :unprocessable_entity
  end

  def current_week?(date)
    first_day_of_current_week = Date.today.beginning_of_week
    date >= first_day_of_current_week and date < first_day_of_current_week + 6.days
  end
end
