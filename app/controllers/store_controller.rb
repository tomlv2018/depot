class StoreController < ApplicationController
  def index
  	@products=Product.all
  	if session[:view_counts]==nil
       session[:view_counts]=1
       @view_count=1
   else
      @view_count=session[:view_counts]
      @view_count+=1
      session[:view_counts]=@view_count
    end
  end
end
