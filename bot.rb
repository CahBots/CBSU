require 'discordrb'

bot = Discordrb::Commands::CommandBot.new token: 'insert_token_here', client_id: 269834753035862016, prefix: '^', help_command: false

bot.set_user_permission(116013677060161545, 1)
bot.set_user_permission(228290433057292288, 1)

bot.command([:subscribe, :sub]) do |event|
	to_add = event.server.roles.find {|role| role.name == 'Sub'}
	if event.user.role?(to_add) == false
        event.user.add_role(to_add)
        event.respond "Nice, subscribed successfully!" 
    else
    event.respond "You already have the role!" 
    end
end

bot.command([:unsubscribe, :unsub]) do |event|
	to_add = event.server.roles.find {|role| role.name == 'Sub'}
	if event.user.role?(to_add) == true
        event.user.remove_role(to_add)
        event.respond "You've unsubscribed from updates!" 
    else
    event.respond "You don't have the role!" 
    end
end

bot.run
