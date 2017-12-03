describe('Delete /fundinginstruments/') do
    
    before(:all) do        
        @result = Moip.post(
            '/customers',
            headers: header,
            body: cliente.to_json 
        )
        @cliente = @result.parsed_response

        @result = Moip.post(
            "/customers/#{@cliente['id']}/fundinginstruments",
            headers: header,
            body: cartao.to_json 
        )
        @cartao = @result.parsed_response['creditCard']
    end

    describe('status 200:') do
        
        it('deletar um cartão') do            
            @result = Moip.delete(
                "/fundinginstruments/#{@cartao['id']}",
                headers: header
            )
            expect(@result.response.code).to eql '200'
        end 

    end

end