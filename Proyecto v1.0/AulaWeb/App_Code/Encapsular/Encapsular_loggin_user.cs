using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de Encapsular_loggin_user
/// </summary>
public class Encapsular_loggin_user
{
	public Encapsular_loggin_user()
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

    private string user;

    public string User
    {
        get { return user; }
        set { user = value; }
    }

    private string clave;

    public string Clave
    {
        get { return clave; }
        set { clave = value; }
    }

    private string ip;

    public string Ip
    {
        get { return ip; }
        set { ip = value; }
    }

    private string mac;

    public string Mac
    {
        get { return mac; }
        set { mac = value; }
    }

    private string userCambio;

    public string UserCambio
    {
        get { return userCambio; }
        set { userCambio = value; }
    }

}//principal