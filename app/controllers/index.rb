get '/' do
  erb :index
end

post '/urls' do
  full_url = params[:path]
  unless full_url.start_with?('http')
    full_url = "http://#{full_url}"
  end
  @url = Url.new(path: full_url)
  if @url.valid?
    @url.save
    redirect "/urls/#{@url.id}"
  else
    status 400
    redirect '/'
  end
end

get '/urls/:id' do
  @url = Url.where(id: params[:id]).first
  @short = "https://zamply.herokuapp.com/#{@url.short}"
  erb :'url_id_page'
end

get '/:short' do
  @url = Url.where(short: params[:short]).first
  @url.click_count += 1
  redirect @url.path
end
