module MemosHelper
  def jump_memos
    if @memo.parent_id
      return memo_url(id: @memo.parent_id)
    else
      return memos_url
    end
  end
end
