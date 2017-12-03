describe('Get /customers') do
    
    before(:all) do        
        @result = Moip.post(
            '/customers',
            headers: header,
            body: cliente.to_json 
        )
        @cliente = @result.parsed_response
    end

    describe('status 200:') do

        it('buscar um cliente') do            
            @result = Moip.get(
                "/customers/#{@cliente['id']}",
                headers: header
            )
            expect(@result.response.code).to eql '200'
            expect(@result.parsed_response).to eql @cliente
        end 

    end

    describe('status 404:') do

        it('id do cliente nao existe') do
            @result = Moip.get(
                "/customers/asdasd#{@cliente['id']}",
                headers: header
            )
            expect(@result.response.code).to eql '404'
            expect(@result.parsed_response['error']).to eql 'resource not found'
        end
    end

end