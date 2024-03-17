# frozen_string_literal: true

class BlogBlueprint < Blueprinter::Base

  identifier :id

  fields :title, :content, :cover_image_url

  view :normal do
    field :likes_count do |blog|
      blog.likes.count
    end
    association :user, blueprint: UserBlueprint, view: :normal
  end
end