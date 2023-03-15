# frozen_string_literal: true

require "decidim/core/test/factories"

FactoryBot.define do

  factory :slider, parent: :content_block do
    manifest_name { :slider }
    scope_name { :homepage }
    settings do
      {
        upload_size: 100
      }
    end
  end

  factory :image_tab, parent: :content_block do
    manifest_name { :video_text }
    scope_name { :slider_tabs }
    settings do
      {
        text: { Decidim.default_locale => generate(:title) },
        cta: { Decidim.default_locale => generate(:title) },
        url: { Decidim.default_locale => Faker::Internet.url },
      }
    end

    after(:create) do |content_block, _evaluator|
      background_image = Rack::Test::UploadedFile.new(File.expand_path(File.join(__dir__, "assets", "city.jpeg")), "image/jpeg")
      content_block.images_container.image = background_image
      content_block.save
    end
  end

  factory :video_text_tab, parent: :content_block do
    manifest_name { :video_text }
    scope_name { :slider_tabs }
    settings do
      {
        text: { Decidim.default_locale => generate(:title) },
        title: { Decidim.default_locale => generate(:title) },
        cta: { Decidim.default_locale => generate(:title) },
        url: { Decidim.default_locale => Faker::Internet.url }
      }
    end

    after(:create) do |content_block, _evaluator|
      background_image = Rack::Test::UploadedFile.new(File.expand_path(File.join(__dir__, "assets", "mov_bbb.mp4")), "application/mp4")
      content_block.images_container.video = background_image
      content_block.save
    end
  end
end
