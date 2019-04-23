class Api::V1::UsersController < Api::V1::BaseController

  def index
  end

  def create
    @user = User.new(user_params)
    authorize @user
    if @user.save
      head :no_content
    else
      render_error
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

  def render_error
    render json: { errors: @user.errors.full_messages },
      status: :unprocessable_entity
  end
end
