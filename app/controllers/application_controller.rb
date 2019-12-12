class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    set :method_override, 'true'
  end

  # code actions here!
  get "/recipes" do 
    @recipes = Recipe.all
    erb :index
  end

  get "/recipes/new" do 
    erb :new 
  end

  get "/recipes/:id" do
    @recipe = Recipe.all.find(params[:id])
    erb :show
  end

  post "/recipes" do 
    recipe = Recipe.create(params)
    redirect to "/recipes/#{recipe.id}"
  end

  get "/recipes/:id/edit" do 
    # binding.pry
    @recipe = Recipe.all.find(params[:id])
    erb :edit
  end

  patch "/recipes/:id" do 
    # binding.pry
    recipe = Recipe.all.find(params[:id])
    recipe.update(params[:recipe])
    redirect to "/recipes/#{recipe.id}"
  end

  delete "/recipes/:id" do 
    recipe = Recipe.all.find(params[:id])
    recipe.destroy
    redirect to "/recipes"
  end
end
