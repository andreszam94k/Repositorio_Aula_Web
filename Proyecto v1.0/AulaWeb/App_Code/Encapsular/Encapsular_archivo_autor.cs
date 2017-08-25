using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de Encapsular_archivo_autor
/// </summary>
public class Encapsular_archivo_autor
{
	public Encapsular_archivo_autor()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}

    private string idArcAut;

    public string IdArcAut
    {
        get { return idArcAut; }
        set { idArcAut = value; }
    }

    private string nombreAutor;

    public string NombreAutor
    {
        get { return nombreAutor; }
        set { nombreAutor = value; }
    }

    private string userCambio;

    public string UserCambio
    {
        get { return userCambio; }
        set { userCambio = value; }
    }

}//principal