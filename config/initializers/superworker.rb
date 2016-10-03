# config/initializers/superworkers.rb
Dir['./app/superworkers/*'].each { |f| require f }
