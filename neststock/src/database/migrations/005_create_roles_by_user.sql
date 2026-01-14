-- ROLES_BY_USER
-- Tabla intermedia que asigna roles a usuarios
-- =========================================================
CREATE TABLE roles_by_user (
    id_rol_by_user INT AUTO_INCREMENT PRIMARY KEY COMMENT 'PK. Identificador de la relación usuario-rol',
    id_user INT NOT NULL COMMENT 'FK a users.id_user',
    id_rol INT NOT NULL COMMENT 'FK a roles.id_rol',
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT 'Fecha de asignación',
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Fecha de última modificación',
    deletedAt DATETIME DEFAULT NULL COMMENT 'Soft delete de la asignación',
    createdBy INT DEFAULT NULL COMMENT 'FK a users.id_user que asignó el rol',
    updatedBy INT DEFAULT NULL COMMENT 'FK a users.id_user que modificó la asignación',
    CONSTRAINT fk_rolesByUser_user FOREIGN KEY (id_user) REFERENCES users(id_user),
    CONSTRAINT fk_rolesByUser_rol FOREIGN KEY (id_rol) REFERENCES roles(id_rol),
    CONSTRAINT fk_rolesByUser_createdBy FOREIGN KEY (createdBy) REFERENCES users(id_user),
    CONSTRAINT fk_rolesByUser_updatedBy FOREIGN KEY (updatedBy) REFERENCES users(id_user),
    CONSTRAINT uq_rolesByUser UNIQUE (id_user, id_rol)
) COMMENT='Relación de usuarios con roles, evita duplicados, soporta soft delete y auditoría';
-- =========================================================