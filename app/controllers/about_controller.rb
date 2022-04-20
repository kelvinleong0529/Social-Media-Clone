class AboutController < ApplicationController    
    
    # name of the class has to match the file name, in Camel Case and underscore removed, and inherit from ApplicationController
    # we define the action inside here

    def index     
        
        # method name need to match with the "to#" in routes.rb
        # if the function does any rendering then we will use it, else we will use the default render function inherited from Rails 
        # it will go to "app->views" and look for a file with the method as the filename, in this case look for index.html.erb

    end

end