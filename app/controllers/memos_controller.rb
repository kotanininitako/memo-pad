class MemosController < ApplicationController
  before_action :require_user_logged_in
  before_action :current_user_memo, only: [:show, :edit, :update, :destroy]
  
  def index
    @pagy, @memos = pagy(current_user.memos.order(id: :desc))
  end
  
  def show
    @pagy, @memos = pagy(current_user.memos.order(id: :desc))
  end
  
  def new
    @memo = current_user.memos.build
  end
  
  def create
    @memo = current_user.memos.build(memo_params)
    
    if @memo.save
      flash[:success] = 'メモが正常に追加されました'
      redirect_to @memo
    else
      flash.now[:danger] = 'メモが追加されませんでした'
      render :new
    end
  end
  
  def edit
  end
  
  def update
    if @memo.update(memo_params)
      flash[:success] = 'メモは正常に更新されました'
      redirect_to @memo
    else
      flash.now[:danger] = 'メモは更新されませんでした'
      render :edit
    end
  end
  
  def destroy
    @memo.destroy
    
    flash[:success] = 'メモは正常に削除されました'
    redirect_to memos_url
  end
  
  private
  
  def memo_params
    params.require(:memo).permit(:content)
  end
  
  def current_user_memo
    @memo = current_user.memos.find_by(params[:id])
  end
end
