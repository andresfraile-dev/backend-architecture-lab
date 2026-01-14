-- ROLES
-- Tabla de roles del sistema
-- =========================================================
CREATE TABLE roles (
    id_rol INT AUTO_INCREMENT PRIMARY KEY COMMENT 'PK. Identificador único del rol',
    name VARCHAR(100) NOT NULL UNIQUE COMMENT 'Nombre único del rol (visual, modificable)',
    description VARCHAR(255) COMMENT 'Descripción del rol',
    status ENUM('activo','inactivo') DEFAULT 'activo' COMMENT 'Estado operativo del rol',
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT 'Fecha de creación',
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Fecha de última modificación',
    deletedAt DATETIME DEFAULT NULL COMMENT 'Fecha de borrado lógico',
    createdBy INT DEFAULT NULL COMMENT 'FK a users.id_user que creó el registro',
    updatedBy INT DEFAULT NULL COMMENT 'FK a users.id_user que modificó el registro',
    CONSTRAINT fk_roles_createdBy FOREIGN KEY (createdBy) REFERENCES users(id_user),
    CONSTRAINT fk_roles_updatedBy FOREIGN KEY (updatedBy) REFERENCES users(id_user)
) COMMENT='Roles de usuario, con auditoría y soft delete';

-- =========================================================