class Api::PlacesController < ApplicationController

  def index
    @places = Place.all
    render "index.json.jb"
  end

  def create
    @place = Place.new(
      name: params[:name],
      address: params[:address],
      image: params[:image]
    )

    if @place.save
      render "show.json.jb"
    else
      render json: { errors: @place.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    @place = Place.find(params[:id])
    @place.name = params[:name] || @place.name
    @place.address = params[:address] || @place.address
    @place.image = params[:image] || @place.image
    if @place.save
      render "show.json.jb"
    else
      render json: { errors: @place.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def show
    @place = Place.find(params[:id])
    render "show.json.jb"
  end

  def destroy
    @place = Place.find(params[:id])
    @place.delete
    render json: { message: "This place has been destroyed! Thank you and have a nice day." }
  end


end
