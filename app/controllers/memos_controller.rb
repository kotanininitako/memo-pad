class MemosController < ApplicationController
  before_action :require_user_logged_in
  
  def index
    @pagy, @memos = pagy(Memo.all)
  end
  
  def show
    @memo = Memo.find(params[:id])
    @pagy, @memos = pagy(Memo.all)
  end
  
  def new
    @memo = Memo.new
  end
  
  def create
    @memo = Memo.new(memo_params)
    
    if @memo.save
      flash[:success] = 'メモが正常に追加されました'
      redirect_to @memo
    else
      flash.now[:danger] = 'メモが追加されませんでした'
      render :new
    end
  end
  
  def edit
    @memo =Memo.find(params[:id])
  end
  
  def update
    @memo = Memo.find(params[:id])
    
    if @memo.update(memo_params)
      flash[:success] = 'メモは正常に更新されました'
      redirect_to @memo
    else
      flash.now[:danger] = 'メモは更新されませんでした'
      render :edit
    end
  end
  
  def destroy
    @memo = Memo.find(params[:id])
    @memo.destroy
    
    flash[:success] = 'メモは正常に削除されました'
    redirect_to memos_url
  end
  
  private
  
  def memo_params
    params.require(:memo).permit(:content)
  end
end
