require "sinatra"
require 'csv'
require "pry" if development? || test?
require "sinatra/reloader" if development?

require_relative "models/article"

set :bind, '0.0.0.0'  # bind to all interfaces

def array_of_articles
  articles = []
  #binding.pry
  CSV.foreach('articles.csv', headers: true) do |row|
    articles << Article.new(row["id"], row["title"], row["description"], row["url"])
  end
  articles
end

get '/' do
  redirect '/articles'
end

get '/articles' do
  @articles = array_of_articles

  erb :articles
end

get '/articles/new' do
  erb :new
end

post '/articles' do
  if params.values.all? { |value| value != ''}
    CSV.open("articles.csv", "a") do |csv|
      csv << [array_of_articles.length + 1, params[:article_title], params[:article_description], params[:article_url]]
    end
    redirect '/'
  else
    redirect '/articles/new'
  end
end

get '/articles/random' do
  erb :random
end

get '/random_article.json' do
  content_type :json
  @articles = array_of_articles
  status 200
  @articles.to_json
end
