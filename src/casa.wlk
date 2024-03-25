
// dela casa quiero saber : si tiene viveres suficientes , si hay que hacer reparaciones, si está en orden
// que depende de los viveres y de las reparaciones
// Test a pedir: 
//Hacer que se rompa algo de 1000 pesos de la casa, aumentando el monto de reparación. Verificar que la casa:
//> - Tiene víveres suficientes
//> - Hay que hacer reparaciones
//> - No está en orden

object casaDePepeYJulian {
	var viveres = 0
	var reparaciones = 0 //inicio sin reparaciones 
	
	method reparaciones(){
		return reparaciones
	}
	
	method makeReparaciones(){
		return reparaciones > 0 
	}
	
	method romperAlgo(monto){
		reparaciones += monto
	}
	
	method viveresSuficientes(){
		return viveres >= 40
	}
	
	method casaEnOrden(){
		// viveres suficientes
		// no hacer que hacer reparaciones
		
	}
}
