using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de Encapsular_tag
/// </summary>
public class Encapsular_tag
{
	public Encapsular_tag()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}

    private string idTag;

    public string IdTag
    {
        get { return idTag; }
        set { idTag = value; }
    }

    private string tag;

    public string Tag
    {
        get { return tag; }
        set { tag = value; }
    }

    private string userCambio;

    public string UserCambio
    {
        get { return userCambio; }
        set { userCambio = value; }
    }

}//principal