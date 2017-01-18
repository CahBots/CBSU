require 'discordrb'

bot = Discordrb::Commands::CommandBot.new token: 'insert_token_here', client_id: 269834753035862016, prefix: '^', help_command: false

bot.set_user_permission(116013677060161545, 1)
bot.set_user_permission(228290433057292288, 1)

bot.command([:subscribe, :sub]) do |event|
	if event.channel.pm? == true
		event.respond "I can not give you a role in PMs! That would be silly (and impossible)!"
  break
end
	to_add = event.server.roles.find {|role| role.name == 'Sub'}
	if event.user.role?(to_add) == false
        event.user.add_role(to_add)
        event.message.delete
        m = event.respond "Nice, subscribed successfully!" 
        sleep 3
        m.delete
    else
    event.message.delete
    m = event.respond "You already have the role!" 
    sleep 3
    m.delete
    end
end

bot.command([:unsubscribe, :unsub]) do |event|
		if event.channel.pm? == true
		event.respond "I can not take a role in PMs! That would be silly (and impossible)!"
  break
end
	to_add = event.server.roles.find {|role| role.name == 'Sub'}
	if event.user.role?(to_add) == true
        event.user.remove_role(to_add)
        event.message.delete
        m = event.respond "You've unsubscribed from updates!" 
        sleep 3
        m.delete
    else
    	event.message.delete
    m = event.respond "You don't have the role!" 
    m.delete
    end
end

bot.command(:accept, in: 269981476135632896) do |event|
	event.message.delete
	to_add = event.server.roles.find {|role| role.name == 'Members'}
	if event.user.role?(to_add) == false
        event.user.add_role(to_add)
        event.user.pm("Thank you for reading the rules and information, enjoy your stay!")
    else
    event.respond "You must already have the member role, or an error has occured. Please notify cah or chew." 
    end
end

bot.run
