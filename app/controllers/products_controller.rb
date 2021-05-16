class ProductsController < ApplicationController
def index
end

def new
  @prototype = Prototype.find(params[:id])

  if @prototype.update(prototypes_params)
    redirect_to prototype_path
  else
    render :edit
  end
end

def create
 
end


end
