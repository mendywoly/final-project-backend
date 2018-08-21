namespace :raketests do
    desc 'test display hello world'
    task puts_hello_world: :environment do 
        puts "Hello World"
    end
end