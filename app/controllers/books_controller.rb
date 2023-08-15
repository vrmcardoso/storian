class BooksController < ApplicationController

  def index
    @pen_names = current_user.pen_names
    @books = Book.all.select { |book| @pen_names.include?(book.pen_name) }
    @worlds = current_user.worlds
    @series = []
    @worlds.each do |world|
      world_series = world.series
      world_series.each do |serie|
        @series << serie
      end
    end
    @standalone_books = @books.reject { |book| book.series.present? }
  end

  def show
    @book = Book.find(params[:id])
    @series = @user.series.find(params[:series_id]) if params[:series_id].present?
    @world = @series.present? ? @series.world : @book.world
    @user = current_user
    @pen_names = @user.pen_names
  end

  def new
    @book = Book.new
    @user = current_user
    @series = Series.find(params[:series_id]) if params[:series_id].present?
    @book = @series.present? ? @series.books.new : Book.new
    @pen_names = @user.pen_names
    @worlds = @series.present? ? @series.world : @user.worlds
  end

  def create
    @user = current_user
    if params[:series_id].present?
      @series = Series.find(params[:series_id].to_i)
      @world = @series.world
    else
      @world = World.find(params[:book][:world_id])
    end
    @book = Book.new(book_params)
    @book.series = @series if @series.present?
    @book.world = @world

    if @book.save
      redirect_to @book
    else
      render :new
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to @book
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  def find_series
    @world = World.find(params[:world_id])
    @series = @world.series
    render json: @series
  end

  private

  def book_params
    params.require(:book).permit(:title, :description, :pen_name_id, :world_id, :cover, :series_id)
  end
end
