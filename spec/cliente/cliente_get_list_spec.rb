describe('Get /customers') do

    before(:all) do        
        @result = Moip.post(
            '/customers',
            headers: header,
            body: cliente.to_json 
        )
    end
    
    describe('status 200:') do

        it('listar clientes') do            
            @result = Moip.get(
                '/customers',
                headers: header
            )
            expect(@result.response.code).to eql '200'
            @clientes = @result.parsed_response['customers']
            expect(@clientes).not_to be_empty
            @clientes.each do |item|
                expect(item['ownId'].class).to eql String
                expect(item['fullname'].class).to eql String
                expect(item['email'].class).to eql String
                # ...
            end
        end

    end

end