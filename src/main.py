import os

from discord.ext import commands
from dotenv import load_dotenv

from roll import Roll
from admin import Admin
from profile import Profile
from information import Information
from wishlist import Wishlist
from trade import Trade

load_dotenv()
BOT_TOKEN = os.getenv('BOT_TOKEN')
bot = commands.Bot(command_prefix='*')

bot.add_cog(Roll(bot))
bot.add_cog(Admin(bot))
bot.add_cog(Profile(bot))
bot.add_cog(Information(bot))
bot.add_cog(Wishlist(bot))
bot.add_cog(Trade(bot))

#### Bot commands ####

@bot.command()
async def ping(ctx):
    await ctx.message.delete()
    await ctx.send('Yup, I\'m awake.', delete_after=5)


#### Bot event handlers ####

@bot.event
async def on_ready():
    print('Logged in as')
    print(bot.user.name)
    print(bot.user.id)
    print('------')


@bot.event
async def on_command_error(ctx, error):
    if isinstance(error, commands.CommandNotFound):
        await ctx.send('Unknown command.')
        return
    elif isinstance(error, commands.CheckFailure):
        await ctx.send("You're not authorized to execute this command.")
        return
    elif isinstance(error, commands.MissingRequiredArgument):
        await ctx.send("Missing arguments. *help for display help")
        return
    raise error


#### Utilities functions ####


#### Launch bot ####

bot.run(BOT_TOKEN)
