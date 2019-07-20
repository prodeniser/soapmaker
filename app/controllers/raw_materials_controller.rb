class RawMaterialsController < ApplicationController

  def index
    @raw_materials = RawMaterial.all
    @categories = RawMaterial::CATEGORIES
  end
end
