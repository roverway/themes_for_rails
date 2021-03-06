require "test_helper"

module ThemesForRails
  class ViewHelpersTest < ActionController::IntegrationTest
    include ThemesForRails::ViewHelpers

    include ActionView::Helpers::AssetTagHelper
    include ERB::Util
    include ActionView::Helpers::TagHelper

    def theme_name
      'default'
    end

    def config
      @config ||= stub({:perform_caching => false, :asset_path => "/assets", :asset_host => ''})
    end

    should "provide path helpers for a given theme name" do
      
      assert_equal "/themes/sometheme/stylesheets/style.css", theme_stylesheet_path('style', "sometheme")
      assert_equal "/themes/sometheme/javascripts/app.js", theme_javascript_path('app', "sometheme")
      assert_equal "/themes/sometheme/images/logo.png", theme_image_path('logo.png', "sometheme")
      
    end
    
    should 'delegate to stylesheet_link_tag' do
      assert_match /media=.screen/, theme_stylesheet_link_tag('cuac.css')
    end

    should 'delegate options (lazy testing, I know)' do
      assert_match /media=.print/, theme_stylesheet_link_tag('cuac.css', :media => 'print')
    end
    should 'delegate options in image_tag' do
      assert_match /width=.40/, theme_image_tag('image.css', :size => '40x50')
    end
  end
end