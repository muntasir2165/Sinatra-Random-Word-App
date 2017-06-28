require 'sinatra'

class MyApp < Sinatra::Base
  # return a random word to the client
  get '/' do
    file = "/usr/share/dict/words" #a file of words
    maxNumber = `echo -n $(cat -n #{file} | wc -l)`.to_i
    randomNumber = Random.new.rand(1..maxNumber) 
    randomWord = `ruby -ne '(print $_ and exit) if $.==#{randomNumber}' /usr/share/dict/words`.downcase
    "<!DOCTYPE html><html><head></head><body style=\"text-align: center\"><h1>Random Word is:<br><span>#{randomWord}</span></h1></body></html>"
  end
end

