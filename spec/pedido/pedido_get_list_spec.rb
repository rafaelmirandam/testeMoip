describe('Get /orders') do
    
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
    end    
    
    describe('status 200:') do
    
        it('listar pedidos') do            
            @result = Moip.get(
                '/orders',
                headers: header
            )    
            expect(@result.response.code).to eql '200'    
            @pedidos = @result.parsed_response['orders']
            expect(@pedidos).not_to be_empty
            @pedidos.each do |item|
                expect(item['ownId'].class).to eql String
                expect(item['id'].class).to eql String
                expect(item['status'].class).to eql String
                # ...
            end
        end

    end

end