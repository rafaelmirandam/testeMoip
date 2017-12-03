describe('Post /customers') do
    
    describe('status 200:') do
        it('cadastrar novo cliente') do
            @result = Moip.post(
                '/customers',
                headers: header,
                body: cliente.to_json 
            )
            expect(@result.response.code).to eql '201'            
        end
    end

    describe('status 4xx:') do
        it('cliente sem identificador') do
            @result = Moip.post(
                '/customers',
                headers: header,
                body: cliente_sem_id.to_json
            )
            expect(@result.response.code).to eql '400'
            expect(@result.parsed_response['errors'].first['description']).to eql 'O identificador próprio não foi informado'    
        end

        it('cliente sem nome') do
            @result = Moip.post(
                '/customers',
                headers: header,
                body: cliente_sem_nome.to_json
            )
            expect(@result.response.code).to eql '400'
            expect(@result.parsed_response['errors'].first['description']).to eql 'O nome não foi informado'    
        end

        it('cliente com email invalido') do
            @result = Moip.post(
                '/customers',
                headers: header,
                body: cliente_email_invalido.to_json
            )
            expect(@result.response.code).to eql '400'
            expect(@result.parsed_response['errors'].first['description']).to eql 'O e-mail informado é inválido'    
        end

        # ...
        
    end

end