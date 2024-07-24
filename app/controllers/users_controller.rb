class UsersController < ApplicationController
  def index
    campaign_names = params[:campaign_name]
    if campaign_names
      campaign_names_array = campaign_names.split(",")
      @users =
        User.where(
          "JSON_CONTAINS(campaigns_list, ?)",
          campaign_names_array.map { |name| { campaign_name: name } }.to_json
        )
    elsif request.format.html?
      @users = User.paginate(page: params[:page], per_page: 10)
    else
      @users = User.paginate(page: params[:page], per_page: 10)
      return render json: @users
    end
    respond_to do |format|
      if request.format.html?
        format.html
      else
        return render json: @users
      end
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def filter
    campaign_names = params[:campaign_names].split(",")
    @users =
      User.where(
        "JSON_CONTAINS(campaigns_list, ?)",
        campaign_names.map { |name| { campaign_name: name } }.to_json
      )
    render json: @users
  end

  private

  def user_params
    params.require(:user).permit(
      :name,
      :email,
      campaigns_list: %i[campaign_name campaign_id]
    )
  end
end
