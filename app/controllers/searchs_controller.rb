class SearchsController < ApplicationController
	def search
    @books = Book.search(params[:search],params[:category],params[:select])
    @users = User.search(params[:search],params[:category],params[:select])
	end
end
