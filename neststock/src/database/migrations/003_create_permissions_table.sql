-- PERMISSIONS
-- Tabla de permisos del sistema
-- =========================================================
CREATE TABLE permissions (
    id_permission INT AUTO_INCREMENT PRIMARY KEY COMMENT 'PK. Identificador único del permiso',
    name VARCHAR(100) NOT NULL UNIQUE COMMENT 'Nombre técnico del permiso (ej. USER_CREATE)',
    description VARCHAR(255) COMMENT 'Descripción visual del permiso',
    status ENUM('activo','inactivo') DEFAULT 'activo' COMMENT 'Estado operativo del permiso',
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT 'Fecha de creación',
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Fecha de última modificación',
    deletedAt DATETIME DEFAULT NULL COMMENT 'Fecha de borrado lógico',
    createdBy INT DEFAULT NULL COMMENT 'FK a users.id_user que creó el registro',
    updatedBy INT DEFAULT NULL COMMENT 'FK a users.id_user que modificó el registro',
    CONSTRAINT fk_permissions_createdBy FOREIGN KEY (createdBy) REFERENCES users(id_user),
    CONSTRAINT fk_permissions_updatedBy FOREIGN KEY (updatedBy) REFERENCES users(id_user)
) COMMENT='Permisos del sistema, con auditoría y soft delete';

-- =========================================================