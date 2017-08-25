using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de Encapsular_comentario
/// </summary>
public class Encapsular_comentario
{
	public Encapsular_comentario()
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

    private string idArchivo;

    public string IdArchivo
    {
        get { return idArchivo; }
        set { idArchivo = value; }
    }

    private string comentario;

    public string Comentario
    {
        get { return comentario; }
        set { comentario = value; }
    }

    private string userCambio;

    public string UserCambio
    {
        get { return userCambio; }
        set { userCambio = value; }
    }

}//principal