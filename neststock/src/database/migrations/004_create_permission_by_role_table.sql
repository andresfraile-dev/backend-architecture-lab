-- PERMISSION_BY_ROLE
-- Tabla intermedia que relaciona roles con permisos
-- =========================================================
CREATE TABLE permission_by_role (
    id_per_by_rol INT AUTO_INCREMENT PRIMARY KEY COMMENT 'PK. Identificador de la relación rol-permiso',
    id_rol INT NOT NULL COMMENT 'FK a roles.id_rol',
    id_permission INT NOT NULL COMMENT 'FK a permissions.id_permission',
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT 'Fecha de creación',
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Fecha de última modificación',
    deletedAt DATETIME DEFAULT NULL COMMENT 'Soft delete de la relación',
    createdBy INT DEFAULT NULL COMMENT 'FK a users.id_user que creó la relación',
    updatedBy INT DEFAULT NULL COMMENT 'FK a users.id_user que modificó la relación',
    CONSTRAINT fk_perByRol_rol FOREIGN KEY (id_rol) REFERENCES roles(id_rol),
    CONSTRAINT fk_perByRol_perm FOREIGN KEY (id_permission) REFERENCES permissions(id_permission),
    CONSTRAINT fk_perByRol_createdBy FOREIGN KEY (createdBy) REFERENCES users(id_user),
    CONSTRAINT fk_perByRol_updatedBy FOREIGN KEY (updatedBy) REFERENCES users(id_user),
    CONSTRAINT uq_perByRol UNIQUE (id_rol, id_permission)
) COMMENT='Relación de roles con permisos, evita duplicados, soporta soft delete y auditoría';

-- =========================================================