class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show, :edit, :update, :destroy]
  before_action :set_user, only: [:index, :show, :edit, :update, :destroy]
  after_action :verify_authorized

  # GET /users
  # GET /users.json
  def index
    authorize User
  end

  # GET /users/1
  # GET /users/1.json
  def show
    authorize User
  end

  # GET /users/1/edit
  def edit
    authorize User
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    authorize User
    respond_to do |format|
      if @user.update(user_params.except(:phrase_description))
        @phrase.update(description: user_params[:phrase_description])
        format.html { redirect_to users_url}
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    authorize User
    @user.destroy
    respond_to do |format|
      format.html { redirect_to reviews_url}
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(current_user.id)
      @phrase = Phrase.find_or_create_by(user_id: current_user.id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:names, :lastnames, :date_of_birth, :profile_picture, :phrase_description)
    end
end
