using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de Encapsular_autor
/// </summary>
public class Encapsular_autor
{
	public Encapsular_autor()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}

    private string nombre;

    public string Nombre
    {
        get { return nombre; }
        set { nombre = value; }
    }

    private string fechaBirth;

    public string FechaBirth
    {
        get { return fechaBirth; }
        set { fechaBirth = value; }
    }

    private string fechaDeath;

    public string FechaDeath
    {
        get { return fechaDeath; }
        set { fechaDeath = value; }
    }

    private string foto;

    public string Foto
    {
        get { return foto; }
        set { foto = value; }
    }

    private string descripcion;

    public string Descripcion
    {
        get { return descripcion; }
        set { descripcion = value; }
    }

    private string nacionalidad;

    public string Nacionalidad
    {
        get { return nacionalidad; }
        set { nacionalidad = value; }
    }

    private string userCambio;

    public string UserCambio
    {
        get { return userCambio; }
        set { userCambio = value; }
    }


}