module Pages

  module Resources

    class Default

      include Waves::Resources::Mixin

      on( :get, [ :resource, { :name => 'home' }] ) { show }

      # matching against /
      on( :get, :show => [{ :name => 'home' }] ) { show }

      on( :post, :add =>  [ 'admin', :resource ] ) do
        redirect( paths.edit( model_name, controller.create['key'] ) )
      end

      on( :get, :edit => [ 'admin', :resource, :name ] ) do
        view.editor( singular => controller.find( captured.name ) )
      end

      on( :post, :update =>  [ 'admin', :resource, :name ] ) do
        controller.update( captured.name ) and redirect( paths( :site ).admin )
      end

      on( :delete, :delete =>  [ 'admin', :resource, :name ] ) do
        controller.delete( captured.name ) and redirect( paths( :site ).admin )
      end

      private
      def show
	if request.accept[0] == 'text/html-fragment'
          view.content( :story => controller.find( captured.name ))
        else
          view.show( singular => controller.find( captured.name ))
        end
      end

    end

  end

end
