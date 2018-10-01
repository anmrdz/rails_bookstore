class BookController < ApplicationController
    def index
        @books = Book.all 
    end

    def new
        
    end

    def create
        book_params = params.require(:book).permit(:title, :description)
        Book.create(book_params)
        redirect_to action: 'index'
    end

    def show
        @book = Book.find(params[:id])
        if @book.nil?
            redirect_to action: 'index'
        end
    end

    def delete
        @book = Book.find(params[:id])
        unless @book.nil?
            @book.delete
        end

        redirect_to action: 'index'
    end

    def show_edit
        @book = Book.find(params[:id])
        if @book.nil?
            redirect_to action: 'index'
        end
    end

    def edit
        @book = Book.find(params[:id])
        book_params = params.require(:book).permit(:title, :description)
        if @book.nil?
            redirect_to action: 'index'
        end

        @book.update(book_params)
        redirect_to action: 'show'
    end
end
