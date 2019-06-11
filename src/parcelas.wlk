class Parcela {
	
	var property ancho = 0
	var property largo = 0
	var property horasDeDia = 0
	var plantasQueTiene = []
	
	method superficie() = ancho * largo
	
	method horasDeSol() = horasDeDia
	
	method cantidadMaxima() = if (ancho > largo) self.superficie() / 5 else self.superficie() + 3 / largo 
	
	method tieneComplicaciones() = plantasQueTiene.any( { plant => plant.horasDeSol() < horasDeDia} )
	
	method plantarPlanta(planta) {
		
		plantasQueTiene.add(planta)
		
		self.verificarCondicionParcela(planta)
	}
	
	method verificarCondicionParcela(unaPlanta) {
		
		if (plantasQueTiene.size() > self.cantidadMaxima()) 
			self.error("Se excedio la cantidad maxima de plantas.")
			
		if(self.superoHorasDeSol(unaPlanta))
			self.error("Se excedio la cantidad de horas de sol.")
	}
	
	method superoHorasDeSol(unaPlanta) = self.horasDeSol() - unaPlanta.horasDeSol() > 2
		
	method tienePlantasMayoresA(unaAltura) = plantasQueTiene.any( { plant => plant.altura() > unaAltura } )
	
	method cantidadDePlantasEnParcela() = plantasQueTiene.size()
	
	method seAsociaBien(planta) = true
	
	method porcentajeDeAsociacion() = self.cantidadDePlantasAsociadasEnParcela() / self.cantidadDePlantasEnParcela()
	
	method cantidadDePlantasAsociadasEnParcela() = plantasQueTiene.filter({ planta => self.seAsociaBien(planta) }).size()
}

class ParcelaEcologica inherits Parcela {
	
	override method seAsociaBien(planta) = not self.tieneComplicaciones() and  planta.esParcelaIdeal(self)
}

class ParcelaIndustrial inherits Parcela {
	
	override method seAsociaBien(planta) = self.cantidadDePlantasEnParcela() < 2 and planta.esFuerte()
}











