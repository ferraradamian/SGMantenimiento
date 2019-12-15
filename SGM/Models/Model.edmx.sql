
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 12/14/2019 21:06:57
-- Generated from EDMX file: C:\Users\ferra\source\repos\SGMantenimiento\SGM\Models\Model.edmx
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

IF OBJECT_ID(N'[dbo].[FK_Detalle_Tarea_Tarea]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Detalle_Tarea] DROP CONSTRAINT [FK_Detalle_Tarea_Tarea];
GO
IF OBJECT_ID(N'[BDSGMModelStoreContainer].[FK_Empleado_DetalleTarea_Detalle_Tarea]', 'F') IS NOT NULL
    ALTER TABLE [BDSGMModelStoreContainer].[Empleado_DetalleTarea] DROP CONSTRAINT [FK_Empleado_DetalleTarea_Detalle_Tarea];
GO
IF OBJECT_ID(N'[BDSGMModelStoreContainer].[FK_Empleado_DetalleTarea_Empleado]', 'F') IS NOT NULL
    ALTER TABLE [BDSGMModelStoreContainer].[Empleado_DetalleTarea] DROP CONSTRAINT [FK_Empleado_DetalleTarea_Empleado];
GO
IF OBJECT_ID(N'[dbo].[FK_Empleado_Empresa]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Empleado] DROP CONSTRAINT [FK_Empleado_Empresa];
GO
IF OBJECT_ID(N'[dbo].[FK_Equipo_Tarea_Equipo]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[EquipoTarea] DROP CONSTRAINT [FK_Equipo_Tarea_Equipo];
GO
IF OBJECT_ID(N'[dbo].[FK_Equipo_Tarea_Tarea]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[EquipoTarea] DROP CONSTRAINT [FK_Equipo_Tarea_Tarea];
GO
IF OBJECT_ID(N'[dbo].[FK_Guardia_Empeado_Empleado]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Guardia_Empeado] DROP CONSTRAINT [FK_Guardia_Empeado_Empleado];
GO
IF OBJECT_ID(N'[dbo].[FK_Guardia_Empeado_Guardia]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Guardia_Empeado] DROP CONSTRAINT [FK_Guardia_Empeado_Guardia];
GO
IF OBJECT_ID(N'[BDSGMModelStoreContainer].[FK_Recurso_DetalleTarea_Detalle_Tarea]', 'F') IS NOT NULL
    ALTER TABLE [BDSGMModelStoreContainer].[Recurso_DetalleTarea] DROP CONSTRAINT [FK_Recurso_DetalleTarea_Detalle_Tarea];
GO
IF OBJECT_ID(N'[BDSGMModelStoreContainer].[FK_Recurso_DetalleTarea_Recurso]', 'F') IS NOT NULL
    ALTER TABLE [BDSGMModelStoreContainer].[Recurso_DetalleTarea] DROP CONSTRAINT [FK_Recurso_DetalleTarea_Recurso];
GO
IF OBJECT_ID(N'[dbo].[FK_Tarea_Guardia]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Tarea] DROP CONSTRAINT [FK_Tarea_Guardia];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Detalle_Tarea]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Detalle_Tarea];
GO
IF OBJECT_ID(N'[dbo].[Empleado]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Empleado];
GO
IF OBJECT_ID(N'[dbo].[Empresa]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Empresa];
GO
IF OBJECT_ID(N'[dbo].[Equipo]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Equipo];
GO
IF OBJECT_ID(N'[dbo].[EquipoTarea]', 'U') IS NOT NULL
    DROP TABLE [dbo].[EquipoTarea];
GO
IF OBJECT_ID(N'[dbo].[Guardia]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Guardia];
GO
IF OBJECT_ID(N'[dbo].[Guardia_Empeado]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Guardia_Empeado];
GO
IF OBJECT_ID(N'[dbo].[Recurso]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Recurso];
GO
IF OBJECT_ID(N'[dbo].[Tarea]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Tarea];
GO
IF OBJECT_ID(N'[BDSGMModelStoreContainer].[Empleado_DetalleTarea]', 'U') IS NOT NULL
    DROP TABLE [BDSGMModelStoreContainer].[Empleado_DetalleTarea];
GO
IF OBJECT_ID(N'[BDSGMModelStoreContainer].[Recurso_DetalleTarea]', 'U') IS NOT NULL
    DROP TABLE [BDSGMModelStoreContainer].[Recurso_DetalleTarea];
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
    [telefono] nchar(10)  NULL,
    [funcion] nchar(20)  NULL
);
GO

-- Creating table 'Empresa'
CREATE TABLE [dbo].[Empresa] (
    [empresa_id] int  NOT NULL,
    [nombre] nchar(20)  NOT NULL,
    [telefono] nchar(10)  NULL,
    [email] nchar(20)  NULL
);
GO

-- Creating table 'Equipo'
CREATE TABLE [dbo].[Equipo] (
    [equipo_id] int  NOT NULL,
    [nombre] nchar(20)  NOT NULL,
    [estadoActual] nchar(10)  NOT NULL,
    [marca] nchar(15)  NOT NULL,
    [modelo] nchar(15)  NOT NULL,
    [numeroSerie] nchar(20)  NULL,
    [inicioOperacion] datetime  NOT NULL,
    [finOperacion] datetime  NULL,
    [esCritico] bit  NOT NULL
);
GO

-- Creating table 'Guardia'
CREATE TABLE [dbo].[Guardia] (
    [guardia_id] int  NOT NULL,
    [coodinador_id] int  NULL,
    [fecha] datetime  NOT NULL,
    [horaInicio] time  NOT NULL,
    [horaFin] time  NOT NULL
);
GO

-- Creating table 'Tarea'
CREATE TABLE [dbo].[Tarea] (
    [tarea_id] int  NOT NULL,
    [guardia_id] int  NOT NULL,
    [estado] nchar(10)  NULL,
    [costo] float  NOT NULL,
    [descripcion] nchar(250)  NOT NULL,
    [ubucacion] nchar(50)  NULL,
    [nombre] nchar(50)  NULL,
    [fecha] nchar(10)  NULL
);
GO

-- Creating table 'Detalle_Tarea'
CREATE TABLE [dbo].[Detalle_Tarea] (
    [detalleTarea_id] int  NOT NULL,
    [tarea_id] int  NOT NULL,
    [nombre] nchar(20)  NOT NULL,
    [descripcion] nchar(250)  NULL,
    [cantidad] float  NULL
);
GO

-- Creating table 'Recurso'
CREATE TABLE [dbo].[Recurso] (
    [recurso_id] int  NOT NULL,
    [cantidadStock] float  NOT NULL,
    [nombre] nchar(50)  NOT NULL,
    [marca] nchar(20)  NOT NULL
);
GO

-- Creating table 'Recurso_DetalleTarea'
CREATE TABLE [dbo].[Recurso_DetalleTarea] (
    [detalleTarea_id] int  NOT NULL,
    [recurso_id] int  NOT NULL,
    [cantidadUsada] float  NOT NULL
);
GO

-- Creating table 'Guardia_Empeado'
CREATE TABLE [dbo].[Guardia_Empeado] (
    [Empleado_empleado_id] int  NOT NULL,
    [Guardia_guardia_id] int  NOT NULL
);
GO

-- Creating table 'Empleado_DetalleTarea'
CREATE TABLE [dbo].[Empleado_DetalleTarea] (
    [Detalle_Tarea_detalleTarea_id] int  NOT NULL,
    [Empleado_empleado_id] int  NOT NULL
);
GO

-- Creating table 'EquipoTarea'
CREATE TABLE [dbo].[EquipoTarea] (
    [Equipo_equipo_id] int  NOT NULL,
    [Tarea_tarea_id] int  NOT NULL
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

-- Creating primary key on [detalleTarea_id] in table 'Detalle_Tarea'
ALTER TABLE [dbo].[Detalle_Tarea]
ADD CONSTRAINT [PK_Detalle_Tarea]
    PRIMARY KEY CLUSTERED ([detalleTarea_id] ASC);
GO

-- Creating primary key on [recurso_id] in table 'Recurso'
ALTER TABLE [dbo].[Recurso]
ADD CONSTRAINT [PK_Recurso]
    PRIMARY KEY CLUSTERED ([recurso_id] ASC);
GO

-- Creating primary key on [detalleTarea_id], [recurso_id], [cantidadUsada] in table 'Recurso_DetalleTarea'
ALTER TABLE [dbo].[Recurso_DetalleTarea]
ADD CONSTRAINT [PK_Recurso_DetalleTarea]
    PRIMARY KEY CLUSTERED ([detalleTarea_id], [recurso_id], [cantidadUsada] ASC);
GO

-- Creating primary key on [Empleado_empleado_id], [Guardia_guardia_id] in table 'Guardia_Empeado'
ALTER TABLE [dbo].[Guardia_Empeado]
ADD CONSTRAINT [PK_Guardia_Empeado]
    PRIMARY KEY CLUSTERED ([Empleado_empleado_id], [Guardia_guardia_id] ASC);
GO

-- Creating primary key on [Detalle_Tarea_detalleTarea_id], [Empleado_empleado_id] in table 'Empleado_DetalleTarea'
ALTER TABLE [dbo].[Empleado_DetalleTarea]
ADD CONSTRAINT [PK_Empleado_DetalleTarea]
    PRIMARY KEY CLUSTERED ([Detalle_Tarea_detalleTarea_id], [Empleado_empleado_id] ASC);
GO

-- Creating primary key on [Equipo_equipo_id], [Tarea_tarea_id] in table 'EquipoTarea'
ALTER TABLE [dbo].[EquipoTarea]
ADD CONSTRAINT [PK_EquipoTarea]
    PRIMARY KEY CLUSTERED ([Equipo_equipo_id], [Tarea_tarea_id] ASC);
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

-- Creating foreign key on [guardia_id] in table 'Tarea'
ALTER TABLE [dbo].[Tarea]
ADD CONSTRAINT [FK_Tarea_Guardia]
    FOREIGN KEY ([guardia_id])
    REFERENCES [dbo].[Guardia]
        ([guardia_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Tarea_Guardia'
CREATE INDEX [IX_FK_Tarea_Guardia]
ON [dbo].[Tarea]
    ([guardia_id]);
GO

-- Creating foreign key on [Empleado_empleado_id] in table 'Guardia_Empeado'
ALTER TABLE [dbo].[Guardia_Empeado]
ADD CONSTRAINT [FK_Guardia_Empeado_Empleado]
    FOREIGN KEY ([Empleado_empleado_id])
    REFERENCES [dbo].[Empleado]
        ([empleado_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Guardia_guardia_id] in table 'Guardia_Empeado'
ALTER TABLE [dbo].[Guardia_Empeado]
ADD CONSTRAINT [FK_Guardia_Empeado_Guardia]
    FOREIGN KEY ([Guardia_guardia_id])
    REFERENCES [dbo].[Guardia]
        ([guardia_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Guardia_Empeado_Guardia'
CREATE INDEX [IX_FK_Guardia_Empeado_Guardia]
ON [dbo].[Guardia_Empeado]
    ([Guardia_guardia_id]);
GO

-- Creating foreign key on [tarea_id] in table 'Detalle_Tarea'
ALTER TABLE [dbo].[Detalle_Tarea]
ADD CONSTRAINT [FK_Detalle_Tarea_Tarea]
    FOREIGN KEY ([tarea_id])
    REFERENCES [dbo].[Tarea]
        ([tarea_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Detalle_Tarea_Tarea'
CREATE INDEX [IX_FK_Detalle_Tarea_Tarea]
ON [dbo].[Detalle_Tarea]
    ([tarea_id]);
GO

-- Creating foreign key on [detalleTarea_id] in table 'Recurso_DetalleTarea'
ALTER TABLE [dbo].[Recurso_DetalleTarea]
ADD CONSTRAINT [FK_Recurso_DetalleTarea_Detalle_Tarea]
    FOREIGN KEY ([detalleTarea_id])
    REFERENCES [dbo].[Detalle_Tarea]
        ([detalleTarea_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [recurso_id] in table 'Recurso_DetalleTarea'
ALTER TABLE [dbo].[Recurso_DetalleTarea]
ADD CONSTRAINT [FK_Recurso_DetalleTarea_Recurso]
    FOREIGN KEY ([recurso_id])
    REFERENCES [dbo].[Recurso]
        ([recurso_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Recurso_DetalleTarea_Recurso'
CREATE INDEX [IX_FK_Recurso_DetalleTarea_Recurso]
ON [dbo].[Recurso_DetalleTarea]
    ([recurso_id]);
GO

-- Creating foreign key on [Detalle_Tarea_detalleTarea_id] in table 'Empleado_DetalleTarea'
ALTER TABLE [dbo].[Empleado_DetalleTarea]
ADD CONSTRAINT [FK_Empleado_DetalleTarea_Detalle_Tarea]
    FOREIGN KEY ([Detalle_Tarea_detalleTarea_id])
    REFERENCES [dbo].[Detalle_Tarea]
        ([detalleTarea_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Empleado_empleado_id] in table 'Empleado_DetalleTarea'
ALTER TABLE [dbo].[Empleado_DetalleTarea]
ADD CONSTRAINT [FK_Empleado_DetalleTarea_Empleado]
    FOREIGN KEY ([Empleado_empleado_id])
    REFERENCES [dbo].[Empleado]
        ([empleado_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Empleado_DetalleTarea_Empleado'
CREATE INDEX [IX_FK_Empleado_DetalleTarea_Empleado]
ON [dbo].[Empleado_DetalleTarea]
    ([Empleado_empleado_id]);
GO

-- Creating foreign key on [Equipo_equipo_id] in table 'EquipoTarea'
ALTER TABLE [dbo].[EquipoTarea]
ADD CONSTRAINT [FK_EquipoTarea_Equipo]
    FOREIGN KEY ([Equipo_equipo_id])
    REFERENCES [dbo].[Equipo]
        ([equipo_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Tarea_tarea_id] in table 'EquipoTarea'
ALTER TABLE [dbo].[EquipoTarea]
ADD CONSTRAINT [FK_EquipoTarea_Tarea]
    FOREIGN KEY ([Tarea_tarea_id])
    REFERENCES [dbo].[Tarea]
        ([tarea_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_EquipoTarea_Tarea'
CREATE INDEX [IX_FK_EquipoTarea_Tarea]
ON [dbo].[EquipoTarea]
    ([Tarea_tarea_id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------