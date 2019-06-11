class Parcela {
	
	var property ancho = 0
	var property largo = 0
	var horasDeDia = 0
	var plantasQueTiene = []
	
	method superficie() = ancho * largo
	
	method horasDeSol() = horasDeDia
	
	method cantidadMaxima() = if (ancho > largo) self.superficie() / 5 else self.superficie() + 3 / largo 
	
	method tieneComplicaciones() = plantasQueTiene.any( { plant => plant.horasDeSol() < horasDeDia} )
	
	method plantarPlanta(planta) {
		
		plantasQueTiene.add(planta)
		
		self.verificarCondicionParcela()
	}
	
	method verificarCondicionParcela() {
		
		if (plantasQueTiene.size() > self.cantidadMaxima()) 
			self.error("Se excedio la cantidad maxima de plantas.")
			
		if(self.superoHorasDeSol())
			self.error("Se excedio la cantidad de horas de sol.")
	}
	
	method superoHorasDeSol() = self.cantidadHorasDiaDePlantas() - self.horasDeSol() > 2
	
	method cantidadHorasDiaDePlantas() = plantasQueTiene.sum( {planta => planta.horasDeSol()})
}
