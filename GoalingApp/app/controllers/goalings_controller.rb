class GoalingsController < ApplicationController
  def create
    @goal = Goaling.new(goal_params)
    @goal.user_id = current_user.id
    @goal.save
    flash[:errors] = @goal.errors.full_messages
    redirect_to user_url(current_user)
  end

  def update

  end

  def destroy

  end


  private
  def goal_params
    params.require(:goal).permit(:private_public, :title, :completion)
  end
end
