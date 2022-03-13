# frozen_string_literal: true

#
# パスのマネージャー。
#
module Path
  module_function

  def exe_path
    File.dirname ENV["OCRA_EXECUTABLE"] || __FILE__
  end
end
