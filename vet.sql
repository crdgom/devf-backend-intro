-- Postgres Veterinary database creation script

drop table if exists pet cascade;
drop table if exists pet_owner cascade;
drop table if exists vet cascade;
drop table if exists species cascade;
drop table if exists blood_type cascade;
drop table if exists diagnosis cascade;
drop table if exists served_by cascade;


-- Create tables

-- Table Pet
create table if not exists pet(
    id_pet int generated always as identity,
    pet_name text not null,
    pet_age int not null,
    pet_weight int not null,
    pet_size text not null,
    pet_color text not null,
    created_at timestamp default now(),
    updated_at timestamp default now(),
    primary key (id_pet)

    -- Referencia a la tabla pet_owner
    constraint fk_pet_owner
        foreign key (id_pet_owner)
            references pet_owner(id_pet_owner)

    -- Referencia a la tabla species
    constraint fk_species
        foreign key (id_species)
            references species(id_species)
    
    -- Referencia a la tabla blood_type
    constraint fk_blood_type
        foreign key (id_blood_type)
            references blood_type(id_blood_type)
    
    -- referencia para el usuario que creo el registro
    constraint fk_created_by
        foreign key (created_by)
            references system_user(id_system_user)
);

-- Table Pet_Owner
create table if not exists pet_owner(
    id_pet_owner int generated always as identity,
    pet_owner_name text not null,
    pet_owner_last_name text not null,
    pet_owner_street_name text not null,
    pet_owner_street_ext_number int not null,
    pet_owner_street_int_number int not null,
    pet_owner_city text not null,
    pet_owner_state text not null,
    pet_owner_zip_code int not null,
    pet_owner_phone text not null,
    pet_owner_email text not null,
    created_at timestamp default now(),
    updated_at timestamp default now(),
    primary key (id_pet_owner)

    -- referencia para el usuario que creo el registro
    constraint fk_created_by
        foreign key (created_by)
            references system_user(id_system_user)
);

-- Table Vet
create table if not exists vet(
    id_vet int generated always as identity,
    vet_name text not null,
    vet_last_name text not null,
    vet_license_number int not null,
    vet_phone text not null,
    vet_email text not null,
    created_at timestamp default now(),
    updated_at timestamp default now(),
    primary key (id_vet)

    -- referencia para el usuario que creo el registro
    constraint fk_created_by
        foreign key (created_by)
            references system_user(id_system_user)
);

-- Table Species
create table if not exists species(
    id_species int generated always as identity,
    species_name text not null,
    created_at timestamp default now(),
    updated_at timestamp default now(),
    primary key (id_species)

    -- referencia para el usuario que creo el registro
    constraint fk_created_by
        foreign key (created_by)
            references system_user(id_system_user)
);

-- Table Blood_Type
create table if not exists blood_type(
    id_blood_type int generated always as identity,
    blood_type_group text not null,
    blood_type_factor text not null,
    created_at timestamp default now(),
    updated_at timestamp default now(),
    primary key (id_blood_type)

    -- referencia para el usuario que creo el registro
    constraint fk_created_by
        foreign key (created_by)
            references system_user(id_system_user)
);

-- Table Diagnosis
create table if not exists diagnosis(
    id_diagnosis int generated always as identity,
    diagnosis text not null,
    created_at timestamp default now(),
    updated_at timestamp default now(),
    primary key (id_diagnosis)

    -- referencia para el usuario que creo el registro
    constraint fk_created_by
        foreign key (created_by)
            references system_user(id_system_user)

    -- referencia al id del pet
    constraint fk_pet
        foreign key (id_pet)
            references pet(id_pet)

    -- referencia al id del vet
    constraint fk_vet
        foreign key (id_vet)
            references vet(id_vet)
);

-- Table Served_By

create table if not exists served_by(
    id_served_by int generated always as identity,
    created_at timestamp default now(),
    updated_at timestamp default now(),
    primary key (id_served_by)

    -- referencia al id del pet
    constraint fk_pet
        foreign key (id_pet)
            references pet(id_pet)

    -- referencia al id del vet
    constraint fk_vet
        foreign key (id_vet)
            references vet(id_vet)
);

-- Table System_User
create table if not exists system_user(
    id_system_user int generated always as identity,
    user_name text not null,
    user_last_name text not null,
    user_email text not null,
    user_password text not null,
    created_at timestamp default now(),
    updated_at timestamp default now(),
    primary key (id_system_user)
);
  
