using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de Encapsular_usuario
/// </summary>
public class Encapsular_usuario
{
	public Encapsular_usuario()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}

    private string idUser;

    public string IdUser
    {
        get { return idUser; }
        set { idUser = value; }
    }

    private string nombre;

    public string Nombre
    {
        get { return nombre; }
        set { nombre = value; }
    }

    private string apellido;

    public string Apellido
    {
        get { return apellido; }
        set { apellido = value; }
    }

    private string documento;

    public string Documento
    {
        get { return documento; }
        set { documento = value; }
    }

    private string telefono;

    public string Telefono
    {
        get { return telefono; }
        set { telefono = value; }
    }

    private string correo;

    public string Correo
    {
        get { return correo; }
        set { correo = value; }
    }

    private string userName;

    public string UserName
    {
        get { return userName; }
        set { userName = value; }
    }

    private string clave;

    public string Clave
    {
        get { return clave; }
        set { clave = value; }
    }

    private string userCambio;

    public string UserCambio
    {
        get { return userCambio; }
        set { userCambio = value; }
    }

}//principal
