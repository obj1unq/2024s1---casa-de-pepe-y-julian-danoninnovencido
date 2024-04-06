object casaDePepeYJulian {
	// Creo variables con setter y getter siendo que despues en los casos de testing me pide
	// iniciar con un porcentaje != 0 y para eso necesito settear el nuevo indice de viveres.
	var property viveres = 0
	var property reparaciones = 0 //inicio sin reparaciones 
	
	
	method hacerReparaciones(){return reparaciones > 0}
	
	method romperAlgo(monto){reparaciones += monto}
	
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
	const porcentajeMinInd = 40	//???
	var porcentajeAComprar = porcentajeMinInd - casaDePepeYJulian.viveres()	
	// si tengo 20 de viveres, la var = 40 (porcentajeMinInd)- 20 (los viveres que tengo) = 20
	// 20 ahora es el porcentaje a comprar. Si la calidad = 4 ==> 20 * 4 = 80$ 
	
	method porcentajeAComprar(){return porcentajeAComprar}
	
	method comprarViveres(){
		//Comprar lo necesario para llegar al 40% viveres
			//Necesito sumar el porcentaje restante a los viveres de la casa
			if (casaDePepeYJulian.viveresSuficientes())
			return casaDePepeYJulian.viveres() + porcentajeAComprar
			}
		
	method gastosDeViveres(calidad){return porcentajeAComprar * calidad} // da el gasto en pesos .
}

object full{}




	
















