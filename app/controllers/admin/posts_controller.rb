module Admin
  class PostsController < BaseController
    before_action :set_post, only: [:edit, :update, :destroy]


    def index
      @posts = Post.all
    end

    def new
      @post = Post.new
    end

    def create
      @post = Post.new(post_params)

      if @post.save
        redirect_to edit_admin_post_path(@post), notice: "New post has been created"
      else
        render :new
      end
    end

    def edit
    end

    def update
      if @post.update(post_params)
        redirect_to edit_admin_post_path(@post), notice: "Post has been updated"
      else
        flash[:error] = "There were some errors updating the post"
        render :edit
      end
    end

    def destroy
      @post.destroy!
      redirect_to admin_posts_path, notice: 'Post has been deleted'
    end

    private

     def set_post
      @post = Post.find(params[:id])
     end

     def post_params
      params.require(:post).permit(:title, :slug, :extract, :content, :status)
     end

  end
end