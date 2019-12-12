class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/recipes' do
    @list = Recipe.all
    erb :index
  end

  get '/recipes/new' do
    erb :new
  end

  delete '/recipes/:id' do
    (Recipe.all.find(id = params['id'])).destroy
    redirect to '/recipes'
  end

  post '/recipes' do
    @recipe = Recipe.create(params)
    redirect to "/recipes/#{@recipe.id}"
  end


  patch '/recipes/:id' do
    @recipe = Recipe.all.find(id = params['id']).update(params.except('_method'))
    redirect to "/recipes/#{@recipe.id}"
  end

  get '/recipes/:id' do
    @recipe = Recipe.all.find id = params['id']
    erb :show
  end

  get '/recipes/:id/edit' do
    @recipe = Recipe.all.find id = params['id']
    erb :edit
  end




end
