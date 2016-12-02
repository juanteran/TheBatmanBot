require 'telegram_bot' #Gema

bot = TelegramBot.new(token: '312745605:AAFYkM28LDIkg9vnqXwnBozZonaqhSv9jvo') #Token
bot.get_updates(fail_silently: true) do |message|
	puts "@#{message.from.username}: #{message.text}"
	command = message.get_command_for(bot)

	message.reply do |reply|
		case message.text# command
		when /start/
			reply.text = "Yo soy Batman Bot, un Bot tan Cool y Millonario como Batman."
		when /batman/i
			reply.text = "Yo soy... Batman"
		when /gotham/
			reply.text = "Serie Chingona"
		end
		puts "sending #{reply.text.inspect} to @#{message.from.username}"
		reply.send_with(bot)
	end
end
