class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.order('created_at DESC')
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    @post.update_attribute(:cloned, 0)
    post_ids_on_top = [10, 12, 13, 20]
    posts = Post.all
    top_posts = posts.select{|post| post_ids_on_top.include?(post.compartir) }
    bottom_posts = posts.reject{|post| post_ids_on_top.include?(post.compartir) }

    @posts = top_posts + bottom_posts
    respond_to do |format|
      @post.user = User.first
      if @post.save
        format.html { redirect_to @post, notice: 'El post ha sido creado exitosamente.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'El post ha sido actualizado exitosamente.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post = Post.find(params[:id])
    auxiliar = @post.texto
    Post.where(:texto => auxiliar).destroy_all
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'El post ha sido eliminado exitosamente.' }
      format.json { head :no_content }
    end
  end

  def update_like
    post = Post.find_by(id: params[:id])
    post.increment!(:likes,  1)
    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end

  def update_redibbs
    post = Post.find_by(id: params[:id])
    post.increment!(:compartir,  1)
    rdb = post.dup
    rdb.update_attribute(:cloned, 1)
    rdb.save
    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:texto, :compartir, :likes)
    end
end
