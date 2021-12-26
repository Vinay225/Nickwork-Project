# frozen_string_literal: true

class NewsPostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_news_post, only: %i[show edit update destroy]

  # GET /news_posts or /news_posts.json
  def index
    @news_post = NewsPost.all
  end

  # GET /news_posts/1 or /news_posts/1.json
  def show; end

  # GET /news_posts/new
  def new
    @news_post = NewsPost.new
  end

  # GET /news_posts/1/edit
  def edit; end

  # POST /news_posts or /news_posts.json
  def create
    @news_post = NewsPost.new(news_post_params)

    respond_to do |format|
      if @news_post.save
        format.html { redirect_to @news_post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @news_post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @NewsPost.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /news_posts/1 or /news_posts/1.json
  def update
    respond_to do |format|
      if @news_post.update(news_post_params)
        format.html { redirect_to @news_post, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @news_post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @NewsPost.errors, status: :unprocessable_entity }
      end
    end
  end

  def delete
    @news_post = NewsPost.find(params[:id])
  end

  # DELETE /news_posts/1 or /news_posts/1.json
  def destroy
    @news_post.destroy
    respond_to do |format|
      format.html { redirect_to news_posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_news_post
    @news_post = NewsPost.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def news_post_params
    params.require(:news_post).permit(:title, :description, :userID, :name)
  end
end
