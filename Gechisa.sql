USE [dbo.Gechisa]
GO
/****** Object:  Table [dbo].[Accidentes]    Script Date: 19/12/2023 09:56:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accidentes](
	[IdAccidente] [int] NOT NULL,
	[fechaAccidente] [date] NOT NULL,
	[descripcion] [varchar](40) NOT NULL,
	[choferInvolucrado] [varchar](40) NOT NULL,
	[IdAutobus] [int] NULL,
	[IdTipoAccidente] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdAccidente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Autobus]    Script Date: 19/12/2023 09:56:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Autobus](
	[IdAutobus] [int] IDENTITY(1,1) NOT NULL,
	[IdChofer] [int] NOT NULL,
	[numeroIdentificacion] [varchar](20) NOT NULL,
	[IdTipoModelo] [int] NOT NULL,
	[IdTipoMarca] [int] NOT NULL,
	[capacidad] [int] NOT NULL,
	[combustible] [varchar](20) NOT NULL,
	[añoFabricacion] [int] NOT NULL,
	[placa] [varchar](10) NOT NULL,
	[IdTipoAccidente] [int] NULL,
 CONSTRAINT [PK__Autobus__DFD744761F31A01D] PRIMARY KEY CLUSTERED 
(
	[IdAutobus] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Boletos]    Script Date: 19/12/2023 09:56:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Boletos](
	[IdBoleto] [int] IDENTITY(1,1) NOT NULL,
	[numeroBoleta] [varchar](100) NULL,
	[metodoPago] [varchar](100) NULL,
	[tipoPago] [varchar](100) NULL,
	[origen] [varchar](100) NULL,
	[destino] [varchar](100) NULL,
	[asiento] [int] NULL,
	[horaSalida] [varchar](100) NULL,
	[fechaRegistro] [varchar](100) NULL,
	[vendedor] [varchar](100) NULL,
	[cliente] [varchar](100) NULL,
	[dni] [varchar](100) NULL,
	[placa] [varchar](100) NULL,
	[IdChofer] [int] NULL,
	[IdAutobus] [int] NULL,
	[IdCliente] [int] NULL,
	[IdUsuario] [int] NULL,
 CONSTRAINT [PK_Boletos] PRIMARY KEY CLUSTERED 
(
	[IdBoleto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Chofer]    Script Date: 19/12/2023 09:56:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Chofer](
	[IdChofer] [int] IDENTITY(1,1) NOT NULL,
	[nombreChofer] [varchar](40) NOT NULL,
	[edad] [int] NOT NULL,
	[direccion] [varchar](100) NOT NULL,
	[telefono] [varchar](15) NOT NULL,
	[licenciaConducir] [varchar](20) NOT NULL,
	[fechaContratacion] [date] NOT NULL,
 CONSTRAINT [PK__Chofer__2DF292AD888922F7] PRIMARY KEY CLUSTERED 
(
	[IdChofer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 19/12/2023 09:56:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[IdCliente] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](30) NOT NULL,
	[apellido] [varchar](30) NOT NULL,
	[dni] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empleado]    Script Date: 19/12/2023 09:56:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleado](
	[IdEmpleado] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](30) NOT NULL,
	[apellido] [varchar](30) NOT NULL,
	[dni] [varchar](20) NOT NULL,
	[direccion] [varchar](40) NOT NULL,
	[estadoCivil] [varchar](20) NOT NULL,
	[nivelEduca] [varchar](20) NOT NULL,
	[telefono] [varchar](9) NOT NULL,
	[email] [varchar](30) NOT NULL,
	[fechaIngreso] [date] NOT NULL,
	[IdUsuario] [int] NULL,
	[idSalario] [int] NULL,
	[IdReporte] [int] NULL,
 CONSTRAINT [PK__Empleado__CE6D8B9E6C049937] PRIMARY KEY CLUSTERED 
(
	[IdEmpleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pasajes]    Script Date: 19/12/2023 09:56:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pasajes](
	[IdPasaje] [int] IDENTITY(1,1) NOT NULL,
	[IdBoleto] [int] NULL,
	[IdRuta] [int] NULL,
	[IdChofer] [int] NULL,
	[IdCliente] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdPasaje] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Permisos]    Script Date: 19/12/2023 09:56:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permisos](
	[IdPermiso] [int] IDENTITY(1,1) NOT NULL,
	[IdUsuario] [int] NULL,
	[operacion] [varchar](40) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdPermiso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReportesVentas]    Script Date: 19/12/2023 09:56:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReportesVentas](
	[IdReporte] [int] NOT NULL,
	[fechaVenta] [date] NOT NULL,
	[tipoOperacion] [varchar](255) NOT NULL,
	[monto] [float] NOT NULL,
	[producto] [varchar](255) NOT NULL,
	[precio] [float] NOT NULL,
	[importe] [float] NOT NULL,
	[idBoletos] [int] NULL,
 CONSTRAINT [PK__Reportes__F9561136F41FE7F5] PRIMARY KEY CLUSTERED 
(
	[IdReporte] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rutas]    Script Date: 19/12/2023 09:56:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rutas](
	[IdRuta] [int] IDENTITY(1,1) NOT NULL,
	[origen] [varchar](40) NOT NULL,
	[horarios] [date] NOT NULL,
	[tarifas] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdRuta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoMarca]    Script Date: 19/12/2023 09:56:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoMarca](
	[IdTipoMarca] [int] IDENTITY(1,1) NOT NULL,
	[marcas] [varchar](20) NOT NULL,
 CONSTRAINT [PK__TipoMarc__84A43D24ABFAE37E] PRIMARY KEY CLUSTERED 
(
	[IdTipoMarca] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoModelo]    Script Date: 19/12/2023 09:56:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoModelo](
	[IdTipoModelo] [int] IDENTITY(1,1) NOT NULL,
	[modelo] [varchar](20) NOT NULL,
 CONSTRAINT [PK__TipoMode__6CD0E25D51D4B998] PRIMARY KEY CLUSTERED 
(
	[IdTipoModelo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TiposAccidentes]    Script Date: 19/12/2023 09:56:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TiposAccidentes](
	[IdTipoAccidente] [int] IDENTITY(1,1) NOT NULL,
	[tipos] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdTipoAccidente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 19/12/2023 09:56:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[IdUsuario] [int] IDENTITY(1,1) NOT NULL,
	[nombreUsuario] [varchar](40) NOT NULL,
	[contraseña] [varchar](40) NOT NULL,
	[rol] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Accidentes]  WITH CHECK ADD  CONSTRAINT [FK__Accidente__IdAut__5AEE82B9] FOREIGN KEY([IdAutobus])
REFERENCES [dbo].[Autobus] ([IdAutobus])
GO
ALTER TABLE [dbo].[Accidentes] CHECK CONSTRAINT [FK__Accidente__IdAut__5AEE82B9]
GO
ALTER TABLE [dbo].[Accidentes]  WITH CHECK ADD FOREIGN KEY([IdTipoAccidente])
REFERENCES [dbo].[TiposAccidentes] ([IdTipoAccidente])
GO
ALTER TABLE [dbo].[Autobus]  WITH CHECK ADD  CONSTRAINT [FK__Autobus__IdTipoM__5EBF139D] FOREIGN KEY([IdTipoModelo])
REFERENCES [dbo].[TipoModelo] ([IdTipoModelo])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Autobus] CHECK CONSTRAINT [FK__Autobus__IdTipoM__5EBF139D]
GO
ALTER TABLE [dbo].[Autobus]  WITH CHECK ADD  CONSTRAINT [FK__Autobus__IdTipoM__619B8048] FOREIGN KEY([IdTipoMarca])
REFERENCES [dbo].[TipoMarca] ([IdTipoMarca])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Autobus] CHECK CONSTRAINT [FK__Autobus__IdTipoM__619B8048]
GO
ALTER TABLE [dbo].[Autobus]  WITH CHECK ADD  CONSTRAINT [FK__Autobus__placa__5535A963] FOREIGN KEY([IdChofer])
REFERENCES [dbo].[Chofer] ([IdChofer])
GO
ALTER TABLE [dbo].[Autobus] CHECK CONSTRAINT [FK__Autobus__placa__5535A963]
GO
ALTER TABLE [dbo].[Empleado]  WITH CHECK ADD  CONSTRAINT [FK__Empleado__IdUsua__5165187F] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuarios] ([IdUsuario])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Empleado] CHECK CONSTRAINT [FK__Empleado__IdUsua__5165187F]
GO
ALTER TABLE [dbo].[Pasajes]  WITH CHECK ADD  CONSTRAINT [FK__Pasajes__IdChofe__4D94879B] FOREIGN KEY([IdChofer])
REFERENCES [dbo].[Chofer] ([IdChofer])
GO
ALTER TABLE [dbo].[Pasajes] CHECK CONSTRAINT [FK__Pasajes__IdChofe__4D94879B]
GO
ALTER TABLE [dbo].[Pasajes]  WITH CHECK ADD FOREIGN KEY([IdCliente])
REFERENCES [dbo].[Clientes] ([IdCliente])
GO
ALTER TABLE [dbo].[Pasajes]  WITH CHECK ADD FOREIGN KEY([IdRuta])
REFERENCES [dbo].[Rutas] ([IdRuta])
GO
ALTER TABLE [dbo].[Pasajes]  WITH CHECK ADD  CONSTRAINT [FK_Pasajes_Boletos] FOREIGN KEY([IdBoleto])
REFERENCES [dbo].[Boletos] ([IdBoleto])
GO
ALTER TABLE [dbo].[Pasajes] CHECK CONSTRAINT [FK_Pasajes_Boletos]
GO
ALTER TABLE [dbo].[Permisos]  WITH CHECK ADD FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuarios] ([IdUsuario])
GO
ALTER TABLE [dbo].[ReportesVentas]  WITH CHECK ADD  CONSTRAINT [FK_ReportesVentas_Boletos] FOREIGN KEY([idBoletos])
REFERENCES [dbo].[Boletos] ([IdBoleto])
GO
ALTER TABLE [dbo].[ReportesVentas] CHECK CONSTRAINT [FK_ReportesVentas_Boletos]
GO
