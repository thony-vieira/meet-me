class GroupsController < ApplicationController
  before_action :set_group, only: %i[edit update destroy]

  def index
    @members = Member.includes(:group).where(user: current_user)
  end

  def show
    @group = Group.find(params[:id])
    @users = User.where.not(id: current_user)
    @users_in_group = @group.members.map(&:user)
    @markers = @users_in_group.reject { |user| user.latitude.blank? || user.longitude.blank? }.map do |user|
      {
        lat: user.latitude,
        lng: user.longitude
        # trocar a cor dos usuarios - Ler a documentação mapbox
      }
    end
    lat_sum = 0.0
    lng_sum = 0.0

    @markers.each do |marker|
      lat_sum += marker[:lat]
      lng_sum += marker[:lng]
    end
    lat_mid = lat_sum / @markers.length
    lng_mid = lng_sum / @markers.length

    mid_marker = {
      lat: lat_mid,
      lng: lng_mid
      # trocar a cor do meio da rota - Ler a documentação mapbox
    }
    @markers.push(mid_marker)
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.user = current_user
    if @group.save
      redirect_to group_path(@group)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @group.update(group_params)
      redirect_to group_path(@group), notice: "Group was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @group.destroy
    redirect_to groups_path, status: :see_other
  end

  private

  def group_params
    params.require(:group).permit(:name, :category)
  end

  def set_group
    @group = Group.find(params[:id])
  end
end
