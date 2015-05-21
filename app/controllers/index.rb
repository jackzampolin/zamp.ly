post '/urls' do
  full_url = params['longUrl']
  unless full_url.start_with?('http')
    full_url = "http://#{full_url}"
  end
  @url = Url.new(path: full_url)
  if @url.valid?
    @url.save
    {'shortUrl'=>"http://zamp.ly.com/#{@url.short}"}.to_json
  else
    status 404
    'Invalid Url'
  end
end

get '/:short' do
  @url = Url.where(short: params[:short]).first
  @click = Click.create(url_id: @url.id, referer: request.referer)
  redirect @url.path
end
