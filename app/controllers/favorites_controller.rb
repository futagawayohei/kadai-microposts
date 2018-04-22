class FavoritesController < ApplicationController
  def create
    micropost = Micropost.find(params[:micropost_id])

    # 「ログインしているあなた」が「指定したマイクロポスト」を「お気に入りに登録する」
    current_user.favorite(micropost)
    
    flash[:success] = "お気に入りに追加"
    redirect_to root_url
  end

  def destroy
    micropost = Micropost.find(params[:micropost_id])
    flash[:success] = "お気に入りから削除"

    current_user.unfavorite(micropost)

    redirect_to root_url
  end
end