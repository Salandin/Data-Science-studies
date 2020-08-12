SET DATESTYLE TO PostgreSQL,European;

CREATE SEQUENCE IDVendedor;
CREATE TABLE Vendedores(
    IDVendedor int default  nextval('IDVendedor'::regclass) PRIMARY KEY ,
    Nome varchar(50)
);

CREATE SEQUENCE  IDProduto;
CREATE TABLE Produtos(
    IDProduto int default nextval('IDProduto'::regclass) PRIMARY KEY ,
    Produto varchar(100),
    Preco numeric(10,2)
);

CREATE SEQUENCE IDCliente;
CREATE TABLE Clientes(
    IDCliente int default nextval('IDCliente'::regclass) PRIMARY KEY ,
    Cliente varchar(50),
    Estado varchar(2),
    Sexo char(1),
    Status varchar(50)
);

CREATE SEQUENCE IDVenda;
CREATE TABLE Vendas(
    IDVenda int default nextval('IDVenda'::regclass) PRIMARY KEY,
    IDVendedor int references Vendedores (IDVendedor),
    IDCliente int references Clientes (IDCliente),
    Data date,
    Total numeric(10, 2)
);

CREATE TABLE ItensVenda (
    IDProduto int REFERENCES Produtos ON DELETE RESTRICT ,
    IDVenda int REFERENCES Vendas ON DELETE CASCADE,
    Quantidade int,
    ValorUnitario decimal(10,2),
    ValorTotal decimal(10,2),
    Desconto decimal(10,2),
    PRIMARY KEY (IDProduto, IDVenda)
)
