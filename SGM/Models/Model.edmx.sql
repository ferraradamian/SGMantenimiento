
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 10/02/2019 00:33:25
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
    ALTER TABLE [dbo].[FuncionSet] DROP CONSTRAINT [FK_EspecialidadFuncion];
GO
IF OBJECT_ID(N'[dbo].[FK_FuncionEmpleado]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Empleado] DROP CONSTRAINT [FK_FuncionEmpleado];
GO
IF OBJECT_ID(N'[dbo].[FK_OrganizacionEstructuraOrganizacionUbicacion]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[OrganizacionUbicacionSet] DROP CONSTRAINT [FK_OrganizacionEstructuraOrganizacionUbicacion];
GO
IF OBJECT_ID(N'[dbo].[FK_OrgUbicOrgUbic]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[OrganizacionUbicacionSet] DROP CONSTRAINT [FK_OrgUbicOrgUbic];
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
IF OBJECT_ID(N'[dbo].[EspecialidadSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[EspecialidadSet];
GO
IF OBJECT_ID(N'[dbo].[FuncionSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[FuncionSet];
GO
IF OBJECT_ID(N'[dbo].[OrganizacionEstructuraSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[OrganizacionEstructuraSet];
GO
IF OBJECT_ID(N'[dbo].[OrganizacionUbicacionSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[OrganizacionUbicacionSet];
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
    [empleado_id] int  NOT NULL,
    [empresa_id] int  NOT NULL,
    [nombre] nchar(20)  NOT NULL,
    [apellido] nchar(20)  NOT NULL,
    [telefono_fijo] nchar(10)  NULL,
    [funcion_Id] int  NOT NULL,
    [documento_tipo] tinyint  NULL,
    [documento_numero] smallint  NULL,
    [cuil] nvarchar(max)  NOT NULL,
    [grupo_sanguineo] tinyint  NULL,
    [factor_rh] tinyint  NULL,
    [email] nvarchar(max)  NULL,
    [tel_celular_1] smallint  NULL,
    [tel_celular_2] smallint  NULL,
    [tel_radio] smallint  NULL,
    [radio] smallint  NULL,
    [interno] smallint  NULL,
    [foto] varbinary(max)  NULL
);
GO

-- Creating table 'Empresa'
CREATE TABLE [dbo].[Empresa] (
    [empresa_id] int  NOT NULL,
    [nombre] nchar(20)  NOT NULL,
    [telefono] nchar(10)  NULL,
    [email] nchar(20)  NULL,
    [cuit] smallint  NULL
);
GO

-- Creating table 'Equipo'
CREATE TABLE [dbo].[Equipo] (
    [equipo_id] int  NOT NULL,
    [nombre] nchar(20)  NOT NULL,
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
    [guardia_id] int  NOT NULL,
    [nombre] nvarchar(max)  NOT NULL,
    [descripcion] nvarchar(max)  NULL,
    [duracion_horas] tinyint  NULL,
    [guardia_activa] bit  NOT NULL
);
GO

-- Creating table 'Tarea'
CREATE TABLE [dbo].[Tarea] (
    [tarea_id] int  NOT NULL,
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
    [recurso_id] int  NOT NULL,
    [nombre] nchar(50)  NOT NULL,
    [descripcion] nvarchar(max)  NULL,
    [GrupoId] smallint  NOT NULL
);
GO

-- Creating table 'RecursoTarea'
CREATE TABLE [dbo].[RecursoTarea] (
    [recurso_id] int  NOT NULL,
    [cantidadUsada] float  NOT NULL,
    [unidad] nvarchar(max)  NOT NULL,
    [Recurso_recurso_id] int  NOT NULL,
    [Tarea_tarea_id] int  NOT NULL
);
GO

-- Creating table 'EspecialidadSet'
CREATE TABLE [dbo].[EspecialidadSet] (
    [especialidad_id] tinyint IDENTITY(1,1) NOT NULL,
    [nombre] nvarchar(max)  NOT NULL,
    [descripcion] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'FuncionSet'
CREATE TABLE [dbo].[FuncionSet] (
    [funcion_id] int  NOT NULL,
    [nombre] nvarchar(max)  NOT NULL,
    [descripcion] nvarchar(max)  NULL,
    [EspecialidadId] tinyint  NOT NULL
);
GO

-- Creating table 'OrganizacionEstructuraSet'
CREATE TABLE [dbo].[OrganizacionEstructuraSet] (
    [Id] tinyint IDENTITY(1,1) NOT NULL,
    [nivel] tinyint  NOT NULL,
    [nivel_nombre] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'OrganizacionUbicacionSet'
CREATE TABLE [dbo].[OrganizacionUbicacionSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [nombre] nvarchar(max)  NOT NULL,
    [descripcion] nvarchar(max)  NULL,
    [OrganizacionEstructuraId] tinyint  NOT NULL,
    [OrganizacionUbicacionId] int  NOT NULL
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
    [Id] smallint IDENTITY(1,1) NOT NULL,
    [nombre] nvarchar(max)  NOT NULL
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

-- Creating primary key on [especialidad_id] in table 'EspecialidadSet'
ALTER TABLE [dbo].[EspecialidadSet]
ADD CONSTRAINT [PK_EspecialidadSet]
    PRIMARY KEY CLUSTERED ([especialidad_id] ASC);
GO

-- Creating primary key on [funcion_id] in table 'FuncionSet'
ALTER TABLE [dbo].[FuncionSet]
ADD CONSTRAINT [PK_FuncionSet]
    PRIMARY KEY CLUSTERED ([funcion_id] ASC);
GO

-- Creating primary key on [Id] in table 'OrganizacionEstructuraSet'
ALTER TABLE [dbo].[OrganizacionEstructuraSet]
ADD CONSTRAINT [PK_OrganizacionEstructuraSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'OrganizacionUbicacionSet'
ALTER TABLE [dbo].[OrganizacionUbicacionSet]
ADD CONSTRAINT [PK_OrganizacionUbicacionSet]
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

-- Creating foreign key on [EspecialidadId] in table 'FuncionSet'
ALTER TABLE [dbo].[FuncionSet]
ADD CONSTRAINT [FK_EspecialidadFuncion]
    FOREIGN KEY ([EspecialidadId])
    REFERENCES [dbo].[EspecialidadSet]
        ([especialidad_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_EspecialidadFuncion'
CREATE INDEX [IX_FK_EspecialidadFuncion]
ON [dbo].[FuncionSet]
    ([EspecialidadId]);
GO

-- Creating foreign key on [funcion_Id] in table 'Empleado'
ALTER TABLE [dbo].[Empleado]
ADD CONSTRAINT [FK_FuncionEmpleado]
    FOREIGN KEY ([funcion_Id])
    REFERENCES [dbo].[FuncionSet]
        ([funcion_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_FuncionEmpleado'
CREATE INDEX [IX_FK_FuncionEmpleado]
ON [dbo].[Empleado]
    ([funcion_Id]);
GO

-- Creating foreign key on [OrganizacionEstructuraId] in table 'OrganizacionUbicacionSet'
ALTER TABLE [dbo].[OrganizacionUbicacionSet]
ADD CONSTRAINT [FK_OrganizacionEstructuraOrganizacionUbicacion]
    FOREIGN KEY ([OrganizacionEstructuraId])
    REFERENCES [dbo].[OrganizacionEstructuraSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_OrganizacionEstructuraOrganizacionUbicacion'
CREATE INDEX [IX_FK_OrganizacionEstructuraOrganizacionUbicacion]
ON [dbo].[OrganizacionUbicacionSet]
    ([OrganizacionEstructuraId]);
GO

-- Creating foreign key on [OrganizacionUbicacionId] in table 'OrganizacionUbicacionSet'
ALTER TABLE [dbo].[OrganizacionUbicacionSet]
ADD CONSTRAINT [FK_OrgUbicOrgUbic]
    FOREIGN KEY ([OrganizacionUbicacionId])
    REFERENCES [dbo].[OrganizacionUbicacionSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_OrgUbicOrgUbic'
CREATE INDEX [IX_FK_OrgUbicOrgUbic]
ON [dbo].[OrganizacionUbicacionSet]
    ([OrganizacionUbicacionId]);
GO

-- Creating foreign key on [OrganizacionUbicacionId] in table 'Equipo'
ALTER TABLE [dbo].[Equipo]
ADD CONSTRAINT [FK_OrganizacionUbicacionEquipo]
    FOREIGN KEY ([OrganizacionUbicacionId])
    REFERENCES [dbo].[OrganizacionUbicacionSet]
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
    REFERENCES [dbo].[OrganizacionUbicacionSet]
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

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------