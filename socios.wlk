import actividades.*

class Socios {
    const property actividades = []
    const maxDeActividades = null
    const property idiomas = []
    const property  edad = null

    method realizarActividad(unaActividad) 
    {if (actividades.size() < maxDeActividades) 
       actividades.add(unaActividad) 
    else 
       throw Exception "alcanzo el maximo de actividades" }

    method esAdoradorDelSol() = actividades.all({x=>x.sirveParaBroncear()})

    method actividasDeEsfuerzo() = actividades.filter({x=>x.implicaEsfuerzo()})


}

class SociosTranquilos inherits Socios {
    method leAtre(actividad) = actividad.dias() >= 4
}

class SociosCoherentes inherits Socios{
    method leAtre(actividad) = if (self.esAdoradorDelSol()) actividad.sirveParaBroncear() else actividad.implicaEsfuerzo()
}

class SocioRelajado inherits Socios{
    method leAtre(actividad) = idiomas.any({x=> actividad.idiomas().contains(x)})
}