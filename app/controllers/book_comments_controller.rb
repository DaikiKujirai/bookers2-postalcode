class BookCommentsController < ApplicationController

  def create
    @book = Book.find(params[:book_id])
    comment = current_user.book_comments.new(book_comment_params)
    comment.book_id = @book.id
    comment.save
  end

  def destroy
    # js.erbで使う変数はコントローラないに定義しなければならない
    @book = Book.find(params[:book_id])
    BookComment.find_by(id: params[:id], book_id: params[:book_id]).destroy
    # destroyアクションにbook_idを渡した
  end

  private

  def book_comment_params
    params.require(:book_comment).permit(:comment, :user_id, :book_id)
  end

end
