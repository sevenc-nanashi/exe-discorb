# frozen_string_literal: true
require "yaml"
require "fileutils"
require_relative "console.lib"
require_relative "path.lib"

#
# コンフィグのマネージャー。
#
class Config
  CONFIG_PATH = "config.yml"

  def initialize
    self.load
  end

  def load
    if File.exist? CONFIG_PATH
      CPuts.info "config.ymlを読み込みます。"
    else
      CPuts.warn "config.ymlが見付かりませんでした。"
      FileUtils.cp(Path.exe_path + "/config.default.yml", Path.exe_path + "/config.yml")
    end
    @data = YAML.load_file Path.exe_path + "/" + CONFIG_PATH
  end

  def method_missing(method)
    @data[method.to_s]
  end

  def respond_to_missing?(method)
    @data.key?(method.to_s)
  end

  def responds
    @data["responds"].to_h do |respond|
      respond.split("=>", 2).map(&:strip)
    end
  end
end
