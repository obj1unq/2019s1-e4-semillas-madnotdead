object inta {
	
	var parcelas = []
	
	method agregarParcela(unaParcela) {
		parcelas.add(unaParcela)
	}
	
	method cantidadDePlantasTotalesEnParcelas() = parcelas.sum({ parcela => parcela.cantidadDePlantasEnParcela()})
	
	method promedioDePlantas() = self.cantidadDePlantasTotalesEnParcelas().div(parcelas.size())
	
	method parcelaMasSustentable() = parcelas
										.filter({parcela => parcela.cantidadDePlantasEnParcela() >= 4})
										.max({ parcela => parcela.porcentajeDeAsociacion()})
}
