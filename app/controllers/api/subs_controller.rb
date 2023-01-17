class Api::SubsController < ApplicationController
def index
render json: Sub.all
end
def show
@sub = Sub.find(params[:id])
render json: @sub
end
def create
@sub = Sub.new(sub_params)
if @sub.save
    render json:sub
else
    render json: {errors: @sub.errors},status: :unprocessable_entity  
end

end
def update
@sub =Sub.find(params[:id])
if @sub.update(sub_params)
    render json:sub
else
    render json: {errors: @sub.errors},status: :unprocessable_entity  
    
end
end
def destroy
    @sub =Sub.find(params[:id])
 @sub.destroy
 render json: {message: 'sub has been deleted'}
    
end
end
private
def sub_params
    params.require(:sub).permit(:title)
    
end
end
 