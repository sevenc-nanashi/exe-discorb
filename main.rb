# frozen_string_literal: true
require "discorb"
require_relative "config.lib"

exit if defined? Ocra

VERSION = "0.0.1"
puts "\e[1mexe'd discorb bot test v#{VERSION} - sevenc-nanashi\e[m"
CPuts.info "https://github.com/sevenc-nanashi/ocra_discorb"

$config = Config.new

client = Discorb::Client.new(intents: Discorb::Intents.new(message_content: true))

client.once :standby do
  CPuts.info "#{client.user} として接続しました。"
end

client.on :message do |message|
  next if message.author.bot?
  Config.load

  $config.responds.each do |keyword, respond|
    next unless message.content.downcase.include?(keyword.downcase)

    message.reply respond
  end
end

if $config.token
  client.run $config.token
else
  CPuts.error "トークンが設定されていません。"
end
