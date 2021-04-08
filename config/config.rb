# frozen_string_literal: true

require 'yaml'

# This class is for initalizing all things related to the website.
class Config
  def self.page
    attr_reader :page
  end

  def self.setup_page(yml)
    pages = Array
    Dir.glob("config/#{yml}.yml") do |config|
      pages.push(File.basename(config, File.extname(config)))
    end
    yaml = YAML.safe_load(File.read("config/#{yml}.yml"))
    @page = {}
    @page[:domain] = yaml['domain']
    @page[:contact] = yaml['contact']
    @page[:workplace] = yaml['workplace']
  end
end
