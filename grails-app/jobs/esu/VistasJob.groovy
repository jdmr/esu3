package esu

class VistasJob {
    static triggers = {
        cron name: 'ejecutaVistas', cronExpression: "0 0 2 * * ?"
//        simple name:'simpleTrigger', startDelay:10000, repeatInterval: 10000, repeatCount: 5
    }

    def execute() {
        // execute job
        println("Procesando vistas")
        Date fecha = new Date()
        def articulos = Articulo.executeQuery("select new map(a.id as id, a.vistas as vistas) from Articulo a")
        for(articulo in articulos) {
            Articulo a = Articulo.load(articulo.id)
            new Vistas(fecha: fecha, cantidad: articulo.vistas, articulo: a).save()
        }
        println("Proceso de vistas terminado.")
    }
}
