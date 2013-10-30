desc "Aplicación"
task :default => :server

desc "Servidor"
task :server do
  sh "bundle exec rackup"
end

desc "run the unit tests"
task :test do
  sh "ruby test/test.rb "
end

desc "Ejecutar los Test Rspec"
task :spec do
        sh "rspec spec/rsack/server_spec.rb"
end

desc "run rspec test show html"
task :rspech do
  sh "rspec --format html spec/RockPaperScissors/app_spec.rb"
end
