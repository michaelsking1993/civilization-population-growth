class CivilizationsController < ApplicationController
  before_action :set_civilization, except: %i[index new create]
  def index
    @civilizations = Civilization.order(created_at: :asc)
  end

  def change_population
    @civilization.change_population(year_change: params[:year_change]&.to_i)

    flash[:notice] = "Population updated to #{@civilization.population}"
    redirect_to root_path
  end

  def edit

  end

  def update
    if @civilization.update(civilization_params)
      flash[:notice] = "Success, you have updated the civilization #{@civilization.name}"
    else
      render :edit, status: :unprocessable_entity
    end

    redirect_to root_path
  end

  def new
    @civilization = Civilization.new
  end

  def create
    @civilization = Civilization.new(civilization_params)
    if @civilization.save
      flash[:notice] = "Success, you have created the civilization #{@civilization.name}"
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @civilization.destroy!

    redirect_to root_path
  end

  private

  def set_civilization
    @civilization = Civilization.find(params[:id])
  end

  def civilization_params
    params.require(:civilization).permit(:name, :population, :growth_rate, :current_year)
  end
end