class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show]

  def show
    # authorize @user
    respond_to do |format|
      format.html {render 'show'}
      # format.json {render json: @user, include: ['created_surveys', 'participated_surveys']}
    end
  end

  private
  def set_user
    @user = User.find(params[:id])
  end
end
