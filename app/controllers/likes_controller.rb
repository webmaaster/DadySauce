class LikesController < ApplicationController
    def index
        @likes = Like.all
        redirect_to '/secrets'
      end
        
      def create
        secret = Secret.find(params[:id])
        Like.create(user_id:current_user.id,secret_id: params[:id]) unless secret.liked.include? current_user
        redirect_to '/secrets'
      end
      def destroy
        secret = Secret.find(params[:id])
        puts secret
        like =Like.find_by(secret:secret,user:current_user)
        puts 'deleting a like'
        puts like
        like.delete unless like === nil

        return redirect_to '/secrets'
        
      end
end
