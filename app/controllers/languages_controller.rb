class LanguagesController < ApplicationController

  def index
    @languages = Language.all.select { |language| language.world_id == params[:world_id].to_i }
  end

  def show
    @language = Language.find(params[:id])
  end

  def new
    @language = Language.new
  end

  def create
    @language = Language.new(language_params)
    if @language.save
      redirect_to languages_path
    else
      render :new
    end
  end

  def edit
    @language = Language.find(params[:id])
  end

  def update
    @language = Language.find(params[:id])
    if @language.update(language_params)
      redirect_to languages_path
    else
      render :edit
    end
  end

  def destroy
    @language = Language.find(params[:id])
    @language.destroy
    redirect_to languages_path
  end

  private

  def language_params
    params.require(:language).permit(:name, :world_id)
  end
end
