# frozen_string_literal: true

#
# 綺麗にログを出力するためのモジュール。
#
module CPuts
  module_function
  #
  # 警告ログを出力します。
  #
  # @param [#to_s] message メッセージ。
  #
  # @return [void]
  #
  def warn(message)
    puts "\e[93m!) \e[0m #{message}"
  end

  #
  # エラーログを出力します。
  #
  # @param [#to_s] message メッセージ。
  #
  # @return [void]
  #
  def error(message)
    puts "\e[91m!) \e[0m #{message}"
  end

  #
  # 情報ログを出力します。
  #
  # @param [#to_s] message メッセージ。
  #
  # @return [void]
  #
  def info(message)
    puts "\e[96m!) \e[0m #{message}"
  end
end
