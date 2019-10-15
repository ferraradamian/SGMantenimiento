
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 10/05/2019 18:24:23
-- Generated from EDMX file: C:\Users\ry04549\source\repos\SGMantenimiento201909\SGM\Models\Model.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [BDSGM];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_Empleado_Empresa]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Empleado] DROP CONSTRAINT [FK_Empleado_Empresa];
GO
IF OBJECT_ID(N'[dbo].[FK_Guardia_Empeado_Empleado]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Guardia_Empeado] DROP CONSTRAINT [FK_Guardia_Empeado_Empleado];
GO
IF OBJECT_ID(N'[dbo].[FK_Guardia_Empeado_Guardia]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Guardia_Empeado] DROP CONSTRAINT [FK_Guardia_Empeado_Guardia];
GO
IF OBJECT_ID(N'[dbo].[FK_EspecialidadFuncion]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Funcion] DROP CONSTRAINT [FK_EspecialidadFuncion];
GO
IF OBJECT_ID(N'[dbo].[FK_FuncionEmpleado]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Empleado] DROP CONSTRAINT [FK_FuncionEmpleado];
GO
IF OBJECT_ID(N'[dbo].[FK_OrganizacionEstructuraOrganizacionUbicacion]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[OrganizacionUbicacion] DROP CONSTRAINT [FK_OrganizacionEstructuraOrganizacionUbicacion];
GO
IF OBJECT_ID(N'[dbo].[FK_OrgUbicOrgUbic]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[OrganizacionUbicacion] DROP CONSTRAINT [FK_OrgUbicOrgUbic];
GO
IF OBJECT_ID(N'[dbo].[FK_OrganizacionUbicacionEquipo]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Equipo] DROP CONSTRAINT [FK_OrganizacionUbicacionEquipo];
GO
IF OBJECT_ID(N'[dbo].[FK_EmpleadoEmpleado_Guardia]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Empleado_Guardia] DROP CONSTRAINT [FK_EmpleadoEmpleado_Guardia];
GO
IF OBJECT_ID(N'[dbo].[FK_GuardiaEmpleado_Guardia]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Empleado_Guardia] DROP CONSTRAINT [FK_GuardiaEmpleado_Guardia];
GO
IF OBJECT_ID(N'[dbo].[FK_CronogramaTarea]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Tarea] DROP CONSTRAINT [FK_CronogramaTarea];
GO
IF OBJECT_ID(N'[dbo].[FK_EquipoTarea]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Tarea] DROP CONSTRAINT [FK_EquipoTarea];
GO
IF OBJECT_ID(N'[dbo].[FK_OrganizacionUbicacionTarea]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Tarea] DROP CONSTRAINT [FK_OrganizacionUbicacionTarea];
GO
IF OBJECT_ID(N'[dbo].[FK_FallaFallaTarea]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[FallaTarea] DROP CONSTRAINT [FK_FallaFallaTarea];
GO
IF OBJECT_ID(N'[dbo].[FK_TareaFallaTarea]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[FallaTarea] DROP CONSTRAINT [FK_TareaFallaTarea];
GO
IF OBJECT_ID(N'[dbo].[FK_SintomasFalla]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Falla] DROP CONSTRAINT [FK_SintomasFalla];
GO
IF OBJECT_ID(N'[dbo].[FK_RecursoRecursoTarea]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[RecursoTarea] DROP CONSTRAINT [FK_RecursoRecursoTarea];
GO
IF OBJECT_ID(N'[dbo].[FK_TareaRecursoTarea]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[RecursoTarea] DROP CONSTRAINT [FK_TareaRecursoTarea];
GO
IF OBJECT_ID(N'[dbo].[FK_GrupoRecurso]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Recurso] DROP CONSTRAINT [FK_GrupoRecurso];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Empleado]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Empleado];
GO
IF OBJECT_ID(N'[dbo].[Empresa]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Empresa];
GO
IF OBJECT_ID(N'[dbo].[Equipo]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Equipo];
GO
IF OBJECT_ID(N'[dbo].[Guardia]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Guardia];
GO
IF OBJECT_ID(N'[dbo].[Tarea]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Tarea];
GO
IF OBJECT_ID(N'[dbo].[Recurso]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Recurso];
GO
IF OBJECT_ID(N'[dbo].[RecursoTarea]', 'U') IS NOT NULL
    DROP TABLE [dbo].[RecursoTarea];
GO
IF OBJECT_ID(N'[dbo].[Especialidad]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Especialidad];
GO
IF OBJECT_ID(N'[dbo].[Funcion]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Funcion];
GO
IF OBJECT_ID(N'[dbo].[OrganizacionEstructura]', 'U') IS NOT NULL
    DROP TABLE [dbo].[OrganizacionEstructura];
GO
IF OBJECT_ID(N'[dbo].[OrganizacionUbicacion]', 'U') IS NOT NULL
    DROP TABLE [dbo].[OrganizacionUbicacion];
GO
IF OBJECT_ID(N'[dbo].[Empleado_Guardia]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Empleado_Guardia];
GO
IF OBJECT_ID(N'[dbo].[Falla]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Falla];
GO
IF OBJECT_ID(N'[dbo].[FallaTarea]', 'U') IS NOT NULL
    DROP TABLE [dbo].[FallaTarea];
GO
IF OBJECT_ID(N'[dbo].[Sintomas]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Sintomas];
GO
IF OBJECT_ID(N'[dbo].[Grupo]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Grupo];
GO
IF OBJECT_ID(N'[dbo].[Guardia_Empeado]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Guardia_Empeado];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Empleado'
CREATE TABLE [dbo].[Empleado] (
    [empleado_id] int IDENTITY(1,1) NOT NULL,
    [empresa_id] int  NOT NULL,
    [nombre] nvarchar(64)  NOT NULL,
    [apellido] nvarchar(64)  NOT NULL,
    [legajo] nvarchar(max)  NULL,
    [funcion_Id] int  NOT NULL,
    [documento_tipo] tinyint  NULL,
    [documento_numero] int  NULL,
    [cuil] nvarchar(max)  NULL,
    [grupo_sanguineo] tinyint  NULL,
    [factor_rh] tinyint  NULL,
    [telefono_fijo] bigint  NULL,
    [tel_celular_1] bigint  NULL,
    [tel_celular_2] bigint  NULL,
    [tel_radio] bigint  NULL,
    [radio] bigint  NULL,
    [interno] int  NULL,
    [email] nvarchar(max)  NULL,
    [foto] varbinary(max)  NULL,
    [direccion] nvarchar(max)  NULL,
    [numero] nvarchar(max)  NULL,
    [pais] nvarchar(max)  NULL,
    [provincia] nvarchar(max)  NULL,
    [ciudad] nvarchar(max)  NULL,
    [codigo_postal] nvarchar(max)  NULL
);
GO

-- Creating table 'Empresa'
CREATE TABLE [dbo].[Empresa] (
    [empresa_id] int IDENTITY(1,1) NOT NULL,
    [nombre] nchar(20)  NOT NULL,
    [telefono] nvarchar(max)  NULL,
    [email] nchar(20)  NULL,
    [cuit] bigint  NULL
);
GO

-- Creating table 'Equipo'
CREATE TABLE [dbo].[Equipo] (
    [equipo_id] int IDENTITY(1,1) NOT NULL,
    [nombre] nchar(20)  NOT NULL,
    [descripcion] nvarchar(max)  NOT NULL,
    [estado_equipo] tinyint  NULL,
    [fabricante] nvarchar(max)  NULL,
    [marca] nchar(15)  NULL,
    [modelo] nchar(15)  NULL,
    [numero_parte] nvarchar(max)  NULL,
    [numero_serie] nchar(20)  NULL,
    [inicioOperacion] datetime  NULL,
    [finOperacion] datetime  NULL,
    [esCritico] bit  NULL,
    [OrganizacionUbicacionId] int  NOT NULL
);
GO

-- Creating table 'Guardia'
CREATE TABLE [dbo].[Guardia] (
    [guardia_id] int IDENTITY(1,1) NOT NULL,
    [nombre] nvarchar(max)  NOT NULL,
    [descripcion] nvarchar(max)  NULL,
    [duracion_horas] tinyint  NULL,
    [guardia_activa] bit  NOT NULL
);
GO

-- Creating table 'Tarea'
CREATE TABLE [dbo].[Tarea] (
    [tarea_id] int IDENTITY(1,1) NOT NULL,
    [descripcion] nchar(250)  NOT NULL,
    [estado_tarea] tinyint  NULL,
    [fecha_hora] datetime  NOT NULL,
    [permiso_trabajo] bigint  NULL,
    [CronogramaId] uniqueidentifier  NOT NULL,
    [Equipo_equipo_id] int  NULL,
    [OrganizacionUbicacionId] int  NOT NULL
);
GO

-- Creating table 'Recurso'
CREATE TABLE [dbo].[Recurso] (
    [recurso_id] int IDENTITY(1,1) NOT NULL,
    [nombre] nchar(50)  NOT NULL,
    [descripcion] nvarchar(max)  NULL,
    [GrupoId] smallint  NOT NULL
);
GO

-- Creating table 'RecursoTarea'
CREATE TABLE [dbo].[RecursoTarea] (
    [recurso_id] int IDENTITY(1,1) NOT NULL,
    [cantidadUsada] float  NOT NULL,
    [unidad] nvarchar(max)  NOT NULL,
    [Recurso_recurso_id] int  NOT NULL,
    [Tarea_tarea_id] int  NOT NULL
);
GO

-- Creating table 'Especialidad'
CREATE TABLE [dbo].[Especialidad] (
    [especialidad_id] tinyint IDENTITY(1,1) NOT NULL,
    [nombre] nvarchar(max)  NOT NULL,
    [descripcion] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Funcion'
CREATE TABLE [dbo].[Funcion] (
    [funcion_id] int IDENTITY(1,1) NOT NULL,
    [nombre] nvarchar(max)  NOT NULL,
    [descripcion] nvarchar(max)  NULL,
    [EspecialidadId] tinyint  NOT NULL
);
GO

-- Creating table 'OrganizacionEstructura'
CREATE TABLE [dbo].[OrganizacionEstructura] (
    [Id] tinyint  NOT NULL,
    [nivel] tinyint  NOT NULL,
    [nivel_nombre] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'OrganizacionUbicacion'
CREATE TABLE [dbo].[OrganizacionUbicacion] (
    [Id] int  NOT NULL,
    [nombre] nvarchar(max)  NOT NULL,
    [descripcion] nvarchar(max)  NULL,
    [OrganizacionEstructuraId] tinyint  NOT NULL,
    [OrganizacionUbicacionId] int  NULL
);
GO

-- Creating table 'Empleado_Guardia'
CREATE TABLE [dbo].[Empleado_Guardia] (
    [Id] uniqueidentifier  NOT NULL,
    [Guardia_guardia_id] int  NOT NULL,
    [Empleado_empleado_id] int  NOT NULL,
    [fecha_inicio] datetime  NOT NULL,
    [hora_inicio] time  NOT NULL,
    [fecha_fin] datetime  NOT NULL,
    [hora_fin] time  NOT NULL,
    [observaciones] nvarchar(max)  NULL
);
GO

-- Creating table 'Falla'
CREATE TABLE [dbo].[Falla] (
    [SintomasId] int  NOT NULL,
    [Id] int IDENTITY(1,1) NOT NULL,
    [nombre] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'FallaTarea'
CREATE TABLE [dbo].[FallaTarea] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [FallaId] int  NOT NULL,
    [Tarea_tarea_id] int  NOT NULL
);
GO

-- Creating table 'Sintomas'
CREATE TABLE [dbo].[Sintomas] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [nombre] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Grupo'
CREATE TABLE [dbo].[Grupo] (
    [Id]     SMALLINT       IDENTITY (1, 1) NOT NULL,
    [nombre] NVARCHAR (MAX) NOT NULL,
    [cod_grupo1] NVARCHAR(MAX) NULL, 
    [desc_grupo1] NVARCHAR(MAX) NULL, 
    [cod_grupo2] NVARCHAR(MAX) NULL, 
    [desc_grupo2] NVARCHAR(MAX) NULL, 
    CONSTRAINT [PK_Grupo] PRIMARY KEY CLUSTERED ([Id] ASC)
);
GO

-- Creating table 'Guardia_Empeado'
CREATE TABLE [dbo].[Guardia_Empeado] (
    [Guardia_Empeado_Guardia_empleado_id] int  NOT NULL,
    [Guardia_Empeado_Empleado_guardia_id] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [empleado_id] in table 'Empleado'
ALTER TABLE [dbo].[Empleado]
ADD CONSTRAINT [PK_Empleado]
    PRIMARY KEY CLUSTERED ([empleado_id] ASC);
GO

-- Creating primary key on [empresa_id] in table 'Empresa'
ALTER TABLE [dbo].[Empresa]
ADD CONSTRAINT [PK_Empresa]
    PRIMARY KEY CLUSTERED ([empresa_id] ASC);
GO

-- Creating primary key on [equipo_id] in table 'Equipo'
ALTER TABLE [dbo].[Equipo]
ADD CONSTRAINT [PK_Equipo]
    PRIMARY KEY CLUSTERED ([equipo_id] ASC);
GO

-- Creating primary key on [guardia_id] in table 'Guardia'
ALTER TABLE [dbo].[Guardia]
ADD CONSTRAINT [PK_Guardia]
    PRIMARY KEY CLUSTERED ([guardia_id] ASC);
GO

-- Creating primary key on [tarea_id] in table 'Tarea'
ALTER TABLE [dbo].[Tarea]
ADD CONSTRAINT [PK_Tarea]
    PRIMARY KEY CLUSTERED ([tarea_id] ASC);
GO

-- Creating primary key on [recurso_id] in table 'Recurso'
ALTER TABLE [dbo].[Recurso]
ADD CONSTRAINT [PK_Recurso]
    PRIMARY KEY CLUSTERED ([recurso_id] ASC);
GO

-- Creating primary key on [recurso_id] in table 'RecursoTarea'
ALTER TABLE [dbo].[RecursoTarea]
ADD CONSTRAINT [PK_RecursoTarea]
    PRIMARY KEY CLUSTERED ([recurso_id] ASC);
GO

-- Creating primary key on [especialidad_id] in table 'Especialidad'
ALTER TABLE [dbo].[Especialidad]
ADD CONSTRAINT [PK_Especialidad]
    PRIMARY KEY CLUSTERED ([especialidad_id] ASC);
GO

-- Creating primary key on [funcion_id] in table 'Funcion'
ALTER TABLE [dbo].[Funcion]
ADD CONSTRAINT [PK_Funcion]
    PRIMARY KEY CLUSTERED ([funcion_id] ASC);
GO

-- Creating primary key on [Id] in table 'OrganizacionEstructura'
ALTER TABLE [dbo].[OrganizacionEstructura]
ADD CONSTRAINT [PK_OrganizacionEstructura]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'OrganizacionUbicacion'
ALTER TABLE [dbo].[OrganizacionUbicacion]
ADD CONSTRAINT [PK_OrganizacionUbicacion]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Empleado_Guardia'
ALTER TABLE [dbo].[Empleado_Guardia]
ADD CONSTRAINT [PK_Empleado_Guardia]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Falla'
ALTER TABLE [dbo].[Falla]
ADD CONSTRAINT [PK_Falla]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'FallaTarea'
ALTER TABLE [dbo].[FallaTarea]
ADD CONSTRAINT [PK_FallaTarea]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Sintomas'
ALTER TABLE [dbo].[Sintomas]
ADD CONSTRAINT [PK_Sintomas]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Grupo'
ALTER TABLE [dbo].[Grupo]
ADD CONSTRAINT [PK_Grupo]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Guardia_Empeado_Guardia_empleado_id], [Guardia_Empeado_Empleado_guardia_id] in table 'Guardia_Empeado'
ALTER TABLE [dbo].[Guardia_Empeado]
ADD CONSTRAINT [PK_Guardia_Empeado]
    PRIMARY KEY CLUSTERED ([Guardia_Empeado_Guardia_empleado_id], [Guardia_Empeado_Empleado_guardia_id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [empresa_id] in table 'Empleado'
ALTER TABLE [dbo].[Empleado]
ADD CONSTRAINT [FK_Empleado_Empresa]
    FOREIGN KEY ([empresa_id])
    REFERENCES [dbo].[Empresa]
        ([empresa_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Empleado_Empresa'
CREATE INDEX [IX_FK_Empleado_Empresa]
ON [dbo].[Empleado]
    ([empresa_id]);
GO

-- Creating foreign key on [Guardia_Empeado_Guardia_empleado_id] in table 'Guardia_Empeado'
ALTER TABLE [dbo].[Guardia_Empeado]
ADD CONSTRAINT [FK_Guardia_Empeado_Empleado]
    FOREIGN KEY ([Guardia_Empeado_Guardia_empleado_id])
    REFERENCES [dbo].[Empleado]
        ([empleado_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Guardia_Empeado_Empleado_guardia_id] in table 'Guardia_Empeado'
ALTER TABLE [dbo].[Guardia_Empeado]
ADD CONSTRAINT [FK_Guardia_Empeado_Guardia]
    FOREIGN KEY ([Guardia_Empeado_Empleado_guardia_id])
    REFERENCES [dbo].[Guardia]
        ([guardia_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Guardia_Empeado_Guardia'
CREATE INDEX [IX_FK_Guardia_Empeado_Guardia]
ON [dbo].[Guardia_Empeado]
    ([Guardia_Empeado_Empleado_guardia_id]);
GO

-- Creating foreign key on [EspecialidadId] in table 'Funcion'
ALTER TABLE [dbo].[Funcion]
ADD CONSTRAINT [FK_EspecialidadFuncion]
    FOREIGN KEY ([EspecialidadId])
    REFERENCES [dbo].[Especialidad]
        ([especialidad_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_EspecialidadFuncion'
CREATE INDEX [IX_FK_EspecialidadFuncion]
ON [dbo].[Funcion]
    ([EspecialidadId]);
GO

-- Creating foreign key on [funcion_Id] in table 'Empleado'
ALTER TABLE [dbo].[Empleado]
ADD CONSTRAINT [FK_FuncionEmpleado]
    FOREIGN KEY ([funcion_Id])
    REFERENCES [dbo].[Funcion]
        ([funcion_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_FuncionEmpleado'
CREATE INDEX [IX_FK_FuncionEmpleado]
ON [dbo].[Empleado]
    ([funcion_Id]);
GO

-- Creating foreign key on [OrganizacionEstructuraId] in table 'OrganizacionUbicacion'
ALTER TABLE [dbo].[OrganizacionUbicacion]
ADD CONSTRAINT [FK_OrganizacionEstructuraOrganizacionUbicacion]
    FOREIGN KEY ([OrganizacionEstructuraId])
    REFERENCES [dbo].[OrganizacionEstructura]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_OrganizacionEstructuraOrganizacionUbicacion'
CREATE INDEX [IX_FK_OrganizacionEstructuraOrganizacionUbicacion]
ON [dbo].[OrganizacionUbicacion]
    ([OrganizacionEstructuraId]);
GO

-- Creating foreign key on [OrganizacionUbicacionId] in table 'OrganizacionUbicacion'
ALTER TABLE [dbo].[OrganizacionUbicacion]
ADD CONSTRAINT [FK_OrgUbicOrgUbic]
    FOREIGN KEY ([OrganizacionUbicacionId])
    REFERENCES [dbo].[OrganizacionUbicacion]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_OrgUbicOrgUbic'
CREATE INDEX [IX_FK_OrgUbicOrgUbic]
ON [dbo].[OrganizacionUbicacion]
    ([OrganizacionUbicacionId]);
GO

-- Creating foreign key on [OrganizacionUbicacionId] in table 'Equipo'
ALTER TABLE [dbo].[Equipo]
ADD CONSTRAINT [FK_OrganizacionUbicacionEquipo]
    FOREIGN KEY ([OrganizacionUbicacionId])
    REFERENCES [dbo].[OrganizacionUbicacion]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_OrganizacionUbicacionEquipo'
CREATE INDEX [IX_FK_OrganizacionUbicacionEquipo]
ON [dbo].[Equipo]
    ([OrganizacionUbicacionId]);
GO

-- Creating foreign key on [Empleado_empleado_id] in table 'Empleado_Guardia'
ALTER TABLE [dbo].[Empleado_Guardia]
ADD CONSTRAINT [FK_EmpleadoEmpleado_Guardia]
    FOREIGN KEY ([Empleado_empleado_id])
    REFERENCES [dbo].[Empleado]
        ([empleado_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_EmpleadoEmpleado_Guardia'
CREATE INDEX [IX_FK_EmpleadoEmpleado_Guardia]
ON [dbo].[Empleado_Guardia]
    ([Empleado_empleado_id]);
GO

-- Creating foreign key on [Guardia_guardia_id] in table 'Empleado_Guardia'
ALTER TABLE [dbo].[Empleado_Guardia]
ADD CONSTRAINT [FK_GuardiaEmpleado_Guardia]
    FOREIGN KEY ([Guardia_guardia_id])
    REFERENCES [dbo].[Guardia]
        ([guardia_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_GuardiaEmpleado_Guardia'
CREATE INDEX [IX_FK_GuardiaEmpleado_Guardia]
ON [dbo].[Empleado_Guardia]
    ([Guardia_guardia_id]);
GO

-- Creating foreign key on [CronogramaId] in table 'Tarea'
ALTER TABLE [dbo].[Tarea]
ADD CONSTRAINT [FK_CronogramaTarea]
    FOREIGN KEY ([CronogramaId])
    REFERENCES [dbo].[Empleado_Guardia]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CronogramaTarea'
CREATE INDEX [IX_FK_CronogramaTarea]
ON [dbo].[Tarea]
    ([CronogramaId]);
GO

-- Creating foreign key on [Equipo_equipo_id] in table 'Tarea'
ALTER TABLE [dbo].[Tarea]
ADD CONSTRAINT [FK_EquipoTarea]
    FOREIGN KEY ([Equipo_equipo_id])
    REFERENCES [dbo].[Equipo]
        ([equipo_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_EquipoTarea'
CREATE INDEX [IX_FK_EquipoTarea]
ON [dbo].[Tarea]
    ([Equipo_equipo_id]);
GO

-- Creating foreign key on [OrganizacionUbicacionId] in table 'Tarea'
ALTER TABLE [dbo].[Tarea]
ADD CONSTRAINT [FK_OrganizacionUbicacionTarea]
    FOREIGN KEY ([OrganizacionUbicacionId])
    REFERENCES [dbo].[OrganizacionUbicacion]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_OrganizacionUbicacionTarea'
CREATE INDEX [IX_FK_OrganizacionUbicacionTarea]
ON [dbo].[Tarea]
    ([OrganizacionUbicacionId]);
GO

-- Creating foreign key on [FallaId] in table 'FallaTarea'
ALTER TABLE [dbo].[FallaTarea]
ADD CONSTRAINT [FK_FallaFallaTarea]
    FOREIGN KEY ([FallaId])
    REFERENCES [dbo].[Falla]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_FallaFallaTarea'
CREATE INDEX [IX_FK_FallaFallaTarea]
ON [dbo].[FallaTarea]
    ([FallaId]);
GO

-- Creating foreign key on [Tarea_tarea_id] in table 'FallaTarea'
ALTER TABLE [dbo].[FallaTarea]
ADD CONSTRAINT [FK_TareaFallaTarea]
    FOREIGN KEY ([Tarea_tarea_id])
    REFERENCES [dbo].[Tarea]
        ([tarea_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_TareaFallaTarea'
CREATE INDEX [IX_FK_TareaFallaTarea]
ON [dbo].[FallaTarea]
    ([Tarea_tarea_id]);
GO

-- Creating foreign key on [SintomasId] in table 'Falla'
ALTER TABLE [dbo].[Falla]
ADD CONSTRAINT [FK_SintomasFalla]
    FOREIGN KEY ([SintomasId])
    REFERENCES [dbo].[Sintomas]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SintomasFalla'
CREATE INDEX [IX_FK_SintomasFalla]
ON [dbo].[Falla]
    ([SintomasId]);
GO

-- Creating foreign key on [Recurso_recurso_id] in table 'RecursoTarea'
ALTER TABLE [dbo].[RecursoTarea]
ADD CONSTRAINT [FK_RecursoRecursoTarea]
    FOREIGN KEY ([Recurso_recurso_id])
    REFERENCES [dbo].[Recurso]
        ([recurso_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_RecursoRecursoTarea'
CREATE INDEX [IX_FK_RecursoRecursoTarea]
ON [dbo].[RecursoTarea]
    ([Recurso_recurso_id]);
GO

-- Creating foreign key on [Tarea_tarea_id] in table 'RecursoTarea'
ALTER TABLE [dbo].[RecursoTarea]
ADD CONSTRAINT [FK_TareaRecursoTarea]
    FOREIGN KEY ([Tarea_tarea_id])
    REFERENCES [dbo].[Tarea]
        ([tarea_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_TareaRecursoTarea'
CREATE INDEX [IX_FK_TareaRecursoTarea]
ON [dbo].[RecursoTarea]
    ([Tarea_tarea_id]);
GO

-- Creating foreign key on [GrupoId] in table 'Recurso'
ALTER TABLE [dbo].[Recurso]
ADD CONSTRAINT [FK_GrupoRecurso]
    FOREIGN KEY ([GrupoId])
    REFERENCES [dbo].[Grupo]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_GrupoRecurso'
CREATE INDEX [IX_FK_GrupoRecurso]
ON [dbo].[Recurso]
    ([GrupoId]);
GO

INSERT INTO Especialidad (nombre, descripcion)
VALUES 
('Instrumentos', 'Especialidad Instrumentos'),
('Electricidad', 'Especialidad Electricidad'),
('Mecánica', 'Especialidad Mecánica'),
('Metalurgia', 'Especialidad Metalurgia');

INSERT INTO Funcion (nombre, descripcion, EspecialidadId)
VALUES 
('Oficial Instrumentos', 'Especialidad Instrumentos', '1'),
('Oficial Electricidad', 'Especialidad Electricidad', '2'),
('Oficial Mecánica', 'Especialidad Mecánica', '3'),
('Oficial Metalurgia', 'Especialidad Metalurgia', '4');

INSERT INTO OrganizacionEstructura (Id, nivel, nivel_nombre)
VALUES 
('1', '1', 'Empresa'),
('2', '2', 'Sitio'),
('3', '3', 'Planta'),
('4', '4', 'Area');

INSERT INTO OrganizacionUbicacion (Id, nombre, descripcion, OrganizacionEstructuraId, OrganizacionUbicacionId)
VALUES 
('1', 'Empresa Demo', 'Descripción Empresa Demo','1', NULL ),
('2', 'Sitio Demo', 'Descripción Sitio Demo','2', '1' ),
('3', 'Planta Demo', 'Descripción Planta Demo','3', '2' ),
('4', 'Area Demo 1', 'Descripción Area Demo 1','4', '3' ),
('5', 'Area Demo 2', 'Descripción Area Demo 2','5', '3' );

INSERT INTO Empresa(nombre,telefono,email,cuit)
VALUES
('Empresa Demo 1', '123456', 'info@demo1.com', '301234560'),
('Empresa Demo 2', '234567', 'info@demo2.com', '302345670'),
('Empresa Demo 3', '345678', 'info@demo3.com', '303456780'),
('Empresa Demo 4', '456890', 'info@demo4.com', '304567890');

INSERT INTO Empleado (empresa_id,nombre,apellido,legajo,funcion_Id,documento_tipo,documento_numero,cuil)
VALUES
('1', 'Empleado 1', 'Demo', '123456', '1', '0', '123456', '241234560'),
('2', 'Empleado 2', 'Demo', '234567', '1', '0', '234567', '242345670'),
('3', 'Empleado 3', 'Demo', '345678', '1', '0', '345678', '273456780'),
('4', 'Empleado 4', 'Demo', '456789', '1', '0', '456789', '274567890');

INSERT INTO Grupo (Id,nombre,cod_grupo1,desc_grupo1,cod_grupo2,desc_grupo2)
VALUES
('101', 'HERR.CONVENC.SONDEO', 'GRP.01', 'MATERIALES DE POZO', 'GRP.0101', 'EQUIPOS Y HERRAMIENTAS DE POZO'),
('102', 'EQ.PERFOR./TERMINAC.', 'GRP.01', 'MATERIALES DE POZO', 'GRP.0101', 'EQUIPOS Y HERRAMIENTAS DE POZO'),
('104', 'MAT.PESCA POZO PETR.', 'GRP.01', 'MATERIALES DE POZO', 'GRP.0101', 'EQUIPOS Y HERRAMIENTAS DE POZO'),
('105', 'TREPANOS Y ACCES.', 'GRP.01', 'MATERIALES DE POZO', 'GRP.0101', 'EQUIPOS Y HERRAMIENTAS DE POZO'),
('106', 'HERR.CEMENTAC.POZOS', 'GRP.01', 'MATERIALES DE POZO', 'GRP.0101', 'EQUIPOS Y HERRAMIENTAS DE POZO'),
('108', 'HERR.MANIOBRA /PERF.', 'GRP.01', 'MATERIALES DE POZO', 'GRP.0101', 'EQUIPOS Y HERRAMIENTAS DE POZO'),
('109', 'BOCA POZO/ARMAD.SURG', 'GRP.01', 'MATERIALES DE POZO', 'GRP.0102', 'CABEZALES DE POZO'),
('110', 'HERR.COMPLETAC.POZOS', 'GRP.01', 'MATERIALES DE POZO', 'GRP.0101', 'EQUIPOS Y HERRAMIENTAS DE POZO'),
('111', 'BARRA/VASTAGO BOMBEO', 'GRP.01', 'MATERIALES DE POZO', 'GRP.0103', 'LEVANTAMIENTO ARTIFICIAL'),
('112', 'LODOS PERFORAC.POZOS', 'GRP.01', 'MATERIALES DE POZO', 'GRP.0104', 'MATERIALES DE ESTIMULACION'),
('113', 'BOP PREVENTOR SURGEN', 'GRP.01', 'MATERIALES DE POZO', 'GRP.0102', 'CABEZALES DE POZO'),
('115', 'CASING (OCTG)', 'GRP.01', 'MATERIALES DE POZO', 'GRP.0105', 'CASING Y ACCESORIOS'),
('116', 'TUBING (OCTG)', 'GRP.01', 'MATERIALES DE POZO', 'GRP.0106', 'TUBING Y ACCESORIOS'),
('117', 'ACC.CASING (OCTG)', 'GRP.01', 'MATERIALES DE POZO', 'GRP.0105', 'CASING Y ACCESORIOS'),
('118', 'ACC.TUBING (OCTG)', 'GRP.01', 'MATERIALES DE POZO', 'GRP.0106', 'TUBING Y ACCESORIOS'),
('119', 'AIB APAR.IND.BOMBEO', 'GRP.01', 'MATERIALES DE POZO', 'GRP.0103', 'LEVANTAMIENTO ARTIFICIAL'),
('120', 'EQ.EXTRACC.PETROLEO', 'GRP.01', 'MATERIALES DE POZO', 'GRP.0103', 'LEVANTAMIENTO ARTIFICIAL'),
('121', 'HERR.OFFSHORE/MAT.', 'GRP.01', 'MATERIALES DE POZO', 'GRP.0101', 'EQUIPOS Y HERRAMIENTAS DE POZO'),
('122', 'COLG.TUBERIA', 'GRP.01', 'MATERIALES DE POZO', 'GRP.0101', 'EQUIPOS Y HERRAMIENTAS DE POZO'),
('123', 'AG.SOSTEN/ PROPANTE', 'GRP.01', 'MATERIALES DE POZO', 'GRP.0104', 'MATERIALES DE ESTIMULACION'),
('124', 'INSTALAC.SUPERF.POZO', 'GRP.01', 'MATERIALES DE POZO', 'GRP.0101', 'EQUIPOS Y HERRAMIENTAS DE POZO'),
('201', 'MOTOR ELECTRICO', 'GRP.02', 'MATERIALES ELECTRICOS', 'GRP.0201', 'MAQUINAS ELECTRICAS'),
('202', 'RECTIF/UPS/INVERS/AC', 'GRP.02', 'MATERIALES ELECTRICOS', 'GRP.0201', 'MAQUINAS ELECTRICAS'),
('203', 'PROTECC.ELECTRICAS', 'GRP.02', 'MATERIALES ELECTRICOS', 'GRP.0202', 'PROTECCION Y MANIOBRA'),
('204', 'CONDUIT/ ACC.ELECTR.', 'GRP.02', 'MATERIALES ELECTRICOS', 'GRP.0203', 'TENDIDO ELECTRICO'),
('205', 'BATERIAS/PILAS/ACC.', 'GRP.02', 'MATERIALES ELECTRICOS', 'GRP.0203', 'TENDIDO ELECTRICO'),
('206', 'CABLE CONDUCT.ELECTR', 'GRP.02', 'MATERIALES ELECTRICOS', 'GRP.0203', 'TENDIDO ELECTRICO'),
('207', 'ILUMINACION/ACCESOR.', 'GRP.02', 'MATERIALES ELECTRICOS', 'GRP.0203', 'TENDIDO ELECTRICO'),
('208', 'CAJA/GABINET.ELECTR.', 'GRP.02', 'MATERIALES ELECTRICOS', 'GRP.0203', 'TENDIDO ELECTRICO'),
('209', 'PAT/PARARRAYO JABAL.', 'GRP.02', 'MATERIALES ELECTRICOS', 'GRP.0202', 'PROTECCION Y MANIOBRA'),
('210', 'TRANSFORMADORES', 'GRP.02', 'MATERIALES ELECTRICOS', 'GRP.0201', 'MAQUINAS ELECTRICAS'),
('211', 'GENERADOR ELECTRICO', 'GRP.02', 'MATERIALES ELECTRICOS', 'GRP.0201', 'MAQUINAS ELECTRICAS'),
('214', 'TABLERO E./ CCM/ CM', 'GRP.02', 'MATERIALES ELECTRICOS', 'GRP.0203', 'TENDIDO ELECTRICO'),
('216', 'ELEM.MANIOBR.ELECTR.', 'GRP.02', 'MATERIALES ELECTRICOS', 'GRP.0202', 'PROTECCION Y MANIOBRA'),
('217', 'AISLADOR ELECTRICO', 'GRP.02', 'MATERIALES ELECTRICOS', 'GRP.0202', 'PROTECCION Y MANIOBRA'),
('301', 'INSTR.ELECTRIC.TABL.', 'GRP.03', 'MATERIALES MEDICION Y CONTROL', 'GRP.0301', 'EQUIPOS INSTRUMENTACION INDUSTRIAL'),
('302', 'INSTR.MEDIC.PROCESO', 'GRP.03', 'MATERIALES MEDICION Y CONTROL', 'GRP.0301', 'EQUIPOS INSTRUMENTACION INDUSTRIAL'),
('303', 'DISCO RUPTURA', 'GRP.04', 'MATERIAL DE CONDUCCION', 'GRP.0401', 'VALVULAS Y ACCESORIOS'),
('304', 'INSTR.PORTAT.LAB.EL.', 'GRP.03', 'MATERIALES MEDICION Y CONTROL', 'GRP.0301', 'EQUIPOS INSTRUMENTACION INDUSTRIAL'),
('305', 'CABLE INSTRUMENTAC.', 'GRP.03', 'MATERIALES MEDICION Y CONTROL', 'GRP.0301', 'EQUIPOS INSTRUMENTACION INDUSTRIAL'),
('306', 'SEÑAL./ALARMA/TELEM.', 'GRP.03', 'MATERIALES MEDICION Y CONTROL', 'GRP.0302', 'SISTEMAS DE CONTROL'),
('307', 'INSTR.REGUL./CONTROL', 'GRP.03', 'MATERIALES MEDICION Y CONTROL', 'GRP.0302', 'SISTEMAS DE CONTROL'),
('308', 'COMPON.ELECTRONICOS', 'GRP.03', 'MATERIALES MEDICION Y CONTROL', 'GRP.0302', 'SISTEMAS DE CONTROL'),
('309', 'TRANSMISOR.CONVERTID', 'GRP.03', 'MATERIALES MEDICION Y CONTROL', 'GRP.0301', 'EQUIPOS INSTRUMENTACION INDUSTRIAL'),
('310', 'CONTROLAD.LOGIC(PLC)', 'GRP.03', 'MATERIALES MEDICION Y CONTROL', 'GRP.0302', 'SISTEMAS DE CONTROL'),
('401', 'BARCO/CAPSULA SUPERV', 'GRP.05', 'MATERIALES TRANSPORTE', 'GRP.0501', 'MEDIOS DE TRANSPOTE'),
('402', 'MAQ.ELEVAC.GRUA/VIAL', 'GRP.05', 'MATERIALES TRANSPORTE', 'GRP.0502', 'IZAJE/MOVIMIENTO DE CARGAS'),
('404', 'TRENES/VIAS/ACC./REP', 'GRP.05', 'MATERIALES TRANSPORTE', 'GRP.0501', 'MEDIOS DE TRANSPOTE'),
('405', 'AUTOS/CAMION/BUS/REP', 'GRP.05', 'MATERIALES TRANSPORTE', 'GRP.0501', 'MEDIOS DE TRANSPOTE'),
('406', 'AVIONES/HELICOPT/ACC', 'GRP.05', 'MATERIALES TRANSPORTE', 'GRP.0501', 'MEDIOS DE TRANSPOTE'),
('501', 'PQ ADHESIVO/PEGAMENT', 'GRP.06', 'PRODUCTOS QUÍMICOS/LABORATORIO', 'GRP.0601', 'PRODUCTOS QUÍMICOS'),
('502', 'COMBUSTIBLES', 'GRP.06', 'PRODUCTOS QUÍMICOS/LABORATORIO', 'GRP.0601', 'PRODUCTOS QUÍMICOS'),
('503', 'ACEITE/GRASA/PARAFIN', 'GRP.06', 'PRODUCTOS QUÍMICOS/LABORATORIO', 'GRP.0601', 'PRODUCTOS QUÍMICOS'),
('504', 'PQ CATALIZADORES', 'GRP.06', 'PRODUCTOS QUÍMICOS/LABORATORIO', 'GRP.0601', 'PRODUCTOS QUÍMICOS'),
('505', 'PQ INORGANICOS', 'GRP.06', 'PRODUCTOS QUÍMICOS/LABORATORIO', 'GRP.0601', 'PRODUCTOS QUÍMICOS'),
('507', 'PETROLEO/GAS NATURAL', 'GRP.06', 'PRODUCTOS QUÍMICOS/LABORATORIO', 'GRP.0601', 'PRODUCTOS QUÍMICOS'),
('508', 'PQ ORGANICO/ OTROS', 'GRP.06', 'PRODUCTOS QUÍMICOS/LABORATORIO', 'GRP.0601', 'PRODUCTOS QUÍMICOS'),
('509', 'ADITIVOS', 'GRP.06', 'PRODUCTOS QUÍMICOS/LABORATORIO', 'GRP.0601', 'PRODUCTOS QUÍMICOS'),
('601', 'EQ.LABORAT.QUIM/REP.', 'GRP.06', 'PRODUCTOS QUÍMICOS/LABORATORIO', 'GRP.0602', 'EQUIPOS E INSUMOS LABORATORIO'),
('602', 'MAT.INSUMOS LABOR.Q.', 'GRP.06', 'PRODUCTOS QUÍMICOS/LABORATORIO', 'GRP.0602', 'EQUIPOS E INSUMOS LABORATORIO'),
('603', 'GASES P/LABORATORIO', 'GRP.06', 'PRODUCTOS QUÍMICOS/LABORATORIO', 'GRP.0602', 'EQUIPOS E INSUMOS LABORATORIO'),
('605', 'REACTIVOS P/LABORAT.', 'GRP.06', 'PRODUCTOS QUÍMICOS/LABORATORIO', 'GRP.0602', 'EQUIPOS E INSUMOS LABORATORIO'),
('701', 'SEG.PROTEC.PERSONAL', 'GRP.07', 'EQUIPOS Y MATERIALES MASC', 'GRP.0701', 'PROTECION PERSONAL'),
('702', 'EQ./ACC.SEG.INDUSTR', 'GRP.07', 'EQUIPOS Y MATERIALES MASC', 'GRP.0702', 'SEGURIDAD INDUSTRIAL'),
('703', 'EQ.MEDICO/VETERINAR.', 'GRP.07', 'EQUIPOS Y MATERIALES MASC', 'GRP.0701', 'PROTECION PERSONAL'),
('704', 'PROTECC.MED.AMBIENTE', 'GRP.07', 'EQUIPOS Y MATERIALES MASC', 'GRP.0703', 'MEDIO AMBIENTE'),
('705', 'ROPA Y CALZADO', 'GRP.07', 'EQUIPOS Y MATERIALES MASC', 'GRP.0701', 'PROTECION PERSONAL'),
('706', 'ARMAS Y ACCESORIOS', 'GRP.07', 'EQUIPOS Y MATERIALES MASC', 'GRP.0702', 'SEGURIDAD INDUSTRIAL'),
('707', 'DETEC.GAS INFL/TOXIC', 'GRP.07', 'EQUIPOS Y MATERIALES MASC', 'GRP.0702', 'SEGURIDAD INDUSTRIAL'),
('801', 'CAÑO CONDUCC.FLUIDOS', 'GRP.04', 'MATERIAL DE CONDUCCION', 'GRP.0402', 'LINE PIPE'),
('802', 'ACC.CAÑERIA CONDUCC.', 'GRP.04', 'MATERIAL DE CONDUCCION', 'GRP.0403', 'ACCESORIO DE CAÑERIAS'),
('803', 'BRIDAS/ACC.BRIDAD.', 'GRP.04', 'MATERIAL DE CONDUCCION', 'GRP.0403', 'ACCESORIO DE CAÑERIAS'),
('804', 'TUBOS', 'GRP.04', 'MATERIAL DE CONDUCCION', 'GRP.0402', 'LINE PIPE'),
('805', 'ACC.TUBOS', 'GRP.04', 'MATERIAL DE CONDUCCION', 'GRP.0403', 'ACCESORIO DE CAÑERIAS'),
('806', 'PREFABR.CAÑERIA', 'GRP.04', 'MATERIAL DE CONDUCCION', 'GRP.0403', 'ACCESORIO DE CAÑERIAS'),
('807', 'SCRAPER / ACCES/REP.', 'GRP.04', 'MATERIAL DE CONDUCCION', 'GRP.0403', 'ACCESORIO DE CAÑERIAS'),
('808', 'ACCES.ESPEC.TUBERIA', 'GRP.04', 'MATERIAL DE CONDUCCION', 'GRP.0403', 'ACCESORIO DE CAÑERIAS'),
('901', 'ABRASIVOS', 'GRP.08', 'MATERIALES VARIOS', 'GRP.0801', 'FERRETERIA'),
('902', 'APAREJOS / PASTECAS', 'GRP.05', 'MATERIALES TRANSPORTE', 'GRP.0502', 'IZAJE/MOVIMIENTO DE CARGAS'),
('904', 'CABLES ACERO / ACC.', 'GRP.05', 'MATERIALES TRANSPORTE', 'GRP.0502', 'IZAJE/MOVIMIENTO DE CARGAS'),
('905', 'ALAMBR/RESORT/TEJMET', 'GRP.08', 'MATERIALES VARIOS', 'GRP.0801', 'FERRETERIA'),
('906', 'ESLINGA/ACC', 'GRP.05', 'MATERIALES TRANSPORTE', 'GRP.0502', 'IZAJE/MOVIMIENTO DE CARGAS'),
('907', 'ELEM.TRANSMIC.MOVIM.', 'GRP.05', 'MATERIALES TRANSPORTE', 'GRP.0502', 'IZAJE/MOVIMIENTO DE CARGAS'),
('908', 'MAT.SOLDADURA /ACC.', 'GRP.08', 'MATERIALES VARIOS', 'GRP.0801', 'FERRETERIA'),
('909', 'METAL/PERFIL/ESTRUCT', 'GRP.08', 'MATERIALES VARIOS', 'GRP.0802', 'PERFILES CHAPAS Y ESTRUCTURAS'),
('910', 'CADENA ACERO /ACCES.', 'GRP.05', 'MATERIALES TRANSPORTE', 'GRP.0502', 'IZAJE/MOVIMIENTO DE CARGAS'),
('911', 'VIDRIOS', 'GRP.08', 'MATERIALES VARIOS', 'GRP.0801', 'FERRETERIA'),
('912', 'COJIN.RODAMIENT./ACC', 'GRP.09', 'EQUIPOS DINAMICOS', 'GRP.0901', 'ACCESORIOS EQUIPOS DINAMICOS'),
('913', 'TORNILL/TUERCAS/BUL.', 'GRP.08', 'MATERIALES VARIOS', 'GRP.0801', 'FERRETERIA'),
('914', 'ACOPLAM.MECAN./ACC.', 'GRP.09', 'EQUIPOS DINAMICOS', 'GRP.0901', 'ACCESORIOS EQUIPOS DINAMICOS'),
('915', 'JUNTAS', 'GRP.10', 'EQUIPOS ESTATICOS', 'GRP.1001', 'SELLOS, JUNTAS Y EMPAQUETADURAS'),
('916', 'EMPAQUET/SELLO/RETEN', 'GRP.10', 'EQUIPOS ESTATICOS', 'GRP.1001', 'SELLOS, JUNTAS Y EMPAQUETADURAS'),
('1001', 'TANQUE METAL.PR.ATM.', 'GRP.10', 'EQUIPOS ESTATICOS', 'GRP.1002', 'TANQUES'),
('1004', 'SEPAR./TRAT.PRODUCC.', 'GRP.10', 'EQUIPOS ESTATICOS', 'GRP.1003', 'EQUIPOS DE PROCESO'),
('1005', 'CALENTAD.PETROL./GAS', 'GRP.10', 'EQUIPOS ESTATICOS', 'GRP.1004', 'EQUIPOS DE COMBUSTION / CALOR'),
('1006', 'RECIPIENTE A PRESION', 'GRP.10', 'EQUIPOS ESTATICOS', 'GRP.1002', 'TANQUES'),
('1007', 'TANQUE NO MET.P.ATM.', 'GRP.10', 'EQUIPOS ESTATICOS', 'GRP.1002', 'TANQUES'),
('1101', 'MOTOR EXPLOSION /REP', 'GRP.09', 'EQUIPOS DINAMICOS', 'GRP.0902', 'MOTORES Y TURBINAS'),
('1106', 'MOTOR HIDRAUL./NEUM.', 'GRP.09', 'EQUIPOS DINAMICOS', 'GRP.0902', 'MOTORES Y TURBINAS'),
('1107', 'CALDERA/CALEFACT/REP', 'GRP.10', 'EQUIPOS ESTATICOS', 'GRP.1004', 'EQUIPOS DE COMBUSTION / CALOR'),
('1108', 'FILTROS ROTATIVO/ACC', 'GRP.09', 'EQUIPOS DINAMICOS', 'GRP.0901', 'ACCESORIOS EQUIPOS DINAMICOS'),
('1109', 'SIST.REFRIG.VENTILAC', 'GRP.09', 'EQUIPOS DINAMICOS', 'GRP.0903', 'EQUIPOS DE ENFRIAMIENTO'),
('1111', 'VARIAD.VELOC/RED/MUL', 'GRP.09', 'EQUIPOS DINAMICOS', 'GRP.0901', 'ACCESORIOS EQUIPOS DINAMICOS'),
('1112', 'TORRE ENFRIAMIEN/REP', 'GRP.10', 'EQUIPOS ESTATICOS', 'GRP.0903', 'EQUIPOS DE ENFRIAMIENTO'),
('1114', 'COMPRES.ALTERNAT/REP', 'GRP.09', 'EQUIPOS DINAMICOS', 'GRP.0904', 'COMPRESORES'),
('1115', 'COMPRES.CENTRIF./REP', 'GRP.09', 'EQUIPOS DINAMICOS', 'GRP.0904', 'COMPRESORES'),
('1116', 'COMPRES.TORN/ENGRAN.', 'GRP.09', 'EQUIPOS DINAMICOS', 'GRP.0904', 'COMPRESORES'),
('1117', 'MAQ.ENVASADO /EMPAQ.', 'GRP.09', 'EQUIPOS DINAMICOS', 'GRP.0905', 'OTROS EQUIPOS DINAMICOS'),
('1118', 'TURBINA MOTOR VAPOR', 'GRP.09', 'EQUIPOS DINAMICOS', 'GRP.0902', 'MOTORES Y TURBINAS'),
('1119', 'TURBINA MOTOR A GAS', 'GRP.09', 'EQUIPOS DINAMICOS', 'GRP.0902', 'MOTORES Y TURBINAS'),
('1120', 'EQ.SOPLADOR /REPUEST', 'GRP.09', 'EQUIPOS DINAMICOS', 'GRP.0905', 'OTROS EQUIPOS DINAMICOS'),
('1121', 'EQ.SECADOR INDUSTR.', 'GRP.09', 'EQUIPOS DINAMICOS', 'GRP.0905', 'OTROS EQUIPOS DINAMICOS'),
('1122', 'UNID.MEZCLAD/DOSIFIC', 'GRP.09', 'EQUIPOS DINAMICOS', 'GRP.0905', 'OTROS EQUIPOS DINAMICOS'),
('1123', 'EQ.TURB.EXPANDER/REP', 'GRP.09', 'EQUIPOS DINAMICOS', 'GRP.0902', 'MOTORES Y TURBINAS'),
('1124', 'BOMBA ALTERNAT/REP.', 'GRP.09', 'EQUIPOS DINAMICOS', 'GRP.0906', 'BOMBAS'),
('1125', 'BOMBA CENTRIF./REP', 'GRP.09', 'EQUIPOS DINAMICOS', 'GRP.0906', 'BOMBAS'),
('1126', 'BOMBA TORNILLO /REP', 'GRP.09', 'EQUIPOS DINAMICOS', 'GRP.0906', 'BOMBAS'),
('1127', 'BOMBA INY./DOSIF/REP', 'GRP.09', 'EQUIPOS DINAMICOS', 'GRP.0906', 'BOMBAS'),
('1128', 'BOMBA ELECTROS./REP.', 'GRP.09', 'EQUIPOS DINAMICOS', 'GRP.0906', 'BOMBAS'),
('1129', 'BOMBA PCP /REPUEST.', 'GRP.09', 'EQUIPOS DINAMICOS', 'GRP.0906', 'BOMBAS'),
('1130', 'SELLOS MECANIC./REP.', 'GRP.09', 'EQUIPOS DINAMICOS', 'GRP.0901', 'ACCESORIOS EQUIPOS DINAMICOS'),
('1131', 'AEROENFRIAD./REP', 'GRP.09', 'EQUIPOS DINAMICOS', 'GRP.0903', 'EQUIPOS DE ENFRIAMIENTO'),
('1201', 'HERR.MANUALES/ ACC.', 'GRP.08', 'MATERIALES VARIOS', 'GRP.0801', 'FERRETERIA'),
('1202', 'HERR.MANO MOTORIZADA', 'GRP.08', 'MATERIALES VARIOS', 'GRP.0801', 'FERRETERIA'),
('1203', 'MAQ.HERRAMIENTA/ACC.', 'GRP.08', 'MATERIALES VARIOS', 'GRP.0801', 'FERRETERIA'),
('1204', 'INSTR.MANO /TALLER', 'GRP.08', 'MATERIALES VARIOS', 'GRP.0801', 'FERRETERIA'),
('1300', 'MAT.DE LIB. IVA 10,5', 'GRP.11', 'EQUIPOS E INSUMOS DE OFICINA', 'GRP.1101', 'INSUMOS OFICINA'),
('1301', 'LIBRERIA/PAPEL/ELEM.', 'GRP.11', 'EQUIPOS E INSUMOS DE OFICINA', 'GRP.1101', 'INSUMOS OFICINA'),
('1302', 'MUEBLES', 'GRP.11', 'EQUIPOS E INSUMOS DE OFICINA', 'GRP.1102', 'EQUIPAMIENTO OFICINA'),
('1303', 'EQ.MAQ.OFICINA /ACC.', 'GRP.11', 'EQUIPOS E INSUMOS DE OFICINA', 'GRP.1102', 'EQUIPAMIENTO OFICINA'),
('1401', 'VIDEO/AUDIO/VIGILANC', 'GRP.11', 'EQUIPOS E INSUMOS DE OFICINA', 'GRP.1102', 'EQUIPAMIENTO OFICINA'),
('1402', 'TELEFONIA/TELECOMUN.', 'GRP.11', 'EQUIPOS E INSUMOS DE OFICINA', 'GRP.1103', 'SOFTWARE Y HARDWARE'),
('1403', 'COMPUTACION EQ/INSUM', 'GRP.11', 'EQUIPOS E INSUMOS DE OFICINA', 'GRP.1103', 'SOFTWARE Y HARDWARE'),
('1404', 'SOFTWARE', 'GRP.11', 'EQUIPOS E INSUMOS DE OFICINA', 'GRP.1103', 'SOFTWARE Y HARDWARE'),
('1405', 'CABLE TELECOM/INFORM', 'GRP.11', 'EQUIPOS E INSUMOS DE OFICINA', 'GRP.1103', 'SOFTWARE Y HARDWARE'),
('1501', 'MAT.CONSTRUC./SANIT.', 'GRP.08', 'MATERIALES VARIOS', 'GRP.0801', 'FERRETERIA'),
('1502', 'PINTURAS /ACCESORIOS', 'GRP.06', 'PRODUCTOS QUÍMICOS/LABORATORIO', 'GRP.0601', 'PRODUCTOS QUÍMICOS'),
('1503', 'ART.ELEM.HOGAR/COCIN', 'GRP.11', 'EQUIPOS E INSUMOS DE OFICINA', 'GRP.1101', 'INSUMOS OFICINA'),
('1504', 'CASILLA/TRAILER/GALP', 'GRP.11', 'EQUIPOS E INSUMOS DE OFICINA', 'GRP.1102', 'EQUIPAMIENTO OFICINA'),
('1505', 'ESTRUCTURA / ANDAMIO', 'GRP.08', 'MATERIALES VARIOS', 'GRP.0802', 'PERFILES CHAPAS Y ESTRUCTURAS'),
('1507', 'BIENES INMUEBLES', 'GRP.12', 'MATERIALES FUERA DE NORMA', 'GRP.1201', 'FUERA DE NORMA'),
('1603', 'CONTENEDORES', 'GRP.05', 'MATERIALES TRANSPORTE', 'GRP.0502', 'IZAJE/MOVIMIENTO DE CARGAS'),
('1604', 'IDENTIF.ENVASE/EMBAL', 'GRP.08', 'MATERIALES VARIOS', 'GRP.0803', 'ENVASES'),
('1605', 'ENVASES DE PLASTICO', 'GRP.08', 'MATERIALES VARIOS', 'GRP.0803', 'ENVASES'),
('1606', 'ENVASES METALICOS', 'GRP.08', 'MATERIALES VARIOS', 'GRP.0803', 'ENVASES'),
('1607', 'OTROS ENVASES /EMBAL', 'GRP.08', 'MATERIALES VARIOS', 'GRP.0803', 'ENVASES'),
('1608', 'PALLETS / ACCESORIOS', 'GRP.05', 'MATERIALES TRANSPORTE', 'GRP.0502', 'IZAJE/MOVIMIENTO DE CARGAS'),
('1609', 'RECIPIENTE PRES./GLP', 'GRP.08', 'MATERIALES VARIOS', 'GRP.0804', 'GLP'),
('1610', 'BARRA CIERRE GLP', 'GRP.08', 'MATERIALES VARIOS', 'GRP.0804', 'GLP'),
('1611', 'REG.REDUCTOR GLP', 'GRP.08', 'MATERIALES VARIOS', 'GRP.0804', 'GLP'),
('1701', 'EE.SS.SURTIDOR /ACC.', 'GRP.13', 'MATERIAL COMERCIAL', 'GRP.1301', 'MATERIALES EESS / TIENDAS'),
('1702', 'EE.SS.EQUIPAMIENTO', 'GRP.13', 'MATERIAL COMERCIAL', 'GRP.1301', 'MATERIALES EESS / TIENDAS'),
('1703', 'EE.SS.TANQUE /ACCES.', 'GRP.13', 'MATERIAL COMERCIAL', 'GRP.1301', 'MATERIALES EESS / TIENDAS'),
('1705', 'EE.SS.EQ.LAVAD/ASPIR', 'GRP.13', 'MATERIAL COMERCIAL', 'GRP.1301', 'MATERIALES EESS / TIENDAS'),
('1707', 'EE.SS.EQ.AIRE/AGUA', 'GRP.13', 'MATERIAL COMERCIAL', 'GRP.1301', 'MATERIALES EESS / TIENDAS'),
('1801', 'EQ.PLANTAS ELABORAC.', 'GRP.10', 'EQUIPOS ESTATICOS', 'GRP.1003', 'EQUIPOS DE PROCESO'),
('1802', 'HORNO /ALAMBIQUE/REP', 'GRP.10', 'EQUIPOS ESTATICOS', 'GRP.1004', 'EQUIPOS DE COMBUSTION / CALOR'),
('1804', 'INTERCAMB.CALOR /REP', 'GRP.10', 'EQUIPOS ESTATICOS', 'GRP.1004', 'EQUIPOS DE COMBUSTION / CALOR'),
('1805', 'BRAZO CARGADOR /ACC.', 'GRP.10', 'EQUIPOS ESTATICOS', 'GRP.1003', 'EQUIPOS DE PROCESO'),
('1806', 'TORRE DESTILAC.ACC.', 'GRP.10', 'EQUIPOS ESTATICOS', 'GRP.1006', 'TORRES Y REACTORES'),
('1807', 'REACTOR / ACCESORIOS', 'GRP.10', 'EQUIPOS ESTATICOS', 'GRP.1006', 'TORRES Y REACTORES'),
('1808', 'EQ.EVAPORADORES/REP.', 'GRP.10', 'EQUIPOS ESTATICOS', 'GRP.1003', 'EQUIPOS DE PROCESO'),
('1809', 'EQ.DE VACIO / ACCES.', 'GRP.10', 'EQUIPOS ESTATICOS', 'GRP.1003', 'EQUIPOS DE PROCESO'),
('1810', 'FILTROS ESTATICOS', 'GRP.10', 'EQUIPOS ESTATICOS', 'GRP.1003', 'EQUIPOS DE PROCESO'),
('1811', 'EQ.TRATAMIENTO AGUAS', 'GRP.10', 'EQUIPOS ESTATICOS', 'GRP.1003', 'EQUIPOS DE PROCESO'),
('1812', 'ESFERA /CILINDRO/GAS', 'GRP.10', 'EQUIPOS ESTATICOS', 'GRP.1002', 'TANQUES'),
('1813', 'ANTORCHA/CHIM.QUEMA', 'GRP.10', 'EQUIPOS ESTATICOS', 'GRP.1004', 'EQUIPOS DE COMBUSTION / CALOR'),
('1814', 'BASCULA INDUSTR./REP', 'GRP.10', 'EQUIPOS ESTATICOS', 'GRP.1003', 'EQUIPOS DE PROCESO'),
('1815', 'EQ.TRATAMIENTO PETR.', 'GRP.10', 'EQUIPOS ESTATICOS', 'GRP.1003', 'EQUIPOS DE PROCESO'),
('1816', 'TRAMPA/PURGAS VAPOR', 'GRP.10', 'EQUIPOS ESTATICOS', 'GRP.1003', 'EQUIPOS DE PROCESO'),
('1817', 'EYECTORES / REP.', 'GRP.10', 'EQUIPOS ESTATICOS', 'GRP.1003', 'EQUIPOS DE PROCESO'),
('1901', 'EQ.SISMICA /GEOLOGIA', 'GRP.01', 'MATERIALES DE POZO', 'GRP.0107', 'MATERIAL Y EQUIPOS DE EXPLORACION'),
('1902', 'EXPLOSIVOS', 'GRP.01', 'MATERIALES DE POZO', 'GRP.0107', 'MATERIAL Y EQUIPOS DE EXPLORACION'),
('2001', 'MAT.PUBLICID./MARKET', 'GRP.13', 'MATERIAL COMERCIAL', 'GRP.1301', 'MATERIALES EESS / TIENDAS'),
('2101', 'MAT.REFRACTARIOS', 'GRP.08', 'MATERIALES VARIOS', 'GRP.0801', 'FERRETERIA'),
('2102', 'PLAST.MADERA/GOM/ETC', 'GRP.08', 'MATERIALES VARIOS', 'GRP.0801', 'FERRETERIA'),
('2108', 'MAT.AISLANTES', 'GRP.08', 'MATERIALES VARIOS', 'GRP.0801', 'FERRETERIA'),
('2203', 'CAPACITOR /BANCO CAP', 'GRP.02', 'MATERIALES ELECTRICOS', 'GRP.0203', 'TENDIDO ELECTRICO'),
('2301', 'VALV.ESFERICAS /REP.', 'GRP.04', 'MATERIAL DE CONDUCCION', 'GRP.0401', 'VALVULAS Y ACCESORIOS'),
('2302', 'VALV.MARIPOSA /REP.', 'GRP.04', 'MATERIAL DE CONDUCCION', 'GRP.0401', 'VALVULAS Y ACCESORIOS'),
('2303', 'VALV.REGUL./CONTRAPR', 'GRP.04', 'MATERIAL DE CONDUCCION', 'GRP.0401', 'VALVULAS Y ACCESORIOS'),
('2304', 'VALV.AGUJA/ BLOQUEO', 'GRP.04', 'MATERIAL DE CONDUCCION', 'GRP.0401', 'VALVULAS Y ACCESORIOS'),
('2305', 'VALV.RETENCION/REP.', 'GRP.04', 'MATERIAL DE CONDUCCION', 'GRP.0401', 'VALVULAS Y ACCESORIOS'),
('2306', 'VALV.GLOBO/REPUESTOS', 'GRP.04', 'MATERIAL DE CONDUCCION', 'GRP.0401', 'VALVULAS Y ACCESORIOS'),
('2307', 'VALV.SEGURIDAD /ALIV', 'GRP.04', 'MATERIAL DE CONDUCCION', 'GRP.0401', 'VALVULAS Y ACCESORIOS'),
('2308', 'VALV.TAPON/REPUESTOS', 'GRP.04', 'MATERIAL DE CONDUCCION', 'GRP.0401', 'VALVULAS Y ACCESORIOS'),
('2309', 'VALV.DIAFRAGMA /REP.', 'GRP.04', 'MATERIAL DE CONDUCCION', 'GRP.0401', 'VALVULAS Y ACCESORIOS'),
('2310', 'VALV.SOLENOIDE /REP.', 'GRP.04', 'MATERIAL DE CONDUCCION', 'GRP.0401', 'VALVULAS Y ACCESORIOS'),
('2311', 'VALV.ESCLUSA/REPUEST', 'GRP.04', 'MATERIAL DE CONDUCCION', 'GRP.0401', 'VALVULAS Y ACCESORIOS'),
('2312', 'VALV.PRESION Y VACIO', 'GRP.04', 'MATERIAL DE CONDUCCION', 'GRP.0401', 'VALVULAS Y ACCESORIOS'),
('2313', 'ACTUAD.NEUM/ELECTRIC', 'GRP.04', 'MATERIAL DE CONDUCCION', 'GRP.0401', 'VALVULAS Y ACCESORIOS'),
('2314', 'VALV.COMPON.NEUM.HID', 'GRP.04', 'MATERIAL DE CONDUCCION', 'GRP.0401', 'VALVULAS Y ACCESORIOS'),
('2401', 'ART.LIMPIEZ/HIG.PERS', 'GRP.11', 'EQUIPOS E INSUMOS DE OFICINA', 'GRP.1101', 'INSUMOS OFICINA'),
('2402', 'MAT.ECONOMAT/RECREAC', 'GRP.11', 'EQUIPOS E INSUMOS DE OFICINA', 'GRP.1101', 'INSUMOS OFICINA'),
('2403', 'ALIMENTOS/ BEBIDAS', 'GRP.13', 'MATERIAL COMERCIAL', 'GRP.1301', 'MATERIALES EESS / TIENDAS'),
('2404', 'FORRAJE/SEMILL/ABONO', 'GRP.08', 'MATERIALES VARIOS', 'GRP.0801', 'FERRETERIA'),
('2501', 'MANGUERAS /ACCESOR.', 'GRP.04', 'MATERIAL DE CONDUCCION', 'GRP.0404', 'MAGUERAS'),
('2601', 'CONTROL CORROSION', 'GRP.02', 'MATERIALES ELECTRICOS', 'GRP.0204', 'CONTROL CORROSION'),
('2702', 'PROD.DESECHABLES', 'GRP.13', 'MATERIAL COMERCIAL', 'GRP.1301', 'MATERIALES EESS / TIENDAS'),
('2703', 'PROD.CANJE / CAMBIO', 'GRP.13', 'MATERIAL COMERCIAL', 'GRP.1302', 'PRODUCTO COMERCIAL'),
('9000', 'PROD.GERENCIAL', 'GRP.13', 'MATERIAL COMERCIAL', 'GRP.1302', 'PRODUCTO COMERCIAL');

INSERT INTO Sintomas (Id,nombre)
VALUES
('1', 'Síntomas Genéricos'),
('2', 'Síntomas Instrumentales'),
('3', 'Síntomas Eléctricos'),
('4', 'Síntomas Mecánicos'),
('5', 'Síntomas Metalúrgicos'),
('6', 'Síntomas Edilicios'),
('7', 'Síntomas Sistemas'),
('8', 'Síntomas Comunicaciones'),
('9', 'Síntomas Vehículos');

INSERT INTO Guardia (guardia_id,nombre,descripcion,duracion_horas,guardia_activa)
VALUES
('1', 'Guardia A', 'Descripción Guardia A','12','true'),
('2', 'Guardia B', 'Descripción Guardia B','12','true'),
('3', 'Guardia C', 'Descripción Guardia C','12','true'),
('4', 'Guardia D', 'Descripción Guardia D','12','true');
-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------