import socios.*

class ViajesALaPlaya {
    const largo = null
    const property idiomas = []

    method dias () = largo /500

    method implicaEsfuerzo() = largo > 1200

    method sirveParaBroncear() = true

    method esInteresante() = idiomas.size() > 1

    method leAtraeA(socio) = self.esInteresante() and (socio.leAtre(self)) and (not socio.actividades().contains(self))
}

class EscurcionALaCiudad{
    const property idiomas = []
    const atracciones = null

    method dias() = atracciones/2

    method implicaEsfuerzo() = atracciones.between(5, 8)

    method sirveParaBroncear() = false

    method esInteresante() = (idiomas.size() > 1) or (atracciones == 5)

    method leAtraeA(socio) = self.esInteresante() and (socio.leAtre(self)) and (socio.actividades().contains(self))
}


class EscurcionALaCiudadTropical inherits EscurcionALaCiudad{

    override method dias() = super() +1

    override method sirveParaBroncear() = true
}


class SalidaDeTrekking {
    const property idiomas = []
    const kmACaminar = null
    const diasDeSol = null

    method dias() = kmACaminar /50

    method implicaEsfuerzo() = kmACaminar > 80

    method sirveParaBroncear() = not (diasDeSol.between(100, 200))

    method esInteresante() = (idiomas.size() > 1) and (diasDeSol > 140)

    method leAtraeA(socio) = self.esInteresante() and (socio.leAtre(self)) and (socio.actividades().contains(self))
}

class ClasesDeGimnasia {
    method idiomas() = ["español"]

    method dias() = 1

    method implicaEsfuerzo() = true

    method esInteresante() = false 

    method leAtraeA(socio) = socio.edad().between(20, 30)
}

class TallerLiterrario {
    const property libros = []

    method idiomas() = libros.map({x=>x.idioma()})

    method dias() = libros.size() + 1 

    method hayLibroExtenso() = libros.any({x=>x.cantDePaginas() > 500}) 

    method todosSonDelMismoAutor() = (0..libros.size()-1).all({x=> libros.get(x).autor() == libros.get(x+1).autor()})

    method implicaEsfuerzo() = self.hayLibroExtenso() or (libros.size() >1 and self.todosSonDelMismoAutor())

    method sirveParaBroncear() = false

    method esInteresante() = true

    method leAtraeA(socio) = socio.idiomas().size() > 1


}

class Libro{
    const property autor = null
    const property idioma = null
    const property cantDePaginas = null  
}