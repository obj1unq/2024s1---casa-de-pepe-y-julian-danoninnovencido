object casaDePepeYJulian {
	// Creo variables con setter y getter siendo que despues en los casos de testing me pide
	// iniciar con un porcentaje != 0 y para eso necesito settear el nuevo indice de viveres.
	var property viveres = 0
	var property reparaciones = 0 //inicio sin reparaciones 
	var estrategiaDeAhorro = minimoIndispensable 
	var property cuenta = cuentaGastos
	
	
	method hacerReparaciones(){return reparaciones > 0}
	
	method romperAlgo(monto){reparaciones += cuenta.extraccion(monto)}
	
	method viveresSuficientes(){return viveres >= 40}
	
	method casaEnOrden(){return (self.viveresSuficientes() and not self.hacerReparaciones())}
}

// ---- Cuentas bancarias

object cuentaCorr{
	var saldo = 0
	
	method saldo(){return saldo}
	
	method deposito(monto){saldo += monto}
	
	method extraccion(monto){saldo -= monto}	
}

object cuentaGastos{
	
	var saldo = 0
	var costoDeOperacion = 0
	
	method saldo(){return saldo}
	
	method costoDeOperacion(_costoDeOperacion){costoDeOperacion = _costoDeOperacion}
	
	method deposito(monto){saldo += monto - costoDeOperacion}
	
	method extraccion(monto){saldo -= monto}	
}

object cuentaComb{
	
	method saldoTotal(){return cuentaGastos.saldo() + cuentaCorr.saldo()}

	method deposito(monto){cuentaGastos.deposito(monto)}
	
	method extraccion(monto){
   			if (cuentaGastos.saldo() > monto) 
   				cuentaGastos.extraccion(monto)
   			else cuentaCorr.extraccion(monto)
	}
}

// ---- Mantenimiento de la casa

object minimoIndispensable{
	// si tengo 20 de viveres, la var = 40 (porcentajeMinInd)- 20 (los viveres que tengo) = 20
	// 20 ahora es el porcentaje a comprar. Si la calidad = 4 ==> 20 * 4 = 80$ 
	
	method porcentajeAComprar(){return 40 - casaDePepeYJulian.viveres()}

	method restockDeViveres(){casaDePepeYJulian.viveres(self.comprarViveres())}
	
	method comprarViveres(){
		if (not casaDePepeYJulian.viveresSuficientes()) 
			return self.porcentajeAComprar() + casaDePepeYJulian.viveres()
		else return null
	}
		
	method gastosDeViveres(calidad){return self.porcentajeAComprar() * calidad} // da el gasto en pesos .
}

object full{
	
	method restockDeViveres(){
		if (casaDePepeYJulian.casaEnOrden())
			return casaDePepeYJulian.viveres(100)
		else
			return self.aumentoDel40EnViveres()
	}
	
	method aumentoDel40EnViveres(){return casaDePepeYJulian.viveres(100) + 40}
	
	method restoParaReparaciones(cuentaBancaria){
		if (cuentaBancaria.saldo() > 1000)	//hay saldo y hay mas de 1000
			return casaDePepeYJulian.hacerReparaciones()
		else
			return null
	}
	
	//method gastosDeViveres(){return self.porcentajeAComprar() * 5}
}




	
















