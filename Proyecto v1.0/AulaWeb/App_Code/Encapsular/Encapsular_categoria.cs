using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de Encapsular_categoria
/// </summary>
public class Encapsular_categoria
{
	public Encapsular_categoria()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}

    private string idCategoria;

    public string IdCategoria
    {
        get { return idCategoria; }
        set { idCategoria = value; }
    }

    private string categoria;

    public string Categoria
    {
        get { return categoria; }
        set { categoria = value; }
    }

    private string precio;

    public string Precio
    {
        get { return precio; }
        set { precio = value; }
    }

    private string userCambio;

    public string UserCambio
    {
        get { return userCambio; }
        set { userCambio = value; }
    }
}