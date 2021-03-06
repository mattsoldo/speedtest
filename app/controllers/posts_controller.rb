class PostsController < ApplicationController
  def random
    action = rand(100)
    if action < 40
      puts "method=show"
      # redirect_to show_random_posts_url
      @post = Post.get_random
      render "show"
    elsif action < 80
      puts "method=list"
      # redirect_to posts_url
      @posts = Post.limit(10)
      render "index"
    elsif action < 98 
      puts "method=post"
      # redirect_to new_random_posts_url
      @post = Post.new_random
      @post.save
      render "show"
    elsif action < 100
      puts "method=destroy"
      # redirect_to destroy_random_posts_url
       @post = Post.get_random
       @post.destroy
       render :nothing => true, :status => 200
    end
  end
      
  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all[0..200]

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/new
  # GET /posts/new.json
  def new
    @post = Post.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post }
    end
  end

  def new_random
    @post = Post.new_random

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render json: @post, status: :created, location: @post }
      else
        format.html { render action: "new" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy_random
    @post = Post.get_random
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end
  
  def show_random
    @post = Post.get_random
    
    respond_to do |format|
      format.html { render "show" }
      format.json { render json: @post }
    end
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new_random

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render json: @post, status: :created, location: @post }
      else
        format.html { render action: "new" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.json
  def update
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post = Post.get_random
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end
end
