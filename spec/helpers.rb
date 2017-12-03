
module Helpers
    
    def header
        {
            'Content-Type' => 'application/json', 
            'Authorization' => 'Basic N0xYQVlEVDhZWkdQRUpZT1pGNVNBSlJaNkZOQkVRWUM6VUxKR09QWldPWkRNWkVURE5DVjY2QjJMUEtLV045WjBSU0hLVEZWMA=='
        }
    end
    
    def cliente
        {
            ownId: "cliente_id_#{Faker::Number.number(10)}",
            fullname: Faker::Name.name ,
            email: Faker::Internet.email,
            phone: {
                countryCode: "55",
                areaCode: "11",
                number: Faker::Number.number(8)
            },
            taxDocument: {
                type: "CPF",
                number: "22222222222"
            },
            shippingAddress: {
                zipCode: "01234000",
                street: "Avenida Faria Lima",
                streetNumber: "2927",
                complement: "8",
                city: "Sao Paulo",
                district: "Itaim",
                state: "SP",
                country: "BRA"
            }
        }
    end

    def cliente_sem_id
        {
            fullname: Faker::Name.name ,
            email: Faker::Internet.email,
            phone: {
                countryCode: "55",
                areaCode: "11",
                number: Faker::Number.number(8)
            },
            taxDocument: {
                type: "CPF",
                number: "22222222222"
            },
            shippingAddress: {
                zipCode: "01234000",
                street: "Avenida Faria Lima",
                streetNumber: "2927",
                complement: "8",
                city: "Sao Paulo",
                district: "Itaim",
                state: "SP",
                country: "BRA"
            }
        }
    end
    
    def cliente_sem_nome
        {
            ownId: "cliente_id_#{Faker::Number.number(10)}",
            email: Faker::Internet.email,
            phone: {
                countryCode: "55",
                areaCode: "11",
                number: Faker::Number.number(8)
            },
            taxDocument: {
                type: "CPF",
                number: "22222222222"
            },
            shippingAddress: {
                zipCode: "01234000",
                street: "Avenida Faria Lima",
                streetNumber: "2927",
                complement: "8",
                city: "Sao Paulo",
                district: "Itaim",
                state: "SP",
                country: "BRA"
            }
        }
    end
    
    def cliente_email_invalido
        {
            ownId: "cliente_id_#{Faker::Number.number(10)}",
            fullname: Faker::Name.name,
            email: Faker::Name.name, #email sem @
            phone: {
                countryCode: "55",
                areaCode: "11",
                number: Faker::Number.number(8)
            },
            taxDocument: {
                type: "CPF",
                number: "22222222222"
            },
            shippingAddress: {
                zipCode: "01234000",
                street: "Avenida Faria Lima",
                streetNumber: "2927",
                complement: "8",
                city: "Sao Paulo",
                district: "Itaim",
                state: "SP",
                country: "BRA"
            }
        }
    end
    
    def cartao
        {
            method: "CREDIT_CARD",
            creditCard: {
                expirationMonth: "05",
                expirationYear: "22",
                number: "5555666677778884",
                cvc: "123",
                holder: {
                    fullname: "Jose Portador da Silva",
                    birthdate: "1988-12-30",
                    taxDocument: {
                        type: "CPF",
                        number: "33333333333"
                    },
                    phone: {
                        countryCode: "55",
                        areaCode: "11",
                        number: "66778899"
                    }
                }
            }
        }
    end

    def cartao_sem_nome
        {
            method: "CREDIT_CARD",
            creditCard: {
                expirationMonth: "05",
                expirationYear: "22",
                number: "5555666677778884",
                cvc: "123",
                holder: {
                    birthdate: "1988-12-30",
                    taxDocument: {
                        type: "CPF",
                        number: "33333333333"
                    },
                    phone: {
                        countryCode: "55",
                        areaCode: "11",
                        number: "66778899"
                    }
                }
            }
        }
    end

    def cartao_cpf_invalido
        {
            method: "CREDIT_CARD",
            creditCard: {
                expirationMonth: "05",
                expirationYear: "22",
                number: "5555666677778884",
                cvc: "123",
                holder: {
                    fullname: "Jose Portador da Silva",
                    birthdate: "1988-12-30",
                    taxDocument: {
                        type: "CPF",
                        number: "33333333333999999999999"
                    },
                    phone: {
                        countryCode: "55",
                        areaCode: "11",
                        number: "66778899"
                    }
                }
            }
        }
    end

    def pedido
        {
            ownId: "pedido_id_#{Faker::Number.number(10)}",
            amount: {
                currency: "BRL",
                subtotals: {
                    shipping: 1000
            }
            },
            items: [
                {
                    product: Faker::Commerce.product_name,
                    category: "CLOTHING",
                    quantity: 1,
                    detail: "Mais info...",
                    price: Faker::Number.number(6)
                }
            ],
            customer: cliente,
            receivers: [
                {
                    type: "SECONDARY",
                    feePayor: true,
                    moipAccount: {
                        id: "MPA-8EFDDD7C2C8C"
                    },
                    amount: {
                        percentual: 30
                    }
                }
            ]
        }
    end

    def pedido_produto_sem_nome
        {
            ownId: "pedido_id_#{Faker::Number.number(10)}",
            amount: {
                currency: "BRL",
                subtotals: {
                    shipping: 1000
            }
            },
            items: [
                {
                    category: "CLOTHING",
                    quantity: 1,
                    detail: "Mais info...",
                    price: Faker::Number.number(6)
                }
            ],
            customer: cliente,
            receivers: [
                {
                    type: "SECONDARY",
                    feePayor: true,
                    moipAccount: {
                        id: "MPA-8EFDDD7C2C8C"
                    },
                    amount: {
                        percentual: 30
                    }
                }
            ]
        }
    end

    def pagamento
        {
            installmentCount: 1,
            statementDescriptor: "minhaLoja.com",
            fundingInstrument: {
                method: "BOLETO",
                boleto: {
                    expirationDate: '2017-12-15',
                    instructionLines: {
                        first: "first",
                        second: "second",
                        third: "third",
                        logoUri: "http://1.bp.blogspot.com/_ah3XcoPIV2g/S1qiFlyGjnI/AAAAAAAABJ8/od3G3d9_tIw/w1200-h630-p-k-no-nu/Bradesco+1.JPG"
                    }
                }
            },
            device: {
                ip: "127.0.0.1",
                geolocation: {
                    latitude: -33.867,
                    longitude: 151.206
                },
                userAgent: "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.81 Safari/537.36",
                fingerprint: "QAZXswedCVGrtgBNHyujMKIkolpQAZXswedCVGrtgBNHyujMKIkolpQAZXswedCVGrtgBNHyujMKIkolpQAZXswedCVGrtgBNHyujMKIkolp"
            }
        }
    end

    def pagamento_boleto_data_invalida
        {
            installmentCount: 1,
            statementDescriptor: "minhaLoja.com",
            fundingInstrument: {
                method: "BOLETO",
                boleto: {
                    expirationDate: 'xxx',
                    instructionLines: {
                        first: "first",
                        second: "second",
                        third: "third",
                        logoUri: "http://1.bp.blogspot.com/_ah3XcoPIV2g/S1qiFlyGjnI/AAAAAAAABJ8/od3G3d9_tIw/w1200-h630-p-k-no-nu/Bradesco+1.JPG"
                    }
                }
            },
            device: {
                ip: "127.0.0.1",
                geolocation: {
                    latitude: -33.867,
                    longitude: 151.206
                },
                userAgent: "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.81 Safari/537.36",
                fingerprint: "QAZXswedCVGrtgBNHyujMKIkolpQAZXswedCVGrtgBNHyujMKIkolpQAZXswedCVGrtgBNHyujMKIkolpQAZXswedCVGrtgBNHyujMKIkolp"
            }
        }
    end

end