class PicturesController < ApplicationController
  before_action :set_picture, only: %i[ show edit update destroy ]

  # GET /pictures or /pictures.json
  def index
    @pictures = Picture.all
  end

  # GET /pictures/1 or /pictures/1.json
  def show
    if current_user != @picture.user  
      redirect_to pictures_path
    end
  end

  # GET /pictures/new
  def new
    @picture = Picture.new
  end

  # GET /pictures/1/edit
  def edit
    if current_user != @picture.user  
      redirect_to pictures_path
    end
  end

  # POST /pictures or /pictures.json
  def create
    @picture = current_user.pictures.build(picture_params)

    if params[:back]
      render :new
    else
      respond_to do |format|
        if @picture.save
          PostMailer.post_mail(current_user).deliver
          format.html { redirect_to pictures_path, notice: "NEW PICTURE"}
          format.json { render :show, status: :created, location: @picture }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @picture.errors, status: :unprocessable_entity }
        end
      end
    end
  end


  # PATCH/PUT /pictures/1 or /pictures/1.json
  def update
    respond_to do |format|
      if @picture.update(picture_params)
        format.html { redirect_to pictures_url }
        format.json { render :show, status: :ok, location: @picture }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @picture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pictures/1 or /pictures/1.json
  def destroy
    @picture.destroy
    if current_user != @picture.user  
      redirect_to pictures_path
    else
      respond_to do |format|
        format.html { redirect_to pictures_url, notice: "DELETE PICTURE" }
        format.json { head :no_content }
      end
    end
  end

  def confirm
    @picture = current_user.pictures.build(picture_params)
    render :new if @picture.invalid?
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_picture
      @picture = Picture.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def picture_params
      params.require(:picture).permit(:content,:image,:image_cache)
    end
end
