                                                        1 ✘ 
Executing (default): SELECT table_name FROM information_schema.tables WHERE table_schema = 'public' AND table_name = 'especialidads'
Executing (default): CREATE TABLE IF NOT EXISTS "especialidads" ("id"   SERIAL , "codigo" VARCHAR(255) NOT NULL UNIQUE, "descripcion" VARCHAR(255) NOT NULL, "createdAt" TIMESTAMP WITH TIME ZONE NOT NULL, "updatedAt" TIMESTAMP WITH TIME ZONE NOT NULL, PRIMARY KEY ("id"));

Executing (default):
SELECT
    i.relname AS name,
    ix.indisprimary AS primary,
    ix.indisunique AS unique,
    ix.indkey AS indkey,
    array_agg(a.attnum) as column_indexes,
    array_agg(a.attname) AS column_names,
    pg_get_indexdef(ix.indexrelid) AS definition
FROM
    pg_class t,
    pg_class i,
    pg_index ix,
    pg_attribute a
WHERE
    t.oid = ix.indrelid
    AND i.oid = ix.indexrelid
    AND a.attrelid = t.oid
    AND t.relkind = 'r'
    and t.relname = 'especialidads'
GROUP BY
    i.relname,
    ix.indexrelid,
    ix.indisprimary,
    ix.indisunique,
    ix.indkey
ORDER BY i.relname;

Executing (default):
SELECT table_name
FROM
    information_schema.tables
WHERE
    table_schema = 'public'
    AND table_name = 'medicos' Executing (default):
CREATE TABLE
    IF NOT EXISTS "medicos" (
        "id" SERIAL,
        "nombre" VARCHAR(255) NOT NULL,
        "rut" VARCHAR(255) NOT NULL UNIQUE,
        "direccion" VARCHAR(255) NOT NULL,
        "createdAt" TIMESTAMP
        WITH
            TIME ZONE NOT NULL,
            "updatedAt" TIMESTAMP
        WITH
            TIME ZONE NOT NULL,
            "especialidadId" INTEGER REFERENCES "especialidads" ("id") ON DELETE
        SET
            NULL ON UPDATE CASCADE,
            PRIMARY KEY ("id")
    );

Executing (default):
SELECT
    i.relname AS name,
    ix.indisprimary AS primary,
    ix.indisunique AS unique,
    ix.indkey AS indkey,
    array_agg(a.attnum) as column_indexes,
    array_agg(a.attname) AS column_names,
    pg_get_indexdef(ix.indexrelid) AS definition
FROM
    pg_class t,
    pg_class i,
    pg_index ix,
    pg_attribute a
WHERE
    t.oid = ix.indrelid
    AND i.oid = ix.indexrelid
    AND a.attrelid = t.oid
    AND t.relkind = 'r'
    and t.relname = 'medicos'
GROUP BY
    i.relname,
    ix.indexrelid,
    ix.indisprimary,
    ix.indisunique,
    ix.indkey
ORDER BY i.relname;

Executing (default):
SELECT table_name
FROM
    information_schema.tables
WHERE
    table_schema = 'public'
    AND table_name = 'pacientes' Executing (default):
CREATE TABLE
    IF NOT EXISTS "pacientes" (
        "id" SERIAL,
        "nombre" VARCHAR(255) NOT NULL,
        "rut" VARCHAR(255) NOT NULL UNIQUE,
        "direccion" VARCHAR(255) NOT NULL,
        "createdAt" TIMESTAMP
        WITH
            TIME ZONE NOT NULL,
            "updatedAt" TIMESTAMP
        WITH
            TIME ZONE NOT NULL,
            PRIMARY KEY ("id")
    );

Executing (default):
SELECT
    i.relname AS name,
    ix.indisprimary AS primary,
    ix.indisunique AS unique,
    ix.indkey AS indkey,
    array_agg(a.attnum) as column_indexes,
    array_agg(a.attname) AS column_names,
    pg_get_indexdef(ix.indexrelid) AS definition
FROM
    pg_class t,
    pg_class i,
    pg_index ix,
    pg_attribute a
WHERE
    t.oid = ix.indrelid
    AND i.oid = ix.indexrelid
    AND a.attrelid = t.oid
    AND t.relkind = 'r'
    and t.relname = 'pacientes'
GROUP BY
    i.relname,
    ix.indexrelid,
    ix.indisprimary,
    ix.indisunique,
    ix.indkey
ORDER BY i.relname;

Executing (default):
SELECT table_name
FROM
    information_schema.tables
WHERE
    table_schema = 'public'
    AND table_name = 'consulta' Executing (default):
CREATE TABLE
    IF NOT EXISTS "consulta" (
        "id" SERIAL,
        "fecha" DATE NOT NULL,
        "hora" TIME NOT NULL,
        "box" INTEGER NOT NULL,
        "createdAt" TIMESTAMP
        WITH
            TIME ZONE NOT NULL,
            "updatedAt" TIMESTAMP
        WITH
            TIME ZONE NOT NULL,
            "medicoId" INTEGER REFERENCES "medicos" ("id") ON DELETE
        SET
            NULL ON UPDATE CASCADE,
            "pacienteId" INTEGER REFERENCES "pacientes" ("id") ON DELETE
        SET
            NULL ON UPDATE CASCADE,
            PRIMARY KEY ("id")
    );

Executing (default):
SELECT
    i.relname AS name,
    ix.indisprimary AS primary,
    ix.indisunique AS unique,
    ix.indkey AS indkey,
    array_agg(a.attnum) as column_indexes,
    array_agg(a.attname) AS column_names,
    pg_get_indexdef(ix.indexrelid) AS definition
FROM
    pg_class t,
    pg_class i,
    pg_index ix,
    pg_attribute a
WHERE
    t.oid = ix.indrelid
    AND i.oid = ix.indexrelid
    AND a.attrelid = t.oid
    AND t.relkind = 'r'
    and t.relname = 'consulta'
GROUP BY
    i.relname,
    ix.indexrelid,
    ix.indisprimary,
    ix.indisunique,
    ix.indkey
ORDER BY i.relname;

Executing (default):
SELECT table_name
FROM
    information_schema.tables
WHERE
    table_schema = 'public'
    AND table_name = 'licencia' Executing (default):
CREATE TABLE
    IF NOT EXISTS "licencia" (
        "codigo" VARCHAR(255) NOT NULL UNIQUE,
        "diagnostico" VARCHAR(255) NOT NULL,
        "fecha_inicio" DATE NOT NULL,
        "fecha_termino" DATE NOT NULL,
        "createdAt" TIMESTAMP
        WITH
            TIME ZONE NOT NULL,
            "updatedAt" TIMESTAMP
        WITH
            TIME ZONE NOT NULL,
            "medicoId" INTEGER REFERENCES "medicos" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
            "pacienteId" INTEGER REFERENCES "pacientes" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
            PRIMARY KEY ("medicoId", "pacienteId")
    );

Executing (default):
SELECT
    i.relname AS name,
    ix.indisprimary AS primary,
    ix.indisunique AS unique,
    ix.indkey AS indkey,
    array_agg(a.attnum) as column_indexes,
    array_agg(a.attname) AS column_names,
    pg_get_indexdef(ix.indexrelid) AS definition
FROM
    pg_class t,
    pg_class i,
    pg_index ix,
    pg_attribute a
WHERE
    t.oid = ix.indrelid
    AND i.oid = ix.indexrelid
    AND a.attrelid = t.oid
    AND t.relkind = 'r'
    and t.relname = 'licencia'
GROUP BY
    i.relname,
    ix.indexrelid,
    ix.indisprimary,
    ix.indisunique,
    ix.indkey
ORDER BY i.relname;