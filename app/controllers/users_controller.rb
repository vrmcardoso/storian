class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @worlds = @user.worlds
  end

  def dashboard
    @user = current_user
    @worlds = @user.worlds.select { |world| world.user == @user }
    @series = []
    @worlds.each do |world|
      world_series = world.series
      world_series.each do |serie|
        @series << serie
      end
    end
    @pen_names = @user.pen_names
    @books = []
    @books = Book.all.select { |book| @pen_names.include?(book.pen_name) }
    @series.each do |serie|
      serie.books.each do |book|
        @books << book
      end
    end
    @books = @books.uniq
    @books = @books.reject { |book| book.series.present? }
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_photo)
  end
end
