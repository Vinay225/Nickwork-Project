# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_comment, only: %i[show edit update destroy]

  # GET / or /comments.json
  def index
    @comment = Comment.all
  end

  # GET /comments/1 or /comments/1.json
  def show; end

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit; end

  # POST /comments or /comments.json
  def create
    @comment = Comment.new(comment_params)

    respond_to do |format|
      if @comment.save
        format.html do
          # Redirecting to news post correspoing to comment
          redirect_to "/news_posts/#{@comment.news_post_id}".html_safe, notice: 'Comment was successfully created.'
        end
        format.json { render :show, status: :created, location: @comment }
      else
        # Redirecting to news post correspoing to comment
        format.json { render json: @comment.errors, status: :unprocessable_entity }
        format.html { redirect_to "/comments/new?news_post=#{@comment.news_post_id}".html_safe }
      end
    end
  end

  # PATCH/PUT /comments/1 or /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html do
          # Redirecting to news post correspoing to comment
          redirect_to "/news_posts/#{@comment.news_post_id}".html_safe, notice: 'Comment was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def delete
    @comment = Comment.find(params[:id])
  end

  # DELETE /comments/1 or /comments/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to '/news_posts/', notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_comment
    @comment = Comment.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def comment_params
    params.require(:comment).permit(:name, :description, :news_post_id, :userID)
  end
end
