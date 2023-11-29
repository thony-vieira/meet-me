class MembersController < ApplicationController
  def create
    @group = Group.find(params[:group_id])
    @member = Member.new(user_id: params[:user_id])
    @member.group = @group

    if @member.save
      redirect_to group_path(@group)
    else
      render 'groups/show', status: :unprocessable_entity
    end
  end

  def destroy
    @member = Member.find(params[:id])
    @member.destroy
    redirect_to group_path, status: :see_other
  end
end
