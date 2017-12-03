describe('Post /orders') do

    describe('status 200:') do
        it('cadastrar novo pedido') do
            @result = Moip.post(
                '/orders',
                headers: header,
                body: pedido.to_json 
            )
            expect(@result.response.code).to eql '201'
        end
    end

    describe('status 4xx:') do
        it('pedido com produto sem nome') do
            @result = Moip.post(
                "/orders",
                headers: header,
                body: pedido_produto_sem_nome.to_json 
            )
            expect(@result.response.code).to eql '400'
            expect(@result.parsed_response['errors'].first['description']).to eql 'Informe o nome do produto'    
        end

        # ...

    end

end