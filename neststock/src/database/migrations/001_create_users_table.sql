-- USERS
-- Tabla de usuarios del sistema
-- =========================================================
CREATE TABLE users (
    id_user INT AUTO_INCREMENT PRIMARY KEY COMMENT 'PK. Identificador único de usuario',
    name VARCHAR(100) NOT NULL COMMENT 'Nombre del usuario',
    last_name VARCHAR(100) NOT NULL COMMENT 'Apellido del usuario',
    email VARCHAR(150) NOT NULL UNIQUE COMMENT 'Correo electrónico único, usado como login',
    password VARCHAR(255) NOT NULL COMMENT 'Contraseña en hash',
    status ENUM('activo','inactivo','bloqueado') DEFAULT 'activo' COMMENT 'Estado operativo del usuario',
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT 'Fecha de creación',
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Fecha de última modificación',
    deletedAt DATETIME DEFAULT NULL COMMENT 'Fecha de borrado lógico',
    createdBy INT DEFAULT NULL COMMENT 'FK a users.id_user que creó el registro',
    updatedBy INT DEFAULT NULL COMMENT 'FK a users.id_user que modificó el registro',
    CONSTRAINT fk_users_createdBy FOREIGN KEY (createdBy) REFERENCES users(id_user),
    CONSTRAINT fk_users_updatedBy FOREIGN KEY (updatedBy) REFERENCES users(id_user)
) COMMENT='Usuarios del sistema, con auditoría y soft delete';