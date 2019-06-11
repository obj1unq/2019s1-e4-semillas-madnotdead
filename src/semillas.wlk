class Planta {
	
	var property anioDeObtencion
	var property altura
	
	method horasDeSol() = 0
	
	method esFuerte() = self.horasDeSol() > 10
	
	method daNuevasSemillas() = false
	
	method espacioQueOcupa() = 0
	
	method esParcelaIdeal(unaParcela) = true
}

class Menta inherits Planta {
	
	const alturaMinima = 0.4
	
	override method horasDeSol() = 6
	
	override method daNuevasSemillas() = altura > alturaMinima
	
	override method espacioQueOcupa() = altura * 3
	
	override method esParcelaIdeal(unaParcela)  = unaParcela.superficie() > 6
}

class Soja inherits Planta {
	
	override method horasDeSol() = if (altura < 0.5) 6 else if (altura >= 0.5 and altura < 1.0) 7 else 9
	
	override method daNuevasSemillas() = anioDeObtencion >= 2007 and altura > 1.0
	
	override method espacioQueOcupa() = altura / 2
	
	override method esParcelaIdeal(unaParcela)  = unaParcela.horasDeSol() == self.horasDeSol()
}

class Quinoa inherits Planta {
	
	var property horasDeSol = 0
	
	override method horasDeSol() = horasDeSol
	
	override method espacioQueOcupa() = 0.5
	
	override method daNuevasSemillas() = (anioDeObtencion < 2005) or (self.horasDeSol() == 12 and anioDeObtencion == 2010) or (self.horasDeSol() == 9 and anioDeObtencion == 2001)
	
	override method esParcelaIdeal(unaParcela)  = not unaParcela.tienePlantasMayoresA(1.5)
}

class SojaTrangenica inherits Soja {
	
	override method daNuevasSemillas() = false
	
	override method esParcelaIdeal(unaParcela)  = unaParcela.cantidadMaxima() == 1
}

class HierbaBuena inherits Menta {
	
	override method espacioQueOcupa() = super() * 2
}
















