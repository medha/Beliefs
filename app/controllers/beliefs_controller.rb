class BeliefsController < ApplicationController
  before_filter :signed_in_user, only: [:create, :destroy]
  before_filter :correct_user,   only: :destroy

def create
    @belief = current_user.beliefs.build(params[:belief])
    if @belief.save
      flash[:success] = "Belief added!"
      redirect_to root_url
    else
    	@feed_items = []
    	render 'static_pages/home'
    end
  end

  def destroy
    @belief.destroy
    redirect_to root_url
  end

  private

    def correct_user
      @belief = current_user.beliefs.find_by_id(params[:id])
      redirect_to root_url if @belief.nil?
    end
end
