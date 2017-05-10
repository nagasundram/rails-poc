class PaintingsController < ApplicationController

  def index
    @paintings = current_user.paintings
    render json:  @paintings and return
  end

  def new
    @painting = Painting.new
  end

  def create
    @painting = Painting.new(painting_params)
    @painting.user = current_user
    if @painting.save!
      flash[:notice] = "The painting was added!"
      redirect_to root_path
    else

    end
  end

  def edit
    @painting = Painting.find(params[:id])
  end

  def update
    @painting = Painting.find(params[:id])
    if @painting.update_attributes(painting_params)
      redirect_to root_path, :notice => "Painting updated."
    else
      redirect_to root_path, :alert => "Unable to update painting."
    end
  end

  def destroy
    painting = Painting.find(params[:id])
    painting.destroy
    redirect_to root_path, :notice => "Painting deleted."
  end


  private
  def painting_params
    params.require(:painting).permit(:picture)
  end
end
