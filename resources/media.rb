module Pages
  
  module Resources
    
    class Media
      
      include Waves::Resources::Mixin
      
      on( :get, :get => [ :media, { :asset => true } ] ) do
        # example of http freshness - js and css are valid for 24 hours - rack-cache will return the cached copy of css and js.
        # response['Cache-Control'] = 'max-age=86400'
        controller.get( captured.media, captured.asset * '/')
      end
      
    end
    
  end

end
