module PostsHelper
    def update_like()
        @post = Post.find(params[:id])
        @post.update_attributes(:likes => 5)
      end
end
