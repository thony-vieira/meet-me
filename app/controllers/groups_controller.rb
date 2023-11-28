class GroupsController < ApplicationController
  before_action :set_group, only: %i[edit update destroy]

  def index
    @groups = Group.all
  end

  def show
    @group = Group.find(params[:id])
  end

  def new
    @group = Group.new
  end

  def create
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
