class Api::V1::UserClientsController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User, except: [ :index ]
  before_action :set_user_client, only: [ :destroy ]

  def index
    @user_clients = policy_scope(UserClient)
  end

  def create
    @user_client = UserClient.new
    @user_client.user = User.find(user_client_params[:user_id])
    @user_client.client = Client.find(user_client_params[:client_id])
    authorize @user_client
    if @user_client.save
      render :index
    else
      render_error
    end
  end

  def destroy
    authorize @user_client
    @user_client.destroy
    head :no_content
  end

  private

  def set_user_client
    @user_client = UserClient.find(params[:id])
  end

  def user_client_params
    params.require(:user_client).permit(:user_id, :client_id)
  end

  def render_error
    render json: { errors: @user_client.errors.full_messages },
      status: :unprocessable_entity
  end
end
