class LandingController < ApplicationController
  skip_before_action :authenticate_user!
  def index
  end

  def learn_more
  end
end
