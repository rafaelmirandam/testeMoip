describe('Get /payments') do
    
    before(:all) do        
        @result = Moip.post(
            '/orders',
            headers: header,
            body: pedido.to_json 
        )
        @pedido = @result.parsed_response
        @result = Moip.post(
            "/orders/#{@pedido['id']}/payments",
            headers: header,
            body: pagamento.to_json 
        )
        @pagamento = @result.parsed_response
    end
    
    describe('status 200:') do

        it('buscar um pagamento') do            
            @result = Moip.get(
                "/payments/#{@pagamento['id']}",
                headers: header
            )
            expect(@result.response.code).to eql '200'
            expect(@result.parsed_response['id']).to eql @pagamento['id']
        end

    end

    describe('status 404:') do
        
        it('id do pagamento nao existe') do            
            @result = Moip.get(
            "/payments/asdasd#{@pagamento['id']}",
                headers: header
            )
            expect(@result.response.code).to eql '404'
            expect(@result.parsed_response['error']).to eql 'resource not found'
        end

    end

end