-- Cajero: depósitos, retiros, pagos
INSERT INTO permission_by_role (id_rol, id_permission, createdBy, updatedBy)
VALUES 
(1, 1, 1, 1),
(1, 2, 1, 1),
(1, 3, 1, 1);

-- Gerente: aprobar transacciones + ver reportes
INSERT INTO permission_by_role (id_rol, id_permission, createdBy, updatedBy)
VALUES 
(2, 4, 1, 1),
(2, 5, 1, 1);

-- Auditor: ver reportes
INSERT INTO permission_by_role (id_rol, id_permission, createdBy, updatedBy)
VALUES 
(3, 5, 1, 1);

-- Administrador: todos los permisos
INSERT INTO permission_by_role (id_rol, id_permission, createdBy, updatedBy)
VALUES 
(4, 1, 1, 1),
(4, 2, 1, 1),
(4, 3, 1, 1),
(4, 4, 1, 1),
(4, 5, 1, 1),
(4, 6, 1, 1);