INSERT INTO Especialidad (especialidad_id, nombre, descripcion)
VALUES 
('1', 'Instrumentos', 'Especialidad Instrumentos'),
('2', 'Electricidad', 'Especialidad Electricidad'),
('3', 'Mec�nica', 'Especialidad Mec�nica'),
('4', 'Metalurgia', 'Especialidad Metalurgia');

INSERT INTO Funcion (funcion_id, nombre, descripcion, EspecialidadId)
VALUES 
('1', 'Oficial Instrumentos', 'Especialidad Instrumentos', '1'),
('2', 'Oficial Electricidad', 'Especialidad Electricidad', '2'),
('3', 'Oficial Mec�nica', 'Especialidad Mec�nica', '3'),
('4', 'Oficial Metalurgia', 'Especialidad Metalurgia', '4');

INSERT INTO OrganizacionEstructura (Id, nivel, nivel_nombre)
VALUES 
('1', '1', 'Empresa'),
('2', '2', 'Sitio'),
('3', '3', 'Planta'),
('4', '4', 'Area');

INSERT INTO OrganizacionUbicacion (Id, nombre, descripcion, OrganizacionEstructuraId, OrganizacionUbicacionId)
VALUES 
('1', 'Empresa Demo', 'Descripci�n Empresa Demo','1', NULL ),
('2', 'Sitio Demo', 'Descripci�n Sitio Demo','2', '1' ),
('3', 'Planta Demo', 'Descripci�n Planta Demo','3', '2' ),
('4', 'Area Demo 1', 'Descripci�n Area Demo 1','4', '3' ),
('5', 'Area Demo 2', 'Descripci�n Area Demo 2','5', '3' );