require 'telegram_bot' #Gema

bot = TelegramBot.new(token: 'Tu Token') #Token
bot.get_updates(fail_silently: true) do |message|
	puts "@#{message.from.username}: #{message.text}"
	command = message.get_command_for(bot)

	message.reply do |reply|
		case message.text# Comandos
		when /start/ #Start --Probablemente no sufra cambio
			reply.text = "Yo soy Batman Bot, un Bot tan Cool y Millonario como Batman."
		when /batman/i
			reply.text = "Yo soy... Batman" #Identificador del Bot XD
		when /gotham/ #Lo más seguro que sera removido
			reply.text = "Serie Chingona"
		when /help/ #Help --Probablemente sufra muchos cambios.
			reply.text = "Versión Beta de Help\n /batman: Invoca a Batman.\n /gotham: Devuelve último capitulo de Gotham.\n Se piensa añadir comandos para obtener cbr y pelis, aporta un nombre para ellos XD"
		end
		puts "sending #{reply.text.inspect} to @#{message.from.username}"
		reply.send_with(bot)
	end
end
