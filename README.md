#### Problema do Miojo:
#### Diferença de Coordenadas:


### Dependências

- Ruby 3.1.2;
- Ruby on Rails 7.0.3;

### Download

Baixe o sistema.

**Instalação das bibliotecas**

<pre>bundle install</pre>

**Inicialização do servidor**

<pre>rails s</pre>



### Testes de requisição via API

Nesse Exemplo foi utilizado o Insomnia, porem poderá usar qualquer outro.

Temos 2 endpoint:

1 -> POST : localhost:3000/noodles - retorna o tempo do miojo

**Body:**
{
	"noodle":{
		"cook_time": 3, 
		"hourglass_one": 5, 
		"hourglass_two": 7
	}
}

**Resposta:**
{
	"time": "Tempo estimado de 10 minutos"
}

2 -> POST : localhost:3000/geopoints - retorna a diferença de pontos

**Body:**
{
	"geopoint":{
		"latitude":  [-6.2514619, -39.2065666],
		"logintude": [-6.3604404, -39.3243686]
		
	}
}

**Resposta:**
{
	"distance": 11.05
}



### Testes automatizados
**Para execução dos testes automatizados basta executar o comando**
<pre>rspec</pre>




