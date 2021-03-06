USE [Hotel]
GO
/****** Object:  UserDefinedFunction [dbo].[Determina_Estado]    Script Date: 30/03/2020 0:27:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create function [dbo].[Determina_Estado] (@nohabitacion int, @fechaentrada date, @fechasalida date)
returns varchar(50)
as begin
Declare @estado varchar(50)

if exists (Select * from habitacion_reserva hr where (( @fechaentrada<= hr.fecha_entrada and @fechasalida >=fecha_entrada)
            or ( @fechaentrada<  hr.fecha_salida) and @fechasalida >hr.fecha_salida) 
			 and @nohabitacion = hr.no_habitacion )
			set @estado = 'Reservado'
			else
			set @estado = 'Disponible'
return @estado
end

GO
/****** Object:  Table [dbo].[Cargos_servicios]    Script Date: 30/03/2020 0:27:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cargos_servicios](
	[Id_servicio] [int] NOT NULL,
	[Id_hab_reserva] [int] NOT NULL,
	[precio] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_servicio] ASC,
	[Id_hab_reserva] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 30/03/2020 0:27:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Cliente](
	[Id_cliente] [int] IDENTITY(1,1) NOT NULL,
	[p_nom] [varchar](15) NULL,
	[s_nom] [varchar](15) NULL,
	[p_apell] [varchar](15) NULL,
	[s_apell] [varchar](15) NULL,
	[direccion] [varchar](70) NULL,
	[tel] [varchar](10) NULL,
	[correo] [varchar](25) NULL,
	[estado] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Empleado]    Script Date: 30/03/2020 0:27:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Empleado](
	[Id_empleado] [int] IDENTITY(1,1) NOT NULL,
	[p_nom] [varchar](15) NULL,
	[s_nom] [varchar](15) NULL,
	[p_apell] [varchar](15) NULL,
	[s_apell] [varchar](15) NULL,
	[direccion] [varchar](70) NULL,
	[tel] [varchar](10) NULL,
	[correo] [varchar](25) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_empleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Habitacion]    Script Date: 30/03/2020 0:27:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Habitacion](
	[no_habitacion] [int] NOT NULL,
	[cod_tipo] [int] NULL,
	[descr] [varchar](60) NULL,
	[cap] [int] NOT NULL,
	[stat] [varchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[no_habitacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Habitacion_Reserva]    Script Date: 30/03/2020 0:27:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Habitacion_Reserva](
	[Id_hab_reserva] [int] IDENTITY(1,1) NOT NULL,
	[no_habitacion] [int] NULL,
	[id_reserva] [int] NULL,
	[fecha_entrada] [date] NOT NULL,
	[fecha_salida] [date] NOT NULL,
	[precio] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_hab_reserva] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Huesped]    Script Date: 30/03/2020 0:27:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Huesped](
	[Id_huesped] [int] IDENTITY(1,1) NOT NULL,
	[p_nom] [varchar](15) NULL,
	[s_nom] [varchar](15) NULL,
	[p_apell] [varchar](15) NULL,
	[s_apell] [varchar](15) NULL,
	[direccion] [varchar](70) NULL,
	[tel] [varchar](10) NULL,
	[nacionalidad] [varchar](25) NULL,
	[correo] [varchar](25) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_huesped] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Huesped_hab_reserva]    Script Date: 30/03/2020 0:27:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Huesped_hab_reserva](
	[Id_huesped] [int] NOT NULL,
	[Id_hab_reserva] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_huesped] ASC,
	[Id_hab_reserva] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Reserva]    Script Date: 30/03/2020 0:27:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Reserva](
	[Id_reserva] [int] IDENTITY(1,1) NOT NULL,
	[Id_cliente] [int] NULL,
	[Id_empleado] [int] NULL,
	[fecha_reserva] [date] NOT NULL,
	[forma_pago] [varchar](15) NULL,
	[divisa] [varchar](3) NULL,
	[stat] [varchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_reserva] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Servicio]    Script Date: 30/03/2020 0:27:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Servicio](
	[Id_servicio] [int] IDENTITY(1,1) NOT NULL,
	[descr] [varchar](60) NULL,
	[precio] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_servicio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tipo_habitacion]    Script Date: 30/03/2020 0:27:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tipo_habitacion](
	[cod_tipo] [int] NOT NULL,
	[nom_tipo] [varchar](25) NOT NULL,
	[precio] [money] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[cod_tipo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 30/03/2020 0:27:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Usuario](
	[IdUsuario] [int] IDENTITY(1,1) NOT NULL,
	[login] [varchar](50) NULL,
	[password] [varchar](50) NULL,
	[rol] [varchar](50) NULL,
	[IdEmpleado] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Cargos_servicios]  WITH CHECK ADD FOREIGN KEY([Id_hab_reserva])
REFERENCES [dbo].[Habitacion_Reserva] ([Id_hab_reserva])
GO
ALTER TABLE [dbo].[Cargos_servicios]  WITH CHECK ADD FOREIGN KEY([Id_servicio])
REFERENCES [dbo].[Servicio] ([Id_servicio])
GO
ALTER TABLE [dbo].[Habitacion]  WITH CHECK ADD FOREIGN KEY([cod_tipo])
REFERENCES [dbo].[Tipo_habitacion] ([cod_tipo])
GO
ALTER TABLE [dbo].[Habitacion_Reserva]  WITH CHECK ADD FOREIGN KEY([id_reserva])
REFERENCES [dbo].[Reserva] ([Id_reserva])
GO
ALTER TABLE [dbo].[Habitacion_Reserva]  WITH CHECK ADD FOREIGN KEY([no_habitacion])
REFERENCES [dbo].[Habitacion] ([no_habitacion])
GO
ALTER TABLE [dbo].[Huesped_hab_reserva]  WITH CHECK ADD FOREIGN KEY([Id_hab_reserva])
REFERENCES [dbo].[Habitacion_Reserva] ([Id_hab_reserva])
GO
ALTER TABLE [dbo].[Huesped_hab_reserva]  WITH CHECK ADD FOREIGN KEY([Id_huesped])
REFERENCES [dbo].[Huesped] ([Id_huesped])
GO
ALTER TABLE [dbo].[Reserva]  WITH CHECK ADD FOREIGN KEY([Id_cliente])
REFERENCES [dbo].[Cliente] ([Id_cliente])
GO
ALTER TABLE [dbo].[Reserva]  WITH CHECK ADD FOREIGN KEY([Id_empleado])
REFERENCES [dbo].[Empleado] ([Id_empleado])
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD FOREIGN KEY([IdEmpleado])
REFERENCES [dbo].[Empleado] ([Id_empleado])
GO
ALTER TABLE [dbo].[Cliente]  WITH CHECK ADD  CONSTRAINT [CK_VAL_clie_estado] CHECK  (([estado]='DESHABILITADO' OR [estado]='HABILITADO'))
GO
ALTER TABLE [dbo].[Cliente] CHECK CONSTRAINT [CK_VAL_clie_estado]
GO
ALTER TABLE [dbo].[Habitacion]  WITH CHECK ADD  CONSTRAINT [CK_VAL_hab_stat] CHECK  (([stat]='DISPONIBLE' OR [stat]='RESERVADA' OR [stat]='OCUPADA'))
GO
ALTER TABLE [dbo].[Habitacion] CHECK CONSTRAINT [CK_VAL_hab_stat]
GO
ALTER TABLE [dbo].[Reserva]  WITH CHECK ADD  CONSTRAINT [CK_VAL_res_formapago] CHECK  (([forma_pago]='CHEQUE' OR [forma_pago]='CONTADO' OR [forma_pago]='CREDITO'))
GO
ALTER TABLE [dbo].[Reserva] CHECK CONSTRAINT [CK_VAL_res_formapago]
GO
ALTER TABLE [dbo].[Reserva]  WITH CHECK ADD  CONSTRAINT [CK_VAL_res_stat] CHECK  (([stat]='PENALIZADO' OR [stat]='CANCELADO' OR [stat]='RESERVADO' OR [stat]='PAGADO'))
GO
ALTER TABLE [dbo].[Reserva] CHECK CONSTRAINT [CK_VAL_res_stat]
GO
/****** Object:  StoredProcedure [dbo].[Buscar_Empleado]    Script Date: 30/03/2020 0:27:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[Buscar_Empleado]
	 @dato varchar(20)
	 as
	 Select
 c.Id_empleado as Id_Empleado,
 c.p_nom as [Primer Nombre],
 c.s_nom as [Segundo Nombre],
 c.p_apell as [Primer Apellido],
 c.s_apell as [Segundo Apellido],
 direccion as Dirección,
 correo as Correo,
 tel as Teléfono
 from Empleado c
 where c.p_nom like @dato + '%' 
 or  c.s_nom like @dato + '%' 
 or  c.p_apell like @dato + '%' 
 or c.s_apell like @dato+'%'


GO
/****** Object:  StoredProcedure [dbo].[Buscar_Registro]    Script Date: 30/03/2020 0:27:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Buscar_Registro]
	 @dato varchar(20)
	 as
	 Select
 id_cliente as Id_Cliente,
 c.p_nom as [Primer Nombre],
 c.s_nom as [Segundo Nombre],
 c.p_apell as [Primer Apellido],
 c.s_apell as [Segundo Apellido],
 direccion as Dirección,
 correo as Correo,
 tel as Teléfono,
 c.estado as estado
 from Cliente c
 where c.p_nom like @dato + '%' 
 or  c.s_nom like @dato + '%' 
 or  c.p_apell like @dato + '%' 
 or c.s_apell like @dato+'%'
GO
/****** Object:  StoredProcedure [dbo].[CONSULTAR_LISTA_HR_SERVICIO]    Script Date: 30/03/2020 0:27:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CONSULTAR_LISTA_HR_SERVICIO]
AS
SELECT HR.id_hab_reserva,p_nom+SPACE(1)+C.p_apell,HR.no_habitacion,HR.fecha_entrada,HR.fecha_salida
FROM habitacion_reserva HR
INNER JOIN reserva R
ON R.id_reserva = HR.id_reserva
INNER JOIN cliente C
ON C.id_cliente = R.id_cliente
GROUP BY HR.id_hab_reserva,p_nom+SPACE(1)+C.p_apell,HR.no_habitacion,HR.fecha_entrada,HR.fecha_salida

GO
/****** Object:  StoredProcedure [dbo].[Disponibilidad_Habitacion]    Script Date: 30/03/2020 0:27:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create procedure [dbo].[Disponibilidad_Habitacion]
@idHabitacion int,
@FechaEntrada date,
@FechaSalida date
  as
select 
   h.no_habitacion,descr,cap,stat,
   fecha_entrada,
   fecha_salida,precio
    from habitacion h inner join habitacion_reserva hr on hr.no_habitacion=h.no_habitacion
	where h.no_habitacion=@idHabitacion and fecha_entrada>=@FechaEntrada and fecha_salida<=@FechaSalida

GO
/****** Object:  StoredProcedure [dbo].[Disponibilidad_Habitación]    Script Date: 30/03/2020 0:27:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[Disponibilidad_Habitación] 
@IdHabitación int, @Fechaentrada date, @Fechasalida date
as

Create table #TFecha 
(IdTFecha int primary key identity(1,1),
 Fecha date,
 Estado varchar(60))

  Declare @Contador int, @Fecha date, @Días int
 Set @Contador = 1
 set @Fecha = @Fechaentrada
 Set @Días = datediff(day,@Fechaentrada, @Fechasalida)
 while (@Contador <= (datediff(day,@Fechaentrada, @Fechasalida)+1))
 begin
 insert into #TFecha (Fecha) values (@Fecha)
 set @Fecha = dateadd(day,1, @Fecha )
 Set @Contador = @Contador +1 
 end

 Set @Contador = 1

while(@Contador <= ((Select count(*) from #TFecha)) )
begin
set @Fecha = (Select Fecha from #TFecha where IdTFecha = @Contador)
if not exists(Select * from Habitacion_Reserva hr
              where @Fecha >= hr.fecha_entrada and @Fecha < hr.fecha_salida
			  and hr.no_habitacion = @IdHabitación
			   )
			   begin
	          update #TFecha set Estado = 'Disponible' 
	          where IdTFecha = @Contador
	          end
			  else
			  begin
			  update #TFecha set Estado = 'Reservado' 
	          where IdTFecha = @Contador
			  end

			 
			  if(@Contador = (Select count(*) from #TFecha))
			    begin
			  update #TFecha set Estado = 'Salida' 
	          where IdTFecha = @Contador
			  end
			   Set @Contador = @Contador +1
			  

end

Select * from #TFecha
Drop table #TFecha


GO
/****** Object:  StoredProcedure [dbo].[Editar_Cliente]    Script Date: 30/03/2020 0:27:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[Editar_Cliente]
	 @idcliente int,
	 @primernombre varchar(50),
     @segundonombre varchar(50),
     @primerapellido varchar(50),
     @segundoapellido varchar(50),
	 @direccion varchar(100),
	 @telefono varchar(20),
	 @correo varchar(100),
	 @Estado varchar(50)
	 as
	 update Cliente set 
	 p_nom =  @primernombre,
	 s_nom = @segundonombre,
	 p_apell = @primerapellido,
	 s_apell =  @segundoapellido,
	 direccion = @direccion,
	 tel = @telefono,
	 correo = @correo,
	 estado= @Estado
	 where Id_cliente = @idcliente

GO
/****** Object:  StoredProcedure [dbo].[Editar_Empleado]    Script Date: 30/03/2020 0:27:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[Editar_Empleado]
	 @idempleado int,
	 @primernombre varchar(15),
     @segundonombre varchar(15),
     @primerapellido varchar(15),
     @segundoapellido varchar(15),
	 @direccion varchar(90),
	 @correo varchar(40),
	 @telefono varchar(20)
as
	 update Empleado set 
	 p_nom =  @primernombre,
	 s_nom = @segundonombre,
	 p_apell = @primerapellido,
	 s_apell =  @segundoapellido,
	 direccion = @direccion,
	 correo = @correo,
	 tel = @telefono
	 where Id_empleado = @idempleado

GO
/****** Object:  StoredProcedure [dbo].[Estado_Habitacion]    Script Date: 30/03/2020 0:27:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[Estado_Habitacion] @fechaentrada date, @fechasalida date
as
Select 
   h.no_habitacion,
   th.nom_tipo, 
   dbo.Determina_Estado(h.no_habitacion,@fechaentrada, @fechasalida) as Estado 
   from Habitacion h inner join tipo_habitacion th on th.cod_tipo=h.cod_tipo

GO
/****** Object:  StoredProcedure [dbo].[get_idCliente]    Script Date: 30/03/2020 0:27:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[get_idCliente]
as
select top(1) Id_cliente from cliente order by id_cliente desc

GO
/****** Object:  StoredProcedure [dbo].[get_idReserva]    Script Date: 30/03/2020 0:27:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create procedure [dbo].[get_idReserva]
as
select top(1) id_reserva from reserva order by id_reserva desc

GO
/****** Object:  StoredProcedure [dbo].[habilitado]    Script Date: 30/03/2020 0:27:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[habilitado]
@idCliente int
as
declare @estado varchar(50)
set @estado=(select estado from cliente where id_cliente=@idCliente)
if(@estado='HABILITADO')
  update cliente set estado='DESHABILITADO' where id_cliente=@idCliente
else
   update cliente set estado='HABILITADO' where id_cliente=@idCliente

GO
/****** Object:  StoredProcedure [dbo].[Habilitar]    Script Date: 30/03/2020 0:27:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 Create procedure [dbo].[Habilitar]
 @IdCliente int,
 @Estado varchar(50)
 as
update cliente set estado=@Estado where id_cliente=@IdCliente


GO
/****** Object:  StoredProcedure [dbo].[Insertar_Cliente]    Script Date: 30/03/2020 0:27:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 create procedure [dbo].[Insertar_Cliente]
 @primernombre varchar(15),
 @segundonombre varchar(15),
 @primerapellido varchar(15),
 @segundoapellido varchar(15),
 @direccion varchar(70),
 @telefono varchar(10),
 @correo varchar(25)
	as
 insert into Cliente values (@primernombre,@segundonombre,@primerapellido, @segundoapellido,@direccion, @telefono, @correo,'HABILITADO')

GO
/****** Object:  StoredProcedure [dbo].[INSERTAR_CONSUMO_SERVICIO]    Script Date: 30/03/2020 0:27:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[INSERTAR_CONSUMO_SERVICIO]
@IDHR INT,
@IDS INT,
@PRECIO MONEY
AS
INSERT INTO cargos_servicios VALUES(@IDS,@IDHR,@PRECIO)

select * from cargos_servicios

GO
/****** Object:  StoredProcedure [dbo].[Insertar_Empleado]    Script Date: 30/03/2020 0:27:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 Create procedure [dbo].[Insertar_Empleado]
 @primernombre varchar(15),
 @segundonombre varchar(15),
 @primerapellido varchar(15),
 @segundoapellido varchar(15),
 @direccion varchar(90),
 @correo varchar(40),
 @telefono varchar(20)
	as
 insert into empleado values (@primernombre,@segundonombre,@primerapellido, @segundoapellido,@direccion,@correo,@telefono)
 Select * from empleado


GO
/****** Object:  StoredProcedure [dbo].[Insertar_habitaciónReserva]    Script Date: 30/03/2020 0:27:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Insertar_habitaciónReserva]
@no_habitación int,
@id_reserva int,
@fecha_entrada date,
@fecha_salida date
 as
declare @precio money= (select precio 
                    from tipo_habitacion th 
					inner join habitacion h on th.cod_tipo=h.cod_tipo
					where h.no_habitacion=@no_habitación)
Insert into habitacion_reserva values (@no_habitación,@id_reserva,@fecha_entrada,@fecha_entrada,@precio)
-----------------------------
select top(1) Id_hab_reserva 
from habitacion_reserva hr 
order by Id_hab_reserva desc

GO
/****** Object:  StoredProcedure [dbo].[Insertar_Huesped]    Script Date: 30/03/2020 0:27:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Insertar_Huesped]
@PrimerNombre varchar(50),
@SegundoNombre varchar(50),
@PrimerApellido varchar(50),
@SegundoApellido varchar(50),
@Dirección varchar(100),
@telefono varchar(20),
@Nacionalidad varchar(50),
@Correo varchar(100),
@Idhabitacion_reserva int
  as
Insert into huesped values (@PrimerNombre,@SegundoNombre,@PrimerApellido,@SegundoApellido,@Dirección,@telefono,@Nacionalidad,@Correo)

declare @idHuesped int = (select top(1) id_huesped from huesped order by id_huesped desc)

Insert into huesped_hab_reserva values(@idHuesped,@Idhabitacion_reserva)

GO
/****** Object:  StoredProcedure [dbo].[Insertar_Reserva]    Script Date: 30/03/2020 0:27:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[Insertar_Reserva]
  @id_cliente int,
  @id_empleado int,
  @forma_pago varchar(15),
  @divisa varchar(8),
  @estado varchar(15)
   as
insert into reserva values (@id_cliente,@id_empleado,GETDATE(),@forma_pago,@divisa,@estado)


GO
/****** Object:  StoredProcedure [dbo].[LISTAR_SERVICIOS]    Script Date: 30/03/2020 0:27:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[LISTAR_SERVICIOS]
AS
SELECT s.id_servicio FROM servicio s
GO
/****** Object:  StoredProcedure [dbo].[ListaServicio]    Script Date: 30/03/2020 0:27:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[ListaServicio]
as
select descr from servicio

GO
/****** Object:  StoredProcedure [dbo].[Mostrar_Clientes]    Script Date: 30/03/2020 0:27:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[Mostrar_Clientes]
as
Select
 c.Id_cliente as Id_Cliente,
 c.p_nom as [Primer Nombre],
 c.s_nom as [Segundo Nombre],
 c.p_apell as [Primer Apellido],
 c.s_apell as [Segundo Apellido],
 direccion as Dirección,
 correo as Correo,
 tel as Teléfono,
 estado as Estado
 from Cliente c


GO
/****** Object:  StoredProcedure [dbo].[Mostrar_Empleado]    Script Date: 30/03/2020 0:27:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


Create procedure [dbo].[Mostrar_Empleado]
as
select * from empleado


GO
/****** Object:  StoredProcedure [dbo].[Mostrar_Habitación]    Script Date: 30/03/2020 0:27:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


Create procedure [dbo].[Mostrar_Habitación]
@IdTipoHabitación int
   as
select 
  h.no_habitacion,
  th.cod_tipo,
  h.descr,h.cap,h.stat,th.nom_tipo,
  th.precio 
  from habitacion h
  inner join tipo_habitacion th on th.cod_tipo=h.cod_tipo
  where th.cod_tipo=@IdTipoHabitación


GO
/****** Object:  StoredProcedure [dbo].[Mostrar_Habitaciones]    Script Date: 30/03/2020 0:27:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

  Create procedure [dbo].[Mostrar_Habitaciones]
as
select 
  h.no_habitacion,
  th.cod_tipo,
  h.descr,h.cap,h.stat,th.nom_tipo,
  th.precio 
  from habitacion h
  inner join tipo_habitacion th on th.cod_tipo=h.cod_tipo


GO
/****** Object:  StoredProcedure [dbo].[Mostrar_Huesped_Reservado]    Script Date: 30/03/2020 0:27:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Mostrar_Huesped_Reservado]
@IdReserva int
  as
SELECT        
	(dbo.Huesped.p_nom + ' ' +
	 dbo.Huesped.s_nom + ' ' +
	 dbo.Huesped.p_apell + ' '+
	 dbo.Huesped.s_apell) as Nombre
FROM dbo.Habitacion_Reserva INNER JOIN
     dbo.Huesped_hab_reserva ON dbo.Habitacion_Reserva.Id_hab_reserva = dbo.Huesped_hab_reserva.Id_hab_reserva INNER JOIN
     dbo.Huesped ON dbo.Huesped_hab_reserva.Id_huesped = dbo.Huesped.Id_huesped INNER JOIN
     dbo.Reserva ON dbo.Habitacion_Reserva.id_reserva = dbo.Reserva.Id_reserva
WHERE (dbo.Reserva.Id_reserva = @IdReserva)
GO
/****** Object:  StoredProcedure [dbo].[Mostrar_Huespedes]    Script Date: 30/03/2020 0:27:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

  Create procedure [dbo].[Mostrar_Huespedes]
  as
select * from huesped


GO
/****** Object:  StoredProcedure [dbo].[mostrar_idHabitacion]    Script Date: 30/03/2020 0:27:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[mostrar_idHabitacion]
as
select no_habitacion from habitacion

GO
/****** Object:  StoredProcedure [dbo].[MostrarClientesReservas]    Script Date: 30/03/2020 0:27:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[MostrarClientesReservas]
as
select 
	Id_cliente, 
	(p_nom + ' ' + s_nom + ' ' + p_apell+ ' ' + s_apell) as NombreCompleto,
	estado from Cliente

GO
/****** Object:  StoredProcedure [dbo].[MostrarReservasCliente]    Script Date: 30/03/2020 0:27:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[MostrarReservasCliente]
@IdCliente int
as
select 
	r.id_reserva,
	r.fecha_reserva,
	r.forma_pago,
	r.divisa,
	r.stat 
	from Reserva r
	inner join Cliente c on c.Id_cliente = r.Id_cliente
	where c.Id_cliente = @IdCliente
GO
/****** Object:  StoredProcedure [dbo].[Rol_Usuario]    Script Date: 30/03/2020 0:27:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Rol_Usuario]
@login varchar(50),
@password varchar(100)
   as
if exists(select login,password from Usuario where password=@password and login=@login)
   begin 
	 select rol from Usuario where password=@password and login=@login
   end
else
   begin
   select 'Usuario no existe' as rol
   end

GO
/****** Object:  StoredProcedure [dbo].[Validar_Acceso]    Script Date: 30/03/2020 0:27:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Validar_Acceso]
@login nvarchar(50),
@password nvarchar(100)
   as
select IdEmpleado from Usuario where password =@password and login=@login
GO
