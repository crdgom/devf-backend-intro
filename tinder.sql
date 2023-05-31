-- create tinder DB

CREATE DATABASE tinder;

-- clean tables

drop table if exists skills cascade;
drop table if exists personality cascade;
drop table if exists person cascade;
drop table if exists services cascade;
drop table if exists payments cascade;
drop table if exists califications cascade;
drop table if exists company cascade;
drop table if exists service_status cascade;

-- create table skills

create table if not exists skills (
    id_skills int primary key generated always as identity,
    skill_name varchar(250) not null,
    created_at timestamp default now(),
    updated_at timestamp default now()
);

-- create table personality

create table if not exists personality (
    id_personality int primary key generated always as identity,
    personality_name varchar(250) not null,
    created_at timestamp default now(),
    updated_at timestamp default now()
);

-- create table company

create table if not exists company (
    id_company int primary key generated always as identity,
    company_name varchar(250) not null,
    account_type varchar(250) not null,
    created_at timestamp default now(),
    updated_at timestamp default now()
);

-- create table califications

create table if not exists califications (
    id_calification int primary key generated always as identity,
    service_id int not null,
    calification int not null,
    comment text not null,
    created_at timestamp default now(),
    updated_at timestamp default now()
);

-- create table service_status

create table if not exists service_status (
    id_service_status int primary key generated always as identity,
    service_id int not null,
    company_confirmation boolean not null,
    person_confirmation boolean not null,
    created_at timestamp default now(),
    updated_at timestamp default now()
);

-- create table person

create table if not exists person(
    id_person int primary key generated always as identity,
    person_name varchar(250) not null,
    skills_id int not null,
    personality_id int not null,
    hourly_rate money not null,
    account_type varchar(250) not null,
    created_at timestamp default now(),
    updated_at timestamp default now(),

    -- foreign key (skills) references skills(id_skills)
    constraint fk_skills
        foreign key (skills_id)
            references skills(id_skills),

    -- foreign key (personality) references personality(id_personality)
    constraint fk_personality
        foreign key (personality_id)
            references personality(id_personality)
);

-- create table services

create table if not exists services (
    id_services int primary key generated always as identity,
    person_id int not null,
    company_id int not null,
    service_description text not null,
    rate_hour money not null,
    work_duration int not null,
    work_start_date date not null,
    work_end_date date not null,
    work_status int not null,
    created_at timestamp default now(),
    updated_at timestamp default now(),

    -- foreign key (person_id) references person(id_person)
    constraint fk_person
        foreign key (person_id)
            references person(id_person),
    
    -- foreign key (company_id) references company(id_company)
    constraint fk_company
        foreign key (company_id)
            references company(id_company),
    
    -- foreign key (work_status) references service_status(id_service_status)
    constraint fk_service_status
        foreign key (work_status)
            references service_status(id_service_status),

    -- foreign key hourly_rate references person(hourly_rate)
    /* constraint fk_hourly_rate
        foreign key (rate_hour)
            references person(hourly_rate) */
);

-- create table payments

create table if not exists payments (
    id_payment int primary key generated always as identity,
    service_id int not null,
    advance_payment money not null,
    service_total money not null,
    payment_status varchar(250) not null,
    created_at timestamp default now(),
    updated_at timestamp default now(),

    -- foreign key (service_id) references services(id_services)
    constraint fk_services
        foreign key (service_id)
            references services(id_services)
);


-- insert data into skills

INSERT INTO skills (skill_name) VALUES
('comunicación'),
('interpersonales'),
('liderazgo'),
('trabajo en equipo'),
('resolución de problemas'),
('análisis de datos'),
('programación'),
('diseño gráfico'),
('marketing digital'),
('gestión de proyectos'),
('ventas'),
('atención al cliente'),
('organización'),
('planificación'),
('negociación'),
('finanzas'),
('investigación'),
('escritura'),
('edición de vídeo'),
('edición de audio'),
('traducción'),
('oratoria'),
('enseñanza'),
('coaching'),
('programación web'),
('programación móvil'),
('gestión de bases de datos'),
('seguridad informática'),
('redes informáticas'),
('soporte técnico'),
('atención médica'),
('enfermería'),
('fisioterapia'),
('nutrición'),
('psicología'),
('terapia ocupacional'),
('ciencias sociales'),
('historia'),
('filosofía'),
('literatura'),
('arte'),
('música'),
('cine'),
('teatro'),
('deportes'),
('cocina'),
('jardinería'),
('manualidades'),
('costura'),
('carpintería');

-- insert data into personality

INSERT INTO personality (personality_name)
VALUES 
('Introvertido'),
('Extrovertido'),
('Sensitivo'),
('Intuitivo'),
('Pensador'),
('Emocional'),
('Observador'),
('Crítico'),
('Práctico'),
('Idealista'),
('Lógico'),
('Analítico'),
('Imaginativo'),
('Creativo'),
('Realista'),
('Cuidadoso'),
('Decidido'),
('Flexible'),
('Consciente'),
('Espontáneo'),
('Afectuoso'),
('Confiado'),
('Diplomático'),
('Cooperativo'),
('Autónomo'),
('Dominante'),
('Competitivo'),
('Innovador'),
('Tradicional'),
('Humilde'),
('Seguro de sí mismo'),
('Sincero'),
('Curioso'),
('Confiable'),
('Apasionado'),
('Persuasivo'),
('Sociable'),
('Reservado'),
('Respetuoso'),
('Perspicaz');


-- insert data into company
INSERT INTO company (company_name, account_type) VALUES
('Rappi', 'enterprice'),
('Google', 'enterprice'),
('Apple', 'enterprice'),
('Amazon', 'enterprice'),
('Microsoft', 'enterprice'),
('Facebook', 'enterprice'),
('Netflix', 'enterprice'),
('Tesla', 'enterprice'),
('Uber', 'enterprice'),
('Airbnb', 'enterprice'),
('Dropbox', 'enterprice'),
('Twitter', 'enterprice'),
('LinkedIn', 'enterprice'),
('Square', 'enterprice'),
('Slack', 'enterprice'),
('Zoom', 'enterprice'),
('Salesforce', 'enterprice'),
('Oracle', 'enterprice');

-- insert data into person
INSERT INTO person (person_name, skills_id, personality_id, hourly_rate, account_type) 
VALUES 
('Salma Hayek', FLOOR(RANDOM()*50)+1, FLOOR(RANDOM()*40)+1, 5000, 'user'),
('Gael García Bernal', FLOOR(RANDOM()*50)+1, FLOOR(RANDOM()*40)+1, 7000, 'user'),
('Diego Luna', FLOOR(RANDOM()*50)+1, FLOOR(RANDOM()*40)+1, 3000, 'user'),
('Kate del Castillo', FLOOR(RANDOM()*50)+1, FLOOR(RANDOM()*40)+1, 600, 'user'),
('Eugenio Derbez', FLOOR(RANDOM()*50)+1, FLOOR(RANDOM()*40)+1, 4560, 'user'),
('Pedrito Sola', 22, 1, 30, 'user'),
('Alfonso Herrera', FLOOR(RANDOM()*50)+1, FLOOR(RANDOM()*40)+1, 100, 'user'),
('Karla Souza', FLOOR(RANDOM()*50)+1, FLOOR(RANDOM()*40)+1, 987, 'user'),
('Diego Boneta', FLOOR(RANDOM()*50)+1, FLOOR(RANDOM()*40)+1, 2240, 'user'),
('Aislinn Derbez', FLOOR(RANDOM()*50)+1, FLOOR(RANDOM()*40)+1, 25, 'user'),
('Luis Gerardo Méndez', FLOOR(RANDOM()*50)+1, FLOOR(RANDOM()*40)+1, 455, 'user'),
('Itatí Cantoral', FLOOR(RANDOM()*50)+1, FLOOR(RANDOM()*40)+1, 2354, 'user'),
('Mauricio Ochmann', FLOOR(RANDOM()*50)+1, FLOOR(RANDOM()*40)+1, 203, 'user'),
('Fernanda Castillo', FLOOR(RANDOM()*50)+1, FLOOR(RANDOM()*40)+1, 810, 'user'),
('Daniel Giménez Cacho', FLOOR(RANDOM()*50)+1, FLOOR(RANDOM()*40)+1, 932, 'user'),
('Vanessa Bauche', FLOOR(RANDOM()*50)+1, FLOOR(RANDOM()*40)+1, 3487, 'user'),
('Jaime Camil', FLOOR(RANDOM()*50)+1, FLOOR(RANDOM()*40)+1, 100, 'user'),
('Verónica Castro', FLOOR(RANDOM()*50)+1, FLOOR(RANDOM()*40)+1, 40, 'user'),
('Ana de la Reguera', FLOOR(RANDOM()*50)+1, FLOOR(RANDOM()*40)+1, 637, 'user');
