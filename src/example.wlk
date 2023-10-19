




object laPorota {
	var gramosStock = 1000
	const precioPorGramo = 5
	
	method vender(gramos, unCliente) {
		unCliente.pagar(precioPorGramo * gramos)
		gramosStock -= gramos
	}
	
	method gramosStock() = gramosStock
}

class Cliente {
	var property medioDePago = new TarjetaCredito()
	method pagar(plata){
		medioDePago.descontar(plata)
	}
}


class TarjetaCredito {
	var deuda = 0
	method descontar(plata){
		deuda += plata
	}
	
	method deuda() = deuda
}

class TarjetaDebito {
	var saldo = 100
	method descontar(plata){
		if (saldo < plata) throw new DomainException(message="No hay saldo")
		saldo -= plata
	}
}