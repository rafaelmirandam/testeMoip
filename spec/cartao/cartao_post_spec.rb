describe('Post /customers/id/fundinginstruments') do
    
    before(:all) do        
        @result = Moip.post(
            '/customers',
            headers: header,
            body: cliente.to_json 
        )
        @cliente = @result.parsed_response
    end

    describe('status 200:') do
        it('cadastrar novo cartao') do
            @result = Moip.post(
                "/customers/#{@cliente['id']}/fundinginstruments",
                headers: header,
                body: cartao.to_json 
            )
            expect(@result.response.code).to eql '201'            
        end
    end

    describe('status 4xx:') do
        it('cartão sem portador') do
            @result = Moip.post(
                "/customers/#{@cliente['id']}/fundinginstruments",
                headers: header,
                body: cartao_sem_nome.to_json 
            )
            expect(@result.response.code).to eql '400'
            expect(@result.parsed_response['errors'].first['description']).to eql 'O nome do portador do cartão não foi informado'    
        end

        it('cartão com cpf invalido') do
            @result = Moip.post(
                "/customers/#{@cliente['id']}/fundinginstruments",
                headers: header,
                body: cartao_cpf_invalido.to_json 
            )
            expect(@result.response.code).to eql '400'
            expect(@result.parsed_response['errors'].first['description']).to eql 'O CPF informado deve ter 11 números'    
        end

        # ...

    end

end