# 🛒 Gestión y Compra de Productos (JSP + Servlets + MySQL)

Este proyecto es una aplicación web simple de gestión y compra de productos desarrollada con **Java EE (JSP y Servlets)** y **MySQL** como base de datos. Permite realizar operaciones **CRUD** (crear, leer, actualizar, eliminar) sobre productos, así como una simulación de compra interactiva.

---

## 🚀 Características

- 📋 Listado de productos desde base de datos.
- ➕ Agregar nuevos productos.
- ✏️ Editar productos existentes.
- ❌ Eliminar productos.
- 🛍️ Interfaz de compra con selección de cantidad.
- 💰 Cálculo automático del total a pagar.
- ✅ Confirmación de compra mediante ventana emergente.

---

## ⚙️ Tecnologías utilizadas

- **Java EE** (Servlets y JSP)
- **MySQL** como motor de base de datos
- **JDBC** para la conexión entre Java y MySQL
- **Bootstrap 5** para estilos responsivos y modernos
- **HTML5**, **CSS3** y **JavaScript** para interactividad

---

## 📦 Estructura del proyecto

📁 proyecto/
├── 📁 src/
│ └── ProductoServlet.java
├── 📁 WebContent/
│ ├── index.jsp (CRUD principal)
│ ├── editarProducto.jsp
│ └── comprarProducto.jsp
├── 📄 web.xml
└── README.md


---

## 🗄️ Estructura de la base de datos

**Base de datos:** `usuariosdb`  
**Tabla:** `productos`

```sql
CREATE TABLE productos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    precio DECIMAL(10,2) NOT NULL
);
