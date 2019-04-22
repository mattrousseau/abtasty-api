class Api::V1::ClientsController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User, except: [ :index ]
  # before_action :set_client, only: [ :show, :update ]

  def index
    @clients = policy_scope(Client)
  end

  def create
    @client = Client.new(client_params)
    @user_client = UserClient.new(user: current_user, client: @client)
    authorize @client
    authorize @user_client
    if @client.save && @user_client.save
      render :index
    else
      render_error
    end
  end

  private

  def client_params
    params.require(:client).permit(:name)
  end

  def render_error
    render json: { errors: @client.errors.full_messages },
      status: :unprocessable_entity
  end
end
