class FriendshipsController < ApplicationController
    def index
    end

    def create
        friend = User.find(params[:friend])
        friendship = Friendship.create(user_id: current_user.id, friend_id: friend.id)
        if friendship.save
            flash[:notice] = "Start following user"
        else
            flash[:alert] = "Something went wrong"
        end
        redirect_to friendships_path
    end

    def destroy
        friendship = Friendship.find_by(user_id: current_user.id, friend_id: params[:id] )
        friendship.destroy
        flash[:notice] = "Stop following"
        redirect_to friendships_path
    end
end