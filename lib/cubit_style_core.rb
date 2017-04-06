require "cubit_style_core/version"

module CubitStyleCore
  # inspired by https://github.com/twbs/bootstrap-sass/blob/master/lib/bootstrap-sass.rb
  def self.gem_path
    @gem_path ||= File.expand_path '..', File.dirname(__FILE__)
  end
  def self.assets_path
    @assets_path ||= File.join gem_path, 'assets'
  end
  def self.stylesheets_path
    File.join assets_path, 'stylesheets'
  end
  def self.javascripts_path
    File.join assets_path, 'stylesheets'
  end

  # Rails apps will automatically pick up the files in the asset pipeline
  # Middleman and Sprockets supporting apps will automatically pick up the 
  # files in the asset pipeline
  if defined?(::Rails)
    class Engine < ::Rails::Engine
    end
  elsif defined?(::Sprockets)
    Sprockets.append_path(stylesheets_path)
    Sprockets.append_path(javascripts_path)
  end

end
