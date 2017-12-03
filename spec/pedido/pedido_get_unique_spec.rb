describe('Get /orders') do

    before(:all) do        
        @result = Moip.post(
            '/orders',
            headers: header,
            body: pedido.to_json 
        )
        @pedido = @result.parsed_response
    end
    
    describe('status 200:') do

        it('buscar um pedido') do            
            @result = Moip.get(
                "/orders/#{@pedido['id']}",
                headers: header
            )
            expect(@result.response.code).to eql '200'
            expect(@result.parsed_response['id']).to eql @pedido['id']
        end

    end

    describe('status 404:') do
        
        it('id do pedido nao existe') do            
            @result = Moip.get(
            "/orders/asdasd#{@pedido['id']}",
                headers: header
            )
            expect(@result.response.code).to eql '404'
            expect(@result.parsed_response['error']).to eql 'resource not found'
        end

    end

end