class RawMaterialsController < ApplicationController

  def index
    @raw_materials = RawMaterial.all
    @categories = RawMaterial::CATEGORIES
  end

  def new
    @raw_material = RawMaterial.new
  end

  def create
    @raw_material = RawMaterial.new(raw_material_params)
    if @raw_material.save
      redirect_to raw_materials_url
    else
      render :new
    end
  end

  private

  def raw_material_params
    params.require(:raw_material).permit(
      :name,
      :category,
    )
  end
end
