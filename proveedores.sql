/* 
    ? - Un negocio quiere llevar el control de piezas que emplean en el día a día y los proveedores que suministran estas.
    ? - De cada proveedor conocemos su nombre, dirección, ciudad, provincia y un código de proveedor que será único para cada uno de ellos.
    ? - Nos interesa llevar un control de las piezas que nos suministra cada proveedor.
    ? - Es importante conocer la cantidad de las diferentes piezas que nos suministra y en qué fecha lo hace.
    ? - Tenga en cuenta que un mismo proveedor nos puede suministrar una pieza con el mismo código en diferentes fechas.
    ? - El diseño de la base de datos debe permitir almacenar un histórico con todas las fechas y las cantidades que nos ha proporcionado un proveedor.
    ? - Una misma pieza puede ser suministrada por diferentes proveedores.
    ? - De cada pieza conocemos un código que será único, nombre, color, precio y categoría.
    ? - Pueden existir varias categorías y para cada categoría hay un nombre y un código de categoría único.
    ? - Una pieza solo puede pertenecer a una categoría.
    ? - Realizar el modelo entidad-relación, documentar las querys para crear las tablas en PostgreSQL y ejecutarlas. 
*/

-- Drop tables

drop table if exists proveedores;
drop table if exists piezas;
drop table if exists categorias;
drop table if exists suministra;

-- Create tables

create table proveedores (
    id_proveedor serial generated always as identity,
    codigo_proveedor smallint not null unique,
    nombre varchar(50) not null,
    direccion varchar(250) not null,
    ciudad varchar(250) not null,
    provincia varchar(250) not null
);

create table piezas (
    id_pieza serial generated always as identity,
    codigo_pieza int not null unique,
    nombre varchar(50) not null,
    color varchar(50) not null,
    precio money not null default 0.00,
    id_categoria int not null,

    constraint fk_categoria
        foreign key (id_categoria)
        references categorias(id_categoria)
);

create table categorias (
    id_categoria serial generated always as identity,
    codigo_categoria int not null unique,
    nombre varchar(250) not null
);

create table suministra (
    id_suministro serial generated always as identity,
    id_proveedor int not null,
    id_pieza int not null,
    id_categoria int not null,
    cantidad int not null default 0,
    fecha date not null default current_date

    

    constraint fk_proveedor
        foreign key (id_proveedor)
        references proveedores(id_proveedor)

    constraint fk_pieza
        foreign key (id_pieza)
        references piezas(id_pieza)

    constraint fk_categoria
        foreign key (id_categoria)
        references categorias(id_categoria)

);
