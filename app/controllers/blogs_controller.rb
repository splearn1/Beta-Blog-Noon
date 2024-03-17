class BlogsController < ApplicationController
  before_action :authenticate_request

  def index
    blogs = Blog.all
    render json: BlogBlueprint.render(blogs, view: :normal)
  end

  def create 
    blog = @current_user.blogs.new(blog_params)

    if blog.save
      render json: BlogBlueprint.render(blog, view: :normal), status: :created
    else
      render json: blog.errors, status: :unprocessable_entity
    end
  end

  def like
    blog = Blog.find(params[:blog_id])
    like = blog.likes.new(user_id: @current_user.id)
    blog_creator = blog.user

    if like.save
      Pusher.trigger(blog_creator.id, 'like', {
        blog_id: blog.id,
        notification: "#{@current_user.username} has liked #{blog.title}!"
      })
      head :ok
    else
      render json: nil, status: :unprocessable_entity
    end
  end

  def unlike
    blog = Blog.find(params[:blog_id])
    like = blog.likes.find_by(user_id: @current_user.id)
    if like.destroy
      head :ok
    else
      render json: nil, status: :unprocessable_entity
    end
  end

  private 

  def blog_params 
    params.permit(:title, :content, :user_id, :cover_image)
  end

end