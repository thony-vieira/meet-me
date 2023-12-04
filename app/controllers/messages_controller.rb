class MessagesController < ApplicationController
  def create
    @group = Group.find(params[:group_id])
    @message = Message.new(message_params)
    @message.group = @group
    @message.member = Member.find_by(user: current_user)
    if @message.save
      redirect_to group_activities_path(@group)
    else
      render "activities/index", status: :unprocessable_entity
    end

  end
  private

  def message_params
    params.require(:message).permit(:content)
  end

end
