class ImagesController < ApplicationController

  def index
    @images = current_user.images
  end

  def new
    @image = Image.new
  end

  def create
    @image = Image.new(image_params)
    @image.user = current_user
    if @image.save
      flash[:notice] = "The image was added!"
      redirect_to root_path
    else
      render 'new', :alert => "Unable to update image."
    end
  end

  def edit
    @image = Image.find(params[:id])
  end

  def update
    @image = Image.find(params[:id])
    if @image.update_attributes(image_params)
      redirect_to root_path, :notice => "Image updated."
    else
      redirect_to root_path, :alert => "Unable to update image."
    end
  end

  def destroy
    image = Image.find(params[:id])
    image.destroy
    redirect_to root_path, :notice => "Image deleted."
  end


  private
  def image_params
    params.require(:image).permit(:file, :name)
  end
end
