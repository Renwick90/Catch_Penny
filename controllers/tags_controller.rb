require_relative('../models/tag.rb')

get '/tags' do
  @tags = Tag.all
  erb :'tags/index'
end

get '/tags/new' do
  erb :'tags/new'
end

get '/tag/:id' do
  @tag = Tag.find(params[:id])
  erb( :'tags/show')
end

post '/tags' do
  @tag = Tag.new(params)
  @tag.save
  redirect to :'tags' 
end

post 'tag/:id' do
  @tag = Tag.update( params)
  redirect to ('/tags')
end
  post '/tags/:id/delete' do
    Tag.delete(params[:id])
    redirect to('/tags')
  end

