describe('Post /orders/id/payments') do
    
        before(:all) do        
            @result = Moip.post(
                '/orders',
                headers: header,
                body: pedido.to_json 
            )
            @pedido = @result.parsed_response
        end
    
        describe('status 200:') do
            it('cadastrar novo pagamento') do
                @result = Moip.post(
                    "/orders/#{@pedido['id']}/payments",
                    headers: header,
                    body: pagamento.to_json 
                )
                expect(@result.response.code).to eql '201'
            end
        end
    
        describe('status 4xx:') do
            it('boleto com data invalida') do
                @result = Moip.post(
                    "/orders/#{@pedido['id']}/payments",
                    headers: header,
                    body: pagamento_boleto_data_invalida.to_json 
                )
                expect(@result.response.code).to eql '400'
                expect(@result.parsed_response['errors'].first['description']).to eql 'A data de expiração do boleto bancário informado é inválida'    
            end
    
            # ...
    
        end
    
    end